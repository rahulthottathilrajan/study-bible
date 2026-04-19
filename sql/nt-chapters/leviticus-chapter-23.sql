-- ═══════════════════════════════════════════════════════
-- LEVITICUS CHAPTER 23 — The Lord's Appointed Feasts: A Calendar of Holy Convocations
-- 44 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 23,
  'Leviticus Chapter 23 meticulously outlines the seven annual feasts of the LORD, alongside the weekly Sabbath, establishing a divine calendar for Israel''s worship and remembrance. These ''appointed times'' (מועדים) were not merely holidays but sacred convocations designed to foster communion with God, commemorate His redemptive acts, and prophetically foreshadow the coming Messiah and His work. The chapter details the rituals and observances for each feast—Passover, Unleavened Bread, Firstfruits, Weeks (Pentecost), Trumpets, Day of Atonement, and Tabernacles—emphasizing their perpetual nature and the requirement for Israel to live in holiness before their God. The theological significance lies in God''s initiative to meet with His people, providing a framework for atonement, thanksgiving, and the anticipation of future salvation, culminating in Christ''s fulfillment of these types.',
  'The Lord''s Appointed Feasts: A Calendar of Holy Convocations',
  'מוֹעֲדִים (mo''adim)',
  'Derived from the root יעד (ya''ad), meaning ''to appoint'' or ''to meet,'' מוֹעֲדִים refers to ''appointed times,'' ''seasons,'' or ''feasts.'' Theologically, these are not arbitrary holidays but divinely ordained appointments where God meets with His people. They serve as a sacred calendar, marking significant events in Israel''s history and foreshadowing God''s redemptive plan through Christ.',
  '["Introduction to the Feasts and the Weekly Sabbath (vv. 1-4)","Passover and the Feast of Unleavened Bread (vv. 5-8)","The Feast of Firstfruits (vv. 9-14)","The Feast of Weeks (Pentecost) (vv. 15-22)","The Feast of Trumpets (vv. 23-25)","The Day of Atonement (vv. 26-32)","The Feast of Tabernacles (vv. 33-43)","Conclusion: Moses Declares the Feasts (v. 44)"]'
FROM books b WHERE b.name = 'Leviticus';

