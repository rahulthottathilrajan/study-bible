-- ═══════════════════════════════════════════════════
-- 2 PETER CHAPTER 3 — The Day of the Lord and New Creation
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  '2 Peter 3 answers the scoffers who mock the promise of Christ''s return: ''Where is the promise of his coming?'' (v.4). Peter responds with three powerful arguments. First, the scoffers ''willingly are ignorant'' that God already destroyed a world by water (vv.5-6), and the present world is ''reserved unto fire'' (v.7). Second, God''s timing is not human timing: ''one day is with the Lord as a thousand years'' (v.8). The delay is not slowness but longsuffering — God is ''not willing that any should perish, but that all should come to repentance'' (v.9). Third, the Day of the Lord will come suddenly, with the heavens passing away and the elements melting (v.10). Peter draws the practical conclusion: ''what manner of persons ought ye to be in all holy conversation and godliness'' (v.11)? Believers look for ''new heavens and a new earth, wherein dwelleth righteousness'' (v.13). The epistle closes with a reference to Paul''s writings as Scripture (vv.15-16) and a final exhortation to ''grow in grace, and in the knowledge of our Lord and Saviour Jesus Christ'' (v.18).',
  'The Certainty of Christ''s Return and the New Creation',
  'προσδοκῶντας (prosdokōntas)',
  'Looking for, expecting, waiting with anticipation — from pros (toward) + dokaō (to watch). Active, forward-looking expectation that shapes present behaviour. Believers live looking toward the Day of God.',
  '["Reminder of Apostolic Teaching (vv.1-2): This second epistle I write to stir up your pure minds; be mindful of the words spoken before by the holy prophets and the commandment of the apostles","Scoffers in the Last Days (vv.3-4): Scoffers walking after their own lusts; Where is the promise of his coming? Since the fathers fell asleep all things continue as they were","The World Destroyed by Water, Reserved for Fire (vv.5-7): By the word of God the heavens were of old; the world that then was perished by water; the present heavens and earth are reserved unto fire against the day of judgment","God''s Patience Explained (vv.8-9): One day with the Lord as a thousand years; the Lord is not slack; He is longsuffering, not willing that any should perish","The Day of the Lord Described (vv.10-13): The day of the Lord will come as a thief; the heavens shall pass away with a great noise; the elements shall melt; what manner of persons ought ye to be; we look for new heavens and a new earth wherein dwelleth righteousness","Final Exhortations (vv.14-18): Be diligent to be found in peace; Paul also wrote unto you; some things hard to be understood; beware lest ye fall from your steadfastness; grow in grace and knowledge of our Lord; to him be glory"]'
