-- Bible Book Timeline: all 66 books with dates, authors, genres, descriptions, and key verses
-- Run this in Supabase SQL Editor

CREATE TABLE IF NOT EXISTS bible_book_timeline (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  book_name TEXT NOT NULL UNIQUE,
  testament TEXT NOT NULL CHECK (testament IN ('OT', 'NT')),
  genre TEXT NOT NULL,
  year_from INTEGER NOT NULL,
  year_to INTEGER NOT NULL,
  year_display TEXT NOT NULL,
  author TEXT NOT NULL,
  description TEXT NOT NULL,
  key_verse TEXT,
  key_verse_ref TEXT,
  color TEXT NOT NULL,
  sort_order INTEGER NOT NULL,
  fun_fact TEXT
);

-- Enable Row Level Security
ALTER TABLE bible_book_timeline ENABLE ROW LEVEL SECURITY;

-- Public read access
DROP POLICY IF EXISTS "Public read access" ON bible_book_timeline;
CREATE POLICY "Public read access" ON bible_book_timeline
  FOR SELECT USING (true);

-- Add fun_fact column if it doesn't exist
DO $$ BEGIN
  ALTER TABLE bible_book_timeline ADD COLUMN fun_fact TEXT;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- Clear existing data
TRUNCATE bible_book_timeline;

-- Insert all 66 books
INSERT INTO bible_book_timeline (book_name, testament, genre, year_from, year_to, year_display, author, description, key_verse, key_verse_ref, color, sort_order, fun_fact) VALUES

-- === OLD TESTAMENT ===

-- Law (Pentateuch)
('Genesis', 'OT', 'Law', -1446, -1406, 'c. 1446–1406 BC', 'Moses',
 'The book of beginnings records God''s creation of the world, the fall of man, and His covenant with Abraham to bless all nations through his seed.',
 'In the beginning God created the heaven and the earth.', 'Genesis 1:1',
 '#C06C3E', 1, 'Contains the first prophecy of Christ (Genesis 3:15), called the Protoevangelium.'),

('Exodus', 'OT', 'Law', -1446, -1406, 'c. 1446–1406 BC', 'Moses',
 'God delivers Israel from Egyptian bondage through mighty signs and wonders, establishes His covenant at Sinai, and gives the law and tabernacle instructions.',
 'And God said unto Moses, I AM THAT I AM.', 'Exodus 3:14',
 '#C06C3E', 2, 'The word ''exodus'' means ''departure'' — Israel left Egypt with an estimated 2 million people.'),

('Leviticus', 'OT', 'Law', -1446, -1406, 'c. 1446–1406 BC', 'Moses',
 'God gives Israel the sacrificial system and holiness code, teaching that sinful man can only approach a holy God through blood atonement.',
 'For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls.', 'Leviticus 17:11',
 '#C06C3E', 3, 'The word ''holy'' appears more times in Leviticus than in any other book of the Bible.'),

('Numbers', 'OT', 'Law', -1446, -1406, 'c. 1446–1406 BC', 'Moses',
 'Israel''s wilderness wanderings reveal the consequences of unbelief and God''s faithful provision, as an entire generation fails to enter the Promised Land.',
 'The LORD bless thee, and keep thee: The LORD make his face shine upon thee, and be gracious unto thee.', 'Numbers 6:24-25',
 '#C06C3E', 4, 'Two separate censuses are taken 38 years apart — hence the name ''Numbers.'''),

('Deuteronomy', 'OT', 'Law', -1406, -1406, 'c. 1406 BC', 'Moses',
 'Moses'' farewell addresses remind the new generation of God''s law and covenant faithfulness, urging wholehearted obedience before entering Canaan.',
 'Hear, O Israel: The LORD our God is one LORD: And thou shalt love the LORD thy God with all thine heart, and with all thy soul, and with all thy might.', 'Deuteronomy 6:4-5',
 '#C06C3E', 5, 'Jesus quoted Deuteronomy more than any other OT book when resisting Satan''s temptations.'),

-- History (OT)
('Joshua', 'OT', 'History', -1400, -1370, 'c. 1400–1370 BC', 'Joshua',
 'Under Joshua''s leadership, Israel conquers and divides the Promised Land, demonstrating that God is faithful to fulfil every promise He has made.',
 'Be strong and of a good courage; be not afraid, neither be thou dismayed: for the LORD thy God is with thee whithersoever thou goest.', 'Joshua 1:9',
 '#2E7D32', 6, 'Rahab the harlot, saved by faith, became an ancestor of Jesus Christ (Matthew 1:5).'),

