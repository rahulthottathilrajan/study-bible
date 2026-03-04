-- =============================================
-- LEARN GREEK — Part 3: Alphabet Data
-- =============================================
-- Run AFTER 02-greek-alphabet-lessons.sql
-- Populates greek_alphabet and example vocab
-- linked to each of the 24 alphabet lessons
-- =============================================

-- ============================================
-- SECTION A: greek_alphabet (one row per letter)
-- ============================================
INSERT INTO greek_alphabet (lesson_id, greek_letter, letter_name, transliteration, numeric_value, pronunciation_guide, pictographic) VALUES
  (1,  'Α α', 'Alpha',   'a',  1,   'ah, as in father',                         'Phoenician Aleph 𐤀 — ox head, symbolising strength and the first/chief'),
  (2,  'Β β', 'Beta',    'b',  2,   'b, as in boy',                             'Phoenician Beth 𐤁 — house, symbolising dwelling and family'),
  (3,  'Γ γ', 'Gamma',   'g',  3,   'g as in go; ng before κ γ ξ χ',           'Phoenician Gimel 𐤂 — camel, symbolising journeying and carrying'),
  (4,  'Δ δ', 'Delta',   'd',  4,   'd, as in dog',                             'Phoenician Daleth 𐤃 — door, symbolising a gateway and new path'),
  (5,  'Ε ε', 'Epsilon', 'e',  5,   'SHORT e as in met (never long ee)',        'Phoenician He 𐤄 — window, symbolising light and revelation entering'),
  (6,  'Ζ ζ', 'Zeta',    'z',  7,   'z as in zone (Koine); dz classical',       'Phoenician Zayin 𐤆 — weapon, symbolising sharpness and spiritual warfare'),
  (7,  'Η η', 'Eta',     'ē',  8,   'LONG ay as in day (hold the sound)',       'Phoenician Heth 𐤇 — fence/courtyard, enclosed and protected space'),
  (8,  'Θ θ', 'Theta',   'th', 9,   'th as in think (never as in the)',         'Phoenician Teth 𐤈 — wheel or coiled rope, symbolising completeness'),
  (9,  'Ι ι', 'Iota',    'i',  10,  'ee as in feet (always the long ee)',       'Phoenician Yod 𐤉 — hand, symbolising work and divine action'),
  (10, 'Κ κ', 'Kappa',   'k',  20,  'k as in kite (crisp, never silent)',       'Phoenician Kaph 𐤊 — open palm, symbolising receiving and extending grace'),
  (11, 'Λ λ', 'Lambda',  'l',  30,  'l as in love (clear liquid sound)',        'Phoenician Lamed 𐤋 — ox goad, symbolising direction and teaching'),
  (12, 'Μ μ', 'Mu',      'm',  40,  'm as in mother',                           'Phoenician Mem 𐤌 — water, symbolising flow and cleansing revelation'),
  (13, 'Ν ν', 'Nu',      'n',  50,  'n as in now — NEVER v! lowercase ν looks like v but sounds like n', 'Phoenician Nun 𐤍 — fish, symbolising life and movement'),
  (14, 'Ξ ξ', 'Xi',      'x',  60,  'ks blended as in fox (one sound)',         'Phoenician Samekh 𐤎 — support/pillar, symbolising upholding'),
  (15, 'Ο ο', 'Omicron', 'o',  70,  'SHORT o as in not (never long oh)',        'Phoenician Ayin 𐤏 — eye, symbolising seeing and insight'),
  (16, 'Π π', 'Pi',      'p',  80,  'p as in pen',                              'Phoenician Pe 𐤐 — mouth, symbolising speech and expression'),
  (17, 'Ρ ρ', 'Rho',     'r',  100, 'r, rolled or trilled — LOOKS like P but is R!', 'Phoenician Resh 𐤓 — head, symbolising headship and authority'),
  (18, 'Σ σ ς', 'Sigma', 's',  200, 's as in sun; σ mid-word, ς end-of-word',  'Phoenician Shin 𐤔 — teeth, symbolising sharpness'),
  (19, 'Τ τ', 'Tau',     't',  300, 't as in top (clean, not aspirated)',       'Phoenician Tav 𐤕 — ancient cross/mark, the seal of the faithful'),
  (20, 'Υ υ', 'Upsilon', 'y',  400, 'ü (round lips for oo, say ee) — no English equivalent', 'Phoenician Vav 𐤅 — hook/peg, symbolising connection and joining'),
  (21, 'Φ φ', 'Phi',     'ph', 500, 'f as in phone (single f sound)',           'Greek invention — circle with vertical line, possibly representing a torch'),
  (22, 'Χ χ', 'Chi',     'ch', 600, 'ch as in Scottish loch (guttural, NOT church)', 'Greek invention — X shape, the cross-mark of Christ'),
  (23, 'Ψ ψ', 'Psi',     'ps', 700, 'ps blended as in lips (one sound at start of word)', 'Greek invention — trident shape, soul reaching upward'),
  (24, 'Ω ω', 'Omega',   'ō',  800, 'LONG oh as in tone — always long, contrast omicron', 'Extended form of Omicron — ὦ μέγα, the great O');

