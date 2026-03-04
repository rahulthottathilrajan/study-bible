-- =============================================
-- LEARN GREEK — Part 5: Vocabulary Related Words
-- =============================================
-- Run AFTER 04-greek-vocabulary-lessons.sql
-- 2 cognate/related words per vocabulary lesson
-- lesson_ids 25–54 match Part 4
-- =============================================

INSERT INTO greek_vocabulary (lesson_id, greek_word, transliteration, meaning, part_of_speech, strongs_number, numeric_occurrences, example_verse_ref, example_verse_text) VALUES

-- θεός (lesson 25) — related: theology, godhead
(25, 'θεότης',    'theotēs',       'deity / godhead / divine nature',        'Noun, feminine',   'G2320', 1,   'Colossians 2:9',      'For in him dwelleth all the fulness of the Godhead bodily'),
(25, 'θεόπνευστος','theopneustos',  'God-breathed / inspired by God',         'Adjective',        'G2315', 1,   '2 Timothy 3:16',      'All scripture is given by inspiration of God'),

-- κύριος (lesson 26) — related: ruling, dominion
(26, 'κυριεύω',   'kyrieuō',       'to be lord over / to rule / to master',  'Verb',             'G2961', 7,   'Romans 6:14',         'For sin shall not have dominion over you: for ye are not under the law'),
(26, 'κυριότης',  'kyriotēs',      'lordship / dominion / authority',         'Noun, feminine',   'G2963', 4,   'Ephesians 1:21',      'Far above all principality, and power, and might, and dominion'),

-- Χριστός (lesson 27) — related: anointing, anti-christ
(27, 'χρίω',      'chriō',         'to anoint (with oil)',                    'Verb',             'G5548', 5,   'Luke 4:18',           'The Spirit of the Lord is upon me, because he hath anointed me to preach'),
(27, 'ἀντίχριστος','antichristos', 'antichrist / one opposing Christ',        'Noun, masculine',  'G500',  5,   '1 John 2:18',         'Ye have heard that antichrist shall come'),

-- Ἰησοῦς (lesson 28) — related: saviour, salvation
(28, 'σωτήρ',     'sōtēr',         'Saviour / deliverer',                     'Noun, masculine',  'G4990', 24,  'Luke 2:11',           'For unto you is born this day in the city of David a Saviour, which is Christ the Lord'),
(28, 'σῴζω',      'sōzō',          'to save / to rescue / to heal / to keep safe', 'Verb',        'G4982', 106, 'Matthew 1:21',        'He shall save his people from their sins'),

-- πνεῦμα (lesson 29) — related: spiritual, breathe
(29, 'πνευματικός','pneumatikos',  'spiritual',                               'Adjective',        'G4152', 26,  '1 Corinthians 2:14',  'But the natural man receiveth not the things of the Spirit of God'),
(29, 'πνέω',      'pneō',          'to blow / to breathe',                    'Verb',             'G4154', 7,   'John 3:8',            'The wind bloweth where it listeth, and thou hearest the sound thereof'),

-- ἀγάπη (lesson 30) — related: love verb, brotherhood
(30, 'ἀγαπητός',  'agapētos',      'beloved / dearly loved',                  'Adjective',        'G27',   61,  'Romans 1:7',          'To all that be in Rome, beloved of God, called to be saints'),
(30, 'φιλαδελφία','philadelphia',  'brotherly love',                          'Noun, feminine',   'G5360', 6,   'Romans 12:10',        'Be kindly affectioned one to another with brotherly love'),

-- πίστις (lesson 31) — related: faithful, believe
(31, 'πιστός',    'pistos',        'faithful / trustworthy / believing',      'Adjective',        'G4103', 67,  '1 Corinthians 1:9',   'God is faithful, by whom ye were called unto the fellowship of his Son Jesus Christ'),
(31, 'ἄπιστος',   'apistos',       'unbelieving / unfaithful',                'Adjective',        'G571',  23,  'John 20:27',          'Be not faithless, but believing'),