('Judges', 'OT', 'History', -1045, -1000, 'c. 1045–1000 BC', 'Samuel (traditionally)',
 'A dark cycle of sin, oppression, repentance, and deliverance repeats as Israel forsakes God and He raises up judges to rescue them.',
 'In those days there was no king in Israel: every man did that which was right in his own eyes.', 'Judges 21:25',
 '#2E7D32', 7, 'The left-handed judge Ehud is the Bible''s first recorded assassin (Judges 3:21).'),

('Ruth', 'OT', 'History', -1030, -1010, 'c. 1030–1010 BC', 'Samuel (traditionally)',
 'A Moabite widow''s loyalty to her mother-in-law and faith in Israel''s God leads to her redemption by Boaz, placing her in the lineage of King David and Christ.',
 'Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge.', 'Ruth 1:16',
 '#2E7D32', 8, 'Ruth is one of only two Bible books named after a woman (the other is Esther).'),

('1 Samuel', 'OT', 'History', -1050, -930, 'c. 1050–930 BC', 'Samuel, Nathan, Gad',
 'Israel transitions from the judges to the monarchy as Samuel anoints Saul, then David, revealing that God looks upon the heart rather than outward appearance.',
 'For the LORD seeth not as man seeth; for man looketh on the outward appearance, but the LORD looketh on the heart.', '1 Samuel 16:7',
 '#2E7D32', 9, 'The word ''Ichabod'' (''the glory has departed'') originates here (1 Samuel 4:21).'),

('2 Samuel', 'OT', 'History', -930, -900, 'c. 930–900 BC', 'Nathan, Gad',
 'David''s reign over united Israel reaches glorious heights and devastating lows, yet God establishes an everlasting covenant with David''s throne.',
 'And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever.', '2 Samuel 7:16',
 '#2E7D32', 10, 'David''s mighty men included Benaiah, who killed a lion in a pit on a snowy day (2 Sam 23:20).'),

('1 Kings', 'OT', 'History', -560, -540, 'c. 560–540 BC', 'Jeremiah (traditionally)',
 'Solomon''s glorious reign gives way to the divided kingdom as idolatry tears Israel apart, with Elijah standing as God''s prophet against apostasy.',
 'And if it seem evil unto you to serve the LORD, choose you this day whom ye will serve.', '1 Kings 18:21',
 '#2E7D32', 11, 'Solomon''s temple took 7 years to build, but his own palace took 13 years (1 Kings 6–7).'),

('2 Kings', 'OT', 'History', -560, -540, 'c. 560–540 BC', 'Jeremiah (traditionally)',
 'Both kingdoms fall into exile as a consequence of persistent idolatry, yet God preserves a remnant and keeps His covenant promises through faithful kings and prophets.',
 'And he did that which was evil in the sight of the LORD.', '2 Kings 17:2',
 '#2E7D32', 12, 'Elijah never died — he was taken to heaven in a whirlwind by a chariot of fire (2 Kings 2:11).'),

('1 Chronicles', 'OT', 'History', -450, -425, 'c. 450–425 BC', 'Ezra (traditionally)',
 'A priestly retelling of Israel''s history from Adam to David emphasises temple worship and God''s sovereign plan through David''s royal line.',
 'Thine, O LORD, is the greatness, and the power, and the glory, and the victory, and the majesty.', '1 Chronicles 29:11',
 '#2E7D32', 13, 'The first nine chapters are almost entirely genealogies — the longest in Scripture.'),

('2 Chronicles', 'OT', 'History', -450, -425, 'c. 450–425 BC', 'Ezra (traditionally)',
 'The history of Judah''s kings from Solomon to the exile centres on temple faithfulness, showing that national blessing follows obedience and judgement follows apostasy.',
 'If my people, which are called by my name, shall humble themselves, and pray, and seek my face, and turn from their wicked ways; then will I hear from heaven, and will forgive their sin, and will heal their land.', '2 Chronicles 7:14',
 '#2E7D32', 14, '2 Chronicles 7:14 is the most quoted verse in presidential inaugural prayers in US history.'),

