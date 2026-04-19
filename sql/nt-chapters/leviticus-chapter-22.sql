-- ═══════════════════════════════════════════════════════
-- LEVITICUS CHAPTER 22 — Priestly Purity and Unblemished Offerings for a Holy God
-- 33 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 22,
  'Leviticus 22 meticulously details the stringent purity requirements for the Aaronic priesthood and the acceptable standards for offerings presented to the LORD. The chapter begins by emphasizing that priests must maintain ceremonial cleanness when handling "holy things" (vv. 1-9), lest they profane God''s sacred name and incur divine judgment. It then delineates who among the priestly household may partake of the holy portions (vv. 10-16), extending privileges to slaves and certain widowed daughters, but strictly excluding strangers. A significant section is dedicated to the necessity of offering unblemished animals for all sacrifices, whether burnt offerings, peace offerings, or freewill offerings (vv. 17-25), reflecting God''s absolute perfection and the demand for the worshiper''s best. Further regulations specify the minimum age for sacrificial animals and prohibit the slaughter of a mother and its young on the same day (vv. 26-30). The chapter concludes with a powerful exhortation to obey God''s commandments and to hallow His name, grounding these demands in His redemptive act of bringing Israel out of Egypt (vv. 31-33). These laws collectively underscore the profound sanctity of God and the seriousness of approaching Him, foreshadowing the perfect sacrifice of Christ and the call to holy living for all believers.',
  'Priestly Purity and Unblemished Offerings for a Holy God',
  'קֹדֶשׁ (qodesh)',
  'From the root קדשׁ (q-d-sh), meaning "to be set apart," "holy," or "consecrated." In Leviticus 22, `qodesh` refers to both the "holy things" (sacred portions, offerings) and the inherent holiness of God. It signifies separation from the common or profane, emphasizing God''s unique, transcendent nature and the purity required of those who serve Him and approach Him.',
  '["Section 1 (vv. 1-9): Priestly Purity Requirements for Handling Holy Things","Section 2 (vv. 10-16): Regulations for Eating the Priests'' Holy Portions","Section 3 (vv. 17-25): Requirements for Acceptable Sacrificial Animals","Section 4 (vv. 26-30): Specific Rules for Animal Offerings and Consumption","Section 5 (vv. 31-33): Concluding Exhortation to Obey and Sanctify God''s Name"]'
FROM books b WHERE b.name = 'Leviticus';