-- χάρις (lesson 32) — related: gift, thanksgiving
(32, 'χάρισμα',   'charisma',      'gift of grace / spiritual gift',          'Noun, neuter',     'G5486', 17,  'Romans 12:6',         'Having then gifts differing according to the grace that is given to us'),
(32, 'εὐχαριστία','eucharistia',   'thanksgiving / gratitude',                'Noun, feminine',   'G2169', 15,  'Philippians 4:6',     'In every thing by prayer and supplication with thanksgiving let your requests be made known unto God'),

-- σωτηρία (lesson 33) — related: heal, wholeness
(33, 'σωτήριος',  'sōtērios',      'bringing salvation / saving',             'Adjective',        'G4992', 5,   'Titus 2:11',          'For the grace of God that bringeth salvation hath appeared to all men'),
(33, 'διάσῳζω',   'diasōzō',       'to bring safely through / to rescue completely', 'Verb',      'G1295', 8,   'Acts 27:44',          'And so it came to pass, that they escaped all safe to land'),

-- ἁμαρτία (lesson 34) — related: sinner, trespass
(34, 'ἁμαρτωλός', 'hamartōlos',    'sinner / one who misses the mark',        'Noun/Adjective',   'G268',  47,  'Luke 15:7',           'Joy shall be in heaven over one sinner that repenteth'),
(34, 'παράπτωμα', 'paraptōma',     'trespass / falling beside the path',      'Noun, neuter',     'G3900', 19,  'Ephesians 2:1',       'And you hath he quickened, who were dead in trespasses and sins'),

-- ἐκκλησία (lesson 35) — related: calling, assembly
(35, 'καλέω',     'kaleō',         'to call / to summon / to invite',         'Verb',             'G2564', 148, 'Matthew 22:14',       'For many are called, but few are chosen'),
(35, 'συναγωγή',  'synagōgē',      'synagogue / assembly / gathering',        'Noun, feminine',   'G4864', 56,  'Acts 13:14',          'They came to Antioch in Pisidia, and went into the synagogue on the sabbath day'),

-- εὐαγγέλιον (lesson 36) — related: proclaim, evangelist
(36, 'εὐαγγελίζω','euangelizō',   'to preach the gospel / to announce good news', 'Verb',         'G2097', 54,  'Luke 4:18',           'He hath sent me to preach the gospel to the poor'),
(36, 'εὐαγγελιστής','euangelistēs','evangelist / preacher of good news',      'Noun, masculine',  'G2099', 3,   'Ephesians 4:11',      'And he gave some, apostles; and some, prophets; and some, evangelists'),

-- κοινωνία (lesson 37) — related: partner, share
(37, 'κοινωνός',  'koinōnos',      'partner / sharer / participant',          'Noun, masculine',  'G2844', 10,  '1 Corinthians 10:18', 'Are not they which eat of the sacrifices partakers of the altar?'),
(37, 'κοινωνέω',  'koinōneō',      'to share in / to take part in / to contribute', 'Verb',       'G2841', 8,   'Romans 12:13',        'Distributing to the necessity of saints; given to hospitality'),

-- βαπτίζω (lesson 38) — related: baptism noun, the Baptist
(38, 'βάπτισμα',  'baptisma',      'baptism / immersion',                     'Noun, neuter',     'G908',  22,  'Romans 6:4',          'Therefore we are buried with him by baptism into death'),
(38, 'βαπτιστής', 'baptistēs',     'the Baptist / the Baptizer (John)',       'Noun, masculine',  'G910',  12,  'Matthew 3:1',         'In those days came John the Baptist, preaching in the wilderness of Judaea'),

