-- ═══════════════════════════════════════════════════
-- PHILIPPIANS CHAPTER 4 — Rejoice Always, the Peace of God & Contentment
-- 23 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Philippians 4 is the letter''s climactic chapter — a cascade of beloved verses that have sustained believers for two millennia. Paul urges Euodia and Syntyche to reconcile, then issues the famous commands: ''Rejoice in the Lord alway'' and ''Be careful for nothing.'' The prescription for anxiety is prayer with thanksgiving, which produces ''the peace of God, which passeth all understanding.'' The mental discipline of verse 8 — think on whatever is true, honest, just, pure, lovely, of good report — is followed by one of the Bible''s great testimonies of contentment: ''I have learned, in whatsoever state I am, therewith to be content.'' The secret: ''I can do all things through Christ which strengtheneth me.'' Paul closes by thanking the Philippians for their unique financial partnership and promising that God shall supply all their needs according to His riches in glory.',
  'Rejoicing, Peace, Contentment & Generosity',
  'εἰρήνη (eirēnē)',
  'Peace — the supernatural tranquility that guards the heart and mind when anxiety is replaced by prayer with thanksgiving. Not the absence of trouble but the presence of God.',
  '["Stand Fast & Reconcile (vv.1-3): Joy and crown; Euodia and Syntyche urged to agree; the true yokefellow","Rejoice & Be Anxious for Nothing (vv.4-7): Rejoice always; moderation; prayer with thanksgiving; the peace of God","Think on These Things (vv.8-9): True, honest, just, pure, lovely, of good report; practise these and the God of peace shall be with you","The Secret of Contentment (vv.10-13): Content in any state; abased and abounding; I can do all things through Christ","The Philippians'' Generosity (vv.14-20): Partnership from the first day; no other church gave; God shall supply all your need","Closing Greetings (vv.21-23): Greet every saint; Caesar''s household; grace"]'
FROM books b WHERE b.name = 'Philippians';