('Ezra', 'OT', 'History', -440, -430, 'c. 440–430 BC', 'Ezra',
 'The Jewish remnant returns from Babylonian exile to rebuild the temple and restore worship, led by Zerubbabel and Ezra under God''s providential hand.',
 'For Ezra had prepared his heart to seek the law of the LORD, and to do it, and to teach in Israel statutes and judgments.', 'Ezra 7:10',
 '#2E7D32', 15, 'Ezra never once uses the word ''faith,'' yet the entire book is a story of faith in action.'),

('Nehemiah', 'OT', 'History', -430, -420, 'c. 430–420 BC', 'Nehemiah',
 'Nehemiah leads the rebuilding of Jerusalem''s walls despite fierce opposition, demonstrating courageous faith, prayerful leadership, and covenant renewal.',
 'So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work.', 'Nehemiah 4:6',
 '#2E7D32', 16, 'Jerusalem''s walls were rebuilt in just 52 days despite armed opposition (Nehemiah 6:15).'),

('Esther', 'OT', 'History', -470, -460, 'c. 470–460 BC', 'Unknown (possibly Mordecai)',
 'God''s hidden providence preserves the Jewish people from annihilation in Persia through Queen Esther''s courage, revealing that He orchestrates all things for His people''s deliverance.',
 'And who knoweth whether thou art come to the kingdom for such a time as this?', 'Esther 4:14',
 '#2E7D32', 17, 'God''s name is never mentioned once in the entire book — the only Bible book with this trait.'),

-- Wisdom
('Job', 'OT', 'Wisdom', -2000, -1800, 'c. 2000–1800 BC', 'Unknown (ancient)',
 'A righteous man''s suffering and God''s majestic response reveal that divine wisdom transcends human understanding, and faith must rest in God''s character rather than circumstances.',
 'For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth.', 'Job 19:25',
 '#D4A853', 18, 'Likely the oldest book in the Bible — written before Moses penned Genesis.'),

('Psalms', 'OT', 'Wisdom', -1410, -450, 'c. 1410–450 BC', 'David, Asaph, Sons of Korah, others',
 'Israel''s inspired hymnal spans the full range of human emotion in worship, from deepest lament to highest praise, pointing to the Messiah throughout.',
 'The LORD is my shepherd; I shall not want.', 'Psalm 23:1',
 '#D4A853', 19, 'The longest chapter in the Bible (Psalm 119) and the shortest (Psalm 117) are both here.'),

('Proverbs', 'OT', 'Wisdom', -970, -700, 'c. 970–700 BC', 'Solomon, Agur, Lemuel',
 'Practical wisdom for daily living teaches that the fear of the Lord is the foundation of all true knowledge and righteous conduct.',
 'The fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.', 'Proverbs 1:7',
 '#D4A853', 20, 'Solomon is credited with 3,000 proverbs (1 Kings 4:32), but only about 800 made it into this book.'),

('Ecclesiastes', 'OT', 'Wisdom', -940, -930, 'c. 940–930 BC', 'Solomon',
 'The Preacher''s search for meaning apart from God proves that all earthly pursuits are vanity, and man''s chief end is to fear God and keep His commandments.',
 'Let us hear the conclusion of the whole matter: Fear God, and keep his commandments: for this is the whole duty of man.', 'Ecclesiastes 12:13',
 '#D4A853', 21, 'The word ''vanity'' (hebel) appears 38 times — more than in the rest of the Bible combined.'),

('Song of Solomon', 'OT', 'Wisdom', -965, -960, 'c. 965–960 BC', 'Solomon',
 'A beautiful love poem celebrating the purity and joy of marital love, understood also as a picture of Christ''s love for His church.',
 'I am my beloved''s, and my beloved is mine.', 'Song of Solomon 6:3',
 '#D4A853', 22, 'Jewish tradition forbade reading it until age 30 due to its intimate romantic imagery.'),

-- Prophecy (Major Prophets)
('Isaiah', 'OT', 'Prophecy', -740, -680, 'c. 740–680 BC', 'Isaiah',
 'The prince of prophets proclaims judgement upon sin and glorious hope of the coming Messiah, the Suffering Servant who will bear the sins of many.',
 'But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.', 'Isaiah 53:5',
 '#8B5CF6', 23, 'Often called the ''fifth Gospel'' — Isaiah 53 describes Christ''s crucifixion 700 years in advance.'),

