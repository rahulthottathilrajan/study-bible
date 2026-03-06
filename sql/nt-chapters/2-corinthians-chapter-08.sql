-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 8 — The Grace of Generous Giving
-- 24 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 8,
  '2 Corinthians 8-9 form Paul''s most extended treatment of Christian generosity, centered on the collection for the impoverished Jerusalem church. Paul holds up the Macedonian churches as a model: ''in a great trial of affliction the abundance of their joy and their deep poverty abounded unto the riches of their liberality'' (v.2). They gave ''beyond their power'' and begged Paul for the ''fellowship of the ministering to the saints'' (v.4). The theological foundation is stunning: ''For ye know the grace of our Lord Jesus Christ, that, though he was rich, yet for your sakes he became poor, that ye through his poverty might be rich'' (v.9). Paul does not command but appeals: ''I speak not by commandment, but by occasion of the forwardness of others, and to prove the sincerity of your love'' (v.8). He advocates equality: ''that there may be equality: as it is written, He that had gathered much had nothing over; and he that had gathered little had no lack'' (vv.14-15, quoting Exod 16:18 on the manna). Paul sends Titus and two unnamed brothers to administer the collection with full transparency: ''avoiding this, that no man should blame us in this abundance which is administered by us'' (v.20). The entire chapter frames giving not as obligation but as ''grace'' (charis) — the word appears ten times.',
  'The Grace of Giving, Christ''s Poverty for Our Riches',
  'χάρις (charis)',
  'Grace — used ten times in this chapter alone with the sense of gracious giving, generous gift, and the divine grace that motivates human generosity. Giving is not law but grace: the same grace that made Christ poor for our enrichment flows through believers into generous giving. The collection itself is called a ''grace'' (v.6).',
  '["The Example of Macedonia (vv.1-5): Moreover brethren we do you to wit of the grace of God bestowed on the churches of Macedonia how that in a great trial of affliction the abundance of their joy and their deep poverty abounded unto the riches of their liberality for to their power I bear record yea and beyond their power they were willing of themselves praying us with much intreaty that we would receive the gift and take upon us the fellowship of the ministering to the saints and this they did not as we hoped but first gave their own selves to the Lord and unto us by the will of God","The Appeal to Corinth: Prove Your Love (vv.6-9): Insomuch that we desired Titus that as he had begun so he would also finish in you the same grace also therefore as ye abound in every thing in faith and utterance and knowledge and in all diligence and in your love to us see that ye abound in this grace also; I speak not by commandment but by occasion of the forwardness of others and to prove the sincerity of your love; for ye know the grace of our Lord Jesus Christ that though he was rich yet for your sakes he became poor that ye through his poverty might be rich","Finish What You Began: Equality and the Manna Principle (vv.10-15): And herein I give my advice for this is expedient for you who have begun before not only to do but also to be forward a year ago now therefore perform the doing of it that as there was a readiness to will so there may be a performance also out of that which ye have; for if there be first a willing mind it is accepted according to that a man hath and not according to that he hath not; for I mean not that other men be eased and ye burdened but by an equality that now at this time your abundance may be a supply for their want that their abundance also may be a supply for your want that there may be equality as it is written he that had gathered much had nothing over and he that had gathered little had no lack","Titus and the Brothers: Integrity in Administration (vv.16-24): But thanks be to God which put the same earnest care into the heart of Titus for you for indeed he accepted the exhortation but being more forward of his own accord he went unto you; and we have sent with him the brother whose praise is in the gospel throughout all the churches and not that only but who was also chosen of the churches to travel with us with this grace; providing for honest things not only in the sight of the Lord but also in the sight of men and we have sent with them our brother whom we have oftentimes proved diligent in many things; whether any do enquire of Titus he is my partner and fellowhelper concerning you or our brethren be enquired of they are the messengers of the churches and the glory of Christ"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 24 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Moreover, brethren, we do you to wit of the grace of God bestowed on the churches of Macedonia;',
   'Γνωρίζομεν δὲ ὑμῖν ἀδελφοί τὴν χάριν τοῦ θεοῦ τὴν δεδομένην ἐν ταῖς ἐκκλησίαις τῆς Μακεδονίας',
   'Gnōrizomen de hymin adelphoi tēn charin tou theou tēn dedomenēn en tais ekklēsiais tēs Makedonias',
   '''We do you to wit'' (gnōrizomen — we make known to you). ''Grace of God bestowed'' (charin tou theou dedomenēn — the grace of God that has been given; giving itself is described as God''s grace — not a human achievement but a divine gift). ''Churches of Macedonia'' — Philippi, Thessalonica, and Berea, all impoverished communities under persecution. The Macedonians'' generosity was not a natural virtue but a supernatural grace.',
   NULL),
  (2, 'How that in a great trial of affliction the abundance of their joy and their deep poverty abounded unto the riches of their liberality.',
   'ὅτι ἐν πολλῇ δοκιμῇ θλίψεως ἡ περισσεία τῆς χαρᾶς αὐτῶν καὶ ἡ κατὰ βάθους πτωχεία αὐτῶν ἐπερίσσευσεν εἰς τὸ πλοῦτος τῆς ἁπλότητος αὐτῶν',
   'hoti en pollē dokimē thlipseōs hē perisseia tēs charas autōn kai hē kata bathous ptōcheia autōn eperisseusen eis to ploutos tēs haplotētos autōn',
   '''Great trial of affliction'' (pollē dokimē thlipseōs — severe testing by tribulation). ''Abundance of their joy'' (perisseia tēs charas — overflowing joy). ''Deep poverty'' (kata bathous ptōcheia — down-to-the-depths poverty; ptōcheia is the most extreme form of poverty: destitution, beggary). ''Riches of their liberality'' (ploutos tēs haplotētos — wealth of generosity/simplicity). The equation is paradoxical: affliction + joy + poverty = rich generosity. The Macedonians gave not out of surplus but out of lack — and their lack ''abounded'' into wealth.',
   NULL),
  (3, 'For to their power, I bear record, yea, and beyond their power they were willing of themselves;',
   'ὅτι κατὰ δύναμιν μαρτυρῶ καὶ ὑπὲρ δύναμιν αὐθαίρετοι',
   'hoti kata dynamin martyrō kai hyper dynamin authairetoi',
   '''To their power'' (kata dynamin — according to their ability). ''Beyond their power'' (hyper dynamin — exceeding their means). ''Willing of themselves'' (authairetoi — self-chosen, voluntary; from autos + haireomai, choosing for themselves). No one pressured the Macedonians; they gave spontaneously and extravagantly, beyond what anyone would reasonably expect from people in their circumstances.',
   NULL),
  (4, 'Praying us with much intreaty that we would receive the gift, and take upon us the fellowship of the ministering to the saints.',
   'μετὰ πολλῆς παρακλήσεως δεόμενοι ἡμῶν τὴν χάριν καὶ τὴν κοινωνίαν τῆς διακονίας τῆς εἰς τοὺς ἁγίους δέξασθαι ἡμᾶς',
   'meta pollēs paraklēseōs deomenoi hēmōn tēn charin kai tēn koinōnian tēs diakonias tēs eis tous hagious dexasthai hēmas',
   '''Praying us with much intreaty'' — the Macedonians begged Paul to let them give. The roles are reversed: typically the fundraiser persuades the donor; here the donors implore the fundraiser. ''Fellowship of the ministering'' (koinōnian tēs diakonias — the partnership of the service). The collection is not mere charity but koinōnia — shared fellowship expressed in material support. Giving is participation in the community of faith.',
   NULL),
  (5, 'And this they did, not as we hoped, but first gave their own selves to the Lord, and unto us by the will of God.',
   'καὶ οὐ καθὼς ἠλπίσαμεν ἀλλ᾿ ἑαυτοὺς ἔδωκαν πρῶτον τῷ κυρίῳ καὶ ἡμῖν διὰ θελήματος θεοῦ',
   'kai ou kathōs ēlpisamen all'' heautous edōkan prōton tō kyriō kai hēmin dia thelēmatos theou',
   '''Not as we hoped'' — they exceeded expectations. ''First gave their own selves to the Lord'' (heautous edōkan prōton tō kyriō — they gave themselves first to the Lord). The gift of money followed the gift of self. Authentic generosity begins with self-surrender to God; financial giving flows from a yielded life. ''By the will of God'' — even their self-giving was enabled by divine purpose.',
   NULL),
  (6, 'Insomuch that we desired Titus, that as he had begun, so he would also finish in you the same grace also.',
   'εἰς τὸ παρακαλέσαι ἡμᾶς Τίτον ἵνα καθὼς προενήρξατο οὕτως καὶ ἐπιτελέσῃ εἰς ὑμᾶς καὶ τὴν χάριν ταύτην',
   'eis to parakalesai hēmas Titon hina kathōs proenērxato houtōs kai epitelesē eis hymas kai tēn charin tautēn',
   '''Finish'' (epitelesē — bring to completion). ''The same grace'' (tēn charin tautēn — this particular grace; the collection is called a ''grace''). Titus had begun organizing the Corinthian collection on a previous visit; now he must complete it. The collection is unfinished business — enthusiasm without follow-through is empty. Paul frames completion as a matter of grace, not obligation.',
   NULL),
  (7, 'Therefore, as ye abound in every thing, in faith, and utterance, and knowledge, and in all diligence, and in your love to us, see that ye abound in this grace also.',
   'ἀλλ᾿ ὥσπερ ἐν παντὶ περισσεύετε πίστει καὶ λόγῳ καὶ γνώσει καὶ πάσῃ σπουδῇ καὶ τῇ ἐξ ὑμῶν ἐν ἡμῖν ἀγάπῃ ἵνα καὶ ἐν ταύτῃ τῇ χάριτι περισσεύητε',
   'all'' hōsper en panti perisseuete pistei kai logō kai gnōsei kai pasē spoudē kai tē ex hymōn en hēmin agapē hina kai en tautē tē chariti perisseuhēte',
   '''Abound in every thing'' — the Corinthians were rich in spiritual gifts: faith, speech (logos), knowledge (gnōsis), diligence (spoudē), love. ''Abound in this grace also'' — Paul adds generous giving to the list of spiritual excellences. Generosity is not a separate category from the ''spiritual'' gifts; it is itself a grace (charis) in which one can abound. A church rich in gifts but poor in generosity is incomplete.',
   NULL),
  (8, 'I speak not by commandment, but by occasion of the forwardness of others, and to prove the sincerity of your love.',
   'οὐ κατ᾿ ἐπιταγὴν λέγω ἀλλὰ διὰ τῆς ἑτέρων σπουδῆς καὶ τὸ τῆς ὑμετέρας ἀγάπης γνήσιον δοκιμάζων',
   'ou kat'' epitagēn legō alla dia tēs heterōn spoudēs kai to tēs hymeteras agapēs gnēsion dokimazōn',
   '''Not by commandment'' (ou kat'' epitagēn — not as an order; Paul does not compel giving but appeals). ''Forwardness of others'' (heterōn spoudēs — the eagerness of others, i.e., the Macedonians). ''Prove the sincerity of your love'' (to gnēsion dokimazōn — testing the genuineness; dokimazō means to assay, to test metal for purity). Generosity is the litmus test of love''s authenticity. Love that does not give is suspect.',
   NULL),
  (9, 'For ye know the grace of our Lord Jesus Christ, that, though he was rich, yet for your sakes he became poor, that ye through his poverty might be rich.',
   'γινώσκετε γὰρ τὴν χάριν τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ὅτι δι᾿ ὑμᾶς ἐπτώχευσεν πλούσιος ὤν ἵνα ὑμεῖς τῇ ἐκείνου πτωχείᾳ πλουτήσητε',
   'ginōskete gar tēn charin tou kyriou hēmōn Iēsou Christou hoti di'' hymas eptōcheusen plousios ōn hina hymeis tē ekeinou ptōcheia ploutēsēte',
   '''The grace'' (tēn charin — the specific grace: what Christ did). ''Though he was rich'' (plousios ōn — being rich; present participle: he was in a state of being rich — the eternal riches of divine glory). ''Became poor'' (eptōcheusen — made himself a beggar; the strongest word for poverty: destitution). ''For your sakes'' (di'' hymas — on your behalf). ''That ye through his poverty might be rich'' (hina hymeis ploutēsēte — so that you might become wealthy). The incarnation is the supreme model of generosity: the infinitely rich One became infinitely poor so that the infinitely poor might become infinitely rich.',
   'This verse is the theological foundation for all Christian giving and one of the most concise statements of the incarnation in the NT. Christ''s ''riches'' refer to the glory he shared with the Father before the world began (John 17:5). His ''poverty'' encompasses the entire arc of incarnation: from the manger to the cross, from heavenly glory to human suffering. The ''riches'' believers receive through his poverty are spiritual: forgiveness, righteousness, adoption, the Spirit, eternal life. This verse establishes the pattern: generosity flows from a posture of self-impoverishment for others'' enrichment. Christ''s example is not merely illustrative but foundational — we give because he gave first.'),
  (10, 'And herein I give my advice: for this is expedient for you, who have begun before, not only to do, but also to be forward a year ago.',
   'καὶ γνώμην ἐν τούτῳ δίδωμι τοῦτο γὰρ ὑμῖν συμφέρει οἵτινες οὐ μόνον τὸ ποιῆσαι ἀλλὰ καὶ τὸ θέλειν προενήρξασθε ἀπὸ πέρυσι',
   'kai gnōmēn en toutō didōmi touto gar hymin sympherei hoitines ou monon to poiēsai alla kai to thelein proenērxasthe apo perysi',
   '''Advice'' (gnōmēn — opinion, counsel; not a command). ''Expedient'' (sympherei — profitable, beneficial). ''A year ago'' (apo perysi — from last year). The Corinthians had been the first to initiate the collection (before the Macedonians!) and the first to desire it. But desire without completion is hollow. Paul''s advice: finish what you started.',
   NULL),
  (11, 'Now therefore perform the doing of it; that as there was a readiness to will, so there may be a performance also out of that which ye have.',
   'νυνὶ δὲ καὶ τὸ ποιῆσαι ἐπιτελέσατε ὅπως καθάπερ ἡ προθυμία τοῦ θέλειν οὕτως καὶ τὸ ἐπιτελέσαι ἐκ τοῦ ἔχειν',
   'nyni de kai to poiēsai epitelesate hopōs kathaper hē prothymia tou thelein houtōs kai to epitelesai ek tou echein',
   '''Perform'' (epitelesate — complete, finish). ''Readiness to will'' (prothymia tou thelein — eagerness to desire; the willing heart was there from the start). ''Performance … out of that which ye have'' (epitelesai ek tou echein — complete it from your actual means). Paul does not ask for what they don''t have but for completion proportional to their resources. Good intentions must become completed actions.',
   NULL),
  (12, 'For if there be first a willing mind, it is accepted according to that a man hath, and not according to that he hath not.',
   'εἰ γὰρ ἡ προθυμία πρόκειται καθὸ ἐὰν ἔχῃ τις εὐπρόσδεκτος οὐ καθὸ οὐκ ἔχει',
   'ei gar hē prothymia prokeitai katho ean echē tis euprosdektos ou katho ouk echei',
   '''Willing mind'' (prothymia — eagerness, readiness of heart). ''Accepted'' (euprosdektos — well-received, acceptable). ''According to that a man hath'' — the standard is proportional, not absolute. God measures giving by the heart behind it and the proportion to resources, not the gross amount. The widow''s mite outweighs the millionaire''s surplus (Mark 12:41-44). This principle liberates the poor from shame and calls the wealthy to proportional generosity.',
   NULL),
  (13, 'For I mean not that other men be eased, and ye burdened:',
   'οὐ γὰρ ἵνα ἄλλοις ἄνεσις ὑμῖν δὲ θλῖψις',
   'ou gar hina allois anesis hymin de thlipsis',
   '''Eased'' (anesis — relief, relaxation). ''Burdened'' (thlipsis — pressed). Paul does not intend to relieve Jerusalem at the expense of creating hardship in Corinth. The collection is not a wealth-transfer that impoverishes the donor; it aims for balance.',
   NULL),
  (14, 'But by an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality:',
   'ἀλλ᾿ ἐξ ἰσότητος ἐν τῷ νῦν καιρῷ τὸ ὑμῶν περίσσευμα εἰς τὸ ἐκείνων ὑστέρημα ἵνα καὶ τὸ ἐκείνων περίσσευμα γένηται εἰς τὸ ὑμῶν ὑστέρημα ὅπως γένηται ἰσότης',
   'all'' ex isotētos en tō nyn kairō to hymōn perisseuma eis to ekeinōn hysterēma hina kai to ekeinōn perisseuma genētai eis to hymōn hysterēma hopōs genētai isotēs',
   '''Equality'' (isotētos — equity, fairness; from isos, equal). ''Your abundance'' (hymōn perisseuma) supplies ''their want'' (ekeinōn hysterēma). The principle is reciprocal: at this time, Corinth''s material surplus meets Jerusalem''s material need; at another time, Jerusalem''s spiritual abundance meets Corinth''s spiritual need (or perhaps future material need). The body of Christ functions by mutual supply.',
   NULL),
  (15, 'As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack.',
   'καθὼς γέγραπται ὁ τὸ πολὺ οὐκ ἐπλεόνασεν καὶ ὁ τὸ ὀλίγον οὐκ ἠλαττόνησεν',
   'kathōs gegraptai ho to poly ouk epleonasen kai ho to oligon ouk ēlattonēsen',
   'Paul quotes Exodus 16:18 — the manna principle. When Israel gathered manna, those who gathered much had no surplus, and those who gathered little had no deficit. God''s provision equalized. Applied to the collection: the natural tendency toward accumulation (surplus for some, deficit for others) should be corrected by generosity within the community. Divine economy runs on equality, not hoarding.',
   NULL),
  (16, 'But thanks be to God, which put the same earnest care into the heart of Titus for you.',
   'χάρις δὲ τῷ θεῷ τῷ διδόντι τὴν αὐτὴν σπουδὴν ὑπὲρ ὑμῶν ἐν τῇ καρδίᾳ Τίτου',
   'charis de tō theō tō didonti tēn autēn spoudēn hyper hymōn en tē kardia Titou',
   '''Earnest care'' (spoudēn — diligence, eagerness). ''Into the heart of Titus'' — God is the one who places pastoral concern in human hearts. Titus'' eagerness for the Corinthians is itself a gift of God. This transitions to the practical arrangements for the collection''s administration.',
   NULL),
  (17, 'For indeed he accepted the exhortation; but being more forward, of his own accord he went unto you.',
   'ὅτι τὴν μὲν παράκλησιν ἐδέξατο σπουδαιότερος δὲ ὑπάρχων αὐθαίρετος ἐξῆλθεν πρὸς ὑμᾶς',
   'hoti tēn men paraklēsin edexato spoudaioteros de hyparchōn authairetos exēlthen pros hymas',
   '''Accepted the exhortation'' — Titus received Paul''s encouragement. ''More forward, of his own accord'' (spoudaioteros authairetos — even more eager, voluntarily). Titus needed no arm-twisting; he went willingly. As the Macedonians gave ''of themselves'' (v.3), Titus goes ''of his own accord.'' Authentic Christian service is never reluctant.',
   NULL),
  (18, 'And we have sent with him the brother, whose praise is in the gospel throughout all the churches;',
   'συνεπέμψαμεν δὲ μετ᾿ αὐτοῦ τὸν ἀδελφὸν οὗ ὁ ἔπαινος ἐν τῷ εὐαγγελίῳ διὰ πασῶν τῶν ἐκκλησιῶν',
   'synepempsamen de met'' autou ton adelphon hou ho epainos en tō euangeliō dia pasōn tōn ekklēsiōn',
   '''The brother'' — unnamed; possibly Luke, Barnabas, or another prominent figure. ''Whose praise is in the gospel throughout all the churches'' — universally respected for gospel ministry. Paul sends a trusted, well-known associate to ensure transparency in handling the collection.',
   NULL),
  (19, 'And not that only, but who was also chosen of the churches to travel with us with this grace, which is administered by us to the glory of the Lord, and declaration of your ready mind:',
   'οὐ μόνον δὲ ἀλλὰ καὶ χειροτονηθεὶς ὑπὸ τῶν ἐκκλησιῶν συνέκδημος ἡμῶν σὺν τῇ χάριτι ταύτῃ τῇ διακονουμένῃ ὑφ᾿ ἡμῶν πρὸς τὴν τοῦ κυρίου δόξαν καὶ προθυμίαν ἡμῶν',
   'ou monon de alla kai cheirotonētheis hypo tōn ekklēsiōn synekdēmos hēmōn syn tē chariti tautē tē diakonoumenē hyph'' hēmōn pros tēn tou kyriou doxan kai prothymian hēmōn',
   '''Chosen of the churches'' (cheirotonētheis — elected by raising of hands; from cheir [hand] + teinō [to stretch]; the churches selected this delegate by vote). ''Travel with us'' (synekdēmos — a travelling companion). ''This grace'' (tē chariti tautē — the collection). ''Glory of the Lord'' — the ultimate purpose. ''Ready mind'' (prothymian — eager willingness). Financial administration in the church is conducted through elected, accountable representatives.',
   NULL),
  (20, 'Providing for honest things, not only in the sight of the Lord, but also in the sight of men.',
   'στελλόμενοι τοῦτο μή τις ἡμᾶς μωμήσηται ἐν τῇ ἁδρότητι ταύτῃ τῇ διακονουμένῃ ὑφ᾿ ἡμῶν',
   'stellomenoi touto mē tis hēmas mōmēsētai en tē hadrotēti tautē tē diakonoumenē hyph'' hēmōn',
   '''Providing for honest things'' (stellomenoi — taking precautions, arranging carefully). ''Not only in the sight of the Lord, but also in the sight of men'' — an echo of Proverbs 3:4 (LXX). Financial integrity must be both real (before God) and visible (before people). Paul takes deliberate steps to ensure no one can accuse him of mishandling funds. Ministry finances require both divine accountability and human transparency.',
   'This verse establishes an enduring principle for church financial management: integrity must be both actual and perceived. It is not enough to be honest before God; one must also appear honest before people. Paul knew his opponents were looking for ammunition. By using multiple, church-elected delegates to handle funds, he created a system of checks and accountability. This principle should govern all church finances: transparency, multiple signatories, public reporting, and proactive avoidance of even the appearance of impropriety.'),
  (21, 'Providing for honest things, not only in the sight of the Lord, but also in the sight of men.',
   'προνοούμενοι γὰρ καλὰ οὐ μόνον ἐνώπιον κυρίου ἀλλὰ καὶ ἐνώπιον ἀνθρώπων',
   'pronooumenoi gar kala ou monon enōpion kyriou alla kai enōpion anthrōpōn',
   '''Providing for'' (pronooumenoi — taking thought beforehand, planning ahead for). ''Honest things'' (kala — good, honourable, beautiful things). ''In the sight of the Lord'' (enōpion kyriou) and ''in the sight of men'' (enōpion anthrōpōn). Paul quotes Proverbs 3:4 (LXX). Dual accountability: vertical (before God) and horizontal (before people). The principle applies broadly: Christians should conduct all affairs so that both God and observers find them honourable.',
   NULL),
  (22, 'And we have sent with them our brother, whom we have oftentimes proved diligent in many things, but now much more diligent, upon the great confidence which I have in you.',
   'συνεπέμψαμεν δὲ αὐτοῖς τὸν ἀδελφὸν ἡμῶν ὃν ἐδοκιμάσαμεν ἐν πολλοῖς πολλάκις σπουδαῖον ὄντα νυνὶ δὲ πολὺ σπουδαιότερον πεποιθήσει πολλῇ τῇ εἰς ὑμᾶς',
   'synepempsamen de autois ton adelphon hēmōn hon edokimasamen en pollois pollakis spoudaion onta nyni de poly spoudaioteron pepoithēsei pollē tē eis hymas',
   '''Our brother'' — a second unnamed delegate, ''oftentimes proved diligent'' (edokimasamen pollakis spoudaion — tested many times and found eager). ''Much more diligent'' — his confidence in the Corinthians has increased (perhaps through Titus'' positive report). Three delegates (Titus + two brothers) ensure accountability and prevent any individual from being solely responsible for the funds.',
   NULL),
  (23, 'Whether any do enquire of Titus, he is my partner and fellowhelper concerning you: or our brethren be enquired of, they are the messengers of the churches, and the glory of Christ.',
   'εἴτε ὑπὲρ Τίτου κοινωνὸς ἐμὸς καὶ εἰς ὑμᾶς συνεργός εἴτε ἀδελφοὶ ἡμῶν ἀπόστολοι ἐκκλησιῶν δόξα Χριστοῦ',
   'eite hyper Titou koinōnos emos kai eis hymas synergos eite adelphoi hēmōn apostoloi ekklēsiōn doxa Christou',
   '''Partner'' (koinōnos — sharer, partner). ''Fellowhelper'' (synergos — co-worker). ''Messengers of the churches'' (apostoloi ekklēsiōn — apostles/delegates sent by the churches; the term apostolos is used here in its broader sense of ''sent one,'' not in the technical sense of the Twelve). ''The glory of Christ'' (doxa Christou — they embody and display Christ''s glory). These delegates represent Christ to the churches they serve.',
   NULL),
  (24, 'Wherefore shew ye to them, and before the churches, the proof of your love, and of our boasting on your behalf.',
   'τὴν οὖν ἔνδειξιν τῆς ἀγάπης ὑμῶν καὶ ἡμῶν καυχήσεως ὑπὲρ ὑμῶν εἰς αὐτοὺς ἐνδείξασθε εἰς πρόσωπον τῶν ἐκκλησιῶν',
   'tēn oun endeixin tēs agapēs hymōn kai hēmōn kauchēseōs hyper hymōn eis autous endeixasthe eis prosōpon tōn ekklēsiōn',
   '''Show ye to them'' (endeixasthe — demonstrate, prove). ''Proof of your love'' (endeixin tēs agapēs — visible evidence of love). ''Our boasting on your behalf'' (hēmōn kauchēseōs — Paul''s boasting about the Corinthians to others). ''Before the churches'' (eis prosōpon tōn ekklēsiōn — in the face of the churches; publicly). Paul has boasted about the Corinthians'' generosity; now they must vindicate his confidence. Generosity is the public proof of love.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 8;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 liberality
  ('ἁπλότης', 'haplotēs', 'G572', 'Generosity, liberality, simplicity — from haplous (single, simple). Singleness of heart that expresses itself in openhanded giving. The Macedonians gave with no ulterior motive, no calculation, no strings attached. Their generosity was an expression of their undivided devotion to God.', 1),
  -- v.4 fellowship
  ('κοινωνία', 'koinōnia', 'G2842', 'Fellowship, partnership, sharing — from koinos (common). The collection is not mere charity but koinōnia: mutual participation in the body of Christ expressed materially. Giving and receiving are two sides of the same fellowship. The donor is blessed as much as the recipient.', 2),
  -- v.9 became poor
  ('πτωχεύω', 'ptōcheuō', 'G4433', 'To become poor, to be reduced to beggary — from ptōchos (beggar, destitute). Christ''s self-impoverishment was voluntary and vicarious: he chose poverty for our enrichment. The word denotes not merely modest means but abject destitution — the extent of Christ''s condescension.', 3),
  -- v.12 willing mind
  ('προθυμία', 'prothymia', 'G4288', 'Eagerness, readiness, willing mind — from pro (before) + thymos (spirit, passion). The heart that is already inclined before being asked. God evaluates giving by the willingness of the heart, not the size of the gift. A willing mind makes a small gift as acceptable as a large one.', 4),
  -- v.14 equality
  ('ἰσότης', 'isotēs', 'G2471', 'Equality, equity, fairness — from isos (equal). Not forced economic levelling but voluntary mutual supply within the body of Christ. The principle is reciprocal: those with surplus supply those with deficit; the direction of supply may reverse over time. The goal is not identical wealth but shared sufficiency.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 8
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 4
    WHEN 3 THEN 9
    WHEN 4 THEN 12
    WHEN 5 THEN 14
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 joy in poverty
  (2, 'James 2:5', 1),
  (2, 'Philippians 4:15-18', 2),
  -- v.5 gave themselves first
  (5, 'Romans 12:1', 3),
  -- v.9 grace of Christ / became poor
  (9, 'Philippians 2:5-8', 4),
  (9, 'John 17:5', 5),
  (9, 'Matthew 8:20', 6),
  (9, '2 Corinthians 6:10', 7),
  -- v.12 willing mind
  (12, 'Mark 12:41-44', 8),
  (12, '1 Chronicles 29:14', 9),
  -- v.14-15 equality / manna
  (14, 'Acts 2:44-45', 10),
  (14, 'Acts 4:34-35', 11),
  (15, 'Exodus 16:18', 12),
  -- v.20-21 honest handling
  (21, 'Proverbs 3:4', 13),
  (21, 'Romans 12:17', 14),
  -- v.23 messengers of churches
  (23, 'Philippians 2:25', 15)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 8
  AND v.verse_number = cr.verse_number;
