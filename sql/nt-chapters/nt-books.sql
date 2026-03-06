-- ═══════════════════════════════════════════════════
-- NEW TESTAMENT BOOKS — All 27 Books
-- Safe to re-run — uses ON CONFLICT to skip existing books
-- ═══════════════════════════════════════════════════

-- ═══════════════ GOSPELS ═══════════════

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Matthew', 'New Testament', 'Gospels', 28, 40,
  'Κατὰ Ματθαῖον', 'According to Matthew (Gift of God)',
  'Matthew (Levi)', 'c. AD 55–65',
  'Jesus the Messiah-King — fulfilment of Old Testament prophecy',
  'Written primarily for a Jewish audience, Matthew presents Jesus as the long-awaited Messiah prophesied throughout the Old Testament. With over 60 OT quotations and 5 major discourse blocks, the Gospel demonstrates how Jesus fulfils the Law and the Prophets, establishing the Kingdom of Heaven.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Mark', 'New Testament', 'Gospels', 16, 41,
  'Κατὰ Μᾶρκον', 'According to Mark (Polite/Shining)',
  'John Mark', 'c. AD 55–65',
  'Jesus the Servant of God — action and authority',
  'The shortest and most fast-paced Gospel, Mark presents Jesus as the mighty Servant of the Lord. Written likely for a Roman audience, it emphasises Jesus'' deeds over His words, using ''straightway'' (eutheos) over 40 times. Mark reveals the Messianic secret — Jesus'' true identity as the suffering Son of God.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Luke', 'New Testament', 'Gospels', 24, 42,
  'Κατὰ Λουκᾶν', 'According to Luke (Light-Giving)',
  'Luke the physician', 'c. AD 60–62',
  'Jesus the Son of Man — Saviour of all humanity',
  'The most comprehensive Gospel, written by a physician with meticulous historical detail. Luke presents Jesus as the perfect Man who came to seek and save the lost. It uniquely emphasises prayer, the Holy Spirit, women, the poor, and God''s universal offer of salvation to Jew and Gentile alike.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'John', 'New Testament', 'Gospels', 21, 43,
  'Κατὰ Ἰωάννην', 'According to John (God is Gracious)',
  'John the Apostle', 'c. AD 85–90',
  'Jesus the Son of God — believe and have life',
  'The most theological of the Gospels, John presents Jesus as the eternal Word made flesh. Structured around seven miraculous signs and seven ''I AM'' declarations, the Gospel was written so that readers might believe Jesus is the Christ, the Son of God, and have life through His name (20:31).'
) ON CONFLICT (name) DO NOTHING;

-- ═══════════════ HISTORICAL ═══════════════

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Acts', 'New Testament', 'Historical', 28, 44,
  'Πράξεις Ἀποστόλων', 'Acts of the Apostles',
  'Luke the physician', 'c. AD 62–64',
  'The spread of the Gospel through the Holy Spirit',
  'The sequel to Luke''s Gospel, Acts records the birth and explosive growth of the early church from Jerusalem to Rome. It traces the ministry of Peter (ch. 1–12) and Paul (ch. 13–28), demonstrating how the Holy Spirit empowered ordinary believers to turn the world upside down (17:6).'
) ON CONFLICT (name) DO NOTHING;

