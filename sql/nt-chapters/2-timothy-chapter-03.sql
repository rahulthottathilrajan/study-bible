-- ═══════════════════════════════════════════════════
-- 2 TIMOTHY CHAPTER 3 — Perilous Times & the Sufficiency of Scripture
-- 17 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Second Timothy 3 presents one of Scripture''s starkest portraits of moral decay in the last days, followed by one of its highest declarations of Scripture''s authority and sufficiency. Paul catalogues eighteen characteristics of humanity in the last days (vv.1-5) — a descent from self-love to treachery — and warns that these traits will infiltrate the church itself, preying especially on vulnerable people (vv.6-9). Against this darkness, Paul sets his own example of suffering and endurance (vv.10-13) and then delivers the chapter''s climactic argument: Timothy must continue in the Scriptures, which he has known from childhood, because ''all scripture is given by inspiration of God'' (theopneustos — God-breathed) and is profitable for doctrine, reproof, correction, and instruction in righteousness, furnishing the man of God completely for every good work (vv.14-17). The antidote to deception is not human ingenuity but the God-breathed word.',
  'The Last Days & the God-Breathed Word',
  'θεόπνευστος (theopneustos)',
  'God-breathed, inspired by God — from theos (God) + pneō (to breathe). Scripture originates from God''s own breath; it is His exhaled word. Not merely ''inspiring'' but divinely originated.',
  '["Perilous Times (vv.1-5): Eighteen marks of the last days — lovers of self to deniers of godliness; having a form of godliness but denying its power","Deceivers in the Church (vv.6-9): Creep into houses; lead captive silly women; Jannes and Jambres opposed Moses; their folly manifest","Paul''s Example (vv.10-12): Timothy has followed Paul''s doctrine, manner of life, persecutions, afflictions; all that will live godly shall suffer","Evil Men Wax Worse (v.13): Deceiving and being deceived","Continue in the Scriptures (vv.14-17): Thou hast known the holy scriptures from a child; all scripture is God-breathed; profitable for doctrine, reproof, correction, instruction; the man of God complete"]'
FROM books b WHERE b.name = '2 Timothy';

