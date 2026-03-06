-- ═══════════════════════════════════════════════════
-- 1 JOHN CHAPTER 3 — Children of God and the Test of Love
-- 24 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  '1 John 3 opens with one of the most breathtaking declarations in Scripture: ''Behold, what manner of love the Father hath bestowed upon us, that we should be called the sons of God'' (v.1). When Christ appears, ''we shall be like him; for we shall see him as he is'' (v.2) — and this hope motivates present purification (v.3). John then draws a sharp line between the children of God and the children of the devil: ''Whosoever is born of God doth not commit sin; for his seed remaineth in him'' (v.9). The contrast is absolute in principle: habitual, unrepentant sin is incompatible with the new birth. The message ''from the beginning'' is love (v.11), and Cain is the negative example — a murderer whose works were evil (v.12). The world''s hatred toward believers is expected (v.13). Hatred is murder (v.15). Love is defined not by sentiment but by sacrifice: ''Hereby perceive we the love of God, because he laid down his life for us: and we ought to lay down our lives for the brethren'' (v.16). Practical love means sharing material goods with those in need (vv.17-18). The chapter closes with assurance: ''hereby we know that we are of the truth, and shall assure our hearts before him'' (v.19), and the indwelling Spirit confirms our standing (v.24).',
  'The Children of God — Righteousness, Love, and Assurance',
  'τέκνα θεοῦ (tekna theou)',
  'Children of God — from teknon (child, one born) + theos (God). Not merely subjects of a king but born children of a Father. The relationship is intimate, permanent, and transformative: God''s children bear His family likeness in righteousness and love.',
  '["Behold What Manner of Love — Children of God (vv.1-3): Behold what manner of love the Father hath bestowed upon us that we should be called the sons of God; therefore the world knoweth us not because it knew him not; beloved now are we the sons of God and it doth not yet appear what we shall be but we know that when he shall appear we shall be like him for we shall see him as he is; every man that hath this hope in him purifieth himself even as he is pure","Sin and the Children of the Devil (vv.4-10): Whosoever committeth sin transgresseth also the law for sin is the transgression of the law; ye know that he was manifested to take away our sins; whosoever abideth in him sinneth not; he that committeth sin is of the devil; for this purpose the Son of God was manifested that he might destroy the works of the devil; whosoever is born of God doth not commit sin for his seed remaineth in him; in this the children of God are manifest and the children of the devil","Love One Another — The Message from the Beginning (vv.11-18): This is the message that ye heard from the beginning that we should love one another; not as Cain who was of that wicked one and slew his brother; marvel not if the world hate you; we know that we have passed from death unto life because we love the brethren; hereby perceive we the love of God because he laid down his life for us; whoso hath this world''s good and shutteth up his bowels of compassion how dwelleth the love of God in him; let us not love in word but in deed and in truth","Assurance Before God (vv.19-24): Hereby we know that we are of the truth and shall assure our hearts before him; if our heart condemn us God is greater than our heart; beloved if our heart condemn us not then have we confidence toward God; whatsoever we ask we receive of him because we keep his commandments; this is his commandment that we should believe on the name of his Son Jesus Christ and love one another; he that keepeth his commandments dwelleth in him and he in him and hereby we know that he abideth in us by the Spirit which he hath given us"]'
FROM books b WHERE b.name = '1 John';

