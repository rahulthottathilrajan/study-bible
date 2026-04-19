-- ═══════════════════════════════════════════════════════
-- LEVITICUS CHAPTER 24 — Tabernacle Ordinances, Blasphemy, and Impartial Justice
-- 23 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 24,
  'Leviticus 24 is a pivotal chapter that juxtaposes two distinct yet interconnected themes: the meticulous regulations for the Tabernacle''s perpetual services and the severe consequences of blasphemy, culminating in the principle of ''lex talionis'' or ''eye for an eye.'' The chapter begins by detailing the requirements for the continual lamp oil and the Bread of the Presence, emphasizing God''s desire for sustained worship and communion. These rituals underscore the holiness of God and the need for Israel to maintain a sacred space and practice. The narrative then shifts dramatically to a legal case involving a man who blasphemes the Lord''s name, highlighting the gravity of disrespecting God''s holy character. This incident serves as the catalyst for establishing a universal law against blasphemy, applicable to both native-born Israelites and resident aliens, reinforcing the absolute sovereignty and holiness of YHWH. The chapter concludes by broadening this principle of equitable justice to other offenses, such as murder and bodily harm, ensuring that justice is administered impartially across the community. The chapter thus weaves together themes of worship, holiness, justice, and the sanctity of God''s name, demonstrating how proper reverence for God is foundational to a just and ordered society.',
  'Tabernacle Ordinances, Blasphemy, and Impartial Justice',
  'שֵׁם (shem)',
  'The Hebrew word ''shem'' means ''name,'' but in a biblical context, it often signifies the essence, character, and authority of a person, especially God. To ''blaspheme the name'' (v. 11, 16) is not merely to utter a word, but to revile God''s very being, His reputation, and His revealed character, which is considered a direct assault on His holiness and sovereignty, meriting the severest penalty.',
  '["Section 1 (vv.1-4): The Perpetual Lamp in the Tabernacle","Section 2 (vv.5-9): The Bread of the Presence and its Regulations","Section 3 (vv.10-16): The Case of the Blasphemer and the Law Against Blasphemy","Section 4 (vv.17-22): Laws of Retribution and Impartial Justice","Section 5 (v.23): Execution of the Blasphemer"]'
FROM books b WHERE b.name = 'Leviticus';