-- Step 2: Insert all 33 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vaydabber YHVH el-Mosheh lemor.',
   'This verse serves as a standard introductory formula in Leviticus, indicating a direct divine communication from the LORD (YHWH) to Moses. It signals the beginning of a new set of divine instructions, emphasizing the authoritative source of the laws that follow. This formula is common throughout the Pentateuch, highlighting Moses'' role as the mediator of God''s covenant with Israel (Exod 19:3-7).',
   NULL),
  (2,
   'Speak unto Aaron and to his sons, that they separate themselves from the holy things of the children of Israel, and that they profane not my holy name in those things which they hallow unto me: I am the LORD.',
   'דַּבֵּר אֶל־אַהֲרֹן וְאֶל־בָּנָיו וְיִנָּזְרוּ מִקָּדְשֵׁי בְנֵי־יִשְׂרָאֵל וְלֹא יְחַלְּלוּ אֶת־שֵׁם קָדְשִׁי בַּאֲשֶׁר הֵם מַקְדִּישִׁים לִי אֲנִי יְהוָה׃',
   'Dabber el-Aharon v''el-banav v''yinnazru miqqadshey b''ney-Yisra''el v''lo y''ḥall''lu et-shem qodshi ba''asher hem maqdishim li ani YHVH.',
   'This verse commands Aaron and his sons, the priests, to "separate themselves" (יִנָּזְרוּ, *yinnazru*) from the holy things if they are in a state of impurity. The term "separate themselves" implies a ritual distancing to maintain the sanctity of the sacred offerings. Failure to do so would "profane" (יְחַלְּלוּ, *y''ḥall''lu*) God''s holy name, a grave offense. The phrase "I am the LORD" (אֲנִי יְהוָה, *ani YHVH*) frequently punctuates divine commands, underscoring God''s authority and covenant relationship (Lev 18:2, 19:3).',
   'This verse establishes the fundamental principle that those who serve God must maintain ritual purity, reflecting the divine demand for holiness. Profaning God''s name through careless handling of sacred things is a serious theological concern, emphasizing that God''s character and reputation are intrinsically linked to the conduct of His representatives. This foreshadows the New Testament call for believers to live holy lives as a testimony to God (1 Pet 1:15-16).'),
  (3,
   'Say unto them, Whosoever he be of all your seed among your generations, that goeth unto the holy things, which the children of Israel hallow unto the LORD, having his uncleanness upon him, that soul shall be cut off from my presence: I am the LORD.',
   'אֱמֹר אֲלֵהֶם אִישׁ אִישׁ מִזַּרְעֲכֶם לְדֹרֹתֵיכֶם אֲשֶׁר יִקְרַב בַּקֳּדָשִׁים אֲשֶׁר יַקְדִּישׁוּ בְנֵי־יִשְׂרָאֵל לַיהוָה וְטֻמְאָתוֹ עָלָיו וְנִכְרְתָה הַנֶּפֶשׁ הַהִוא מִלְּפָנַי אֲנִי יְהוָה׃',
   'Emor alehem ish ish mizzar''akhem l''doroteykhem asher yiqrav baqqodashim asher yaqdishu b''ney-Yisra''el laYHVH v''ṭum''ato alav v''nikhr''tah hannephesh hahiw mil''lefanay ani YHVH.',
   'This verse specifies the severe consequence for a priest who approaches "holy things" (בַּקֳּדָשִׁים, *baqqodashim*) while in a state of "uncleanness" (טֻמְאָתוֹ, *ṭum''ato*). The penalty is to be "cut off from my presence" (וְנִכְרְתָה הַנֶּפֶשׁ הַהִוא מִלְּפָנַי, *v''nikhr''tah hannephesh hahiw mil''lefanay*), a phrase often interpreted as excommunication or even divine judgment leading to death (Gen 17:14, Exod 12:15). This highlights the absolute necessity of ritual purity for priestly service and the sanctity of God''s presence.',
   'The concept of being "cut off" from God''s presence underscores the gravity of violating divine holiness. It signifies a breach in the covenant relationship, emphasizing that access to God and His blessings is contingent upon obedience and purity. This principle, though ritualistic in the Old Testament, points to the spiritual separation caused by sin and the need for atonement to restore fellowship with God (Isa 59:2).'),
  (4,
   'What man soever of the seed of Aaron is a leper, or hath a running issue; he shall not eat of the holy things, until he be clean. And whoso toucheth any thing that is unclean by the dead, or a man whose seed goeth from him;',
   'אִישׁ אִישׁ מִזֶּרַע אַהֲרֹן וְהוּא צָרוּעַ אוֹ זָב בַּקֳּדָשִׁים לֹא יֹאכַל עַד אֲשֶׁר יִטְהָר וְהַנֹּגֵעַ בְּכָל־טְמֵא־נֶפֶשׁ אוֹ אִישׁ אֲשֶׁר תֵּצֵא מִמֶּנּוּ שִׁכְבַת־זָרַע׃',
   'Ish ish mizzerah Aharon v''hu tzarua o zav baqqodashim lo yokhal ad asher yiṭhar v''hannogea b''khol-t''me-nephesh o ish asher tetze mimmennu shikhvat-zara.',
   'This verse lists specific conditions that render a priest unclean and thus ineligible to eat of the holy things. These include being a "leper" (צָרוּעַ, *tzarua*) or having a "running issue" (זָב, *zav*), both serious ritual impurities detailed in Leviticus 13-15. Touching a "dead body" (טְמֵא־נֶפֶשׁ, *t''me-nephesh*) or experiencing a seminal emission also causes uncleanness. These regulations underscore the meticulous attention to purity required for priestly duties and consumption of sacred food.',
   NULL),
  (5,
   'Or whosoever toucheth any creeping thing, whereby he may be made unclean, or a man of whom he may take uncleanness, whatsoever uncleanness he hath;',
   'אוֹ אִישׁ אֲשֶׁר יִגַּע בְּכָל־שֶׁרֶץ אֲשֶׁר יִטְמָא־לוֹ אוֹ בְּאָדָם אֲשֶׁר יִטְמָא־לוֹ לְכֹל טֻמְאָתוֹ׃',
   'O ish asher yigga b''khol-sheretz asher yiṭma-lo o v''adam asher yiṭma-lo l''khol ṭum''ato.',
   'Continuing the list of defiling contacts, this verse includes touching a "creeping thing" (שֶׁרֶץ, *sheretz*) that causes uncleanness, or touching a person who is himself unclean. The phrase "whatsoever uncleanness he hath" (לְכֹל טֻמְאָתוֹ, *l''khol ṭum''ato*) is comprehensive, emphasizing that any form of ritual impurity, whether from an object or another person, disqualifies a priest from partaking in the holy food. This reinforces the contagious nature of ritual impurity.',
   NULL),
  (6,
   'The soul which hath touched any such shall be unclean until even, and shall not eat of the holy things, unless he wash his flesh with water.',
   'נֶפֶשׁ אֲשֶׁר תִּגַּע בָּהֶם וְטָמְאָה עַד הָעָרֶב וְלֹא יֹאכַל מִן־הַקֳּדָשִׁים כִּי אִם־רָחַץ בַּמַּיִם בְּשָׂרוֹ׃',
   'Nephesh asher tigga bahem v''ṭam''ah ad ha''arev v''lo yokhal min-haqqodashim ki im-raḥatz bammayim b''saro.',
   'This verse specifies the duration and remedy for the uncleanness incurred by the contacts mentioned in vv. 4-5. The affected individual remains "unclean until even" (וְטָמְאָה עַד הָעָרֶב, *v''ṭam''ah ad ha''arev*), meaning until sunset. To become clean, they must "wash his flesh with water" (רָחַץ בַּמַּיִם בְּשָׂרוֹ, *raḥatz bammayim b''saro*), a standard purification ritual. Without this washing, they cannot eat of the holy things. This highlights the temporary nature of many ritual impurities and the prescribed means of restoration.',
   NULL),
  (7,
   'And when the sun is down, he shall be clean, and shall afterward eat of the holy things; because it is his food.',
   'וּבָא הַשֶּׁמֶשׁ וְטָהֵר וְאַחַר יֹאכַל מִן־הַקֳּדָשִׁים כִּי לַחְמוֹ הוּא׃',
   'Uva hashemesh v''ṭaher v''aḥar yokhal min-haqqodashim ki laḥmo hu.',
   'Following the sunset and the prescribed washing, the priest is declared "clean" (וְטָהֵר, *v''ṭaher*) and may then "eat of the holy things" (יֹאכַל מִן־הַקֳּדָשִׁים, *yokhal min-haqqodashim*). The phrase "because it is his food" (כִּי לַחְמוֹ הוּא, *ki laḥmo hu*) emphasizes that these holy portions are the divinely appointed sustenance for the priests, a privilege tied directly to their service and ritual purity. This provision ensured the priests'' livelihood (Num 18:8-14).',
   NULL),
  (8,
   'That which dieth of itself, or is torn with beasts, he shall not eat to defile himself therewith: I am the LORD.',
   'נְבֵלָה וּטְרֵפָה לֹא יֹאכַל לְטָמְאָה־בָהּ אֲנִי יְהוָה׃',
   'Nevelah uṭ''refah lo yokhal l''ṭom''ah-vah ani YHVH.',
   'This verse prohibits priests from eating "that which dieth of itself" (נְבֵלָה, *nevelah*) or "is torn with beasts" (וּטְרֵפָה, *uṭ''refah*). Such meat was considered unclean and would defile the priest, rendering him unfit for service and consumption of holy things. This prohibition, also found for all Israelites (Lev 17:15), was particularly strict for priests due to their elevated status and proximity to sacred duties. It underscores the importance of consuming only ritually clean food.',
   'This prohibition against eating defiled meat highlights the principle of separation and purity in all aspects of life for those consecrated to God. It teaches that one''s physical intake can have spiritual implications, emphasizing the holistic nature of holiness. For the priest, maintaining purity in diet was a tangible expression of his dedication to a holy God.'),
  (9,
   'They shall therefore keep mine ordinance, lest they bear sin for it, and die therefore, if they profane it: I the LORD do sanctify them.',
   'וְשָׁמְרוּ אֶת־מִשְׁמַרְתִּי וְלֹא־יִשְׂאוּ עָלָיו חֵטְא וּמֵתוּ בוֹ כִּי יְחַלְּלֻהוּ אֲנִי יְהוָה מַקְדִּישָׁם׃',
   'V''shamru et-mishmarti v''lo-yis''u alav ḥeṭ u''metu vo ki y''ḥall''luhu ani YHVH maqdisham.',
   'This verse serves as a strong warning and summary of the preceding regulations. Priests are commanded to "keep mine ordinance" (וְשָׁמְרוּ אֶת־מִשְׁמַרְתִּי, *v''shamru et-mishmarti*), referring to the entire body of purity laws. Failure to do so would result in them "bearing sin" (יִשְׂאוּ עָלָיו חֵטְא, *yis''u alav ḥeṭ*) and dying, because they would "profane" (יְחַלְּלֻהוּ, *y''ḥall''luhu*) God''s holy things. The declaration "I the LORD do sanctify them" (אֲנִי יְהוָה מַקְדִּישָׁם, *ani YHVH maqdisham*) reminds them of their consecrated status and the high standards that come with it.',
   'This verse powerfully links obedience to divine commands with life and disobedience with death, emphasizing the seriousness of profaning God''s holiness. The priests'' sanctification by God implies a reciprocal responsibility to maintain that holiness through their actions. It underscores the concept of divine judgment for those who treat sacred things lightly, a principle echoed in the New Testament regarding the church as God''s holy temple (1 Cor 3:16-17).'),
  (10,
   'There shall no stranger eat of the holy thing: a sojourner of the priest, or an hired servant, shall not eat of the holy thing.',
   'וְכָל־זָר לֹא־יֹאכַל קֹדֶשׁ תּוֹשָׁב כֹּהֵן וְשָׂכִיר לֹא־יֹאכַל קֹדֶשׁ׃',
   'V''khol-zar lo-yokhal qodesh toshav kohen v''sakhir lo-yokhal qodesh.',
   'This verse introduces regulations concerning who may eat of the "holy thing" (קֹדֶשׁ, *qodesh*), specifically prohibiting any "stranger" (זָר, *zar*). This term refers to anyone not of the priestly lineage, including a "sojourner of the priest" (תּוֹשָׁב כֹּהֵן, *toshave kohen*) or a "hired servant" (וְשָׂכִיר, *v''sakhir*). These individuals, though they might live with or work for a priest, were not part of the consecrated family and thus could not partake of the sacred food. This maintains the exclusive privilege of the priesthood.',
   'This restriction highlights the concept of covenant privilege and the exclusive nature of access to God''s sacred provisions. Just as only priests could mediate between God and Israel, only they (and their immediate, consecrated household) could partake of certain holy offerings. This foreshadows the New Testament understanding of spiritual access through Christ, where believers become a "royal priesthood" (1 Pet 2:9) with direct access to God.'),
  (11,
   'But if the priest buy any soul with his money, he shall eat of it, and he that is born in his house: they shall eat of his meat.',
   'וְכֹהֵן כִּי־יִקְנֶה נֶפֶשׁ קִנְיַן כַּסְפּוֹ הוּא יֹאכַל בּוֹ וִילִיד בֵּיתוֹ הֵם יֹאכְלוּ בְלַחְמוֹ׃',
   'V''kohen ki-yiqneh nephesh qinyan kaspo hu yokhal bo v''yilid beito hem yokhlu v''laḥmo.',
   'This verse provides an exception to the rule in v. 10. If a priest "buys any soul with his money" (יִקְנֶה נֶפֶשׁ קִנְיַן כַּסְפּוֹ, *yiqneh nephesh qinyan kaspo*), meaning a slave acquired through purchase, that person "shall eat of it." Similarly, "he that is born in his house" (וִילִיד בֵּיתוֹ, *v''yilid beito*), referring to a slave born into the priest''s household, may also eat. These individuals are considered part of the priest''s extended household, under his authority and care, and thus share in his provisions.',
   NULL),
  (12,
   'If the priest’s daughter also be married unto a stranger, she may not eat of an offering of the holy things.',
   'וּבַת־כֹּהֵן כִּי תִהְיֶה לְאִישׁ זָר הִוא בִּתְרוּמַת הַקֳּדָשִׁים לֹא תֹאכַל׃',
   'Uvat-kohen ki tihyeh l''ish zar hi vitrumat haqqodashim lo tokhal.',
   'This verse addresses the status of a priest''s daughter. If she "be married unto a stranger" (לְאִישׁ זָר, *l''ish zar*), meaning a non-priest, she is no longer considered part of the priestly household for the purpose of eating "an offering of the holy things" (בִּתְרוּמַת הַקֳּדָשִׁים, *vitrumat haqqodashim*). Her marital union transfers her allegiance and status to her husband''s household, thereby relinquishing her right to priestly provisions. This highlights the importance of lineage and household identity in determining ritual privileges.',
   NULL),
  (13,
   'But if the priest’s daughter be a widow, or divorced, and have no child, and is returned unto her father’s house, as in her youth, she shall eat of her father’s meat: but there shall no stranger eat thereof.',
   'וּבַת־כֹּהֵן כִּי תִהְיֶה אַלְמָנָה וּגְרוּשָׁה וְזֶרַע אֵין לָהּ וְשָׁבָה אֶל־בֵּית אָבִיהָ כִּנְעוּרֶיהָ מִלֶּחֶם אָבִיהָ תֹּאכֵל וְכָל־זָר לֹא־יֹאכַל בּוֹ׃',
   'Uvat-kohen ki tihyeh almanah u''grushah v''zera ein lah v''shavah el-beit aviha kin''ureyha milleḥem aviha tokhel v''khol-zar lo-yokhal bo.',
   'This verse offers a specific exception for a priest''s daughter who had married a non-priest. If she becomes a "widow, or divorced" (אַלְמָנָה וּגְרוּשָׁה, *almanah u''grushah*) and "have no child" (וְזֶרַע אֵין לָהּ), she may "return unto her father''s house, as in her youth" (וְשָׁבָה אֶל־בֵּית אָבִיהָ כִּנְעוּרֶיהָ, *v''shavah el-beit aviha*). In this circumstance, she regains the right to eat of her father''s holy food, as she is once again fully dependent on and integrated into the priestly household. The prohibition against any "stranger" (זָר, *zar*) eating it remains.',
   NULL),
  (14,
   'And if a man eat of the holy thing unwittingly, then he shall put the fifth part thereof unto it, and shall give it unto the priest with the holy thing.',
   'וְאִישׁ כִּי־יֹאכַל קֹדֶשׁ בִּשְׁגָגָה וְיָסַף חֲמִשִׁיתוֹ עָלָיו וְנָתַן לַכֹּהֵן אֶת־הַקֹּדֶשׁ׃',
   'V''ish ki-yokhal qodesh bishgaga v''yasaf ḥamishito alav v''natan lakkohen et-haqqodesh.',
   'This verse addresses the unintentional consumption of holy things by an unauthorized person. If someone "eat of the holy thing unwittingly" (יֹאכַל קֹדֶשׁ בִּשְׁגָגָה, *yokhal qodesh bishgaga*), they must "put the fifth part thereof unto it" (וְיָסַף חֲמִשִׁיתוֹ עָלָיו, *v''yasaf ḥamishito alav*), meaning add 20% to the value of what was consumed. This restitution, along with the original value, must be given to the priest. This law emphasizes the sanctity of the holy portions and ensures that even accidental misuse incurs a penalty and compensation (Lev 5:15-16).',
   'This law highlights God''s demand for meticulous respect for sacred things, even in cases of unintentional error. It underscores the principle of restitution for trespasses against God''s holy property, demonstrating that ignorance does not entirely absolve guilt, but rather requires a prescribed remedy. This points to the need for atonement for all sin, whether intentional or unintentional.'),
  (15,
   'And they shall not profane the holy things of the children of Israel, which they offer unto the LORD;',
   'וְלֹא יְחַלְּלוּ אֶת־קָדְשֵׁי בְנֵי יִשְׂרָאֵל אֵת אֲשֶׁר יָרִימוּ לַיהוָה׃',
   'V''lo y''ḥall''lu et-qadshey b''ney Yisra''el et asher yarimu laYHVH.',
   'This verse reiterates the prohibition against profaning the "holy things of the children of Israel" (קָדְשֵׁי בְנֵי יִשְׂרָאֵל, *qadshey b''ney Yisra''el*), specifically those "which they offer unto the LORD" (אֲשֶׁר יָרִימוּ לַיהוָה, *asher yarimu laYHVH*). This command is directed at the priests, reminding them of their responsibility to safeguard the sanctity of the offerings presented by the people. It emphasizes that the priests are custodians of God''s holy property, not its owners.',
   NULL),
  (16,
   'Or suffer them to bear the iniquity of trespass, when they eat their holy things: for I the LORD do sanctify them.',
   'וְהִשִּׂיאוּ אוֹתָם עֲוֹן אַשְׁמָה בְּאָכְלָם אֶת־קָדְשֵׁיהֶם כִּי אֲנִי יְהוָה מַקְדִּישָׁם׃',
   'V''hissi''u otam avon ashmah b''okhlah et-qadsheyhem ki ani YHVH maqdisham.',
   'This verse warns that if priests allow unauthorized persons to eat the holy things, or if they themselves eat while unclean, they would "suffer them to bear the iniquity of trespass" (וְהִשִּׂיאוּ אוֹתָם עֲוֹן אַשְׁמָה, *v''hissi''u otam avon ashmah*). This means the priests would incur guilt for their negligence, leading to divine judgment. The concluding phrase, "for I the LORD do sanctify them" (כִּי אֲנִי יְהוָה מַקְדִּישָׁם, *ki ani YHVH maqdisham*), again highlights their consecrated status and the high expectations placed upon them.',
   'This verse underscores the concept of corporate responsibility, where the priests'' actions (or inactions) could lead to guilt for themselves and potentially for the community. It emphasizes that God''s sanctification of His people comes with the serious responsibility to uphold His holiness. This principle resonates with the New Testament teaching that leaders in the church bear a greater responsibility for the spiritual well-being and purity of the congregation (Jas 3:1).'),
  (17,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vaydabber YHVH el-Mosheh lemor.',
   'This is another standard introductory formula, signaling a new section of divine instruction. It transitions from the regulations concerning priestly purity and consumption of holy things to the requirements for acceptable animal sacrifices presented by the wider Israelite community. This structural marker emphasizes the distinct yet related nature of these divine commands.',
   NULL),
  (18,
   'Speak unto Aaron, and to his sons, and unto all the children of Israel, and say unto them, Whatsoever he be of the house of Israel, or of the strangers in Israel, that will offer his oblation for all his vows, and for all his freewill offerings, which they will offer unto the LORD for a burnt offering;',
   'דַּבֵּר אֶל־אַהֲרֹן וְאֶל־בָּנָיו וְאֶל כָּל־בְּנֵי יִשְׂרָאֵל וְאָמַרְתָּ אֲלֵהֶם אִישׁ אִישׁ מִבֵּית יִשְׂרָאֵל וּמִן־הַגֵּר בְּיִשְׂרָאֵל אֲשֶׁר יַקְרִיב קָרְבָּנוֹ לְכָל־נִדְרֵיהֶם וּלְכָל־נִדְבוֹתָם אֲשֶׁר יַקְרִיבוּ לַיהוָה לְעֹלָה׃',
   'Dabber el-Aharon v''el-banav v''el kol-b''ney Yisra''el v''amarta alehem ish ish mibbeit Yisra''el umin-hagger b''Yisra''el asher yaqriv qorbano l''khol-nidreyhem ul''khol-nidvotam asher yaqrivu laYHVH l''olah.',
   'This verse broadens the scope of the audience to include "Aaron, and to his sons, and unto all the children of Israel" (אַהֲרֹן וְאֶל־בָּנָיו וְאֶל כָּל־בְּנֵי יִשְׂרָאֵל, *Aharon v''el-banav v''el kol-b''ney Yisra''el*), and even "strangers in Israel" (וּמִן־הַגֵּר בְּיִשְׂרָאֵל, *umin-hagger b''Yisra''el*). It introduces the regulations for offering sacrifices, specifically "burnt offerings" (לְעֹלָה, *l''olah*), whether for "vows" (נִדְרֵיהֶם, *nidreyhem*) or "freewill offerings" (נִדְבוֹתָם, *nidvotam*). This inclusivity shows that the quality of offerings was a concern for all who worshipped YHWH.',
   'This verse demonstrates God''s gracious provision for both native Israelites and resident aliens (strangers) to participate in worship through sacrifice. It highlights the inclusive nature of the covenant community, where those who commit to YHWH''s worship are given means to approach Him. This foreshadows the New Testament inclusion of Gentiles into the family of God through faith in Christ (Eph 2:11-19).'),
  (19,
   'Ye shall offer at your own will a male without blemish, of the beeves, of the sheep, or of the goats.',
   'לִרְצֹנְכֶם תָּמִים זָכָר בַּבָּקָר בַּכְּשָׂבִים וּבָעִזִּים׃',
   'Lirtzonkhem tamim zakhar babbaqar bakk''savim uva''izzim.',
   'This verse specifies the primary requirement for acceptable burnt offerings: they must be "a male without blemish" (תָּמִים זָכָר, *tamim zakhar*). The term "without blemish" (תָּמִים, *tamim*) is crucial, meaning whole, perfect, and complete. The acceptable animals are from the "beeves" (בַּבָּקָר, *babbaqar*), "sheep" (בַּכְּשָׂבִים, *bakk''savim*), or "goats" (וּבָעִזִּים, *uva''izzim*). The phrase "at your own will" (לִרְצֹנְכֶם, *lirtzonkhem*) indicates that the offering must be willingly presented and acceptable to God.',
   'The demand for a "male without blemish" is profoundly significant. It symbolizes the perfection required for atonement and points directly to Jesus Christ, the spotless Lamb of God, whose perfect sacrifice alone could truly atone for sin (1 Pet 1:18-19). This requirement teaches that God deserves nothing less than the very best, reflecting His own perfect character.'),
  (20,
   'But whatsoever hath a blemish, that shall ye not offer: for it shall not be acceptable for you.',
   'כֹּל אֲשֶׁר־בּוֹ מוּם לֹא תַקְרִיבוּ כִּי לֹא־לְרָצוֹן יִהְיֶה לָכֶם׃',
   'Kol asher-bo mum lo taqrivu ki lo-l''ratzon yihyeh lakhem.',
   'This verse explicitly prohibits offering any animal "whatsoever hath a blemish" (כֹּל אֲשֶׁר־בּוֹ מוּם, *kol asher-bo mum*). Such an offering "shall not be acceptable for you" (לֹא־לְרָצוֹן יִהְיֶה לָכֶם, *lo-l''ratzon yihyeh lakhem*), meaning it would not be received favorably by God. This reinforces the absolute necessity of perfection in sacrifices, emphasizing that God does not accept imperfect or defective offerings.',
   'This prohibition underscores God''s absolute standard of holiness and His refusal to accept anything less than perfection in worship. It teaches that superficial or half-hearted offerings are an affront to His character. The unacceptability of blemished sacrifices highlights the chasm between human imperfection and divine perfection, a gap that only the perfect sacrifice of Christ could bridge.'),
  (21,
   'And whosoever offereth a sacrifice of peace offerings unto the LORD to accomplish his vow, or a freewill offering in beeves or sheep, it shall be perfect to be accepted; there shall be no blemish therein.',
   'וְאִישׁ כִּי־יַקְרִיב זֶבַח שְׁלָמִים לַיהוָה לְפַלֵּא־נֶדֶר אוֹ לִנְדָבָה בַּבָּקָר אוֹ בַכֶּשֶׂב תָּמִים יִהְיֶה לְרָצוֹן כָּל־מוּם לֹא יִהְיֶה־בּוֹ׃',
   'V''ish ki-yaqriv zevaḥ sh''lamim laYHVH l''falle-neder o lindavah babbaqar o vakkesev tamim yihyeh l''ratzon kol-mum lo yihyeh-bo.',
   'This verse extends the "without blemish" (תָּמִים, *tamim*) requirement to "peace offerings" (זֶבַח שְׁלָמִים, *zevaḥ sh''lamim*), whether offered to "accomplish his vow" (לְפַלֵּא־נֶדֶר, *l''falle-neder*) or as a "freewill offering" (לִנְדָבָה, *lindavah*). The animals, whether "beeves or sheep" (בַּבָּקָר אוֹ בַכֶּשֶׂב, *babbaqar o vakkesev*), must be "perfect to be accepted" (תָּמִים יִהְיֶה לְרָצוֹן, *tamim yihyeh l''ratzon*), with "no blemish therein" (כָּל־מוּם לֹא יִהְיֶה־בּוֹ, *kol-mum lo yihyeh-bo*). This reiterates the universal demand for perfection in all sacrificial offerings.',
   NULL),
  (22,
   'Blind, or broken, or maimed, or having a wen, or scurvy, or scabbed, ye shall not offer these unto the LORD, nor make an offering by fire of them upon the altar unto the LORD.',
   'עַוֶּרֶת אוֹ שָׁבוּר אוֹ חָרוּץ אוֹ יַבֶּלֶת אוֹ גָרָב אוֹ יַלֶּפֶת לֹא־תַקְרִיבוּ אֵלֶּה לַיהוָה וְאִשֶּׁה לֹא־תִתְּנוּ מֵהֶם עַל־הַמִּזְבֵּחַ לַיהוָה׃',
   'Avveret o shavur o ḥarutz o yabbellet o garav o yallefet lo-taqrivu elleh laYHVH v''isheh lo-titt''nu mehem al-hammizbeaḥ laYHVH.',
   'This verse provides a detailed list of specific blemishes that render an animal unacceptable for sacrifice. These include being "blind" (עַוֶּרֶת, *avveret*), "broken" (שָׁבוּר, *shavur*), "maimed" (חָרוּץ, *ḥarutz*), having a "wen" (יַבֶּלֶת, *yabbellet*), "scurvy" (גָרָב, *garav*), or "scabbed" (יַלֶּפֶת, *yallefet*). Such animals are explicitly prohibited from being offered to the LORD, either as a whole offering or as "an offering by fire" (אִשֶּׁה, *isheh*) on the altar. This meticulous list underscores the high standard of physical perfection required.',
   'This detailed enumeration of physical defects deemed unacceptable for sacrifice emphasizes the comprehensive nature of God''s demand for perfection. It illustrates that even minor imperfections disqualify an offering, teaching that God is not satisfied with anything less than wholeness and soundness. This principle points to the absolute perfection of Christ, who was without any spiritual or moral blemish (Heb 4:15).'),
  (23,
   'Either a bullock or a lamb that hath any thing superfluous or lacking in his parts, that mayest thou offer for a freewill offering; but for a vow it shall not be accepted.',
   'וְשׁוֹר וָכֶשֶׂב שָׂרוּעַ וְקָלוּט נְדָבָה תַּעֲשֶׂה אֹתוֹ וּלְנֶדֶר לֹא יֵרָצֶה׃',
   'V''shor vakhesev sarua v''qalut n''davah ta''aseh oto ul''neder lo yeratzeh.',
   'This verse introduces a nuanced exception. An animal (a "bullock or a lamb") that has "anything superfluous or lacking in his parts" (שָׂרוּעַ וְקָלוּט, *sarua v''qalut*), such as an extra limb or a missing one, "mayest thou offer for a freewill offering" (נְדָבָה תַּעֲשֶׂה אֹתוֹ, *n''davah ta''aseh oto*). However, "for a vow it shall not be accepted" (וּלְנֶדֶר לֹא יֵרָצֶה, *ul''neder lo yeratzeh*). This distinction highlights that while freewill offerings could be slightly less perfect, vows, which were binding commitments, required the highest standard of offering.',
   'This distinction between freewill offerings and vows reveals a theological principle: while God graciously accepts offerings given out of spontaneous devotion, He holds His people to a higher standard when they make solemn commitments. It teaches that vows are to be taken with utmost seriousness, demanding the very best, reflecting the integrity and faithfulness expected in covenant relationships (Eccl 5:4-5).'),
  (24,
   'Ye shall not offer unto the LORD that which is bruised, or crushed, or broken, or cut; neither shall ye make any offering thereof in your land.',
   'וּמָעוּךְ וְכָתוּת וְנָתוּק וְכָרוּת לֹא־תַקְרִיבוּ לַיהוָה וּבְאַרְצְכֶם לֹא תַעֲשׂוּ׃',
   'U''ma''ukh v''khatut v''natuk v''kharut lo-taqrivu laYHVH uv''artz''khem lo ta''asu.',
   'This verse lists further severe physical defects that render an animal completely unacceptable for sacrifice: "bruised" (מָעוּךְ, *ma''ukh*), "crushed" (וְכָתוּת, *v''khatut*), "broken" (וְנָתוּק, *v''natuk*), or "cut" (וְכָרוּת, *v''kharut*), particularly referring to damaged testicles. Not only are such animals not to be offered to the LORD, but the practice of inflicting such injuries is also prohibited "in your land" (וּבְאַרְצְכֶם לֹא תַעֲשׂוּ, *uv''artz''khem lo ta''asu*), likely referring to castration for breeding purposes, which was common in other cultures but forbidden in Israel for animals intended for sacrifice.',
   'This prohibition against offering animals with severe reproductive damage, and even against the practice itself, underscores the sanctity of life and procreation within God''s created order. It teaches that offerings to God must represent wholeness and vitality, not mutilation or diminished capacity. This reflects God''s character as the giver of life and His demand for reverence for His creation.'),
  (25,
   'Neither from a stranger’s hand shall ye offer the bread of your God of any of these; because their corruption is in them, and blemishes be in them: they shall not be accepted for you.',
   'וּמִיַּד בֶּן־נֵכָר לֹא תַקְרִיבוּ אֶת־לֶחֶם אֱלֹהֵיכֶם מִכָּל־אֵלֶּה כִּי מָשְׁחָתָם בָּהֶם מוּם בָּהֶם לֹא יֵרָצוּ לָכֶם׃',
   'Umiyyad ben-nekhar lo taqrivu et-leḥem Eloheychem mikkol-elleh ki mashḥatam bahem mum bahem lo yeratzu lakhem.',
   'This verse prohibits accepting offerings from "a stranger''s hand" (מִיַּד בֶּן־נֵכָר, *miyyad ben-nekhar*) if they possess any of the aforementioned blemishes. The phrase "the bread of your God" (לֶחֶם אֱלֹהֵיכֶם, *leḥem Eloheychem*) refers to the sacrificial offerings. The reason given is that "their corruption is in them, and blemishes be in them" (מָשְׁחָתָם בָּהֶם מוּם בָּהֶם, *mashḥatam bahem mum bahem*), rendering them unacceptable. While strangers could offer sacrifices (v. 18), the quality standard remained paramount, and priests were responsible for vetting them.',
   'This prohibition reinforces the universal standard of purity and perfection for offerings, regardless of the offerer''s origin. It teaches that God''s holiness is not compromised by accepting offerings from non-Israelites, but the *quality* of the offering must still meet His divine standard. This emphasizes that true worship requires integrity and the best of what one has, irrespective of one''s background.'),
  (26,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Vaydabber YHVH el-Mosheh lemor.',
   'Another standard introductory formula, marking the beginning of a new set of specific regulations concerning animal offerings. This transition indicates a shift from general requirements for unblemished animals to particular rules regarding the age of sacrificial animals and the timing of their slaughter.',
   NULL),
  (27,
   'When a bullock, or a sheep, or a goat, is brought forth, then it shall be seven days under the dam; and from the eighth day and thenceforth it shall be accepted for an offering made by fire unto the LORD.',
   'שׁוֹר אוֹ־כֶשֶׂב אוֹ־עֵז כִּי יִוָּלֵד וְהָיָה שִׁבְעַת יָמִים תַּחַת אִמּוֹ וּמִיּוֹם הַשְּׁמִינִי וָהָלְאָה יֵרָצֶה לְקָרְבַּן אִשֶּׁה לַיהוָה׃',
   'Shor o-khesev o-ez ki yivvaled v''hayah shiv''at yamim taḥat immo umiyyom hash''mini vahal''ah yeratzeh l''qorban isheh laYHVH.',
   'This verse sets an age requirement for sacrificial animals. A "bullock, or a sheep, or a goat" (שׁוֹר אוֹ־כֶשֶׂב אוֹ־עֵז, *shor o-khesev o-ez*) must remain "seven days under the dam" (שִׁבְעַת יָמִים תַּחַת אִמּוֹ, *shiv''at yamim taḥat immo*). Only "from the eighth day and thenceforth" (וּמִיּוֹם הַשְּׁמִינִי וָהָלְאָה, *umiyyom hash''mini vahal''ah*) will it "be accepted for an offering made by fire unto the LORD" (יֵרָצֶה לְקָרְבַּן אִשֶּׁה לַיהוָה, *yeratzeh l''qorban isheh laYHVH*). This period likely allowed the animal to gain strength and symbolized a complete week, mirroring the Sabbath principle.',
   'The requirement for an animal to be at least eight days old for sacrifice connects to the broader biblical theme of the eighth day symbolizing new beginnings, completion, and consecration (e.g., circumcision on the eighth day, Lev 12:3). It teaches that God requires offerings that are fully established and mature enough to represent life, not mere nascent existence, pointing to the fullness of life offered in Christ.'),
  (28,
   'And whether it be cow or ewe, ye shall not kill it and her young both in one day.',
   'וְשׁוֹר אוֹ־שֵׂה אֹתוֹ וְאֶת־בְּנוֹ לֹא תִשְׁחֲטוּ בְּיוֹם אֶחָד׃',
   'V''shor o-seh oto v''et-b''no lo tishḥaṭu b''yom eḥad.',
   'This verse introduces a unique prohibition: "ye shall not kill it and her young both in one day" (לֹא תִשְׁחֲטוּ בְּיוֹם אֶחָד, *lo tishḥaṭu b''yom eḥad*), referring to a "cow or ewe" (וְשׁוֹר אוֹ־שֵׂה, *v''shor o-seh*) and its offspring. This law, also found in Deuteronomy 22:6-7 regarding birds, demonstrates God''s compassion for animals and a concern for the preservation of life. It prevents excessive cruelty and promotes humane treatment within the context of sacrificial practices.',
   'This command, rooted in compassion, reveals a facet of God''s character that extends beyond human-to-human relationships to the treatment of His creation. It teaches reverence for life and a prohibition against wanton cruelty, even towards animals designated for sacrifice. This principle underscores the holistic nature of God''s law, which seeks to cultivate mercy and respect for all life.'),
  (29,
   'And when ye will offer a sacrifice of thanksgiving unto the LORD, offer it at your own will.',
   'וְכִי־תִזְבְּחוּ זֶבַח תּוֹדָה לַיהוָה לִרְצֹנְכֶם תִּזְבָּחוּ׃',
   'V''khi-tizb''ḥu zevaḥ todah laYHVH lirtzonkhem tizbaḥu.',
   'This verse addresses the "sacrifice of thanksgiving" (זֶבַח תּוֹדָה, *zevaḥ todah*). It states that when offering such a sacrifice, it should be offered "at your own will" (לִרְצֹנְכֶם תִּזְבָּחוּ, *lirtzonkhem tizbaḥu*), meaning it should be willingly and acceptably presented. While all sacrifices required a willing heart, this is particularly emphasized for thanksgiving offerings, which are expressions of gratitude and devotion.',
   NULL),
  (30,
   'On the same day it shall be eaten up; ye shall leave none of it until the morrow: I am the LORD.',
   'בַּיּוֹם הַהוּא יֵאָכֵל לֹא־תוֹתִירוּ מִמֶּנּוּ עַד־בֹּקֶר אֲנִי יְהוָה׃',
   'Bayyom hahu ye''akhel lo-totiru mimmennu ad-boqer ani YHVH.',
   'This verse specifies that a sacrifice of thanksgiving must be "eaten up" (יֵאָכֵל, *ye''akhel*) "on the same day" (בַּיּוֹם הַהוּא, *bayyom hahu*), with "none of it until the morrow" (לֹא־תוֹתִירוּ מִמֶּנּוּ עַד־בֹּקֶר, *lo-totiru mimmennu ad-boqer*). This contrasts with other offerings that could be eaten over two days (Lev 7:15-18). The immediate consumption likely emphasized the urgency and freshness of gratitude, preventing the meat from spoiling and being profaned, and fostering communal fellowship.',
   'The command for immediate consumption of the thanksgiving offering teaches the importance of expressing gratitude promptly and fully. It discourages procrastination in worship and encourages a present-focused appreciation for God''s blessings. The communal aspect of eating the sacrifice also highlights the fellowship and joy that should accompany thanksgiving to God.'),
  (31,
   'Therefore shall ye keep my commandments, and do them: I am the LORD.',
   'וּשְׁמַרְתֶּם מִצְוֹתַי וַעֲשִׂיתֶם אֹתָם אֲנִי יְהוָה׃',
   'U''shmartem mitzvotay va''asitem otam ani YHVH.',
   'This verse serves as a general exhortation, concluding the specific regulations of the chapter. It calls upon the Israelites to "keep my commandments, and do them" (וּשְׁמַרְתֶּם מִצְוֹתַי וַעֲשִׂיתֶם אֹתָם, *u''shmartem mitzvotay va''asitem otam*). The phrase "I am the LORD" (אֲנִי יְהוָה, *ani YHVH*) reinforces the divine authority behind these laws and the covenant relationship that demands obedience.',
   'This concluding command emphasizes the overarching importance of obedience to God''s entire law. It teaches that divine commands are not merely suggestions but binding obligations, rooted in God''s sovereign authority and His covenant relationship with His people. True faith is demonstrated through active obedience (Deut 6:24-25).'),
  (32,
   'Neither shall ye profane my holy name; but I will be hallowed among the children of Israel: I am the LORD which hallow you,',
   'וְלֹא תְחַלְּלוּ אֶת־שֵׁם קָדְשִׁי וְנִקְדַּשְׁתִּי בְּתוֹךְ בְּנֵי יִשְׂרָאֵל אֲנִי יְהוָה מַקְדִּישְׁכֶם׃',
   'V''lo t''ḥall''lu et-shem qodshi v''niqdashti b''tokh b''ney Yisra''el ani YHVH maqdishkhem.',
   'This verse reiterates a central theme of the chapter and indeed the book of Leviticus: the prohibition against profaning God''s "holy name" (שֵׁם קָדְשִׁי, *shem qodshi*). Instead, God declares, "I will be hallowed among the children of Israel" (וְנִקְדַּשְׁתִּי בְּתוֹךְ בְּנֵי יִשְׂרָאֵל, *v''niqdashti b''tokh b''ney Yisra''el*). This means God''s holiness is to be recognized and honored by His people. The final affirmation, "I am the LORD which hallow you" (אֲנִי יְהוָה מַקְדִּישְׁכֶם, *ani YHVH maqdishkhem*), reminds them that their very consecration comes from Him, obligating them to reflect His holiness.',
   'This verse is a theological cornerstone, emphasizing that God''s primary concern is the sanctification of His name among His people. It teaches that human actions, particularly in worship and service, either hallow or profane God''s name. God''s act of "hallowing" or sanctifying His people creates a reciprocal responsibility for them to live in a way that brings Him glory, a principle central to Christian ethics (Matt 6:9, Rom 12:1).'),
  (33,
   'That brought you out of the land of Egypt, to be your God: I am the LORD.',
   'הַמּוֹצִיא אֶתְכֶם מֵאֶרֶץ מִצְרַיִם לִהְיוֹת לָכֶם לֵאלֹהִים אֲנִי יְהוָה׃',
   'Hammoṭzi et''khem me''eretz Mitzrayim lihyot lakhem le''Elohim ani YHVH.',
   'This concluding verse grounds all the preceding commands in God''s redemptive act. He identifies Himself as "That brought you out of the land of Egypt" (הַמּוֹצִיא אֶתְכֶם מֵאֶרֶץ מִצְרַיִם, *hammoṭzi et''khem me''eretz Mitzrayim*), a foundational event in Israelite history. This deliverance established their covenant relationship, where God became "to be your God" (לִהְיוֹת לָכֶם לֵאלֹהִים, *lihyot lakhem le''Elohim*). Therefore, their obedience to these holiness codes is a response to His saving grace and a fulfillment of their covenant obligations.',
   'This verse powerfully connects God''s redemptive acts with His demand for holiness. It teaches that obedience to God''s commands is a grateful response to His salvation, not a means to earn it. The Exodus serves as the historical basis for Israel''s identity as God''s holy people, a paradigm for Christian redemption leading to a life of sanctification (Rom 6:1-4, Tit 2:11-14).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('יִנָּזְרוּ', 'yinnazru', 'H5144', 'From the root נָזַר (nazar), meaning ''to separate oneself,'' ''consecrate,'' or ''abstain.'' Here, it refers to the priests ritually separating themselves from holy things due to impurity. The term emphasizes the need for dedication and setting apart, highlighting the priest''s consecrated status and the purity required for handling sacred objects.', 1),
  ('קָדְשֵׁי', 'qadshey', 'H6944', 'From קֹדֶשׁ (qodesh), meaning ''holiness,'' ''holy thing,'' or ''sanctuary.'' In this context, it refers to the sacred portions of offerings. The term signifies something set apart for God, imbued with His holiness, and thus requiring special reverence, careful handling, and strict adherence to purity laws.', 2),
  ('יְחַלְּלוּ', 'y''ḥall''lu', 'H2490', 'From חָלַל (ḥalal), meaning ''to profane,'' ''defile,'' or ''pollute.'' It denotes treating something sacred as common or ordinary, thereby dishonoring God and His holy name. This action directly contradicts the concept of holiness and incurs severe divine displeasure and judgment.', 3),
  ('קָדְשִׁי', 'qodshi', 'H6944', 'From קֹדֶשׁ (qodesh), meaning ''my holiness'' or ''my holy name.'' This refers to God''s inherent holiness and His reputation. Profaning God''s name means diminishing His glory and sacredness in the eyes of others, which is considered a grave offense against His divine character.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22 AND v.verse_number = 2;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('טֻמְאָתוֹ', 'ṭum''ato', 'H2932', 'From טֻמְאָה (ṭum''ah), meaning ''uncleanness'' or ''impurity.'' It refers to a state of ritual defilement that renders a person unfit for sacred activities or contact with holy things. While often temporary and external, it carries significant spiritual implications for access to God.', 1),
  ('וְנִכְרְתָה', 'v''nikhr''tah', 'H3772', 'From כָּרַת (karat), meaning ''to cut off,'' ''cut down,'' or ''destroy.'' In this context, it signifies excommunication from the community or divine judgment leading to death. It represents a severe severing of the covenant relationship due to a grave transgression against God''s holiness.', 2),
  ('מִלְּפָנַי', 'mil''lefanay', 'H6440', 'From פָּנִים (panim), meaning ''face'' or ''presence.'' The phrase ''from my presence'' emphasizes removal from God''s direct sphere of blessing, protection, and fellowship. It signifies a profound spiritual and communal alienation, highlighting the seriousness of violating divine commands.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22 AND v.verse_number = 3;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('מִשְׁמַרְתִּי', 'mishmarti', 'H4931', 'From מִשְׁמֶרֶת (mishmeret), meaning ''charge,'' ''ordinance,'' ''duty,'' or ''custody.'' It refers to God''s divine command or the sacred responsibility entrusted to the priests. It signifies the solemn trust and obligation to uphold God''s laws and maintain the sanctity of His worship.', 1),
  ('חֵטְא', 'ḥeṭ', 'H2399', 'Meaning ''sin,'' ''guilt,'' or ''offense.'' It denotes a transgression against God''s law, a missing of the mark of righteousness. To ''bear sin'' means to incur guilt and the associated penalty or consequences, emphasizing the accountability for one''s actions before God.', 2),
  ('מַקְדִּישָׁם', 'maqdisham', 'H6942', 'From קָדַשׁ (qadash), meaning ''to sanctify,'' ''consecrate,'' or ''make holy.'' Here, God declares that He is the one who sets the priests apart for His service. This emphasizes God''s initiative in establishing their holy status and their reciprocal responsibility to live up to that consecration.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22 AND v.verse_number = 9;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('עֲוֹן', 'avon', 'H5771', 'From עָוֹן (avon), meaning ''iniquity,'' ''guilt,'' or ''punishment for iniquity.'' It refers to moral perversity, twistedness, or the guilt incurred by sin, often carrying the connotation of the punishment that follows. It highlights the moral dimension of transgression.', 1),
  ('אַשְׁמָה', 'ashmah', 'H817', 'Meaning ''guilt,'' ''trespass,'' or ''offense.'' It denotes a specific trespass or offense, often requiring a guilt offering for atonement. Here, it refers to the guilt incurred by profaning holy things, emphasizing the specific nature of the transgression against sacred property.', 2),
  ('מַקְדִּישָׁם', 'maqdisham', 'H6942', 'From קָדַשׁ (qadash), meaning ''to sanctify,'' ''consecrate,'' or ''make holy.'' This reiterates God''s act of setting the priests apart for Himself. It underscores that their sacred status demands careful adherence to His laws to avoid incurring guilt and to properly represent His holiness.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22 AND v.verse_number = 16;

-- Verse 19
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('תָּמִים', 'tamim', 'H8549', 'Meaning ''complete,'' ''sound,'' ''perfect,'' or ''without blemish.'' This crucial term describes the ideal state of sacrificial animals, signifying physical integrity and wholeness. It symbolizes the perfection required for atonement and points to the flawless nature of the ultimate sacrifice for sin.', 1),
  ('זָכָר', 'zakhar', 'H2145', 'Meaning ''male.'' The requirement for male animals in burnt offerings often signifies strength, prime value, and the perpetuation of the species. It represents offering the best and most vital to God, reflecting the seriousness and cost of atonement.', 2),
  ('לִרְצֹנְכֶם', 'lirtzonkhem', 'H7522', 'From רָצוֹן (ratzon), meaning ''will,'' ''favor,'' or ''acceptance.'' The phrase ''at your own will'' or ''for your acceptance'' indicates that the offering must be presented willingly and meet God''s standards to be received favorably by Him. It highlights the importance of both intention and quality in worship.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22 AND v.verse_number = 19;

-- Verse 22
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('עַוֶּרֶת', 'avveret', 'H5787', 'Meaning ''blindness.'' This is a specific physical defect that renders an animal imperfect and thus unacceptable for sacrifice. It symbolizes a lack of wholeness and integrity, emphasizing that God demands perfect offerings that reflect His own flawless character.', 1),
  ('שָׁבוּר', 'shavur', 'H7667', 'Meaning ''broken.'' Refers to a broken limb or bone, indicating physical damage and imperfection. An animal with such a defect is unsuitable for an offering to a perfect God, reinforcing the requirement for physical soundness in sacrifices.', 2),
  ('יַבֶּלֶת', 'yabbellet', 'H3423', 'Meaning ''a wen,'' ''wart,'' or ''tumor.'' This refers to a growth or blemish on the skin, signifying an imperfection that disqualifies the animal from being a perfect offering. It underscores the meticulous standard of physical flawlessness required for sacrifices.', 3),
  ('גָרָב', 'garav', 'H1618', 'Meaning ''scurvy'' or ''scab.'' This refers to a skin disease or rash, indicating ill health and imperfection. An animal with such a condition is unfit for sacrifice, further illustrating God''s demand for healthy and unblemished offerings.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22 AND v.verse_number = 22;

-- Verse 32
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('תְחַלְּלוּ', 't''ḥall''lu', 'H2490', 'From חָלַל (ḥalal), meaning ''to profane'' or ''defile.'' The negative command here emphasizes the active avoidance of treating God''s name or holy things as common. It highlights the responsibility of Israel to uphold God''s honor and sacredness through their actions.', 1),
  ('וְנִקְדַּשְׁתִּי', 'v''niqdashti', 'H6942', 'From קָדַשׁ (qadash), meaning ''to be sanctified'' or ''hallowed.'' This is God''s declaration that He *will be* recognized as holy among His people. It implies that their obedience and reverence are the means by which His inherent holiness is manifested and honored in the world.', 2),
  ('מַקְדִּישְׁכֶם', 'maqdishkhem', 'H6942', 'From קָדַשׁ (qadash), meaning ''to sanctify you'' or ''make you holy.'' God is the active agent in setting His people apart for Himself. This underscores that Israel''s holiness is derived from God''s initiative and power, obligating them to live in a manner consistent with their consecrated status.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22 AND v.verse_number = 32;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Lev 1:1', 1),
  (1, 'Exod 19:1', 2),
  (1, 'Num 1:1', 3),
  (2, 'Lev 10:3', 1),
  (2, 'Exod 28:43', 2),
  (2, 'Ezek 44:23', 3),
  (2, '1 Pet 1:15-16', 4),
  (3, 'Lev 7:20-21', 1),
  (3, 'Num 19:13', 2),
  (3, 'Ezek 14:8', 3),
  (3, 'Heb 10:26-31', 4),
  (4, 'Lev 13:45-46', 1),
  (4, 'Lev 15:2', 2),
  (4, 'Num 5:2', 3),
  (4, 'Num 19:11', 4),
  (5, 'Lev 11:24', 1),
  (5, 'Lev 15:19-20', 2),
  (5, 'Hag 2:13', 3),
  (6, 'Lev 15:5', 1),
  (6, 'Num 19:7-8', 2),
  (6, 'Deut 23:11', 3),
  (7, 'Lev 11:25', 1),
  (7, 'Lev 15:16', 2),
  (7, 'Num 18:11', 3),
  (8, 'Exod 22:31', 1),
  (8, 'Lev 17:15', 2),
  (8, 'Deut 14:21', 3),
  (8, 'Ezek 4:14', 4),
  (9, 'Lev 10:1-2', 1),
  (9, 'Num 18:32', 2),
  (9, 'Ezek 44:23-24', 3),
  (9, 'Heb 12:29', 4),
  (10, 'Num 18:4', 1),
  (10, 'Num 18:7', 2),
  (10, 'Deut 12:17', 3),
  (10, '1 Sam 21:6', 4),
  (11, 'Exod 12:44', 1),
  (11, 'Num 18:11', 2),
  (11, 'Ezek 44:9', 3),
  (12, 'Num 18:11', 1),
  (12, 'Ruth 1:15-16', 2),
  (13, 'Gen 38:11', 1),
  (13, 'Num 18:11', 2),
  (13, 'Ruth 1:8-13', 3),
  (14, 'Lev 5:15-16', 1),
  (14, 'Num 5:7', 2),
  (14, 'Luke 19:8', 3),
  (15, 'Lev 19:8', 1),
  (15, 'Num 18:32', 2),
  (16, 'Num 18:32', 1),
  (16, 'Isa 53:6', 2),
  (16, '2 Cor 5:21', 3),
  (17, 'Lev 1:1', 1),
  (17, 'Num 1:1', 2),
  (18, 'Lev 1:2-3', 1),
  (18, 'Num 15:14-16', 2),
  (18, 'Rom 12:1', 3),
  (19, 'Lev 1:3', 1),
  (19, 'Deut 15:21', 2),
  (19, 'Mal 1:8', 3),
  (19, '1 Pet 1:19', 4),
  (20, 'Deut 17:1', 1),
  (20, 'Mal 1:8', 2),
  (20, 'Heb 9:14', 3),
  (21, 'Lev 3:1', 1),
  (21, 'Deut 23:21-23', 2),
  (21, 'Eccl 5:4-5', 3),
  (22, 'Deut 15:21', 1),
  (22, 'Mal 1:8', 2),
  (22, 'Mal 1:14', 3),
  (23, 'Deut 23:21-23', 1),
  (23, 'Eccl 5:4-5', 2),
  (24, 'Deut 23:1', 1),
  (24, 'Isa 56:3-5', 2),
  (25, 'Mal 1:14', 1),
  (25, 'Isa 56:6-7', 2),
  (25, 'Rom 12:1', 3),
  (26, 'Lev 1:1', 1),
  (27, 'Exod 22:30', 1),
  (27, 'Lev 12:3', 2),
  (27, 'Deut 15:19', 3),
  (28, 'Deut 22:6-7', 1),
  (28, 'Prov 12:10', 2),
  (29, 'Lev 7:12-15', 1),
  (29, 'Ps 50:14', 2),
  (29, 'Ps 107:22', 3),
  (30, 'Lev 7:15', 1),
  (30, 'Exod 12:10', 2),
  (31, 'Lev 18:4-5', 1),
  (31, 'Deut 4:1-2', 2),
  (31, 'Matt 5:19', 3),
  (32, 'Lev 10:3', 1),
  (32, 'Ezek 36:23', 2),
  (32, '1 Pet 1:15-16', 3),
  (33, 'Exod 6:7', 1),
  (33, 'Exod 20:2', 2),
  (33, 'Deut 26:18-19', 3),
  (33, 'Rom 6:22', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 22 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Leviticus Chapter 22 Complete!
-- 33 verses · 7 key verses with word studies (23 words)
-- Cross-references for 33 verses (98 refs)
-- ═══════════════════════════════════════════════════════