-- Step 2: Insert all 23 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Therefore, my brethren dearly beloved and longed for, my joy and crown, so stand fast in the Lord, my dearly beloved.',
   'Ὥστε ἀδελφοί μου ἀγαπητοὶ καὶ ἐπιπόθητοι χαρὰ καὶ στέφανός μου οὕτως στήκετε ἐν κυρίῳ ἀγαπητοί',
   'Hōste adelphoi mou agapētoi kai epipothētoi chara kai stephanos mou houtōs stēkete en kyriō agapētoi',
   'An avalanche of affection: ''dearly beloved'' (agapētoi, used twice), ''longed for'' (epipothētoi — intensely desired), ''my joy'' (chara mou), ''crown'' (stephanos — not a royal diadem/diadēma but the victor''s wreath, the athlete''s prize). The Philippians themselves are Paul''s prize, his reward, his crown of joy. ''Stand fast'' (stēkete — hold your ground, remain firm) echoes 1:27. The chapter begins where chapter 3 ended: firmness rooted in the Lord.',
   NULL),
  (2,
   'I beseech Euodias, and beseech Syntyche, that they be of the same mind in the Lord.',
   'Εὐοδίαν παρακαλῶ καὶ Συντύχην παρακαλῶ τὸ αὐτὸ φρονεῖν ἐν κυρίῳ',
   'Euodian parakalō kai Syntychēn parakalō to auto phronein en kyriō',
   'Paul names two women individually — unusual and significant. Both names are meaningful: Euodia (''prosperous journey'') and Syntyche (''fortunate''). Their quarrel was serious enough to require apostolic intervention. Paul begs (parakalō — urges, appeals to) each one separately, treating them with equal dignity. ''Of the same mind'' (to auto phronein) — the letter''s recurring theme (2:2,5). Their disagreement threatens the church''s unity.',
   NULL),
  (3,
   'And I intreat thee also, true yokefellow, help those women which laboured with me in the gospel, with Clement also, and with other my fellowlabourers, whose names are in the book of life.',
   'ναὶ ἐρωτῶ καὶ σέ γνήσιε σύζυγε συλλαμβάνου αὐταῖς αἵτινες ἐν τῷ εὐαγγελίῳ συνήθλησάν μοι μετὰ καὶ Κλήμεντος καὶ τῶν λοιπῶν συνεργῶν μου ὧν τὰ ὀνόματα ἐν βίβλῳ ζωῆς',
   'nai erōtō kai se gnēsie syzuge syllambanou autais haitines en tō euangeliō synēthlēsan moi meta kai Klēmentos kai tōn loipōn synergōn mou hōn ta onomata en biblō zōēs',
   '''True yokefellow'' (gnēsie syzuge — genuine companion, loyal partner) — identity unknown; possibly Luke, Epaphroditus, or a person literally named ''Syzygus.'' These women ''laboured with'' Paul (synēthlēsan — contended alongside, co-athletes) in the Gospel — genuine ministry partners, not subordinates. ''Book of life'' (biblō zōēs) — the heavenly register of all who belong to God (cf. Rev 3:5, 20:12,15). Their eternal security is certain despite their earthly disagreement.',
   NULL),
  (4,
   'Rejoice in the Lord alway: and again I say, Rejoice.',
   'Χαίρετε ἐν κυρίῳ πάντοτε πάλιν ἐρῶ χαίρετε',
   'Chairete en kyriō pantote palin erō chairete',
   'The most famous command in Philippians, and perhaps Paul''s most characteristic utterance. ''Rejoice'' (chairete) is repeated for emphasis — ''again I say, Rejoice.'' ''Always'' (pantote) — not occasionally, not when circumstances allow, but at all times. ''In the Lord'' (en kyriō) — the sphere of joy. This is not command to manufacture false happiness but to root oneself in the unchanging reality of Christ''s lordship, presence, and love. Written from prison, this command carries extraordinary weight.',
   NULL),
  (5,
   'Let your moderation be known unto all men. The Lord is at hand.',
   'τὸ ἐπιεικὲς ὑμῶν γνωσθήτω πᾶσιν ἀνθρώποις ὁ κύριος ἐγγύς',
   'to epieikes hymōn gnōsthētō pasin anthrōpois ho kyrios engys',
   '''Moderation'' (epieikes — gentleness, graciousness, sweet reasonableness, magnanimity — yielding one''s rights rather than insisting on strict justice). This is the character of Christ (2 Cor 10:1). ''Known unto all men'' — even outsiders should see this quality. ''The Lord is at hand'' (ho kyrios engys) — either temporal (He is coming soon) or spatial (He is near, always present). Both motivate gentleness: why fight for your rights when the righteous Judge is at the door?',
   NULL),
  (6,
   'Be careful for nothing; but in every thing by prayer and supplication with thanksgiving let your requests be made known unto God.',
   'μηδὲν μεριμνᾶτε ἀλλ᾽ ἐν παντὶ τῇ προσευχῇ καὶ τῇ δεήσει μετὰ εὐχαριστίας τὰ αἰτήματα ὑμῶν γνωριζέσθω πρὸς τὸν θεόν',
   'mēden merimnate all'' en panti tē proseuchē kai tē deēsei meta eucharistias ta aitēmata hymōn gnorizesthō pros ton theon',
   '''Be careful for nothing'' (mēden merimnate — stop being anxious about anything; mēden is emphatic: not one thing). The antidote to anxiety is not willpower but prayer. Four elements: (1) ''prayer'' (proseuchē — general worship and adoration), (2) ''supplication'' (deēsei — specific requests born of felt need), (3) ''thanksgiving'' (eucharistias — gratitude that transforms the atmosphere of prayer), (4) ''requests'' (aitēmata — particular petitions). The result follows in v.7.',
   'The Christian response to anxiety: not suppression but redirection — channelling worry into prayer. Thanksgiving is the key that unlocks peace, because gratitude reorients the heart from problems to God''s faithfulness. This is not denial of real problems but entrusting them to a sovereign, loving God (cf. 1 Pet 5:7; Matt 6:25-34).'),
  (7,
   'And the peace of God, which passeth all understanding, shall keep your hearts and minds through Christ Jesus.',
   'καὶ ἡ εἰρήνη τοῦ θεοῦ ἡ ὑπερέχουσα πάντα νοῦν φρουρήσει τὰς καρδίας ὑμῶν καὶ τὰ νοήματα ὑμῶν ἐν Χριστῷ Ἰησοῦ',
   'kai hē eirēnē tou theou hē hyperechousa panta noun phrourēsei tas kardias hymōn kai ta noēmata hymōn en Christō Iēsou',
   '''Peace of God'' (eirēnē tou theou) — not peace with God (justification, Rom 5:1) but the peace God Himself possesses and gives. ''Passeth all understanding'' (hyperechousa panta noun — surpasses, rises above all intellect). This peace cannot be comprehended, only experienced. ''Keep'' (phrourēsei — will guard, will garrison, a military term for a sentinel standing watch). God''s peace stands guard (like a Roman soldier) over ''hearts'' (kardias — the seat of emotions) and ''minds'' (noēmata — thoughts, mental faculties). Peace as divine bodyguard.',
   NULL),
  (8,
   'Finally, brethren, whatsoever things are true, whatsoever things are honest, whatsoever things are just, whatsoever things are pure, whatsoever things are lovely, whatsoever things are of good report; if there be any virtue, and if there be any praise, think on these things.',
   'τὸ λοιπόν ἀδελφοί ὅσα ἐστὶν ἀληθῆ ὅσα σεμνά ὅσα δίκαια ὅσα ἁγνά ὅσα προσφιλῆ ὅσα εὔφημα εἴ τις ἀρετὴ καὶ εἴ τις ἔπαινος ταῦτα λογίζεσθε',
   'to loipon adelphoi hosa estin alēthē hosa semna hosa dikaia hosa hagna hosa prosphilē hosa euphēma ei tis aretē kai ei tis epainos tauta logizesthe',
   'Eight qualities for mental focus: (1) ''true'' (alēthē — genuine, real, not false), (2) ''honest'' (semna — noble, dignified, worthy of reverence), (3) ''just'' (dikaia — righteous, conforming to God''s standard), (4) ''pure'' (hagna — morally clean, chaste, undefiled), (5) ''lovely'' (prosphilē — pleasing, attractive, winning — only here in the NT), (6) ''of good report'' (euphēma — well-spoken-of, reputable), (7) ''virtue'' (aretē — moral excellence), (8) ''praise'' (epainos — anything praiseworthy). ''Think on'' (logizesthe — reckon, calculate, deliberately fix the mind on). This is mental discipline: choosing what occupies the mind.',
   NULL),
  (9,
   'Those things, which ye have both learned, and received, and heard, and seen in me, do: and the God of peace shall be with you.',
   'ἃ καὶ ἐμάθετε καὶ παρελάβετε καὶ ἠκούσατε καὶ εἴδετε ἐν ἐμοί ταῦτα πράσσετε καὶ ὁ θεὸς τῆς εἰρήνης ἔσται μεθ᾽ ὑμῶν',
   'ha kai emathete kai parelabete kai ēkousate kai eidete en emoi tauta prassete kai ho theos tēs eirēnēs estai meth'' hymōn',
   'Four modes of receiving: (1) ''learned'' (emathete — instruction, teaching), (2) ''received'' (parelabete — tradition passed on, received as authoritative), (3) ''heard'' (ēkousate — verbal communication), (4) ''seen in me'' (eidete en emoi — observed in Paul''s life). Teaching plus example. ''Do'' (prassete — practise, keep doing). The promise: not just ''the peace of God'' (v.7) but ''the God of peace'' (ho theos tēs eirēnēs) Himself. Verse 7 gives the peace of God; verse 9 gives the God of peace — the Giver, not just the gift.',
   NULL),
  (10,
   'But I rejoiced in the Lord greatly, that now at the last your care of me hath flourished again; wherein ye were also careful, but ye lacked opportunity.',
   'Ἐχάρην δὲ ἐν κυρίῳ μεγάλως ὅτι ἤδη ποτὲ ἀνεθάλετε τὸ ὑπὲρ ἐμοῦ φρονεῖν ἐφ᾽ ᾧ καὶ ἐφρονεῖτε ἠκαιρεῖσθε δέ',
   'Echarēn de en kyriō megalōs hoti ēdē pote anethalete to hyper emou phronein eph'' hō kai ephroneite ēkaireisthe de',
   '''Flourished again'' (anethalete — sprouted again, blossomed like a plant reviving in spring; only here in the NT). Paul uses a botanical metaphor: their care for him had not died but lacked opportunity (ēkaireisthe — had no occasion, no means) to bloom. He carefully avoids any hint of ingratitude or complaint, immediately clarifying that their hearts were always with him even when circumstances prevented action.',
   NULL),
  (11,
   'Not that I speak in respect of want: for I have learned, in whatsoever state I am, therewith to be content.',
   'οὐχ ὅτι καθ᾽ ὑστέρησιν λέγω ἐγὼ γὰρ ἔμαθον ἐν οἷς εἰμι αὐτάρκης εἶναι',
   'ouch hoti kath'' hysterēsin legō egō gar emathon en hois eimi autarkēs einai',
   '''Content'' (autarkēs — self-sufficient, self-contained, needing nothing external for satisfaction). This was the supreme Stoic virtue — independence from circumstances. But Paul transforms it: his sufficiency is not in himself but ''through Christ'' (v.13). ''I have learned'' (emathon — I was taught, I was discipled) — contentment is not natural temperament but acquired skill, a lesson learned through experience and suffering. It is a discipline, not a feeling.',
   NULL),
  (12,
   'I know both how to be abased, and I know how to abound: every where and in all things I am instructed both to be full and to be hungry, both to abound and to suffer need.',
   'οἶδα καὶ ταπεινοῦσθαι οἶδα καὶ περισσεύειν ἐν παντὶ καὶ ἐν πᾶσιν μεμύημαι καὶ χορτάζεσθαι καὶ πεινᾶν καὶ περισσεύειν καὶ ὑστερεῖσθαι',
   'oida kai tapeinousthai oida kai perisseuein en panti kai en pasin memyēmai kai chortazesthai kai peinan kai perisseuein kai hystereisthai',
   '''Instructed'' (memyēmai — initiated into the mystery, from myeō — to initiate into the mysteries). Paul borrows language from the Greek mystery religions: he has been initiated into a secret. The secret is not esoteric knowledge but the practical ability to handle every circumstance — poverty and plenty, hunger and fullness, abundance and need. Four pairs of opposites, all mastered. This initiation came through experience, not theory.',
   NULL),
  (13,
   'I can do all things through Christ which strengtheneth me.',
   'πάντα ἰσχύω ἐν τῷ ἐνδυναμοῦντί με',
   'panta ischyō en tō endynamounti me',
   '''I can do all things'' (panta ischyō — I have strength for all things, I am able in all circumstances). ''Through Christ'' (en tō endynamounti me — in the One who empowers me, who pours strength into me). ''Strengtheneth'' (endynamounti — from en + dynamis — to put power into, to infuse with ability). This is not a blank cheque for personal ambition but the power to endure ''all things'' — both abundance and want, success and suffering. The ''all things'' of v.13 must be read through the ''all things'' of v.12. Christ''s power enables contentment in every situation.',
   'The sufficiency of Christ: Believers are not self-sufficient (like the Stoic ideal) but Christ-sufficient. His power is made perfect in weakness (2 Cor 12:9-10). The ''all things'' refers to the circumstances of vv.11-12, not unlimited capability for any desired outcome. This is the power to be content, to endure, and to serve faithfully regardless of external conditions.'),
  (14,
   'Notwithstanding ye have well done, that ye did communicate with my affliction.',
   'πλὴν καλῶς ἐποιήσατε συγκοινωνήσαντές μου τῇ θλίψει',
   'plēn kalōs epoiēsate synkoinōnēsantes mou tē thlipsei',
   'Having declared his contentment, Paul immediately affirms their gift — he does not want his contentment to seem like ingratitude. ''Communicate'' (synkoinōnēsantes — sharing together in, co-participating in) his ''affliction'' (thlipsei — tribulation, distress). Their gift was not mere charity but fellowship — they entered into his suffering by supporting him through it. Partnership, not patronage.',
   NULL),
  (15,
   'Now ye Philippians know also, that in the beginning of the gospel, when I departed from Macedonia, no church communicated with me as concerning giving and receiving, but ye only.',
   'οἴδατε δὲ καὶ ὑμεῖς Φιλιππήσιοι ὅτι ἐν ἀρχῇ τοῦ εὐαγγελίου ὅτε ἐξῆλθον ἀπὸ Μακεδονίας οὐδεμία μοι ἐκκλησία ἐκοινώνησεν εἰς λόγον δόσεως καὶ λήμψεως εἰ μὴ ὑμεῖς μόνοι',
   'oidate de kai hymeis Philippēsioi hoti en archē tou euangeliou hote exēlthon apo Makedonias oudemia moi ekklēsia ekoinōnēsen eis logon doseōs kai lēmpseōs ei mē hymeis monoi',
   '''In the beginning of the gospel'' — when Paul first preached in their region (c. AD 49-50, Acts 16). ''Giving and receiving'' (doseōs kai lēmpseōs) — bookkeeping terminology: a debit-and-credit partnership account. ''But ye only'' (ei mē hymeis monoi) — the Philippians alone among all the churches opened this financial partnership with Paul. This unique relationship explains the letter''s special warmth.',
   NULL),
  (16,
   'For even in Thessalonica ye sent once and again unto my necessity.',
   'ὅτι καὶ ἐν Θεσσαλονίκῃ καὶ ἅπαξ καὶ δὶς εἰς τὴν χρείαν μοι ἐπέμψατε',
   'hoti kai en Thessalonikē kai hapax kai dis eis tēn chreian moi epempsate',
   '''Once and again'' (hapax kai dis — once and twice, repeatedly). Even while Paul was nearby in Thessalonica (Acts 17:1-9), the Philippians sent financial support — not once but multiple times. This was remarkable generosity from a church that was itself in poverty (2 Cor 8:1-2). They gave beyond their ability because they gave themselves first to the Lord.',
   NULL),
  (17,
   'Not because I desire a gift: but I desire fruit that may abound to your account.',
   'οὐχ ὅτι ἐπιζητῶ τὸ δόμα ἀλλ᾽ ἐπιζητῶ τὸν καρπὸν τὸν πλεονάζοντα εἰς λόγον ὑμῶν',
   'ouch hoti epizētō to doma all'' epizētō ton karpon ton pleonazonta eis logon hymōn',
   'Paul anticipates misunderstanding: he is not begging for money. ''I desire'' (epizētō — I seek after, I am looking for) not ''the gift'' (to doma) but ''fruit'' (karpon) that ''abounds'' (pleonazonta — multiplies, increases) to ''your account'' (logon hymōn — your credit ledger). Their giving produces compound spiritual interest in their heavenly account. Paul cares about their reward more than his relief.',
   NULL),
  (18,
   'But I have all, and abound: I am full, having received of Epaphroditus the things which were sent from you, an odour of a sweet smell, a sacrifice acceptable, wellpleasing to God.',
   'ἀπέχω δὲ πάντα καὶ περισσεύω πεπλήρωμαι δεξάμενος παρὰ Ἐπαφροδίτου τὰ παρ᾽ ὑμῶν ὀσμὴν εὐωδίας θυσίαν δεκτήν εὐάρεστον τῷ θεῷ',
   'apechō de panta kai perisseuō peplērōmai dexamenos para Epaphroditou ta par'' hymōn osmēn euōdias thysian dektēn euareston tō theō',
   '''I have all'' (apechō panta — I have received in full, the account is settled; apechō was stamped on receipts meaning ''paid in full''). Three sacrificial terms elevate the Philippians'' financial gift to worship: (1) ''odour of a sweet smell'' (osmēn euōdias — a fragrant aroma; the language of OT burnt offerings, Gen 8:21, Exod 29:18), (2) ''sacrifice acceptable'' (thysian dektēn), (3) ''wellpleasing to God'' (euareston tō theō). Their money is incense rising to God''s throne.',
   NULL),
  (19,
   'But my God shall supply all your need according to his riches in glory by Christ Jesus.',
   'ὁ δὲ θεός μου πληρώσει πᾶσαν χρείαν ὑμῶν κατὰ τὸ πλοῦτος αὐτοῦ ἐν δόξῃ ἐν Χριστῷ Ἰησοῦ',
   'ho de theos mou plērōsei pasan chreian hymōn kata to ploutos autou en doxē en Christō Iēsou',
   'The reciprocal promise: you supplied my need; ''my God'' (personal, relational) shall supply ''all your need'' (pasan chreian — every need, without exception). The measure of supply: not ''out of'' (ek) His riches but ''according to'' (kata) His riches — in proportion to the limitless wealth of God. ''In glory'' (en doxē) — either the glorious manner of giving or the sphere from which it comes (heavenly glory). ''By Christ Jesus'' — He is the channel of all divine provision.',
   'God''s provision: The promise is not that God will supply all our wants but all our needs. The measure is not human estimation but divine riches. This is not a prosperity gospel promise but a covenant assurance that the God who owns the universe will care for those who sacrificially give to His work.'),
  (20,
   'Now unto God and our Father be glory for ever and ever. Amen.',
   'τῷ δὲ θεῷ καὶ πατρὶ ἡμῶν ἡ δόξα εἰς τοὺς αἰῶνας τῶν αἰώνων ἀμήν',
   'tō de theō kai patri hēmōn hē doxa eis tous aiōnas tōn aiōnōn amēn',
   'A burst of spontaneous doxology. ''For ever and ever'' (eis tous aiōnas tōn aiōnōn — unto the ages of the ages, the strongest expression of unending time in Greek). The mention of God''s lavish provision triggers worship — the proper response to grace is glory. ''Amen'' (amēn — so be it, truly, it is firm). Paul seals his thanksgiving with the affirmation of faith.',
   NULL),
  (21,
   'Salute every saint in Christ Jesus. The brethren which are with me greet you.',
   'Ἀσπάσασθε πάντα ἅγιον ἐν Χριστῷ Ἰησοῦ ἀσπάζονται ὑμᾶς οἱ σὺν ἐμοὶ ἀδελφοί',
   'Aspasasthe panta hagion en Christō Iēsou aspazontai hymas hoi syn emoi adelphoi',
   '''Every saint'' (panta hagion) — Paul''s greeting is inclusive, reaching every member. No one is excluded, not even Euodia and Syntyche. ''The brethren which are with me'' — Paul''s immediate companions, possibly Timothy and others mentioned elsewhere.',
   NULL),
  (22,
   'All the saints salute you, chiefly they that are of Caesar''s household.',
   'ἀσπάζονται ὑμᾶς πάντες οἱ ἅγιοι μάλιστα δὲ οἱ ἐκ τῆς Καίσαρος οἰκίας',
   'aspazontai hymas pantes hoi hagioi malista de hoi ek tēs Kaisaros oikias',
   '''Caesar''s household'' (Kaisaros oikias) — not necessarily the emperor''s blood relatives but members of the vast imperial household: slaves, freedmen, civil servants, and administrators who served the Roman emperor. The Gospel had penetrated to the very heart of the Roman Empire. Paul''s chains had borne fruit in the most unexpected place (cf. 1:13). Saints in Caesar''s house — the subversive power of the Gospel.',
   NULL),
  (23,
   'The grace of our Lord Jesus Christ be with you all. Amen.',
   'ἡ χάρις τοῦ κυρίου Ἰησοῦ Χριστοῦ μετὰ τοῦ πνεύματος ὑμῶν',
   'hē charis tou kyriou Iēsou Christou meta tou pneumatos hymōn',
   'The letter begins with grace (1:2) and ends with grace — forming an inclusio. ''With your spirit'' (meta tou pneumatos hymōn) — grace penetrates to the innermost dimension of human existence. The letter that is about joy closes with the One who makes joy possible: the Lord Jesus Christ, the source and sustainer of all grace.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Philippians' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 4 (Rejoice)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χαίρετε', 'chairete', 'G5463', 'Rejoice, be glad — imperative mood: this is a command, not a suggestion. The present tense implies continuous action: keep on rejoicing. Repeated for emphasis.', 1),
  ('πάντοτε', 'pantote', 'G3842', 'Always, at all times, on every occasion — no exceptions, no exemptions, no circumstances excluded. Joy is not conditional.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 4 AND v.verse_number = 4;

-- Verse 6 (Be careful for nothing)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μεριμνᾶτε', 'merimnate', 'G3309', 'Be anxious, be worried, be distracted by care — from merizō (to divide). Anxiety divides the mind, pulling it in multiple directions. Present imperative with mēden: stop being anxious about anything.', 1),
  ('εὐχαριστίας', 'eucharistias', 'G2169', 'Thanksgiving, gratitude — from eu (well) + charis (grace). The key ingredient in the prayer-antidote to anxiety. Thanksgiving reorients the heart from fear to faith.', 2),
  ('αἰτήματα', 'aitēmata', 'G155', 'Requests, specific petitions — concrete, particular things asked for. God invites specificity in prayer, not vague spiritual sentiment.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 4 AND v.verse_number = 6;

-- Verse 7 (Peace of God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εἰρήνη', 'eirēnē', 'G1515', 'Peace — the Greek equivalent of Hebrew shalom. Not merely absence of conflict but wholeness, well-being, tranquility of soul. Here: the supernatural peace God Himself possesses.', 1),
  ('ὑπερέχουσα', 'hyperechousa', 'G5242', 'Surpassing, transcending, rising above — this peace exceeds the capacity of the human mind to produce or comprehend. It is experienced, not manufactured.', 2),
  ('φρουρήσει', 'phrourēsei', 'G5432', 'Will guard, will garrison — a military term: a sentinel posted to protect. God''s peace stands guard duty over the believer''s heart and mind, keeping anxiety out.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 4 AND v.verse_number = 7;

-- Verse 8 (Think on these things)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀληθῆ', 'alēthē', 'G227', 'True, genuine, real — corresponding to reality, not false or deceptive. The foundation of right thinking.', 1),
  ('σεμνά', 'semna', 'G4586', 'Honest, noble, dignified, worthy of reverence — that which commands respect, not frivolous or debased.', 2),
  ('λογίζεσθε', 'logizesthe', 'G3049', 'Think on, reckon, calculate, deliberately consider — from logos (reason). Not passive mental drifting but active, intentional focus. Mental discipline as spiritual warfare.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 4 AND v.verse_number = 8;

-- Verse 11 (Content)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('αὐτάρκης', 'autarkēs', 'G842', 'Content, self-sufficient — from autos (self) + arkeō (to suffice). In Stoic philosophy: needing nothing external. Paul transforms it: sufficient not in himself but in Christ (v.13). Only here in Paul.', 1),
  ('ἔμαθον', 'emathon', 'G3129', 'I learned, I was taught, I was discipled — aorist: a definite acquisition through experience. Contentment is not innate temperament but a learned skill, acquired through the school of suffering.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 4 AND v.verse_number = 11;

-- Verse 13 (All things through Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἰσχύω', 'ischyō', 'G2480', 'I have strength, I am able, I can — present tense: continuous enabling power. Not past accomplishment but present capability through ongoing empowerment.', 1),
  ('ἐνδυναμοῦντί', 'endynamounti', 'G1743', 'The One who strengthens, who empowers, who pours in power — from en (in) + dynamis (power). Christ infuses power into the believer from within. Present participle: He keeps empowering continuously.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 4 AND v.verse_number = 13;

-- Verse 19 (Supply all your need)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πληρώσει', 'plērōsei', 'G4137', 'Will fill, will supply, will fulfil completely — from plēroō (to fill full, to make complete). God does not merely assist but fully satisfies every genuine need.', 1),
  ('πλοῦτος', 'ploutos', 'G4149', 'Riches, wealth, abundance — God''s inexhaustible resources in glory. The supply is measured not by our poverty but by His abundance.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 4 AND v.verse_number = 19;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Joy and crown
  (1, '1 Thessalonians 2:19-20', 1), (1, 'Philippians 1:27', 2), (1, '2 Timothy 4:8', 3),
  -- v3: Book of life
  (3, 'Revelation 3:5', 1), (3, 'Revelation 20:12,15', 2), (3, 'Luke 10:20', 3),
  -- v4: Rejoice always
  (4, '1 Thessalonians 5:16', 1), (4, 'Philippians 3:1', 2), (4, 'Psalm 37:4', 3), (4, 'Habakkuk 3:17-18', 4),
  -- v5: The Lord is at hand
  (5, '2 Corinthians 10:1', 1), (5, 'James 5:8-9', 2), (5, 'Psalm 145:18', 3),
  -- v6: Be anxious for nothing
  (6, 'Matthew 6:25-34', 1), (6, '1 Peter 5:7', 2), (6, 'Psalm 55:22', 3), (6, 'Colossians 4:2', 4),
  -- v7: Peace of God
  (7, 'John 14:27', 1), (7, 'Isaiah 26:3', 2), (7, 'Colossians 3:15', 3), (7, 'Romans 5:1', 4),
  -- v8: Think on these things
  (8, 'Romans 12:2', 1), (8, '2 Corinthians 10:5', 2), (8, 'Colossians 3:2', 3),
  -- v9: God of peace
  (9, 'Romans 15:33', 1), (9, '1 Thessalonians 5:23', 2), (9, 'Hebrews 13:20', 3),
  -- v11: Contentment
  (11, '1 Timothy 6:6-8', 1), (11, 'Hebrews 13:5', 2), (11, 'Proverbs 30:8-9', 3),
  -- v13: All things through Christ
  (13, '2 Corinthians 12:9-10', 1), (13, 'John 15:5', 2), (13, 'Ephesians 3:16', 3), (13, 'Colossians 1:11', 4),
  -- v15: Philippians' unique giving
  (15, '2 Corinthians 8:1-5', 1), (15, '2 Corinthians 11:8-9', 2),
  -- v18: Fragrant offering
  (18, 'Ephesians 5:2', 1), (18, 'Hebrews 13:16', 2), (18, 'Genesis 8:21', 3),
  -- v19: God supplies all need
  (19, 'Matthew 6:33', 1), (19, '2 Corinthians 9:8', 2), (19, 'Psalm 23:1', 3), (19, 'Romans 8:32', 4),
  -- v22: Caesar's household
  (22, 'Philippians 1:13', 1), (22, 'Acts 28:30-31', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Philippians Chapter 4 Complete!
-- 23 verses · 8 key verses with word studies (21 words)
-- Cross-references for 15 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════