('Jeremiah', 'OT', 'Prophecy', -626, -586, 'c. 626–586 BC', 'Jeremiah',
 'The weeping prophet faithfully warns Judah of coming judgement while promising a new covenant in which God will write His law upon their hearts.',
 'For I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end.', 'Jeremiah 29:11',
 '#8B5CF6', 24, 'At 33,002 words, Jeremiah is the longest book in the Bible by word count — not Psalms.'),

('Lamentations', 'OT', 'Prophecy', -586, -585, 'c. 586–585 BC', 'Jeremiah',
 'Jeremiah mourns the destruction of Jerusalem in poetic elegies, yet finds hope in God''s unfailing mercies that are new every morning.',
 'It is of the LORD''s mercies that we are not consumed, because his compassions fail not. They are new every morning: great is thy faithfulness.', 'Lamentations 3:22-23',
 '#8B5CF6', 25, 'Written as five acrostic poems — each verse starts with a successive Hebrew letter.'),

('Ezekiel', 'OT', 'Prophecy', -593, -571, 'c. 593–571 BC', 'Ezekiel',
 'From Babylonian exile, Ezekiel proclaims God''s judgement, the departure and return of His glory, and the future restoration of Israel with a new temple.',
 'A new heart also will I give you, and a new spirit will I put within you.', 'Ezekiel 36:26',
 '#8B5CF6', 26, 'Ezekiel''s vision of the ''wheel within a wheel'' has inspired art and music for millennia.'),

('Daniel', 'OT', 'Prophecy', -605, -535, 'c. 605–535 BC', 'Daniel',
 'A faithful exile in Babylon receives apocalyptic visions of world empires and the coming eternal kingdom of God, while demonstrating unwavering trust under persecution.',
 'And in the days of these kings shall the God of heaven set up a kingdom, which shall never be destroyed.', 'Daniel 2:44',
 '#8B5CF6', 27, 'Daniel predicted the exact year of Christ''s public ministry in his ''70 weeks'' prophecy (Dan 9:25).'),

-- Prophecy (Minor Prophets)
('Hosea', 'OT', 'Prophecy', -755, -710, 'c. 755–710 BC', 'Hosea',
 'God commands Hosea to marry an unfaithful wife as a living parable of His relentless, redeeming love for spiritually adulterous Israel.',
 'Come, and let us return unto the LORD: for he hath torn, and he will heal us; he hath smitten, and he will bind us up.', 'Hosea 6:1',
 '#8B5CF6', 28, 'God told Hosea to name his children ''Not My People'' and ''No Mercy'' as prophetic signs.'),

('Joel', 'OT', 'Prophecy', -835, -800, 'c. 835–800 BC', 'Joel',
 'A devastating locust plague becomes a warning of the coming Day of the Lord, with a promise of spiritual restoration and the outpouring of God''s Spirit on all flesh.',
 'And it shall come to pass afterward, that I will pour out my spirit upon all flesh.', 'Joel 2:28',
 '#8B5CF6', 29, 'Peter quoted Joel 2:28 at Pentecost — the first sermon of the church age (Acts 2:16-21).'),

('Amos', 'OT', 'Prophecy', -760, -750, 'c. 760–750 BC', 'Amos',
 'A shepherd turned prophet thunders against social injustice and religious hypocrisy in prosperous Israel, calling for true righteousness to roll down like waters.',
 'But let judgment run down as waters, and righteousness as a mighty stream.', 'Amos 5:24',
 '#8B5CF6', 30, 'Amos was not a trained prophet — he was a shepherd and sycamore fig farmer (Amos 7:14).'),

('Obadiah', 'OT', 'Prophecy', -586, -583, 'c. 586–583 BC', 'Obadiah',
 'The shortest Old Testament book pronounces God''s judgement upon Edom for its pride and cruelty toward Israel, declaring that the kingdom shall be the Lord''s.',
 'For the day of the LORD is near upon all the heathen: as thou hast done, it shall be done unto thee.', 'Obadiah 1:15',
 '#8B5CF6', 31, 'The shortest book in the Old Testament — just 21 verses on a single scroll.'),