-- Step 2: Insert all 44 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vay''dabber YHVH el-Mosheh lemor.',
   'This introductory verse, common in Leviticus, signals a direct divine revelation to Moses, emphasizing the authoritative origin of the subsequent commands. The phrase ''the LORD spake unto Moses'' underscores that the instructions regarding the feasts are not human traditions but divine ordinances, essential for Israel''s covenant relationship with God. This sets the stage for the detailed exposition of the sacred calendar.',
   NULL),
  (2,
   'Speak unto the children of Israel, and say unto them, Concerning the feasts of the LORD, which ye shall proclaim to be holy convocations, even these are my feasts.',
   'דַּבֵּר אֶל־בְּנֵי יִשְׂרָאֵל וְאָמַרְתָּ אֲלֵהֶם מוֹעֲדֵי יְהוָה אֲשֶׁר תִּקְרְאוּ אֹתָם מִקְרָאֵי קֹדֶשׁ אֵלֶּה הֵם מוֹעֲדָי׃',
   'Dabber el-b''nei Yisra''el v''amarta aleihem mo''adei YHVH asher tikre''u otam mikra''ei kodesh eileh hem mo''aday.',
   'The ''feasts of the LORD'' (מוֹעֲדֵי יְהוָה, mo''adei YHVH) are explicitly defined as ''holy convocations'' (מִקְרָאֵי קֹדֶשׁ, mikra''ei kodesh). This signifies that these are not merely holidays but divinely appointed times for the community to gather for sacred purposes, set apart for God. The phrase ''these are my feasts'' highlights God''s ownership and initiative in establishing these appointments, which serve as a framework for Israel''s worship and remembrance of His redemptive acts.',
   'The concept of ''holy convocations'' reveals God''s desire for His people to gather corporately for worship and instruction. These feasts are divine appointments, not human inventions, underscoring God''s sovereignty over time and His initiative in establishing means for humanity to draw near to Him. They foreshadow the ultimate ''convocation'' of believers in Christ (Heb 10:25).'),
  (3,
   'Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of the LORD in all your dwellings.',
   'שֵׁשֶׁת יָמִים תֵּעָשֶׂה מְלָאכָה וּבַיּוֹם הַשְּׁבִיעִי שַׁבַּת שַׁבָּתוֹן מִקְרָא־קֹדֶשׁ כָּל־מְלָאכָה לֹא תַעֲשׂוּ אֹתוֹ שַׁבָּת לַיהוָה בְּכֹל מוֹשְׁבֹתֵיכֶם׃',
   'Sheshet yamim te''aseh m''lakhah uvayom hash''vi''i shabbat shabbaton mikra-kodesh kol-m''lakhah lo ta''asu oto shabbat la''YHVH b''khol mosh''voteikhem.',
   'The weekly Sabbath is presented as the first and foundational ''holy convocation,'' preceding the annual feasts. It is a ''sabbath of rest'' (שַׁבַּת שַׁבָּתוֹן, shabbat shabbaton), emphasizing complete cessation from ''work'' (מְלָאכָה, m''lakhah). This command, rooted in creation (Gen 2:2-3) and reiterated in the Decalogue (Exod 20:8-11), establishes a rhythm of work and rest, sanctifying time and reminding Israel of God''s sovereignty and their deliverance from Egyptian bondage (Deut 5:12-15).',
   'The Sabbath is a perpetual sign of the covenant between God and Israel, symbolizing God''s creative rest and His provision of rest for His people. It points forward to the spiritual rest found in Christ (Matt 11:28-30) and the ultimate eschatological rest for the people of God (Heb 4:9-10). It underscores the principle that true rest comes from ceasing from one''s own labors and trusting in God''s finished work.'),
  (4,
   'These are the feasts of the LORD, even holy convocations, which ye shall proclaim in their seasons.',
   'אֵלֶּה מוֹעֲדֵי יְהוָה מִקְרָאֵי קֹדֶשׁ אֲשֶׁר תִּקְרְאוּ אֹתָם בְּמוֹעֲדָם׃',
   'Eileh mo''adei YHVH mikra''ei kodesh asher tikre''u otam b''mo''adam.',
   'This verse reiterates the divine nature of the feasts and their designation as ''holy convocations,'' emphasizing that they must be proclaimed ''in their seasons'' (בְּמוֹעֲדָם, b''mo''adam). This highlights the importance of precise timing in Israel''s worship, reflecting God''s orderliness and the specific historical and prophetic significance attached to each appointed time. The adherence to the calendar was crucial for maintaining covenant fidelity.',
   NULL),
  (5,
   'In the fourteenth day of the first month at even is the LORD’s passover.',
   'בַּחֹדֶשׁ הָרִאשׁוֹן בְּאַרְבָּעָה עָשָׂר יוֹם לַחֹדֶשׁ בֵּין הָעַרְבָּיִם פֶּסַח לַיהוָה׃',
   'Bachodesh ha''rishon b''arba''ah asar yom lachodesh bein ha''arbayim Pesach la''YHVH.',
   'Passover (פֶּסַח, Pesach) is the first annual feast, observed on the 14th day of the first month (Nisan) ''at even'' (בֵּין הָעַרְבָּיִם, bein ha''arbayim, literally ''between the two evenings''). This feast commemorates Israel''s deliverance from slavery in Egypt, specifically the night when the LORD ''passed over'' the houses of the Israelites marked with lamb''s blood (Exod 12:1-14). The timing is critical, marking the beginning of the sacred year and setting the stage for the subsequent feasts.',
   'Passover is profoundly significant doctrinally, prefiguring Christ as the ultimate Passover Lamb (1 Cor 5:7). His sacrifice on the cross, shedding His blood, provides atonement and deliverance from the bondage of sin and death for all who believe, just as the lamb''s blood saved Israel from the destroyer (John 1:29).'),
  (6,
   'And on the fifteenth day of the same month is the feast of unleavened bread unto the LORD: seven days ye must eat unleavened bread.',
   'וּבַחֲמִשָּׁה עָשָׂר יוֹם לַחֹדֶשׁ הַזֶּה חַג הַמַּצּוֹת לַיהוָה שִׁבְעַת יָמִים מַצּוֹת תֹּאכֵלוּ׃',
   'Uvachamishah asar yom lachodesh hazzeh chag ha''matzot la''YHVH shiv''at yamim matzot tokhelu.',
   'Immediately following Passover, on the 15th day of the first month, begins the Feast of Unleavened Bread (חַג הַמַּצּוֹת, Chag ha''Matzot), lasting seven days. The central command is to eat ''unleavened bread'' (מַצּוֹת, matzot), symbolizing the haste of Israel''s departure from Egypt, leaving no time for dough to rise (Exod 12:34, 39). It also represents purity and the removal of sin, as leaven often symbolizes corruption in Scripture (1 Cor 5:6-8).',
   'The Feast of Unleavened Bread emphasizes the need for purity and separation from sin after redemption. Just as Israel was to purge leaven from their homes, believers are called to live a life of holiness, continually purging sin from their lives, reflecting the newness of life found in Christ (Gal 5:9).'),
  (7,
   'In the first day ye shall have an holy convocation: ye shall do no servile work therein.',
   'בַּיּוֹם הָרִאשׁוֹן מִקְרָא־קֹדֶשׁ יִהְיֶה לָכֶם כָּל־מְלֶאכֶת עֲבֹדָה לֹא תַעֲשׂוּ׃',
   'Bayom ha''rishon mikra-kodesh yihyeh lakhem kol-melekhet avodah lo ta''asu.',
   'The first day of the Feast of Unleavened Bread is designated a ''holy convocation'' (מִקְרָא־קֹדֶשׁ, mikra-kodesh), during which ''no servile work'' (מְלֶאכֶת עֲבֹדָה, melekhet avodah) is to be done. This restriction, similar to the Sabbath, underscores the sacredness of the day and its dedication to the LORD. It allowed the people to focus on worship, remembrance, and communal celebration without the distractions of daily labor.',
   NULL),
  (8,
   'But ye shall offer an offering made by fire unto the LORD seven days: in the seventh day is an holy convocation: ye shall do no servile work therein.',
   'וְהִקְרַבְתֶּם אִשֶּׁה לַיהוָה שִׁבְעַת יָמִים בַּיּוֹם הַשְּׁבִיעִי מִקְרָא־קֹדֶשׁ כָּל־מְלֶאכֶת עֲבֹדָה לֹא תַעֲשׂוּ׃',
   'V''hikravtem isheh la''YHVH shiv''at yamim bayom hash''vi''i mikra-kodesh kol-melekhet avodah lo ta''asu.',
   'Throughout the seven days of Unleavened Bread, offerings made by fire (אִשֶּׁה, isheh) were to be presented to the LORD. The seventh day of this feast was also a ''holy convocation'' with the same prohibition against ''servile work.'' This dual emphasis on offerings and sacred rest highlights the dual nature of the feast: active worship through sacrifice and passive devotion through cessation from labor, both dedicated to God.',
   NULL),
  (9,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vay''dabber YHVH el-Mosheh lemor.',
   'Another introductory formula, signaling a new section of divine instruction. This transition prepares the reader for the details concerning the Feast of Firstfruits, which is distinct from the Passover and Unleavened Bread, though chronologically linked to them. It emphasizes that the following commands are equally authoritative and part of God''s comprehensive plan for Israel''s worship.',
   NULL),
  (10,
   'Speak unto the children of Israel, and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest:',
   'דַּבֵּר אֶל־בְּנֵי יִשְׂרָאֵל וְאָמַרְתָּ אֲלֵהֶם כִּי תָבֹאוּ אֶל־הָאָרֶץ אֲשֶׁר אֲנִי נֹתֵן לָכֶם וּקְצַרְתֶּם אֶת־קְצִירָהּ וַהֲבֵאתֶם אֶת־עֹמֶר רֵאשִׁית קְצִירְכֶם אֶל־הַכֹּהֵן׃',
   'Dabber el-b''nei Yisra''el v''amarta aleihem ki tavo''u el-ha''aretz asher ani noten lakhem uk''tzartem et-k''tzirah vaha''vetem et-omer reishit k''tzirkhem el-hakkohen.',
   'The Feast of Firstfruits (רֵאשִׁית קְצִירְכֶם, reishit k''tzirkhem) is introduced with the condition ''When ye be come into the land,'' highlighting its connection to the agricultural cycle of Canaan. Israel was commanded to bring a ''sheaf'' (עֹמֶר, omer) of the first grain harvest to the priest. This act of offering the first portion acknowledged God as the provider of the land and its bounty, consecrating the entire harvest to Him before any part could be consumed.',
   'The Feast of Firstfruits powerfully foreshadows Christ''s resurrection. Just as the first sheaf was presented to God, guaranteeing the full harvest, Christ is the ''firstfruits of those who have fallen asleep'' (1 Cor 15:20, 23), guaranteeing the resurrection of all believers. It signifies God''s blessing on the entire harvest and His ultimate victory over death.'),
  (11,
   'And he shall wave the sheaf before the LORD, to be accepted for you: on the morrow after the sabbath the priest shall wave it.',
   'וְהֵנִיף אֶת־הָעֹמֶר לִפְנֵי יְהוָה לְרָצֹון לָכֶם מִמָּחֳרַת הַשַּׁבָּת יְנִיפֶנּוּ הַכֹּהֵן׃',
   'V''henif et-ha''omer lifnei YHVH l''ratzon lakhem mimmochorat ha''shabbat yenifennu hakkohen.',
   'The priest was to ''wave'' the sheaf (וְהֵנִיף, v''henif) before the LORD ''to be accepted for you'' (לְרָצֹון לָכֶם, l''ratzon lakhem). Crucially, this was to be done ''on the morrow after the sabbath.'' This timing, interpreted by some as the day after the first day of Unleavened Bread (a ''sabbath'' in the sense of a holy day), and by others (Pharisees) as the day after the weekly Sabbath during Unleavened Bread, places it firmly within the Passover season, linking redemption with the promise of provision.',
   NULL),
  (12,
   'And ye shall offer that day when ye wave the sheaf an he lamb without blemish of the first year for a burnt offering unto the LORD.',
   'וַעֲשִׂיתֶם בְּיוֹם הֲנִיפְכֶם אֶת־הָעֹמֶר כֶּבֶשׂ תָּמִים בֶּן־שְׁנָתוֹ לְעֹלָה לַיהוָה׃',
   'Va''asitem b''yom hanifkhem et-ha''omer keves tamim ben-sh''nato l''olah la''YHVH.',
   'On the day the sheaf was waved, a ''he lamb without blemish of the first year'' was to be offered as a burnt offering (לְעֹלָה, l''olah) to the LORD. This burnt offering, symbolizing complete dedication and atonement, accompanied the firstfruits offering, emphasizing that even in thanksgiving for material blessings, the need for propitiation and consecration to God remained paramount. The ''without blemish'' requirement points to the perfection required for sacrifice.',
   NULL),
  (13,
   'And the meat offering thereof shall be two tenth deals of fine flour mingled with oil, an offering made by fire unto the LORD for a sweet savour: and the drink offering thereof shall be of wine, the fourth part of an hin.',
   'וּמִנְחָתוֹ שְׁנֵי עֶשְׂרֹנִים סֹלֶת בְּלוּלָה בַשֶּׁמֶן אִשֶּׁה לַיהוָה רֵיחַ נִיחֹחַ וְנִסְכֹּה רְבִיעִת הַהִין יָיִן׃',
   'Uminchato sh''nei esronim solet b''lulah ba''shemen isheh la''YHVH reiach nichoach v''niskoh r''vi''it ha''hin yayin.',
   'Accompanying the burnt offering was a ''meat offering'' (מִנְחָה, minchah) of fine flour mixed with oil, and a ''drink offering'' (נֶסֶךְ, nesekh) of wine. These offerings, made by fire, were considered a ''sweet savour'' (רֵיחַ נִיחֹחַ, reiach nichoach) to the LORD, signifying His acceptance and pleasure in the worship. The specific quantities (two tenth deals of flour, a fourth part of a hin of wine) underscore the precision required in Israel''s cultic practices.',
   NULL),
  (14,
   'And ye shall eat neither bread, nor parched corn, nor green ears, until the selfsame day that ye have brought an offering unto your God: it shall be a statute for ever throughout your generations in all your dwellings.',
   'וְלֶחֶם וְקָלִי וְכַרְמֶל לֹא תֹאכְלוּ עַד־עֶצֶם הַיּוֹם הַזֶּה עַד הֲבִיאֲכֶם אֶת־קָרְבַּן אֱלֹהֵיכֶם חֻקַּת עוֹלָם לְדֹרֹתֵיכֶם בְּכֹל מֹשְׁבֹתֵיכֶם׃',
   'V''lechem v''kali v''karmel lo tokhlu ad-etzem hayom hazzeh ad havi''akhem et-korban Eloheikhem chukkat olam l''doroteikhem b''khol mosh''voteikhem.',
   'A strict prohibition was placed on eating any new grain—''bread, nor parched corn, nor green ears''—until the firstfruits offering had been presented. This emphasizes the principle of ''firstfruits'' (Prov 3:9-10), acknowledging God''s ownership and provision before partaking of His blessings. This was a ''statute for ever'' (חֻקַּת עוֹלָם, chukkat olam), binding on all generations, reinforcing the perpetual nature of this act of faith and obedience.',
   'This command teaches the importance of honoring God with the ''first and best'' of our resources. It''s a tangible expression of trust and dependence, recognizing that all blessings come from Him. It also points to the spiritual truth that we must first receive God''s provision (Christ as firstfruits) before we can truly partake of spiritual sustenance.'),
  (15,
   'And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:',
   'וּסְפַרְתֶּם לָכֶם מִמָּחֳרַת הַשַּׁבָּת מִיּוֹם הֲבִיאֲכֶם אֶת־עֹמֶר הַתְּנוּפָה שֶׁבַע שַׁבָּתוֹת תְּמִימֹת תִּהְיֶינָה׃',
   'Us''fartem lakhem mimmochorat ha''shabbat miyom havi''akhem et-omer ha''t''nufah sheva shabbatot t''mimot tihyeynah.',
   'This verse introduces the counting of the Omer, a period of seven full weeks (seven sabbaths) from the day the wave sheaf was offered. This period connects the Feast of Firstfruits to the subsequent Feast of Weeks (Pentecost). The instruction to ''count unto you'' (וּסְפַרְתֶּם לָכֶם, us''fartem lakhem) highlights the active participation and anticipation required of the Israelites, marking the progression of the harvest season and the unfolding of God''s appointed times.',
   NULL),
  (16,
   'Even unto the morrow after the seventh sabbath shall ye number fifty days; and ye shall offer a new meat offering unto the LORD.',
   'עַד מִמָּחֳרַת הַשַּׁבָּת הַשְּׁבִיעִת תִּסְפְּרוּ חֲמִשִּׁים יוֹם וְהִקְרַבְתֶּם מִנְחָה חֲדָשָׁה לַיהוָה׃',
   'Ad mimmochorat ha''shabbat hash''vi''it tisf''ru chamishim yom v''hikravtem minchah chadashah la''YHVH.',
   'The counting culminates on the ''morrow after the seventh sabbath,'' totaling fifty days, which marks the Feast of Weeks (שָׁבֻעוֹת, Shavu''ot), later known as Pentecost (from Greek ''fiftieth''). On this day, a ''new meat offering'' (מִנְחָה חֲדָשָׁה, minchah chadashah) was to be presented to the LORD. This offering, made from the new grain harvest, signifies the completion of the grain harvest and a fresh act of thanksgiving to God for His provision.',
   'The Feast of Weeks, or Pentecost, is profoundly significant as it foreshadows the outpouring of the Holy Spirit (Acts 2:1-4). Just as the law was given at Sinai fifty days after the Exodus, the Spirit was given fifty days after Christ''s resurrection, inaugurating the church and empowering believers for ministry. It marks a new spiritual harvest.'),
  (17,
   'Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto the LORD.',
   'מִמּוֹשְׁבֹתֵיכֶם תָּבִיאּוּ לֶחֶם תְּנוּפָה שְׁתַּיִם שְׁנֵי עֶשְׂרֹנִים סֹלֶת תִּהְיֶינָה חָמֵץ תֵּאָפֶינָה בִּכּוּרִים לַיהוָה׃',
   'Mimosh''voteikhem tavi''u lechem t''nufah shtayim sh''nei esronim solet tihyeynah chametz te''afeynah bikkurim la''YHVH.',
   'For the Feast of Weeks, two ''wave loaves'' (לֶחֶם תְּנוּפָה, lechem t''nufah) were to be brought from the people''s dwellings. These loaves, made of fine flour, were unique because they were to be ''baken with leaven'' (חָמֵץ תֵּאָפֶינָה, chametz te''afeynah). This contrasts sharply with the unleavened bread of Passover. As ''firstfruits'' (בִּכּוּרִים, bikkurim) to the LORD, they likely represented the ordinary bread of daily life, acknowledging God''s blessing on the common sustenance of His people, even with its imperfections (leaven).',
   'The inclusion of leaven in the Pentecost loaves is highly symbolic. While leaven often represents sin, here it may signify the imperfect, yet accepted, offerings of humanity, or the inclusion of Gentiles (who were ''leavened'' by sin) into God''s covenant people. It points to the church, a body of redeemed but still imperfect individuals, presented to God through Christ.'),
  (18,
   'And ye shall offer with the bread seven lambs without blemish of the first year, and one young bullock, and two rams: they shall be for a burnt offering unto the LORD, with their meat offering, and their drink offerings, even an offering made by fire, of sweet savour unto the LORD.',
   'וְהִקְרַבְתֶּם עַל־הַלֶּחֶם שִׁבְעַת כְּבָשִׂים תְּמִימִם בְּנֵי שָׁנָה וּפַר אֶחָד בֶּן־בָּקָר וְאֵילִם שְׁנָיִם יִהְיוּ עֹלָה לַיהוָה וּמִנְחָתָם וְנִסְכֵּיהֶם אִשֵּׁה רֵיחַ נִיחֹחַ לַיהוָה׃',
   'V''hikravtem al-hallechem shiv''at k''vasim t''mimim b''nei shanah ufar echad ben-bakar v''eilim sh''nayim yihyu olah la''YHVH uminchatam v''niskheihem isheh reiach nichoach la''YHVH.',
   'A substantial burnt offering accompanied the wave loaves: seven lambs, one young bullock, and two rams, all ''without blemish.'' These, along with their associated grain and drink offerings, were presented as a ''sweet savour'' to the LORD. The large number of animals indicates the significance of this feast, representing a comprehensive act of dedication and atonement for the community, acknowledging God''s abundant provision and seeking His continued favor.',
   NULL),
  (19,
   'Then ye shall sacrifice one kid of the goats for a sin offering, and two lambs of the first year for a sacrifice of peace offerings.',
   'וַעֲשִׂיתֶם שְׂעִיר־עִזִּים אֶחָד לְחַטָּאת וּשְׁנֵי כְבָשִׂים בְּנֵי שָׁנָה לְזֶבַח שְׁלָמִים׃',
   'Va''asitem s''ir-izzim echad l''chattat ush''nei k''vasim b''nei shanah l''zevach sh''lamim.',
   'In addition to the burnt offerings, a ''kid of the goats for a sin offering'' (לְחַטָּאת, l''chattat) and two lambs for a ''sacrifice of peace offerings'' (לְזֶבַח שְׁלָמִים, l''zevach sh''lamim) were required. The sin offering addressed unintentional sins, emphasizing the constant need for atonement even amidst celebration. The peace offerings symbolized communion and fellowship with God and with one another, allowing the offerers to partake of the sacrificial meal.',
   'The inclusion of a sin offering alongside offerings of thanksgiving highlights the persistent reality of human sinfulness, even within sacred celebrations. It reminds us that all fellowship with God is predicated on atonement for sin, ultimately fulfilled in Christ''s perfect sacrifice (Heb 9:22).'),
  (20,
   'And the priest shall wave them with the bread of the firstfruits for a wave offering before the LORD, with the two lambs: they shall be holy to the LORD for the priest.',
   'וְהֵנִיף הַכֹּהֵן אֹתָם עַל לֶחֶם הַבִּכּוּרִים תְּנוּפָה לִפְנֵי יְהוָה עַל שְׁנֵי כְּבָשִׂים קֹדֶשׁ יִהְיוּ לַיהוָה לַכֹּהֵן׃',
   'V''henif hakkohen otam al lechem ha''bikkurim t''nufah lifnei YHVH al sh''nei k''vasim kodesh yihyu la''YHVH lakkohen.',
   'The priest was to ''wave'' (וְהֵנִיף, v''henif) the two loaves of firstfruits along with the two lambs of the peace offering before the LORD. This wave offering (תְּנוּפָה, t''nufah) symbolized their presentation to God and His acceptance. After being waved, these items were designated ''holy to the LORD for the priest,'' meaning they became the priest''s portion, providing for his sustenance and reinforcing his role as mediator between God and Israel.',
   NULL),
  (21,
   'And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.',
   'וּקְרָאתֶם בְּעֶצֶם הַיּוֹם הַזֶּה מִקְרָא־קֹדֶשׁ יִהְיֶה לָכֶם כָּל־מְלֶאכֶת עֲבֹדָה לֹא תַעֲשׂוּ חֻקַּת עוֹלָם בְּכָל־מוֹשְׁבֹתֵיכֶם לְדֹרֹתֵיכֶם׃',
   'Uk''ratem b''etzem hayom hazzeh mikra-kodesh yihyeh lakhem kol-melekhet avodah lo ta''asu chukkat olam b''khol-mosh''voteikhem l''doroteikhem.',
   'The Feast of Weeks was to be proclaimed as a ''holy convocation'' (מִקְרָא־קֹדֶשׁ, mikra-kodesh), with the prohibition of ''servile work.'' This command, like others, is declared a ''statute for ever'' (חֻקַּת עוֹלָם, chukkat olam), emphasizing its enduring significance throughout Israel''s generations. The cessation from work allowed for focused worship and communal celebration of God''s provision and the giving of the Law (traditionally associated with Pentecost).',
   NULL),
  (22,
   'And when ye reap the harvest of your land, thou shalt not make clean riddance of the corners of thy field when thou reapest, neither shalt thou gather any gleaning of thy harvest: thou shalt leave them unto the poor, and to the stranger: I am the LORD your God.',
   'וּבְקֻצְרְכֶם אֶת־קְצִיר אַרְצְכֶם לֹא תְכַלֶּה פְּאַת שָׂדְךָ בְּקֻצְרֶךָ וְלֶקֶט קְצִירְךָ לֹא תְלַקֵּט לֶעָנִי וְלַגֵּר תַּעֲזֹב אֹתָם אֲנִי יְהוָה אֱלֹהֵיכֶם׃',
   'Uv''kutzr''khem et-k''tzir artz''khem lo t''khalleh pe''at sad''kha b''kutzreka v''leket k''tzir''kha lo t''laket le''ani v''lagger ta''azov otam ani YHVH Eloheikhem.',
   'This verse, though seemingly a digression, is strategically placed after the harvest feasts. It reiterates the law of gleaning (Lev 19:9-10; Deut 24:19-22), commanding Israel not to ''make clean riddance of the corners'' of their fields or gather ''any gleaning.'' These remnants were to be left for ''the poor, and to the stranger.'' This social justice mandate connects worship with ethical living, reminding Israel that their prosperity was from God and carried a responsibility to care for the vulnerable, reflecting God''s own compassionate character.',
   'This law demonstrates God''s heart for the poor and marginalized, integrating social justice directly into the fabric of Israel''s covenant life. It teaches that true worship involves not only ritual but also practical love and generosity towards others, especially the vulnerable, reflecting the character of God (James 1:27).'),
  (23,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vay''dabber YHVH el-Mosheh lemor.',
   'Another standard introductory phrase, marking the beginning of instructions for the autumn feasts. This transition emphasizes that these later feasts are just as divinely mandated as the spring and summer observances, completing the annual cycle of God''s appointed times for Israel. It reinforces the continuous nature of God''s communication and guidance to His people.',
   NULL),
  (24,
   'Speak unto the children of Israel, saying, In the seventh month, in the first day of the month, shall ye have a sabbath, a memorial of blowing of trumpets, an holy convocation.',
   'דַּבֵּר אֶל־בְּנֵי יִשְׂרָאֵל לֵאמֹר בַּחֹדֶשׁ הַשְּׁבִיעִי בְּאֶחָד לַחֹדֶשׁ יִהְיֶה לָכֶם שַׁבָּתוֹן זִכְרוֹן תְּרוּעָה מִקְרָא־קֹדֶשׁ׃',
   'Dabber el-b''nei Yisra''el lemor bachodesh hash''vi''i b''echad lachodesh yihyeh lakhem shabbaton zikhron t''ru''ah mikra-kodesh.',
   'The first of the autumn feasts is the Feast of Trumpets (זִכְרוֹן תְּרוּעָה, zikhron t''ru''ah), observed on the first day of the seventh month (Tishrei). It is a ''sabbath of rest'' (שַׁבָּתוֹן, shabbaton) and a ''memorial of blowing of trumpets.'' The ''blowing of trumpets'' (תְּרוּעָה, t''ru''ah) likely involved a loud, joyful noise, possibly signaling a new year (Rosh Hashanah in later tradition), calling the people to repentance, or announcing God''s presence and judgment. It served as a solemn prelude to the Day of Atonement.',
   'The Feast of Trumpets, with its call to ''remember'' and its trumpet blasts, is often seen as foreshadowing future eschatological events, particularly the gathering of God''s people and the return of Christ (1 Thess 4:16; Matt 24:31). It calls believers to readiness and anticipation of God''s final work of redemption and judgment.'),
  (25,
   'Ye shall do no servile work therein: but ye shall offer an offering made by fire unto the LORD.',
   'כָּל־מְלֶאכֶת עֲבֹדָה לֹא תַעֲשׂוּ וְהִקְרַבְתֶּם אִשֶּׁה לַיהוָה׃',
   'Kol-melekhet avodah lo ta''asu v''hikravtem isheh la''YHVH.',
   'On the Feast of Trumpets, ''no servile work'' was permitted, reinforcing its status as a holy convocation. Additionally, an ''offering made by fire'' (אִשֶּׁה, isheh) was to be presented to the LORD. While the specific details of this offering are given in Numbers 29:1-6, the general command here emphasizes that even on a day of solemn remembrance and trumpet blasts, active worship through sacrifice was required.',
   NULL),
  (26,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vay''dabber YHVH el-Mosheh lemor.',
   'This phrase again introduces a new and profoundly significant set of instructions, specifically for the Day of Atonement. The repetition underscores the gravity and distinct importance of this particular feast within the annual cycle, setting it apart as a unique and solemn occasion for the entire community of Israel.',
   NULL),
  (27,
   'Also on the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation unto you; and ye shall afflict your souls, and offer an offering made by fire unto the LORD.',
   'אַךְ בֶּעָשׂוֹר לַחֹדֶשׁ הַשְּׁבִיעִי הַזֶּה יוֹם הַכִּפֻּרִים הוּא מִקְרָא־קֹדֶשׁ יִהְיֶה לָכֶם וְעִנִּיתֶם אֶת־נַפְשֹׁתֵיכֶם וְהִקְרַבְתֶּם אִשֶּׁה לַיהוָה׃',
   'Akh ba''asor lachodesh hash''vi''i hazzeh Yom ha''Kippurim hu mikra-kodesh yihyeh lakhem v''innitem et-nafshoteikhem v''hikravtem isheh la''YHVH.',
   'The tenth day of the seventh month is the Day of Atonement (יוֹם הַכִּפֻּרִים, Yom ha''Kippurim), the holiest day of the Israelite calendar. It is a ''holy convocation'' requiring the people to ''afflict your souls'' (וְעִנִּיתֶם אֶת־נַפְשֹׁתֵיכֶם, v''innitem et-nafshoteikhem), typically understood as fasting and repentance. This day was for national atonement for all sins committed throughout the year, culminating the High Priest''s unique entry into the Most Holy Place (Lev 16).',
   'The Day of Atonement is the clearest Old Testament type of Christ''s atoning work. The High Priest''s sacrifice and entry into the Most Holy Place foreshadowed Jesus, our Great High Priest, who entered the heavenly sanctuary once for all with His own blood, securing eternal redemption (Heb 9:11-14, 24-28). The ''affliction of souls'' emphasizes the human response of repentance to God''s provision for sin.'),
  (28,
   'And ye shall do no work in that same day: for it is a day of atonement, to make an atonement for you before the LORD your God.',
   'וְכָל־מְלָאכָה לֹא תַעֲשׂוּ בְּעֶצֶם הַיּוֹם הַזֶּה כִּי יוֹם כִּפֻּרִים הוּא לְכַפֵּר עֲלֵיכֶם לִפְנֵי יְהוָה אֱלֹהֵיכֶם׃',
   'V''khol-m''lakhah lo ta''asu b''etzem hayom hazzeh ki Yom Kippurim hu l''khapper aleikhem lifnei YHVH Eloheikhem.',
   'On the Day of Atonement, ''no work'' (מְלָאכָה, m''lakhah) of any kind was permitted, a stricter prohibition than ''servile work.'' This absolute cessation from labor underscored the solemnity and gravity of the day, allowing the entire nation to focus solely on the process of atonement. The purpose is explicitly stated: ''to make an atonement for you before the LORD your God,'' highlighting the divine initiative and provision for reconciliation.',
   'The complete cessation from work on Yom Kippur signifies that atonement is God''s work, not man''s. Human effort cannot achieve reconciliation with God; it must be provided by divine grace through sacrifice. This points to Christ''s finished work on the cross, which fully atones for sin, requiring no further human ''work'' for salvation (Eph 2:8-9).'),
  (29,
   'For whatsoever soul it be that shall not be afflicted in that same day, he shall be cut off from among his people.',
   'כִּי כָל־הַנֶּפֶשׁ אֲשֶׁר לֹא־תְעֻנֶּה בְּעֶצֶם הַיּוֹם הַזֶּה וְנִכְרְתָה מֵעַמֶּיהָ׃',
   'Ki khol-hannefesh asher lo-t''unneh b''etzem hayom hazzeh v''nikhr''tah me''ammeha.',
   'The consequences for failing to ''afflict one''s soul'' on the Day of Atonement were severe: ''he shall be cut off from among his people'' (וְנִכְרְתָה מֵעַמֶּיהָ, v''nikhr''tah me''ammeha). This penalty, often interpreted as excommunication or even divine judgment leading to premature death, underscores the absolute necessity of participating in the national act of repentance and atonement. It highlights the corporate responsibility and the individual''s accountability within the covenant community.',
   'This severe consequence emphasizes the gravity of sin and the necessity of responding to God''s provision for atonement. It illustrates that rejection of God''s appointed means of grace leads to separation from His people and His blessings. Spiritually, those who reject Christ''s atonement remain ''cut off'' from God''s covenant family.'),
  (30,
   'And whatsoever soul it be that doeth any work in that same day, the same soul will I destroy from among his people.',
   'וְכָל־הַנֶּפֶשׁ אֲשֶׁר תַּעֲשֶׂה כָּל־מְלָאכָה בְּעֶצֶם הַיּוֹם הַזֶּה וְהַאֲבַדְתִּי אֶת־הַנֶּפֶשׁ הַהִוא מִקֶּרֶב עַמָּהּ׃',
   'V''khol-hannefesh asher ta''aseh kol-m''lakhah b''etzem hayom hazzeh v''ha''avadti et-hannefesh hahi mikerev ammah.',
   'Similarly, anyone who performed ''any work'' on the Day of Atonement would be divinely punished: ''the same soul will I destroy from among his people.'' This direct divine judgment, even more severe than being ''cut off,'' reinforces the absolute sanctity of Yom Kippur and the seriousness of violating its commands. It demonstrates God''s unwavering commitment to the purity and holiness of His covenant people and the sacredness of the atonement process.',
   NULL),
  (31,
   'Ye shall do no manner of work: it shall be a statute for ever throughout your generations in all your dwellings.',
   'כָּל־מְלָאכָה לֹא תַעֲשׂוּ חֻקַּת עוֹלָם לְדֹרֹתֵיכֶם בְּכֹל מֹשְׁבֹתֵיכֶם׃',
   'Kol-m''lakhah lo ta''asu chukkat olam l''doroteikhem b''khol mosh''voteikhem.',
   'The prohibition against ''any manner of work'' on the Day of Atonement is reiterated and declared a ''statute for ever'' (חֻקַּת עוֹלָם, chukkat olam), emphasizing its perpetual and unchanging nature for all generations of Israel. This reinforces the profound and enduring significance of this day as a time of national repentance, atonement, and solemn devotion to the LORD, wherever Israelites might dwell.',
   NULL),
  (32,
   'It shall be unto you a sabbath of rest, and ye shall afflict your souls: in the ninth day of the month at even, from even unto even, shall ye celebrate your sabbath.',
   'שַׁבַּת שַׁבָּתוֹן הִיא לָכֶם וְעִנִּיתֶם אֶת־נַפְשֹׁתֵיכֶם בְּתִשְׁעָה לַחֹדֶשׁ בָּעֶרֶב מֵעֶרֶב עַד־עֶרֶב תִּשְׁבְּתוּ שַׁבַּתְּכֶם׃',
   'Shabbat shabbaton hi lakhem v''innitem et-nafshoteikhem b''tish''ah lachodesh ba''erev me''erev ad-erev tishb''tu shabbatkhem.',
   'The Day of Atonement is specifically called a ''sabbath of rest'' (שַׁבַּת שַׁבָּתוֹן, shabbat shabbaton), reinforcing its solemnity. The command to ''afflict your souls'' (וְעִנִּיתֶם אֶת־נַפְשֹׁתֵיכֶם, v''innitem et-nafshoteikhem) is repeated, and its duration specified: from the evening of the ninth day until the evening of the tenth day. This ''from even unto even'' (מֵעֶרֶב עַד־עֶרֶב, me''erev ad-erev) observance mirrors the weekly Sabbath, emphasizing the complete dedication of this 24-hour period to God and the process of atonement.',
   'The ''from even unto even'' observance of Yom Kippur, like the weekly Sabbath, highlights the biblical understanding of a day beginning at sunset. This complete 24-hour period of ''afflicting the soul'' underscores the totality of repentance and dependence on God''s grace for atonement, a spiritual discipline still practiced by many today.'),
  (33,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vay''dabber YHVH el-Mosheh lemor.',
   'This familiar introductory phrase signals the final major set of instructions in this chapter, detailing the Feast of Tabernacles. It reinforces the divine origin of these commands, ensuring that Israel understood these feasts as integral to their covenant relationship and not merely cultural observances. This final feast concludes the annual cycle of divine appointments.',
   NULL),
  (34,
   'Speak unto the children of Israel, saying, The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto the LORD.',
   'דַּבֵּר אֶל־בְּנֵי יִשְׂרָאֵל לֵאמֹר בַּחֲמִשָּׁה עָשָׂר יוֹם לַחֹדֶשׁ הַשְּׁבִיעִי הַזֶּה חַג הַסֻּכּוֹת שִׁבְעַת יָמִים לַיהוָה׃',
   'Dabber el-b''nei Yisra''el lemor bachamishah asar yom lachodesh hash''vi''i hazzeh Chag ha''Sukkot shiv''at yamim la''YHVH.',
   'The Feast of Tabernacles (חַג הַסֻּכּוֹת, Chag ha''Sukkot), also known as the Feast of Booths, begins on the 15th day of the seventh month and lasts for seven days. This feast commemorates Israel''s forty years of wandering in the wilderness, during which they lived in temporary shelters (סֻכּוֹת, sukkot). It also served as a harvest festival, celebrating the ingathering of the fruit of the land, marking the completion of the agricultural year and giving thanks for God''s provision.',
   'The Feast of Tabernacles, with its focus on temporary dwellings and God''s provision in the wilderness, foreshadows Christ''s incarnation (''tabernacling'' among us, John 1:14) and the believer''s earthly pilgrimage. It also points to the future eschatological ingathering of God''s people and the eternal dwelling of God with humanity (Rev 21:3).'),
  (35,
   'On the first day shall be an holy convocation: ye shall do no servile work therein.',
   'בַּיּוֹם הָרִאשׁוֹן מִקְרָא־קֹדֶשׁ כָּל־מְלֶאכֶת עֲבֹדָה לֹא תַעֲשׂוּ׃',
   'Bayom ha''rishon mikra-kodesh kol-melekhet avodah lo ta''asu.',
   'The first day of the Feast of Tabernacles was designated a ''holy convocation'' (מִקְרָא־קֹדֶשׁ, mikra-kodesh), with the usual prohibition against ''servile work.'' This allowed the people to begin the week-long celebration with focused worship and communal gathering, setting a sacred tone for the entire festival. It emphasized the importance of dedicating the beginning of this joyous feast to the LORD.',
   NULL),
  (36,
   'Seven days ye shall offer an offering made by fire unto the LORD: on the eighth day shall be an holy convocation unto you; and ye shall offer an offering made by fire unto the LORD: it is a solemn assembly; and ye shall do no servile work therein.',
   'שִׁבְעַת יָמִים תַּקְרִיבוּ אִשֶּׁה לַיהוָה בַּיּוֹם הַשְּׁמִינִי מִקְרָא־קֹדֶשׁ יִהְיֶה לָכֶם וְהִקְרַבְתֶּם אִשֶּׁה לַיהוָה עֲצֶרֶת הִוא כָּל־מְלֶאכֶת עֲבֹדָה לֹא תַעֲשׂוּ׃',
   'Shiv''at yamim takrivu isheh la''YHVH bayom hash''mini mikra-kodesh yihyeh lakhem v''hikravtem isheh la''YHVH atzeret hi kol-melekhet avodah lo ta''asu.',
   'Throughout the seven days of Tabernacles, offerings made by fire were to be presented. Uniquely, an ''eighth day'' was also designated a ''holy convocation'' and a ''solemn assembly'' (עֲצֶרֶת, atzeret), also prohibiting ''servile work'' and requiring fire offerings. This eighth day, following the main seven days, served as a concluding assembly, bringing the entire cycle of feasts to a climactic close and emphasizing the enduring nature of God''s covenant with Israel.',
   'The ''eighth day'' of Tabernacles, a solemn assembly, often symbolizes a new beginning or a new creation beyond the cycle of seven. It can be seen as pointing to the eternal state, where God''s people will dwell with Him in perfect fellowship, a theme echoed in the New Testament''s vision of a new heaven and new earth (Rev 21:1-4).'),
  (37,
   'These are the feasts of the LORD, which ye shall proclaim to be holy convocations, to offer an offering made by fire unto the LORD, a burnt offering, and a meat offering, a sacrifice, and drink offerings, every thing upon his day:',
   'אֵלֶּה מוֹעֲדֵי יְהוָה אֲשֶׁר תִּקְרְאוּ אֹתָם מִקְרָאֵי קֹדֶשׁ לְהַקְרִיב אִשֶּׁה לַיהוָה עֹלָה וּמִנְחָה זֶבַח וּנְסָכִים דְּבַר־יוֹם בְּיוֹמוֹ׃',
   'Eileh mo''adei YHVH asher tikre''u otam mikra''ei kodesh l''hakriv isheh la''YHVH olah uminchah zevach un''sakhim d''var-yom b''yomo.',
   'This verse serves as a summary, reiterating that these are ''the feasts of the LORD,'' ''holy convocations,'' primarily for presenting ''offerings made by fire'' (אִשֶּׁה, isheh). It lists the various types of offerings—burnt offerings, grain offerings, sacrifices (peace offerings), and drink offerings—to be made ''every thing upon his day.'' This emphasizes the comprehensive and specific nature of the sacrificial system, integral to each feast and to Israel''s worship.',
   NULL),
  (38,
   'Beside the sabbaths of the LORD, and beside your gifts, and beside all your vows, and beside all your freewill offerings, which ye give unto the LORD.',
   'מִלְּבַד שַׁבְּתֹתֵיכֶם וּמִלְּבַד מַתְּנֹתֵיכֶם וּמִלְּבַד כָּל־נִדְרֵיכֶם וּמִלְּבַד כָּל־נִדְבוֹתֵיכֶם אֲשֶׁר תִּתְּנוּ לַיהוָה׃',
   'Mil''vad shabb''toteikhem umil''vad matt''noteikhem umil''vad kol-nidreikhem umil''vad kol-nidvoteikhem asher titt''nu la''YHVH.',
   'This verse clarifies that the prescribed feast offerings are ''beside'' (מִלְּבַד, mil''vad) the regular weekly Sabbaths and other personal offerings: ''gifts,'' ''vows,'' and ''freewill offerings.'' This distinction highlights that the communal, mandated feast sacrifices were foundational, but individual acts of devotion and generosity were also expected and encouraged. It shows a layered system of worship, encompassing both corporate obligation and personal piety.',
   NULL),
  (39,
   'Also in the fifteenth day of the seventh month, when ye have gathered in the fruit of the land, ye shall keep a feast unto the LORD seven days: on the first day shall be a sabbath, and on the eighth day shall be a sabbath.',
   'אַךְ בַּחֲמִשָּׁה עָשָׂר יוֹם לַחֹדֶשׁ הַשְּׁבִיעִי בְּאָסְפְּכֶם אֶת־תְּבוּאַת הָאָרֶץ תָּחֹגּוּ אֶת־חַג־יְהוָה שִׁבְעַת יָמִים בַּיּוֹם הָרִאשׁוֹן שַׁבָּתוֹן וּבַיּוֹם הַשְּׁמִינִי שַׁבָּתוֹן׃',
   'Akh bachamishah asar yom lachodesh hash''vi''i b''os''p''khem et-t''vu''at ha''aretz tachoggu et-chag-YHVH shiv''at yamim bayom ha''rishon shabbaton uvayom hash''mini shabbaton.',
   'This verse reiterates the timing and duration of the Feast of Tabernacles, specifically linking it to the ''gathering in the fruit of the land'' (בְּאָסְפְּכֶם אֶת־תְּבוּאַת הָאָרֶץ, b''os''p''khem et-t''vu''at ha''aretz). It emphasizes the dual nature of the feast as both a historical commemoration and a harvest festival. Both the first and eighth days are explicitly called a ''sabbath'' (שַׁבָּתוֹן, shabbaton), reinforcing their sacred rest and solemnity within the joyous celebration.',
   NULL),
  (40,
   'And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before the LORD your God seven days.',
   'וּלְקַחְתֶּם לָכֶם בַּיּוֹם הָרִאשׁוֹן פְּרִי עֵץ הָדָר כַּפֹּת תְּמָרִים וַעֲנַף עֵץ־עָבֹת וְעַרְבֵי נָחַל וּשְׂמַחְתֶּם לִפְנֵי יְהוָה אֱלֹהֵיכֶם שִׁבְעַת יָמִים׃',
   'Ul''kachtem lakhem bayom ha''rishon p''ri etz hadar kappot t''marim va''anaf etz-avot v''arvei nachal us''machtem lifnei YHVH Eloheikhem shiv''at yamim.',
   'On the first day of Tabernacles, Israelites were commanded to take ''boughs of goodly trees'' (פְּרִי עֵץ הָדָר, p''ri etz hadar, often identified as citrus), ''branches of palm trees,'' ''boughs of thick trees,'' and ''willows of the brook.'' These were used to construct the booths (sukkah) and were also waved in celebration, symbolizing joy and God''s provision. The command to ''rejoice before the LORD your God seven days'' highlights the festive and joyful nature of this harvest festival, a stark contrast to the solemnity of Yom Kippur.',
   'The command to ''rejoice before the LORD'' emphasizes that worship is not merely ritual but also a joyful expression of gratitude for God''s blessings and faithfulness. The use of natural elements connects the celebration to creation and God''s provision, reminding believers of the joy found in His presence (Ps 16:11).'),
  (41,
   'And ye shall keep it a feast unto the LORD seven days in the year. It shall be a statute for ever in your generations: ye shall celebrate it in the seventh month.',
   'וְחַגֹּתֶם אֹתוֹ חַג לַיהוָה שִׁבְעַת יָמִים בַּשָּׁנָה חֻקַּת עוֹלָם לְדֹרֹתֵיכֶם בַּחֹדֶשׁ הַשְּׁבִיעִי תָּחֹגּוּ אֹתוֹ׃',
   'V''chagotem oto chag la''YHVH shiv''at yamim ba''shanah chukkat olam l''doroteikhem bachodesh hash''vi''i tachoggu oto.',
   'The Feast of Tabernacles is reaffirmed as a ''feast unto the LORD'' to be kept ''seven days in the year,'' specifically in the seventh month. It is again declared a ''statute for ever'' (חֻקַּת עוֹלָם, chukkat olam) for all generations. This repetition emphasizes the enduring importance of this festival as a perpetual reminder of God''s faithfulness, His provision, and His desire for His people to remember their history and rejoice in Him.',
   NULL),
  (42,
   'Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths:',
   'בַּסֻּכֹּת תֵּשְׁבוּ שִׁבְעַת יָמִים כָּל־הָאֶזְרָח בְּיִשְׂרָאֵל יֵשְׁבוּ בַּסֻּכֹּת׃',
   'Ba''sukkot teshvu shiv''at yamim kol-ha''ezrach b''Yisra''el yeshvu ba''sukkot.',
   'The central command for Tabernacles is to ''dwell in booths (סֻכֹּת, sukkot) seven days.'' This was required of ''all that are Israelites born,'' meaning all native-born Israelites. This physical act of living in temporary shelters was a tangible way to reenact and remember their ancestors'' wilderness journey, fostering humility and dependence on God, even amidst the joy of harvest.',
   'Dwelling in temporary booths serves as a powerful reminder of humanity''s transient existence and dependence on God for shelter and provision. It encourages humility and gratitude, pointing believers to their spiritual pilgrimage on earth and the promise of an eternal dwelling place with God (2 Cor 5:1-4; Heb 11:13-16).'),
  (43,
   'That your generations may know that I made the children of Israel to dwell in booths, when I brought them out of the land of Egypt: I am the LORD your God.',
   'לְמַעַן יֵדְעוּ דֹרֹתֵיכֶם כִּי בַסֻּכּוֹת הוֹשַׁבְתִּי אֶת־בְּנֵי יִשְׂרָאֵל בְּהוֹצִיאִי אוֹתָם מֵאֶרֶץ מִצְרָיִם אֲנִי יְהוָה אֱלֹהֵיכֶם׃',
   'L''ma''an yeid''u doroteikhem ki va''sukkot hoshvti et-b''nei Yisra''el b''hotzi''i otam me''eretz Mitzrayim ani YHVH Eloheikhem.',
   'The explicit purpose of dwelling in booths is ''That your generations may know'' (לְמַעַן יֵדְעוּ דֹרֹתֵיכֶם, l''ma''an yeid''u doroteikhem) that God made the children of Israel dwell in booths during the Exodus. This pedagogical purpose highlights the importance of historical memory and intergenerational transmission of faith. It grounds the celebration in God''s past redemptive acts, reminding them of His faithfulness and their identity as His delivered people, concluding with the self-attestation, ''I am the LORD your God.''',
   'This verse underscores the importance of remembering God''s past faithfulness as a foundation for present trust and future hope. The historical remembrance of the Exodus and wilderness journey teaches dependence on God and reinforces His covenant identity as ''the LORD your God,'' who delivers and sustains His people. This principle applies to Christian remembrance of Christ''s work.'),
  (44,
   'And Moses declared unto the children of Israel the feasts of the LORD.',
   'וַיְדַבֵּר מֹשֶׁה אֶת־מוֹעֲדֵי יְהוָה אֶל־בְּנֵי יִשְׂרָאֵל׃',
   'Vay''dabber Mosheh et-mo''adei YHVH el-b''nei Yisra''el.',
   'This concluding verse signifies the completion of the divine instruction and Moses'' faithful transmission of these commands to the children of Israel. It emphasizes Moses'' role as the mediator of the covenant and the authoritative nature of the feasts as ''the feasts of the LORD.'' This act of declaration ensures that the people were fully informed of their sacred duties and the divine calendar for their worship.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23;

-- Step 3: Word Studies for key verses

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('שַׁבָּת', 'shabbat', 'H7676', 'From the root שָׁבַת (shavat), meaning ''to cease, desist, rest.'' ''Shabbat'' refers to the Sabbath day, a day of complete cessation from work and a holy rest. Theologically, it signifies God''s creative rest (Gen 2:2-3) and His provision of rest for His people, serving as a perpetual sign of the covenant and a reminder of deliverance from bondage (Exod 31:13-17; Deut 5:15). It anticipates the ultimate rest in Christ.', 1),
  ('מְלָאכָה', 'mela''khah', 'H4399', 'Meaning ''work, occupation, business, craftsmanship.'' In the context of the Sabbath and holy days, it refers to any ordinary, creative, or gainful labor that sustains daily life. The prohibition of ''mela''khah'' on sacred days emphasizes setting aside worldly pursuits to focus on spiritual matters and communion with God, recognizing His sovereignty over all human endeavors.', 2),
  ('מִקְרָא־קֹדֶשׁ', 'mikra-kodesh', 'H4744 H6944', 'A compound term: ''mikra'' (מִקְרָא) from קָרָא (qara'') ''to call, proclaim,'' meaning ''a calling, convocation, reading.'' ''Kodesh'' (קֹדֶשׁ) means ''holiness, sacredness.'' Together, ''mikra-kodesh'' means ''holy convocation'' or ''sacred assembly.'' It designates a divinely appointed time for the community to gather for worship, instruction, and remembrance, set apart from ordinary life for sacred purposes.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23 AND v.verse_number = 3;

-- Verse 5
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('פֶּסַח', 'pesach', 'H6453', 'From the root פָּסַח (pasach), meaning ''to pass over, spare.'' ''Pesach'' refers to the Passover, the central feast commemorating God''s deliverance of Israel from Egyptian bondage, specifically the night when the angel of death ''passed over'' the blood-marked homes. Theologically, it prefigures Christ as the ultimate Passover Lamb whose sacrifice provides redemption from sin (1 Cor 5:7).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23 AND v.verse_number = 5;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('בִּכּוּרִים', 'bikkurim', 'H1061', 'From בָּכַר (bakhar), ''to be first-born, to bring forth first-fruits.'' ''Bikkurim'' refers to the ''firstfruits'' of the harvest. This offering acknowledged God as the ultimate provider of all bounty and consecrated the entire harvest to Him. Theologically, it symbolizes God''s ownership of all things and the principle of honoring Him with the first and best. It prophetically points to Christ as the ''firstfruits'' of the resurrection (1 Cor 15:20).', 1),
  ('עֹמֶר', 'omer', 'H6016', 'Meaning ''a sheaf'' or ''a measure.'' In this context, it refers to a sheaf of newly reaped grain, specifically barley, which was waved before the LORD as the firstfruits offering. This physical representation of the earliest harvest was a tangible act of faith, trusting God for the full harvest yet to come. It was a specific measure of grain, about 2.2 liters.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23 AND v.verse_number = 10;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('שָׁבֻעוֹת', 'shavu''ot', 'H7664', 'The plural of שָׁבוּעַ (shavu''a), meaning ''week'' or ''seven.'' ''Shavu''ot'' refers to the Feast of Weeks, celebrated fifty days (seven weeks) after the Feast of Firstfruits. It commemorates the giving of the Law at Sinai and marks the completion of the grain harvest. Theologically, it foreshadows the outpouring of the Holy Spirit at Pentecost, inaugurating the Church (Acts 2).', 1),
  ('מִנְחָה', 'minchah', 'H4503', 'Meaning ''gift, tribute, offering.'' In the sacrificial system, it often refers to a ''grain offering'' or ''meat offering'' (KJV). It was typically made of flour, oil, and frankincense, symbolizing dedication and thanksgiving. The ''new minchah'' at Shavu''ot represented the new grain harvest, a fresh act of gratitude for God''s provision.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23 AND v.verse_number = 16;

-- Verse 27
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('כִּפֻּרִים', 'kippurim', 'H3725', 'From the root כָּפַר (kaphar), ''to cover, to atone.'' ''Kippurim'' refers to the Day of Atonement, the most solemn day of the Israelite calendar, when national atonement was made for all sins. Theologically, it is the clearest Old Testament type of Christ''s perfect and final atonement for sin through His sacrifice on the cross, providing reconciliation with God (Heb 9:11-14).', 1),
  ('עִנִּיתֶם', 'innitem', 'H6031', 'From the root עָנָה (anah), meaning ''to humble, afflict, oppress.'' In the context of Yom Kippur, ''innitem et-nafshoteikhem'' means ''you shall afflict your souls,'' primarily understood as fasting. This act of self-denial and humility was a physical manifestation of repentance and sorrow for sin, demonstrating a sincere desire for God''s forgiveness and a recognition of one''s dependence on His grace.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23 AND v.verse_number = 27;

-- Verse 34
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('סֻכּוֹת', 'sukkot', 'H5521', 'Plural of סֻכָּה (sukkah), meaning ''booth, tabernacle, temporary shelter.'' ''Sukkot'' refers to the Feast of Tabernacles (or Booths), commemorating Israel''s dwelling in temporary shelters during their wilderness wanderings. It also served as a harvest festival. Theologically, it reminds of God''s provision and protection during pilgrimage and foreshadows Christ''s ''tabernacling'' among humanity (John 1:14) and the ultimate dwelling of God with His people (Rev 21:3).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23 AND v.verse_number = 34;

-- Verse 40
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('שְׂמַחְתֶּם', 's''machtem', 'H8055', 'From the root שָׂמַח (samach), meaning ''to rejoice, be glad.'' The command ''us''machtem'' (and you shall rejoice) highlights the joyful and celebratory nature of the Feast of Tabernacles. This joy was not merely human merriment but a commanded expression of gratitude and delight in God''s faithfulness, provision, and presence, especially after the solemnity of Yom Kippur. It emphasizes worship as a joyful experience.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23 AND v.verse_number = 40;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Exodus 6:10', 1),
  (1, 'Leviticus 1:1', 2),
  (1, 'Numbers 1:1', 3),
  (2, 'Exodus 23:14-17', 1),
  (2, 'Leviticus 23:4', 2),
  (2, 'Numbers 28:1-29:40', 3),
  (2, 'Deuteronomy 16:1-17', 4),
  (3, 'Genesis 2:2-3', 1),
  (3, 'Exodus 20:8-11', 2),
  (3, 'Exodus 31:12-17', 3),
  (3, 'Deuteronomy 5:12-15', 4),
  (3, 'Hebrews 4:9-10', 5),
  (4, 'Leviticus 23:2', 1),
  (4, 'Numbers 9:2-3', 2),
  (4, 'Deuteronomy 16:1', 3),
  (5, 'Exodus 12:6-14', 1),
  (5, 'Numbers 9:1-5', 2),
  (5, 'Deuteronomy 16:1-2', 3),
  (5, '1 Corinthians 5:7', 4),
  (6, 'Exodus 12:15-20', 1),
  (6, 'Exodus 13:6-7', 2),
  (6, 'Numbers 28:17-25', 3),
  (6, 'Deuteronomy 16:3-8', 4),
  (7, 'Exodus 12:16', 1),
  (7, 'Leviticus 23:8', 2),
  (7, 'Numbers 28:18', 3),
  (8, 'Exodus 12:16', 1),
  (8, 'Numbers 28:19-25', 2),
  (9, 'Leviticus 1:1', 1),
  (9, 'Numbers 15:17-21', 2),
  (10, 'Exodus 23:16', 1),
  (10, 'Exodus 34:22', 2),
  (10, 'Deuteronomy 16:9', 3),
  (10, 'Romans 11:16', 4),
  (11, 'Joshua 5:11', 1),
  (11, '1 Corinthians 15:20', 2),
  (11, 'Romans 8:23', 3),
  (12, 'Numbers 28:11-14', 1),
  (12, 'Leviticus 1:10', 2),
  (13, 'Leviticus 2:1', 1),
  (13, 'Numbers 15:4-10', 2),
  (13, 'Exodus 29:40', 3),
  (14, 'Deuteronomy 12:17', 1),
  (14, 'Proverbs 3:9-10', 2),
  (14, 'Romans 11:16', 3),
  (15, 'Exodus 34:22', 1),
  (15, 'Deuteronomy 16:9-10', 2),
  (16, 'Acts 2:1-4', 1),
  (16, 'Exodus 19:1', 2),
  (16, 'Numbers 28:26', 3),
  (17, 'Exodus 23:16', 1),
  (17, 'Numbers 15:20', 2),
  (17, 'Romans 11:16', 3),
  (18, 'Numbers 28:27-29', 1),
  (18, 'Leviticus 1:3-9', 2),
  (19, 'Leviticus 4:23', 1),
  (19, 'Leviticus 3:1-5', 2),
  (19, 'Numbers 28:30', 3),
  (20, 'Numbers 18:11', 1),
  (20, 'Deuteronomy 18:4', 2),
  (21, 'Leviticus 23:31', 1),
  (21, 'Numbers 28:26', 2),
  (22, 'Leviticus 19:9-10', 1),
  (22, 'Deuteronomy 24:19-22', 2),
  (22, 'Ruth 2:3-7', 3),
  (23, 'Leviticus 1:1', 1),
  (23, 'Numbers 29:1', 2),
  (24, 'Numbers 29:1-6', 1),
  (24, 'Psalm 81:3-4', 2),
  (24, '1 Thessalonians 4:16', 3),
  (25, 'Numbers 29:2-6', 1),
  (26, 'Leviticus 1:1', 1),
  (26, 'Numbers 29:7', 2),
  (27, 'Leviticus 16:29-34', 1),
  (27, 'Numbers 29:7-11', 2),
  (27, 'Isaiah 58:3-5', 3),
  (27, 'Hebrews 9:7-14', 4),
  (28, 'Leviticus 16:30', 1),
  (28, 'Numbers 29:7', 2),
  (29, 'Leviticus 17:10', 1),
  (29, 'Genesis 17:14', 2),
  (30, 'Leviticus 20:3-6', 1),
  (30, 'Exodus 31:14', 2),
  (31, 'Leviticus 23:21', 1),
  (31, 'Leviticus 16:31', 2),
  (32, 'Exodus 12:18', 1),
  (32, 'Nehemiah 9:1', 2),
  (33, 'Leviticus 1:1', 1),
  (33, 'Numbers 29:12', 2),
  (34, 'Exodus 23:16', 1),
  (34, 'Numbers 29:12-38', 2),
  (34, 'Deuteronomy 16:13-15', 3),
  (34, 'John 7:2', 4),
  (35, 'Numbers 29:12', 1),
  (36, 'Numbers 29:35-38', 1),
  (36, 'John 7:37-38', 2),
  (37, 'Leviticus 23:2', 1),
  (37, 'Numbers 28:1-29:40', 2),
  (38, 'Numbers 29:39', 1),
  (38, 'Leviticus 7:16', 2),
  (38, 'Deuteronomy 12:6', 3),
  (39, 'Deuteronomy 16:13', 1),
  (39, 'Exodus 23:16', 2),
  (40, 'Nehemiah 8:15', 1),
  (40, 'Psalm 118:27', 2),
  (40, 'Revelation 7:9', 3),
  (41, 'Leviticus 23:34', 1),
  (41, 'Deuteronomy 16:13', 2),
  (42, 'Nehemiah 8:14-17', 1),
  (43, 'Exodus 12:17', 1),
  (43, 'Deuteronomy 6:20-25', 2),
  (44, 'Leviticus 23:2', 1),
  (44, 'Deuteronomy 16:16', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 23 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Leviticus Chapter 23 Complete!
-- 44 verses · 7 key verses with word studies (12 words)
-- Cross-references for 44 verses (113 refs)
-- ═══════════════════════════════════════════════════════