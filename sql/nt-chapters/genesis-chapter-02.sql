-- ═══════════════════════════════════════════════════
-- GENESIS CHAPTER 2 — The Garden of Eden
-- 25 verses · Hebrew text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Genesis 2 provides a detailed account of Day 7 (God''s rest) and then zooms into Day 6 — the creation of man and woman. While Genesis 1 gives the panoramic view, Genesis 2 gives the intimate portrait. God forms Adam from dust, breathes life into him, plants the Garden of Eden, establishes the first commandment (the tree prohibition), and creates Eve from Adam''s side as his perfect complement. This chapter establishes marriage, work, and humanity''s relationship with God.',
  'Rest, Relationship & the Garden of God',
  'יָצַר (yatsar)',
  'To form, to fashion — like a potter shaping clay. Describes God''s intimate, hands-on creation of man.',
  '["Day 7 (vv.1-3): God rests — the Sabbath established","The Formation of Man (vv.4-7): Adam formed from dust, receives the breath of life","The Garden of Eden (vv.8-14): Paradise planted, the river and its branches","The First Commandment (vv.15-17): Tend the garden, do not eat of the tree","The Creation of Woman (vv.18-25): Not good to be alone — Eve from Adam''s side"]'
FROM books b WHERE b.name = 'Genesis';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Thus the heavens and the earth were finished, and all the host of them.',
   'וַיְכֻלּוּ הַשָּׁמַיִם וְהָאָרֶץ וְכָל־צְבָאָם׃',
   'Vayekhullu hashamayim veha''aretz vekhol-tzeva''am.',
   '''Finished'' (yekhullu) — creation is complete, lacking nothing. ''Host'' (tzeva''am) means the vast array — stars, angels, creatures, everything. God''s creative work was comprehensive and perfect.',
   NULL),
  (2,
   'And on the seventh day God ended his work which he had made; and he rested on the seventh day from all his work which he had made.',
   'וַיְכַל אֱלֹהִים בַּיּוֹם הַשְּׁבִיעִי מְלַאכְתּוֹ אֲשֶׁר עָשָׂה וַיִּשְׁבֹּת בַּיּוֹם הַשְּׁבִיעִי מִכָּל־מְלַאכְתּוֹ אֲשֶׁר עָשָׂה׃',
   'Vayekhal Elohim bayom hashevi''i melakhto asher asah vayishbot bayom hashevi''i mikol-melakhto asher asah.',
   '''Rested'' (shabbat) does not imply fatigue but cessation — God stopped because creation was complete, not because He was tired (Isaiah 40:28). The seventh day has no closing formula (''evening and morning'') — God''s rest is ongoing.',
   'The Sabbath principle: God built rhythms of work and rest into creation itself. The Sabbath points forward to our ultimate rest in Christ (Hebrews 4:9-10).'),
  (3,
   'And God blessed the seventh day, and sanctified it: because that in it he had rested from all his work which God created and made.',
   'וַיְבָרֶךְ אֱלֹהִים אֶת־יוֹם הַשְּׁבִיעִי וַיְקַדֵּשׁ אֹתוֹ כִּי בוֹ שָׁבַת מִכָּל־מְלַאכְתּוֹ אֲשֶׁר בָּרָא אֱלֹהִים לַעֲשׂוֹת׃',
   'Vayevarekh Elohim et-yom hashevi''i vayekaddesh oto ki vo shavat mikol-melakhto asher bara Elohim la''asot.',
   'God ''blessed'' and ''sanctified'' (set apart) the seventh day — the first thing declared holy in Scripture is not a place or person but a day. ''Created and made'' (bara...la''asot) combines both words for divine creation, summarizing the entire week.',
   'Sanctification means ''set apart for God.'' Before the Law, before Israel, God established the principle that time itself belongs to Him.'),
  (4,
   'These are the generations of the heavens and of the earth when they were created, in the day that the LORD God made the earth and the heavens,',
   'אֵלֶּה תוֹלְדוֹת הַשָּׁמַיִם וְהָאָרֶץ בְּהִבָּרְאָם בְּיוֹם עֲשׂוֹת יְהוָה אֱלֹהִים אֶרֶץ וְשָׁמָיִם׃',
   'Eleh toledot hashamayim veha''aretz behibbar''am beyom asot Yahweh Elohim eretz veshamayim.',
   '''Toledot'' (generations/account) — this heading appears 11 times in Genesis, structuring the entire book. Here we meet the full divine name ''Yahweh Elohim'' (LORD God) for the first time — the covenant-keeping Creator.',
   NULL),
  (5,
   'And every plant of the field before it was in the earth, and every herb of the field before it grew: for the LORD God had not caused it to rain upon the earth, and there was not a man to till the ground.',
   'וְכֹל שִׂיחַ הַשָּׂדֶה טֶרֶם יִהְיֶה בָאָרֶץ וְכָל־עֵשֶׂב הַשָּׂדֶה טֶרֶם יִצְמָח כִּי לֹא הִמְטִיר יְהוָה אֱלֹהִים עַל־הָאָרֶץ וְאָדָם אַיִן לַעֲבֹד אֶת־הָאֲדָמָה׃',
   'Vekhol siach hasadeh terem yihyeh va''aretz vekhol-esev hasadeh terem yitzmach ki lo himtir Yahweh Elohim al-ha''aretz ve''adam ayin la''avod et-ha''adamah.',
   'Two things were lacking: rain and a gardener. This sets the stage for God''s dual provision — water (v.6) and man (v.7). The wordplay between ''adam'' (man) and ''adamah'' (ground) is foundational.',
   NULL),
  (6,
   'But there went up a mist from the earth, and watered the whole face of the ground.',
   'וְאֵד יַעֲלֶה מִן־הָאָרֶץ וְהִשְׁקָה אֶת־כָּל־פְּנֵי הָאֲדָמָה׃',
   'Ve''ed ya''aleh min-ha''aretz vehishkah et-kol-penei ha''adamah.',
   '''Ed'' (mist/spring) — God provided water from below before rain came from above. The earth was irrigated by underground springs, suggesting a different pre-Flood ecology.',
   NULL),
  (7,
   'And the LORD God formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.',
   'וַיִּיצֶר יְהוָה אֱלֹהִים אֶת־הָאָדָם עָפָר מִן־הָאֲדָמָה וַיִּפַּח בְּאַפָּיו נִשְׁמַת חַיִּים וַיְהִי הָאָדָם לְנֶפֶשׁ חַיָּה׃',
   'Vayyitzer Yahweh Elohim et-ha''adam aphar min-ha''adamah vayyippach be''appav nishmat chayyim vayehi ha''adam lenefesh chayyah.',
   'The most intimate act of creation. ''Formed'' (yatsar) — like a potter with clay (cf. Isaiah 64:8). ''Breathed'' (naphach) — God gives mouth-to-mouth resuscitation to a clay figure. ''Nishmat chayyim'' (breath of life) — the divine spark that makes humans unique. ''Nephesh chayyah'' (living soul) — man is not a body with a soul; he became a soul.',
   'The dual nature of humanity: dust (humble origin, mortality) + divine breath (dignity, eternal capacity). We are both earthly and heavenly, material and spiritual.'),
  (8,
   'And the LORD God planted a garden eastward in Eden; and there he put the man whom he had formed.',
   'וַיִּטַּע יְהוָה אֱלֹהִים גַּן־בְּעֵדֶן מִקֶּדֶם וַיָּשֶׂם שָׁם אֶת־הָאָדָם אֲשֶׁר יָצָר׃',
   'Vayyitta Yahweh Elohim gan-be''Eden mikkedem vayyasem sham et-ha''adam asher yatsar.',
   '''Eden'' means ''delight/pleasure'' — God prepared a place of joy for man. ''Planted'' — God Himself is the first gardener. ''Eastward'' (mikkedem) can also mean ''from ancient times,'' suggesting Eden was prepared from the beginning.',
   NULL),
  (9,
   'And out of the ground made the LORD God to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.',
   'וַיַּצְמַח יְהוָה אֱלֹהִים מִן־הָאֲדָמָה כָּל־עֵץ נֶחְמָד לְמַרְאֶה וְטוֹב לְמַאֲכָל וְעֵץ הַחַיִּים בְּתוֹךְ הַגָּן וְעֵץ הַדַּעַת טוֹב וָרָע׃',
   'Vayyatzmach Yahweh Elohim min-ha''adamah kol-etz nechmad lemar''eh vetov lema''akhal ve''etz hachayyim betokh haggan ve''etz hadda''at tov vara.',
   'Two special trees: (1) The Tree of Life — sustaining eternal life, later guarded by cherubim (3:24), reappearing in Revelation 22:2. (2) The Tree of Knowledge of Good and Evil — the test of obedience. ''Pleasant to the sight and good for food'' — God appeals to both beauty and sustenance.',
   'The two trees represent two paths: life through trust and obedience (Tree of Life), or autonomy apart from God (Tree of Knowledge). This choice echoes throughout all of Scripture.'),
  (10,
   'And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.',
   'וְנָהָר יֹצֵא מֵעֵדֶן לְהַשְׁקוֹת אֶת־הַגָּן וּמִשָּׁם יִפָּרֵד וְהָיָה לְאַרְבָּעָה רָאשִׁים׃',
   'Venahar yotze me''Eden lehashkot et-haggan umisham yippared vehayah le''arba''ah rashim.',
   'A single river from Eden divides into four — abundance flows from God''s presence. The garden is the source, not the destination, of life-giving water. This imagery reappears in Ezekiel 47 and Revelation 22:1.',
   NULL),
  (11,
   'The name of the first is Pison: that is it which compasseth the whole land of Havilah, where there is gold;',
   'שֵׁם הָאֶחָד פִּישׁוֹן הוּא הַסֹּבֵב אֵת כָּל־אֶרֶץ הַחֲוִילָה אֲשֶׁר־שָׁם הַזָּהָב׃',
   'Shem ha''echad Pishon hu hassovev et kol-eretz Havilah asher-sham hazzahav.',
   'Pishon means ''gushing.'' Havilah is associated with wealth. The detailed geography emphasizes Eden was a real place, not merely symbolic, though its exact location is debated due to the Flood.',
   NULL),
  (12,
   'And the gold of that land is good: there is bdellium and the onyx stone.',
   'וּזֲהַב הָאָרֶץ הַהִוא טוֹב שָׁם הַבְּדֹלַח וְאֶבֶן הַשֹּׁהַם׃',
   'Uzahav ha''aretz hahi tov sham habbedolach ve''even hashoham.',
   'Gold, bdellium (aromatic resin), and onyx — luxury materials later used in the Tabernacle (Exodus 25, 28). Eden''s treasures foreshadow worship. God surrounded Adam with beauty and abundance.',
   NULL),
  (13,
   'And the name of the second river is Gihon: the same is it that compasseth the whole land of Ethiopia.',
   'וְשֵׁם הַנָּהָר הַשֵּׁנִי גִּיחוֹן הוּא הַסּוֹבֵב אֵת כָּל־אֶרֶץ כּוּשׁ׃',
   'Veshem hannahar hasheni Gichon hu hassovev et kol-eretz Kush.',
   'Gihon means ''bursting forth.'' Kush (Cush/Ethiopia) — the river system of Eden watered vast regions. A spring named Gihon later supplied Jerusalem (1 Kings 1:33).',
   NULL),
  (14,
   'And the name of the third river is Hiddekel: that is it which goeth toward the east of Assyria. And the fourth river is Euphrates.',
   'וְשֵׁם הַנָּהָר הַשְּׁלִישִׁי חִדֶּקֶל הוּא הַהֹלֵךְ קִדְמַת אַשּׁוּר וְהַנָּהָר הָרְבִיעִי הוּא פְרָת׃',
   'Veshem hannahar hashlishi Chiddekel hu haholekh kidmat Asshur vehannahar harevi''i hu Ferat.',
   'Hiddekel is the Tigris; Euphrates (Ferat) is well known. These two rivers still flow today through Iraq. The Tigris and Euphrates bracket Mesopotamia — the ''cradle of civilization'' — connecting Eden to known geography.',
   NULL),
  (15,
   'And the LORD God took the man, and put him into the garden of Eden to dress it and to keep it.',
   'וַיִּקַּח יְהוָה אֱלֹהִים אֶת־הָאָדָם וַיַּנִּחֵהוּ בְגַן־עֵדֶן לְעָבְדָהּ וּלְשָׁמְרָהּ׃',
   'Vayyiqqach Yahweh Elohim et-ha''adam vayyannechehu vegan-Eden le''ovdah uleshomrah.',
   '''Dress'' (avad = to serve/work) and ''keep'' (shamar = to guard/protect). Work existed before the Fall — it is not a curse but a calling. The same two words describe the Levites'' duties in the Tabernacle (Numbers 3:7-8), suggesting Adam was a priest-king in God''s garden-temple.',
   'Work is a divine vocation. Adam was given meaningful purpose before sin entered. The command to ''guard'' implies there was something to guard against — foreshadowing the serpent of chapter 3.'),
  (16,
   'And the LORD God commanded the man, saying, Of every tree of the garden thou mayest freely eat:',
   'וַיְצַו יְהוָה אֱלֹהִים עַל־הָאָדָם לֵאמֹר מִכֹּל עֵץ־הַגָּן אָכֹל תֹּאכֵל׃',
   'Vayetzav Yahweh Elohim al-ha''adam lemor mikkol etz-haggan akhol tokhel.',
   '''Freely eat'' (akhol tokhel — an emphatic doubling) — God''s first word to man is generous permission, not restriction. The emphasis is on abundant provision. Every tree is available except one.',
   'God''s character: lavish generosity with one reasonable boundary. The prohibition that follows must be understood against this backdrop of overwhelming permission.'),
  (17,
   'But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.',
   'וּמֵעֵץ הַדַּעַת טוֹב וָרָע לֹא תֹאכַל מִמֶּנּוּ כִּי בְּיוֹם אֲכָלְךָ מִמֶּנּוּ מוֹת תָּמוּת׃',
   'Ume''etz hadda''at tov vara lo tokhal mimmennu ki beyom akholkha mimmennu mot tamut.',
   '''Surely die'' (mot tamut — ''dying you shall die'') — another emphatic doubling. This is both immediate (spiritual death — separation from God) and eventual (physical death). The prohibition tests whether man will trust God''s word or seek autonomous knowledge.',
   'The first covenant: God''s generosity (freely eat everything) with one condition (not this tree) and a clear consequence (death). This pattern — grace, law, consequence — runs through all of Scripture.'),
  (18,
   'And the LORD God said, It is not good that the man should be alone; I will make him an help meet for him.',
   'וַיֹּאמֶר יְהוָה אֱלֹהִים לֹא־טוֹב הֱיוֹת הָאָדָם לְבַדּוֹ אֶעֱשֶׂה־לּוֹ עֵזֶר כְּנֶגְדּוֹ׃',
   'Vayyomer Yahweh Elohim lo-tov heyot ha''adam levaddo e''eseh-lo ezer kenegdo.',
   'The first ''not good'' in creation. After six ''goods'' and one ''very good,'' God declares solitude ''not good.'' ''Ezer kenegdo'' — ''helper corresponding to him.'' ''Ezer'' (helper) is used of God Himself 16 times in the OT (Psalm 33:20, 70:5). It implies strength, not inferiority. ''Kenegdo'' means ''opposite/corresponding'' — equal yet complementary.',
   'Human beings are designed for relationship. Aloneness is the first thing God identifies as ''not good.'' The woman is not an afterthought but the completion of God''s design.'),
  (19,
   'And out of the ground the LORD God formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.',
   'וַיִּצֶר יְהוָה אֱלֹהִים מִן־הָאֲדָמָה כָּל־חַיַּת הַשָּׂדֶה וְאֵת כָּל־עוֹף הַשָּׁמַיִם וַיָּבֵא אֶל־הָאָדָם לִרְאוֹת מַה־יִּקְרָא־לוֹ וְכֹל אֲשֶׁר יִקְרָא־לוֹ הָאָדָם נֶפֶשׁ חַיָּה הוּא שְׁמוֹ׃',
   'Vayyitzer Yahweh Elohim min-ha''adamah kol-chayyat hasadeh ve''et kol-of hashamayim vayyave el-ha''adam lir''ot mah-yikra-lo vekhol asher yikra-lo ha''adam nefesh chayyah hu shemo.',
   'God brings the animals to Adam — a parade of creation. ''To see what he would call them'' — God gives Adam genuine freedom and authority. Naming demonstrates sovereignty and intelligence. This process also reveals that among all creatures, none is a suitable companion for man.',
   NULL),
  (20,
   'And Adam gave names to all cattle, and to the fowl of the air, and to every beast of the field; but for Adam there was not found an help meet for him.',
   'וַיִּקְרָא הָאָדָם שֵׁמוֹת לְכָל־הַבְּהֵמָה וּלְעוֹף הַשָּׁמַיִם וּלְכֹל חַיַּת הַשָּׂדֶה וּלְאָדָם לֹא־מָצָא עֵזֶר כְּנֶגְדּוֹ׃',
   'Vayyikra ha''adam shemot lekhol-habbehemah ule''of hashamayim ulekhol chayyat hasadeh ule''adam lo-matza ezer kenegdo.',
   'The naming process had a purpose: Adam would discover his own need. No animal — however wonderful — could be his ''ezer kenegdo.'' The felt lack prepares him to receive God''s gift with gratitude and wonder.',
   NULL),
  (21,
   'And the LORD God caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof;',
   'וַיַּפֵּל יְהוָה אֱלֹהִים תַּרְדֵּמָה עַל־הָאָדָם וַיִּישָׁן וַיִּקַּח אַחַת מִצַּלְעֹתָיו וַיִּסְגֹּר בָּשָׂר תַּחְתֶּנָּה׃',
   'Vayyappel Yahweh Elohim tardemah al-ha''adam vayyishan vayyiqqach achat mittzal''otav vayyisgor basar tachttennah.',
   '''Tardemah'' (deep sleep) — the same word used when God made covenant with Abraham (Gen 15:12). This is a divine surgery under divine anesthesia. ''Tsela'' is traditionally ''rib'' but can mean ''side'' — suggesting woman came from man''s very side, his equal.',
   NULL),
  (22,
   'And the rib, which the LORD God had taken from man, made he a woman, and brought her unto the man.',
   'וַיִּבֶן יְהוָה אֱלֹהִים אֶת־הַצֵּלָע אֲשֶׁר־לָקַח מִן־הָאָדָם לְאִשָּׁה וַיְבִאֶהָ אֶל־הָאָדָם׃',
   'Vayyiven Yahweh Elohim et-hattzela asher-laqach min-ha''adam le''ishshuh vayyevi''eha el-ha''adam.',
   '''Built'' (banah) — not ''formed'' (yatsar) as with Adam. God ''built'' the woman, implying careful, architectural craftsmanship. ''Brought her to the man'' — God presents Eve to Adam like a father presenting a bride. The first wedding, with God as the officiant.',
   'God is the author of marriage. He designed it, He initiated it, and He presented the bride to the groom. Marriage is not a human invention but a divine institution.'),
  (23,
   'And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.',
   'וַיֹּאמֶר הָאָדָם זֹאת הַפַּעַם עֶצֶם מֵעֲצָמַי וּבָשָׂר מִבְּשָׂרִי לְזֹאת יִקָּרֵא אִשָּׁה כִּי מֵאִישׁ לֻקְחָה־זֹּאת׃',
   'Vayyomer ha''adam zot happa''am etzem me''atzamai uvasar mibbsari lezot yikkare ishah ki me''ish luqqachah-zot.',
   'Adam''s first recorded words — and they are poetry! ''This at last!'' (zot happa''am) — joyful recognition after the parade of animals. ''Bone of my bones, flesh of my flesh'' — the language of covenant kinship. ''Ishah'' (woman) from ''ish'' (man) — the Hebrew wordplay shows their essential unity.',
   NULL),
  (24,
   'Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.',
   'עַל־כֵּן יַעֲזָב־אִישׁ אֶת־אָבִיו וְאֶת־אִמּוֹ וְדָבַק בְּאִשְׁתּוֹ וְהָיוּ לְבָשָׂר אֶחָד׃',
   'Al-ken ya''azov-ish et-aviv ve''et immo vedavak be''ishto vehayu levasar echad.',
   'The narrator''s commentary — the foundational marriage text. Three actions: (1) Leave — a new primary loyalty, (2) Cleave (davak — cling, be glued to) — permanent covenant bond, (3) One flesh — a mysterious spiritual, emotional, and physical union. Jesus quotes this verse directly in Matthew 19:5.',
   'Marriage defined: one man, one woman, one lifetime. ''Leave, cleave, one flesh'' — this is God''s design from the very beginning, before the Fall, before culture, before law. Jesus affirms this as the Creator''s original intent (Matt 19:4-6).'),
  (25,
   'And they were both naked, the man and his wife, and were not ashamed.',
   'וַיִּהְיוּ שְׁנֵיהֶם עֲרוּמִּים הָאָדָם וְאִשְׁתּוֹ וְלֹא יִתְבֹּשָׁשׁוּ׃',
   'Vayyihyu sheneihem arummim ha''adam ve''ishto velo yitboshashu.',
   '''Naked and not ashamed'' — the sign of perfect innocence. No guilt, no fear, no hiding, no barriers between them or between them and God. This stands in stark contrast to 3:7 where they immediately cover themselves. ''Arummim'' (naked) is a wordplay with ''arum'' (crafty) in 3:1, linking innocence and the coming temptation.',
   'The original state of humanity: transparent, vulnerable, unashamed before God and each other. Sin brings shame, covering, and hiding. The gospel restores us to shameless intimacy with God (Romans 8:1).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Genesis' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses
-- Verse 2 (Sabbath)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('שָׁבַת', 'shabbat', 'H7673', 'To cease, to rest — not from fatigue but from completion. The root of ''Sabbath.''', 1),
  ('מְלָאכָה', 'melakhah', 'H4399', 'Work, craftsmanship — purposeful, skilled labor. Same word used for Tabernacle construction.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = 2;

-- Verse 7 (Formation of man)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('יָצַר', 'yatsar', 'H3335', 'To form, fashion, shape — like a potter with clay. Intimate, hands-on creation.', 1),
  ('עָפָר', 'aphar', 'H6083', 'Dust, dry earth — man''s humble origin. ''Dust to dust'' (Gen 3:19).', 2),
  ('נָפַח', 'naphach', 'H5301', 'To breathe, blow — God personally gives the breath of life. Intimate and life-giving.', 3),
  ('נִשְׁמַת חַיִּים', 'nishmat chayyim', 'H5397/H2416', 'Breath of life — the divine animating force unique to humans. Not given to animals this way.', 4),
  ('נֶפֶשׁ חַיָּה', 'nefesh chayyah', 'H5315/H2416', 'Living soul/being — the whole person: body + breath = living soul. Man is a unity.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = 7;

-- Verse 9 (Two trees)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('עֵץ הַחַיִּים', 'etz hachayyim', 'H6086/H2416', 'Tree of Life — sustaining eternal life. Reappears in Proverbs 3:18, 11:30 and Revelation 2:7, 22:2.', 1),
  ('הַדַּעַת', 'hadda''at', 'H1847', 'Knowledge — experiential knowing, not merely intellectual. ''Good and evil'' = moral autonomy apart from God.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = 9;

-- Verse 15 (Work in the garden)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('לְעָבְדָהּ', 'le''ovdah', 'H5647', 'To work, serve, till — same word for worshipping/serving God. Work is worship.', 1),
  ('וּלְשָׁמְרָהּ', 'uleshomrah', 'H8104', 'To keep, guard, protect — the priestly duty. Same word used for keeping God''s commandments.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = 15;

-- Verse 17 (Surely die)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('הַדַּעַת טוֹב וָרָע', 'hadda''at tov vara', 'H1847/H2896/H7451', 'Knowledge of good and evil — the capacity to determine right and wrong independently of God.', 1),
  ('מוֹת תָּמוּת', 'mot tamut', 'H4191', 'Dying you shall die — emphatic: certain, inevitable death. Both spiritual (immediate) and physical (eventual).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = 17;

-- Verse 18 (Not good to be alone)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('לֹא־טוֹב', 'lo-tov', 'H3808/H2896', 'Not good — the first negative evaluation in creation. Solitude was the only thing God called ''not good.''', 1),
  ('עֵזֶר', 'ezer', 'H5828', 'Helper, ally, strength — used 16 times of God Himself (Ps 33:20). Implies power, not weakness.', 2),
  ('כְּנֶגְדּוֹ', 'kenegdo', 'H5048', 'Corresponding to him, opposite him — equal and complementary. A mirror-match, not a subordinate.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = 18;

-- Verse 22 (Built a woman)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('וַיִּבֶן', 'vayyiven', 'H1129', 'Built — not ''formed'' (yatsar) or ''made'' (asah). Architectural craftsmanship. God carefully constructed woman.', 1),
  ('צֵלָע', 'tzela', 'H6763', 'Rib or side — can mean ''side chamber.'' Woman came from man''s side: not above to rule, not below to be trampled, but beside as equal.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = 22;

-- Verse 24 (One flesh)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('יַעֲזָב', 'ya''azov', 'H5800', 'Leave, forsake — establishing a new primary loyalty. Marriage creates a new family unit.', 1),
  ('דָבַק', 'davak', 'H1692', 'Cleave, cling, be joined — like glue. Permanent, unbreakable covenant bond. Same word for clinging to God (Deut 10:20).', 2),
  ('בָשָׂר אֶחָד', 'basar echad', 'H1320/H259', 'One flesh — a profound unity: spiritual, emotional, physical. ''Echad'' (one) is the same word as in the Shema (Deut 6:4).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = 24;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Sabbath
  (2, 'Exodus 20:8-11', 1), (2, 'Hebrews 4:4-10', 2), (2, 'Mark 2:27', 3), (2, 'Isaiah 40:28', 4),
  -- v3: Sanctified
  (3, 'Exodus 31:13-17', 1), (3, 'Nehemiah 9:14', 2), (3, 'Isaiah 58:13-14', 3),
  -- v7: Formation of man
  (7, 'Isaiah 64:8', 1), (7, 'Job 33:4', 2), (7, 'Psalm 103:14', 3), (7, '1 Corinthians 15:45-47', 4), (7, 'Acts 17:25', 5),
  -- v8: Garden of Eden
  (8, 'Ezekiel 28:13', 1), (8, 'Isaiah 51:3', 2), (8, 'Revelation 2:7', 3),
  -- v9: Two trees
  (9, 'Proverbs 3:18', 1), (9, 'Revelation 2:7', 2), (9, 'Revelation 22:2', 3), (9, 'Deuteronomy 30:15-19', 4),
  -- v15: Work
  (15, 'Numbers 3:7-8', 1), (15, 'Numbers 18:5-6', 2), (15, 'Psalm 128:1-2', 3),
  -- v17: Surely die
  (17, 'Romans 5:12', 1), (17, 'Romans 6:23', 2), (17, 'Ezekiel 18:4', 3), (17, 'James 1:15', 4),
  -- v18: Not good alone
  (18, 'Ecclesiastes 4:9-12', 1), (18, 'Psalm 33:20', 2), (18, 'Psalm 121:1-2', 3), (18, '1 Corinthians 11:9', 4),
  -- v22: Built a woman
  (22, 'Proverbs 18:22', 1), (22, 'Proverbs 31:10', 2), (22, '1 Timothy 2:13', 3),
  -- v23: Bone of my bones
  (23, 'Ephesians 5:28-30', 1), (23, 'Genesis 29:14', 2), (23, '2 Samuel 5:1', 3),
  -- v24: One flesh
  (24, 'Matthew 19:4-6', 1), (24, 'Mark 10:7-8', 2), (24, 'Ephesians 5:31-32', 3), (24, '1 Corinthians 6:16', 4),
  -- v25: Naked and not ashamed
  (25, 'Genesis 3:7', 1), (25, 'Genesis 3:21', 2), (25, 'Romans 8:1', 3), (25, 'Isaiah 61:10', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Genesis' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Genesis 2 Complete!
-- 25 verses · 8 key verses with word studies
-- Cross-references for 11 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════