FROM books b WHERE b.name = '2 Peter';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'This second epistle, beloved, I now write unto you; in both which I stir up your pure minds by way of remembrance:',
   'Ταύτην ἤδη ἀγαπητοί δευτέραν ὑμῖν γράφω ἐπιστολήν ἐν αἷς διεγείρω ὑμῶν ἐν ὑπομνήσει τὴν εἰλικρινῆ διάνοιαν',
   'Tautēn ēdē agapētoi deuteran hymin graphō epistolēn en hais diegeirō hymōn en hypomnēsei tēn eilikrinē dianoian',
   '''Second epistle'' (deuteran epistolēn) — the first being 1 Peter. ''Stir up'' (diegeirō — rouse thoroughly, wake up completely; the same verb as 1:13). ''Pure minds'' (eilikrinē dianoian — sincere minds, unmixed thinking; eilikrinēs originally meant ''judged by sunlight'' — tested for transparency, found without hidden motives). ''By way of remembrance'' (en hypomnēsei — through reminder). Peter''s strategy in both letters: not new information but reminders of what they already know. Truth known must be truth remembered.',
   NULL),
  (2,
   'That ye may be mindful of the words which were spoken before by the holy prophets, and of the commandment of us the apostles of the Lord and Saviour:',
   'μνησθῆναι τῶν προειρημένων ῥημάτων ὑπὸ τῶν ἁγίων προφητῶν καὶ τῆς τῶν ἀποστόλων ὑμῶν ἐντολῆς τοῦ κυρίου καὶ σωτῆρος',
   'mnēsthēnai tōn proeirēmenōn rhēmatōn hypo tōn hagiōn prophētōn kai tēs tōn apostolōn hymōn entolēs tou kyriou kai sōtēros',
   'Two sources of authority placed side by side: (1) ''the words spoken before by the holy prophets'' (the OT Scriptures) and (2) ''the commandment of us the apostles'' (the apostolic teaching, the NT message). Peter equates the authority of the apostles with that of the OT prophets — both are equally the word of God. ''The Lord and Saviour'' — the message comes from Christ through His apostles. The church stands on the foundation of prophets and apostles (Eph 2:20).',
   NULL),
  (3,
   'Knowing this first, that there shall come in the last days scoffers, walking after their own lusts,',
   'τοῦτο πρῶτον γινώσκοντες ὅτι ἐλεύσονται ἐπ᾽ ἐσχάτων τῶν ἡμερῶν ἐμπαῖκται κατὰ τὰς ἰδίας αὐτῶν ἐπιθυμίας πορευόμενοι',
   'touto prōton ginōskontes hoti eleusontai ep'' eschatōn tōn hēmerōn empaiktai kata tas idias autōn epithymias poreuomenoi',
   '''Knowing this first'' (touto prōton ginōskontes — this is the primary thing to understand). ''Last days'' (eschatōn tōn hēmerōn — the final period of time before Christ''s return). ''Scoffers'' (empaiktai — mockers, deriders, those who ridicule; from empaizō, to mock, to make sport of). ''Walking after their own lusts'' (kata tas idias autōn epithymias poreuomenoi — living according to their own desires). The connection between intellectual scepticism and moral indulgence: they mock the Second Coming because they want to live without accountability.',
   NULL),
  (4,
   'And saying, Where is the promise of his coming? for since the fathers fell asleep, all things continue as they were from the beginning of the creation.',
   'καὶ λέγοντες Ποῦ ἐστιν ἡ ἐπαγγελία τῆς παρουσίας αὐτοῦ ἀφ᾽ ἧς γὰρ οἱ πατέρες ἐκοιμήθησαν πάντα οὕτως διαμένει ἀπ᾽ ἀρχῆς κτίσεως',
   'kai legontes Pou estin hē epangelia tēs parousias autou aph'' hēs gar hoi pateres ekoimēthēsan panta houtōs diamenei ap'' archēs ktiseōs',
   '''Where is the promise of his coming?'' (Pou estin hē epangelia tēs parousias) — the question drips with contempt. ''The fathers'' (hoi pateres — the first generation of Christians, or the OT patriarchs). ''Fell asleep'' (ekoimēthēsan — died). ''All things continue as they were'' (panta houtōs diamenei — everything remains the same, unchanged). This is the argument of uniformitarianism: the world has always run the same way and always will. No divine intervention has occurred; therefore none will occur. Peter demolishes this assumption in vv.5-7.',
   NULL),
  (5,
   'For this they willingly are ignorant of, that by the word of God the heavens were of old, and the earth standing out of the water and in the water:',
   'λανθάνει γὰρ αὐτοὺς τοῦτο θέλοντας ὅτι οὐρανοὶ ἦσαν ἔκπαλαι καὶ γῆ ἐξ ὕδατος καὶ δι᾽ ὕδατος συνεστῶσα τῷ τοῦ θεοῦ λόγῳ',
   'lanthanei gar autous touto thelontas hoti ouranoi ēsan ekpalai kai gē ex hydatos kai di'' hydatos synestōsa tō tou theou logō',
   '''Willingly are ignorant'' (lanthanei autous touto thelontas — this escapes their notice willingly, they deliberately choose to forget; from lanthanō, to escape notice + thelō, to will). The ignorance is chosen, not accidental. ''By the word of God'' (tō tou theou logō — by God''s spoken word). ''The heavens were of old'' (ouranoi ēsan ekpalai — the heavens existed long ago). ''Out of the water and in the water'' (ex hydatos kai di'' hydatos — from water and through water; cf. Gen 1:2,6-9: creation from the watery chaos). God''s word created the world, and the same word can destroy and recreate it.',
   NULL),
  (6,
   'Whereby the world that then was, being overflowed with water, perished:',
   'δι᾽ ὧν ὁ τότε κόσμος ὕδατι κατακλυσθεὶς ἀπώλετο',
   'di'' hōn ho tote kosmos hydati kataklustheis apōleto',
   '''The world that then was'' (ho tote kosmos — the world of that time, the antediluvian world). ''Overflowed with water'' (hydati kataklustheis — deluged, flooded; from kataklyzomai — our word ''cataclysm''). ''Perished'' (apōleto — was destroyed, was ruined). The scoffers'' argument (''all things continue as they were'') is refuted by one historical fact: God already destroyed a world. The claim that God never intervenes in history is disproved by the flood. If He did it once, He can do it again.',
   NULL),
  (7,
   'But the heavens and the earth, which are now, by the same word are kept in store, reserved unto fire against the day of judgment and perdition of ungodly men.',
   'οἱ δὲ νῦν οὐρανοὶ καὶ ἡ γῆ τῷ αὐτῷ λόγῳ τεθησαυρισμένοι εἰσὶν πυρὶ τηρούμενοι εἰς ἡμέραν κρίσεως καὶ ἀπωλείας τῶν ἀσεβῶν ἀνθρώπων',
   'hoi de nyn ouranoi kai hē gē tō autō logō tethēsaurismenoi eisin pyri tēroumenoi eis hēmeran kriseōs kai apōleias tōn asebōn anthrōpōn',
   '''By the same word'' (tō autō logō — the same divine utterance that created and flooded now sustains and reserves). ''Kept in store'' (tethēsaurismenoi — stored up, treasured up; from thēsaurizō — to treasure, to store; the present world is being stored like fuel for a coming fire). ''Reserved unto fire'' (pyri tēroumenoi — guarded for fire). ''The day of judgment and perdition of ungodly men'' (hēmeran kriseōs kai apōleias — the day of decision and destruction). First cycle: water. Second cycle: fire. The same God, the same word, different element.',
   NULL),
  (8,
   'But, beloved, be not ignorant of this one thing, that one day is with the Lord as a thousand years, and a thousand years as one day.',
   'ἓν δὲ τοῦτο μὴ λανθανέτω ὑμᾶς ἀγαπητοί ὅτι μία ἡμέρα παρὰ κυρίῳ ὡς χίλια ἔτη καὶ χίλια ἔτη ὡς ἡμέρα μία',
   'hen de touto mē lanthanetō hymas agapētoi hoti mia hēmera para kyriō hōs chilia etē kai chilia etē hōs hēmera mia',
   '''Be not ignorant'' (mē lanthanetō — let this not escape your notice; the same verb as v.5, but now directed at believers: don''t make the scoffers'' mistake). ''One day as a thousand years'' — quoting Ps 90:4 with a double application: (1) God is patient — what seems long to us is a moment to Him, and (2) God is powerful — He can accomplish in one day what takes a millennium. Time is God''s servant, not His master. The delay of the Parousia is not evidence of broken promise but of sovereign patience.',
   NULL),
  (9,
   'The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.',
   'οὐ βραδύνει κύριος τῆς ἐπαγγελίας ὥς τινες βραδυτῆτα ἡγοῦνται ἀλλὰ μακροθυμεῖ εἰς ὑμᾶς μὴ βουλόμενός τινας ἀπολέσθαι ἀλλὰ πάντας εἰς μετάνοιαν χωρῆσαι',
   'ou bradynei kyrios tēs epangelias hōs tines bradytēta hēgountai alla makrothymei eis hymas mē boulomenos tinas apolesthai alla pantas eis metanoian chōrēsai',
   '''Not slack'' (ou bradynei — is not slow, is not delaying; from bradys, slow). What looks like delay to the scoffer is deliberate patience. ''Longsuffering'' (makrothymei — is patient, has a long fuse, holds back wrath). ''Not willing that any should perish'' (mē boulomenos tinas apolesthai — not desiring any to be destroyed; boulomenos indicates deliberate will, settled desire). ''All should come to repentance'' (pantas eis metanoian chōrēsai — all to make room for/come to a change of mind). The delay of judgment is mercy in action — every day the Lord waits is another day for repentance.',
   'God''s desire and the delay of judgment: This verse reveals the heart behind the apparent delay: God''s patience is driven by His desire that none perish. ''Not willing that any should perish'' (mē boulomenos tinas apolesthai) expresses God''s genuine desire for universal repentance. The tension between God''s sovereign election and His universal desire for salvation is held together here: God genuinely wants all to repent, and He patiently extends time for that purpose.'),
  (10,
   'But the day of the Lord will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up.',
   'ἥξει δὲ ἡμέρα κυρίου ὡς κλέπτης ἐν νυκτί ἐν ᾗ οἱ οὐρανοὶ ῥοιζηδὸν παρελεύσονται στοιχεῖα δὲ καυσούμενα λυθήσεται καὶ γῆ καὶ τὰ ἐν αὐτῇ ἔργα κατακαήσεται',
   'hēxei de hēmera kyriou hōs kleptēs en nykti en hē hoi ouranoi rhoizēdon pareleusontai stoicheia de kausoumena lythēsetai kai gē kai ta en autē erga katakaesetai',
   '''Will come'' (hēxei — will arrive, will be present; future tense: certain). ''As a thief'' (hōs kleptēs — cf. 1 Thess 5:2; Matt 24:43). ''Great noise'' (rhoizēdon — with a rushing, roaring, crackling sound; an onomatopoeia for the whoosh of fire or the hiss of intense heat; used only here in the NT). ''Elements'' (stoicheia — basic components, fundamental building blocks; the very fabric of the physical universe). ''Melt'' (lythēsetai — shall be dissolved, loosened, unbound). ''Burned up'' (katakaesetai — shall be burned down, consumed by fire). The present creation will be unmade by fire as thoroughly as the first world was unmade by water.',
   'The dissolution of the present creation: This verse describes not mere renovation but radical transformation. The heavens ''pass away'' (pareleusontai), the elements ''melt'' (lythēsetai), and the earth is ''burned up'' (katakaesetai). Whether this means total annihilation followed by new creation or purifying transformation into the new earth (v.13) is debated. Either way, the present order is not permanent.'),
  (11,
   'Seeing then that all these things shall be dissolved, what manner of persons ought ye to be in all holy conversation and godliness,',
   'τούτων οὖν πάντων λυομένων ποταποὺς δεῖ ὑπάρχειν ὑμᾶς ἐν ἁγίαις ἀναστροφαῖς καὶ εὐσεβείαις',
   'toutōn oun pantōn lyomenōn potapous dei hyparchein hymas en hagiais anastrophais kai eusebeiais',
   '''Dissolved'' (lyomenōn — being dissolved, being loosed; present passive participle: the dissolution is already underway in God''s plan). ''What manner of persons'' (potapous — what kind of, what sort of; a question demanding serious reflection). ''Holy conversation'' (hagiais anastrophais — holy conduct, sacred manner of life; plural: holy behaviours in every area). ''Godliness'' (eusebeiais — acts of reverence, practical piety; plural: godly deeds). Eschatology produces ethics: the certainty that this world is passing away should transform how we live in it.',
   NULL),
  (12,
   'Looking for and hasting unto the coming of the day of God, wherein the heavens being on fire shall be dissolved, and the elements shall melt with fervent heat?',
   'προσδοκῶντας καὶ σπεύδοντας τὴν παρουσίαν τῆς τοῦ θεοῦ ἡμέρας δι᾽ ἣν οὐρανοὶ πυρούμενοι λυθήσονται καὶ στοιχεῖα καυσούμενα τήκεται',
   'prosdokōntas kai speudontas tēn parousian tēs tou theou hēmeras di'' hēn ouranoi pyroumenoi lythēsontai kai stoicheia kausoumena tēketai',
   '''Looking for'' (prosdokōntas — expecting, awaiting with anticipation). ''Hasting'' (speudontas — hastening, speeding toward; or possibly ''hastening the coming of'' — the remarkable idea that believers can actually hasten the Day through holy living, evangelism, and prayer; cf. Acts 3:19-21). ''The day of God'' (tēs tou theou hēmeras — a unique phrase, used only here in the NT; distinct from ''the day of the Lord'' in v.10; the ultimate climax when God''s purposes are fully realised). ''Melt'' (tēketai — liquefy, dissolve from heat; a different verb from v.10, adding the image of metals melting in a furnace).',
   NULL),
  (13,
   'Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness.',
   'καινοὺς δὲ οὐρανοὺς καὶ γῆν καινὴν κατὰ τὸ ἐπάγγελμα αὐτοῦ προσδοκῶμεν ἐν οἷς δικαιοσύνη κατοικεῖ',
   'kainous de ouranous kai gēn kainēn kata to epangelma autou prosdokōmen en hois dikaiosynē katoikei',
   '''New'' (kainous — new in quality, fresh, renewed; not neos, new in time, but kainos, new in nature). ''According to his promise'' (kata to epangelma — based on God''s covenant promise; cf. Isa 65:17; 66:22; Rev 21:1). ''Look for'' (prosdokōmen — we are expecting; the same verb as v.12, now in the first person: we ourselves are actively looking). ''Wherein dwelleth righteousness'' (en hois dikaiosynē katoikei — in which righteousness permanently resides, makes its home). In the present world, righteousness is a stranger; in the new creation, it is the permanent resident. The ultimate hope is not escape from creation but the renewal of creation.',
   'The new creation: The Christian hope is not merely individual salvation but cosmic renewal. God will not abandon His creation but transform it. ''New heavens and a new earth'' — the fulfilment of Isaiah 65:17 and Revelation 21:1. The defining characteristic: righteousness ''dwells'' (katoikei — permanently inhabits) there. Sin, suffering, injustice, and death will be gone forever. This is the ''blessed hope'' of the church.'),
  (14,
   'Wherefore, beloved, seeing that ye look for such things, be diligent that ye may be found of him in peace, without spot, and blameless.',
   'διό ἀγαπητοί ταῦτα προσδοκῶντες σπουδάσατε ἄσπιλοι καὶ ἀμώμητοι αὐτῷ εὑρεθῆναι ἐν εἰρήνῃ',
   'dio agapētoi tauta prosdokōntes spoudasate aspiloi kai amōmētoi autō heurethēnai en eirēnē',
   '''Be diligent'' (spoudasate — make every effort; cf. 1:10 where the same word urged making your calling sure). ''Found of him'' (autō heurethēnai — to be found by Him; passive: when Christ searches, what will He find?). ''In peace'' (en eirēnē — at peace with God and with others). ''Without spot'' (aspiloi — unspotted, unstained; the opposite of the false teachers who are ''spots and blemishes,'' 2:13). ''Blameless'' (amōmētoi — without blame, irreproachable). The expected Day motivates present purity.',
   NULL),
  (15,
   'And account that the longsuffering of our Lord is salvation; even as our beloved brother Paul also according to the wisdom given unto him hath written unto you;',
   'καὶ τὴν τοῦ κυρίου ἡμῶν μακροθυμίαν σωτηρίαν ἡγεῖσθε καθὼς καὶ ὁ ἀγαπητὸς ἡμῶν ἀδελφὸς Παῦλος κατὰ τὴν δοθεῖσαν αὐτῷ σοφίαν ἔγραψεν ὑμῖν',
   'kai tēn tou kyriou hēmōn makrothymian sōtērian hēgeisthe kathōs kai ho agapētos hēmōn adelphos Paulos kata tēn dotheisan autō sophian egrapsen hymin',
   '''Account'' (hēgeisthe — consider, regard, reckon). ''Longsuffering'' (makrothymian — patience) = ''salvation'' (sōtērian). Every day the Lord delays is another day for someone to be saved. ''Our beloved brother Paul'' (ho agapētos hēmōn adelphos Paulos) — Peter and Paul were colleagues, not rivals. ''According to the wisdom given unto him'' (kata tēn dotheisan autō sophian — according to the wisdom granted to him by God). Peter acknowledges Paul''s divinely given wisdom while affirming their shared apostolic authority.',
   NULL),
  (16,
   'As also in all his epistles, speaking in them of these things; in which are some things hard to be understood, which they that are unlearned and unstable wrest, as they do also the other scriptures, unto their own destruction.',
   'ὡς καὶ ἐν πάσαις ταῖς ἐπιστολαῖς λαλῶν ἐν αὐταῖς περὶ τούτων ἐν αἷς ἐστιν δυσνόητά τινα ἃ οἱ ἀμαθεῖς καὶ ἀστήρικτοι στρεβλοῦσιν ὡς καὶ τὰς λοιπὰς γραφὰς πρὸς τὴν ἰδίαν αὐτῶν ἀπώλειαν',
   'hōs kai en pasais tais epistolais lalōn en autais peri toutōn en hais estin dysnoēta tina ha hoi amatheis kai astēriktoi streblousin hōs kai tas loipas graphas pros tēn idian autōn apōleian',
   '''All his epistles'' (pasais tais epistolais — Peter knows of a collection of Paul''s letters). ''Hard to be understood'' (dysnoēta — difficult to comprehend; from dys + noeō, hard + to think). Peter acknowledges Paul can be challenging. ''Unlearned'' (amatheis — untaught, ignorant). ''Unstable'' (astēriktoi — unestablished, the same word as 2:14 for those the false teachers target). ''Wrest'' (streblousin — twist, distort, put on the rack; a torture metaphor: they rack Scripture until it confesses what they want). ''The other scriptures'' (tas loipas graphas — the rest of the Scriptures). Peter places Paul''s letters alongside ''the other scriptures'' — recognising them as Scripture, inspired and authoritative.',
   'Paul''s epistles as Scripture: This is the most significant verse in the NT for the canon. Peter classifies Paul''s letters with ''the other scriptures'' (tas loipas graphas), using graphē in its technical sense for sacred, inspired writings. Within the NT period itself, apostolic writings were already being recognised as Scripture alongside the OT. This is early canonical awareness.'),
  (17,
   'Ye therefore, beloved, seeing ye know these things before, beware lest ye also, being led away with the error of the wicked, fall from your own stedfastness.',
   'Ὑμεῖς οὖν ἀγαπητοί προγινώσκοντες φυλάσσεσθε ἵνα μὴ τῇ τῶν ἀθέσμων πλάνῃ συναπαχθέντες ἐκπέσητε τοῦ ἰδίου στηριγμοῦ',
   'Hymeis oun agapētoi proginōskontes phylassesthe hina mē tē tōn athesmōn planē synapachthentes ekpesēte tou idiou stērigmou',
   '''Know before'' (proginōskontes — knowing in advance, forewarned). ''Beware'' (phylassesthe — guard yourselves, be on watch; present middle imperative: continually protect yourselves). ''Led away'' (synapachthentes — carried away together with, swept along by; from syn + apo + agō — carried off together with the lawless). ''Fall from your own stedfastness'' (ekpesēte tou idiou stērigmou — fall out of your own firm position, lose your stable footing). Foreknowledge is the basis of vigilance: because you know what is coming, guard against it.',
   NULL),
  (18,
   'But grow in grace, and in the knowledge of our Lord and Saviour Jesus Christ. To him be glory both now and for ever. Amen.',
   'αὐξάνετε δὲ ἐν χάριτι καὶ γνώσει τοῦ κυρίου ἡμῶν καὶ σωτῆρος Ἰησοῦ Χριστοῦ αὐτῷ ἡ δόξα καὶ νῦν καὶ εἰς ἡμέραν αἰῶνος ἀμήν',
   'auxanete de en chariti kai gnōsei tou kyriou hēmōn kai sōtēros Iēsou Christou autō hē doxa kai nyn kai eis hēmeran aiōnos amēn',
   '''Grow'' (auxanete — increase, grow; present imperative: keep on growing). ''In grace'' (en chariti — in the sphere of grace, in the experience of God''s unmerited favour). ''In knowledge'' (gnōsei — experiential knowledge, personal acquaintance; the epistle that began with epignōsis in 1:2 ends with gnōsis here). ''To him be glory'' (autō hē doxa — the doxology is directed to Christ: ''our Lord and Saviour Jesus Christ''). ''Both now and for ever'' (kai nyn kai eis hēmeran aiōnos — both now and unto the day of eternity). The epistle that warned against false teachers and scoffers ends not with fear but with worship: glory to the Lord Jesus Christ, now and for ever.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Peter' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 4 (Where is the promise?)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐμπαῖκται', 'empaiktai', 'G1703', 'Scoffers, mockers, those who deride — from empaizō (to mock, to play with, to make sport of). Those who ridicule the promise of Christ''s return. Their mockery is not intellectual but moral: they scoff because they want to live without accountability.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 3 AND v.verse_number = 4;

-- Verse 9 (Longsuffering / not willing any perish)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μακροθυμεῖ', 'makrothymei', 'G3114', 'Is longsuffering, is patient — from makros (long) + thymos (passion, anger). God has a long fuse. He restrains wrath to give time for repentance. Every day of delay is a day of mercy.', 1),
  ('μετάνοιαν', 'metanoian', 'G3341', 'Repentance, a change of mind — from meta (after, change) + noeō (to think). A complete reversal of thinking that leads to a changed life. Not mere regret but a fundamental reorientation toward God.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 3 AND v.verse_number = 9;

-- Verse 10 (Elements melt / great noise)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ῥοιζηδόν', 'rhoizēdon', 'G4500', 'With a rushing sound, with a roar — an onomatopoeia (the word sounds like what it describes). Used only here in the NT. The crackling, roaring sound of a great conflagration.', 1),
  ('στοιχεῖα', 'stoicheia', 'G4747', 'Elements, fundamental components — the basic building blocks of the physical universe. Whether atomic elements, celestial bodies, or the four classical elements (earth, air, fire, water), the point is that the very fabric of creation will be dissolved.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Verse 13 (New heavens / righteousness dwells)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καινούς', 'kainous', 'G2537', 'New in quality, fresh, renewed — not neos (new in time) but kainos (new in kind). The new creation is qualitatively different from the old: purified, perfected, permanent.', 1),
  ('κατοικεῖ', 'katoikei', 'G2730', 'Dwells, resides permanently — from kata (down, settled) + oikeō (to inhabit). Righteousness will not be a visitor but a permanent inhabitant. In this world righteousness is alien; in the new creation it is at home.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 3 AND v.verse_number = 13;

-- Verse 16 (Wrest the scriptures)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('στρεβλοῦσιν', 'streblousin', 'G4761', 'Wrest, twist, distort — from strebloō (to put on the rack, to torture). A torture metaphor: they stretch Scripture on the rack until it confesses what they want it to say. Twisting Scripture to fit one''s agenda.', 1),
  ('γραφάς', 'graphas', 'G1124', 'Scriptures, sacred writings — the technical term for inspired, authoritative writings. By placing Paul''s letters alongside ''the other scriptures,'' Peter recognises them as canonical, inspired text.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 3 AND v.verse_number = 16;

-- Verse 18 (Grow in grace)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('αὐξάνετε', 'auxanete', 'G837', 'Grow, increase — present imperative: keep on growing. The Christian life is never static. Growth in grace and knowledge is the antidote to the false teaching and apostasy warned against throughout the epistle.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 3 AND v.verse_number = 18;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Prophets and apostles
  (2, 'Ephesians 2:20', 1), (2, 'Jude 1:17', 2), (2, '2 Peter 1:19-21', 3),
  -- v3-4: Scoffers / where is the promise
  (3, 'Jude 1:18', 1), (3, '2 Timothy 3:1-5', 2),
  (4, 'Isaiah 5:19', 1), (4, 'Ezekiel 12:22', 2), (4, 'Matthew 24:48', 3),
  -- v5-6: Creation and flood
  (5, 'Genesis 1:6-9', 1), (5, 'Hebrews 11:3', 2),
  (6, 'Genesis 7:11-23', 1), (6, '2 Peter 2:5', 2),
  -- v7: Reserved unto fire
  (7, 'Isaiah 66:15-16', 1), (7, '2 Thessalonians 1:7-8', 2), (7, 'Malachi 4:1', 3),
  -- v8: One day as a thousand years
  (8, 'Psalm 90:4', 1), (8, 'Habakkuk 2:3', 2),
  -- v9: Longsuffering / not willing any perish
  (9, 'Romans 2:4', 1), (9, '1 Timothy 2:4', 2), (9, 'Ezekiel 33:11', 3),
  -- v10: Day of the Lord / thief
  (10, '1 Thessalonians 5:2', 1), (10, 'Revelation 20:11', 2), (10, 'Isaiah 34:4', 3),
  -- v13: New heavens and new earth
  (13, 'Isaiah 65:17', 1), (13, 'Isaiah 66:22', 2), (13, 'Revelation 21:1', 3),
  -- v15-16: Paul''s epistles as Scripture
  (15, 'Romans 2:4', 1), (15, 'Romans 9:22-23', 2),
  (16, '2 Timothy 3:16', 1), (16, '2 Peter 1:20-21', 2),
  -- v17: Beware / fall from steadfastness
  (17, '1 Corinthians 10:12', 1), (17, 'Hebrews 3:12-14', 2), (17, 'Colossians 1:23', 3),
  -- v18: Grow in grace
  (18, 'Ephesians 4:15', 1), (18, 'Colossians 1:10', 2), (18, 'Philippians 1:9-11', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 2 Peter Chapter 3 Complete
-- 18 verses · 6 key verses with word studies (11 words)
-- Cross-references for 15 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════