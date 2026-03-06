-- ═══════════════════════════════════════════════════
-- PHILIPPIANS CHAPTER 2 — The Mind of Christ & the Carmen Christi
-- 30 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Philippians 2 contains the greatest Christological passage in all of Paul''s writings — the Carmen Christi (''Hymn of Christ,'' vv.5-11). Paul calls the Philippians to unity and humility by pointing them to Christ''s supreme example: He who was in the form of God emptied Himself, took the form of a servant, became obedient to death on a cross, and was therefore exalted above every name. This descent-ascent pattern (pre-existence → incarnation → humiliation → exaltation) is the heartbeat of the Gospel. Paul then applies this pattern practically: work out your salvation with fear and trembling, for God works in you. The chapter closes with commendations of Timothy and Epaphroditus — two men who embody the self-emptying pattern of Christ.',
  'The Self-Emptying of Christ & the Call to Humility',
  'κενόω (kenoō)',
  'To empty, to make void, to pour out — Christ ''emptied Himself'' not by subtracting deity but by adding humanity. He veiled His glory, not abandoned it.',
  '["The Appeal to Unity & Humility (vv.1-4): Consolation in Christ, like-mindedness, lowliness of mind, esteeming others","The Carmen Christi — Christ''s Descent & Exaltation (vv.5-11): Pre-existence in the form of God; self-emptying; servant form; death on a cross; super-exaltation; every knee bows; every tongue confesses","Working Out Salvation (vv.12-18): Obedience, fear and trembling, God works in you, lights in the world, holding forth the word of life","Timothy Commended (vv.19-24): Likeminded, naturally caring, seeking the things of Christ","Epaphroditus Commended (vv.25-30): Messenger, fellow-soldier, sick near death, risking his life for the work of Christ"]'
FROM books b WHERE b.name = 'Philippians';