-- ἀπόστολος (lesson 39) — related: sending verb, mission
(39, 'ἀποστέλλω', 'apostellō',     'to send / to send out with authority',    'Verb',             'G649',  132, 'John 20:21',          'As my Father hath sent me, even so send I you'),
(39, 'πέμπω',     'pempō',         'to send (general sending)',               'Verb',             'G3992', 79,  'John 14:26',          'But the Comforter, which is the Holy Ghost, whom the Father will send in my name'),

-- λόγος (lesson 40) — related: speak, reason
(40, 'λέγω',      'legō',          'to say / to speak',                       'Verb',             'G3004', 2354,'John 8:58',           'Jesus said unto them, Verily, verily, I say unto you, Before Abraham was, I am'),
(40, 'ῥῆμα',      'rhēma',         'spoken word / individual utterance',      'Noun, neuter',     'G4487', 68,  'Romans 10:17',        'So then faith cometh by hearing, and hearing by the word of God'),

-- δικαιοσύνη (lesson 41) — related: just, justify
(41, 'δίκαιος',   'dikaios',       'righteous / just / right',                'Adjective',        'G1342', 79,  'Matthew 5:45',        'He maketh his sun to rise on the evil and on the good'),
(41, 'δικαιόω',   'dikaioō',       'to justify / to declare righteous',       'Verb',             'G1344', 39,  'Romans 3:28',         'Therefore we conclude that a man is justified by faith without the deeds of the law'),

-- ἀλήθεια (lesson 42) — related: true, genuine
(42, 'ἀληθινός',  'alēthinos',     'genuine / real / authentic (contrasted with false/shadow)', 'Adjective', 'G228', 28, 'John 6:32', 'My Father giveth you the true bread from heaven'),
(42, 'ἀληθής',    'alēthēs',       'truthful / true / reliable',             'Adjective',        'G227',  26,  'John 3:33',           'He that hath received his testimony hath set to his seal that God is true'),

-- δόξα (lesson 43) — related: glorify, glorious
(43, 'δοξάζω',    'doxazō',        'to glorify / to honour',                  'Verb',             'G1392', 61,  'John 15:8',           'Herein is my Father glorified, that ye bear much fruit'),
(43, 'ἔνδοξος',   'endoxos',       'glorious / honoured / in glory',          'Adjective',        'G1741', 4,   'Ephesians 5:27',      'That he might present it to himself a glorious church, not having spot, or wrinkle'),

-- ζωή (lesson 44) — related: live, make alive
(44, 'ζάω',       'zaō',           'to live / to be alive',                   'Verb',             'G2198', 140, 'Galatians 2:20',      'I live; yet not I, but Christ liveth in me'),
(44, 'ζωοποιέω',  'zōopoieō',      'to make alive / to give life',            'Verb',             'G2227', 11,  'John 5:21',           'For as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will'),

-- πιστεύω (lesson 45) — related: unbelief, faithfulness
(45, 'ἀπιστία',   'apistia',       'unbelief / lack of faith',                'Noun, feminine',   'G570',  11,  'Mark 9:24',           'Lord, I believe; help thou mine unbelief'),
(45, 'ὁμολογέω',  'homologeō',     'to confess / to declare openly',          'Verb',             'G3670', 26,  'Romans 10:9',         'If thou shalt confess with thy mouth the Lord Jesus'),

-- γινώσκω (lesson 46) — related: knowledge, know thoroughly
(46, 'γνῶσις',    'gnōsis',        'knowledge / understanding',               'Noun, feminine',   'G1108', 29,  '1 Corinthians 13:2',  'And though I have the gift of prophecy, and understand all mysteries, and all knowledge'),
(46, 'ἐπίγνωσις', 'epignōsis',     'full / thorough / accurate knowledge',    'Noun, feminine',   'G1922', 20,  'Philippians 1:9',     'That your love may abound yet more and more in knowledge and in all judgment'),

