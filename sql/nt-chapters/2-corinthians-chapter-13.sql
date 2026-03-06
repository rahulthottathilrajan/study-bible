-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 13 — Examine Yourselves and the Trinitarian Benediction
-- 14 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 13,
  '2 Corinthians 13 is Paul''s final chapter, bringing the epistle to a climax with stern warnings, a call to self-examination, and one of the most beloved benedictions in all of Scripture. Paul warns that his upcoming third visit will not be lenient: ''In the mouth of two or three witnesses shall every word be established'' (v.1). He warns those who ''have sinned already'' that he ''will not spare'' (v.2), for they seek ''a proof of Christ speaking in me, which to you-ward is not weak, but is mighty in you'' (v.3). Christ was ''crucified through weakness, yet he liveth by the power of God'' — and Paul shares in that pattern: ''we also are weak in him, but we shall live with him by the power of God toward you'' (v.4). The chapter''s theological center is the command: ''Examine yourselves, whether ye be in the faith; prove your own selves. Know ye not your own selves, how that Jesus Christ is in you, except ye be reprobates?'' (v.5). Paul''s desire is not to display apostolic authority but to see their restoration: ''we pray to God that ye do no evil … that ye should do that which is honest, though we be as reprobates'' (v.7). The letter closes with final exhortations — ''Be perfect, be of good comfort, be of one mind, live in peace'' (v.11) — and the magnificent trinitarian benediction: ''The grace of the Lord Jesus Christ, and the love of God, and the communion of the Holy Ghost, be with you all. Amen'' (v.14), the fullest trinitarian blessing in the New Testament.',
  'Self-Examination, Apostolic Authority, and the Trinitarian Blessing',
  'δοκιμάζω (dokimazō)',
  'To test, examine, prove, approve after testing — used of assaying metals to determine genuineness. Paul commands believers to ''examine'' and ''prove'' (peirazō + dokimazō) themselves to see whether Christ truly dwells in them. The word implies rigorous, honest self-assessment — not casual introspection but the kind of testing that reveals whether faith is genuine gold or mere pretense.',
  '["Warning of the Third Visit (vv.1-4): This is the third time I am coming to you in the mouth of two or three witnesses shall every word be established; I told you before and foretell you as if I were present the second time and being absent now I write to them which heretofore have sinned and to all other that if I come again I will not spare; since ye seek a proof of Christ speaking in me which to you-ward is not weak but is mighty in you; for though he was crucified through weakness yet he liveth by the power of God for we also are weak in him but we shall live with him by the power of God toward you","Examine Yourselves (vv.5-10): Examine yourselves whether ye be in the faith prove your own selves know ye not your own selves how that Jesus Christ is in you except ye be reprobates; but I trust that ye shall know that we are not reprobates; now I pray to God that ye do no evil not that we should appear approved but that ye should do that which is honest though we be as reprobates; for we can do nothing against the truth but for the truth; for we are glad when we are weak and ye are strong and this also we wish even your perfection; therefore I write these things being absent lest being present I should use sharpness according to the power which the Lord hath given me to edification and not to destruction","Final Greetings and the Trinitarian Benediction (vv.11-14): Finally brethren farewell be perfect be of good comfort be of one mind live in peace and the God of love and peace shall be with you; greet one another with an holy kiss; all the saints salute you; the grace of the Lord Jesus Christ and the love of God and the communion of the Holy Ghost be with you all Amen"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 14 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'This is the third time I am coming to you. In the mouth of two or three witnesses shall every word be established.',
   'τρίτον τοῦτο ἔρχομαι πρὸς ὑμᾶς ἐπὶ στόματος δύο μαρτύρων καὶ τριῶν σταθήσεται πᾶν ῥῆμα',
   'triton touto erchomai pros hymas epi stomatos dyo martyrōn kai triōn stathēsetai pan rhēma',
   '''Third time'' (triton) — Paul''s first visit founded the church (Acts 18); his second was the ''painful visit'' (2:1); this upcoming third visit will bring judicial authority. ''In the mouth of two or three witnesses'' — quoting Deuteronomy 19:15, the Mosaic standard for establishing legal verdicts. Paul treats church discipline with the same gravity as judicial proceedings. ''Every word established'' (stathēsetai pan rhēma — every matter shall stand confirmed).',
   'Paul applies the Deuteronomic witness principle to church discipline, showing continuity between OT judicial standards and NT ecclesiology. Church discipline is not arbitrary but follows divinely ordained evidentiary standards.'),
  (2, 'I told you before, and foretell you, as if I were present, the second time; and being absent now I write to them which heretofore have sinned, and to all other, that, if I come again, I will not spare:',
   'προείρηκα καὶ προλέγω ὡς παρὼν τὸ δεύτερον καὶ ἀπὼν νῦν γράφω τοῖς προημαρτηκόσιν καὶ τοῖς λοιποῖς πᾶσιν ὅτι ἐὰν ἔλθω εἰς τὸ πάλιν οὐ φείσομαι',
   'proeirēka kai prolegō hōs parōn to deuteron kai apōn nyn graphō tois proēmartēkosin kai tois loipois pasin hoti ean elthō eis to palin ou pheisomai',
   '''I told you before'' (proeirēka — I have said previously, perfect tense indicating a standing warning). ''Foretell'' (prolegō — I say in advance, warn ahead of time). ''Them which heretofore have sinned'' (tois proēmartēkosin — those who have sinned previously and remain in that sin; perfect participle suggesting ongoing, unrepented sin). ''I will not spare'' (ou pheisomai — I will not hold back). Paul''s patience has limits; continued sin will be met with apostolic discipline.',
   NULL),
  (3, 'Since ye seek a proof of Christ speaking in me, which to you-ward is not weak, but is mighty in you.',
   'ἐπεὶ δοκιμὴν ζητεῖτε τοῦ ἐν ἐμοὶ λαλοῦντος Χριστοῦ ὃς εἰς ὑμᾶς οὐκ ἀσθενεῖ ἀλλὰ δυνατεῖ ἐν ὑμῖν',
   'epei dokimēn zēteite tou en emoi lalountos Christou hos eis hymas ouk asthenei alla dynatei en hymin',
   '''Proof'' (dokimēn — tested evidence, proven demonstration; cognate of dokimazō in v.5). The Corinthians demanded proof that Christ spoke through Paul. Paul turns this on its head: the proof is already in them — the church itself, transformed by Paul''s gospel preaching, is evidence of Christ working through him. ''Not weak, but is mighty in you'' (ou asthenei alla dynatei — not powerless but powerful). The very existence and transformation of the Corinthian church is the proof they seek.',
   NULL),
  (4, 'For though he was crucified through weakness, yet he liveth by the power of God. For we also are weak in him, but we shall live with him by the power of God toward you.',
   'καὶ γὰρ ἐσταυρώθη ἐξ ἀσθενείας ἀλλὰ ζῇ ἐκ δυνάμεως θεοῦ καὶ γὰρ ἡμεῖς ἀσθενοῦμεν ἐν αὐτῷ ἀλλὰ ζήσομεν σὺν αὐτῷ ἐκ δυνάμεως θεοῦ εἰς ὑμᾶς',
   'kai gar estaurōthē ex astheneias alla zē ek dynameōs theou kai gar hēmeis asthenoumen en autō alla zēsomen syn autō ek dynameōs theou eis hymas',
   '''Crucified through weakness'' (estaurōthē ex astheneias) — the cross appeared to be the ultimate expression of weakness and defeat. ''Yet he liveth by the power of God'' (alla zē ek dynameōs theou) — the resurrection reversed the verdict. Paul identifies himself with this cruciform pattern: ''we also are weak in him'' — sharing Christ''s apparent weakness, ''but we shall live with him by the power of God'' — sharing Christ''s resurrection power. The phrase ''toward you'' (eis hymas) means this resurrection power will be directed toward the Corinthians in Paul''s upcoming visit — for their discipline or their edification.',
   'This verse encapsulates the cruciform theology of the entire epistle: weakness and power are not opposites but sequential — the cross leads to resurrection, apparent defeat to divine victory. Paul''s ministry mirrors Christ''s pattern: suffering leading to power, humiliation to authority.'),
  (5, 'Examine yourselves, whether ye be in the faith; prove your own selves. Know ye not your own selves, how that Jesus Christ is in you, except ye be reprobates?',
   'ἑαυτοὺς πειράζετε εἰ ἐστὲ ἐν τῇ πίστει ἑαυτοὺς δοκιμάζετε ἢ οὐκ ἐπιγινώσκετε ἑαυτοὺς ὅτι Ἰησοῦς Χριστὸς ἐν ὑμῖν ἐστιν εἰ μή τι ἀδόκιμοί ἐστε',
   'heautous peirazete ei este en tē pistei heautous dokimazete ē ouk epiginōskete heautous hoti Iēsous Christos en hymin estin ei mē ti adokimoi este',
   '''Examine'' (peirazete — test, try, put to the proof; the word often used for temptation or testing by trial). ''Prove'' (dokimazete — test with the expectation of approval, assay as metals are tested). Paul uses two different words for testing: peirazō (rigorous testing, even adversarial) and dokimazō (testing for approval). ''In the faith'' (en tē pistei — in THE faith, the objective body of Christian truth, not merely subjective feeling). ''Jesus Christ is in you'' — the indwelling Christ is the mark of genuine faith. ''Reprobates'' (adokimoi — failing the test, disapproved, counterfeit; literally ''un-approved,'' the opposite of dokimos). Paul brilliantly reverses the situation: instead of testing Paul''s apostleship, they should test their own faith.',
   'This verse is the NT''s strongest call for assurance-through-examination. Genuine faith produces the indwelling presence of Christ, which is knowable (epiginōskete — to know thoroughly). The doctrine of assurance rests not on subjective feelings but on the objective reality of Christ''s indwelling presence, evidenced by transformed living.'),
  (6, 'But I trust that ye shall know that we are not reprobates.',
   'ἐλπίζω δὲ ὅτι γνώσεσθε ὅτι ἡμεῖς οὐκ ἐσμὲν ἀδόκιμοι',
   'elpizō de hoti gnōsesthe hoti hēmeis ouk esmen adokimoi',
   '''I trust'' (elpizō — I hope, I confidently expect). ''Ye shall know'' (gnōsesthe — future tense; you will come to recognize). ''We are not reprobates'' (ouk esmen adokimoi — we are not disapproved/counterfeit). Paul''s confidence in his own genuineness is understated: he does not say ''I know'' but ''I hope you will know.'' If the Corinthians genuinely examine themselves and find Christ in them, they must acknowledge that the one who brought them to Christ is likewise approved.',
   NULL),
  (7, 'Now I pray to God that ye do no evil; not that we should appear approved, but that ye should do that which is honest, though we be as reprobates.',
   'εὐχόμεθα δὲ πρὸς τὸν θεὸν μὴ ποιῆσαι ὑμᾶς κακὸν μηδέν οὐχ ἵνα ἡμεῖς δόκιμοι φανῶμεν ἀλλ᾽ ἵνα ὑμεῖς τὸ καλὸν ποιῆτε ἡμεῖς δὲ ὡς ἀδόκιμοι ὦμεν',
   'euchometha de pros ton theon mē poiēsai hymas kakon mēden ouch hina hēmeis dokimoi phanōmen all hina hymeis to kalon poiēte hēmeis de hōs adokimoi ōmen',
   '''I pray'' (euchometha — we pray, earnestly wish). Paul''s pastoral heart shines: he would rather appear to have failed his ''test'' (adokimoi — unapproved) if it means the Corinthians are doing what is right. ''Not that we should appear approved'' — Paul cares nothing for vindication if they would simply live rightly. ''That which is honest'' (to kalon — the good, the noble, the beautiful). This is selfless pastoral love: Paul''s reputation is expendable if his flock flourishes.',
   NULL),
  (8, 'For we can do nothing against the truth, but for the truth.',
   'οὐ γὰρ δυνάμεθά τι κατὰ τῆς ἀληθείας ἀλλ᾽ ὑπὲρ τῆς ἀληθείας',
   'ou gar dynametha ti kata tēs alētheias all hyper tēs alētheias',
   '''Against the truth … for the truth'' (kata tēs alētheias … hyper tēs alētheias). A profound axiom: apostolic power cannot be wielded against God''s truth, only in its service. Paul cannot manipulate outcomes — his authority serves truth, not personal interests. This is a self-limiting principle of all legitimate spiritual authority: it operates within the bounds of God''s truth. ''We can do nothing'' (ou dynametha ti — we have no power, no ability whatsoever) — against truth, apostolic authority is impotent.',
   'This verse establishes a fundamental principle of ecclesiastical authority: all legitimate church authority is bounded by and subservient to divine truth. No leader, council, or institution can exercise authority against the truth — only for it.'),
  (9, 'For we are glad, when we are weak, and ye are strong: and this also we wish, even your perfection.',
   'χαίρομεν γὰρ ὅταν ἡμεῖς ἀσθενῶμεν ὑμεῖς δὲ δυνατοὶ ἦτε τοῦτο δὲ καὶ εὐχόμεθα τὴν ὑμῶν κατάρτισιν',
   'chairomen gar hotan hēmeis asthenōmen hymeis de dynatoi ēte touto de kai euchometha tēn hymōn katartisin',
   '''We are glad'' (chairomen — we rejoice). ''When we are weak'' — Paul''s weakness means he does not need to exercise disciplinary power. ''Ye are strong'' — their spiritual maturity makes discipline unnecessary. ''Your perfection'' (tēn hymōn katartisin — your being made complete, your restoration, your being fitted together). The noun katartisis appears only here in the NT. Its verb form (katartizō) means to mend, restore, equip — as in mending fishing nets (Matt 4:21). Paul''s deepest wish is not his own vindication but the Corinthians'' spiritual wholeness.',
   NULL),
  (10, 'Therefore I write these things being absent, lest being present I should use sharpness, according to the power which the Lord hath given me to edification, and not to destruction.',
   'διὰ τοῦτο ταῦτα ἀπὼν γράφω ἵνα παρὼν μὴ ἀποτόμως χρήσωμαι κατὰ τὴν ἐξουσίαν ἣν ἔδωκέν μοι ὁ κύριος εἰς οἰκοδομὴν καὶ οὐκ εἰς καθαίρεσιν',
   'dia touto tauta apōn graphō hina parōn mē apotomōs chrēsōmai kata tēn exousian hēn edōken moi ho kyrios eis oikodomēn kai ouk eis kathairesin',
   '''Sharpness'' (apotomōs — severity, cutting harshness; from apo + temnō, to cut off). ''Edification'' (oikodomēn — building up, construction; from oikos + domeō, to build a house). ''Destruction'' (kathairesin — tearing down, demolition; the same word used for ''pulling down strongholds'' in 10:4). Paul writes sternly now so he won''t need to act sternly later. The purpose of apostolic authority (exousia) is constructive (oikodomē), not destructive (kathairesis). This principle bookends the ''defense'' section that began in 10:8 with the identical phrase.',
   'Apostolic authority — and by extension all church authority — is given for building up (edification), not tearing down. This principle governs all exercise of spiritual leadership: discipline serves restoration, not punishment.'),
  (11, 'Finally, brethren, farewell. Be perfect, be of good comfort, be of one mind, live in peace; and the God of love and peace shall be with you.',
   'λοιπόν ἀδελφοί χαίρετε καταρτίζεσθε παρακαλεῖσθε τὸ αὐτὸ φρονεῖτε εἰρηνεύετε καὶ ὁ θεὸς τῆς ἀγάπης καὶ εἰρήνης ἔσται μεθ᾽ ὑμῶν',
   'loipon adelphoi chairete katartizesthe parakaleisthe to auto phroneite eirēneuete kai ho theos tēs agapēs kai eirēnēs estai meth hymōn',
   '''Farewell'' (chairete — literally ''rejoice!''; the same word can mean either greeting or farewell). Five rapid imperatives: (1) chairete — rejoice/farewell; (2) katartizesthe — be restored, be made complete (middle/passive: let yourselves be mended); (3) parakaleisthe — be encouraged, be comforted (the paraklēsis theme from chapter 1 returns); (4) to auto phroneite — think the same thing, be of one mind; (5) eirēneuete — live in peace. ''The God of love and peace'' — the only time this exact title appears in Scripture. The promise is conditional: if they pursue these five things, God''s loving, peaceful presence will be with them.',
   NULL),
  (12, 'Greet one another with an holy kiss.',
   'ἀσπάσασθε ἀλλήλους ἐν ἁγίῳ φιλήματι',
   'aspasasthe allēlous en hagiō philēmati',
   '''Holy kiss'' (hagiō philēmati) — a common early church greeting that expressed familial affection within the community of faith. Paul commands this in four epistles (Rom 16:16; 1 Cor 16:20; 2 Cor 13:12; 1 Thess 5:26). The adjective ''holy'' (hagiō) distinguishes this from ordinary social kissing — it is sanctified, set apart, expressing the bond of the Spirit. In a church torn by division, this command is particularly pointed: reconciliation must be expressed in tangible, physical gestures of love.',
   NULL),
  (13, 'All the saints salute you.',
   'ἀσπάζονται ὑμᾶς οἱ ἅγιοι πάντες',
   'aspazontai hymas hoi hagioi pantes',
   '''All the saints'' (hoi hagioi pantes — literally ''the holy ones, all of them''). Paul writes from Macedonia (likely Philippi), and sends greetings from the Macedonian believers — the same ones whose extraordinary generosity he praised in chapters 8-9. The universal ''all'' emphasizes that the whole church stands united and sends its love to Corinth. ''Saints'' (hagioi) is Paul''s standard term for believers — those set apart by God, not those who have achieved moral perfection.',
   NULL),
  (14, 'The grace of the Lord Jesus Christ, and the love of God, and the communion of the Holy Ghost, be with you all. Amen.',
   'ἡ χάρις τοῦ κυρίου Ἰησοῦ Χριστοῦ καὶ ἡ ἀγάπη τοῦ θεοῦ καὶ ἡ κοινωνία τοῦ ἁγίου πνεύματος μετὰ πάντων ὑμῶν ἀμήν',
   'hē charis tou kyriou Iēsou Christou kai hē agapē tou theou kai hē koinōnia tou hagiou pneumatos meta pantōn hymōn amēn',
   'The fullest trinitarian benediction in the New Testament. Three persons named with three distinct attributes: (1) ''the grace of the Lord Jesus Christ'' — grace (charis) is appropriated to Christ, who ''though he was rich, yet for your sakes he became poor'' (8:9); (2) ''the love of God'' — agapē is appropriated to the Father, the source of all love (Rom 5:8); (3) ''the communion of the Holy Ghost'' — koinōnia (fellowship, sharing, participation) is appropriated to the Spirit, who creates the community of believers and binds them together. The order — Christ, God, Spirit — is notable: Paul begins with the believer''s point of contact (grace through Christ), then moves to its source (the Father''s love), then its ongoing reality (the Spirit''s fellowship). This benediction has been used in Christian worship continuously for nearly two thousand years.',
   'This verse is the strongest implicit trinitarian statement in the Pauline corpus. Three distinct persons are named, each with a definite article (hē charis, hē agapē, hē koinōnia), each performing a distinct role, yet united in a single blessing. While the word ''Trinity'' does not appear in Scripture, the trinitarian structure of this benediction — and its equation of Christ and the Spirit with God — demonstrates that the earliest Christian communities worshipped and invoked Father, Son, and Spirit together as the one God.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 13;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πειράζω', 'peirazō', 'G3985', 'To test, try, put to proof, tempt — used of testing to reveal character or genuineness. In v.5 Paul commands the Corinthians to test themselves (peirazete heautous) to see if they are truly in the faith. The word carries the sense of rigorous examination that may expose failure.', 1),
  ('δοκιμάζω', 'dokimazō', 'G1381', 'To prove by testing, examine, approve after testing — used of assaying metals. In v.5 Paul uses this alongside peirazō: first test (peirazō) yourselves, then prove (dokimazō) yourselves. The second word implies testing with the expectation of finding genuine quality.', 2),
  ('ἀδόκιμος', 'adokimos', 'G96', 'Unapproved, rejected after testing, counterfeit, reprobate — literally ''un-tested'' or ''failing the test.'' The opposite of dokimos (approved). Used in vv.5-7 three times. If Christ is not in a person, they are adokimos — they fail the test of genuine faith. The imagery is of counterfeit coins rejected by the assayer.', 3),
  ('κατάρτισις', 'katartisis', 'G2676', 'Restoration, completion, being made complete, being fitted together — a NT hapax (only here in v.9). Its verb form katartizō means to mend nets (Matt 4:21), restore a fallen brother (Gal 6:1), or equip saints for ministry (Eph 4:12). Paul''s deepest wish for the Corinthians is their full spiritual restoration and wholeness.', 4),
  ('κοινωνία', 'koinōnia', 'G2842', 'Fellowship, communion, sharing, participation, partnership — from koinos (common, shared). In v.14 attributed to the Holy Spirit: the Spirit creates and sustains the shared life of believers. Koinōnia is not mere social fellowship but deep spiritual participation in a common reality — sharing together in the life of God through the Spirit.', 5),
  ('ἀποτόμως', 'apotomōs', 'G664', 'Severely, sharply, with cutting harshness — from apo (off) + temnō (to cut). Used only here and Titus 1:13 in the NT. Paul writes firmly in his letter so that when present he will not need to act with surgical severity. The word conveys decisive, cutting action — spiritual authority exercised as a last resort.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 13
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 5
    WHEN 2 THEN 5
    WHEN 3 THEN 5
    WHEN 4 THEN 9
    WHEN 5 THEN 14
    WHEN 6 THEN 10
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Deuteronomy 19:15', 1),
  (1, 'Matthew 18:16', 2),
  (1, '1 Timothy 5:19', 3),
  (2, '2 Corinthians 1:23', 4),
  (2, '2 Corinthians 10:11', 5),
  (3, '1 Corinthians 9:2', 6),
  (3, '2 Corinthians 3:2-3', 7),
  (4, 'Romans 6:4', 8),
  (4, 'Philippians 2:7-8', 9),
  (4, '1 Corinthians 1:23-25', 10),
  (4, '2 Corinthians 12:9-10', 11),
  (5, '1 Corinthians 11:28', 12),
  (5, 'Romans 8:10', 13),
  (5, 'Galatians 4:19', 14),
  (5, 'Colossians 1:27', 15),
  (7, '2 Corinthians 12:19-20', 16),
  (8, 'Numbers 23:19-20', 17),
  (9, '2 Corinthians 12:9', 18),
  (9, 'Ephesians 4:12', 19),
  (10, '2 Corinthians 10:8', 20),
  (10, '1 Corinthians 4:21', 21),
  (11, 'Romans 15:5-6', 22),
  (11, 'Philippians 2:2', 23),
  (11, 'Philippians 4:9', 24),
  (12, 'Romans 16:16', 25),
  (12, '1 Thessalonians 5:26', 26),
  (14, 'Matthew 28:19', 27),
  (14, '1 Corinthians 12:4-6', 28),
  (14, 'Ephesians 4:4-6', 29),
  (14, '1 Peter 1:2', 30)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 13
  AND v.verse_number = cr.verse_number;