-- ============================================
-- SECTION B: greek_vocabulary
-- Example NT words linked to each alphabet lesson
-- 2 key vocabulary words per letter
-- ============================================
INSERT INTO greek_vocabulary (lesson_id, greek_word, transliteration, meaning, part_of_speech, strongs_number, numeric_occurrences, example_verse_ref, example_verse_text) VALUES

-- Alpha (lesson 1)
(1, 'ἀγάπη',   'agapē',       'unconditional love',             'Noun, feminine',   'G26',   116,  'John 3:16',    'For God so loved the world, that he gave his only begotten Son'),
(1, 'ἄγγελος', 'angelos',     'angel / messenger',              'Noun, masculine',  'G32',   175,  'Matthew 1:20', 'The angel of the Lord appeared unto him in a dream'),

-- Beta (lesson 2)
(2, 'βασιλεία', 'basileia',   'kingdom / reign',                'Noun, feminine',   'G932',  162,  'Matthew 6:10', 'Thy kingdom come, Thy will be done in earth, as it is in heaven'),
(2, 'βαπτίζω',  'baptizō',    'to baptize / immerse',           'Verb',             'G907',  77,   'Matthew 28:19','Baptizing them in the name of the Father, and of the Son, and of the Holy Ghost'),

-- Gamma (lesson 3)
(3, 'γινώσκω', 'ginōskō',    'to know (experientially)',        'Verb',             'G1097', 222,  'John 17:3',    'And this is life eternal, that they might know thee the only true God'),
(3, 'γράφω',   'graphō',     'to write',                        'Verb',             'G1125', 191,  'John 20:31',   'But these are written, that ye might believe that Jesus is the Christ'),

-- Delta (lesson 4)
(4, 'δόξα',    'doxa',       'glory / honour',                  'Noun, feminine',   'G1391', 168,  'John 17:5',    'And now, O Father, glorify thou me with thine own self'),
(4, 'δικαιοσύνη','dikaiosynē','righteousness / justness',       'Noun, feminine',   'G1343', 92,   'Romans 1:17',  'For therein is the righteousness of God revealed from faith to faith'),

-- Epsilon (lesson 5)
(5, 'εἰρήνη',  'eirēnē',     'peace / wholeness / shalom',      'Noun, feminine',   'G1515', 91,   'John 14:27',   'Peace I leave with you, my peace I give unto you'),
(5, 'ἐκκλησία','ekklēsia',   'church / called-out assembly',    'Noun, feminine',   'G1577', 115,  'Matthew 16:18','Upon this rock I will build my church'),

-- Zeta (lesson 6)
(6, 'ζωή',     'zōē',        'life (eternal / spiritual)',      'Noun, feminine',   'G2222', 135,  'John 14:6',    'I am the way, the truth, and the life'),
(6, 'ζητέω',   'zēteō',      'to seek / search for',            'Verb',             'G2212', 117,  'Matthew 6:33', 'But seek ye first the kingdom of God, and his righteousness'),

