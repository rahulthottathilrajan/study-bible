-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 9 — The Cheerful Giver and God's Indescribable Gift
-- 15 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 9,
  '2 Corinthians 9 completes Paul''s theology of giving with some of the most beloved verses on generosity in all of Scripture. Paul explains why he sent the brothers ahead: to ensure the collection is ready ''as a matter of bounty, and not as of covetousness'' (v.5). The harvest principle follows: ''He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully'' (v.6). Then the famous declaration: ''Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for God loveth a cheerful giver'' (v.7). God''s power to provide is unlimited: ''God is able to make all grace abound toward you; that ye, always having all sufficiency in all things, may abound to every good work'' (v.8). The ''all'' language is striking — five occurrences in one verse. Paul quotes Psalm 112:9: ''He hath dispersed abroad; he hath given to the poor; his righteousness remaineth for ever'' (v.9). The God who provides seed and bread will ''multiply your seed sown, and increase the fruits of your righteousness'' (v.10). The collection is not merely financial relief but a cause of ''many thanksgivings unto God'' (v.12). The Corinthians'' generosity will cause others to glorify God ''for your professed subjection unto the gospel of Christ'' (v.13). The chapter and the collection section culminate: ''Thanks be unto God for his unspeakable gift'' (v.15).',
  'The Cheerful Giver, God''s Indescribable Gift',
  'ἱλαρός (hilaros)',
  'Cheerful, joyful, glad — from the root that gives us ''hilarity.'' God loves the giver whose heart is glad, not reluctant. This adjective appears only here in the NT. Cheerful giving mirrors the character of God himself, who gives richly and generously without reluctance.',
  '["Preparation and Readiness (vv.1-5): For as touching the ministering to the saints it is superfluous for me to write to you for I know the forwardness of your mind for which I boast of you to them of Macedonia that Achaia was ready a year ago and your zeal hath provoked very many; yet have I sent the brethren lest our boasting of you should be in vain in this behalf that as I said ye may be ready lest haply if they of Macedonia come with me and find you unprepared we that we say not ye should be ashamed in this same confident boasting; therefore I thought it necessary to exhort the brethren that they would go before unto you and make up beforehand your bounty whereof ye had notice before that the same might be ready as a matter of bounty and not as of covetousness","Sowing and Reaping: The Cheerful Giver (vv.6-9): But this I say he which soweth sparingly shall reap also sparingly and he which soweth bountifully shall reap also bountifully; every man according as he purposeth in his heart so let him give not grudgingly or of necessity for God loveth a cheerful giver; and God is able to make all grace abound toward you that ye always having all sufficiency in all things may abound to every good work as it is written he hath dispersed abroad he hath given to the poor his righteousness remaineth for ever","God Multiplies the Harvest (vv.10-11): Now he that ministereth seed to the sower both minister bread for your food and multiply your seed sown and increase the fruits of your righteousness; being enriched in every thing to all bountifulness which causeth through us thanksgiving to God","Thanksgiving and Glory to God (vv.12-15): For the administration of this service not only supplieth the want of the saints but is abundant also by many thanksgivings unto God; whiles by the experiment of this ministration they glorify God for your professed subjection unto the gospel of Christ and for your liberal distribution unto them and unto all men; and by their prayer for you which long after you for the exceeding grace of God in you; thanks be unto God for his unspeakable gift"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 15 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'For as touching the ministering to the saints, it is superfluous for me to write to you:',
   'Περὶ μὲν γὰρ τῆς διακονίας τῆς εἰς τοὺς ἁγίους περισσόν μοί ἐστιν τὸ γράφειν ὑμῖν',
   'Peri men gar tēs diakonias tēs eis tous hagious perisson moi estin to graphein hymin',
   '''Ministering to the saints'' (diakonias tēs eis tous hagious — the service directed toward the holy ones; the collection for the Jerusalem church). ''Superfluous'' (perisson — unnecessary, more than needed). A tactful rhetorical move: Paul says he doesn''t need to write about this (then writes two full chapters). The effect: you know this already; I''m just reminding you.',
   NULL),
  (2, 'For I know the forwardness of your mind, for which I boast of you to them of Macedonia, that Achaia was ready a year ago; and your zeal hath provoked very many.',
   'οἶδα γὰρ τὴν προθυμίαν ὑμῶν ἣν ὑπὲρ ὑμῶν καυχῶμαι Μακεδόσιν ὅτι Ἀχαΐα παρεσκεύασται ἀπὸ πέρυσι καὶ ὁ ἐξ ὑμῶν ζῆλος ἠρέθισεν τοὺς πλείονας',
   'oida gar tēn prothymian hymōn hēn hyper hymōn kauchōmai Makedosin hoti Achaia pareskeuastai apo perysi kai ho ex hymōn zēlos ērethisen tous pleionas',
   '''Forwardness'' (prothymian — eagerness, readiness). ''Achaia was ready a year ago'' — Paul had boasted to the Macedonians about Corinth''s early initiative. ''Your zeal hath provoked very many'' (ērethisen tous pleionas — stirred up, stimulated the majority). Healthy competition in generosity: Corinth''s eagerness spurred Macedonia; now Macedonia''s actual giving will spur Corinth to completion.',
   NULL),
  (3, 'Yet have I sent the brethren, lest our boasting of you should be in vain in this behalf; that, as I said, ye may be ready:',
   'ἔπεμψα δὲ τοὺς ἀδελφούς ἵνα μὴ τὸ καύχημα ἡμῶν τὸ ὑπὲρ ὑμῶν κενωθῇ ἐν τῷ μέρει τούτῳ ἵνα καθὼς ἔλεγον παρεσκευασμένοι ἦτε',
   'epempsa de tous adelphous hina mē to kauchēma hēmōn to hyper hymōn kenōthē en tō merei toutō hina kathōs elegon pareskeuasmenoi ēte',
   '''Lest our boasting be in vain'' (kenōthē — emptied, made void). Paul is candid: he has put his reputation on the line by boasting about the Corinthians'' generosity. If they fail to follow through, both Paul and the Corinthians will be embarrassed. He sends the brothers ahead to ensure readiness.',
   NULL),
  (4, 'Lest haply if they of Macedonia come with me, and find you unprepared, we (that we say not, ye) should be ashamed in this same confident boasting.',
   'μήπως ἐὰν ἔλθωσιν σὺν ἐμοὶ Μακεδόνες καὶ εὕρωσιν ὑμᾶς ἀπαρασκευάστους καταισχυνθῶμεν ἡμεῖς ἵνα μὴ λέγωμεν ὑμεῖς ἐν τῇ ὑποστάσει ταύτῃ τῆς καυχήσεως',
   'mēpōs ean elthōsin syn emoi Makedones kai heurōsin hymas aparaskeuastous kataischynthōmen hēmeis hina mē legōmen hymeis en tē hypostasei tautē tēs kauchēseōs',
   '''Unprepared'' (aparaskeuastous — not ready, caught off guard). ''Ashamed'' (kataischynthōmen — put to shame). ''That we say not, ye'' — a tactful understatement: Paul says he would be ashamed (protecting the Corinthians'' pride), but the parenthetical ''not to mention you'' makes the point. The Macedonians, who gave out of poverty, must not arrive to find wealthy Corinth unprepared.',
   NULL),
  (5, 'Therefore I thought it necessary to exhort the brethren, that they would go before unto you, and make up beforehand your bounty, whereof ye had notice before, that the same might be ready, as a matter of bounty, and not as of covetousness.',
   'ἀναγκαῖον οὖν ἡγησάμην παρακαλέσαι τοὺς ἀδελφοὺς ἵνα προέλθωσιν εἰς ὑμᾶς καὶ προκαταρτίσωσιν τὴν προκατηγγελμένην εὐλογίαν ὑμῶν ταύτην ἑτοίμην εἶναι οὕτως ὡς εὐλογίαν καὶ μὴ ὡς πλεονεξίαν',
   'anankaion oun hēgēsamēn parakalesai tous adelphous hina proelthōsin eis hymas kai prokatartisōsin tēn prokatēngelmenēn eulogian hymōn tautēn hetoimēn einai houtōs hōs eulogian kai mē hōs pleonexian',
   '''Bounty'' (eulogian — blessing; the gift is called a ''blessing'' — both to the giver and the receiver). ''Covetousness'' (pleonexian — greediness, grasping). The gift must be prepared willingly (as a blessing) not extracted grudgingly (as extortion). The manner of giving matters as much as the amount.',
   NULL),
  (6, 'But this I say, He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully.',
   'τοῦτο δέ ὁ σπείρων φειδομένως φειδομένως καὶ θερίσει καὶ ὁ σπείρων ἐπ᾿ εὐλογίαις ἐπ᾿ εὐλογίαις καὶ θερίσει',
   'touto de ho speirōn pheidomenōs pheidomenōs kai therisei kai ho speirōn ep'' eulogiais ep'' eulogiais kai therisei',
   '''Soweth sparingly'' (speirōn pheidomenōs — sowing with withholding, sowing in a miserly way). ''Soweth bountifully'' (speirōn ep'' eulogiais — sowing upon blessings, sowing generously). ''Reap'' (therisei — will harvest). The agricultural metaphor: giving is sowing, and God guarantees a proportional harvest. This is not a prosperity gospel promise (''give to get rich'') but a spiritual principle: generosity produces spiritual and relational abundance. The harvest includes thanksgivings, prayers, and the glory of God (vv.11-13).',
   NULL),
  (7, 'Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for God loveth a cheerful giver.',
   'ἕκαστος καθὼς προαιρεῖται τῇ καρδίᾳ μὴ ἐκ λύπης ἢ ἐξ ἀνάγκης ἱλαρὸν γὰρ δότην ἀγαπᾷ ὁ θεός',
   'hekastos kathōs proaireitai tē kardia mē ek lypēs ē ex anankēs hilaron gar dotēn agapa ho theos',
   '''Purposeth in his heart'' (proaireitai tē kardia — decides deliberately in the heart; not impulsive but thoughtful). ''Not grudgingly'' (mē ek lypēs — not out of grief/sorrow; giving should not hurt). ''Not of necessity'' (mē ex anankēs — not from compulsion; no one is forced). ''Cheerful'' (hilaron — glad, joyful; the root of English ''hilarious''). ''God loveth a cheerful giver'' — an echo of Proverbs 22:8 (LXX): God loves the person whose giving is a joy, not a burden. The verse establishes three principles: giving is deliberate (purposeth), voluntary (not of necessity), and joyful (cheerful).',
   'This verse is the classic text on the spirit of Christian giving. Three negative and one positive: (1) not impulsive but purposed, (2) not grudging but glad, (3) not compelled but voluntary, (4) cheerful — hilaros. God does not merely accept the cheerful giver; he loves (agapa) the cheerful giver. The disposition of the heart matters as much as the gift. A million dollars given grudgingly is less pleasing to God than a penny given gladly. This principle disqualifies all giving systems based on guilt, manipulation, or coercion.'),
  (8, 'And God is able to make all grace abound toward you; that ye, always having all sufficiency in all things, may abound to every good work:',
   'δυνατὸς δὲ ὁ θεὸς πᾶσαν χάριν περισσεῦσαι εἰς ὑμᾶς ἵνα ἐν παντὶ πάντοτε πᾶσαν αὐτάρκειαν ἔχοντες περισσεύητε εἰς πᾶν ἔργον ἀγαθόν',
   'dynatos de ho theos pasan charin perisseusai eis hymas hina en panti pantote pasan autarkeian echontes perisseuhēte eis pan ergon agathon',
   '''God is able'' (dynatos ho theos — God has the power). Five ''all'' words: ''all grace'' (pasan charin), ''always'' (pantote), ''all sufficiency'' (pasan autarkeian), ''all things'' (en panti), ''every good work'' (pan ergon). ''Sufficiency'' (autarkeian — self-sufficiency, contentment; cf. 1 Tim 6:6 — the same word: God-dependent sufficiency). The logic: God pours out abundant grace → believers have enough for everything → the surplus overflows into good works. God provides not merely enough to survive but enough to be generous.',
   'This verse is the theological guarantee behind cheerful giving. The giver need not fear running out because ''God is able'' to supply. The five ''all'' words create a totality of provision: all grace, always, all sufficiency, in all things, for every good work. Autarkeia (sufficiency) reappears from 1 Timothy 6:6, here applied to generosity: God provides enough that the believer always has surplus for good works. This is not prosperity theology (God makes the giver wealthy) but sufficiency theology (God ensures the giver always has enough to keep giving).'),
  (9, '(As it is written, He hath dispersed abroad; he hath given to the poor: his righteousness remaineth for ever.',
   'καθὼς γέγραπται ἐσκόρπισεν ἔδωκεν τοῖς πένησιν ἡ δικαιοσύνη αὐτοῦ μένει εἰς τὸν αἰῶνα',
   'kathōs gegraptai eskorpisen edōken tois penēsin hē dikaiosynē autou menei eis ton aiōna',
   'Quoting Psalm 112:9. ''Dispersed abroad'' (eskorpisen — scattered freely; generous distribution). ''Given to the poor'' (edōken tois penēsin — gave to the needy). ''His righteousness remaineth for ever'' — the righteous person''s generosity has an enduring, eternal effect. Giving to the poor is not a loss but a permanent investment in righteousness that ''remains forever.''',
   NULL),
  (10, 'Now he that ministereth seed to the sower both minister bread for your food, and multiply your seed sown, and increase the fruits of your righteousness;)',
   'ὁ δὲ ἐπιχορηγῶν σπέρμα τῷ σπείροντι καὶ ἄρτον εἰς βρῶσιν χορηγήσαι καὶ πληθύναι τὸν σπόρον ὑμῶν καὶ αὐξήσαι τὰ γενήματα τῆς δικαιοσύνης ὑμῶν',
   'ho de epichorēgōn sperma tō speironti kai arton eis brōsin chorēgēsai kai plēthynai ton sporon hymōn kai auxēsai ta genēmata tēs dikaiosynēs hymōn',
   '''Ministereth seed'' (epichorēgōn sperma — the one who supplies seed; echoing Isa 55:10). ''Minister bread'' (chorēgēsai arton — supply bread for food). ''Multiply your seed'' (plēthynai ton sporon — increase your seed for sowing). ''Fruits of your righteousness'' (genēmata tēs dikaiosynēs — the harvest of your righteousness). God has two roles: he provides bread for the giver''s sustenance and seed for the giver''s sowing. What God multiplies is not the giver''s personal wealth but the giver''s capacity to keep sowing — to keep being generous.',
   NULL),
  (11, 'Being enriched in every thing to all bountifulness, which causeth through us thanksgiving to God.',
   'ἐν παντὶ πλουτιζόμενοι εἰς πᾶσαν ἁπλότητα ἥτις κατεργάζεται δι᾿ ἡμῶν εὐχαριστίαν τῷ θεῷ',
   'en panti ploutizomenoi eis pasan haplotēta hētis katergazetai di'' hēmōn eucharistian tō theō',
   '''Enriched in every thing'' (en panti ploutizomenoi — being made wealthy in every respect). ''To all bountifulness'' (eis pasan haplotēta — for the purpose of complete generosity). ''Thanksgiving to God'' (eucharistian tō theō). The purpose of enrichment is generosity; the purpose of generosity is thanksgiving to God. The chain: God enriches → believer gives generously → recipients give thanks to God. The final destination of all material provision is the glory of God through thanksgiving.',
   NULL),
  (12, 'For the administration of this service not only supplieth the want of the saints, but is abundant also by many thanksgivings unto God;',
   'ὅτι ἡ διακονία τῆς λειτουργίας ταύτης οὐ μόνον ἐστὶν προσαναπληροῦσα τὰ ὑστερήματα τῶν ἁγίων ἀλλὰ καὶ περισσεύουσα διὰ πολλῶν εὐχαριστιῶν τῷ θεῷ',
   'hoti hē diakonia tēs leitourgias tautēs ou monon estin prosanaplērousa ta hysterēmata tōn hagiōn alla kai perisseuousa dia pollōn eucharistiōn tō theō',
   '''Administration'' (diakonia — service). ''Service'' (leitourgias — liturgy, public service; originally a civic duty in Greek culture, then applied to religious service). ''Supplieth the want'' (prosanaplērousa ta hysterēmata — filling up the deficiencies). ''Abundant by many thanksgivings'' — the collection has a double effect: material relief for the saints and spiritual harvest of thanksgiving to God. Giving is both horizontal (meeting human need) and vertical (producing praise to God).',
   NULL),
  (13, 'Whiles by the experiment of this ministration they glorify God for your professed subjection unto the gospel of Christ, and for your liberal distribution unto them, and unto all men;',
   'διὰ τῆς δοκιμῆς τῆς διακονίας ταύτης δοξάζοντες τὸν θεὸν ἐπὶ τῇ ὑποταγῇ τῆς ὁμολογίας ὑμῶν εἰς τὸ εὐαγγέλιον τοῦ Χριστοῦ καὶ ἁπλότητι τῆς κοινωνίας εἰς αὐτοὺς καὶ εἰς πάντας',
   'dia tēs dokimēs tēs diakonias tautēs doxazontes ton theon epi tē hypotagē tēs homologias hymōn eis to euangelion tou Christou kai haplotēti tēs koinōnias eis autous kai eis pantas',
   '''Experiment'' (dokimēs — proof, tested evidence; the collection is a proving ground for the gospel). ''They glorify God'' — the Jerusalem recipients will praise God. ''Professed subjection unto the gospel'' (hypotagē tēs homologias eis to euangelion — the obedience that flows from your confession of the gospel). ''Liberal distribution'' (haplotēti tēs koinōnias — generous sharing/fellowship). Giving proves that the gospel confession is genuine: faith without works is dead, and the Corinthians'' generosity demonstrates that their profession of Christ is real.',
   NULL),
  (14, 'And by their prayer for you, which long after you for the exceeding grace of God in you.',
   'καὶ αὐτῶν δεήσει ὑπὲρ ὑμῶν ἐπιποθούντων ὑμᾶς διὰ τὴν ὑπερβάλλουσαν χάριν τοῦ θεοῦ ἐφ᾿ ὑμῖν',
   'kai autōn deēsei hyper hymōn epipothountōn hymas dia tēn hyperballousan charin tou theou eph'' hymin',
   '''Their prayer for you'' — the recipients will pray for the donors. ''Long after you'' (epipothountōn — yearn for, deeply desire). ''Exceeding grace of God in you'' (hyperballousan charin — the surpassing grace). The collection creates a circuit of love: Corinth gives → Jerusalem receives → Jerusalem prays for Corinth → God is glorified. Material generosity produces prayer fellowship across geographic and cultural boundaries.',
   NULL),
  (15, 'Thanks be unto God for his unspeakable gift.',
   'χάρις τῷ θεῷ ἐπὶ τῇ ἀνεκδιηγήτῳ αὐτοῦ δωρεᾷ',
   'charis tō theō epi tē anekdiēgētō autou dōrea',
   '''Thanks'' (charis — grace/thanks; the word that has dominated chapters 8-9 appears one final time). ''Unspeakable'' (anekdiēgētō — indescribable, beyond telling; from a [not] + ek [out] + diēgeomai [to narrate fully]: that which cannot be fully narrated). ''Gift'' (dōrea — free gift). The ''unspeakable gift'' is most likely Christ himself — the ultimate gift that makes all other giving possible and meaningful. All human generosity is a response to and reflection of God''s inexpressible gift of his Son. The entire discussion of money and collections culminates in doxology before the supreme gift that transcends all description.',
   'This concluding verse lifts the entire discussion of money, collections, and financial administration into the realm of worship. Paul has been talking about pennies and logistics for two chapters; he ends with an exclamation about the gift that cannot be put into words. The ''unspeakable gift'' (anekdiēgētos dōrea) is almost certainly Christ — the incarnation, the cross, the resurrection. All Christian generosity flows from this one gift: ''For ye know the grace of our Lord Jesus Christ'' (8:9). Human giving is always a response to divine giving. The doxological ending reminds us that all stewardship is ultimately theology — how we handle money reveals how we understand grace.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 9;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.7 cheerful
  ('ἱλαρός', 'hilaros', 'G2431', 'Cheerful, joyful, glad — the root of English ''hilarious.'' Found only here in the NT. God does not merely tolerate cheerful giving; he loves (agapa) it. The cheerful giver reflects God''s own character: God gives abundantly, freely, and with delight. Giving done from obligation or guilt does not reflect the divine nature.', 1),
  -- v.7 purposeth
  ('προαιρέομαι', 'proaireomai', 'G4255', 'To choose beforehand, to purpose, to decide in advance — from pro (before) + haireomai (to choose). Giving should be the result of deliberate, prayerful decision, not impulsive emotion or external pressure. The heart decides first; the hand follows.', 2),
  -- v.8 sufficiency
  ('αὐτάρκεια', 'autarkeia', 'G841', 'Sufficiency, contentment, self-sufficiency — from autos (self) + arkeō (to suffice). Here used not of personal contentment (as in 1 Tim 6:6) but of having enough to give: God provides ''all sufficiency in all things'' so that the believer may ''abound to every good work.'' The purpose of divine provision is not accumulation but distribution.', 3),
  -- v.12 service/liturgy
  ('λειτουργία', 'leitourgia', 'G3009', 'Service, ministry, liturgy — from leitos (public) + ergon (work). Originally a civic duty performed by wealthy citizens for the public good. In the LXX, applied to priestly service in the temple. Paul elevates the financial collection to the level of priestly service: handling money for the saints is a sacred act, a liturgy offered to God.', 4),
  -- v.15 unspeakable
  ('ἀνεκδιήγητος', 'anekdiēgētos', 'G411', 'Indescribable, unspeakable, beyond narration — from a (not) + ek (out) + diēgeomai (to narrate thoroughly). Found only here in the NT. Applied to God''s gift (Christ), it means that human language cannot capture the full reality. The gift exceeds all description. After two chapters of practical financial discussion, Paul ends in wordless wonder before the ultimate Gift.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 9
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 7 WHEN 2 THEN 7
    WHEN 3 THEN 8
    WHEN 4 THEN 12
    WHEN 5 THEN 15
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.6 sowing and reaping
  (6, 'Galatians 6:7-9', 1),
  (6, 'Proverbs 11:24-25', 2),
  (6, 'Luke 6:38', 3),
  -- v.7 cheerful giver
  (7, 'Proverbs 22:8 LXX', 4),
  (7, 'Romans 12:8', 5),
  (7, 'Deuteronomy 15:10', 6),
  -- v.8 God is able / all sufficiency
  (8, 'Philippians 4:19', 7),
  (8, 'Ephesians 3:20', 8),
  (8, '1 Timothy 6:6', 9),
  -- v.9 dispersed / given to poor
  (9, 'Psalm 112:9', 10),
  (9, 'Proverbs 19:17', 11),
  -- v.10 seed to the sower
  (10, 'Isaiah 55:10', 12),
  (10, 'Hosea 10:12', 13),
  -- v.13 subjection to the gospel
  (13, 'James 2:14-17', 14),
  (13, 'Romans 10:16', 15),
  -- v.15 unspeakable gift
  (15, 'John 3:16', 16),
  (15, 'Romans 8:32', 17),
  (15, '2 Corinthians 8:9', 18),
  (15, 'James 1:17', 19)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 9
  AND v.verse_number = cr.verse_number;