('Jonah', 'OT', 'Prophecy', -785, -760, 'c. 785–760 BC', 'Jonah',
 'A reluctant prophet''s flight from God and miraculous deliverance reveals that God''s compassion extends to all nations, even Israel''s enemies.',
 'Salvation is of the LORD.', 'Jonah 2:9',
 '#8B5CF6', 32, 'The only OT prophet sent to preach to a Gentile nation — and they actually repented.'),

('Micah', 'OT', 'Prophecy', -735, -700, 'c. 735–700 BC', 'Micah',
 'Micah warns of judgement for injustice while prophesying the Messiah''s birth in Bethlehem and declaring what the Lord truly requires of His people.',
 'He hath shewed thee, O man, what is good; and what doth the LORD require of thee, but to do justly, and to love mercy, and to walk humbly with thy God?', 'Micah 6:8',
 '#8B5CF6', 33, 'Micah 5:2 pinpoints Bethlehem as the Messiah''s birthplace 700 years before Jesus was born.'),

('Nahum', 'OT', 'Prophecy', -663, -612, 'c. 663–612 BC', 'Nahum',
 'God''s certain judgement falls upon Nineveh and the Assyrian empire, demonstrating that He is slow to anger but will by no means clear the guilty.',
 'The LORD is good, a strong hold in the day of trouble; and he knoweth them that trust in him.', 'Nahum 1:7',
 '#8B5CF6', 34, 'Nahum prophesied Nineveh''s fall — it was destroyed in 612 BC exactly as described.'),

('Habakkuk', 'OT', 'Prophecy', -610, -605, 'c. 610–605 BC', 'Habakkuk',
 'A prophet wrestles honestly with God over the problem of evil and receives the timeless answer that the just shall live by faith.',
 'But the LORD is in his holy temple: let all the earth keep silence before him.', 'Habakkuk 2:20',
 '#8B5CF6', 35, '''The just shall live by faith'' (2:4) is quoted three times in the New Testament.'),

('Zephaniah', 'OT', 'Prophecy', -640, -625, 'c. 640–625 BC', 'Zephaniah',
 'Zephaniah warns of the coming Day of the Lord''s universal judgement while promising that God will rejoice over a purified remnant with singing.',
 'The LORD thy God in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing.', 'Zephaniah 3:17',
 '#8B5CF6', 36, 'Zephaniah was a royal prophet — a great-great-grandson of King Hezekiah (Zeph 1:1).'),

('Haggai', 'OT', 'Prophecy', -520, -520, 'c. 520 BC', 'Haggai',
 'Haggai challenges the returned exiles to stop neglecting God''s house and rebuild the temple, promising that the glory of the latter house will exceed the former.',
 'The glory of this latter house shall be greater than of the former, saith the LORD of hosts.', 'Haggai 2:9',
 '#8B5CF6', 37, 'The shortest book by writing period — Haggai''s entire ministry lasted only 4 months.'),

('Zechariah', 'OT', 'Prophecy', -520, -480, 'c. 520–480 BC', 'Zechariah',
 'Rich messianic visions encourage the temple rebuilders and foretell Christ''s entry into Jerusalem, His betrayal for thirty pieces of silver, and His return in glory.',
 'Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass.', 'Zechariah 9:9',
 '#8B5CF6', 38, 'Contains more messianic prophecies than any other OT book except Isaiah.'),

('Malachi', 'OT', 'Prophecy', -440, -430, 'c. 440–430 BC', 'Malachi',
 'The final Old Testament prophet rebukes Israel''s spiritual apathy and corrupt worship, promising the coming messenger who will prepare the way of the Lord.',
 'But unto you that fear my name shall the Sun of righteousness arise with healing in his wings.', 'Malachi 4:2',
 '#8B5CF6', 39, 'The last OT book — after Malachi, God was silent for 400 years until John the Baptist.'),

-- === NEW TESTAMENT ===

-- Gospel
('Matthew', 'NT', 'Gospel', 55, 65, 'c. AD 55–65', 'Matthew (Levi)',
 'Written primarily for a Jewish audience, Matthew presents Jesus as the promised Messiah and King of Israel, fulfilling Old Testament prophecy at every turn.',
 'And she shall bring forth a son, and thou shalt call his name JESUS: for he shall save his people from their sins.', 'Matthew 1:21',
 '#1B7A6E', 40, 'Matthew quotes the Old Testament over 60 times — more than any other Gospel writer.'),

('Mark', 'NT', 'Gospel', 55, 59, 'c. AD 55–59', 'John Mark',
 'The fastest-paced Gospel portrays Jesus as the suffering Servant of God, emphasising His mighty works and sacrificial mission to give His life as a ransom for many.',
 'For even the Son of man came not to be ministered unto, but to minister, and to give his life a ransom for many.', 'Mark 10:45',
 '#1B7A6E', 41, 'Mark uses the word ''immediately'' (euthys) over 40 times, giving it a breathless pace.'),

('Luke', 'NT', 'Gospel', 59, 63, 'c. AD 59–63', 'Luke',
 'A physician''s careful historical account presents Jesus as the perfect Son of Man who came to seek and save the lost, with special attention to the outcast and downtrodden.',
 'For the Son of man is come to seek and to save that which was lost.', 'Luke 19:10',
 '#1B7A6E', 42, 'Luke is the only Gentile author in the Bible — a Greek physician writing to Theophilus.'),

('John', 'NT', 'Gospel', 85, 90, 'c. AD 85–90', 'John the Apostle',
 'The beloved disciple presents Jesus as the eternal Word made flesh, the Son of God, recording seven signs and seven ''I AM'' declarations so that readers may believe and have life.',
 'For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.', 'John 3:16',
 '#1B7A6E', 43, 'John omits the nativity, parables, and exorcisms found in the other three Gospels.'),

-- History (NT)
('Acts', 'NT', 'History', 62, 64, 'c. AD 62–64', 'Luke',
 'The Holy Spirit empowers the apostles to spread the gospel from Jerusalem to Rome, as the church is born at Pentecost and grows despite fierce persecution.',
 'But ye shall receive power, after that the Holy Ghost is come upon you: and ye shall be witnesses unto me both in Jerusalem, and in all Judaea, and in Samaria, and unto the uttermost part of the earth.', 'Acts 1:8',
 '#2E7D32', 44, 'Acts records 3 shipwrecks, a snakebite, an earthquake jailbreak, and a boy falling from a window.'),

-- Epistle (Pauline)
('Romans', 'NT', 'Epistle', 57, 57, 'c. AD 57', 'Paul',
 'Paul''s theological masterpiece systematically presents the gospel of justification by faith alone, from universal condemnation to eternal glorification in Christ.',
 'For I am not ashamed of the gospel of Christ: for it is the power of God unto salvation to every one that believeth.', 'Romans 1:16',
 '#E8625C', 45, 'Martin Luther called Romans ''the chief part of the NT and the purest Gospel.'''),