-- Eta (lesson 7)
(7, 'ἡμέρα',   'hēmera',     'day',                             'Noun, feminine',   'G2250', 389,  'Matthew 6:34', 'Sufficient unto the day is the evil thereof'),
(7, 'ἥλιος',   'hēlios',     'sun',                             'Noun, masculine',  'G2246', 32,   'Matthew 5:45', 'He maketh his sun to rise on the evil and on the good'),

-- Theta (lesson 8)
(8, 'θεός',    'theos',      'God',                             'Noun, masculine',  'G2316', 1317, 'John 1:1',     'In the beginning was the Word, and the Word was with God, and the Word was God'),
(8, 'θάνατος', 'thanatos',   'death',                           'Noun, masculine',  'G2288', 120,  'Romans 6:23',  'For the wages of sin is death; but the gift of God is eternal life'),

-- Iota (lesson 9)
(9, 'Ἰησοῦς', 'Iēsous',     'Jesus (Yeshua — God saves)',      'Noun, masculine',  'G2424', 975,  'Matthew 1:21', 'Thou shalt call his name JESUS: for he shall save his people from their sins'),
(9, 'ἱερόν',  'hieron',     'temple (the whole complex)',       'Noun, neuter',     'G2411', 71,   'John 2:16',    'Make not my Father''s house an house of merchandise'),

-- Kappa (lesson 10)
(10,'κύριος',  'kyrios',     'Lord / Master',                   'Noun, masculine',  'G2962', 748,  'Romans 10:9',  'That if thou shalt confess with thy mouth the Lord Jesus'),
(10,'καρδία',  'kardia',     'heart (inner person)',            'Noun, feminine',   'G2588', 156,  'Matthew 22:37','Thou shalt love the Lord thy God with all thy heart'),

-- Lambda (lesson 11)
(11,'λόγος',   'logos',      'word / reason / divine expression','Noun, masculine', 'G3056', 330,  'John 1:1',     'In the beginning was the Word, and the Word was with God'),
(11,'λαός',    'laos',       'people / nation',                 'Noun, masculine',  'G2992', 142,  'Matthew 1:21', 'He shall save his people from their sins'),

-- Mu (lesson 12)
(12,'μαθητής', 'mathētēs',   'disciple / learner',              'Noun, masculine',  'G3101', 261,  'Matthew 28:19','Go ye therefore, and teach all nations'),
(12,'μαρτυρία','martyria',   'testimony / witness',             'Noun, feminine',   'G3141', 37,   'John 1:7',     'The same came for a witness, to bear witness of the Light'),

-- Nu (lesson 13)
(13,'νόμος',   'nomos',      'law / Torah',                     'Noun, masculine',  'G3551', 194,  'Romans 3:31',  'Do we then make void the law through faith? God forbid: yea, we establish the law'),
(13,'ναός',    'naos',       'temple sanctuary (inner holy place)','Noun, masculine','G3485', 45,   '1 Corinthians 3:16','Know ye not that ye are the temple of God?'),

-- Xi (lesson 14)
(14,'ξύλον',   'xylon',      'wood / tree / cross',             'Noun, neuter',     'G3586', 20,   'Acts 5:30',    'The God of our fathers raised up Jesus, whom ye slew and hanged on a tree'),
(14,'ξένος',   'xenos',      'stranger / foreigner / guest',    'Noun, masculine',  'G3581', 14,   'Matthew 25:35','I was a stranger, and ye took me in'),

-- Omicron (lesson 15)
(15,'ὁδός',    'hodos',      'way / road / path / journey',     'Noun, feminine',   'G3598', 101,  'John 14:6',    'I am the way, the truth, and the life'),
(15,'οὐρανός', 'ouranos',    'heaven / sky',                    'Noun, masculine',  'G3772', 284,  'Matthew 6:9',  'Our Father which art in heaven, Hallowed be thy name'),

