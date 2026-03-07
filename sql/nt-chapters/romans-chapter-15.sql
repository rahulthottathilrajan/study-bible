-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 15 — Christ's Example, Gentile Hope, and Paul's Plans
-- 33 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 15,
  'Romans 15 completes the ethical instruction begun in chapter 14 and transitions to Paul''s personal plans and closing remarks. The strong are commanded to ''bear the infirmities of the weak, and not to please ourselves'' (v.1), following Christ''s example: ''For even Christ pleased not himself'' (v.3). The goal is unity: ''that ye may with one mind and one mouth glorify God'' (v.6). Paul then makes a climactic appeal: ''Wherefore receive ye one another, as Christ also received us to the glory of God'' (v.7). He demonstrates from four OT quotations (vv.9-12) that Christ''s ministry was designed to bring Gentiles into God''s praise, fulfilling the promise that ''the root of Jesse … shall rise to reign over the Gentiles; in him shall the Gentiles trust'' (v.12). A beautiful benediction follows: ''Now the God of hope fill you with all joy and peace in believing'' (v.13). The second half reveals Paul''s missionary strategy: he has ''fully preached the gospel of Christ'' from Jerusalem to Illyricum (v.19), always pioneering — ''not where Christ was named, lest I should build upon another man''s foundation'' (v.20). Now he plans to visit Rome on his way to Spain (vv.23-24), but first must deliver the collection to the poor saints in Jerusalem (vv.25-27). He requests prayer for safety in Judea and for the collection''s acceptance (vv.30-31). The chapter closes with the benediction: ''Now the God of peace be with you all. Amen'' (v.33).',
  'Christ''s Example of Unity, the Gentile Hope, and Paul''s Missionary Plans',
  'ἐλπίς (elpis)',
  'Hope — confident expectation grounded in God''s promises. Hope appears four times in this chapter (vv.4, 12, 13[x2]), climaxing in the title ''the God of hope'' (v.13). For Paul, hope is not wishful thinking but certain confidence rooted in Scripture (v.4) and the risen Christ. The Gentiles'' inclusion in God''s saving plan is itself the fulfilment of ancient hope.',
  '["The Strong Must Bear the Weak: Christ''s Example (vv.1-6): We then that are strong ought to bear the infirmities of the weak and not to please ourselves. For even Christ pleased not himself but as it is written The reproaches of them that reproached thee fell on me. That ye may with one mind and one mouth glorify God even the Father of our Lord Jesus Christ","Receive One Another: Gentiles Join the Praise (vv.7-13): Wherefore receive ye one another as Christ also received us to the glory of God. Now I say that Jesus Christ was a minister of the circumcision for the truth of God to confirm the promises made unto the fathers and that the Gentiles might glorify God for his mercy. Now the God of hope fill you with all joy and peace in believing","Paul''s Priestly Ministry to the Gentiles (vv.14-21): Nevertheless brethren I have written the more boldly unto you in some sort as putting you in mind because of the grace that is given to me of God that I should be the minister of Jesus Christ to the Gentiles ministering the gospel of God. For I will not dare to speak of any of those things which Christ hath not wrought by me to make the Gentiles obedient","Paul''s Travel Plans and Prayer Requests (vv.22-33): But now having no more place in these parts and having a great desire these many years to come unto you whensoever I take my journey into Spain I will come to you. But now I go unto Jerusalem to minister unto the saints. Now I beseech you brethren for the Lord Jesus Christ''s sake and for the love of the Spirit that ye strive together with me in your prayers to God for me"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 33 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'We then that are strong ought to bear the infirmities of the weak, and not to please ourselves.',
   'ὀφείλομεν δὲ ἡμεῖς οἱ δυνατοὶ τὰ ἀσθενήματα τῶν ἀδυνάτων βαστάζειν καὶ μὴ ἑαυτοῖς ἀρέσκειν',
   'opheilomen de hēmeis hoi dynatoi ta asthenēmata tōn adynatōn bastazein kai mē heautois areskein',
   '''We that are strong'' (hoi dynatoi — the able, the powerful; Paul identifies himself with the strong). ''Ought'' (opheilomen — we owe it as a debt; it is our obligation). ''Bear'' (bastazein — carry, bear as a burden). ''Infirmities'' (asthenēmata — weaknesses, scruples). The strong have a moral obligation to carry the weak''s burdens, not to please themselves.',
   NULL),
  (2, 'Let every one of us please his neighbour for his good to edification.',
   'ἕκαστος ἡμῶν τῷ πλησίον ἀρεσκέτω εἰς τὸ ἀγαθὸν πρὸς οἰκοδομήν',
   'hekastos hēmōn tō plēsion aresketō eis to agathon pros oikodomēn',
   '''Please his neighbour'' (tō plēsion aresketō — seek to please the neighbour). ''For his good'' (eis to agathon — for what is beneficial). ''To edification'' (pros oikodomēn — toward building up). Pleasing others is not people-pleasing but purposeful: it aims at their spiritual good and the community''s growth.',
   NULL),
  (3, 'For even Christ pleased not himself; but, as it is written, The reproaches of them that reproached thee fell on me.',
   'καὶ γὰρ ὁ Χριστὸς οὐχ ἑαυτῷ ἤρεσεν ἀλλὰ καθὼς γέγραπται οἱ ὀνειδισμοὶ τῶν ὀνειδιζόντων σε ἐπέπεσον ἐπ᾿ ἐμέ',
   'kai gar ho Christos ouch heautō ēresen alla kathōs gegraptai hoi oneidismoi tōn oneidizontōn se epepesan ep eme',
   '''Christ pleased not himself'' — the supreme example of self-denial. Quoting Psalm 69:9 (a messianic psalm). ''Reproaches'' (oneidismoi — insults, revilings). Christ bore the reproaches directed at God the Father. His entire life was other-directed, absorbing the consequences of others'' sin.',
   NULL),
  (4, 'For whatsoever things were written aforetime were written for our learning, that we through patience and comfort of the scriptures might have hope.',
   'ὅσα γὰρ προεγράφη εἰς τὴν ἡμετέραν διδασκαλίαν προεγράφη ἵνα διὰ τῆς ὑπομονῆς καὶ διὰ τῆς παρακλήσεως τῶν γραφῶν τὴν ἐλπίδα ἔχωμεν',
   'hosa gar proegraphē eis tēn hēmeteran didaskalian proegraphē hina dia tēs hypomonēs kai dia tēs paraklēseōs tōn graphōn tēn elpida echōmen',
   '''Written aforetime'' (proegraphē — written previously; the OT Scriptures). ''Our learning'' (hēmeteran didaskalian — our instruction). ''Patience'' (hypomonēs — endurance). ''Comfort'' (paraklēseōs — encouragement). ''Hope'' (elpida). The OT was written for the Christian community: it produces endurance and encouragement, which together generate hope.',
   'This verse establishes a hermeneutical principle: the entire OT was written for the instruction of the NT church. It does not belong to another era or people but speaks directly to Christians. Its purpose is pastoral: to produce endurance (hypomonē) and encouragement (paraklēsis) that sustain hope (elpis). This is why Paul quotes the OT so extensively throughout Romans — it is living Scripture for the church.'),
  (5, 'Now the God of patience and consolation grant you to be likeminded one toward another according to Christ Jesus:',
   'ὁ δὲ θεὸς τῆς ὑπομονῆς καὶ τῆς παρακλήσεως δῴη ὑμῖν τὸ αὐτὸ φρονεῖν ἐν ἀλλήλοις κατὰ Χριστὸν Ἰησοῦν',
   'ho de theos tēs hypomonēs kai tēs paraklēseōs dōē hymin to auto phronein en allēlois kata Christon Iēsoun',
   '''God of patience and consolation'' — God is the source of endurance and encouragement. ''Likeminded'' (to auto phronein — thinking the same thing; harmony). ''According to Christ Jesus'' (kata Christon Iēsoun — in conformity with Christ''s pattern). Unity comes from above — it is a divine gift, not merely a human achievement.',
   NULL),
  (6, 'That ye may with one mind and one mouth glorify God, even the Father of our Lord Jesus Christ.',
   'ἵνα ὁμοθυμαδὸν ἐν ἑνὶ στόματι δοξάζητε τὸν θεὸν καὶ πατέρα τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'hina homothymadon en heni stomati doxazēte ton theon kai patera tou kyriou hēmōn Iēsou Christou',
   '''With one mind'' (homothymadon — with one accord; unanimously). ''One mouth'' (heni stomati — a single voice). ''Glorify God'' — the purpose of unity is doxology. Internal harmony (one mind) produces external witness (one mouth). The goal of all Christian ethics is the glory of God.',
   NULL),
  (7, 'Wherefore receive ye one another, as Christ also received us to the glory of God.',
   'διὸ προσλαμβάνεσθε ἀλλήλους καθὼς καὶ ὁ Χριστὸς προσελάβετο ὑμᾶς εἰς δόξαν θεοῦ',
   'dio proslambanesthe allēlous kathōs kai ho Christos proselabeto hymas eis doxan theou',
   '''Receive'' (proslambanesthe — welcome, accept fully; the same command as 14:1). ''As Christ received us'' — Christ is the model of acceptance. He received us when we were sinners (5:8); shall we not receive fellow believers whose practices differ from ours? ''To the glory of God'' — mutual acceptance glorifies God.',
   'This is the climactic summary of chapters 14-15: mutual acceptance modelled on Christ''s acceptance. The phrase ''as Christ also received us'' grounds the command in the gospel itself. Christ accepted us not because we were worthy but by grace; our acceptance of each other must follow the same pattern. The ultimate purpose is doxological: ''to the glory of God.'''),
  (8, 'Now I say that Jesus Christ was a minister of the circumcision for the truth of God, to confirm the promises made unto the fathers:',
   'λέγω δέ Ἰησοῦν Χριστὸν διάκονον γεγενῆσθαι περιτομῆς ὑπὲρ ἀληθείας θεοῦ εἰς τὸ βεβαιῶσαι τὰς ἐπαγγελίας τῶν πατέρων',
   'legō de Iēsoun Christon diakonon gegenēsthai peritomēs hyper alētheias theou eis to bebaiōsai tas epangelias tōn paterōn',
   '''Minister of the circumcision'' (diakonon peritomēs — a servant to the Jewish people). ''Truth of God'' (alētheias theou — God''s faithfulness). ''Confirm the promises'' (bebaiōsai — make firm, validate). Christ''s earthly ministry to Israel confirmed God''s covenant faithfulness to the patriarchs.',
   NULL),
  (9, 'And that the Gentiles might glorify God for his mercy; as it is written, For this cause I will confess to thee among the Gentiles, and sing unto thy name.',
   'τὰ δὲ ἔθνη ὑπὲρ ἐλέους δοξάσαι τὸν θεόν καθὼς γέγραπται διὰ τοῦτο ἐξομολογήσομαί σοι ἐν ἔθνεσιν καὶ τῷ ὀνόματί σου ψαλῶ',
   'ta de ethnē hyper eleous doxasai ton theon kathōs gegraptai dia touto exomologēsomai soi en ethnesin kai tō onomati sou psalō',
   '''Gentiles glorify God for mercy'' — Israel received promises; Gentiles receive mercy (cf. 11:30-32). Quoting Psalm 18:49 / 2 Samuel 22:50. Christ himself confesses God''s name among the Gentiles — he is the singer of praise among the nations. This is the first of four OT quotations proving Gentile inclusion.',
   NULL),
  (10, 'And again he saith, Rejoice, ye Gentiles, with his people.',
   'καὶ πάλιν λέγει εὐφράνθητε ἔθνη μετὰ τοῦ λαοῦ αὐτοῦ',
   'kai palin legei euphranthēte ethnē meta tou laou autou',
   'Quoting Deuteronomy 32:43 (LXX). ''Rejoice, ye Gentiles, with his people'' — Gentiles join Israel in praise. The Gentiles do not replace Israel but rejoice alongside God''s people. This OT text envisions a united company of Jew and Gentile worshipping together.',
   NULL),
  (11, 'And again, Praise the Lord, all ye Gentiles; and laud him, all ye people.',
   'καὶ πάλιν αἰνεῖτε τὸν κύριον πάντα τὰ ἔθνη καὶ ἐπαινέσατε αὐτὸν πάντες οἱ λαοί',
   'kai palin aineite ton kyrion panta ta ethnē kai epainesate auton pantes hoi laoi',
   'Quoting Psalm 117:1 — the shortest psalm but with the widest scope: all nations, all peoples. God has always intended that all peoples would praise him. The gospel to the Gentiles is not a Plan B but the fulfilment of God''s eternal purpose.',
   NULL),
  (12, 'And again, Esaias saith, There shall be a root of Jesse, and he that shall rise to reign over the Gentiles; in him shall the Gentiles trust.',
   'καὶ πάλιν Ἠσαΐας λέγει ἔσται ἡ ῥίζα τοῦ Ἰεσσαί καὶ ὁ ἀνιστάμενος ἄρχειν ἐθνῶν ἐπ᾿ αὐτῷ ἔθνη ἐλπιοῦσιν',
   'kai palin Ēsaias legei estai hē rhiza tou Iessai kai ho anistamenos archein ethnōn ep autō ethnē elpiousin',
   'Quoting Isaiah 11:10 (LXX). ''Root of Jesse'' (rhiza tou Iessai — the Messiah from David''s line). ''Rise to reign over the Gentiles'' (anistamenos archein ethnōn — arising to rule the nations). ''In him shall the Gentiles trust'' (elpiousin — place their hope). The fourth and climactic OT text: the Messiah rules and the nations hope in him.',
   NULL),
  (13, 'Now the God of hope fill you with all joy and peace in believing, that ye may abound in hope, through the power of the Holy Ghost.',
   'ὁ δὲ θεὸς τῆς ἐλπίδος πληρώσαι ὑμᾶς πάσης χαρᾶς καὶ εἰρήνης ἐν τῷ πιστεύειν εἰς τὸ περισσεύειν ὑμᾶς ἐν τῇ ἐλπίδι ἐν δυνάμει πνεύματος ἁγίου',
   'ho de theos tēs elpidos plērōsai hymas pasēs charas kai eirēnēs en tō pisteuein eis to perisseuein hymas en tē elpidi en dynamei pneumatos hagiou',
   '''God of hope'' (theos tēs elpidos — God is the source and ground of all hope). ''Fill'' (plērōsai — fill to overflowing). ''Joy and peace'' — in believing (en tō pisteuein — through the act of faith). ''Abound in hope'' (perisseuein en tē elpidi — overflow with hope). ''Power of the Holy Ghost'' — hope is not self-generated but Spirit-empowered. A magnificent benediction.',
   'This benediction is one of the richest in the NT. It is trinitarian: the God of hope (Father), believing in Christ (Son implied), through the power of the Holy Ghost. Joy and peace come ''in believing'' — faith is the channel. Hope is the result — not mere optimism but confident expectation grounded in God''s character and promises. The verb ''abound'' (perisseuein) means to overflow, to have more than enough. Christian hope is not barely adequate but superabundant.'),
  (14, 'And I myself also am persuaded of you, my brethren, that ye also are full of goodness, filled with all knowledge, able also to admonish one another.',
   'πέπεισμαι δέ ἀδελφοί μου καὶ αὐτὸς ἐγὼ περὶ ὑμῶν ὅτι καὶ αὐτοὶ μεστοί ἐστε ἀγαθωσύνης πεπληρωμένοι πάσης γνώσεως δυνάμενοι καὶ ἀλλήλους νουθετεῖν',
   'pepeismai de adelphoi mou kai autos egō peri hymōn hoti kai autoi mestoi este agathōsynēs peplērōmenoi pasēs gnōseōs dynamenoi kai allēlous nouthetein',
   '''Full of goodness'' (mestoi agathōsynēs — brimming with moral excellence). ''Filled with all knowledge'' (peplērōmenoi pasēs gnōseōs). ''Able to admonish'' (dynamenoi nouthetein — capable of counselling, instructing). Paul affirms the Roman church before explaining why he wrote so boldly.',
   NULL),
  (15, 'Nevertheless, brethren, I have written the more boldly unto you in some sort, as putting you in mind, because of the grace that is given to me of God,',
   'τολμηρότερον δὲ ἔγραψα ὑμῖν ἀδελφοί ἀπὸ μέρους ὡς ἐπαναμιμνήσκων ὑμᾶς διὰ τὴν χάριν τὴν δοθεῖσάν μοι ὑπὸ τοῦ θεοῦ',
   'tolmēroteron de egrapsa hymin adelphoi apo merous hōs epanamimnēskōn hymas dia tēn charin tēn dotheisan moi hypo tou theou',
   '''More boldly'' (tolmēroteron — rather boldly; Paul is diplomatic). ''In some sort'' (apo merous — partially, on some points). ''Putting you in mind'' (epanamimnēskōn — reminding; he is not teaching them new things but recalling what they already know). ''Grace given to me'' — Paul''s apostolic authority is itself a gift of grace.',
   NULL),
  (16, 'That I should be the minister of Jesus Christ to the Gentiles, ministering the gospel of God, that the offering up of the Gentiles might be acceptable, being sanctified by the Holy Ghost.',
   'εἰς τὸ εἶναί με λειτουργὸν Ἰησοῦ Χριστοῦ εἰς τὰ ἔθνη ἱερουργοῦντα τὸ εὐαγγέλιον τοῦ θεοῦ ἵνα γένηται ἡ προσφορὰ τῶν ἐθνῶν εὐπρόσδεκτος ἡγιασμένη ἐν πνεύματι ἁγίῳ',
   'eis to einai me leitourgon Iēsou Christou eis ta ethnē hierourgounta to euangelion tou theou hina genētai hē prosphora tōn ethnōn euprosdektos hēgiasmenē en pneumati hagiō',
   '''Minister'' (leitourgon — priestly minister; from leitourgos, a public servant in sacred duties). ''Ministering'' (hierourgounta — serving as a priest; from hieros + ergon, performing sacred work). ''Offering up'' (prosphora — sacrifice, offering). ''Of the Gentiles'' — the Gentiles themselves are the offering Paul presents to God. ''Sanctified by the Holy Ghost'' — the Spirit makes this offering acceptable.',
   'Paul describes his apostolic work in priestly terms. He is a leitourgos (priestly minister) of Christ Jesus, performing sacred service (hierourgounta) with the gospel. The Gentiles themselves are the sacrificial offering (prosphora) he presents to God — acceptable because sanctified by the Holy Spirit. This is stunning imagery: the apostle as priest, the gospel as liturgy, the converted Gentiles as holy sacrifice.'),
  (17, 'I have therefore whereof I may glory through Jesus Christ in those things which pertain to God.',
   'ἔχω οὖν καύχησιν ἐν Χριστῷ Ἰησοῦ τὰ πρὸς τὸν θεόν',
   'echō oun kauchēsin en Christō Iēsou ta pros ton theon',
   '''Glory'' (kauchēsin — boasting). ''In Christ Jesus'' — Paul''s boasting is always in Christ, never in himself. ''Things which pertain to God'' — his priestly ministry. He can glory in what Christ has done through him.',
   NULL),
  (18, 'For I will not dare to speak of any of those things which Christ hath not wrought by me, to make the Gentiles obedient, by word and deed,',
   'οὐ γὰρ τολμήσω λαλεῖν τι ὧν οὐ κατειργάσατο Χριστὸς δι᾿ ἐμοῦ εἰς ὑπακοὴν ἐθνῶν λόγῳ καὶ ἔργῳ',
   'ou gar tolmēsō lalein ti hōn ou kateirgasato Christos di emou eis hypakoēn ethnōn logō kai ergō',
   '''Not dare'' (ou tolmēsō — I will not presume). Paul will only speak of what Christ has accomplished through him — not what he has accomplished himself. ''Obedience of the Gentiles'' (hypakoēn ethnōn — cf. 1:5, ''obedience to the faith''). ''By word and deed'' — Paul''s ministry involved both proclamation and action.',
   NULL),
  (19, 'Through mighty signs and wonders, by the power of the Spirit of God; so that from Jerusalem, and round about unto Illyricum, I have fully preached the gospel of Christ.',
   'ἐν δυνάμει σημείων καὶ τεράτων ἐν δυνάμει πνεύματος θεοῦ ὥστε με ἀπὸ Ἰερουσαλὴμ καὶ κύκλῳ μέχρι τοῦ Ἰλλυρικοῦ πεπληρωκέναι τὸ εὐαγγέλιον τοῦ Χριστοῦ',
   'en dynamei sēmeiōn kai teratōn en dynamei pneumatos theou hōste me apo Ierousalēm kai kyklō mechri tou Illyrikou peplērōkenai to euangelion tou Christou',
   '''Signs and wonders'' (sēmeiōn kai teratōn — miraculous signs that point to God''s power). ''By the power of the Spirit'' — the Spirit is the dynamic behind both miracles and preaching. ''From Jerusalem to Illyricum'' — a vast arc covering the eastern Mediterranean. ''Fully preached'' (peplērōkenai — filled up, completed). Paul has saturated the region with the gospel.',
   NULL),
  (20, 'Yea, so have I strived to preach the gospel, not where Christ was named, lest I should build upon another man''s foundation:',
   'οὕτω δὲ φιλοτιμούμενον εὐαγγελίζεσθαι οὐχ ὅπου ὠνομάσθη Χριστός ἵνα μὴ ἐπ᾿ ἀλλότριον θεμέλιον οἰκοδομῶ',
   'houtō de philotimoumenon euangelizesthai ouch hopou ōnomasthē Christos hina mē ep allotrion themelion oikodomō',
   '''Strived'' (philotimoumenon — made it my ambition, aspired; from philos + timē, loving honour). Paul''s missionary principle: pioneer, don''t duplicate. ''Another man''s foundation'' (allotrion themelion — someone else''s foundation). Paul always went where Christ had not yet been proclaimed.',
   NULL),
  (21, 'But as it is written, To whom he was not spoken of, they shall see: and they that have not heard shall understand.',
   'ἀλλὰ καθὼς γέγραπται οἷς οὐκ ἀνηγγέλη περὶ αὐτοῦ ὄψονται καὶ οἳ οὐκ ἀκηκόασιν συνήσουσιν',
   'alla kathōs gegraptai hois ouk anēngelē peri autou opsontai kai hoi ouk akēkoasin synēsousin',
   'Quoting Isaiah 52:15 (the Servant Song). Those who had never heard would see and understand. Paul''s pioneer mission fulfils the prophetic vision of unreached peoples encountering God''s Servant for the first time.',
   NULL),
  (22, 'For which cause also I have been much hindered from coming to you.',
   'διὸ καὶ ἐνεκοπτόμην τὰ πολλὰ τοῦ ἐλθεῖν πρὸς ὑμᾶς',
   'dio kai enekoptomēn ta polla tou elthein pros hymas',
   '''Hindered'' (enekoptomēn — cut into, impeded; a military term for breaking up a road to prevent an army''s advance). Paul''s pioneer work in the east prevented him from visiting Rome. Now that phase is complete.',
   NULL),
  (23, 'But now having no more place in these parts, and having a great desire these many years to come unto you;',
   'νυνὶ δὲ μηκέτι τόπον ἔχων ἐν τοῖς κλίμασι τούτοις ἐπιποθίαν δὲ ἔχων τοῦ ἐλθεῖν πρὸς ὑμᾶς ἀπὸ πολλῶν ἐτῶν',
   'nyni de mēketi topon echōn en tois klimasi toutois epipothian de echōn tou elthein pros hymas apo pollōn etōn',
   '''No more place'' (mēketi topon — no more room; Paul has saturated the eastern Mediterranean with pioneer evangelism). ''These parts'' (tois klimasi — these regions). ''Great desire'' (epipothian — longing, yearning). Paul is now ready to push west — to Rome and beyond.',
   NULL),
  (24, 'Whensoever I take my journey into Spain, I will come to you: for I trust to see you in my journey, and to be brought on my way thitherward by you, if first I be somewhat filled with your company.',
   'ὡς ἐὰν πορεύωμαι εἰς τὴν Σπανίαν ἐλεύσομαι πρὸς ὑμᾶς ἐλπίζω γὰρ διαπορευόμενος θεάσασθαι ὑμᾶς καὶ ὑφ᾿ ὑμῶν προπεμφθῆναι ἐκεῖ ἐὰν ὑμῶν πρῶτον ἀπὸ μέρους ἐμπλησθῶ',
   'hōs ean poreuōmai eis tēn Spanian eleusomai pros hymas elpizō gar diaporeuomenos theasasthai hymas kai hyph hymōn propemphthēnai ekei ean hymōn prōton apo merous emplēsthō',
   '''Spain'' (Spanian — the western frontier of the Roman world; Paul''s missionary ambition knew no bounds). ''Brought on my way'' (propemphthēnai — sent forward, assisted on the journey; this implies logistical and financial support). ''Filled with your company'' (emplēsthō — satisfied, filled; Paul longs for fellowship). Rome is a base for the Spanish mission.',
   NULL),
  (25, 'But now I go unto Jerusalem to minister unto the saints.',
   'νυνὶ δὲ πορεύομαι εἰς Ἰερουσαλὴμ διακονῶν τοῖς ἁγίοις',
   'nyni de poreuomai eis Ierousalēm diakonōn tois hagiois',
   '''Minister'' (diakonōn — serve; Paul is carrying the collection). ''Unto the saints'' — the poor Jewish Christians in Jerusalem. Before going west, Paul must complete his commitment to the Jerusalem church. This collection symbolises Gentile-Jewish unity (vv.26-27).',
   NULL),
  (26, 'For it hath pleased them of Macedonia and Achaia to make a certain contribution for the poor saints which are at Jerusalem.',
   'εὐδόκησαν γὰρ Μακεδονία καὶ Ἀχαΐα κοινωνίαν τινὰ ποιήσασθαι εἰς τοὺς πτωχοὺς τῶν ἁγίων τῶν ἐν Ἰερουσαλήμ',
   'eudokēsan gar Makedonia kai Achaia koinōnian tina poiēsasthai eis tous ptōchous tōn hagiōn tōn en Ierousalēm',
   '''It hath pleased them'' (eudokēsan — they were happy, they chose freely). ''Contribution'' (koinōnian — fellowship, sharing; the word for fellowship is used for the financial gift, showing that giving is an act of communion). ''Poor saints in Jerusalem'' — the collection was a major project across Paul''s churches (cf. 1 Corinthians 16:1-4, 2 Corinthians 8-9).',
   NULL),
  (27, 'It hath pleased them verily; and their debtors they are. For if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things.',
   'εὐδόκησαν γάρ καὶ ὀφειλέται αὐτῶν εἰσιν εἰ γὰρ τοῖς πνευματικοῖς αὐτῶν ἐκοινώνησαν τὰ ἔθνη ὀφείλουσιν καὶ ἐν τοῖς σαρκικοῖς λειτουργῆσαι αὐτοῖς',
   'eudokēsan gar kai opheiletai autōn eisin ei gar tois pneumatikois autōn ekoinōnēsan ta ethnē opheilousin kai en tois sarkikois leitourgēsai autois',
   '''Debtors'' (opheiletai — those who owe a debt). ''Spiritual things'' (pneumatikois — the gospel, salvation, the Scriptures). ''Carnal things'' (sarkikois — material things, physical provision). The Gentiles received spiritual riches from Jerusalem; they owe material support in return. This reciprocity strengthens Jew-Gentile unity.',
   NULL),
  (28, 'When therefore I have performed this, and have sealed to them this fruit, I will come by you into Spain.',
   'τοῦτο οὖν ἐπιτελέσας καὶ σφραγισάμενος αὐτοῖς τὸν καρπὸν τοῦτον ἀπελεύσομαι δι᾿ ὑμῶν εἰς τὴν Σπανίαν',
   'touto oun epitelesas kai sphragisamenos autois ton karpon touton apeleusomai di hymōn eis tēn Spanian',
   '''Performed'' (epitelesas — completed, accomplished). ''Sealed'' (sphragisamenos — delivered safely under seal; guaranteeing secure delivery). ''Fruit'' (karpon — the collection as the fruit of Gentile gratitude). Once this mission is accomplished, Paul plans Rome then Spain.',
   NULL),
  (29, 'And I am sure that, when I come unto you, I shall come in the fulness of the blessing of the gospel of Christ.',
   'οἶδα δὲ ὅτι ἐρχόμενος πρὸς ὑμᾶς ἐν πληρώματι εὐλογίας τοῦ εὐαγγελίου τοῦ Χριστοῦ ἐλεύσομαι',
   'oida de hoti erchomenos pros hymas en plērōmati eulogias tou euangeliou tou Christou eleusomai',
   '''Fulness of the blessing'' (plērōmati eulogias — full measure of blessing). Paul is confident his visit will be richly blessed. His confidence rests not on himself but on the gospel of Christ. He did eventually come to Rome — but as a prisoner (Acts 28).',
   NULL),
  (30, 'Now I beseech you, brethren, for the Lord Jesus Christ''s sake, and for the love of the Spirit, that ye strive together with me in your prayers to God for me;',
   'παρακαλῶ δὲ ὑμᾶς ἀδελφοί διὰ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ καὶ διὰ τῆς ἀγάπης τοῦ πνεύματος συναγωνίσασθαί μοι ἐν ταῖς προσευχαῖς ὑπὲρ ἐμοῦ πρὸς τὸν θεόν',
   'parakalō de hymas adelphoi dia tou kyriou hēmōn Iēsou Christou kai dia tēs agapēs tou pneumatos synagōnisasthai moi en tais proseuchais hyper emou pros ton theon',
   '''Strive together'' (synagōnisasthai — wrestle together, agonize with; from syn + agōnizomai). Prayer is a spiritual battle, not a casual request. ''Love of the Spirit'' — the Holy Spirit''s love binds believers together in prayer. Paul asks for intense, passionate intercession.',
   NULL),
  (31, 'That I may be delivered from them that do not believe in Judaea; and that my service which I have for Jerusalem may be accepted of the saints;',
   'ἵνα ῥυσθῶ ἀπὸ τῶν ἀπειθούντων ἐν τῇ Ἰουδαίᾳ καὶ ἵνα ἡ διακονία μου ἡ εἰς Ἰερουσαλὴμ εὐπρόσδεκτος γένηται τοῖς ἁγίοις',
   'hina rhysthō apo tōn apeithountōn en tē Ioudaia kai hina hē diakonia mou hē eis Ierousalēm euprosdektos genētai tois hagiois',
   'Paul requests prayer for two dangers: (1) unbelieving Jews in Judea who might harm him (the danger was real — cf. Acts 21:27-36); (2) that the Jerusalem church would accept the Gentile collection. Both prayers were partially answered: Paul survived but was arrested; the collection''s reception is not explicitly recorded in Acts.',
   NULL),
  (32, 'That I may come unto you with joy by the will of God, and may with you be refreshed.',
   'ἵνα ἐν χαρᾷ ἐλθὼν πρὸς ὑμᾶς διὰ θελήματος θεοῦ καὶ συναναπαύσωμαι ὑμῖν',
   'hina en chara elthōn pros hymas dia thelēmatos theou kai synanapausōmai hymin',
   '''With joy'' (en chara). ''By the will of God'' (dia thelēmatos theou — Paul subordinates all plans to God''s will). ''Be refreshed'' (synanapausōmai — find rest together; mutual refreshment). Paul longs for fellowship that restores both parties.',
   NULL),
  (33, 'Now the God of peace be with you all. Amen.',
   'ὁ δὲ θεὸς τῆς εἰρήνης μετὰ πάντων ὑμῶν ἀμήν',
   'ho de theos tēs eirēnēs meta pantōn hymōn amēn',
   '''God of peace'' (theos tēs eirēnēs — God is the source and giver of peace). A brief benediction closing the body of the letter. The ''God of peace'' is especially apt after chapters 14-15 which dealt with conflict within the community. ''With you all'' — inclusive of both weak and strong, Jew and Gentile.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 15;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 bear / carry
  ('βαστάζω', 'bastazō', 'G941', 'To bear, carry, endure — to take up and carry a burden. The strong are to carry the weaknesses of the weak as one carries a heavy load. This is not mere toleration but active, sacrificial burden-bearing. Christ is the supreme example: he bore our sins on the cross (1 Peter 2:24) and bears our weaknesses daily.', 1),
  -- v.4 hope through Scripture
  ('ἐλπίς', 'elpis', 'G1680', 'Hope, expectation, confidence in what is to come — not wishful thinking but assured anticipation grounded in God''s character and promises. In v.4, hope is produced by patience and the encouragement of Scripture. In v.13, God is the ''God of hope'' who fills believers with hope through the Holy Spirit. Biblical hope is always forward-looking and God-dependent.', 2),
  -- v.7 receive one another
  ('προσλαμβάνω', 'proslambanō', 'G4355', 'To receive, welcome, accept into one''s company — from pros (to, toward) + lambanō (to take). The same word used in 14:1. Christ ''received'' (proselabeto) us while we were sinners; this divine welcome is the model for our welcome of fellow believers. Acceptance is not endorsement of every practice but embrace of every person Christ has embraced.', 3),
  -- v.13 God of hope
  ('πληρόω', 'plēroō', 'G4137', 'To fill, make full, bring to completion — from plērēs (full). God fills believers with joy and peace so that they overflow (perisseuō) with hope. The filling is not partial but total: ''all joy and peace.'' This fullness is experienced ''in believing'' — faith is the vessel that receives and holds God''s filling. The result is abundance, not scarcity.', 4),
  -- v.16 priestly minister
  ('λειτουργός', 'leitourgos', 'G3011', 'Public servant, minister, priest — from leitos (public) + ergon (work). Originally a civic term for one who performs public service at their own expense; it acquired sacred overtones, used of priestly ministry. Paul sees his apostolic work among the Gentiles as a priestly service: he ministers (hierourgounta — performs sacred rites with) the gospel, offering the Gentiles as a sacrifice to God.', 5),
  -- v.16 ministering as priest
  ('ἱερουργέω', 'hierourgeō', 'G2418', 'To perform sacred rites, serve as a priest — from hieros (sacred) + ergon (work). Used only here in the NT. Paul describes his gospel preaching in sacrificial terms: he is a priest whose sacred work is proclaiming the gospel, and the Gentile converts are the offering he presents to God. This language elevates evangelism to the level of temple worship.', 6),
  -- v.20 pioneer ambition
  ('φιλοτιμέομαι', 'philotimeomai', 'G5389', 'To aspire, make it one''s ambition, be zealous for honour — from philos (loving) + timē (honour). Paul''s ambition was to preach where Christ had never been named. This pioneer missionary strategy shaped his entire career: always pressing into new territory rather than consolidating existing work. It explains why he never settled permanently in one location.', 7),
  -- v.30 strive together in prayer
  ('συναγωνίζομαι', 'synagōnizomai', 'G4865', 'To strive together, wrestle alongside, contend with — from syn (together) + agōnizomai (to struggle, compete; from agōn, contest). Prayer is presented as an athletic or military struggle requiring intense effort. Paul does not ask for casual prayer but for agonizing intercession — wrestling together with him against spiritual opposition. This reveals the nature of true intercessory prayer.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 15
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 4
    WHEN 3 THEN 7
    WHEN 4 THEN 13
    WHEN 5 THEN 16 WHEN 6 THEN 16
    WHEN 7 THEN 20
    WHEN 8 THEN 30
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 bear infirmities
  (1, 'Galatians 6:1-2', 1),
  (1, '1 Corinthians 9:22', 2),
  -- v.3 Christ pleased not himself
  (3, 'Psalm 69:9', 3),
  (3, 'Philippians 2:5-8', 4),
  -- v.4 written for our learning
  (4, '1 Corinthians 10:11', 5),
  (4, '2 Timothy 3:16-17', 6),
  -- v.7 receive one another
  (7, 'Romans 14:1', 7),
  (7, 'Philippians 2:1-4', 8),
  -- v.9 Gentiles praise
  (9, 'Psalm 18:49', 9),
  (9, '2 Samuel 22:50', 10),
  -- v.10 rejoice Gentiles
  (10, 'Deuteronomy 32:43', 11),
  -- v.11 praise the Lord all Gentiles
  (11, 'Psalm 117:1', 12),
  -- v.12 root of Jesse
  (12, 'Isaiah 11:10', 13),
  (12, 'Revelation 22:16', 14),
  -- v.13 God of hope
  (13, 'Romans 14:17', 15),
  (13, 'Galatians 5:22', 16),
  -- v.16 priestly ministry
  (16, 'Philippians 2:17', 17),
  (16, 'Romans 12:1', 18),
  -- v.19 Jerusalem to Illyricum
  (19, 'Acts 19:21', 19),
  (19, '2 Corinthians 12:12', 20),
  -- v.20 pioneer preaching
  (20, '2 Corinthians 10:15-16', 21),
  -- v.21 those not told shall see
  (21, 'Isaiah 52:15', 22),
  -- v.25 collection for Jerusalem
  (25, '1 Corinthians 16:1-4', 23),
  (25, '2 Corinthians 8:1-4', 24),
  (25, 'Acts 24:17', 25),
  -- v.27 spiritual and material sharing
  (27, '1 Corinthians 9:11', 26),
  (27, 'Galatians 6:6', 27),
  -- v.30 strive together in prayer
  (30, 'Colossians 4:12', 28),
  (30, 'Ephesians 6:18-20', 29),
  -- v.31 delivered from unbelievers
  (31, 'Acts 21:27-36', 30),
  (31, '2 Thessalonians 3:2', 31),
  -- v.33 God of peace
  (33, 'Romans 16:20', 32),
  (33, 'Philippians 4:9', 33)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 15
  AND v.verse_number = cr.verse_number;