('1 Corinthians', 'NT', 'Epistle', 55, 55, 'c. AD 55', 'Paul',
 'Paul addresses divisions, immorality, and doctrinal confusion in the Corinthian church, calling believers to unity, love, and the centrality of Christ''s resurrection.',
 'But now is Christ risen from the dead, and become the firstfruits of them that slept.', '1 Corinthians 15:20',
 '#E8625C', 46, 'Chapter 13 — the ''Love Chapter'' — is the most read passage at weddings worldwide.'),

('2 Corinthians', 'NT', 'Epistle', 56, 56, 'c. AD 56', 'Paul',
 'Paul''s most personal letter defends his apostolic ministry, teaches that God''s power is perfected in weakness, and calls the church to generous, cheerful giving.',
 'And he said unto me, My grace is sufficient for thee: for my strength is made perfect in weakness.', '2 Corinthians 12:9',
 '#E8625C', 47, 'Paul''s most autobiographical letter — he lists his sufferings in vivid detail (2 Cor 11:24-28).'),

('Galatians', 'NT', 'Epistle', 49, 49, 'c. AD 49', 'Paul',
 'Paul passionately defends justification by faith alone against legalism, declaring that believers are freed from the law''s curse to walk in the liberty of the Spirit.',
 'I am crucified with Christ: nevertheless I live; yet not I, but Christ liveth in me.', 'Galatians 2:20',
 '#E8625C', 48, 'Luther called Galatians his ''Katie von Bora'' — his bride — for its message of freedom.'),