-- Step 2: Insert all 30 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'If there be therefore any consolation in Christ, if any comfort of love, if any fellowship of the Spirit, if any bowels and mercies,',
   'Εἴ τις οὖν παράκλησις ἐν Χριστῷ εἴ τι παραμύθιον ἀγάπης εἴ τις κοινωνία πνεύματος εἴ τις σπλάγχνα καὶ οἰκτιρμοί',
   'Ei tis oun paraklēsis en Christō ei ti paramythion agapēs ei tis koinōnia pneumatos ei tis splanchna kai oiktirmoi',
   'Four ''ifs'' (ei) — not expressing doubt but appeal: ''if these things are real to you (and they are), then...'' Paul grounds his appeal for unity in four spiritual realities: (1) consolation/encouragement in Christ (paraklēsis), (2) comfort of love (paramythion — tender persuasion), (3) fellowship of the Spirit (koinōnia pneumatos), and (4) bowels and mercies (splanchna — deep compassion; oiktirmoi — tender mercies). These are the motives for unity.',
   NULL),
  (2,
   'Fulfil ye my joy, that ye be likeminded, having the same love, being of one accord, of one mind.',
   'πληρώσατέ μου τὴν χαρὰν ἵνα τὸ αὐτὸ φρονῆτε τὴν αὐτὴν ἀγάπην ἔχοντες σύμψυχοι τὸ ἓν φρονοῦντες',
   'plērōsate mou tēn charan hina to auto phronēte tēn autēn agapēn echontes sympsychoi to hen phronountes',
   '''Fulfil my joy'' (plērōsate mou tēn charan — fill up my joy to the brim). Four expressions of unity: (1) ''likeminded'' (to auto phronēte — think the same thing), (2) ''same love'' (tēn autēn agapēn), (3) ''of one accord'' (sympsychoi — joined in soul, soul-mates), (4) ''of one mind'' (to hen phronountes — minding the one thing). ''Phronēte'' (from phroneō — to think, set the mind on) is the key verb of Philippians, used 10 times.',
   NULL),
  (3,
   'Let nothing be done through strife or vainglory; but in lowliness of mind let each esteem other better than themselves.',
   'μηδὲν κατ᾽ ἐριθείαν μηδὲ κατὰ κενοδοξίαν ἀλλὰ τῇ ταπεινοφροσύνῃ ἀλλήλους ἡγούμενοι ὑπερέχοντας ἑαυτῶν',
   'mēden kat'' eritheian mēde kata kenodoxian alla tē tapeinophrosynē allēlous hēgoumenoi hyperechontas heautōn',
   'Two vices to avoid: ''strife'' (eritheian — selfish ambition, factional rivalry) and ''vainglory'' (kenodoxian — empty glory, hollow reputation). One virtue to pursue: ''lowliness of mind'' (tapeinophrosynē — humility, a compound word invented by Paul: tapeinos [low] + phroneō [to think]). In Greco-Roman culture, humility was despised as servile weakness. Christianity radically revalued it as the highest virtue, following Christ''s example.',
   NULL),
  (4,
   'Look not every man on his own things, but every man also on the things of others.',
   'μὴ τὰ ἑαυτῶν ἕκαστος σκοποῦντες ἀλλὰ καὶ τὰ ἑτέρων ἕκαστοι',
   'mē ta heautōn hekastos skopountes alla kai ta heterōn hekastoi',
   '''Look'' (skopountes — keep your eyes on, fix attention upon, contemplate — from skopos, a watchman). ''Also'' (kai) is important: Paul does not forbid legitimate self-care but commands equal attention to others'' interests. The word ''also'' preserves balance — this is not self-destruction but self-forgetfulness. This verse introduces the supreme example: Christ who looked not on His own glory but on our need.',
   NULL),
  (5,
   'Let this mind be in you, which was also in Christ Jesus:',
   'τοῦτο φρονεῖτε ἐν ὑμῖν ὃ καὶ ἐν Χριστῷ Ἰησοῦ',
   'touto phroneite en hymin ho kai en Christō Iēsou',
   'The hinge verse that introduces the Carmen Christi. ''Mind'' (phroneite — think this way, adopt this mindset, let this disposition govern you). The imperative calls believers to share Christ''s own mindset. What follows (vv.6-11) is not merely theology to believe but an attitude to embody. The incarnation is both doctrine and ethics — the deepest theology produces the most practical living.',
   NULL),
  (6,
   'Who, being in the form of God, thought it not robbery to be equal with God:',
   'ὃς ἐν μορφῇ θεοῦ ὑπάρχων οὐχ ἁρπαγμὸν ἡγήσατο τὸ εἶναι ἴσα θεῷ',
   'hos en morphē theou hyparchōn ouch harpagmon hēgēsato to einai isa theō',
   '''Being'' (hyparchōn — existing, subsisting; present participle indicating continuous, essential being, not a temporary state). ''Form'' (morphē) does not mean mere appearance but essential nature, the outward expression of inward reality. Christ existed in the ''form of God'' — possessing the very nature of God. ''Robbery'' (harpagmon — something seized, grasped, clung to) — He did not regard equality with God as something to exploit for selfish advantage. He was fully God but did not cling to divine prerogatives.',
   'The pre-existence and full deity of Christ. ''Being in the form of God'' (morphē theou) asserts that Christ possessed the essential nature of deity before the incarnation. ''Equal with God'' (isa theō) states His parity with the Father. This is not something He attained but something He already possessed from eternity (cf. John 1:1-3, 17:5; Col 1:15-17; Heb 1:3).'),
  (7,
   'But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:',
   'ἀλλ᾽ ἑαυτὸν ἐκένωσεν μορφὴν δούλου λαβών ἐν ὁμοιώματι ἀνθρώπων γενόμενος',
   'all'' heauton ekenōsen morphēn doulou labōn en homoiōmati anthrōpōn genomenos',
   '''Made himself of no reputation'' (heauton ekenōsen — literally ''emptied himself''). This is the kenosis — the self-emptying. Christ did not empty Himself OF deity (He remained God) but emptied Himself BY taking something additional: ''the form of a servant'' (morphēn doulou). The same word ''morphē'' is used for both God (v.6) and servant (v.7) — He genuinely possessed both natures. ''Likeness of men'' (homoiōmati) — truly human, yet the word ''likeness'' preserves His uniqueness: He was genuinely human but not merely human.',
   'The kenosis (self-emptying): Christ did not subtract His deity but voluntarily laid aside the independent exercise of divine prerogatives. He veiled His glory and added a human nature. The two natures (divine and human) are united in one person — the hypostatic union. He emptied Himself not of divinity but of its outward manifestation (cf. John 17:5).'),
  (8,
   'And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.',
   'καὶ σχήματι εὑρεθεὶς ὡς ἄνθρωπος ἐταπείνωσεν ἑαυτὸν γενόμενος ὑπήκοος μέχρι θανάτου θανάτου δὲ σταυροῦ',
   'kai schēmati heuretheis hōs anthrōpos etapeinōsen heauton genomenos hypēkoos mechri thanatou thanatou de staurou',
   '''Fashion'' (schēmati — outward appearance, external form, recognisable human shape) — in His earthly life, Christ appeared as an ordinary man. ''Humbled himself'' (etapeinōsen heauton) — a further descent beyond the incarnation. ''Obedient unto death'' (hypēkoos mechri thanatou) — the extent of His submission. Then the staggering addition: ''even the death of the cross'' (thanatou de staurou). Crucifixion was reserved for the lowest criminals — a Roman citizen could not be crucified. For a Jew, ''cursed is every one that hangeth on a tree'' (Gal 3:13). The descent reaches its absolute nadir: from the form of God to the death of a slave.',
   'The descent of Christ: pre-existence → incarnation → servanthood → obedience → death → cross-death. Each step is a further downward movement. The cross is not merely a death but the most shameful form of execution — reserved for slaves, rebels, and the worst criminals. Christ embraced the maximum possible humiliation.'),
  (9,
   'Wherefore God also hath highly exalted him, and given him a name which is above every name:',
   'διὸ καὶ ὁ θεὸς αὐτὸν ὑπερύψωσεν καὶ ἐχαρίσατο αὐτῷ τὸ ὄνομα τὸ ὑπὲρ πᾶν ὄνομα',
   'dio kai ho theos auton hyperypsōsen kai echarisato autō to onoma to hyper pan onoma',
   '''Wherefore'' (dio) — because of His self-humiliation, God exalted Him. This is the great reversal: the lowest place leads to the highest honour. ''Highly exalted'' (hyperypsōsen — super-exalted, exalted to the highest possible degree; hyper adds intensity beyond ordinary exaltation). ''Given'' (echarisato — graciously bestowed, from charis/grace) a name ''above every name'' — not merely ''Jesus'' (a common name) but the name that reveals His identity: Lord (Kyrios), v.11.',
   'The exaltation of Christ: God the Father responds to Christ''s voluntary humiliation by exalting Him to the supreme position. The pattern of Scripture: humiliation precedes exaltation (cf. Matt 23:12; Luke 14:11; James 4:10; 1 Pet 5:6). Christ''s exaltation includes His resurrection, ascension, session at God''s right hand, and coming kingdom.'),
  (10,
   'That at the name of Jesus every knee should bow, of things in heaven, and things in earth, and things under the earth;',
   'ἵνα ἐν τῷ ὀνόματι Ἰησοῦ πᾶν γόνυ κάμψῃ ἐπουρανίων καὶ ἐπιγείων καὶ καταχθονίων',
   'hina en tō onomati Iēsou pan gony kampsē epouraniōn kai epigeiōn kai katachthoniōn',
   'Paul applies Isaiah 45:23 — a passage about Yahweh — directly to Jesus. Every knee in three realms: ''in heaven'' (epouraniōn — angels, glorified saints), ''on earth'' (epigeiōn — living humanity), and ''under the earth'' (katachthoniōn — the dead, and possibly fallen angels/demons). The universality is absolute: no being is exempt. This is not universalism (all being saved) but universal acknowledgment — willing or unwilling, every creature will confess Christ''s lordship.',
   NULL),
  (11,
   'And that every tongue should confess that Jesus Christ is Lord, to the glory of God the Father.',
   'καὶ πᾶσα γλῶσσα ἐξομολογήσηται ὅτι κύριος Ἰησοῦς Χριστὸς εἰς δόξαν θεοῦ πατρός',
   'kai pasa glōssa exomologēsētai hoti kyrios Iēsous Christos eis doxan theou patros',
   '''Confess'' (exomologēsētai — openly acknowledge, profess publicly). ''Jesus Christ is Lord'' (kyrios Iēsous Christos) — the earliest Christian creed (cf. Rom 10:9). ''Lord'' (kyrios) is the Greek equivalent of the Hebrew YHWH (Yahweh). Paul applies the Yahweh text of Isaiah 45:23 to Jesus — an extraordinary claim of deity. The hymn''s final phrase, ''to the glory of God the Father,'' shows that Christ''s lordship does not compete with the Father''s glory but reveals it.',
   'The deity of Christ: Paul attributes to Jesus the worship that Isaiah 45:23 reserves exclusively for Yahweh. Every tongue will confess ''Jesus Christ is Lord'' — kyrios being the LXX translation of the divine name YHWH. Christ''s exaltation to the highest name is the Father''s will and glory, demonstrating Trinitarian harmony, not competition.'),
  (12,
   'Wherefore, my beloved, as ye have always obeyed, not as in my presence only, but now much more in my absence, work out your own salvation with fear and trembling.',
   'Ὥστε ἀγαπητοί μου καθὼς πάντοτε ὑπηκούσατε μὴ ὡς ἐν τῇ παρουσίᾳ μου μόνον ἀλλὰ νῦν πολλῷ μᾶλλον ἐν τῇ ἀπουσίᾳ μου μετὰ φόβου καὶ τρόμου τὴν ἑαυτῶν σωτηρίαν κατεργάζεσθε',
   'Hōste agapētoi mou kathōs pantote hypēkousate mē hōs en tē parousia mou monon alla nyn pollō mallon en tē apousia mou meta phobou kai tromou tēn heautōn sōtērian katergazesthe',
   '''Work out'' (katergazesthe — bring to completion, carry to its intended end, produce) is not ''work for'' but ''work out what God has worked in.'' Salvation is already possessed (''your own salvation'') — the command is to express it in daily life. ''Fear and trembling'' (phobou kai tromou) is not terror of damnation but reverent awe before God''s holiness. Paul applies the Christ-hymn: if Christ was obedient (v.8), be obedient. If Christ humbled Himself, practise humility.',
   'Sanctification: ''Work out'' your salvation means actively expressing in practice what God has already accomplished in you by grace. This is not salvation by works but the outworking of salvation through works. Verse 13 immediately supplies the enabling power: ''for it is God which worketh in you.'' Divine sovereignty and human responsibility work in tandem, not opposition.'),
  (13,
   'For it is God which worketh in you both to will and to do of his good pleasure.',
   'θεὸς γάρ ἐστιν ὁ ἐνεργῶν ἐν ὑμῖν καὶ τὸ θέλειν καὶ τὸ ἐνεργεῖν ὑπὲρ τῆς εὐδοκίας',
   'theos gar estin ho energōn en hymin kai to thelein kai to energein hyper tēs eudokias',
   'The ground (''for''/gar) of verse 12: we can work out salvation because God works in (energōn — energises, produces, is at work within). God does not merely assist — He produces both ''the will'' (to thelein — the desire, the volition) and ''the do'' (to energein — the working, the accomplishing). Even our desire to obey God comes from God. ''Good pleasure'' (eudokias) — God delights in this work; He is not a reluctant helper but a joyful initiator.',
   'Divine enablement: God is the ultimate source of both the desire and the power to live righteously. This is not fatalism (humans still act genuinely) but the deepest kind of freedom — liberated by grace to will and act according to God''s pleasure. Cf. John 15:5 (''without me ye can do nothing''), Ezek 36:26-27 (new heart and spirit), Heb 13:21 (working in you what is pleasing).'),
  (14,
   'Do all things without murmurings and disputings:',
   'πάντα ποιεῖτε χωρὶς γογγυσμῶν καὶ διαλογισμῶν',
   'panta poieite chōris gongysmōn kai dialogismōn',
   '''Murmurings'' (gongysmōn — grumbling, muttering; onomatopoeia imitating the buzz of discontent). ''Disputings'' (dialogismōn — questionings, doubts, arguments). Both plagued Israel in the wilderness (cf. 1 Cor 10:10; Num 14:2). Paul calls the Philippians to a higher standard: cheerful obedience without complaint or internal debate about whether God''s commands are worth obeying.',
   NULL),
  (15,
   'That ye may be blameless and harmless, the sons of God, without rebuke, in the midst of a crooked and perverse nation, among whom ye shine as lights in the world;',
   'ἵνα γένησθε ἄμεμπτοι καὶ ἀκέραιοι τέκνα θεοῦ ἀμώμητα μέσον γενεᾶς σκολιᾶς καὶ διεστραμμένης ἐν οἷς φαίνεσθε ὡς φωστῆρες ἐν κόσμῳ',
   'hina genēsthe amemptoi kai akeraioi tekna theou amōmēta meson geneas skolias kai diestrammenēs en hois fainesthe hōs phōstēres en kosmō',
   '''Blameless'' (amemptoi — without fault), ''harmless'' (akeraioi — pure, unmixed, innocent as unmixed wine or unalloyed metal), ''without rebuke'' (amōmēta — spotless, unblemished like a sacrificial animal). ''Crooked and perverse'' (skolias kai diestrammenēs) echoes Deuteronomy 32:5, Moses'' description of faithless Israel — now applied to the pagan world. ''Lights'' (phōstēres — luminaries, stars, heavenly bodies). Believers are stars in the dark sky of a fallen world.',
   NULL),
  (16,
   'Holding forth the word of life; that I may rejoice in the day of Christ, that I have not run in vain, neither laboured in vain.',
   'λόγον ζωῆς ἐπέχοντες εἰς καύχημα ἐμοὶ εἰς ἡμέραν Χριστοῦ ὅτι οὐκ εἰς κενὸν ἔδραμον οὐδὲ εἰς κενὸν ἐκοπίασα',
   'logon zōēs epechontes eis kauchēma emoi eis hēmeran Christou hoti ouk eis kenon edramon oude eis kenon ekopiasa',
   '''Holding forth'' (epechontes — holding out, offering, presenting). The ''word of life'' (logon zōēs — the Gospel that gives life) is held out to a dying world like a torch in darkness. Paul''s personal stake: if the Philippians persevere, his life''s work is validated. ''Run in vain'' and ''laboured in vain'' use athletic (edramon — I ran) and agricultural (ekopiasa — I toiled) metaphors. Their faithfulness is his vindication.',
   NULL),
  (17,
   'Yea, and if I be offered upon the sacrifice and service of your faith, I joy, and rejoice with you all.',
   'ἀλλ᾽ εἰ καὶ σπένδομαι ἐπὶ τῇ θυσίᾳ καὶ λειτουργίᾳ τῆς πίστεως ὑμῶν χαίρω καὶ συγχαίρω πᾶσιν ὑμῖν',
   'all'' ei kai spendomai epi tē thysia kai leitourgia tēs pisteōs hymōn chairō kai synchairō pasin hymin',
   '''Offered'' (spendomai — poured out as a drink offering/libation). In Jewish sacrifice, a drink offering was poured over the main sacrifice (Num 15:1-10). Paul pictures the Philippians'' faith as the main sacrifice on the altar; his own life (even his death) is merely the drink offering poured over it. Their faith, not his martyrdom, is the primary offering. Yet even in contemplating death, Paul''s response is joy (chairō — I rejoice) and shared joy (synchairō — I rejoice together with you).',
   NULL),
  (18,
   'For the same cause also do ye joy, and rejoice with me.',
   'τὸ δ᾽ αὐτὸ καὶ ὑμεῖς χαίρετε καὶ συγχαίρετέ μοι',
   'to d'' auto kai hymeis chairete kai syncharēte moi',
   'Paul calls the Philippians to share his joy — even the joy of martyrdom. ''Joy'' and ''rejoice with me'' — mutual joy in the face of death. This is not Stoic resignation but Christian triumph: joy that transcends circumstances because it is rooted in Christ, not in comfort.',
   NULL),
  (19,
   'But I trust in the Lord Jesus to send Timotheus shortly unto you, that I also may be of good comfort, when I know your state.',
   'Ἐλπίζω δὲ ἐν κυρίῳ Ἰησοῦ Τιμόθεον ταχέως πέμψαι ὑμῖν ἵνα κἀγὼ εὐψυχῶ γνοὺς τὰ περὶ ὑμῶν',
   'Elpizō de en kyriō Iēsou Timotheon tacheōs pempsai hymin hina kagō eupsychō gnous ta peri hymōn',
   'Paul shifts to practical matters. ''Trust in the Lord Jesus'' (elpizō en kyriō) — even travel plans are submitted to Christ''s lordship. ''Of good comfort'' (eupsychō — be encouraged, be in good spirits; only here in the NT). Paul''s emotional well-being is tied to the Philippians'' spiritual condition — the heart of a true pastor.',
   NULL),
  (20,
   'For I have no man likeminded, who will naturally care for your state.',
   'οὐδένα γὰρ ἔχω ἰσόψυχον ὅστις γνησίως τὰ περὶ ὑμῶν μεριμνήσει',
   'oudena gar echō isopsychon hostis gnēsiōs ta peri hymōn merimnēsei',
   '''Likeminded'' (isopsychon — equal-souled, kindred-spirited; only here in the NT). ''Naturally'' (gnēsiōs — genuinely, sincerely, as a true-born child — not artificially or from obligation). Timothy alone shares Paul''s heartfelt concern for the Philippians. This is extraordinary praise — no one else in Paul''s wide circle matches Timothy''s pastoral care.',
   NULL),
  (21,
   'For all seek their own, not the things which are Jesus Christ''s.',
   'οἱ πάντες γὰρ τὰ ἑαυτῶν ζητοῦσιν οὐ τὰ Χριστοῦ Ἰησοῦ',
   'hoi pantes gar ta heautōn zētousin ou ta Christou Iēsou',
   'A sobering indictment: ''all'' (pantes) seek their own interests, not Christ''s. This echoes the command of v.4 (''look not every man on his own things''). Timothy is the exception who proves the rule. Self-interest pervaded even the early church. The contrast with Christ''s self-emptying (vv.6-8) is stark — most believers resist the downward path of humility.',
   NULL),
  (22,
   'But ye know the proof of him, that, as a son with the father, he hath served with me in the gospel.',
   'τὴν δὲ δοκιμὴν αὐτοῦ γινώσκετε ὅτι ὡς πατρὶ τέκνον σὺν ἐμοὶ ἐδούλευσεν εἰς τὸ εὐαγγέλιον',
   'tēn de dokimēn autou ginōskete hoti hōs patri teknon syn emoi edouleusen eis to euangelion',
   '''Proof'' (dokimēn — tested character, proven worth — like metal refined by fire). Timothy''s character has been tested and found genuine. ''As a son with the father'' — Paul starts to say ''as a son serves a father'' but changes to ''served with me'' (edouleusen — slaved together), elevating Timothy from subordinate to co-labourer. The relationship is both parental and partnership.',
   NULL),
  (23,
   'Him therefore I hope to send presently, so soon as I shall see how it will go with me.',
   'τοῦτον μὲν οὖν ἐλπίζω πέμψαι ὡς ἂν ἀφίδω τὰ περὶ ἐμέ ἐξαυτῆς',
   'touton men oun elpizō pempsai hōs an aphidō ta peri eme exautēs',
   'Paul will send Timothy once his own situation (trial outcome) becomes clear. ''Presently'' (exautēs — immediately, at once). The uncertainty of Paul''s trial (life or death, 1:20-23) governs the timing. This shows practical wisdom — Paul keeps Timothy nearby until the crisis resolves, then sends him with definite news.',
   NULL),
  (24,
   'But I trust in the Lord that I also myself shall come shortly.',
   'πέποιθα δὲ ἐν κυρίῳ ὅτι καὶ αὐτὸς ταχέως ἐλεύσομαι',
   'pepoitha de en kyriō hoti kai autos tacheōs eleusomai',
   '''Trust in the Lord'' (pepoitha en kyriō — have been persuaded, am confident). Paul expects release and a personal visit. This confidence (also expressed in 1:25) was apparently fulfilled — he was released from his first Roman imprisonment. ''Shortly'' (tacheōs — quickly, soon) shows pastoral urgency.',
   NULL),
  (25,
   'Yet I supposed it necessary to send to you Epaphroditus, my brother, and companion in labour, and fellowsoldier, but your messenger, and he that ministered to my wants.',
   'ἀναγκαῖον δὲ ἡγησάμην Ἐπαφρόδιτον τὸν ἀδελφὸν καὶ συνεργὸν καὶ συστρατιώτην μου ὑμῶν δὲ ἀπόστολον καὶ λειτουργὸν τῆς χρείας μου πέμψαι πρὸς ὑμᾶς',
   'anankaion de hēgēsamēn Epaphroditon ton adelphon kai synergon kai systratiōtēn mou hymōn de apostolon kai leitourgon tēs chreias mou pempsai pros hymas',
   'Epaphroditus receives five titles — the richest description of any individual in Paul''s letters: (1) ''brother'' (adelphon — fellow-believer), (2) ''companion in labour'' (synergon — co-worker), (3) ''fellowsoldier'' (systratiōtēn — fellow-soldier), (4) ''your messenger'' (apostolon — envoy, delegate; here used in the non-technical sense), (5) ''he that ministered'' (leitourgon — liturgist, priestly servant). He was the Philippians'' envoy who brought their financial gift to Paul (4:18).',
   NULL),
  (26,
   'For he longed after you all, and was full of heaviness, because that ye had heard that he had been sick.',
   'ἐπειδὴ ἐπιποθῶν ἦν πάντας ὑμᾶς καὶ ἀδημονῶν διότι ἠκούσατε ὅτι ἠσθένησεν',
   'epeidē epipothōn ēn pantas hymas kai adēmonōn dioti ēkousate hoti ēsthenēsen',
   '''Longed'' (epipothōn — yearned intensely, the same word Paul used of his longing for them in 1:8). ''Full of heaviness'' (adēmonōn — deeply distressed, troubled, in anguish — the same word used of Christ in Gethsemane, Matt 26:37). Epaphroditus was distressed not about his own illness but because the Philippians had heard of it and were worried. His concern was for their anxiety, not his own suffering — a beautiful echo of Christ''s self-emptying mindset.',
   NULL),
  (27,
   'For indeed he was sick nigh unto death: but God had mercy on him; and not on him only, but on me also, lest I should have sorrow upon sorrow.',
   'καὶ γὰρ ἠσθένησεν παραπλήσιον θανάτῳ ἀλλ᾽ ὁ θεὸς ἠλέησεν αὐτόν οὐκ αὐτὸν δὲ μόνον ἀλλὰ καὶ ἐμέ ἵνα μὴ λύπην ἐπὶ λύπην σχῶ',
   'kai gar ēsthenēsen paraplēsion thanatō all'' ho theos ēleēsen auton ouk auton de monon alla kai eme hina mē lypēn epi lypēn schō',
   '''Nigh unto death'' (paraplēsion thanatō — neighbouring death, coming alongside death). God healed Epaphroditus — but Paul attributes it to ''mercy'' (ēleēsen), not to apostolic healing gifts. Paul does not always heal (cf. 2 Tim 4:20, Trophimus left sick). ''Sorrow upon sorrow'' (lypēn epi lypēn) — Paul''s imprisonment was already sorrowful; losing Epaphroditus would have been an unbearable addition. Paul''s vulnerability is touching.',
   NULL),
  (28,
   'I sent him therefore the more carefully, that, when ye see him again, ye may rejoice, and that I may be the less sorrowful.',
   'σπουδαιοτέρως οὖν ἔπεμψα αὐτὸν ἵνα ἰδόντες αὐτὸν πάλιν χαρῆτε κἀγὼ ἀλυπότερος ὦ',
   'spoudaioterōs oun epempsa auton hina idontes auton palin charēte kagō alypoteros ō',
   '''More carefully'' (spoudaioterōs — more eagerly, with greater urgency). Paul hastens to send Epaphroditus back so the Philippians can see he is alive and well, and Paul''s own sorrow will be reduced (alypoteros — less sorrowful, not completely free from sorrow while still imprisoned). Joy again: ''ye may rejoice'' (charēte). Paul orchestrates the reunion to maximise joy for all parties.',
   NULL),
  (29,
   'Receive him therefore in the Lord with all gladness; and hold such in reputation:',
   'προσδέχεσθε οὖν αὐτὸν ἐν κυρίῳ μετὰ πάσης χαρᾶς καὶ τοὺς τοιούτους ἐντίμους ἔχετε',
   'prosdechesthe oun auton en kyriō meta pasēs charas kai tous toioutous entimous echete',
   '''Receive'' (prosdechesthe — welcome, accept with open arms). ''With all gladness'' (meta pasēs charas) — not mere tolerance but wholehearted celebration. ''Hold such in reputation'' (entimous echete — hold in honour, esteem highly, consider precious). Paul commands the church to honour Epaphroditus — perhaps anticipating that some might think he failed his mission by falling ill and returning early.',
   NULL),
  (30,
   'Because for the work of Christ he was nigh unto death, not regarding his life, to supply your lack of service toward me.',
   'ὅτι διὰ τὸ ἔργον Χριστοῦ μέχρι θανάτου ἤγγισεν παραβολευσάμενος τῇ ψυχῇ ἵνα ἀναπληρώσῃ τὸ ὑμῶν ὑστέρημα τῆς πρός με λειτουργίας',
   'hoti dia to ergon Christou mechri thanatou ēngisen paraboleusamenos tē psychē hina anaplērōsē to hymōn hysterēma tēs pros me leitourgias',
   '''Not regarding his life'' (paraboleusamenos tē psychē — having gambled with his life, having risked his soul). The word paraboleusamenos comes from the gambling world — to stake everything on a single throw. Epaphroditus wagered his life for Christ''s work. ''To supply your lack'' (anaplērōsē to hysterēma) — he filled the gap that the Philippians'' absence created, completing their service to Paul at the cost of his own health. He exemplifies the mind of Christ from vv.5-8.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Philippians' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 3 (Humility)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ταπεινοφροσύνῃ', 'tapeinophrosynē', 'G5012', 'Humility, lowliness of mind — a compound word (tapeinos + phroneō) possibly coined by Paul. Greco-Roman culture despised humility as servile weakness; Christianity exalted it as the supreme virtue, modelled by Christ Himself.', 1),
  ('κενοδοξίαν', 'kenodoxian', 'G2754', 'Vainglory, empty conceit — from kenos (empty) + doxa (glory). Hollow reputation, the pursuit of human applause without substance.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = 3;

-- Verse 6 (Form of God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μορφῇ', 'morphē', 'G3444', 'Form, essential nature — not mere outward appearance (schēma) but the expression of inner reality. Christ possessed the very nature and essential attributes of God.', 1),
  ('ὑπάρχων', 'hyparchōn', 'G5225', 'Existing, being inherently — present participle indicating continuous, pre-existing state. Not ''becoming'' or ''appearing as'' but eternally subsisting in the divine nature.', 2),
  ('ἁρπαγμόν', 'harpagmon', 'G725', 'Something grasped, seized, clung to — Christ did not regard His equality with God as something to be exploited or selfishly retained, but freely laid aside its outward expression.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = 6;

-- Verse 7 (Emptied himself)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐκένωσεν', 'ekenōsen', 'G2758', 'Emptied, made void, poured out — the kenosis. Christ did not subtract deity but added humanity. He emptied Himself not of divine nature but of divine prerogatives, veiling His glory in human flesh.', 1),
  ('δούλου', 'doulou', 'G1401', 'Slave, bondservant — the lowest social status. The One in the ''form of God'' takes the ''form of a slave'' — the maximum possible descent in status.', 2),
  ('ὁμοιώματι', 'homoiōmati', 'G3667', 'Likeness, resemblance, form — truly human yet not merely human. He was genuinely made in the likeness of men while remaining the Son of God.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = 7;

-- Verse 8 (Death of the cross)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐταπείνωσεν', 'etapeinōsen', 'G5013', 'Humbled, made low — active voice: Christ humbled Himself voluntarily. No one took His life; He laid it down (John 10:18).', 1),
  ('ὑπήκοος', 'hypēkoos', 'G5255', 'Obedient, submissive — from hypo (under) + akouō (to hear). One who listens under authority. Christ''s obedience reversed Adam''s disobedience (Rom 5:19).', 2),
  ('σταυροῦ', 'staurou', 'G4716', 'Cross — the instrument of the most degrading Roman execution. Reserved for slaves and non-citizens. For Jews, death on a ''tree'' was a divine curse (Deut 21:23; Gal 3:13).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = 8;

-- Verse 9 (Highly exalted)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπερύψωσεν', 'hyperupsōsen', 'G5251', 'Super-exalted, exalted to the highest degree — hyper (above, beyond) + hypsoō (to lift up). Found only here in the NT. God raised Christ to the supremely highest position in the universe.', 1),
  ('ὄνομα', 'onoma', 'G3686', 'Name — in Semitic thought, the name reveals the nature and authority of the person. The ''name above every name'' is Lord (kyrios, v.11) — the divine name.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = 9;

-- Verse 12 (Work out salvation)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κατεργάζεσθε', 'katergazesthe', 'G2716', 'Work out, bring to completion, carry to its intended end — not ''work for'' but ''work out what God has worked in.'' The kata prefix intensifies: bring the work to its full accomplishment.', 1),
  ('φόβου', 'phobou', 'G5401', 'Fear, reverence, awe — not slavish terror of damnation but holy reverence before a God who is at work within you. The awareness that salvation is God''s serious, sacred work.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = 12;

-- Verse 13 (God works in you)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐνεργῶν', 'energōn', 'G1754', 'Working, energising, producing — present participle: God is continually at work within believers. The source of English ''energy.'' God is the divine energiser of both desire and action.', 1),
  ('θέλειν', 'thelein', 'G2309', 'To will, to desire, to purpose — God produces the very desire to obey. Even the want-to comes from Him.', 2),
  ('εὐδοκίας', 'eudokias', 'G2107', 'Good pleasure, delight, gracious will — God''s work in believers is not reluctant obligation but joyful, delighted purpose.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = 13;

-- Verse 30 (Gambled his life)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παραβολευσάμενος', 'paraboleusamenos', 'G3851', 'Having risked, having gambled — from parabolē (a venture, a wager). Epaphroditus staked his life like a gambler stakes everything on a single throw. Only here in the NT.', 1),
  ('λειτουργίας', 'leitourgias', 'G3009', 'Service, ministry, liturgical service — from laos (people) + ergon (work). Originally public service at one''s own expense; then priestly/sacred service. Epaphroditus''s financial support was a priestly act.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = 30;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Unity and like-mindedness
  (2, 'Romans 12:16', 1), (2, 'Romans 15:5', 2), (2, '1 Corinthians 1:10', 3),
  -- v3: Humility
  (3, 'Romans 12:10', 1), (3, 'Galatians 5:26', 2), (3, 'Ephesians 4:2', 3), (3, '1 Peter 5:5', 4),
  -- v5: Mind of Christ
  (5, 'Romans 15:5', 1), (5, '1 Corinthians 2:16', 2), (5, '1 Peter 2:21', 3),
  -- v6: Form of God
  (6, 'John 1:1-3', 1), (6, 'John 17:5', 2), (6, 'Colossians 1:15-17', 3), (6, 'Hebrews 1:3', 4),
  -- v7: Emptied himself
  (7, 'John 1:14', 1), (7, '2 Corinthians 8:9', 2), (7, 'Galatians 4:4', 3), (7, 'Hebrews 2:14-17', 4),
  -- v8: Death of the cross
  (8, 'Romans 5:19', 1), (8, 'Hebrews 5:8', 2), (8, 'Hebrews 12:2', 3), (8, 'Galatians 3:13', 4),
  -- v9: Exaltation
  (9, 'Acts 2:33', 1), (9, 'Ephesians 1:20-21', 2), (9, 'Hebrews 1:4', 3),
  -- v10: Every knee bows
  (10, 'Isaiah 45:23', 1), (10, 'Romans 14:11', 2), (10, 'Revelation 5:13', 3),
  -- v11: Jesus is Lord
  (11, 'Romans 10:9', 1), (11, '1 Corinthians 8:6', 2), (11, '1 Corinthians 12:3', 3),
  -- v12: Work out salvation
  (12, 'Ephesians 2:8-10', 1), (12, 'Hebrews 12:28', 2), (12, '2 Peter 1:10', 3),
  -- v13: God works in you
  (13, 'John 15:5', 1), (13, 'Ezekiel 36:26-27', 2), (13, 'Hebrews 13:21', 3),
  -- v15: Lights in the world
  (15, 'Deuteronomy 32:5', 1), (15, 'Matthew 5:14-16', 2), (15, 'Daniel 12:3', 3), (15, 'Ephesians 5:8', 4),
  -- v16: Word of life
  (16, '1 John 1:1', 1), (16, '2 Timothy 2:15', 2), (16, '1 Thessalonians 2:19', 3),
  -- v17: Drink offering
  (17, '2 Timothy 4:6', 1), (17, 'Numbers 15:1-10', 2), (17, 'Romans 12:1', 3),
  -- v22: Timothy's proof
  (22, '1 Corinthians 4:17', 1), (22, '1 Timothy 1:2', 2), (22, '2 Timothy 1:2', 3),
  -- v25: Epaphroditus
  (25, 'Philippians 4:18', 1), (25, '2 Corinthians 8:23', 2),
  -- v27: Sick nigh unto death
  (27, '2 Timothy 4:20', 1), (27, 'James 5:14-15', 2),
  -- v30: Risked his life
  (30, 'Acts 15:26', 1), (30, 'Romans 16:4', 2), (30, 'Revelation 12:11', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Philippians Chapter 2 Complete!
-- 30 verses · 10 key verses with word studies (26 words)
-- Cross-references for 18 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════