-- Step 2: Insert all 23 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vaydabber YHVH el-Mosheh lemor.',
   'This introductory phrase, ''And the LORD spake unto Moses, saying,'' is a common formula in the Pentateuch, signaling a divine command or instruction. It emphasizes the direct, authoritative origin of the laws that follow, establishing Moses as the mediator of God''s will to the Israelite community. The divine communication underscores the sacredness and binding nature of the subsequent ordinances, both for the Tabernacle service and for civil justice.',
   NULL),
  (2,
   'Command the children of Israel, that they bring unto thee pure oil olive beaten for the light, to cause the lamps to burn continually.',
   'צַו אֶת־בְּנֵי יִשְׂרָאֵל וְיִקְחוּ אֵלֶיךָ שֶׁמֶן זַיִת זָךְ כָּתִית לַמָּאוֹר לְהַעֲלֹת נֵר תָּמִיד׃',
   'Tzav et-b''nei Yisra''el v''yikchu eilekha shemen zayit zakh katit lama''or l''ha''alot ner tamid.',
   'The command for ''pure oil olive beaten'' (שֶׁמֶן זַיִת זָךְ כָּתִית, *shemen zayit zakh katit*) specifies the highest quality oil, obtained from olives that were crushed, not pressed, to ensure purity. This oil was for the ''light'' (לַמָּאוֹר, *lama''or*) of the menorah, which was to burn ''continually'' (תָּמִיד, *tamid*). This perpetual light symbolized God''s constant presence and the ongoing spiritual illumination He provides to His people, a theme echoed in later scripture (John 8:12).',
   'The perpetual light of the menorah symbolizes God''s unceasing presence and the continuous spiritual illumination He offers. It foreshadows Christ as the ''Light of the World'' (John 8:12), whose presence and truth perpetually guide believers. The requirement for ''pure'' oil emphasizes the need for unblemished devotion and worship in approaching God.'),
  (3,
   'Without the vail of the testimony, in the tabernacle of the congregation, shall Aaron order it from the evening unto the morning before the LORD continually: it shall be a statute for ever in your generations.',
   'מִחוּץ לְפָרֹכֶת הָעֵדֻת בְּאֹהֶל מוֹעֵד יַעֲרֹךְ אֹתוֹ אַהֲרֹן מֵעֶרֶב עַד־בֹּקֶר לִפְנֵי יְהוָה תָּמִיד חֻקַּת עוֹלָם לְדֹרֹתֵיכֶם׃',
   'Michutz l''pharokhet ha''edut b''ohel mo''ed ya''arokh oto Aharon me''erev ad-boker lifnei YHVH tamid chukkat olam l''doroteikhem.',
   'Aaron was to ''order it'' (יַעֲרֹךְ אֹתוֹ, *ya''arokh oto*)—meaning to tend the lamps—''without the vail of the testimony'' (מִחוּץ לְפָרֹכֶת הָעֵדֻת, *michutz l''pharokhet ha''edut*), placing it in the Holy Place of the Tabernacle, not the Most Holy Place. This service was to be performed ''from the evening unto the morning'' (מֵעֶרֶב עַד־בֹּקֶר, *me''erev ad-boker*) ''continually'' (תָּמִיד, *tamid*), signifying an unbroken commitment. The phrase ''a statute for ever in your generations'' (חֻקַּת עוֹלָם לְדֹרֹתֵיכֶם, *chukkat olam l''doroteikhem*) underscores the enduring nature of this divine command.',
   'The perpetual tending of the lamps by Aaron signifies the ongoing priestly ministry required to maintain God''s presence among His people. This ''statute for ever'' points to the eternal nature of God''s covenant and the unending intercession of Christ, our High Priest, who continually ministers on our behalf (Heb 7:24-25).'),
  (4,
   'He shall order the lamps upon the pure candlestick before the LORD continually.',
   'עַל־הַמְּנֹרָה הַטְּהֹרָה יַעֲרֹךְ אֶת־הַנֵּרוֹת לִפְנֵי יְהוָה תָּמִיד׃',
   'Al-ham''norah hat''horah ya''arokh et-hanerot lifnei YHVH tamid.',
   'This verse reiterates the command for Aaron to arrange the lamps ''upon the pure candlestick'' (עַל־הַמְּנֹרָה הַטְּהֹרָה, *al-ham''norah hat''horah*) ''before the LORD continually'' (לִפְנֵי יְהוָה תָּמִיד, *lifnei YHVH tamid*). The menorah, a symbol of divine light and presence, was to be kept in perfect order, reflecting the holiness and perfection required in God''s service. The repetition of ''continually'' emphasizes the unbroken nature of this sacred duty.',
   NULL),
  (5,
   'And thou shalt take fine flour, and bake twelve cakes thereof: two tenth deals shall be in one cake.',
   'וְלָקַחְתָּ סֹלֶת וְאָפִיתָ אֹתָהּ שְׁתֵּים עֶשְׂרֵה חַלּוֹת שְׁנֵי עֶשְׂרֹנִים יִהְיֶה הַחַלָּה הָאֶחָת׃',
   'V''lakachta solet v''afita otah shteim esreh challot shnei esronim yihyeh hachallah ha''echat.',
   'The instructions shift to the ''shewbread'' or ''Bread of the Presence.'' Moses is commanded to take ''fine flour'' (סֹלֶת, *solet*) and bake ''twelve cakes'' (שְׁתֵּים עֶשְׂרֵה חַלּוֹת, *shteim esreh challot*). Each cake was to contain ''two tenth deals'' (שְׁנֵי עֶשְׂרֹנִים, *shnei esronim*), or two-tenths of an ephah, which is approximately 4.4 liters of flour. The number twelve represented the twelve tribes of Israel, symbolizing their perpetual presence before God.',
   NULL),
  (6,
   'And thou shalt set them in two rows, six on a row, upon the pure table before the LORD.',
   'וְשַׂמְתָּ אוֹתָם שְׁתֵּי מַעֲרָכוֹת שֵׁשׁ הַמַּעֲרָכֶת הָאֶחָת עַל הַשֻּׁלְחָן הַטָּהֹר לִפְנֵי יְהוָה׃',
   'V''samta otam shtei ma''arakhot shesh hama''arakhet ha''echat al hashulchan hatahor lifnei YHVH.',
   'The twelve cakes were to be arranged in ''two rows, six on a row'' (שְׁתֵּי מַעֲרָכוֹת שֵׁשׁ הַמַּעֲרָכֶת הָאֶחָת, *shtei ma''arakhot shesh hama''arakhet ha''echat*) upon ''the pure table'' (הַשֻּׁלְחָן הַטָּהֹר, *hashulchan hatahor*) ''before the LORD'' (לִפְנֵי יְהוָה, *lifnei YHVH*). This arrangement in the Holy Place symbolized Israel''s constant communion and covenant relationship with God, whose presence was manifested in the Tabernacle. The ''pure table'' itself emphasized the holiness required in God''s service.',
   NULL),
  (7,
   'And thou shalt put pure frankincense upon each row, that it may be on the bread for a memorial, even an offering made by fire unto the LORD.',
   'וְנָתַתָּ עַל־הַמַּעֲרֶכֶת אֵת לְבֹנָה זַכָּה וְהָיְתָה לַלֶּחֶם לְאַזְכָּרָה אִשֶּׁה לַיהוָה׃',
   'V''natata al-hama''arekhet et l''vonah zakkah v''haytah lallechem l''azkarah isheh laYHVH.',
   'Pure frankincense (לְבֹנָה זַכָּה, *levonah zakkah*) was to be placed on each row of bread. This frankincense served as a ''memorial'' (לְאַזְכָּרָה, *l''azkarah*), a reminder before God, and was an ''offering made by fire unto the LORD'' (אִשֶּׁה לַיהוָה, *isheh laYHVH*). While the bread itself was not burned, the frankincense was, symbolizing the ascending prayers and devotion of Israel, and God''s acceptance of their offering. The memorial aspect highlights God''s remembrance of His covenant people.',
   'The frankincense as a ''memorial'' and ''offering made by fire'' signifies the ascending prayers and worship of God''s people, accepted by Him. It foreshadows the spiritual sacrifices of praise and thanksgiving offered by believers (Heb 13:15), and the intercession of Christ, whose perfect offering makes our worship acceptable to God.'),
  (8,
   'Every sabbath he shall set it in order before the LORD continually, being taken from the children of Israel by an everlasting covenant.',
   'בְּיוֹם הַשַּׁבָּת בְּיוֹם הַשַּׁבָּת יַעַרְכֶנּוּ לִפְנֵי יְהוָה תָּמִיד מֵאֵת בְּנֵי יִשְׂרָאֵל בְּרִית עוֹלָם׃',
   'B''yom hashabbat b''yom hashabbat ya''arkennu lifnei YHVH tamid me''et b''nei Yisra''el b''rit olam.',
   'The bread was to be set in order ''every sabbath'' (בְּיוֹם הַשַּׁבָּת בְּיוֹם הַשַּׁבָּת, *b''yom hashabbat b''yom hashabbat*), emphasizing the weekly renewal of this ritual. It was a ''continual'' (תָּמִיד, *tamid*) offering ''from the children of Israel by an everlasting covenant'' (מֵאֵת בְּנֵי יִשְׂרָאֵל בְּרִית עוֹלָם, *me''et b''nei Yisra''el b''rit olam*). This highlights the Sabbath''s role in covenant renewal and the enduring nature of God''s relationship with Israel, maintained through their obedience to His commands.',
   NULL),
  (9,
   'And it shall be Aaron’s and his sons’; and they shall eat it in the holy place: for it is most holy unto him of the offerings of the LORD made by fire by a perpetual statute.',
   'וְהָיְתָה לְאַהֲרֹן וּלְבָנָיו וַאֲכָלֻהוּ בְּמָקוֹם קָדֹשׁ כִּי קֹדֶשׁ קָדָשִׁים הוּא לוֹ מֵאִשֵּׁי יְהוָה חֻקַּת עוֹלָם׃',
   'V''haytah l''Aharon ul''vanav va''akhaluhu b''makom kadosh ki kodesh kodashim hu lo me''ishei YHVH chukkat olam.',
   'The bread, after being presented for a week, became the portion of Aaron and his sons, who were to eat it ''in the holy place'' (בְּמָקוֹם קָדֹשׁ, *b''makom kadosh*). It is designated ''most holy'' (קֹדֶשׁ קָדָשִׁים, *kodesh kodashim*) from the offerings of the LORD made by fire, indicating its extreme sanctity. This priestly consumption symbolized their participation in the covenant and their sustenance from God''s provision, reinforcing their unique role as mediators. This was also a ''perpetual statute'' (חֻקַּת עוֹלָם, *chukkat olam*).',
   'The ''most holy'' bread consumed by the priests signifies their unique access to God''s provision and their role in mediating His presence. This foreshadows the spiritual nourishment believers receive through Christ, the ''Bread of Life'' (John 6:35), and the communion we share with Him in the ''holy place'' of His presence.'),
  (10,
   'And the son of an Israelitish woman, whose father was an Egyptian, went out among the children of Israel: and this son of the Israelitish woman and a man of Israel strove together in the camp;',
   'וַיֵּצֵא בֶּן־אִשָּׁה יִשְׂרְאֵלִית וְהוּא בֶּן־אִישׁ מִצְרִי בְּתוֹךְ בְּנֵי יִשְׂרָאֵל וַיִּנָּצוּ בַּמַּחֲנֶה בֶּן הַיִּשְׂרְאֵלִית וְאִישׁ הַיִּשְׂרְאֵלִי׃',
   'Vayetzei ven-ishah Yisra''elit v''hu ven-ish Mitzri b''tokh b''nei Yisra''el vayinnatzu bammachaneh ven hayisra''elit v''ish hayisra''eli.',
   'This verse introduces a dramatic shift from ritual law to a legal narrative. A man, the son of an Israelitish woman and an Egyptian father, ''went out'' (וַיֵּצֵא, *vayetzei*) among the Israelites. This mixed parentage is significant, as it highlights the potential for cultural and religious tension within the camp. He ''strove together'' (וַיִּנָּצוּ, *vayinnatzu*) with an Israelite man, leading to a conflict that would have profound legal implications for the community.',
   NULL),
  (11,
   'And the Israelitish woman’s son blasphemed the name of the Lord, and cursed. And they brought him unto Moses: (and his mother’s name was Shelomith, the daughter of Dibri, of the tribe of Dan:)',
   'וַיִּקֹּב בֶּן־הָאִשָּׁה הַיִּשְׂרְאֵלִית אֶת־הַשֵּׁם וַיְקַלֵּל וַיָּבִיאוּ אֹתוֹ אֶל־מֹשֶׁה וְשֵׁם אִמּוֹ שְׁלֹמִית בַּת־דִּבְרִי לְמַטֵּה־דָן׃',
   'Vayikkob ben-ha''ishah hayisra''elit et-hashem vaykallel vayyavi''u oto el-Mosheh v''shem immo Shlomit bat-Divri l''matteh-Dan.',
   'During the dispute, the son of the Israelitish woman ''blasphemed the name of the Lord, and cursed'' (וַיִּקֹּב בֶּן־הָאִשָּׁה הַיִּשְׂרְאֵלִית אֶת־הַשֵּׁם וַיְקַלֵּל, *vayikkob ben-ha''ishah hayisra''elit et-hashem vaykallel*). The verb ''vayikkob'' (נָקַב) can mean ''to pierce'' or ''to specify,'' here implying to pronounce or utter the divine name with contempt. This act was a profound offense against God''s holiness. The mention of his mother, Shelomith, daughter of Dibri, of the tribe of Dan, provides specific detail, perhaps to emphasize the public nature of the offense and the need for a clear legal precedent.',
   'Blasphemy against ''the Name'' of the Lord is a direct assault on God''s character and authority, revealing a heart of rebellion. This incident underscores the absolute reverence due to God''s holy name, reflecting His ultimate sovereignty and the severe consequences for those who profane it (Exod 20:7).'),
  (12,
   'And they put him in ward, that the mind of the LORD might be shewed them.',
   'וַיַּנִּיחוּ אֹתוֹ בַּמִּשְׁמָר לִפְרֹשׁ עֲלֵיהֶם עַל־פִּי יְהוָה׃',
   'Vayannichu oto bammishmar lifrosh aleihem al-pi YHVH.',
   'The community, uncertain of the appropriate punishment for such a grave offense, placed the blasphemer ''in ward'' (בַּמִּשְׁמָר, *bammishmar*), or custody. This temporary detention was to allow time for Moses to inquire of the Lord, ''that the mind of the LORD might be shewed them'' (לִפְרֹשׁ עֲלֵיהֶם עַל־פִּי יְהוָה, *lifrosh aleihem al-pi YHVH*). This demonstrates the Israelites'' reliance on divine revelation for judicial matters, especially when existing laws did not explicitly cover a particular transgression.',
   NULL),
  (13,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vaydabber YHVH el-Mosheh lemor.',
   'This repeated formula, ''And the LORD spake unto Moses, saying,'' signals the divine response to the legal dilemma presented in the previous verses. It emphasizes that the judgment and subsequent laws are not human inventions but direct commands from God, carrying ultimate authority and establishing a precedent for future cases.',
   NULL),
  (14,
   'Bring forth him that hath cursed without the camp; and let all that heard him lay their hands upon his head, and let all the congregation stone him.',
   'הוֹצֵא אֶת־הַמְקַלֵּל אֶל־מִחוּץ לַמַּחֲנֶה וְסָמְכוּ כָל־הַשֹּׁמְעִים אֶת־יְדֵיהֶם עַל־רֹאשׁוֹ וְרָגְמוּ אֹתוֹ כָּל־הָעֵדָה אָבֶן׃',
   'Hotzei et-ham''kallel el-michutz lammachaneh v''samkhu kol-hashom''im et-yedeihem al-rosho v''rag''mu oto kol-ha''edah aven.',
   'The Lord''s command is clear and severe: the blasphemer is to be brought ''without the camp'' (אֶל־מִחוּץ לַמַּחֲנֶה, *el-michutz lammachaneh*), symbolizing his expulsion from the holy community. ''All that heard him'' (כָל־הַשֹּׁמְעִים, *kol-hashom''im*) were to lay their hands on his head, a symbolic act of transferring the guilt of the sin onto the offender, and then ''all the congregation'' (כָּל־הָעֵדָה, *kol-ha''edah*) was to stone him. This communal execution underscored the gravity of the offense against God and the community''s responsibility to uphold divine holiness.',
   'The communal stoning of the blasphemer outside the camp highlights the corporate responsibility of the community to uphold God''s holiness and remove defilement. This act symbolizes the separation of sin from the holy people and foreshadows the ultimate judgment against those who reject God''s name and authority (Matt 12:31-32).'),
  (15,
   'And thou shalt speak unto the children of Israel, saying, Whosoever curseth his God shall bear his sin.',
   'וְאֶל־בְּנֵי יִשְׂרָאֵל תְּדַבֵּר לֵאמֹר אִישׁ אִישׁ כִּי־יְקַלֵּל אֱלֹהָיו וְנָשָׂא חֶטְאוֹ׃',
   'V''el-b''nei Yisra''el t''dabber lemor ish ish ki-y''kallel Elohav v''nasa chet''o.',
   'This verse broadens the specific case into a general law. ''Whosoever curseth his God'' (אִישׁ אִישׁ כִּי־יְקַלֵּל אֱלֹהָיו, *ish ish ki-y''kallel Elohav*) ''shall bear his sin'' (וְנָשָׂא חֶטְאוֹ, *v''nasa chet''o*). The phrase ''bear his sin'' implies that the individual will be held accountable and suffer the consequences, which, as the next verse clarifies, is death for blasphemy of YHWH''s specific name. This establishes a clear legal principle for the entire community.',
   NULL),
  (16,
   'And he that blasphemeth the name of the LORD, he shall surely be put to death, and all the congregation shall certainly stone him: as well the stranger, as he that is born in the land, when he blasphemeth the name of the Lord, shall be put to death.',
   'וְנֹקֵב שֵׁם־יְהוָה מוֹת יוּמָת רָגוֹם יִרְגְּמוּ אֹתוֹ כָּל־הָעֵדָה כַּגֵּר כָּאֶזְרָח כְּנָקְבוֹ שֵׁם יְהוָה יוּמָת׃',
   'V''nokev shem-YHVH mot yumat ragom yirg''mu oto kol-ha''edah kagger ka''ezrach k''nokvo shem YHVH yumat.',
   'This verse explicitly states the penalty for blaspheming the ''name of the LORD'' (שֵׁם־יְהוָה, *shem-YHVH*): ''he shall surely be put to death'' (מוֹת יוּמָת, *mot yumat*). The repetition emphasizes the certainty and severity of the punishment. Crucially, this law applies equally to ''the stranger, as he that is born in the land'' (כַּגֵּר כָּאֶזְרָח, *kagger ka''ezrach*), demonstrating the impartiality of God''s law and the universal demand for reverence for His holy name within the covenant community. This principle of equal justice for all residents is a hallmark of Mosaic law.',
   'The death penalty for blaspheming God''s name underscores the infinite value and holiness of God. This law applies universally, demonstrating that reverence for God is not merely a cultural practice but a fundamental moral imperative for all who live under His sovereignty, whether native or alien. It highlights God''s demand for absolute respect for His divine person.'),
  (17,
   'And he that killeth any man shall surely be put to death.',
   'וְאִישׁ כִּי יַכֶּה כָּל־נֶפֶשׁ אָדָם מוֹת יוּמָת׃',
   'V''ish ki yakkeh kol-nefesh adam mot yumat.',
   'The legal principles expand beyond blasphemy to other capital offenses, starting with murder. ''And he that killeth any man'' (וְאִישׁ כִּי יַכֶּה כָּל־נֶפֶשׁ אָדָם, *v''ish ki yakkeh kol-nefesh adam*) ''shall surely be put to death'' (מוֹת יוּמָת, *mot yumat*). This reiterates the sanctity of human life, created in God''s image (Gen 9:6), and establishes a clear, non-negotiable penalty for taking a human life, reflecting God''s justice.',
   'The law of ''surely be put to death'' for murder reinforces the sanctity of human life, which is made in God''s image (Gen 9:6). It reflects God''s justice and His demand for accountability for the ultimate violation of human dignity, underscoring the gravity of taking a life and the need for divine retribution.'),
  (18,
   'And he that killeth a beast shall make it good; beast for beast.',
   'וּמַכֵּה נֶפֶשׁ בְּהֵמָה יְשַׁלְּמֶנָּה נֶפֶשׁ תַּחַת נָפֶשׁ׃',
   'U''makkeh nefesh b''hemah y''shall''mennah nefesh tachat nafesh.',
   'In contrast to killing a human, killing an animal (נֶפֶשׁ בְּהֵמָה, *nefesh b''hemah*) requires restitution: ''he shall make it good; beast for beast'' (יְשַׁלְּמֶנָּה נֶפֶשׁ תַּחַת נָפֶשׁ, *y''shall''mennah nefesh tachat nafesh*). This distinction highlights the unique value of human life in God''s eyes while still demanding justice and compensation for damage to property, which animals represented in this context. It establishes a principle of proportional justice.',
   NULL),
  (19,
   'And if a man cause a blemish in his neighbour; as he hath done, so shall it be done to him;',
   'וְאִישׁ כִּי־יִתֵּן מוּם בַּעֲמִיתוֹ כַּאֲשֶׁר עָשָׂה כֵּן יֵעָשֶׂה בּוֹ׃',
   'V''ish ki-yitten mum ba''amito ka''asher asah ken ye''aseh bo.',
   'This verse introduces the principle of ''lex talionis,'' or ''law of retaliation.'' If a man ''cause a blemish'' (מוּם, *mum*) in his neighbor, ''as he hath done, so shall it be done to him'' (כַּאֲשֶׁר עָשָׂה כֵּן יֵעָשֶׂה בּוֹ, *ka''asher asah ken ye''aseh bo*). This principle was not intended to encourage personal vengeance but to establish a legal standard for proportionate punishment, preventing excessive retaliation and ensuring justice matched the offense. It served as a ceiling, not a floor, for retribution.',
   NULL),
  (20,
   'Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again.',
   'שֶׁבֶר תַּחַת שֶׁבֶר עַיִן תַּחַת עַיִן שֵׁן תַּחַת שֵׁן כַּאֲשֶׁר יִתֵּן מוּם בָּאָדָם כֵּן יִנָּתֶן בּוֹ׃',
   'Shever tachat shever ayin tachat ayin shen tachat shen ka''asher yitten mum ba''adam ken yinnaten bo.',
   'This verse elaborates on ''lex talionis'' with specific examples: ''breach for breach, eye for eye, tooth for tooth'' (שֶׁבֶר תַּחַת שֶׁבֶר עַיִן תַּחַת עַיִן שֵׁן תַּחַת שֵׁן, *shever tachat shever ayin tachat ayin shen tachat shen*). This famous legal principle, also found in Exodus 21:23-25 and Deuteronomy 19:21, aimed to ensure that punishment was equivalent to the injury inflicted, thereby limiting vengeance and promoting justice. It was a judicial guideline, often fulfilled through monetary compensation rather than literal physical harm, as interpreted by later Jewish tradition.',
   'The ''eye for an eye'' principle, while seemingly harsh, established a foundational concept of proportionate justice, limiting vengeance and ensuring equitable recompense. It reflects God''s demand for fairness and accountability, preventing both under-punishment and over-punishment, and foreshadows the perfect justice administered by Christ (Matt 5:38-39, Rom 12:19).'),
  (21,
   'And he that killeth a beast, he shall restore it: and he that killeth a man, he shall be put to death.',
   'וּמַכֵּה בְהֵמָה יְשַׁלְּמֶנָּה וּמַכֵּה אָדָם יוּמָת׃',
   'U''makkeh b''hemah y''shall''mennah u''makkeh adam yumat.',
   'This verse reiterates the distinction between harming animals and humans. ''And he that killeth a beast, he shall restore it'' (וּמַכֵּה בְהֵמָה יְשַׁלְּמֶנָּה, *u''makkeh b''hemah y''shall''mennah*), requiring compensation. However, ''and he that killeth a man, he shall be put to death'' (וּמַכֵּה אָדָם יוּמָת, *u''makkeh adam yumat*), reinforcing the capital punishment for murder. This clear differentiation underscores the unique value of human life in God''s covenant law.',
   NULL),
  (22,
   'Ye shall have one manner of law, as well for the stranger, as for one of your own country: for I am the LORD your God.',
   'מִשְׁפָּט אֶחָד יִהְיֶה לָכֶם כַּגֵּר כָּאֶזְרָח יִהְיֶה כִּי אֲנִי יְהוָה אֱלֹהֵיכֶם׃',
   'Mishpat echad yihyeh lakhem kagger ka''ezrach yihyeh ki ani YHVH Eloheikhem.',
   'This verse encapsulates a crucial principle of Mosaic law: ''Ye shall have one manner of law'' (מִשְׁפָּט אֶחָד יִהְיֶה לָכֶם, *mishpat echad yihyeh lakhem*), applying equally to ''the stranger, as for one of your own country'' (כַּגֵּר כָּאֶזְרָח, *kagger ka''ezrach*). The rationale is divine: ''for I am the LORD your God'' (כִּי אֲנִי יְהוָה אֱלֹהֵיכֶם, *ki ani YHVH Eloheikhem*). God''s character as just and impartial demands that His laws be applied without favoritism, ensuring equity and order within the diverse community of Israel.',
   'The principle of ''one manner of law'' for all, native or stranger, reveals God''s impartial justice and His demand for equity within His covenant community. This reflects His own character as the righteous judge and foreshadows the universal application of His moral law and the equal standing of all believers before Christ (Gal 3:28).'),
  (23,
   'And Moses spake to the children of Israel, that they should bring forth him that had cursed out of the camp, and stone him with stones. And the children of Israel did as the LORD commanded Moses.',
   'וַיְדַבֵּר מֹשֶׁה אֶל־בְּנֵי יִשְׂרָאֵל וַיֹּצִיאוּ אֶת־הַמְקַלֵּל אֶל־מִחוּץ לַמַּחֲנֶה וַיִּרְגְּמוּ אֹתוֹ אֶבֶן וּבְנֵי יִשְׂרָאֵל עָשׂוּ כַּאֲשֶׁר צִוָּה יְהוָה אֶת־מֹשֶׁה׃',
   'Vaydabber Mosheh el-b''nei Yisra''el vayyotzi''u et-ham''kallel el-michutz lammachaneh vayyirg''mu oto even u''v''nei Yisra''el asu ka''asher tzivvah YHVH et-Mosheh.',
   'This concluding verse describes the immediate execution of the divine judgment. Moses relayed the command to the Israelites, who then ''brought forth him that had cursed out of the camp'' (וַיֹּצִיאוּ אֶת־הַמְקַלֵּל אֶל־מִחוּץ לַמַּחֲנֶה, *vayyotzi''u et-ham''kallel el-michutz lammachaneh*) and ''stone him with stones'' (וַיִּרְגְּמוּ אֹתוֹ אֶבֶן, *vayyirg''mu oto even*). The final phrase, ''And the children of Israel did as the LORD commanded Moses,'' emphasizes their obedience and the immediate implementation of God''s justice, establishing a clear precedent for the severity of blasphemy and the community''s responsibility to uphold divine law.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('שֶׁמֶן', 'shemen', 'H8081', 'Meaning ''oil'' or ''fat,'' ''shemen'' often refers to olive oil, a staple in ancient Israel. Theologically, it symbolizes anointing, consecration, and the Holy Spirit''s presence and empowerment (1 Sam 16:13). In the Tabernacle, pure oil for the lamps represents the light of God''s truth and the spiritual illumination provided by His Spirit.', 1),
  ('זָךְ', 'zakh', 'H2141', 'Derived from a root meaning ''to be pure'' or ''clean,'' ''zakh'' describes something unblemished, refined, or innocent. Here, ''pure'' oil emphasizes the high standard of quality required for Tabernacle service, symbolizing the holiness and perfection demanded in worship. It points to the need for unadulterated devotion in approaching God.', 2),
  ('תָּמִיד', 'tamid', 'H8548', 'Meaning ''continually,'' ''always,'' or ''regularly,'' ''tamid'' denotes an unbroken, perpetual action or state. In the context of the Tabernacle, it signifies the ongoing nature of worship, sacrifice, and God''s presence. It underscores the covenantal relationship that requires constant maintenance and devotion, reflecting God''s unchanging faithfulness.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24 AND v.verse_number = 2;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('חֻקַּת', 'chukkat', 'H2708', 'From ''choq,'' meaning ''statute,'' ''ordinance,'' or ''decree,'' ''chukkat'' refers to a prescribed rule or law, often with a sense of being fixed or engraved. It denotes a divine command that is binding and foundational for Israel''s religious and civil life, emphasizing God''s authority in establishing the terms of the covenant.', 1),
  ('עוֹלָם', 'olam', 'H5769', 'Meaning ''eternity,'' ''forever,'' or ''long duration,'' ''olam'' indicates something of indefinite or perpetual existence. When paired with ''chukkat,'' it signifies an ''everlasting statute,'' highlighting the enduring nature of God''s commands and covenants, which transcend generations and remain valid for all time, reflecting God''s unchanging character.', 2),
  ('לְדֹרֹתֵיכֶם', 'l''doroteikhem', 'H1755', 'Meaning ''for your generations,'' this term emphasizes the transmission and continuity of God''s commands through successive generations of Israel. It underscores the intergenerational responsibility to uphold the covenant and pass on the divine statutes, ensuring the perpetuation of worship and obedience within the community.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24 AND v.verse_number = 3;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('לְבֹנָה', 'levonah', 'H3828', 'Meaning ''frankincense,'' a fragrant gum resin used in ancient worship. It was burned as incense, producing a sweet aroma that symbolized prayer, worship, and God''s acceptance of offerings (Ps 141:2). Its inclusion with the Bread of the Presence signifies the spiritual aspect of Israel''s communion with God, ascending as a pleasing aroma.', 1),
  ('לְאַזְכָּרָה', 'l''azkarah', 'H234', 'From the root ''zakar'' (to remember), ''l''azkarah'' means ''for a memorial'' or ''as a reminder.'' In sacrificial contexts, it signifies an offering that brings the worshiper or their offering to God''s remembrance, ensuring His favorable attention. It highlights God''s covenant faithfulness and His attentiveness to the worship of His people.', 2),
  ('אִשֶּׁה', 'isheh', 'H801', 'Meaning ''offering made by fire,'' ''isheh'' refers to any sacrifice consumed by fire on the altar. It denotes a gift presented to God through burning, symbolizing dedication, purification, and the ascending nature of worship. The frankincense, though small, was a fiery offering, signifying God''s acceptance of the spiritual essence of the bread offering.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24 AND v.verse_number = 7;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('קֹדֶשׁ', 'kodesh', 'H6944', 'Meaning ''holiness,'' ''sacredness,'' or ''set apart,'' ''kodesh'' denotes that which is distinct and consecrated to God. It signifies separation from the common and dedication to the divine. In the Tabernacle, it describes objects, places, and actions that are imbued with God''s presence and thus demand utmost reverence and purity.', 1),
  ('קָדָשִׁים', 'kodashim', 'H6944', 'The plural form of ''kodesh,'' often used in the construct ''kodesh kodashim'' (''most holy'' or ''holy of holies''). This superlative emphasizes the highest degree of sanctity, reserved for things directly associated with God''s immediate presence. It signifies ultimate sacredness, demanding the strictest adherence to purity laws and restricted access.', 2),
  ('חֻקַּת', 'chukkat', 'H2708', 'From ''choq,'' meaning ''statute,'' ''ordinance,'' or ''decree,'' ''chukkat'' refers to a prescribed rule or law, often with a sense of being fixed or engraved. It denotes a divine command that is binding and foundational for Israel''s religious and civil life, emphasizing God''s authority in establishing the terms of the covenant.', 3),
  ('עוֹלָם', 'olam', 'H5769', 'Meaning ''eternity,'' ''forever,'' or ''long duration,'' ''olam'' indicates something of indefinite or perpetual existence. When paired with ''chukkat,'' it signifies an ''everlasting statute,'' highlighting the enduring nature of God''s commands and covenants, which transcend generations and remain valid for all time, reflecting God''s unchanging faithfulness.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24 AND v.verse_number = 9;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('וַיִּקֹּב', 'vayikkob', 'H5344', 'From the root ''naqav,'' meaning ''to pierce,'' ''to bore,'' or ''to specify/designate.'' In this context, it means ''to pronounce'' or ''to utter'' the divine name with contempt or blasphemy. It implies a deliberate and forceful act of profaning God''s name, not merely an accidental utterance, highlighting the intentionality of the offense.', 1),
  ('הַשֵּׁם', 'hashem', 'H8034', 'Meaning ''the Name,'' referring specifically to the ineffable name of God, YHWH. In Jewish tradition, ''HaShem'' is used as a substitute for YHWH to avoid profaning it. Blaspheming ''the Name'' is an attack on God''s very essence, character, and authority, considered the gravest offense against divine holiness (Exod 20:7).', 2),
  ('וַיְקַלֵּל', 'vaykallel', 'H7043', 'From the root ''qalal,'' meaning ''to be light,'' ''to curse,'' or ''to treat lightly.'' Here, it means ''to curse'' or ''to revile.'' It signifies speaking ill of someone, wishing them harm, or treating them with contempt. When directed at God, it is an act of extreme disrespect and defiance, diminishing His honor and authority.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24 AND v.verse_number = 11;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('וְנֹקֵב', 'v''nokev', 'H5344', 'A participle form of ''naqav,'' meaning ''he who blasphemes'' or ''he who pronounces with contempt.'' This emphasizes the active and deliberate nature of the act of blasphemy. It refers to the one who specifically utters or designates the divine name in a derogatory or disrespectful manner, thereby profaning it.', 1),
  ('שֵׁם', 'shem', 'H8034', 'Meaning ''name,'' but in this context, it refers to the divine name YHWH, which embodies God''s character, presence, and authority. To blaspheme ''shem YHVH'' is to attack God''s very being, challenging His sovereignty and holiness, an act deemed worthy of death in the Mosaic Law (Exod 20:7).', 2),
  ('מוֹת', 'mot', 'H4191', 'Meaning ''death'' or ''dying.'' In the phrase ''mot yumat'' (surely be put to death), the infinitive absolute ''mot'' intensifies the finite verb ''yumat,'' emphasizing the certainty and severity of the capital punishment. It signifies an unavoidable and absolute decree of execution for the offense committed.', 3),
  ('יוּמָת', 'yumat', 'H4191', 'The Hophal imperfect form of ''mut,'' meaning ''he shall be put to death.'' This passive construction emphasizes that the death penalty is a divine decree, carried out by the community as an act of justice. It signifies the ultimate consequence for a capital offense, reflecting God''s righteous judgment against sin.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24 AND v.verse_number = 16;

-- Verse 22
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('מִשְׁפָּט', 'mishpat', 'H4941', 'Meaning ''judgment,'' ''justice,'' ''ordinance,'' or ''law.'' ''Mishpat'' refers to a legal decision, a customary practice, or the administration of justice. It embodies the concept of righteousness and fairness in legal proceedings and societal governance, reflecting God''s own attribute of justice (Deut 32:4).', 1),
  ('אֶחָד', 'echad', 'H259', 'Meaning ''one,'' ''single,'' or ''united.'' In this context, ''mishpat echad'' signifies ''one manner of law'' or ''one standard of justice.'' It emphasizes the impartiality and uniformity of God''s law, ensuring that all members of the community, regardless of status, are subject to the same legal principles, preventing favoritism or discrimination.', 2),
  ('כַּגֵּר', 'kagger', 'H1616', 'From ''ger,'' meaning ''sojourner,'' ''stranger,'' or ''resident alien.'' The prefix ''ka-'' means ''as'' or ''like.'' ''Kagger'' thus means ''as the stranger.'' This term highlights the inclusion of non-Israelites who resided within the community under the covenant. It underscores God''s concern for the vulnerable and His demand for equitable treatment for all within His domain.', 3),
  ('אֱלֹהֵיכֶם', 'Eloheikhem', 'H430', 'Meaning ''your God,'' the plural form ''Elohim'' used with a singular meaning for God, combined with the possessive suffix ''your.'' This emphasizes God''s covenant relationship with Israel and His authority over them. The declaration ''I am the LORD your God'' serves as the ultimate basis for the laws, demanding obedience and reverence from His chosen people.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24 AND v.verse_number = 22;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Exodus 25:1', 1),
  (1, 'Leviticus 1:1', 2),
  (1, 'Numbers 1:1', 3),
  (2, 'Exodus 27:20-21', 1),
  (2, 'Numbers 8:2-4', 2),
  (2, 'Matthew 5:14-16', 3),
  (2, 'John 8:12', 4),
  (3, 'Exodus 26:35', 1),
  (3, 'Exodus 30:8', 2),
  (3, 'Hebrews 9:2-3', 3),
  (4, 'Exodus 25:31-40', 1),
  (4, 'Numbers 8:4', 2),
  (5, 'Exodus 25:30', 1),
  (5, 'Leviticus 2:1', 2),
  (5, 'Numbers 4:7', 3),
  (6, 'Exodus 25:23-30', 1),
  (6, '1 Samuel 21:6', 2),
  (7, 'Leviticus 2:2', 1),
  (7, 'Leviticus 2:16', 2),
  (7, 'Isaiah 60:6', 3),
  (8, 'Numbers 28:9-10', 1),
  (8, '1 Chronicles 9:32', 2),
  (8, 'Nehemiah 10:33', 3),
  (9, 'Exodus 29:32-33', 1),
  (9, 'Leviticus 8:31', 2),
  (9, 'Leviticus 21:22', 3),
  (9, 'Matthew 12:4', 4),
  (10, 'Exodus 12:48-49', 1),
  (10, 'Numbers 15:32-36', 2),
  (11, 'Exodus 20:7', 1),
  (11, 'Exodus 22:28', 2),
  (11, '1 Kings 21:10', 3),
  (11, 'Matthew 12:31', 4),
  (12, 'Numbers 15:34', 1),
  (14, 'Deuteronomy 13:9-10', 1),
  (14, 'Deuteronomy 17:7', 2),
  (14, 'Acts 7:58', 3),
  (15, 'Leviticus 5:1', 1),
  (15, 'Numbers 9:13', 2),
  (16, 'Exodus 20:7', 1),
  (16, 'Deuteronomy 5:11', 2),
  (16, 'James 2:10', 3),
  (17, 'Genesis 9:6', 1),
  (17, 'Exodus 21:12', 2),
  (17, 'Numbers 35:30-31', 3),
  (18, 'Exodus 21:33-34', 1),
  (19, 'Exodus 21:24-25', 1),
  (19, 'Deuteronomy 19:21', 2),
  (20, 'Exodus 21:24-25', 1),
  (20, 'Deuteronomy 19:21', 2),
  (20, 'Matthew 5:38-39', 3),
  (21, 'Leviticus 24:17-18', 1),
  (21, 'Numbers 35:31', 2),
  (22, 'Exodus 12:49', 1),
  (22, 'Leviticus 19:34', 2),
  (22, 'Numbers 15:15-16', 3),
  (22, 'Romans 2:11', 4),
  (23, 'Numbers 15:36', 1),
  (23, 'Deuteronomy 13:10', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 24 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Leviticus Chapter 24 Complete!
-- 23 verses · 7 key verses with word studies (24 words)
-- Cross-references for 22 verses (59 refs)
-- ═══════════════════════════════════════════════════════