('Ephesians', 'NT', 'Epistle', 60, 62, 'c. AD 60–62', 'Paul',
 'Paul unfolds God''s eternal purpose to unite all things in Christ, describing the church as His body and calling believers to walk worthy of their heavenly calling.',
 'For by grace are ye saved through faith; and that not of yourselves: it is the gift of God.', 'Ephesians 2:8',
 '#E8625C', 49, 'Ephesians 2:8-9 contains 40 Greek words — one unbroken sentence in the original text.'),

('Philippians', 'NT', 'Epistle', 61, 62, 'c. AD 61–62', 'Paul',
 'Written from prison, this letter overflows with joy as Paul encourages believers to rejoice in Christ, pursue humility after Christ''s example, and press toward the heavenly prize.',
 'I can do all things through Christ which strengtheneth me.', 'Philippians 4:13',
 '#E8625C', 50, 'The word ''joy'' or ''rejoice'' appears 16 times in just 4 chapters — written from a prison cell.'),

('Colossians', 'NT', 'Epistle', 60, 62, 'c. AD 60–62', 'Paul',
 'Paul exalts Christ as the image of the invisible God and head of the church, warning against false philosophy and calling believers to set their minds on things above.',
 'For in him dwelleth all the fulness of the Godhead bodily.', 'Colossians 2:9',
 '#E8625C', 51, 'Colossians 1:15-20 is believed to be an early Christian hymn quoted by Paul.'),

('1 Thessalonians', 'NT', 'Epistle', 51, 51, 'c. AD 51', 'Paul',
 'Paul commends the Thessalonians'' faith and encourages them with the blessed hope of Christ''s return, when the dead in Christ shall rise first.',
 'For the Lord himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of God: and the dead in Christ shall rise first.', '1 Thessalonians 4:16',
 '#E8625C', 52, 'Probably Paul''s earliest surviving letter — written just ~20 years after the resurrection.'),

('2 Thessalonians', 'NT', 'Epistle', 51, 52, 'c. AD 51–52', 'Paul',
 'Paul corrects misunderstandings about the Day of the Lord, teaching that the man of sin must first be revealed, and exhorts believers to stand firm and work diligently.',
 'Therefore, brethren, stand fast, and hold the traditions which ye have been taught, whether by word, or our epistle.', '2 Thessalonians 2:15',
 '#E8625C', 53, 'Contains the Bible''s most detailed description of the Antichrist (''man of sin,'' 2 Thess 2:3).'),

