-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 13 — The Supremacy of Love
-- 13 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 13,
  'First Corinthians 13 is the ''more excellent way'' announced in 12:31 — not an alternative to spiritual gifts but the indispensable context in which gifts must operate. Often read as a standalone poem on love, the chapter is inseparable from its context: the Corinthians'' misuse of spiritual gifts. Paul presents love (agapē) in three movements. First, the indispensability of love (vv.1-3): without love, the most spectacular gifts — tongues of men and angels, prophecy, mountain-moving faith, even martyrdom — are nothing. ''I am become as sounding brass, or a tinkling cymbal'' (v.1). Second, the characteristics of love (vv.4-7): fifteen descriptions, mostly negative — what love does not do. ''Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up'' (v.4). Love ''beareth all things, believeth all things, hopeth all things, endureth all things'' (v.7). Third, the permanence of love (vv.8-13): ''Charity never faileth'' (v.8). Prophecies, tongues, and knowledge will cease — they are partial and temporary. ''When that which is perfect is come, then that which is in part shall be done away'' (v.10). Paul uses the metaphor of growing up: ''When I was a child, I spake as a child... when I became a man, I put away childish things'' (v.11). Now we see ''through a glass, darkly; but then face to face'' (v.12). The climax: ''And now abideth faith, hope, charity, these three; but the greatest of these is charity'' (v.13). Love outlasts all spiritual gifts and transcends even faith and hope because in eternity, when faith becomes sight and hope becomes reality, love alone will continue forever.',
  'The More Excellent Way — Love Never Faileth',
  'ἀγάπη (agapē)',
  'Love — the distinctly Christian word for selfless, sacrificial, unconditional love. Unlike erōs (romantic desire) or philia (friendship affection), agapē is deliberate, other-directed love that seeks the highest good of the beloved regardless of their response. Agapē is not a feeling but a commitment; not an emotion but an action. It is the character of God himself (1 John 4:8) and the supreme virtue of the Christian life — greater even than faith and hope.',
  '["The Indispensability of Love (vv.1-3): Though I speak with the tongues of men and of angels and have not charity I am become as sounding brass or a tinkling cymbal. And though I have the gift of prophecy and understand all mysteries and all knowledge and though I have all faith so that I could remove mountains and have not charity I am nothing. And though I bestow all my goods to feed the poor and though I give my body to be burned and have not charity it profiteth me nothing","The Characteristics of Love (vv.4-7): Charity suffereth long and is kind charity envieth not charity vaunteth not itself is not puffed up doth not behave itself unseemly seeketh not her own is not easily provoked thinketh no evil rejoiceth not in iniquity but rejoiceth in the truth beareth all things believeth all things hopeth all things endureth all things","The Permanence of Love (vv.8-13): Charity never faileth but whether there be prophecies they shall fail whether there be tongues they shall cease whether there be knowledge it shall vanish away. For we know in part and we prophesy in part but when that which is perfect is come then that which is in part shall be done away. For now we see through a glass darkly but then face to face now I know in part but then shall I know even as also I am known. And now abideth faith hope charity these three but the greatest of these is charity"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 13 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Though I speak with the tongues of men and of angels, and have not charity, I am become as sounding brass, or a tinkling cymbal.',
   'ἐὰν ταῖς γλώσσαις τῶν ἀνθρώπων λαλῶ καὶ τῶν ἀγγέλων ἀγάπην δὲ μὴ ἔχω γέγονα χαλκὸς ἠχῶν ἢ κύμβαλον ἀλαλάζον',
   'ean tais glōssais tōn anthrōpōn lalō kai tōn angelōn agapēn de mē echō gegona chalkos ēchōn ē kymbalon alalazon',
   '''Tongues of men and of angels'' — the highest conceivable eloquence, whether human or heavenly. ''Charity'' (agapēn — love). ''Sounding brass'' (chalkos ēchōn — echoing bronze). ''Tinkling cymbal'' (kymbalon alalazon — a clanging cymbal). Without love, even angelic speech becomes mere noise — impressive sound without content or value. The Corinthians prized tongues above all; Paul says without love, tongues are empty din.',
   'Paul begins with the Corinthians'' most prized gift — tongues — and declares it worthless without love. This is devastating to a church that elevated tongues as the supreme spiritual experience. The comparison to ''sounding brass'' and ''tinkling cymbal'' evokes the noisy percussion instruments used in pagan worship at Corinth. Without love, charismatic speech is indistinguishable from pagan religious noise. The gift is real, but without love as its animating principle, it produces only sound, not substance.'),
  (2, 'And though I have the gift of prophecy, and understand all mysteries, and all knowledge; and though I have all faith, so that I could remove mountains, and have not charity, I am nothing.',
   'καὶ ἐὰν ἔχω προφητείαν καὶ εἰδῶ τὰ μυστήρια πάντα καὶ πᾶσαν τὴν γνῶσιν καὶ ἐὰν ἔχω πᾶσαν τὴν πίστιν ὥστε ὄρη μεθιστάνειν ἀγάπην δὲ μὴ ἔχω οὐδέν εἰμι',
   'kai ean echō prophēteian kai eidō ta mystēria panta kai pasan tēn gnōsin kai ean echō pasan tēn pistin hōste orē methistanein agapēn de mē echō ouden eimi',
   '''Prophecy... mysteries... knowledge... faith'' — Paul escalates: the highest intellectual and spiritual achievements. ''Remove mountains'' (orē methistanein — to transplant mountains; cf. Matthew 17:20). ''I am nothing'' (ouden eimi — I am a zero, a nonentity). Not ''I have nothing'' but ''I am nothing.'' Without love, the most gifted person is reduced to a cipher. The gifts are genuine — prophecy, knowledge, faith — but without love, the person wielding them is nothing.',
   NULL),
  (3, 'And though I bestow all my goods to feed the poor, and though I give my body to be burned, and have not charity, it profiteth me nothing.',
   'καὶ ἐὰν ψωμίσω πάντα τὰ ὑπάρχοντά μου καὶ ἐὰν παραδῶ τὸ σῶμά μου ἵνα καυθήσωμαι ἀγάπην δὲ μὴ ἔχω οὐδὲν ὠφελοῦμαι',
   'kai ean psōmisō panta ta hyparchonta mou kai ean paradō to sōma mou hina kauthēsōmai agapēn de mē echō ouden ōpheloumai',
   '''Bestow all my goods'' (psōmisō panta — feed out morsel by morsel, distribute everything). ''Give my body to be burned'' (paradō to sōma mou hina kauthēsōmai — surrender my body to the flames; martyrdom). ''It profiteth me nothing'' (ouden ōpheloumai — I gain nothing). Even the most extreme sacrifice — total self-impoverishment and martyrdom — profits nothing without love. The motive determines the value. Loveless generosity and loveless martyrdom are empty gestures.',
   'This is Paul''s most radical statement about love''s indispensability. Even sacrificial actions that appear supremely loving — giving away everything, offering one''s body for burning — are worthless if not motivated by genuine agapē. This exposes the possibility of outward religiosity without inward reality: one can perform the most heroic acts of self-denial for reasons other than love — pride, guilt, a desire to impress, religious compulsion. Only agapē validates sacrifice. The cross itself is meaningful because it was motivated by love (Galatians 2:20; Ephesians 5:2).'),
  (4, 'Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up,',
   'ἡ ἀγάπη μακροθυμεῖ χρηστεύεται ἡ ἀγάπη οὐ ζηλοῖ ἡ ἀγάπη οὐ περπερεύεται οὐ φυσιοῦται',
   'hē agapē makrothymei chrēsteuetai hē agapē ou zēloi hē agapē ou perpereuetai ou physiotai',
   '''Suffereth long'' (makrothymei — is patient, endures provocation without retaliation). ''Is kind'' (chrēsteuetai — shows kindness, acts graciously). ''Envieth not'' (ou zēloi — does not burn with jealousy). ''Vaunteth not'' (ou perpereuetai — does not boast, is not a braggart; used only here in the NT). ''Not puffed up'' (ou physiotai — not inflated; the Corinthians'' favourite vice, cf. 4:6, 18; 5:2; 8:1). Two positive attributes followed by two negatives. Each quality directly addresses a Corinthian failing.',
   NULL),
  (5, 'Doth not behave itself unseemly, seeketh not her own, is not easily provoked, thinketh no evil;',
   'οὐκ ἀσχημονεῖ οὐ ζητεῖ τὰ ἑαυτῆς οὐ παροξύνεται οὐ λογίζεται τὸ κακόν',
   'ouk aschēmonei ou zētei ta heautēs ou paroxynetai ou logizetai to kakon',
   '''Behave unseemly'' (aschēmonei — act indecently, dishonourably; cf. 7:36). ''Seeketh not her own'' (ou zētei ta heautēs — does not pursue self-interest; cf. 10:24, 33). ''Not easily provoked'' (ou paroxynetai — is not irritated, not stirred to sharp anger). ''Thinketh no evil'' (ou logizetai to kakon — does not keep an account of wrongs; an accounting term: love does not maintain a ledger of grievances). Four more negatives, each targeting the self-centred behavior destroying Corinthian fellowship.',
   NULL),
  (6, 'Rejoiceth not in iniquity, but rejoiceth in the truth;',
   'οὐ χαίρει ἐπὶ τῇ ἀδικίᾳ συγχαίρει δὲ τῇ ἀληθείᾳ',
   'ou chairei epi tē adikia synchairei de tē alētheia',
   '''Rejoiceth not in iniquity'' (ou chairei epi tē adikia — finds no pleasure in unrighteousness). ''Rejoiceth in the truth'' (synchairei tē alētheia — co-rejoices with the truth). Love takes no pleasure when evil triumphs — even when it happens to an enemy. Love''s joy is aligned with truth: it celebrates when truth prevails, when justice is done, when righteousness advances. Love and truth are inseparable companions.',
   NULL),
  (7, 'Beareth all things, believeth all things, hopeth all things, endureth all things.',
   'πάντα στέγει πάντα πιστεύει πάντα ἐλπίζει πάντα ὑπομένει',
   'panta stegei panta pisteuei panta elpizei panta hypomenei',
   '''Beareth all things'' (panta stegei — covers, protects, supports; from stegō, to cover like a roof). ''Believeth all things'' (panta pisteuei — not gullibility but the readiness to believe the best about others, giving the benefit of the doubt). ''Hopeth all things'' (panta elpizei — maintains hope even in dark circumstances). ''Endureth all things'' (panta hypomenei — perseveres, stands firm under pressure). Four ''all things'' (panta) — love''s scope is unlimited. It bears without breaking, trusts without cynicism, hopes without despair, endures without quitting.',
   'These four ''all things'' statements describe love''s inexhaustible resilience. Love is not fragile; it is the most durable force in the universe. ''Beareth'' — love protects and shields. ''Believeth'' — love is not naive but refuses cynicism; it extends trust. ''Hopeth'' — love does not give up on people or situations. ''Endureth'' — love withstands pressure without crumbling. Each ''all things'' is comprehensive: there is no situation in which love stops bearing, believing, hoping, or enduring. This is why love ''never faileth'' (v.8).'),
  (8, 'Charity never faileth: but whether there be prophecies, they shall fail; whether there be tongues, they shall cease; whether there be knowledge, it shall vanish away.',
   'ἡ ἀγάπη οὐδέποτε ἐκπίπτει εἴτε δὲ προφητεῖαι καταργηθήσονται εἴτε γλῶσσαι παύσονται εἴτε γνῶσις καταργηθήσεται',
   'hē agapē oudepote ekpiptei eite de prophēteiai katargēthēsontai eite glōssai pausontai eite gnōsis katargēthēsetai',
   '''Never faileth'' (oudepote ekpiptei — never falls, never collapses, never becomes obsolete). ''Prophecies shall fail'' (katargēthēsontai — will be rendered inoperative, abolished). ''Tongues shall cease'' (pausontai — will stop on their own; middle voice: will cease of themselves). ''Knowledge shall vanish away'' (katargēthēsetai — will be made useless). Love is permanent; gifts are temporary. Prophecy, tongues, and knowledge — the three gifts the Corinthians most prized — will all end. Only love endures into eternity.',
   'This verse begins the argument for love''s permanence versus gifts'' temporality. Three gifts are singled out: prophecy, tongues, and knowledge — precisely the gifts the Corinthians overvalued. All three will end. The middle voice for tongues (pausontai — ''will cease of themselves'') is significant: tongues have an inherent expiration date. The passive for prophecy and knowledge (katargēthēsontai — ''will be abolished'') suggests they will be actively superseded. Love alone never becomes obsolete because love is the nature of God himself.'),
  (9, 'For we know in part, and we prophesy in part.',
   'ἐκ μέρους γὰρ γινώσκομεν καὶ ἐκ μέρους προφητεύομεν',
   'ek merous gar ginōskomen kai ek merous prophēteuomen',
   '''In part'' (ek merous — partially, incompletely). Both knowledge and prophecy are fragmentary in this present age. We do not know exhaustively; we do not prophesy comprehensively. These gifts are genuine but partial — they give us pieces of the puzzle, not the complete picture. Their partiality is the reason they will eventually be superseded.',
   NULL),
  (10, 'But when that which is perfect is come, then that which is in part shall be done away.',
   'ὅταν δὲ ἔλθῃ τὸ τέλειον τὸ ἐκ μέρους καταργηθήσεται',
   'hotan de elthē to teleion to ek merous katargēthēsetai',
   '''That which is perfect'' (to teleion — the complete, the mature, the fully developed). ''Done away'' (katargēthēsetai — abolished, superseded). ''The perfect'' is debated: (a) the completed NT canon; (b) the maturity of the church; (c) the return of Christ and the eternal state. Context favours (c): the ''face to face'' encounter of v.12 and the contrast between present partial knowledge and future complete knowledge point to the eschatological consummation. When Christ returns and we see him face to face, partial gifts will be superseded by complete reality.',
   'The identification of ''that which is perfect'' (to teleion) is one of the most debated interpretive questions in this chapter. Three main views: (1) The completed canon of Scripture — when the NT was completed, revelatory gifts ceased; (2) The maturity of the church — gifts will cease when the church reaches spiritual adulthood; (3) The second coming of Christ — gifts cease when the perfect reality arrives at Christ''s return. The context strongly supports (3): v.12''s ''face to face'' vision (cf. 1 John 3:2), the contrast between ''now'' and ''then,'' and the parallel with ''knowing as I am known'' all point to the eschatological consummation when believers will see Christ directly.'),
  (11, 'When I was a child, I spake as a child, I understood as a child, I thought as a child: but when I became a man, I put away childish things.',
   'ὅτε ἤμην νήπιος ἐλάλουν ὡς νήπιος ἐφρόνουν ὡς νήπιος ἐλογιζόμην ὡς νήπιος ὅτε δὲ γέγονα ἀνήρ κατήργηκα τὰ τοῦ νηπίου',
   'hote ēmēn nēpios elaloun hōs nēpios ephronoun hōs nēpios elogizomēn hōs nēpios hote de gegona anēr katērgēka ta tou nēpiou',
   '''Child'' (nēpios — an infant, one who cannot yet speak). ''Spake... understood... thought'' (elaloun... ephronoun... elogizomēn — speech, mindset, reasoning). ''Put away childish things'' (katērgēka ta tou nēpiou — I have done away with the things of infancy). The analogy: childhood is not wrong; it is a stage that is naturally superseded by maturity. Spiritual gifts are the childhood experience of the church; the eschatological fullness is adulthood. When maturity arrives, the means of childhood are no longer needed.',
   NULL),
  (12, 'For now we see through a glass, darkly; but then face to face: now I know in part; but then shall I know even as also I am known.',
   'βλέπομεν γὰρ ἄρτι δι᾿ ἐσόπτρου ἐν αἰνίγματι τότε δὲ πρόσωπον πρὸς πρόσωπον ἄρτι γινώσκω ἐκ μέρους τότε δὲ ἐπιγνώσομαι καθὼς καὶ ἐπεγνώσθην',
   'blepomen gar arti di esoptrou en ainigmati tote de prosōpon pros prosōpon arti ginōskō ek merous tote de epignōsomai kathōs kai epegnōsthēn',
   '''Through a glass'' (di esoptrou — through a mirror; ancient mirrors were polished bronze, giving a dim, distorted reflection). ''Darkly'' (en ainigmati — in a riddle, enigmatically). ''Face to face'' (prosōpon pros prosōpon — the language of direct, unmediated encounter; cf. Numbers 12:8 of Moses speaking with God). ''Know as I am known'' (epignōsomai kathōs epegnōsthēn — I shall fully know, even as I have been fully known). Present knowledge is mediated and partial; future knowledge will be direct and complete. We will know God as intimately as God now knows us.',
   'This verse contains one of the most beautiful contrasts in all of Scripture. The ''now'' vs. ''then'' structure: now we see through a dim mirror; then we shall see face to face. Now we know partially; then we shall know fully. Corinth was famous for its bronze mirrors — the Corinthians knew that mirror images were imperfect reflections. Our present knowledge of God, even through Scripture and the Spirit, is real but indirect, like a reflection. In the age to come, the reflection will give way to direct vision. ''Know as I am known'' is staggering: our knowledge of God will be as intimate and personal as God''s knowledge of us. Not omniscient, but personal, direct, and unmediated.'),
  (13, 'And now abideth faith, hope, charity, these three; but the greatest of these is charity.',
   'νυνὶ δὲ μένει πίστις ἐλπίς ἀγάπη τὰ τρία ταῦτα μείζων δὲ τούτων ἡ ἀγάπη',
   'nyni de menei pistis elpis agapē ta tria tauta meizōn de toutōn hē agapē',
   '''Now abideth'' (nyni menei — now remains; this ''now'' may be temporal: ''in this present age'' or logical: ''as things stand''). ''Faith, hope, charity'' — the famous triad that appears repeatedly in Paul (Romans 5:1-5; Galatians 5:5-6; Colossians 1:4-5; 1 Thessalonians 1:3; 5:8). ''The greatest'' (meizōn — the greatest, the most significant). Why is love the greatest? Because love is the nature of God himself (1 John 4:8, 16). Faith will become sight; hope will become reality; but love will continue forever — it is the eternal attribute.',
   'This is the climax of the chapter and one of the most memorable verses in the Bible. The triad faith-hope-love outlines the essential shape of Christian existence. But love is ''the greatest'' for several reasons: (1) Love is the nature of God — ''God is love'' (1 John 4:8); faith and hope are not divine attributes in the same way. (2) Love outlasts faith and hope — when we see Christ face to face, faith will become sight and hope will become possession, but love will continue eternally. (3) Love is the context that makes faith and hope meaningful — faith without love is empty (v.2); hope without love is mere optimism. (4) Love is the ''more excellent way'' (12:31) in which all gifts must operate. Love is not one virtue among many; it is the supreme virtue that gives all others their value.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 13;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 charity/love
  ('ἀγάπη', 'agapē', 'G26', 'Love — the distinctly Christian word for selfless, sacrificial, other-directed love. In secular Greek, agapē was rare and colourless; the NT fills it with theological content drawn from God''s own character and Christ''s self-giving death. Agapē is not an emotion but a disposition of the will: the deliberate choice to seek another''s highest good. It is the nature of God (1 John 4:8), the motivation behind the cross (John 3:16), and the supreme Christian virtue — greater than faith and hope.', 1),
  -- v.4 suffereth long
  ('μακροθυμέω', 'makrothymeō', 'G3114', 'To be long-tempered, patient, slow to anger — from makros (long) + thymos (passion, anger). The opposite of short-tempered. Makrothymia is the quality of bearing with difficult people over a long period without retaliation. It is an attribute of God himself (Romans 2:4; 2 Peter 3:9) who ''is longsuffering to us-ward, not willing that any should perish.'' In Paul''s list, makrothymeō comes first — patience is love''s primary expression.', 2),
  -- v.4 puffed up
  ('φυσιόω', 'physioō', 'G5448', 'To puff up, inflate with pride — from physa (a bellows). Love is not inflated with self-importance. This word is Paul''s favourite diagnosis of the Corinthian disease: it appears 6 times in 1 Corinthians (4:6, 18, 19; 5:2; 8:1; 13:4) and only once in all his other letters. The Corinthians were puffed up about their knowledge (8:1), their gifts, and their spiritual status. Love is the antidote to this inflation: it deflates the ego.', 3),
  -- v.5 thinketh no evil
  ('λογίζομαι', 'logizomai', 'G3049', 'To reckon, calculate, count, credit — an accounting term for entering an item in a ledger. ''Thinketh no evil'' (ou logizetai to kakon) literally means ''does not keep a record of wrongs.'' Love does not maintain a mental ledger of offenses received. It does not catalogue grievances for future reference. Each wrong is processed and released, not stored and compounded. This is the accountant''s antithesis: love keeps books on others'' virtues, not their failures.', 4),
  -- v.7 endureth
  ('ὑπομένω', 'hypomenō', 'G5278', 'To endure, remain under, persevere — from hypo (under) + menō (to remain). To stay in place under pressure rather than fleeing. Hypomenō is the courage to stand firm when everything within screams ''run.'' It is the marathon runner''s quality, not the sprinter''s. Love endures ''all things'' (panta) — there is no pressure, no suffering, no disappointment that can exhaust love''s capacity to endure. This is why love ''never faileth'' (v.8).', 5),
  -- v.8 never faileth
  ('ἐκπίπτω', 'ekpiptō', 'G1601', 'To fall out, drop away, lose effectiveness, become obsolete — from ek (out) + piptō (to fall). Love never falls from its position; it never drops out of relevance; it never expires. Prophecy will be superseded; tongues will stop; knowledge will be rendered obsolete — but love will never lose its power, its relevance, or its necessity. Love is the one eternal constant in God''s universe because God himself is love.', 6),
  -- v.12 glass/mirror
  ('ἔσοπτρον', 'esoptron', 'G2072', 'Mirror — from eis (into) + optron (a viewer). Ancient mirrors were polished metal (usually bronze), producing a real but imperfect reflection. Corinth was famous for its bronze mirrors. Paul uses the mirror as a metaphor for our present knowledge of God: real but indirect, genuine but distorted. ''Darkly'' (en ainigmati — in a riddle) adds another layer: we see truly but obscurely. The eschatological promise is ''face to face'' — the mirror replaced by direct vision.', 7),
  -- v.13 greatest
  ('μείζων', 'meizōn', 'G3187', 'Greater, largest, most important — the comparative of megas (great). Love is meizōn — greater than faith and hope. This does not diminish faith and hope (both are essential and enduring) but establishes love as the supreme virtue. Love is greater because (1) it is God''s own nature; (2) it will outlast faith and hope when they are fulfilled in eternity; (3) it is the context that makes all other virtues and gifts meaningful. Without love, even faith and hope are empty.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 13
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 4
    WHEN 3 THEN 4
    WHEN 4 THEN 5
    WHEN 5 THEN 7
    WHEN 6 THEN 8
    WHEN 7 THEN 12
    WHEN 8 THEN 13
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 tongues without love
  (1, '1 Corinthians 14:1', 1),
  -- v.2 faith to move mountains
  (2, 'Matthew 17:20', 2),
  (2, 'Matthew 21:21', 3),
  -- v.3 give body to be burned
  (3, 'Daniel 3:16-18', 4),
  -- v.4 love is patient
  (4, 'Romans 2:4', 5),
  (4, '2 Peter 3:9', 6),
  -- v.4 not puffed up
  (4, '1 Corinthians 8:1', 7),
  -- v.5 seeketh not her own
  (5, '1 Corinthians 10:24', 8),
  (5, 'Philippians 2:4', 9),
  -- v.7 beareth all things
  (7, '1 Peter 4:8', 10),
  (7, 'Proverbs 10:12', 11),
  -- v.8 love never faileth
  (8, 'Romans 8:35-39', 12),
  -- v.10 when perfect is come
  (10, '1 John 3:2', 13),
  (10, 'Revelation 21:3-4', 14),
  -- v.12 face to face
  (12, 'Numbers 12:8', 15),
  (12, '2 Corinthians 3:18', 16),
  (12, '2 Corinthians 5:7', 17),
  -- v.12 know as I am known
  (12, 'Galatians 4:9', 18),
  -- v.13 faith hope love triad
  (13, '1 Thessalonians 1:3', 19),
  (13, '1 Thessalonians 5:8', 20),
  (13, 'Colossians 1:4-5', 21),
  -- v.13 greatest is love
  (13, '1 John 4:8', 22),
  (13, '1 John 4:16', 23),
  (13, 'Romans 13:10', 24)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 13
  AND v.verse_number = cr.verse_number;