-- ═══════════════ PAULINE EPISTLES ═══════════════

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Romans', 'New Testament', 'Pauline Epistles', 16, 45,
  'Πρὸς Ῥωμαίους', 'To the Romans',
  'Paul the Apostle', 'c. AD 57',
  'The righteousness of God revealed through faith',
  'Paul''s magnum opus and the most systematic theological treatise in the New Testament. Romans explains humanity''s universal sinfulness, justification by faith alone, sanctification through the Spirit, God''s sovereign plan for Israel, and the practical outworking of the Gospel in daily life.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '1 Corinthians', 'New Testament', 'Pauline Epistles', 16, 46,
  'Πρὸς Κορινθίους Αʹ', 'First to the Corinthians',
  'Paul the Apostle', 'c. AD 55',
  'Order, holiness, and unity in the church',
  'Written to a gifted but deeply divided church in a morally corrupt city, Paul addresses factions, sexual immorality, lawsuits, marriage, idol meat, spiritual gifts, and the resurrection. The letter''s heart is chapter 13 — the supremacy of love — and chapter 15 — the certainty of resurrection.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '2 Corinthians', 'New Testament', 'Pauline Epistles', 13, 47,
  'Πρὸς Κορινθίους Βʹ', 'Second to the Corinthians',
  'Paul the Apostle', 'c. AD 55–56',
  'Strength in weakness — the ministry of reconciliation',
  'Paul''s most personal and emotionally intense letter. He defends his apostolic authority against false teachers, reveals his sufferings and weaknesses, explains the ministry of the new covenant, and urges generous giving. The paradox of divine power perfected in human weakness (12:9) runs throughout.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Galatians', 'New Testament', 'Pauline Epistles', 6, 48,
  'Πρὸς Γαλάτας', 'To the Galatians',
  'Paul the Apostle', 'c. AD 49–55',
  'Justification by faith alone — freedom from the Law',
  'Paul''s urgent defence of the Gospel against Judaizers who demanded Gentile circumcision. Galatians powerfully argues that salvation comes through faith in Christ alone, not through works of the Law. It is the Magna Carta of Christian liberty and a foundational text of the Reformation.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Ephesians', 'New Testament', 'Pauline Epistles', 6, 49,
  'Πρὸς Ἐφεσίους', 'To the Ephesians',
  'Paul the Apostle', 'c. AD 60–62',
  'The church as the body of Christ — seated in the heavenlies',
  'Written from prison, Ephesians is Paul''s grand vision of God''s eternal purpose in Christ: to unite all things under one Head. The first three chapters unfold the believer''s wealth in Christ (chosen, redeemed, sealed, raised, seated); the last three describe the believer''s walk (in unity, purity, wisdom, and spiritual warfare).'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Philippians', 'New Testament', 'Pauline Epistles', 4, 50,
  'Πρὸς Φιλιππησίους', 'To the Philippians',
  'Paul the Apostle', 'c. AD 61–62',
  'Joy and contentment in Christ regardless of circumstances',
  'Paul''s warmest letter, written from prison to his most supportive church. Despite chains and uncertainty, ''joy'' and ''rejoice'' appear 16 times. The Christ-hymn (2:5-11) is one of the highest Christological passages in Scripture. Paul models contentment through Christ''s all-sufficient strength (4:13).'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Colossians', 'New Testament', 'Pauline Epistles', 4, 51,
  'Πρὸς Κολοσσαεῖς', 'To the Colossians',
  'Paul the Apostle', 'c. AD 60–62',
  'The supremacy and all-sufficiency of Christ',
  'Written to combat a syncretistic heresy mixing Jewish legalism, Greek philosophy, and mystical practices, Colossians declares Christ''s absolute supremacy over all creation and all powers. In Him dwells all the fulness of the Godhead bodily (2:9), making all other spiritual systems unnecessary.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '1 Thessalonians', 'New Testament', 'Pauline Epistles', 5, 52,
  'Πρὸς Θεσσαλονικεῖς Αʹ', 'First to the Thessalonians',
  'Paul the Apostle', 'c. AD 51',
  'The second coming of Christ and holy living',
  'Likely Paul''s earliest surviving letter, written to encourage a young church facing persecution. Every chapter ends with a reference to Christ''s return. Paul commends their faith, defends his ministry, urges sexual purity, and provides the classic NT passage on the rapture and resurrection of believers (4:13-18).'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '2 Thessalonians', 'New Testament', 'Pauline Epistles', 3, 53,
  'Πρὸς Θεσσαλονικεῖς Βʹ', 'Second to the Thessalonians',
  'Paul the Apostle', 'c. AD 51–52',
  'Correction on the Day of the Lord and the man of sin',
  'Written shortly after 1 Thessalonians to correct a misunderstanding that the Day of the Lord had already come. Paul teaches that the apostasy and the man of sin must come first (2:3), encourages perseverance under persecution, and commands diligent work while waiting for Christ''s return.'
) ON CONFLICT (name) DO NOTHING;