('1 Timothy', 'NT', 'Epistle', 63, 65, 'c. AD 63–65', 'Paul',
 'Paul instructs his young protege Timothy in sound doctrine, church order, and godly leadership, warning against false teachers and calling him to guard the faith.',
 'For there is one God, and one mediator between God and men, the man Christ Jesus.', '1 Timothy 2:5',
 '#E8625C', 54, '''Let no man despise thy youth'' — Timothy was likely in his mid-30s, young for a pastor.'),

('2 Timothy', 'NT', 'Epistle', 66, 67, 'c. AD 66–67', 'Paul',
 'Paul''s final letter from a Roman prison charges Timothy to endure hardship, preach the Word faithfully, and hold fast to Scripture which is given by inspiration of God.',
 'All scripture is given by inspiration of God, and is profitable for doctrine, for reproof, for correction, for instruction in righteousness.', '2 Timothy 3:16',
 '#E8625C', 55, 'Paul''s last known letter — he was executed shortly after writing it in a Roman dungeon.'),

('Titus', 'NT', 'Epistle', 63, 65, 'c. AD 63–65', 'Paul',
 'Paul instructs Titus to establish orderly churches in Crete with qualified elders, sound teaching, and lives that adorn the doctrine of God our Saviour.',
 'For the grace of God that bringeth salvation hath appeared to all men.', 'Titus 2:11',
 '#E8625C', 56, 'Crete''s reputation was so bad that ''to Cretanize'' meant ''to lie'' in ancient Greek.'),

('Philemon', 'NT', 'Epistle', 60, 62, 'c. AD 60–62', 'Paul',
 'Paul appeals to Philemon to receive back his runaway slave Onesimus as a beloved brother in Christ, beautifully illustrating forgiveness and reconciliation in the gospel.',
 'If thou count me therefore a partner, receive him as myself.', 'Philemon 1:17',
 '#E8625C', 57, 'Paul''s only surviving private letter — just 335 words in Greek.'),

('Hebrews', 'NT', 'Epistle', 64, 68, 'c. AD 64–68', 'Unknown (Paul, Apollos, or Barnabas)',
 'Christ is shown to be superior to angels, Moses, and the Levitical priesthood, as the mediator of a better covenant established upon better promises.',
 'Jesus Christ the same yesterday, and to day, and for ever.', 'Hebrews 13:8',
 '#E8625C', 58, 'The author is unknown — more theories exist for Hebrews'' authorship than any other NT book.'),

-- Epistle (General)
('James', 'NT', 'Epistle', 45, 49, 'c. AD 45–49', 'James (brother of Jesus)',
 'The first epistle written challenges believers to demonstrate genuine faith through righteous works, practical wisdom, and control of the tongue.',
 'But be ye doers of the word, and not hearers only, deceiving your own selves.', 'James 1:22',
 '#E8625C', 59, 'Likely the first NT book written — possibly before any of Paul''s letters.'),

('1 Peter', 'NT', 'Epistle', 64, 65, 'c. AD 64–65', 'Peter',
 'Peter encourages suffering believers scattered across Asia Minor to stand firm in the true grace of God, finding living hope through Christ''s resurrection.',
 'But the God of all grace, who hath called us unto his eternal glory by Christ Jesus, after that ye have suffered a while, make you perfect, stablish, strengthen, settle you.', '1 Peter 5:10',
 '#E8625C', 60, 'Peter wrote from ''Babylon'' (1 Pet 5:13) — likely a code name for Rome under persecution.'),

('2 Peter', 'NT', 'Epistle', 66, 68, 'c. AD 66–68', 'Peter',
 'Peter warns against false teachers and scoffers, affirming the certainty of Christ''s return and urging believers to grow in the grace and knowledge of the Lord.',
 'The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.', '2 Peter 3:9',
 '#E8625C', 61, 'Peter predicted scoffers would mock Christ''s return — in a letter written nearly 2,000 years ago.'),

('1 John', 'NT', 'Epistle', 85, 95, 'c. AD 85–95', 'John the Apostle',
 'John writes to assure believers of eternal life, teaching that genuine faith is evidenced by love for God and one another, and by walking in the light.',
 'If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.', '1 John 1:9',
 '#E8625C', 62, 'The word ''love'' appears 46 times in just 5 chapters — more per verse than any NT book.'),

('2 John', 'NT', 'Epistle', 85, 95, 'c. AD 85–95', 'John the Apostle',
 'John''s brief letter to the elect lady warns against showing hospitality to false teachers who deny Christ''s incarnation, urging believers to walk in truth and love.',
 'And this is love, that we walk after his commandments.', '2 John 1:6',
 '#E8625C', 63, 'At just 13 verses, 2 John is the shortest book in the Bible by verse count.'),

('3 John', 'NT', 'Epistle', 85, 95, 'c. AD 85–95', 'John the Apostle',
 'John commends Gaius for his faithful hospitality to travelling missionaries and rebukes Diotrephes'' self-serving pride, urging believers to imitate what is good.',
 'Beloved, follow not that which is evil, but that which is good. He that doeth good is of God.', '3 John 1:11',
 '#E8625C', 64, 'The only NT book that does not contain any direct teaching or doctrine — purely personal.'),

('Jude', 'NT', 'Epistle', 65, 80, 'c. AD 65–80', 'Jude (brother of Jesus)',
 'Jude urgently warns against ungodly false teachers who have crept into the church, exhorting believers to contend earnestly for the faith once delivered to the saints.',
 'Now unto him that is able to keep you from falling, and to present you faultless before the presence of his glory with exceeding joy.', 'Jude 1:24',
 '#E8625C', 65, 'Jude quotes the non-canonical Book of Enoch (v. 14-15) — the only NT book to do so.'),

-- Apocalyptic
('Revelation', 'NT', 'Apocalyptic', 94, 96, 'c. AD 94–96', 'John the Apostle',
 'The risen Christ reveals the consummation of God''s redemptive plan through apocalyptic visions of judgement, the defeat of Satan, and the glorious new heaven and new earth.',
 'And God shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.', 'Revelation 21:4',
 '#2A4A6B', 66, 'Contains more Old Testament allusions (over 500) than any other New Testament book.');