-- ἀγαπάω (lesson 47) — related: beloved, friend-love
(47, 'ἀγαπητός',  'agapētos',      'beloved / dearly loved one',              'Adjective',        'G27',   61,  '1 John 4:7',          'Beloved, let us love one another: for love is of God'),
(47, 'φιλέω',     'phileō',        'to love as a friend / to have warm affection for', 'Verb',    'G5368', 25,  'John 11:36',          'Then said the Jews, Behold how he loved him'),

-- μετανοέω (lesson 48) — related: repentance noun, regret
(48, 'μετάνοια',  'metanoia',      'repentance / change of mind',             'Noun, feminine',   'G3341', 22,  'Matthew 3:8',         'Bring forth therefore fruits meet for repentance'),
(48, 'μεταμέλομαι','metamelomai',  'to regret / to feel remorse (without necessarily changing course)', 'Verb', 'G3338', 6, 'Matthew 27:3', 'Then Judas, which had betrayed him, when he saw that he was condemned, repented himself'),

-- δοξάζω (lesson 49) — related: vainglory, glorification
(49, 'δόξα',      'doxa',          'glory / splendour / honour',              'Noun, feminine',   'G1391', 168, 'John 1:14',           'And we beheld his glory, the glory as of the only begotten of the Father'),
(49, 'κενοδοξία', 'kenodoxia',     'vainglory / empty conceit',               'Noun, feminine',   'G2754', 1,   'Philippians 2:3',     'Let nothing be done through strife or vainglory'),

-- παρουσία (lesson 50) — related: appear, coming
(50, 'ἐπιφάνεια', 'epiphaneia',    'appearing / manifestation / glorious display', 'Noun, feminine', 'G2015', 6, 'Titus 2:13',         'Looking for that blessed hope, and the glorious appearing of the great God and our Saviour Jesus Christ'),
(50, 'ἀπάντησις', 'apantēsis',     'meeting / the act of going out to meet',  'Noun, feminine',   'G529',  3,   '1 Thessalonians 4:17','Then we which are alive and remain shall be caught up together with them in the clouds, to meet the Lord in the air'),

-- ἀποκάλυψις (lesson 51) — related: reveal, manifestation
(51, 'ἀποκαλύπτω','apokalyptō',    'to reveal / to unveil',                   'Verb',             'G601',  26,  'Galatians 1:16',      'To reveal his Son in me, that I might preach him among the heathen'),
(51, 'φανερόω',   'phaneroō',      'to make visible / to manifest / to disclose', 'Verb',         'G5319', 49,  'Colossians 3:4',      'When Christ, who is our life, shall appear, then shall ye also appear with him in glory'),

-- βασιλεία (lesson 52) — related: king, reign
(52, 'βασιλεύς',  'basileus',      'king / sovereign ruler',                  'Noun, masculine',  'G935',  115, 'Revelation 17:14',    'These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings'),
(52, 'βασιλεύω',  'basileuō',      'to reign / to be king / to rule',         'Verb',             'G936',  21,  'Romans 5:17',         'They which receive abundance of grace and of the gift of righteousness shall reign in life by one, Jesus Christ'),

-- κρίσις (lesson 53) — related: judge, condemn
(53, 'κρίνω',     'krinō',         'to judge / to evaluate / to condemn',     'Verb',             'G2919', 114, 'John 12:48',          'He that rejecteth me, and receiveth not my words, hath one that judgeth him'),
(53, 'κατακρίνω', 'katakrinō',     'to condemn / to judge against',           'Verb',             'G2632', 18,  'Romans 8:3',          'God, sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh'),

-- αἰώνιος (lesson 54) — related: age, world
(54, 'αἰών',      'aiōn',          'age / era / eternity / the present world order', 'Noun, masculine', 'G165', 122, 'Matthew 28:20', 'Lo, I am with you always, even unto the end of the world'),
(54, 'νῦν αἰών',  'nyn aiōn',      'the present age (contrasted with the Age to Come)', 'Phrase',  NULL,    NULL, 'Galatians 1:4',       'Who gave himself for our sins, that he might deliver us from this present evil world');