-- ═══════════════ PASTORAL EPISTLES ═══════════════

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '1 Timothy', 'New Testament', 'Pastoral Epistles', 6, 54,
  'Πρὸς Τιμόθεον Αʹ', 'First to Timothy (Honouring God)',
  'Paul the Apostle', 'c. AD 62–64',
  'Sound doctrine and church order',
  'Paul instructs his young protégé Timothy on how to lead the church at Ephesus. The letter addresses false teachers, qualifications for elders and deacons, conduct in worship, care for widows, and the charge to guard the deposit of faith. It is a manual for church governance and pastoral faithfulness.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '2 Timothy', 'New Testament', 'Pastoral Epistles', 4, 55,
  'Πρὸς Τιμόθεον Βʹ', 'Second to Timothy (Honouring God)',
  'Paul the Apostle', 'c. AD 66–67',
  'Perseverance in the faith — Paul''s final charge',
  'Paul''s last letter, written from a Roman dungeon before his execution. It is his farewell testimony and urgent charge to Timothy to endure hardship, preach the word in season and out, and guard the Gospel. Contains the classic declaration of Scripture''s divine inspiration (3:16-17).'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Titus', 'New Testament', 'Pastoral Epistles', 3, 56,
  'Πρὸς Τίτον', 'To Titus (Pleasing)',
  'Paul the Apostle', 'c. AD 63–65',
  'Sound doctrine producing godly living',
  'Paul writes to Titus, whom he left on the island of Crete to organise the churches. The letter outlines elder qualifications, addresses cultural challenges, and emphasises that the grace of God that brings salvation also teaches believers to live soberly, righteously, and godly in this present age (2:11-12).'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Philemon', 'New Testament', 'Pastoral Epistles', 1, 57,
  'Πρὸς Φιλήμονα', 'To Philemon (Loving/Affectionate)',
  'Paul the Apostle', 'c. AD 60–62',
  'Forgiveness and reconciliation in Christ',
  'Paul''s shortest and most personal letter, an appeal to the wealthy believer Philemon to receive back his runaway slave Onesimus — now a fellow Christian — no longer as a slave but as a beloved brother. It is a powerful illustration of the Gospel: imputation, substitution, reconciliation, and the transformation of social relationships by grace.'
) ON CONFLICT (name) DO NOTHING;