-- Step 2: Insert all 24 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Behold, what manner of love the Father hath bestowed upon us, that we should be called the sons of God: therefore the world knoweth us not, because it knew him not.',
   'Ἴδετε ποταπὴν ἀγάπην δέδωκεν ἡμῖν ὁ πατήρ ἵνα τέκνα θεοῦ κληθῶμεν καὶ ἐσμέν διὰ τοῦτο ὁ κόσμος οὐ γινώσκει ἡμᾶς ὅτι οὐκ ἔγνω αὐτόν',
   'Idete potapēn agapēn dedōken hēmin ho patēr hina tekna theou klēthōmen kai esmen dia touto ho kosmos ou ginōskei hēmas hoti ouk egnō auton',
   '''Behold'' (idete — see! look! an exclamation of wonder). ''What manner'' (potapēn — what kind of, what foreign, what extraordinary; originally meant ''from what country?'' — as if this love is so unusual it must come from another world). ''Bestowed'' (dedōken — has given; perfect tense: given as a permanent gift). ''Sons of God'' (tekna theou — children of God; tekna, born children, not merely adopted). ''And we are'' (kai esmen — and so we are! a triumphant addition: not merely called but actually are God''s children). The world does not recognise believers for the same reason it did not recognise Christ.',
   'Adoption as children of God: The love that makes sinners into God''s children is not merely pardoning love but transforming love. Believers are not just legally declared ''children'' — they are born of God (gegennētai, 2:29) and actually are His children (kai esmen). This love is so extraordinary (potapēn) that it seems to come from outside this world — because it does.'),
  (2,
   'Beloved, now are we the sons of God, and it doth not yet appear what we shall be: but we know that, when he shall appear, we shall be like him; for we shall see him as he is.',
   'Ἀγαπητοί νῦν τέκνα θεοῦ ἐσμεν καὶ οὔπω ἐφανερώθη τί ἐσόμεθα οἴδαμεν δὲ ὅτι ἐὰν φανερωθῇ ὅμοιοι αὐτῷ ἐσόμεθα ὅτι ὀψόμεθα αὐτὸν καθώς ἐστιν',
   'Agapētoi nyn tekna theou esmen kai oupō ephanerōthē ti esometha oidamen de hoti ean phanerōthē homoioi autō esometha hoti opsometha auton kathōs estin',
   '''Now'' (nyn — at this present moment; the emphasis: our status is current, not merely future). ''It doth not yet appear'' (oupō ephanerōthē — it has not yet been revealed). ''We shall be like him'' (homoioi autō esometha — we shall be similar to Him, conformed to His likeness). ''We shall see him as he is'' (opsometha auton kathōs estin — we shall see Him just as He is). The vision produces the transformation: seeing Christ as He is will complete our conformity to His image. What we shall ultimately become is beyond present comprehension — but it will be Christlike.',
   'Glorification: This verse teaches the doctrine of final glorification. Believers are already children of God (present tense), but the full glory of what they will become is not yet revealed. At Christ''s appearing, two things happen simultaneously: we see Him as He truly is, and we become like Him. The beatific vision and the completion of sanctification are one and the same event.'),
  (3,
   'And every man that hath this hope in him purifieth himself, even as he is pure.',
   'καὶ πᾶς ὁ ἔχων τὴν ἐλπίδα ταύτην ἐπ᾽ αὐτῷ ἁγνίζει ἑαυτόν καθὼς ἐκεῖνος ἁγνός ἐστιν',
   'kai pas ho echōn tēn elpida tautēn ep'' autō hagnizei heauton kathōs ekeinos hagnos estin',
   '''This hope'' (tēn elpida tautēn — this specific hope: the hope of seeing Christ and becoming like Him). ''Purifieth himself'' (hagnizei heauton — makes himself pure, cleanses himself; present tense: keeps on purifying). ''Even as he is pure'' (kathōs ekeinos hagnos estin — just as that One is pure). The standard of purity is Christ Himself. The hope of glorification is not a licence for passivity but a motivation for present holiness. If I shall one day be like Him, I should begin now to live like Him.',
   NULL),
  (4,
   'Whosoever committeth sin transgresseth also the law: for sin is the transgression of the law.',
   'Πᾶς ὁ ποιῶν τὴν ἁμαρτίαν καὶ τὴν ἀνομίαν ποιεῖ καὶ ἡ ἁμαρτία ἐστὶν ἡ ἀνομία',
   'Pas ho poiōn tēn hamartian kai tēn anomian poiei kai hē hamartia estin hē anomia',
   '''Committeth sin'' (ho poiōn tēn hamartian — the one who practises sin; present participle: habitual, characteristic action). ''Transgresseth the law'' (tēn anomian poiei — practises lawlessness). ''Sin is the transgression of the law'' (hē hamartia estin hē anomia — sin is lawlessness). John defines sin as anomia — not merely the violation of a specific rule but rebellion against God''s authority. Sin is fundamentally lawlessness: the refusal to submit to God''s revealed will.',
   NULL),
  (5,
   'And ye know that he was manifested to take away our sins; and in him is no sin.',
   'καὶ οἴδατε ὅτι ἐκεῖνος ἐφανερώθη ἵνα τὰς ἁμαρτίας ἡμῶν ἄρῃ καὶ ἁμαρτία ἐν αὐτῷ οὐκ ἔστιν',
   'kai oidate hoti ekeinos ephanerōthē hina tas hamartias hēmōn arē kai hamartia en autō ouk estin',
   '''Manifested'' (ephanerōthē — was revealed, appeared; the incarnation). ''Take away'' (arē — to lift, to carry away, to remove; from airō). Christ came for a specific purpose: to remove sins. ''In him is no sin'' (hamartia en autō ouk estin — sin in Him does not exist). Christ''s sinlessness qualifies Him to deal with sin. The sinless One came to take away the sins of the sinful.',
   NULL),
  (6,
   'Whosoever abideth in him sinneth not: whosoever sinneth hath not seen him, neither known him.',
   'πᾶς ὁ ἐν αὐτῷ μένων οὐχ ἁμαρτάνει πᾶς ὁ ἁμαρτάνων οὐχ ἑώρακεν αὐτὸν οὐδὲ ἔγνωκεν αὐτόν',
   'pas ho en autō menōn ouch hamartanei pas ho hamartanōn ouch heōraken auton oude egnōken auton',
   '''Abideth'' (menōn — remaining; present participle: the one who characteristically remains in Christ). ''Sinneth not'' (ouch hamartanei — does not practise sin; present tense: does not make sin a habit). ''Sinneth'' (ho hamartanōn — the one who habitually sins). ''Hath not seen him'' (ouch heōraken — has not seen with spiritual perception). ''Neither known him'' (oude egnōken — nor come to know him). John is not teaching sinless perfection (cf. 1:8-10) but distinguishing between habitual practice and occasional failure. The abiding believer does not make sin the pattern of life.',
   NULL),
  (7,
   'Little children, let no man deceive you: he that doeth righteousness is righteous, even as he is righteous.',
   'Τεκνία μηδεὶς πλανάτω ὑμᾶς ὁ ποιῶν τὴν δικαιοσύνην δίκαιός ἐστιν καθὼς ἐκεῖνος δίκαιός ἐστιν',
   'Teknia mēdeis planatō hymas ho poiōn tēn dikaiosynēn dikaios estin kathōs ekeinos dikaios estin',
   '''Let no man deceive you'' (mēdeis planatō — let no one lead you astray). ''Doeth righteousness'' (ho poiōn tēn dikaiosynēn — the one who practises righteousness). ''Is righteous'' (dikaios estin). ''Even as he is righteous'' (kathōs ekeinos dikaios estin — just as that One is righteous). The standard is again Christ. John opposes any teaching that separates spiritual status from moral practice. The righteous person is known by righteous deeds, not by claims or experiences.',
   NULL),
  (8,
   'He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of God was manifested, that he might destroy the works of the devil.',
   'ὁ ποιῶν τὴν ἁμαρτίαν ἐκ τοῦ διαβόλου ἐστίν ὅτι ἀπ᾽ ἀρχῆς ὁ διάβολος ἁμαρτάνει εἰς τοῦτο ἐφανερώθη ὁ υἱὸς τοῦ θεοῦ ἵνα λύσῃ τὰ ἔργα τοῦ διαβόλου',
   'ho poiōn tēn hamartian ek tou diabolou estin hoti ap'' archēs ho diabolos hamartanei eis touto ephanerōthē ho huios tou theou hina lysē ta erga tou diabolou',
   '''Committeth sin'' (ho poiōn tēn hamartian — the one who practises sin as a way of life). ''Of the devil'' (ek tou diabolou — from the devil, originating in the devil). ''From the beginning'' (ap'' archēs — from the start; the devil has been sinning since his original rebellion). ''Destroy'' (lysē — loose, dissolve, undo, break apart; from lyō). ''Works of the devil'' (ta erga tou diabolou — everything the devil has built: sin, death, deception, bondage). Christ was manifested to systematically dismantle Satan''s entire operation.',
   NULL),
  (9,
   'Whosoever is born of God doth not commit sin; for his seed remaineth in him: and he cannot sin, because he is born of God.',
   'Πᾶς ὁ γεγεννημένος ἐκ τοῦ θεοῦ ἁμαρτίαν οὐ ποιεῖ ὅτι σπέρμα αὐτοῦ ἐν αὐτῷ μένει καὶ οὐ δύναται ἁμαρτάνειν ὅτι ἐκ τοῦ θεοῦ γεγέννηται',
   'Pas ho gegennēmenos ek tou theou hamartian ou poiei hoti sperma autou en autō menei kai ou dynatai hamartanein hoti ek tou theou gegennētai',
   '''Born of God'' (gegennēmenos ek tou theou — having been begotten from God; perfect participle: born and remaining in that state). ''Doth not commit sin'' (hamartian ou poiei — does not practise sin). ''His seed'' (sperma autou — God''s seed; the divine life, the new nature implanted at the new birth). ''Remaineth'' (menei — abides permanently). ''Cannot sin'' (ou dynatai hamartanein — is not able to keep on sinning; the present infinitive indicates habitual action). The new nature implanted by God is incompatible with habitual sin. The ''seed'' of divine life makes continuous, unrepentant sin impossible for the genuinely born-again.',
   'The new birth and sin: John teaches that the new birth produces a fundamental change in nature. God''s ''seed'' — the divine life implanted at regeneration — remains in the believer and makes habitual, unrepentant sin impossible. This does not teach sinless perfection (1:8-10 says believers do sin) but that the born-again person cannot live in sin as a settled pattern. The new nature resists sin; the presence of ongoing, habitual sin raises the question of whether the new birth has occurred.'),
  (10,
   'In this the children of God are manifest, and the children of the devil: whosoever doeth not righteousness is not of God, neither he that loveth not his brother.',
   'ἐν τούτῳ φανερά ἐστιν τὰ τέκνα τοῦ θεοῦ καὶ τὰ τέκνα τοῦ διαβόλου πᾶς ὁ μὴ ποιῶν δικαιοσύνην οὐκ ἔστιν ἐκ τοῦ θεοῦ καὶ ὁ μὴ ἀγαπῶν τὸν ἀδελφὸν αὐτοῦ',
   'en toutō phanera estin ta tekna tou theou kai ta tekna tou diabolou pas ho mē poiōn dikaiosynēn ouk estin ek tou theou kai ho mē agapōn ton adelphon autou',
   '''Manifest'' (phanera — visible, evident, clear). ''Children of God ... children of the devil'' — John divides all humanity into two families with two fathers. The distinguishing marks are two: (1) practising righteousness and (2) loving one''s brother. The absence of either mark reveals a person''s true parentage. This verse is the hinge between the test of righteousness (vv.4-9) and the test of love (vv.11-18).',
   NULL),
  (11,
   'For this is the message that ye heard from the beginning, that we should love one another.',
   'ὅτι αὕτη ἐστὶν ἡ ἀγγελία ἣν ἠκούσατε ἀπ᾽ ἀρχῆς ἵνα ἀγαπῶμεν ἀλλήλους',
   'hoti hautē estin hē angelia hēn ēkousate ap'' archēs hina agapōmen allēlous',
   '''Message'' (angelia — announcement, the core message). ''From the beginning'' (ap'' archēs). ''Love one another'' (agapōmen allēlous — that we should love each other). This is the second time John calls something ''the message from the beginning'' (cf. 1:5, ''God is light''). The two are connected: if God is light, His children must walk in light; if God is love, His children must love. The command to love is not new theology but the original gospel.',
   NULL),
  (12,
   'Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.',
   'οὐ καθὼς Κάϊν ἐκ τοῦ πονηροῦ ἦν καὶ ἔσφαξεν τὸν ἀδελφὸν αὐτοῦ καὶ χάριν τίνος ἔσφαξεν αὐτόν ὅτι τὰ ἔργα αὐτοῦ πονηρὰ ἦν τὰ δὲ τοῦ ἀδελφοῦ αὐτοῦ δίκαια',
   'ou kathōs Kain ek tou ponērou ēn kai esphaxen ton adelphon autou kai charin tinos esphaxen auton hoti ta erga autou ponēra ēn ta de tou adelphou autou dikaia',
   '''Cain'' — the first murderer, the anti-type of love. ''Of that wicked one'' (ek tou ponērou — originating from the evil one, the devil). ''Slew'' (esphaxen — slaughtered, butchered; from sphazō, used of animal slaughter; a violent, savage word). ''Wherefore?'' — the motive: Cain''s works were evil, Abel''s righteous. Cain killed Abel not despite Abel''s righteousness but because of it. Righteousness provokes hatred in those aligned with evil.',
   NULL),
  (13,
   'Marvel not, my brethren, if the world hate you.',
   'μὴ θαυμάζετε ἀδελφοί μου εἰ μισεῖ ὑμᾶς ὁ κόσμος',
   'mē thaumazete adelphoi mou ei misei hymas ho kosmos',
   '''Marvel not'' (mē thaumazete — stop being surprised). ''The world hate you'' (misei hymas ho kosmos — the world hates you; present tense: continuous). Given the Cain principle (evil hates righteousness), the world''s hatred is not surprising but expected. Jesus said the same: ''If the world hate you, ye know that it hated me before it hated you'' (John 15:18).',
   NULL),
  (14,
   'We know that we have passed from death unto life, because we love the brethren. He that loveth not his brother abideth in death.',
   'ἡμεῖς οἴδαμεν ὅτι μεταβεβήκαμεν ἐκ τοῦ θανάτου εἰς τὴν ζωήν ὅτι ἀγαπῶμεν τοὺς ἀδελφούς ὁ μὴ ἀγαπῶν τὸν ἀδελφὸν μένει ἐν τῷ θανάτῳ',
   'hēmeis oidamen hoti metabebēkamen ek tou thanatou eis tēn zōēn hoti agapōmen tous adelphous ho mē agapōn ton adelphon menei en tō thanatō',
   '''Passed'' (metabebēkamen — have crossed over, have migrated; perfect tense: we have crossed and remain on the other side; from metabainō, to pass from one place to another). ''From death unto life'' (ek tou thanatou eis tēn zōēn — from the realm of death to the realm of life). ''Because we love the brethren'' (hoti agapōmen tous adelphous — the evidence of the crossing is love). ''Abideth in death'' (menei en tō thanatō — remains in death). Love for fellow believers is the subjective evidence of the new birth. Those who do not love remain in the sphere of spiritual death.',
   NULL),
  (15,
   'Whosoever hateth his brother is a murderer: and ye know that no murderer hath eternal life abiding in him.',
   'πᾶς ὁ μισῶν τὸν ἀδελφὸν αὐτοῦ ἀνθρωποκτόνος ἐστίν καὶ οἴδατε ὅτι πᾶς ἀνθρωποκτόνος οὐκ ἔχει ζωὴν αἰώνιον ἐν αὐτῷ μένουσαν',
   'pas ho misōn ton adelphon autou anthrōpoktonos estin kai oidate hoti pas anthrōpoktonos ouk echei zōēn aiōnion en autō menousan',
   '''Hateth'' (misōn — the one who hates; present participle: characteristically). ''Murderer'' (anthrōpoktonos — man-slayer, killer of human beings; the same word used of the devil in John 8:44). Hatred is murder in seed form — the same root impulse, lacking only opportunity. Jesus taught this in the Sermon on the Mount (Matt 5:21-22). ''No murderer hath eternal life abiding in him'' — habitual hatred is incompatible with possessing eternal life.',
   NULL),
  (16,
   'Hereby perceive we the love of God, because he laid down his life for us: and we ought to lay down our lives for the brethren.',
   'ἐν τούτῳ ἐγνώκαμεν τὴν ἀγάπην ὅτι ἐκεῖνος ὑπὲρ ἡμῶν τὴν ψυχὴν αὐτοῦ ἔθηκεν καὶ ἡμεῖς ὀφείλομεν ὑπὲρ τῶν ἀδελφῶν τὰς ψυχὰς τιθέναι',
   'en toutō egnōkamen tēn agapēn hoti ekeinos hyper hēmōn tēn psychēn autou ethēken kai hēmeis opheilomen hyper tōn adelphōn tas psychas tithenai',
   '''Perceive'' (egnōkamen — we have come to know; perfect tense: know with settled certainty). ''Love'' (tēn agapēn — the love; the definitive love, love in its purest form). ''Laid down his life'' (tēn psychēn autou ethēken — placed His soul, set down His life; the same expression Jesus used in John 10:11,15,17,18). ''We ought'' (opheilomen — we owe it, we are morally obligated). ''Lay down our lives'' (tas psychas tithenai — to place our souls). The cross is the definition of love; sacrificial self-giving is the obligation of the loved.',
   'The definition of love: Love is not defined by feeling but by sacrifice. The supreme definition is the cross: Christ laid down His life for us. From this flows the obligation: we ought to lay down our lives for fellow believers. This does not necessarily mean martyrdom but the willingness to sacrifice — time, comfort, resources, rights, and if necessary, life itself — for the good of the brethren.'),
  (17,
   'But whoso hath this world''s good, and seeth his brother have need, and shutteth up his bowels of compassion from him, how dwelleth the love of God in him?',
   'ὃς δ᾽ ἂν ἔχῃ τὸν βίον τοῦ κόσμου καὶ θεωρῇ τὸν ἀδελφὸν αὐτοῦ χρείαν ἔχοντα καὶ κλείσῃ τὰ σπλάγχνα αὐτοῦ ἀπ᾽ αὐτοῦ πῶς ἡ ἀγάπη τοῦ θεοῦ μένει ἐν αὐτῷ',
   'hos d'' an echē ton bion tou kosmou kai theōrē ton adelphon autou chreian echonta kai kleisē ta splanchna autou ap'' autou pōs hē agapē tou theou menei en autō',
   '''This world''s good'' (ton bion tou kosmou — the livelihood of the world, material possessions). ''Seeth'' (theōrē — observes, contemplates; not a passing glance but a deliberate seeing). ''Shutteth up'' (kleisē — closes, locks, bars the door). ''Bowels of compassion'' (ta splanchna — the inward parts, the seat of feeling and compassion). ''How dwelleth?'' (pōs menei — how does it abide?). John brings love down from heroic self-sacrifice (v.16) to practical daily generosity. If you see a brother in need and lock up your compassion, how can you claim God''s love lives in you?',
   NULL),
  (18,
   'My little children, let us not love in word, neither in tongue; but in deed and in truth.',
   'Τεκνία μου μὴ ἀγαπῶμεν λόγῳ μηδὲ τῇ γλώσσῃ ἀλλ᾽ ἐν ἔργῳ καὶ ἀληθείᾳ',
   'Teknia mou mē agapōmen logō mēde tē glōssē all'' en ergō kai alētheia',
   '''In word'' (logō — by speech alone). ''In tongue'' (tē glōssē — in talk). ''In deed'' (en ergō — in action, in work). ''In truth'' (alētheia — in reality, genuinely). The contrast is between verbal love and enacted love. Words of love that produce no action are not love at all. True love is demonstrated, not merely declared.',
   NULL),
  (19,
   'And hereby we know that we are of the truth, and shall assure our hearts before him.',
   'Καὶ ἐν τούτῳ γινώσκομεν ὅτι ἐκ τῆς ἀληθείας ἐσμέν καὶ ἔμπροσθεν αὐτοῦ πείσομεν τὰς καρδίας ἡμῶν',
   'Kai en toutō ginōskomen hoti ek tēs alētheias esmen kai emprosthen autou peisomen tas kardias hēmōn',
   '''Of the truth'' (ek tēs alētheias — originating from the truth). ''Assure'' (peisomen — persuade, convince, set at rest; from peithō). ''Our hearts'' (tas kardias hēmōn — the inner person, the conscience). ''Before him'' (emprosthen autou — in His presence). When we love in deed and truth (v.18), we gain assurance. Practical love is not the basis of our salvation but the evidence that reassures the anxious heart. The heart that struggles with doubt finds comfort in the fruit of genuine love.',
   NULL),
  (20,
   'For if our heart condemn us, God is greater than our heart, and knoweth all things.',
   'ὅτι ἐὰν καταγινώσκῃ ἡμῶν ἡ καρδία ὅτι μείζων ἐστὶν ὁ θεὸς τῆς καρδίας ἡμῶν καὶ γινώσκει πάντα',
   'hoti ean kataginōskē hēmōn hē kardia hoti meizōn estin ho theos tēs kardias hēmōn kai ginōskei panta',
   '''Condemn'' (kataginōskē — judges against, accuses, finds fault). ''God is greater than our heart'' — a profoundly comforting truth: when our heart accuses us, God knows more than our heart does. He knows our failures, yes, but He also knows the blood of Christ, the reality of our faith, and the sincerity of our love that our anxious heart may overlook. God''s knowledge is larger, more accurate, and more gracious than our self-condemnation.',
   NULL),
  (21,
   'Beloved, if our heart condemn us not, then have we confidence toward God.',
   'Ἀγαπητοί ἐὰν ἡ καρδία ἡμῶν μὴ καταγινώσκῃ ἡμῶν παρρησίαν ἔχομεν πρὸς τὸν θεόν',
   'Agapētoi ean hē kardia hēmōn mē kataginōskē hēmōn parrēsian echomen pros ton theon',
   '''Condemn us not'' (mē kataginōskē — does not accuse). ''Confidence'' (parrēsian — boldness, freedom of speech, open access). ''Toward God'' (pros ton theon — face-to-face with God). A clear conscience — not sinless perfection but genuine love and obedience — produces bold, confident access to God. The believer can pray with freedom when the heart is not accusing.',
   NULL),
  (22,
   'And whatsoever we ask, we receive of him, because we keep his commandments, and do those things that are pleasing in his sight.',
   'καὶ ὃ ἐὰν αἰτῶμεν λαμβάνομεν παρ᾽ αὐτοῦ ὅτι τὰς ἐντολὰς αὐτοῦ τηροῦμεν καὶ τὰ ἀρεστὰ ἐνώπιον αὐτοῦ ποιοῦμεν',
   'kai ho ean aitōmen lambanomen par'' autou hoti tas entolas autou tēroumen kai ta aresta enōpion autou poioumen',
   '''Ask'' (aitōmen — request). ''Receive'' (lambanomen — we receive; present tense: we keep receiving). ''Keep his commandments'' (tas entolas tēroumen — we guard His commands). ''Pleasing in his sight'' (ta aresta enōpion autou — the things that are acceptable before Him). Answered prayer is linked to obedience — not because obedience earns answers, but because the obedient heart asks in alignment with God''s will.',
   NULL),
  (23,
   'And this is his commandment, That we should believe on the name of his Son Jesus Christ, and love one another, as he gave us commandment.',
   'καὶ αὕτη ἐστὶν ἡ ἐντολὴ αὐτοῦ ἵνα πιστεύσωμεν τῷ ὀνόματι τοῦ υἱοῦ αὐτοῦ Ἰησοῦ Χριστοῦ καὶ ἀγαπῶμεν ἀλλήλους καθὼς ἔδωκεν ἐντολὴν ἡμῖν',
   'kai hautē estin hē entolē autou hina pisteusōmen tō onomati tou huiou autou Iēsou Christou kai agapōmen allēlous kathōs edōken entolēn hēmin',
   '''His commandment'' (hē entolē — the commandment, singular). Two parts of one command: (1) ''believe on the name of his Son Jesus Christ'' (pisteusōmen tō onomati — to put faith in the name, the person, the character of Jesus Christ), and (2) ''love one another'' (agapōmen allēlous). Faith and love are inseparable: faith towards God and love towards the brethren. This is the summary of the entire Christian life.',
   NULL),
  (24,
   'And he that keepeth his commandments dwelleth in him, and he in him. And hereby we know that he abideth in us, by the Spirit which he hath given us.',
   'καὶ ὁ τηρῶν τὰς ἐντολὰς αὐτοῦ ἐν αὐτῷ μένει καὶ αὐτὸς ἐν αὐτῷ καὶ ἐν τούτῳ γινώσκομεν ὅτι μένει ἐν ἡμῖν ἐκ τοῦ πνεύματος οὗ ἡμῖν ἔδωκεν',
   'kai ho tērōn tas entolas autou en autō menei kai autos en autō kai en toutō ginōskomen hoti menei en hēmin ek tou pneumatos hou hēmin edōken',
   '''Keepeth'' (ho tērōn — the one who guards, treasures). ''Dwelleth in him, and he in him'' (en autō menei kai autos en autō — mutual indwelling: the believer in God and God in the believer). ''By the Spirit which he hath given us'' (ek tou pneumatos hou hēmin edōken — from the Spirit whom He gave us). The chapter ends with the ultimate evidence of assurance: the indwelling Holy Spirit. The Spirit is both the gift and the evidence — He is God''s own presence within the believer, confirming the relationship.',
   'The indwelling Spirit as assurance: Three evidences of genuine faith are given in this chapter: (1) righteous living (vv.4-10), (2) love for the brethren (vv.11-18), (3) the witness of the indwelling Spirit (v.24). The Spirit is the final, most intimate proof: God Himself dwells within the believer. This prepares for the test of discerning the spirits in chapter 4.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 John' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 1 (What manner of love / children of God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ποταπήν', 'potapēn', 'G4217', 'What manner of, what kind of, of what country — originally an interrogative asking about national origin: "from what land does this love come?" Expressing sheer astonishment at the foreign, otherworldly character of divine love.', 1),
  ('τέκνα', 'tekna', 'G5043', 'Children, born ones — from tiktō (to give birth). Emphasises birth and nature: believers are born of God and share His nature. Stronger than "subjects" or "servants" — this is family identity through spiritual birth.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 3 AND v.verse_number = 1;

-- Verse 2 (We shall be like him)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὅμοιοι', 'homoioi', 'G3664', 'Like, similar, resembling — we shall be conformed to Christ''s likeness. Not identical (we do not become God) but similar: sharing His glorified nature, moral perfection, and resurrection body. Cf. Rom 8:29; Phil 3:21.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 3 AND v.verse_number = 2;

-- Verse 9 (Born of God / seed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σπέρμα', 'sperma', 'G4690', 'Seed — the principle of divine life implanted at regeneration. As physical seed produces offspring that shares the parent''s nature, God''s seed produces spiritual children who share His moral nature. This seed is permanent (menei — abides) and produces a nature incompatible with habitual sin.', 1),
  ('γεγεννημένος', 'gegennēmenos', 'G1080', 'Having been born, begotten — perfect passive participle of gennaō. The perfect tense indicates a completed action with ongoing results: born in the past, remaining in the state of being born. The new birth is permanent and irreversible.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 3 AND v.verse_number = 9;

-- Verse 16 (Laid down his life)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἔθηκεν', 'ethēken', 'G5087', 'Laid down, placed, set — from tithēmi. To voluntarily place one''s life down. Jesus used this word in John 10:11,15,17,18: "I lay down my life." This was not taken from Him but freely given — a deliberate act of sacrificial love.', 1),
  ('ὀφείλομεν', 'opheilomen', 'G3784', 'We ought, we owe, we are obligated — a moral debt. Christ''s love creates an obligation: having been loved sacrificially, we owe sacrificial love to the brethren. Love is not optional generosity but required response.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 3 AND v.verse_number = 16;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Children of God
  (1, 'John 1:12-13', 1), (1, 'Romans 8:16-17', 2), (1, 'John 15:18-19', 3),
  -- v2: We shall be like him
  (2, 'Romans 8:29', 1), (2, 'Philippians 3:20-21', 2), (2, '2 Corinthians 3:18', 3),
  -- v4: Sin is lawlessness
  (4, 'Romans 4:15', 1), (4, '1 John 5:17', 2),
  -- v5: Manifested to take away sins
  (5, 'John 1:29', 1), (5, '2 Corinthians 5:21', 2), (5, 'Hebrews 9:26', 3),
  -- v8: Destroy the works of the devil
  (8, 'Hebrews 2:14', 1), (8, 'Colossians 2:15', 2), (8, 'Genesis 3:15', 3),
  -- v9: Born of God doth not commit sin
  (9, '1 John 5:18', 1), (9, '1 Peter 1:23', 2), (9, 'James 1:18', 3),
  -- v14: Passed from death to life
  (14, 'John 5:24', 1), (14, 'Ephesians 2:1-5', 2), (14, 'Colossians 1:13', 3),
  -- v15: Hatred is murder
  (15, 'Matthew 5:21-22', 1), (15, 'John 8:44', 2),
  -- v16: Laid down his life
  (16, 'John 10:11', 1), (16, 'John 15:13', 2), (16, 'Romans 5:8', 3),
  -- v20: God greater than our heart
  (20, 'Psalm 103:14', 1), (20, 'Romans 8:33-34', 2),
  -- v24: Spirit given to us
  (24, 'Romans 8:9', 1), (24, '1 John 4:13', 2), (24, '2 Corinthians 1:22', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 John' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 John Chapter 3 Complete
-- 24 verses · 5 key verses with word studies (8 words)
-- Cross-references for 11 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