-- Step 2: Insert all 17 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'This know also, that in the last days perilous times shall come.',
   'Τοῦτο δὲ γίνωσκε ὅτι ἐν ἐσχάταις ἡμέραις ἐνστήσονται καιροὶ χαλεποί',
   'Touto de ginōske hoti en eschatais hēmerais enstēsontai kairoi chalepoi',
   '''Know'' (ginōske — recognise, understand; present imperative: keep this constantly in mind). ''Last days'' (eschatais hēmerais) — the entire era between Christ''s first and second comings (Acts 2:17; Heb 1:2). ''Perilous'' (chalepoi — dangerous, fierce, savage; the only other NT use is Matt 8:28, describing the Gadarene demoniacs as ''exceeding fierce''). ''Times'' (kairoi — seasons, epochs). The danger is not merely political or military but moral and spiritual.',
   NULL),
  (2,
   'For men shall be lovers of their own selves, covetous, boasters, proud, blasphemers, disobedient to parents, unthankful, unholy,',
   'ἔσονται γὰρ οἱ ἄνθρωποι φίλαυτοι φιλάργυροι ἀλαζόνες ὑπερήφανοι βλάσφημοι γονεῦσιν ἀπειθεῖς ἀχάριστοι ἀνόσιοι',
   'esontai gar hoi anthrōpoi philautoi philargyroi alazones hyperēphanoi blasphēmoi goneusin apeitheis acharistoi anosioi',
   'The first eight of eighteen vices. Note the descent begins with self-love (philautoi — loving self) and love of money (philargyroi — loving silver). Self-love is the root; everything else is fruit. (1) ''Lovers of their own selves'' (philautoi), (2) ''covetous'' (philargyroi — lovers of money), (3) ''boasters'' (alazones — braggarts, empty pretenders), (4) ''proud'' (hyperēphanoi — arrogant, looking down on others), (5) ''blasphemers'' (blasphēmoi — abusive speakers), (6) ''disobedient to parents'' (goneusin apeitheis), (7) ''unthankful'' (acharistoi), (8) ''unholy'' (anosioi — lacking reverence for what is sacred).',
   NULL),
  (3,
   'Without natural affection, trucebreakers, false accusers, incontinent, fierce, despisers of those that are good,',
   'ἄστοργοι ἄσπονδοι διάβολοι ἀκρατεῖς ἀνήμεροι ἀφιλάγαθοι',
   'astorgoi aspondoi diaboloi akrateis anēmeroi aphilagathoi',
   'Six more vices: (9) ''Without natural affection'' (astorgoi — lacking family love, the instinctive affection between parents and children), (10) ''trucebreakers'' (aspondoi — irreconcilable, refusing to make peace), (11) ''false accusers'' (diaboloi — slanderers; the very word used for the devil, the supreme slanderer), (12) ''incontinent'' (akrateis — without self-control), (13) ''fierce'' (anēmeroi — savage, untamed), (14) ''despisers of those that are good'' (aphilagathoi — hostile to goodness itself). The list moves from broken relationships to broken character to active hostility toward virtue.',
   NULL),
  (4,
   'Traitors, heady, highminded, lovers of pleasures more than lovers of God;',
   'προδόται προπετεῖς τετυφωμένοι φιλήδονοι μᾶλλον ἢ φιλόθεοι',
   'prodotai propeteis tetyphōmenoi philēdonoi mallon ē philotheoi',
   'The final four: (15) ''traitors'' (prodotai — betrayers; Judas is called prodotēs in Luke 6:16), (16) ''heady'' (propeteis — reckless, headlong, falling forward without thought), (17) ''highminded'' (tetyphōmenoi — swollen with conceit, blinded by arrogance; from typhoō, to wrap in smoke — they cannot see clearly), (18) ''lovers of pleasures more than lovers of God'' (philēdonoi mallon ē philotheoi). The list ends where it began: with misdirected love. They love self (v.2), money (v.2), pleasure (v.4) — everything except God.',
   NULL),
  (5,
   'Having a form of godliness, but denying the power thereof: from such turn away.',
   'ἔχοντες μόρφωσιν εὐσεβείας τὴν δὲ δύναμιν αὐτῆς ἠρνημένοι καὶ τούτους ἀποτρέπου',
   'echontes morphōsin eusebeias tēn de dynamin autēs ērnēmenoi kai toutous apotrepou',
   '''Form'' (morphōsin — outward shape, external appearance, semblance; not morphē [essential form] but morphōsis [mere outline, shell]). ''Godliness'' (eusebeias — piety, religious devotion). ''Denying the power'' (tēn dynamin ērnēmenoi — having repudiated, renounced the transformative power). These people maintain religious appearances while rejecting the supernatural power that produces genuine holiness. ''Turn away'' (apotrepou — present middle imperative: keep turning away, avoid). This is not future-only prediction — Paul commands Timothy to avoid such people now.',
   'The danger of nominal religion: External religious form without internal spiritual power is the most deceptive condition. It looks like Christianity, sounds like Christianity, and meets in the same buildings — but it has emptied godliness of its transforming energy. Paul treats this as more dangerous than outright paganism because it inoculates people against real faith.'),
  (6,
   'For of this sort are they which creep into houses, and lead captive silly women laden with sins, led away with divers lusts,',
   'ἐκ τούτων γάρ εἰσιν οἱ ἐνδύνοντες εἰς τὰς οἰκίας καὶ αἰχμαλωτίζοντες γυναικάρια σεσωρευμένα ἁμαρτίαις ἀγόμενα ἐπιθυμίαις ποικίλαις',
   'ek toutōn gar eisin hoi endynontes eis tas oikias kai aichmalōtizontes gynaikaria sesōreumena hamartiais agomena epithymiais poikilais',
   '''Creep into'' (endynontes — worm their way in, infiltrate; stealthy, not open). ''Lead captive'' (aichmalōtizontes — take prisoner, enslave). ''Silly women'' (gynaikaria — a diminutive of gynē, expressing contempt for the vulnerable status of these women, not women in general; literally ''little women'' or ''weak-willed women''). ''Laden with sins'' (sesōreumena hamartiais — heaped up, piled high with sins). False teachers exploit the guilty and vulnerable — those whose unresolved guilt makes them susceptible to any teacher who offers relief.',
   NULL),
  (7,
   'Ever learning, and never able to come to the knowledge of the truth.',
   'πάντοτε μανθάνοντα καὶ μηδέποτε εἰς ἐπίγνωσιν ἀληθείας ἐλθεῖν δυνάμενα',
   'pantote manthanonta kai mēdepote eis epignōsin alētheias elthein dynamena',
   '''Ever learning'' (pantote manthanonta — always studying, perpetually accumulating information). ''Never able to come to the knowledge of the truth'' (mēdepote eis epignōsin alētheias elthein dynamena — never arriving at full, experiential knowledge of truth). This is the tragedy of false religious education: constant intake without transformation, intellectual activity without spiritual arrival. Knowledge (epignōsis) in Paul''s usage is not merely facts but personal, transformative encounter with truth.',
   NULL),
  (8,
   'Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith.',
   'ὃν τρόπον δὲ Ἰαννῆς καὶ Ἰαμβρῆς ἀντέστησαν Μωϋσεῖ οὕτως καὶ οὗτοι ἀνθίστανται τῇ ἀληθείᾳ ἄνθρωποι κατεφθαρμένοι τὸν νοῦν ἀδόκιμοι περὶ τὴν πίστιν',
   'hon tropon de Iannēs kai Iambrēs antestēsan Mōysei houtōs kai houtoi anthistantai tē alētheia anthrōpoi katephtharmenoi ton noun adokimoi peri tēn pistin',
   'Jannes and Jambres — names not found in the OT but preserved in Jewish tradition as the Egyptian magicians who opposed Moses (Exod 7:11-12). They could mimic some miracles but could not match God''s power. ''Corrupt minds'' (katephtharmenoi ton noun — minds that have been thoroughly ruined, destroyed; perfect passive: their thinking is permanently corrupted). ''Reprobate'' (adokimoi — disqualified, failing the test, counterfeit) — the opposite of ''approved'' (dokimos) in 2:15. What the approved workman is, these are not.',
   NULL),
  (9,
   'But they shall proceed no further: for their folly shall be manifest unto all men, as theirs also was.',
   'ἀλλ᾽ οὐ προκόψουσιν ἐπὶ πλεῖον ἡ γὰρ ἄνοια αὐτῶν ἔκδηλος ἔσται πᾶσιν ὡς καὶ ἡ ἐκείνων ἐγένετο',
   'all'' ou prokopsousin epi pleion hē gar anoia autōn ekdēlos estai pasin hōs kai hē ekeinōn egeneto',
   '''Shall proceed no further'' (ou prokopsousin epi pleion — will not advance further). ''Folly'' (anoia — senselessness, mindlessness; from a [not] + nous [mind]). ''Manifest'' (ekdēlos — plainly visible, obvious to all). Just as Jannes and Jambres were eventually exposed when their imitations failed (the plagues they could not replicate), so false teachers will ultimately be unmasked. Error has a shelf life; truth endures. This is not a guarantee that no damage will be done (v.6 shows damage is real) but that final exposure is certain.',
   NULL),
  (10,
   'But thou hast fully known my doctrine, manner of life, purpose, faith, longsuffering, charity, patience,',
   'σὺ δὲ παρηκολούθησάς μου τῇ διδασκαλίᾳ τῇ ἀγωγῇ τῇ προθέσει τῇ πίστει τῇ μακροθυμίᾳ τῇ ἀγάπῃ τῇ ὑπομονῇ',
   'sy de parēkolouthēsas mou tē didaskalia tē agōgē tē prothesei tē pistei tē makrothymia tē agapē tē hypomonē',
   '''But thou'' (sy de — emphatic contrast with the false teachers). ''Fully known'' (parēkolouthēsas — followed closely, traced carefully, investigated accurately; the word Luke uses for his Gospel research, Luke 1:3). Timothy did not merely hear Paul''s teaching but examined his entire life. Seven areas listed: (1) ''doctrine'' (didaskalia — teaching content), (2) ''manner of life'' (agōgē — conduct, lifestyle), (3) ''purpose'' (prothesei — deliberate intention), (4) ''faith'' (pistei), (5) ''longsuffering'' (makrothymia — patience with people), (6) ''charity'' (agapē — love), (7) ''patience'' (hypomonē — endurance under pressure). Doctrine and life must match.',
   NULL),
  (11,
   'Persecutions, afflictions, which came unto me at Antioch, at Iconium, at Lystra; what persecutions I endured: but out of them all the Lord delivered me.',
   'τοῖς διωγμοῖς τοῖς παθήμασιν οἷά μοι ἐγένετο ἐν Ἀντιοχείᾳ ἐν Ἰκονίῳ ἐν Λύστροις οἵους διωγμοὺς ὑπήνεγκα καὶ ἐκ πάντων με ἐρρύσατο ὁ κύριος',
   'tois diōgmois tois pathēmasin hoia moi egeneto en Antiocheia en Ikoniō en Lystrois hoious diōgmous hypēnegka kai ek pantōn me errysato ho kyrios',
   'Three cities from Paul''s first missionary journey — Antioch of Pisidia (expelled, Acts 13:50), Iconium (threatened with stoning, Acts 14:5), Lystra (actually stoned and left for dead, Acts 14:19). Paul specifically cites these because Timothy was from Lystra (Acts 16:1) and would have known of these events firsthand or from local memory. ''Out of them all the Lord delivered me'' (ek pantōn me errysato ho kyrios) — not escape from suffering but deliverance through it. The Lord does not promise absence of persecution but presence in it.',
   NULL),
  (12,
   'Yea, and all that will live godly in Christ Jesus shall suffer persecution.',
   'καὶ πάντες δὲ οἱ θέλοντες εὐσεβῶς ζῆν ἐν Χριστῷ Ἰησοῦ διωχθήσονται',
   'kai pantes de hoi thelontes eusebōs zēn en Christō Iēsou diōchthēsontai',
   '''All'' (pantes — without exception). ''That will live godly'' (hoi thelontes eusebōs zēn — those determined to live in a God-honouring way). ''Shall suffer persecution'' (diōchthēsontai — will be persecuted; future passive: it will certainly happen). This is a universal promise, not an exception. The qualification is not spiritual prominence but simple godly living ''in Christ Jesus.'' Persecution is normal Christianity; its absence should provoke self-examination more than its presence.',
   'The certainty of persecution: This verse makes persecution normative for all genuine believers, not exceptional. The logic runs: the world hated Christ (John 15:18-20); those who live in Christ will be hated too. Freedom from persecution may indicate accommodation to the world rather than spiritual maturity.'),
  (13,
   'But evil men and seducers shall wax worse and worse, deceiving, and being deceived.',
   'πονηροὶ δὲ ἄνθρωποι καὶ γόητες προκόψουσιν ἐπὶ τὸ χεῖρον πλανῶντες καὶ πλανώμενοι',
   'ponēroi de anthrōpoi kai goētes prokopsousin epi to cheiron planōntes kai planōmenoi',
   '''Evil men'' (ponēroi anthrōpoi — wicked people). ''Seducers'' (goētes — sorcerers, impostors, charlatans; originally those who wailed incantations — the word evokes fraudulent spirituality). ''Wax worse and worse'' (prokopsousin epi to cheiron — will advance toward the worse; the word for ''advance'' [prokoptō] is ironic — they make ''progress'' but toward greater evil). ''Deceiving and being deceived'' (planōntes kai planōmenoi) — they are simultaneously perpetrators and victims of deception. Error enslaves its own promoters.',
   NULL),
  (14,
   'But continue thou in the things which thou hast learned and hast been assured of, knowing of whom thou hast learned them;',
   'σὺ δὲ μένε ἐν οἷς ἔμαθες καὶ ἐπιστώθης εἰδὼς παρὰ τίνων ἔμαθες',
   'sy de mene en hois emathes kai epistōthēs eidōs para tinōn emathes',
   '''But continue thou'' (sy de mene — but you, remain; present imperative: keep standing firm). ''Learned'' (emathes — acquired knowledge through instruction). ''Been assured of'' (epistōthēs — became firmly convinced, were confirmed in). ''Knowing of whom'' (eidōs para tinōn — knowing from what kind of people). Timothy''s confidence rests on two pillars: (1) the content of what he learned, and (2) the character of those who taught him — Paul himself, and before Paul, Lois and Eunice (1:5). Source matters.',
   NULL),
  (15,
   'And that from a child thou hast known the holy scriptures, which are able to make thee wise unto salvation through faith which is in Christ Jesus.',
   'καὶ ὅτι ἀπὸ βρέφους τὰ ἱερὰ γράμματα οἶδας τὰ δυνάμενά σε σοφίσαι εἰς σωτηρίαν διὰ πίστεως τῆς ἐν Χριστῷ Ἰησοῦ',
   'kai hoti apo brephous ta hiera grammata oidas ta dynamena se sophisai eis sōtērian dia pisteōs tēs en Christō Iēsou',
   '''From a child'' (apo brephous — from infancy, from babyhood; brephos means an infant, even an unborn child). ''Holy scriptures'' (hiera grammata — sacred writings; the Greek term for the OT Scriptures, known from Jewish education). ''Able to make thee wise'' (dynamena se sophisai — having power to give you wisdom). ''Unto salvation'' (eis sōtērian) — the Scriptures'' supreme purpose. ''Through faith which is in Christ Jesus'' — the Scriptures save not mechanically but through the faith they generate, directed toward Christ. Timothy''s Jewish mother taught him the OT from infancy; that OT pointed to Christ.',
   NULL),
  (16,
   'All scripture is given by inspiration of God, and is profitable for doctrine, for reproof, for correction, for instruction in righteousness:',
   'πᾶσα γραφὴ θεόπνευστος καὶ ὠφέλιμος πρὸς διδασκαλίαν πρὸς ἐλεγμόν πρὸς ἐπανόρθωσιν πρὸς παιδείαν τὴν ἐν δικαιοσύνῃ',
   'pasa graphē theopneustos kai ōphelimos pros didaskalian pros elegmon pros epanorthōsin pros paideian tēn en dikaiosynē',
   '''All scripture'' (pasa graphē — every scripture, every portion of the written word). ''Given by inspiration of God'' (theopneustos — God-breathed; from theos [God] + pneō [to breathe]; only here in the NT). Scripture is not merely ''inspired'' (breathed into) but ''expired'' — breathed out from God. It is God''s own breath in written form. Four functions: (1) ''doctrine'' (didaskalian — teaching, positive instruction in truth), (2) ''reproof'' (elegmon — conviction of error, exposing what is wrong), (3) ''correction'' (epanorthōsin — setting straight, restoring to an upright position; only here in the NT), (4) ''instruction in righteousness'' (paideian tēn en dikaiosynē — training, disciplined education in right living).',
   'The doctrine of inspiration: Theopneustos does not describe the human authors'' experience (''they felt inspired'') but Scripture''s divine origin (''it was breathed out by God''). The emphasis is on the product, not the process. Because Scripture is God-breathed, it carries God''s authority. This is the foundational text for the doctrine of biblical inspiration — and Paul states it precisely when Timothy most needs confidence in an authoritative word against the rising tide of error.'),
  (17,
   'That the man of God may be perfect, throughly furnished unto all good works.',
   'ἵνα ἄρτιος ᾖ ὁ τοῦ θεοῦ ἄνθρωπος πρὸς πᾶν ἔργον ἀγαθὸν ἐξηρτισμένος',
   'hina artios ē ho tou theou anthrōpos pros pan ergon agathon exērtismenos',
   '''Man of God'' (ho tou theou anthrōpos — the person belonging to God, the minister of God; an OT title for prophets like Moses and Elijah). ''Perfect'' (artios — complete, fitted, capable, proficient). ''Throughly furnished'' (exērtismenos — thoroughly equipped, completely outfitted; from ek [out, thoroughly] + artizō [to complete]; the prefix intensifies the completeness). ''Unto all good works'' (pros pan ergon agathon — for every kind of good work, without exception). Scripture''s sufficiency is total: it completely equips the servant of God for every assignment. No supplement is needed.',
   'The sufficiency of Scripture: This verse teaches that Scripture alone (theopneustos graphē) is sufficient to make the man of God ''complete'' and ''thoroughly equipped'' for every good work. If Scripture leaves nothing lacking for the minister''s preparation, then no additional revelation, tradition, or philosophy is necessary to supplement it. This is the classic text for the Protestant doctrine of sola scriptura — the sufficiency of Scripture for faith and practice.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Timothy' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 1 (Perilous times)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χαλεποί', 'chalepoi', 'G5467', 'Perilous, fierce, savage, dangerous — the only other NT use describes the violent Gadarene demoniacs (Matt 8:28). These times are wild and untameable.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 3 AND v.verse_number = 1;

-- Verse 5 (Form of godliness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μόρφωσιν', 'morphōsin', 'G3446', 'Form, outward appearance, external shape — not the essential form (morphē) but the mere semblance, the outer shell without inner reality. The outline of godliness emptied of its substance.', 1),
  ('δύναμιν', 'dynamin', 'G1411', 'Power, ability, inherent capability — the transforming energy of genuine godliness. They keep the shell but reject the engine. Religion without the Spirit''s power is dead ritual.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 3 AND v.verse_number = 5;

-- Verse 12 (All shall suffer persecution)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εὐσεβῶς', 'eusebōs', 'G2153', 'Godly, in a God-honouring manner, piously — the adverb of eusebeia (godliness). Living in a way that takes God seriously. This is the trigger for persecution: authentic faith confronts a world that rejects God.', 1),
  ('διωχθήσονται', 'diōchthēsontai', 'G1377', 'Shall be persecuted — future passive indicative: it will certainly happen to them. Not ''might be'' but ''will be.'' Persecution is a promise, not a possibility, for the godly.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 3 AND v.verse_number = 12;

-- Verse 16 (All Scripture God-breathed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θεόπνευστος', 'theopneustos', 'G2315', 'God-breathed, inspired by God — from theos (God) + pneō (to breathe). Scripture is the product of God''s creative breath. Not that God breathed into the text but that the text was breathed out from God. Only here in the NT.', 1),
  ('ἐλεγμόν', 'elegmon', 'G1650', 'Reproof, conviction, exposure of error — the function of Scripture that confronts sin and wrong thinking. Not merely pointing out mistakes but bringing the hearer to conviction. Related to elegchō (to convict, rebuke).', 2),
  ('ἐπανόρθωσιν', 'epanorthōsin', 'G1882', 'Correction, restoration, setting upright again — from epi (upon) + ana (up) + orthoō (to set straight). Like straightening something bent or restoring something fallen. Only here in the NT.', 3),
  ('παιδείαν', 'paideian', 'G3809', 'Instruction, training, discipline — the nurturing, formative education of a child. Scripture trains believers in the habits of righteousness, shaping character over time.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 3 AND v.verse_number = 16;

-- Verse 17 (Man of God complete)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἄρτιος', 'artios', 'G739', 'Complete, fitted, capable — having everything needed, fully equipped. Not lacking any essential quality or resource. Only here in the NT.', 1),
  ('ἐξηρτισμένος', 'exērtismenos', 'G1822', 'Thoroughly furnished, completely equipped — the prefix ex intensifies: not merely furnished but thoroughly, completely, exhaustively equipped. The man of God needs no external supplement to Scripture. Only here in the NT.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 3 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Perilous times
  (1, '1 Timothy 4:1', 1), (1, '2 Peter 3:3', 2), (1, 'Jude 18', 3),
  -- v2-4: Vice catalogue
  (2, 'Romans 1:29-31', 1), (2, 'Galatians 5:19-21', 2),
  (4, '2 Peter 2:10-13', 1), (4, 'Jude 16-19', 2),
  -- v5: Form of godliness
  (5, 'Matthew 7:21-23', 1), (5, 'Titus 1:16', 2), (5, 'James 1:22', 3),
  -- v8: Jannes and Jambres
  (8, 'Exodus 7:11-12', 1), (8, 'Exodus 8:18-19', 2), (8, 'Acts 13:8', 3),
  -- v10-11: Paul's example
  (10, '1 Corinthians 11:1', 1), (10, 'Philippians 3:17', 2),
  (11, 'Acts 13:50', 1), (11, 'Acts 14:5-6', 2), (11, 'Acts 14:19-20', 3), (11, 'Psalm 34:19', 4),
  -- v12: All godly shall suffer
  (12, 'John 15:18-20', 1), (12, 'Matthew 5:10-12', 2), (12, 'Acts 14:22', 3), (12, '1 Peter 4:12-13', 4),
  -- v14: Continue in what you learned
  (14, '2 Timothy 1:5', 1), (14, 'Hebrews 2:1', 2),
  -- v15: Scriptures from childhood
  (15, 'Deuteronomy 6:6-7', 1), (15, 'Psalm 119:99-100', 2), (15, 'John 5:39', 3),
  -- v16: All Scripture God-breathed
  (16, '2 Peter 1:20-21', 1), (16, 'Hebrews 4:12', 2), (16, 'Psalm 19:7-11', 3), (16, 'Isaiah 40:8', 4),
  -- v17: Man of God complete
  (17, '2 Timothy 2:21', 1), (17, 'Ephesians 2:10', 2), (17, 'Hebrews 13:21', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 2 Timothy Chapter 3 Complete
-- 17 verses · 6 key verses with word studies (13 words)
-- Cross-references for 14 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════