-- ═══════════════ GENERAL EPISTLES ═══════════════

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Hebrews', 'New Testament', 'General Epistles', 13, 58,
  'Πρὸς Ἑβραίους', 'To the Hebrews',
  'Unknown (traditionally Paul; possibly Apollos, Barnabas, or Luke)', 'c. AD 64–68',
  'The superiority of Christ and the New Covenant',
  'A masterful theological argument demonstrating that Christ is superior to angels, Moses, Joshua, Aaron, and the entire Levitical system. The New Covenant in His blood supersedes the Old. Interwoven with five solemn warnings against apostasy, the letter culminates in the great ''faith hall of fame'' (chapter 11) and the call to endurance.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'James', 'New Testament', 'General Epistles', 5, 59,
  'Ἰακώβου', 'Of James (Supplanter)',
  'James, the brother of Jesus', 'c. AD 45–49',
  'Faith demonstrated by works — practical Christian wisdom',
  'Possibly the earliest NT letter, James writes to scattered Jewish believers with intensely practical instruction. True faith produces visible fruit: endurance in trials, impartial love, controlled speech, humble submission, and fervent prayer. Faith without works is dead (2:26) — not contradicting Paul but complementing him.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '1 Peter', 'New Testament', 'General Epistles', 5, 60,
  'Πέτρου Αʹ', 'First of Peter (Rock)',
  'Peter the Apostle', 'c. AD 64–67',
  'Hope and holiness through suffering',
  'Written to persecuted believers scattered across Asia Minor, Peter encourages them with the living hope of their inheritance in Christ. Suffering is temporary and purposeful — it refines faith like fire purifies gold (1:7). Believers are a chosen generation, a royal priesthood, called to submit and do good even when unjustly treated.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '2 Peter', 'New Testament', 'General Epistles', 3, 61,
  'Πέτρου Βʹ', 'Second of Peter (Rock)',
  'Peter the Apostle', 'c. AD 65–68',
  'Growth in grace and warning against false teachers',
  'Peter''s farewell letter, written shortly before his martyrdom. He urges believers to grow in the knowledge of Christ through diligent spiritual development (1:5-7), warns against destructive false teachers (chapter 2), and affirms the certainty of Christ''s return despite scoffers, declaring that God is not slack but longsuffering (3:9).'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '1 John', 'New Testament', 'General Epistles', 5, 62,
  'Ἰωάννου Αʹ', 'First of John (God is Gracious)',
  'John the Apostle', 'c. AD 85–95',
  'Fellowship with God and assurance of salvation',
  'Written to combat early Gnostic heresy, John provides three tests of genuine faith: doctrinal (believing Jesus came in the flesh), moral (obedience to God''s commands), and relational (love for the brethren). The letter assures true believers of eternal life and invites them into joyful fellowship with the Father and His Son (1:3-4).'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '2 John', 'New Testament', 'General Epistles', 1, 63,
  'Ἰωάννου Βʹ', 'Second of John (God is Gracious)',
  'John the Apostle', 'c. AD 85–95',
  'Walking in truth and guarding against deceivers',
  'The shortest book in the Bible by word count, 2 John is a personal letter to ''the elect lady'' (either a woman or a personified church). John urges continued walking in truth and love, and warns against receiving false teachers who deny Christ''s incarnation — to welcome them is to share in their evil deeds.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  '3 John', 'New Testament', 'General Epistles', 1, 64,
  'Ἰωάννου Γʹ', 'Third of John (God is Gracious)',
  'John the Apostle', 'c. AD 85–95',
  'Hospitality, truth, and faithful leadership',
  'A personal letter to Gaius commending his hospitality toward travelling missionaries. John contrasts three men: Gaius (faithful and generous), Diotrephes (proud and controlling), and Demetrius (well-reported). The letter reveals the importance of supporting gospel workers and the danger of selfish ambition in church leadership.'
) ON CONFLICT (name) DO NOTHING;

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Jude', 'New Testament', 'General Epistles', 1, 65,
  'Ἰούδα', 'Of Judas/Jude (Praise)',
  'Jude, brother of James and Jesus', 'c. AD 65–80',
  'Contending earnestly for the faith against apostasy',
  'Jude originally intended to write about salvation but was compelled to warn against false teachers who had crept into the church unnoticed. Using vivid OT illustrations (Cain, Balaam, Korah) and even quoting 1 Enoch, Jude urges believers to contend for the faith once delivered to the saints and ends with one of Scripture''s most magnificent doxologies (vv.24-25).'
) ON CONFLICT (name) DO NOTHING;

-- ═══════════════ PROPHECY ═══════════════

INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Revelation', 'New Testament', 'Prophecy', 22, 66,
  'Ἀποκάλυψις Ἰωάννου', 'The Revelation/Unveiling of John',
  'John the Apostle', 'c. AD 90–96',
  'The revelation of Jesus Christ and the consummation of all things',
  'The Bible''s climactic book, Revelation unveils the glorified Christ, His messages to seven churches, and the unfolding of God''s final purposes for history. Through vivid apocalyptic imagery — seals, trumpets, bowls, beasts, and Babylon — it reveals the ultimate triumph of the Lamb, the defeat of evil, and the new heaven and new earth where God dwells with His people forever.'
) ON CONFLICT (name) DO NOTHING;

-- ═══════════════════════════════════════════════════
-- ✅ All 27 New Testament books inserted
-- Run chapter seed files AFTER this script
-- ═══════════════════════════════════════════════════