-- Pi (lesson 16)
(16,'πίστις',  'pistis',     'faith / trust / faithfulness',    'Noun, feminine',   'G4102', 244,  'Hebrews 11:1', 'Now faith is the substance of things hoped for, the evidence of things not seen'),
(16,'πνεῦμα',  'pneuma',     'spirit / breath / wind',          'Noun, neuter',     'G4151', 385,  'John 4:24',    'God is a Spirit: and they that worship him must worship him in spirit and in truth'),

-- Rho (lesson 17)
(17,'ῥῆμα',    'rhēma',      'spoken word / utterance',         'Noun, neuter',     'G4487', 68,   'Matthew 4:4',  'Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God'),
(17,'ῥίζα',    'rhiza',      'root',                            'Noun, feminine',   'G4491', 17,   'Romans 15:12', 'There shall be a root of Jesse, and he that shall rise to reign over the Gentiles'),

-- Sigma (lesson 18)
(18,'σωτηρία', 'sōtēria',    'salvation / deliverance',         'Noun, feminine',   'G4991', 46,   'Acts 4:12',    'Neither is there salvation in any other: for there is none other name'),
(18,'σταυρός', 'stauros',    'cross',                           'Noun, masculine',  'G4716', 27,   'Galatians 6:14','But God forbid that I should glory, save in the cross of our Lord Jesus Christ'),

-- Tau (lesson 19)
(19,'τέκνον',  'teknon',     'child / dear child',              'Noun, neuter',     'G5043', 99,   'John 1:12',    'To them gave he power to become the sons of God, even to them that believe on his name'),
(19,'τέλος',   'telos',      'end / goal / fulfilment',         'Noun, neuter',     'G5056', 41,   'Romans 10:4',  'For Christ is the end of the law for righteousness to every one that believeth'),

-- Upsilon (lesson 20)
(20,'υἱός',    'huios',      'son',                             'Noun, masculine',  'G5207', 382,  'John 3:16',    'He gave his only begotten Son, that whosoever believeth in him should not perish'),
(20,'ὕδωρ',    'hydōr',      'water',                           'Noun, neuter',     'G5204', 76,   'John 4:14',    'But whosoever drinketh of the water that I shall give him shall never thirst'),

-- Phi (lesson 21)
(21,'φῶς',     'phōs',       'light',                           'Noun, neuter',     'G5457', 73,   'John 1:5',     'And the light shineth in darkness; and the darkness comprehended it not'),
(21,'φωνή',    'phōnē',      'voice / sound',                   'Noun, feminine',   'G5456', 139,  'John 10:27',   'My sheep hear my voice, and I know them, and they follow me'),

-- Chi (lesson 22)
(22,'Χριστός', 'Christos',   'Christ / the Anointed One',       'Noun, masculine',  'G5547', 569,  'Matthew 1:16', 'Of whom was born Jesus, who is called Christ'),
(22,'χάρις',   'charis',     'grace / undeserved favour',       'Noun, feminine',   'G5485', 156,  'Ephesians 2:8','For by grace are ye saved through faith; and that not of yourselves'),

-- Psi (lesson 23)
(23,'ψυχή',    'psychē',     'soul / inner life / self',        'Noun, feminine',   'G5590', 103,  'Matthew 16:26','What shall a man give in exchange for his soul?'),
(23,'ψαλμός',  'psalmos',    'psalm / song of praise',          'Noun, masculine',  'G5568', 7,    'Ephesians 5:19','Speaking to yourselves in psalms and hymns and spiritual songs'),

-- Omega (lesson 24)
(24,'ὥρα',     'hōra',       'hour / appointed time',           'Noun, feminine',   'G5610', 106,  'John 12:23',   'The hour is come, that the Son of man should be glorified'),
(24,'ὠφελέω',  'ōpheleō',    'to profit / benefit / help',      'Verb',             'G5623', 15,   'Mark 8:36',    'For what shall it profit a man, if he shall gain the whole world, and lose his own soul?');
