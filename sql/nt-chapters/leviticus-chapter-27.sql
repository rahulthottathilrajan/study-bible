-- ═══════════════════════════════════════════════════════
-- LEVITICUS CHAPTER 27 — Regulations for Vows, Dedications, and Tithes to the LORD
-- 34 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 27,
  'Leviticus 27 concludes the book by detailing regulations concerning vows, dedications, and tithes, emphasizing the sanctity of things consecrated to the LORD. It outlines the monetary valuation of persons, animals, houses, and fields dedicated by vow, providing specific redemption clauses and penalties. A significant portion addresses the ''devoted thing'' (ḥērem), which is irrevocably given to God and cannot be redeemed, often implying destruction. The chapter also establishes the divine ownership of all tithes, both agricultural and livestock, and their unchangeable holiness. This chapter underscores the meticulousness required in fulfilling commitments to God and reinforces the overarching theme of holiness that permeates the entire book of Leviticus, demonstrating how Israel was to live as a people set apart for Yahweh.',
  'Regulations for Vows, Dedications, and Tithes to the LORD',
  'נֶדֶר (neder)',
  'The Hebrew word ''neder'' (נֶדֶר) refers to a ''vow'' or ''vowed thing.'' Derived from the root ''nādar'' (נָדַר), meaning ''to promise'' or ''to vow,'' it signifies a solemn commitment made to God, often involving a dedication of persons, animals, or property. Such vows were considered binding and sacred, reflecting a deep personal devotion and requiring careful fulfillment according to the prescribed estimations and regulations outlined in this chapter.',
  '["Section 1 (vv. 1-8): Regulations for Vows Concerning Persons","Section 2 (vv. 9-13): Regulations for Vows Concerning Animals","Section 3 (vv. 14-25): Regulations for Vows Concerning Houses and Fields","Section 4 (vv. 26-29): Regulations for Firstborn and Devoted Things (Cherem)","Section 5 (vv. 30-33): Regulations for Tithes of Land and Livestock","Section 6 (v. 34): Concluding Statement for the Book of Leviticus"]'
FROM books b WHERE b.name = 'Leviticus';

-- Step 2: Insert all 34 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And the LORD spake unto Moses, saying,',
   'וַיְדַבֵּר יְהוָה אֶל־מֹשֶׁה לֵּאמֹר׃',
   'Wayəḏabbēr YHWH ʾel-Mōšeh lēʾmōr.',
   'This introductory verse sets the stage for the final chapter of Leviticus, which deals with various forms of dedication and vows. It reiterates the divine origin of these laws, emphasizing that they are not human inventions but direct commands from the LORD to Moses, intended for the instruction of the Israelite community. This formulaic opening is common throughout Leviticus (cf. Lev 1:1, 4:1, 6:8), underscoring the authority and divine inspiration of the entire legal corpus.',
   NULL),
  (2,
   'Speak unto the children of Israel, and say unto them, When a man shall make a singular vow, the persons shall be for the LORD by thy estimation.',
   'דַּבֵּר אֶל־בְּנֵי יִשְׂרָאֵל וְאָמַרְתָּ אֲלֵהֶם אִישׁ כִּי יַפְלִא נֶדֶר בְּעֶרְכְּךָ נְפָשֹׁת לַיהוָה׃',
   'Dabbēr ʾel-bənê Yiśrāʾēl wəʾāmartā ʾălêhem ʾîš kî yaphlî neder bəʿerkəḵā nəphāšōt laYHWH.',
   'This verse introduces the concept of a ''singular vow'' (נֶדֶר, neder), where an individual dedicates a person to the LORD. Such a dedication did not mean literal servitude in the sanctuary but rather required a monetary payment to the sanctuary, determined by priestly estimation. The phrase ''by thy estimation'' (בְּעֶרְכְּךָ, bəʿerkəḵā) highlights the priest''s role in assessing the value, ensuring fairness and adherence to divine standards. This practice allowed individuals to express devotion beyond mandatory offerings.',
   'This passage highlights the principle of voluntary dedication and the sanctity of vows made to God. While not literal human sacrifice, it demonstrates that all aspects of life, including human persons, could be consecrated to the Lord. The monetary redemption underscores God''s desire for devotion and resources to support His worship, rather than literal human servitude, reflecting His covenantal grace.'),
  (3,
   'And thy estimation shall be of the male from twenty years old even unto sixty years old, even thy estimation shall be fifty shekels of silver, after the shekel of the sanctuary.',
   'וְהָיָה עֶרְכְּךָ הַזָּכָר מִבֶּן עֶשְׂרִים שָׁנָה וְעַד בֶּן־שִׁשִּׁים שָׁנָה וְהָיָה עֶרְכְּךָ חֲמִשִּׁים שֶׁקֶל כֶּסֶף בְּשֶׁקֶל הַקֹּדֶשׁ׃',
   'Wəhāyāh ʿerkəḵā hazzāḵār mibben ʿeśrîm šānāh wəʿaḏ ben-šiššîm šānāh wəhāyāh ʿerkəḵā ḥamiššîm šeqel keseph bəšeqel haqqōḏeš.',
   'Here, specific monetary values are assigned based on age and gender, reflecting the perceived economic productivity or societal contribution of individuals. A male between 20 and 60 years, considered the prime of life, was valued at 50 shekels of silver. The ''shekel of the sanctuary'' (בְּשֶׁקֶל הַקֹּדֶשׁ, bəšeqel haqqōḏeš) refers to a standard, precise weight, ensuring consistency and preventing fraud in transactions related to sacred vows (cf. Exod 30:13).',
   'The detailed valuation system reveals God''s meticulousness and the importance of fair and standardized practices in sacred matters. It underscores that even human life, when dedicated, had a tangible value in the context of supporting the sanctuary, emphasizing the principle of giving one''s best to the Lord, whether in person or in equivalent resources.'),
  (4,
   'And if it be a female, then thy estimation shall be thirty shekels.',
   'וְאִם־נְקֵבָה הִוא וְהָיָה עֶרְכְּךָ שְׁלֹשִׁים שָׁקֶל׃',
   'Wəʾim-nəqēḇāh hîʾ wəhāyāh ʿerkəḵā šəlōšîm šāqel.',
   'For a female in the same age bracket (20-60 years), the estimation was 30 shekels. This difference in valuation between males and females reflects the patriarchal societal norms of the ancient Near East, where men typically held greater economic and social standing. It is not a judgment on inherent worth but a reflection of their respective roles and economic contributions within that cultural context.',
   NULL),
  (5,
   'And if it be from five years old even unto twenty years old, then thy estimation shall be of the male twenty shekels, and for the female ten shekels.',
   'וְאִם מִבֶּן־חָמֵשׁ שָׁנִים וְעַד בֶּן־עֶשְׂרִים שָׁנָה וְהָיָה עֶרְכְּךָ הַזָּכָר עֶשְׂרִים שְׁקָלִים וְלַנְּקֵבָה עֲשֶׂרֶת שְׁקָלִים׃',
   'Wəʾim mibben-ḥāmēš šānîm wəʿaḏ ben-ʿeśrîm šānāh wəhāyāh ʿerkəḵā hazzāḵār ʿeśrîm šəqālîm wəlannəqēḇāh ʿăśeret šəqālîm.',
   'The valuations continue to decrease for younger individuals, reflecting their diminished capacity for labor or contribution. For those between 5 and 20 years old, a male was valued at 20 shekels and a female at 10 shekels. This system demonstrates a pragmatic approach to assessing value for the sanctuary, acknowledging different life stages and their associated economic potential.',
   NULL),
  (6,
   'And if it be from a month old even unto five years old, then thy estimation shall be of the male five shekels of silver, and for the female thy estimation shall be three shekels of silver.',
   'וְאִם מִבֶּן־חֹדֶשׁ וְעַד בֶּן־חָמֵשׁ שָׁנִים וְהָיָה עֶרְכְּךָ הַזָּכָר חֲמִשָּׁה שְׁקָלִים כָּסֶף וְלַנְּקֵבָה עֶרְכְּךָ שְׁלֹשֶׁת שְׁקָלִים כָּסֶף׃',
   'Wəʾim mibben-ḥōḏeš wəʿaḏ ben-ḥāmēš šānîm wəhāyāh ʿerkəḵā hazzāḵār ḥamiššāh šəqālîm kāseph wəlannəqēḇāh ʿerkəḵā šəlōšet šəqālîm kāseph.',
   'Infants and young children (from one month to five years old) also had a prescribed value: five shekels for a male and three shekels for a female. The inclusion of even the youngest members of society in this valuation system underscores the comprehensive nature of the law and the idea that all life, from its earliest stages, is under God''s purview and can be dedicated to Him. The silver specified here (כָּסֶף, kāseph) is the standard medium of exchange.',
   NULL),
  (7,
   'And if it be from sixty years old and above; if it be a male, then thy estimation shall be fifteen shekels, and for the female ten shekels.',
   'וְאִם מִבֶּן־שִׁשִּׁים שָׁנָה וָמָעְלָה אִם־זָכָר חֲמִשָּׁה עָשָׂר שְׁקָלִים וְלַנְּקֵבָה עֲשֶׂרֶת שְׁקָלִים׃',
   'Wəʾim mibben-šiššîm šānāh wāmāʿlāh ʾim-zāḵār ḥamiššāh ʿāśār šəqālîm wəlannəqēḇāh ʿăśeret šəqālîm.',
   'For the elderly (60 years and above), the valuations were again lower: fifteen shekels for a male and ten shekels for a female. This reflects the natural decline in physical strength and economic productivity associated with old age in ancient societies. The entire system of valuation demonstrates a practical and equitable approach to managing vows, ensuring that the sanctuary received a fair contribution based on the individual''s life stage.',
   NULL),
  (8,
   'But if he be poorer than thy estimation, then he shall present himself before the priest, and the priest shall value him; according to his ability that vowed shall the priest value him.',
   'וְאִם־מָךְ הוּא מֵעֶרְכֶּךָ וְהֶעֱמִיד אֹתוֹ לִפְנֵי הַכֹּהֵן וְהֶעֱרִיךְ אֹתוֹ הַכֹּהֵן עַל־פִּי אֲשֶׁר תַּשִּׂיג יַד הַנֹּדֵר יַעֲרִיכֶנּוּ הַכֹּהֵן׃',
   'Wəʾim-māḵ hûʾ mēʿerkekā wəheʿĕmîḏ ʾōtô lip̄nê hakkōhēn wəheʿĕrîḵ ʾōtô hakkōhēn ʿal-pî ʾăšer taśśîḡ yaḏ hannōḏēr yaʿărîḵennû hakkōhēn.',
   'This verse introduces a crucial provision for the poor. If someone could not afford the standard estimation, they were to present themselves to the priest, who would then assess their ability to pay. This demonstrates God''s mercy and justice, ensuring that vows were accessible to all, regardless of economic status. The priest''s role was to make a fair judgment ''according to his ability,'' preventing undue burden while still honoring the vow (cf. Lev 5:7, 11).',
   'This provision for the poor reveals God''s compassion and equity within His law. It ensures that sincere devotion is not hindered by economic limitations, emphasizing that God values the heart and intention behind a vow more than the monetary amount. This principle resonates with New Testament teachings on giving according to one''s means (2 Cor 8:12).'),
  (9,
   'And if it be a beast, whereof men bring an offering unto the LORD, all that any man giveth of such unto the LORD shall be holy.',
   'וְאִם־בְּהֵמָה אֲשֶׁר יַקְרִיבוּ מִמֶּנָּה קָרְבָּן לַיהוָה כֹּל אֲשֶׁר יִתֵּן מִמֶּנּוּ לַיהוָה יִהְיֶה־קֹּדֶשׁ׃',
   'Wəʾim-bəhēmāh ʾăšer yaqrîḇû mimmennāh qorbān laYHWH kōl ʾăšer yittēn mimmennû laYHWH yihyeh-qqōḏeš.',
   'The focus shifts from persons to animals. If an animal suitable for sacrifice (clean animal) was vowed to the LORD, it immediately became holy (קֹדֶשׁ, qōḏeš). This means it could not be used for common purposes or sold. Once dedicated, its status changed, reflecting the sacred nature of anything set apart for God''s service. This principle underscores the seriousness of vows and the sanctity of dedicated items.',
   'This verse establishes the principle of ''holiness'' for dedicated offerings. Once an animal suitable for sacrifice is vowed to God, it is consecrated and cannot be treated as common. This teaches the irreversible nature of true dedication to God and the sacredness of what is given to Him, foreshadowing the complete dedication required of believers in Christ (Rom 12:1).'),
  (10,
   'He shall not alter it, nor change it, a good for a bad, or a bad for a good: and if he shall at all change beast for beast, then it and the exchange thereof shall be holy.',
   'לֹא יַחֲלִיפֶנּוּ וְלֹא יָמִיר אֹתוֹ טוֹב בְּרָע אוֹ רַע בְּטוֹב וְאִם־הָמֵר יָמִיר בְּהֵמָה בִּבְהֵמָה וְהָיָה הוּא וּתְמוּרָתוֹ יִהְיֶה־קֹּדֶשׁ׃',
   'Lōʾ yaḥălîp̄ennû wəlōʾ yāmîr ʾōtô ṭôḇ bəraʿ ʾô raʿ bəṭôḇ wəʾim-hāmēr yāmîr bəhēmāh biḇhēmāh wəhāyāh hûʾ ûtəmûrātô yihyeh-qqōḏeš.',
   'This verse prohibits any attempt to substitute a vowed animal, whether for a better or worse one. The intention is to prevent deceit and ensure the integrity of the vow. If a substitution was attempted, both the original animal and the replacement would become holy, reinforcing the binding nature of the initial dedication and imposing a penalty for trying to circumvent it. This strictness emphasizes the seriousness of vows before God.',
   'This prohibition against substitution highlights God''s demand for integrity and sincerity in worship. Once dedicated, an offering is irrevocably His. Any attempt to ''change'' or ''alter'' it is an affront to its sacred status. This teaches that our commitments to God must be honored without compromise or deceit, reflecting a heart fully devoted.'),
  (11,
   'And if it be any unclean beast, of which they do not offer a sacrifice unto the LORD, then he shall present the beast before the priest:',
   'וְאִם כָּל־בְּהֵמָה טְמֵאָה אֲשֶׁר לֹא־יַקְרִיבוּ מִמֶּנָּה קָרְבָּן לַיהוָה וְהֶעֱמִיד אֶת־הַבְּהֵמָה לִפְנֵי הַכֹּהֵן׃',
   'Wəʾim kāl-bəhēmāh ṭəmēʾāh ʾăšer lōʾ-yaqrîḇû mimmennāh qorbān laYHWH wəheʿĕmîḏ ʾet-habbəhēmāh lip̄nê hakkōhēn.',
   'If an unclean animal (one not suitable for sacrifice, like a donkey or camel) was vowed, it could not be offered to the LORD. Instead, it had to be presented to the priest for valuation. This distinction maintains the purity of the sacrificial system while still allowing for the dedication of other forms of property. The priest''s role was crucial in determining its monetary worth.',
   NULL),
  (12,
   'And the priest shall value it, whether it be good or bad: as thou valuest it, who art the priest, so shall it be.',
   'וְהֶעֱרִיךְ הַכֹּהֵן אֹתָהּ בֵּין טוֹב וּבֵין רָע כְּעֶרְכְּךָ הַכֹּהֵן כֵּן יִהְיֶה׃',
   'Wəheʿĕrîḵ hakkōhēn ʾōtāh bên ṭôḇ ûḇên rāʿ kəʿerkəḵā hakkōhēn kēn yihyeh.',
   'The priest would assess the unclean animal, determining its value whether it was ''good or bad.'' This valuation was final and binding. Unlike clean animals, which became holy and could not be redeemed, unclean animals were valued for their market price, allowing for their redemption or sale. This highlights the practical aspect of managing vows involving items not directly used in worship.',
   NULL),
  (13,
   'But if he will at all redeem it, then he shall add a fifth part thereof unto thy estimation.',
   'וְאִם־גָּאֹל יִגְאָלֶנָּה וְיָסַף חֲמִשִׁיתוֹ עַל־עֶרְכֶּךָ׃',
   'Wəʾim-gāʾōl yiḡʾālennāh wəyāsaph ḥămišîtô ʿal-ʿerkekā.',
   'If the owner wished to redeem the unclean animal, they had to pay the priest''s valuation plus an additional one-fifth (20%) of that value. This ''redemption fee'' served as a penalty for reclaiming something dedicated to God and discouraged casual vows. It also ensured that the sanctuary received a premium for the dedicated item, reinforcing the sacredness of the initial vow.',
   'The ''fifth part'' added for redemption signifies a penalty for reclaiming what was vowed to God, emphasizing the seriousness of vows. It teaches that once something is dedicated to the Lord, it is not to be lightly taken back. This principle underscores the cost of commitment and the importance of fulfilling one''s promises to God.'),
  (14,
   'And when a man shall sanctify his house to be holy unto the LORD, then the priest shall estimate it, whether it be good or bad: as the priest shall estimate it, so shall it stand.',
   'וְאִישׁ כִּי־יַקְדִּשׁ אֶת־בֵּיתוֹ קֹדֶשׁ לַיהוָה וְהֶעֱרִיכוֹ הַכֹּהֵן בֵּין טוֹב וּבֵין רָע כַּאֲשֶׁר יַעֲרִיךְ אֹתוֹ הַכֹּהֵן כֵּן יָקוּם׃',
   'Wəʾîš kî-yaqdîš ʾet-bêtô qōḏeš laYHWH wəheʿĕrîḵô hakkōhēn bên ṭôḇ ûḇên rāʿ kaʾăšer yaʿărîḵ ʾōtô hakkōhēn kēn yāqûm.',
   'The laws extend to the dedication of a house. When a man consecrated his house to the LORD, the priest would assess its value, whether ''good or bad.'' This valuation was final. Unlike animals, a house could not be literally used in the sanctuary, so its dedication meant its monetary value was given. This demonstrates that all forms of property could be consecrated to God, reflecting a holistic approach to worship and devotion.',
   NULL),
  (15,
   'And if he that sanctified it will redeem his house, then he shall add the fifth part of the money of thy estimation unto it, and it shall be his.',
   'וְאִם־הַמַּקְדִּישׁ יִגְאַל אֶת־בֵּיתוֹ וְיָסַף חֲמִשִׁית כֶּסֶף עֶרְכְּךָ עָלָיו וְהָיָה לוֹ׃',
   'Wəʾim-hammaqdîš yiḡʾal ʾet-bêtô wəyāsaph ḥămišît keseph ʿerkəḵā ʿālāw wəhāyāh lô.',
   'Similar to the unclean animal, if the original owner wished to redeem his dedicated house, he had to pay the assessed value plus an additional one-fifth. This redemption process allowed the owner to retain possession of his property while still fulfilling his vow to the LORD. The added fifth part served as a deterrent against rash vows and ensured a premium for the sanctuary.',
   NULL),
  (16,
   'And if a man shall sanctify unto the LORD some part of a field of his possession, then thy estimation shall be according to the seed thereof: an homer of barley seed shall be valued at fifty shekels of silver.',
   'וְאִם מִשְּׂדֵה אֲחֻזָּתוֹ יַקְדִּישׁ אִישׁ לַיהוָה וְהָיָה עֶרְכְּךָ לְפִי זַרְעוֹ זֶרַע חֹמֶר שְׂעֹרִים בַּחֲמִשִּׁים שֶׁקֶל כָּסֶף׃',
   'Wəʾim miśśəḏēh ʾăḥuzzātô yaqdîš ʾîš laYHWH wəhāyāh ʿerkəḵā ləp̄î zarʿô zeraʿ ḥōmer śəʿōrîm baḥămiššîm šeqel kāseph.',
   'Dedication of a field of one''s possession (inherited land) was valued based on the amount of seed required to sow it. A ''homer of barley seed'' (חֹמֶר שְׂעֹרִים, ḥōmer śəʿōrîm), a measure of capacity, was valued at 50 shekels of silver. This method provided a standardized way to assess agricultural land, linking its value to its productive potential. The ''homer'' was a significant measure, roughly 220 liters.',
   'The valuation of land based on its seed capacity highlights God''s concern for agricultural productivity and the practical support of the sanctuary. It teaches that even the means of sustenance and livelihood are ultimately from God and can be consecrated to Him, reflecting a stewardship mindset over all earthly possessions.'),
  (17,
   'If he sanctify his field from the year of jubile, according to thy estimation it shall stand.',
   'אִם־מִשְּׁנַת הַיֹּבֵל יַקְדִּישׁ שָׂדֵהוּ כְּעֶרְכְּךָ יָקוּם׃',
   'ʾIm-miššənaṯ hayyōḇēl yaqdîš śāḏēhû kəʿerkəḵā yāqûm.',
   'If a field was dedicated ''from the year of jubilee'' (מִשְּׁנַת הַיֹּבֵל, miššənaṯ hayyōḇēl), meaning at the beginning of a jubilee cycle, its full estimated value (50 shekels per homer of barley seed) would apply. The Jubilee year (every 50th year) was when all ancestral lands returned to their original owners (Lev 25:10), making it a crucial reference point for land valuations.',
   NULL),
  (18,
   'But if he sanctify his field after the jubile, then the priest shall reckon unto him the money according to the years that remain, even unto the year of the jubile, and it shall be abated from thy estimation.',
   'וְאִם־אַחַר הַיֹּבֵל יַקְדִּישׁ שָׂדֵהוּ וְחִשַּׁב־לוֹ הַכֹּהֵן אֶת־הַכֶּסֶף עַל־פִּי הַשָּׁנִים הַנּוֹתָרֹת עַד שְׁנַת הַיּוֹבֵל וְנִגְרַע מֵעֶרְכֶּךָ׃',
   'Wəʾim-ʾaḥar hayyōḇēl yaqdîš śāḏēhû wəḥiššaḇ-lô hakkōhēn ʾet-hakkeseph ʿal-pî haššānîm hannôṯārōṯ ʿaḏ šənaṯ hayyôḇēl wəniḡraʿ mēʿerkekā.',
   'If a field was dedicated ''after the jubilee,'' its value would be proportionally reduced based on the number of years remaining until the next Jubilee. This calculation accounted for the temporary nature of land possession between Jubilees, as all land reverted to its original owners in the Jubilee year. The priest''s role was to perform this precise calculation, ensuring fairness.',
   NULL),
  (19,
   'And if he that sanctified the field will in any wise redeem it, then he shall add the fifth part of the money of thy estimation unto it, and it shall be assured to him.',
   'וְאִם־גָּאֹל יִגְאַל אֶת־הַשָּׂדֶה הַמַּקְדִּישׁ אֹתוֹ וְיָסַף חֲמִשִׁית כֶּסֶף עֶרְכְּךָ עָלָיו וְקָם לוֹ׃',
   'Wəʾim-gāʾōl yiḡʾal ʾet-haśśāḏeh hammaqdîš ʾōtô wəyāsaph ḥămišît keseph ʿerkəḵā ʿālāw wəqām lô.',
   'To redeem a dedicated field, the original owner had to pay the estimated value (adjusted for the Jubilee cycle) plus an additional one-fifth. This redemption clause, consistent with other dedicated items, allowed the owner to reclaim his ancestral land. The added fee served as a premium for the sanctuary and a reminder of the sacred nature of the vow.',
   NULL),
  (20,
   'And if he will not redeem the field, or if he have sold the field to another man, it shall not be redeemed any more.',
   'וְאִם־לֹא יִגְאַל אֶת־הַשָּׂדֶה וְאִם־מָכַר אֶת־הַשָּׂדֶה לְאִישׁ אַחֵר לֹא יֵגָאֵל עוֹד׃',
   'Wəʾim-lōʾ yiḡʾal ʾet-haśśāḏeh wəʾim-māḵar ʾet-haśśāḏeh ləʾîš ʾaḥēr lōʾ yēḡāʾēl ʿôḏ.',
   'If the original owner did not redeem the dedicated field, or if he sold it to another person after dedicating it, it could no longer be redeemed by him. This emphasizes the finality of certain actions regarding dedicated property. Once the opportunity for redemption passed, or if the field was sold, its status changed irrevocably, preventing further claims by the original dedicator.',
   NULL),
  (21,
   'But the field, when it goeth out in the jubile, shall be holy unto the LORD, as a field devoted; the possession thereof shall be the priest’s.',
   'וְהָיָה הַשָּׂדֶה בְּצֵאתוֹ בַּיֹּבֵל קֹדֶשׁ לַיהוָה כִּשְׂדֵה הַחֵרֶם לַכֹּהֵן תִּהְיֶה אֲחֻזָּתוֹ׃',
   'Wəhāyāh haśśāḏeh bəṣēʾtô bayyōḇēl qōḏeš laYHWH kiśḏēh haḥērem lakkōhēn tihyeh ʾăḥuzzātô.',
   'If an unredeemed field of possession reached the Jubilee year, it became ''holy to the LORD'' (קֹדֶשׁ לַיהוָה, qōḏeš laYHWH) ''as a field devoted'' (כִּשְׂדֵה הַחֵרֶם, kiśḏēh haḥērem). This means it became the permanent possession of the priests, never reverting to the original family. This is a significant consequence, as devoted things (ḥērem) were considered ''most holy'' and irredeemable (v. 28).',
   'This verse introduces the concept of ''ḥērem'' (devoted thing), which signifies complete and irreversible dedication to God. When an unredeemed field becomes ḥērem, it permanently belongs to the priesthood, symbolizing God''s ultimate ownership. This foreshadows the absolute surrender and dedication required in Christ, where believers are ''bought with a price'' and belong entirely to God (1 Cor 6:20).'),
  (22,
   'And if a man sanctify unto the LORD a field which he hath bought, which is not of the fields of his possession;',
   'וְאִם שְׂדֵה מִקְנָתוֹ אֲשֶׁר לֹא מִשְּׂדֵה אֲחֻזָּתוֹ יַקְדִּישׁ לַיהוָה׃',
   'Wəʾim śəḏēh miqnātô ʾăšer lōʾ miśśəḏēh ʾăḥuzzātô yaqdîš laYHWH.',
   'This verse addresses the dedication of a ''bought field'' (שְׂדֵה מִקְנָתוֹ, śəḏēh miqnātô), meaning land that was not part of one''s ancestral inheritance. Such a field would revert to its original owner in the Jubilee year (Lev 25:28), making its dedication different from that of an inherited field. The distinction is crucial for understanding the land laws and their implications for vows.',
   NULL),
  (23,
   'Then the priest shall reckon unto him the worth of thy estimation, even unto the year of the jubile: and he shall give thine estimation in that day, as a holy thing unto the LORD.',
   'וְחִשַּׁב־לוֹ הַכֹּהֵן אֶת־מִכְסַת הָעֶרְכְּךָ עַד שְׁנַת הַיֹּבֵל וְנָתַן אֶת־הָעֶרְכְּךָ בַּיּוֹם הַהוּא קֹדֶשׁ לַיהוָה׃',
   'Wəḥiššaḇ-lô hakkōhēn ʾet-miksaṯ hāʿerkəḵā ʿaḏ šənaṯ hayyōḇēl wənāṯan ʾet-hāʿerkəḵā bayyôm hahhûʾ qōḏeš laYHWH.',
   'For a bought field, the priest would calculate the value based on the remaining years until the Jubilee. The dedicator would then pay this calculated value immediately, and it would be considered ''holy to the LORD.'' This ensures that the sanctuary receives the benefit of the vow without interfering with the Jubilee''s land reversion laws. The payment is a one-time transaction.',
   NULL),
  (24,
   'In the year of the jubile the field shall return unto him of whom it was bought, even to him to whom the possession of the land did belong.',
   'בִּשְׁנַת הַיּוֹבֵל יָשׁוּב הַשָּׂדֶה לַאֲשֶׁר קָנָהוּ מֵאִתּוֹ לַאֲשֶׁר־לוֹ אֲחֻזַּת הָאָרֶץ׃',
   'Bišnaṯ hayyôḇēl yāšûḇ haśśāḏeh laʾăšer qānāhû mēʾittô laʾăšer-lô ʾăḥuzzat hāʾāreṣ.',
   'This verse reiterates the fundamental principle of the Jubilee year: any bought field would return to its original ancestral owner. This law prevented permanent alienation of tribal land and maintained the divinely ordained distribution of property among the Israelite families (cf. Lev 25:13, 28). It highlights God''s concern for social equity and the preservation of family inheritances.',
   'The Jubilee year''s land reversion law underscores God''s sovereignty over all creation and His design for justice and equity within His covenant people. It prevents the permanent accumulation of wealth and ensures that every family retains its inheritance, reflecting a divine concern for social balance and the ultimate ownership of the land by God (Lev 25:23).'),
  (25,
   'And all thy estimations shall be according to the shekel of the sanctuary: twenty gerahs shall be the shekel.',
   'וְכָל־עֶרְכְּךָ יִהְיֶה בְּשֶׁקֶל הַקֹּדֶשׁ עֶשְׂרִים גֵּרָה יִהְיֶה הַשָּׁקֶל׃',
   'Wəḵāl-ʿerkəḵā yihyeh bəšeqel haqqōḏeš ʿeśrîm gērāh yihyeh haššāqel.',
   'This verse serves as a concluding clarification for all valuations mentioned in the chapter. It re-emphasizes that all estimations must be made ''according to the shekel of the sanctuary'' (בְּשֶׁקֶל הַקֹּדֶשׁ, bəšeqel haqqōḏeš), which was a precise standard. It further defines this shekel as consisting of ''twenty gerahs'' (עֶשְׂרִים גֵּרָה, ʿeśrîm gērāh). This meticulous detail ensured accuracy and prevented fraud in sacred transactions (cf. Exod 30:13; Num 3:47).',
   'The insistence on the ''shekel of the sanctuary'' and its precise weight (twenty gerahs) highlights God''s demand for absolute integrity and accuracy in all matters pertaining to His worship. It teaches that God is a God of order and truth, requiring honesty and faithfulness in our dealings with Him, even in the smallest details.'),
  (26,
   'Only the firstling of the beasts, which should be the LORD’s firstling, no man shall sanctify it; whether it be ox, or sheep: it is the LORD’s.',
   'אַךְ בְּכוֹר בְּהֵמָה אֲשֶׁר־יְבֻכַּר לַיהוָה לֹא־יַקְדִּישׁ אִישׁ אֹתוֹ אִם־שׁוֹר אִם־שֶׂה לַיהוָה הוּא׃',
   'ʾAḵ bəḵôr bəhēmāh ʾăšer-yəḇukkar laYHWH lōʾ-yaqdîš ʾîš ʾōtô ʾim-šôr ʾim-śeh laYHWH hûʾ.',
   'This verse makes an important exception: the firstborn of clean animals (ox or sheep) cannot be dedicated by vow because they are already inherently the LORD''s. The law of the firstborn (Exod 13:2, 12; Num 18:15) established that the first offspring belonged to God. Therefore, one cannot ''vow'' what is already divinely owned. This distinction prevents individuals from gaining merit by dedicating what is not truly theirs to give.',
   'This law clarifies that one cannot ''vow'' what already belongs to God. The firstborn is inherently the Lord''s, symbolizing His sovereignty and the redemption of Israel''s firstborn from Egypt. It teaches that true dedication involves giving what is genuinely ours, not merely acknowledging God''s ownership over what is already His by right.'),
  (27,
   'And if it be of an unclean beast, then he shall redeem it according to thine estimation, and shall add a fifth part of it thereto: or if it be not redeemed, then it shall be sold according to thy estimation.',
   'וְאִם בַּבְּהֵמָה הַטְּמֵאָה וּפָדָה בְעֶרְכֶּךָ וְיָסַף חֲמִשִׁיתוֹ עָלָיו וְאִם־לֹא יִגָּאֵל וְנִמְכַּר בְּעֶרְכֶּךָ׃',
   'Wəʾim babəhēmāh haṭṭəmēʾāh ûp̄āḏāh ḇəʿerkekā wəyāsaph ḥămišîtô ʿālāw wəʾim-lōʾ yiḡḡāʾēl wənimkar bəʿerkekā.',
   'If the firstborn was an unclean animal (e.g., a donkey), it could be redeemed according to the priest''s valuation, with the addition of one-fifth. If not redeemed, it was to be sold at its estimated value. This provision aligns with the general law for unclean animals (vv. 11-13) and the redemption of firstborn unclean animals (Exod 13:13), ensuring that even these were handled according to sacred law.',
   NULL),
  (28,
   'Notwithstanding no devoted thing, that a man shall devote unto the LORD of all that he hath, both of man and beast, and of the field of his possession, shall be sold or redeemed: every devoted thing is most holy unto the LORD.',
   'אַךְ כָּל־חֵרֶם אֲשֶׁר יַחֲרִים אִישׁ לַיהוָה מִכָּל־אֲשֶׁר־לוֹ מֵאָדָם וּבְהֵמָה וּמִשְּׂדֵה אֲחֻזָּתוֹ לֹא יִמָּכֵר וְלֹא יִגָּאֵל כָּל־חֵרֶם קֹדֶשׁ קָדָשִׁים הוּא לַיהוָה׃',
   'ʾAḵ kāl-ḥērem ʾăšer yaḥărîm ʾîš laYHWH mikkāl-ʾăšer-lô mēʾāḏām ûḇəhēmāh ûmiśśəḏēh ʾăḥuzzātô lōʾ yimmāḵēr wəlōʾ yiḡḡāʾēl kāl-ḥērem qōḏeš qāḏāšîm hûʾ laYHWH.',
   'This verse introduces the concept of ''ḥērem'' (חֵרֶם), a ''devoted thing.'' Unlike a regular vow, a ḥērem is irrevocably dedicated to the LORD and cannot be sold or redeemed. It is ''most holy'' (קֹדֶשׁ קָדָשִׁים, qōḏeš qāḏāšîm). This category applied to persons, animals, or fields. The concept of ḥērem often carried connotations of destruction, particularly in warfare (e.g., Jericho in Josh 6:17), signifying complete separation to God.',
   'The ''ḥērem'' (devoted thing) represents the highest degree of consecration, signifying irreversible dedication to God. It is ''most holy,'' meaning it cannot be redeemed or sold. This principle underscores God''s absolute sovereignty and the seriousness of total surrender. It can symbolize the complete separation from evil required of God''s people and the ultimate judgment on sin.'),
  (29,
   'None devoted, which shall be devoted of men, shall be redeemed; but shall surely be put to death.',
   'כָּל־חֵרֶם אֲשֶׁר יׇחֳרַם מִן־הָאָדָם לֹא יִפָּדֶה מוֹת יוּמָת׃',
   'Kāl-ḥērem ʾăšer yāḥŏram min-hāʾāḏām lōʾ yippāḏeh môṯ yûmāṯ.',
   'This verse specifies the consequence for a person who is ''devoted'' (ḥērem). Such an individual could not be redeemed but ''shall surely be put to death.'' This is a highly debated and difficult verse. It likely refers to individuals under a judicial sentence of death for egregious sins (e.g., idolatry, blasphemy) who were ''devoted'' to God for destruction, rather than individuals voluntarily vowed. It underscores the severity of God''s justice against ultimate evil in ancient Israel.',
   'This severe consequence for a ''devoted'' person highlights the absolute nature of God''s justice against certain forms of evil in the Old Covenant. It reflects the gravity of sin that warranted complete separation from the community and life itself, emphasizing God''s holiness and intolerance of ultimate rebellion. This contrasts with New Testament grace, where Christ redeems us from the curse of the law (Gal 3:13).'),
  (30,
   'And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD’s: it is holy unto the LORD.',
   'וְכָל־מַעְשַׂר הָאָרֶץ מִזֶּרַע הָאָרֶץ מִפְּרִי הָעֵץ לַיהוָה הוּא קֹדֶשׁ לַיהוָה׃',
   'Wəḵāl-maʿśar hāʾāreṣ mizzeraʿ hāʾāreṣ mippərî hāʿēṣ laYHWH hûʾ qōḏeš laYHWH.',
   'The chapter concludes with laws concerning tithes. All tithes of the land, whether from crops or fruit trees, are declared to be the LORD''s and ''holy to the LORD'' (קֹדֶשׁ לַיהוָה, qōḏeš laYHWH). This was a mandatory offering, distinct from voluntary vows. It acknowledged God''s ownership of all land and its produce, providing for the Levites and the sanctuary (Num 18:21).',
   'The tithe is presented as inherently belonging to the Lord, not merely a voluntary offering. This establishes God''s ultimate ownership over all creation and the fruits of human labor. Tithing is an act of worship and obedience, recognizing God as the provider and supporting His work, a principle echoed in Malachi 3:10 and New Testament principles of generous giving.'),
  (31,
   'And if a man will at all redeem ought of his tithes, he shall add thereto the fifth part thereof.',
   'וְאִם־גָּאֹל יִגְאַל אִישׁ מִמַּעַשְׂרוֹ חֲמִשִׁיתוֹ יֹסֵף עָלָיו׃',
   'Wəʾim-gāʾōl yiḡʾal ʾîš mimmaʿaśrô ḥămišîtô yōsēph ʿālāw.',
   'If someone wished to redeem any part of their tithe (e.g., to keep some produce for themselves instead of giving it), they had to pay its value plus an additional one-fifth. This redemption fee, consistent with other dedicated items, discouraged people from reclaiming what was already designated as holy to the LORD. It reinforced the sanctity and mandatory nature of the tithe.',
   NULL),
  (32,
   'And concerning the tithe of the herd, or of the flock, even of whatsoever passeth under the rod, the tenth shall be holy unto the LORD.',
   'וְכָל־מַעְשַׂר בָּקָר וָצֹאן כֹּל אֲשֶׁר יַעֲבֹר תַּחַת הַשָּׁבֶט הָעֲשִׂירִי יִהְיֶה־קֹּדֶשׁ לַיהוָה׃',
   'Wəḵāl-maʿśar bāqār wāṣōʾn kōl ʾăšer yaʿăḇōr taḥaṯ haššāḇeṭ hāʿăśîrî yihyeh-qqōḏeš laYHWH.',
   'The tithe also applied to livestock. Every tenth animal ''that passes under the rod'' (תַּחַת הַשָּׁבֶט, taḥaṯ haššāḇeṭ) was to be holy to the LORD. This method involved counting animals as they passed through a narrow gate, with every tenth animal being marked as the tithe. This ensured a random and fair selection, preventing owners from intentionally giving inferior animals.',
   'The tithing of livestock, determined by the ''rod'' method, emphasizes God''s claim on a portion of all increase. It teaches impartiality and integrity in giving, as one cannot choose the ''best'' or ''worst'' for the tithe. This reinforces the principle that God deserves a portion of our blessings, given faithfully and without manipulation.'),
  (33,
   'He shall not search whether it be good or bad, neither shall he change it: and if he change it at all, then both it and the change thereof shall be holy; it shall not be redeemed.',
   'לֹא יְבַקֵּר בֵּין טוֹב לָרַע וְלֹא יַחֲמִירֶנּוּ וְאִם־הָמֵר יַמִּירֶנּוּ וְהָיָה הוּא וּתְמוּרָתוֹ יִהְיֶה־קֹּדֶשׁ לֹא יִגָּאֵל׃',
   'Lōʾ yəḇaqqēr bên ṭôḇ lārāʿ wəlōʾ yaḥămîrennû wəʾim-hāmēr yammîrennû wəhāyāh hûʾ ûtəmûrātô yihyeh-qqōḏeš lōʾ yiḡḡāʾēl.',
   'This verse prohibits inspecting the tithed animal to choose a better or worse one, or attempting to substitute it. If a substitution was made, both the original and the replacement became holy and could not be redeemed. This strict rule ensured the integrity of the tithe, preventing human interference with God''s designated portion and reinforcing the sanctity of what was set apart for Him.',
   'This prohibition against inspecting or exchanging tithed animals reinforces the sanctity of God''s portion and the integrity required in giving. It teaches that our offerings to God should be given without manipulation or a desire to withhold the best. This principle of unblemished giving points to Christ, the perfect and unblemished sacrifice (1 Pet 1:19).'),
  (34,
   'These are the commandments, which the LORD commanded Moses for the children of Israel in mount Sinai.',
   'אֵלֶּה הַמִּצְוֹת אֲשֶׁר צִוָּה יְהוָה אֶת־מֹשֶׁה אֶל־בְּנֵי יִשְׂרָאֵל בְּהַר סִינָי׃',
   'ʾĒlleh hammiswōṯ ʾăšer ṣiwwāh YHWH ʾet-Mōšeh ʾel-bənê Yiśrāʾēl bəhar Sînāy.',
   'This concluding verse serves as a colophon for the entire book of Leviticus, emphasizing that all the preceding laws and commandments were divinely given by the LORD to Moses ''in Mount Sinai'' (בְּהַר סִינָי, bəhar Sînāy). It firmly establishes the Mosaic authorship and divine authority of the book, reminding the Israelites (and later readers) that these are not human traditions but God''s holy instructions for His covenant people.',
   'This concluding statement affirms the divine origin and authority of all the laws in Leviticus. It underscores that God Himself is the source of holiness and the standard for His people. For Christians, while the ceremonial laws are fulfilled in Christ, the underlying principles of holiness, obedience, and devotion to God remain eternally relevant (Matt 5:17-18; Heb 8:6).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Leviticus' AND c.chapter_number = 27;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('נֶדֶר', 'neder', 'H5088', 'Derived from the verb ''nādar'' (H5087), meaning ''to vow'' or ''to promise.'' ''Neder'' refers to a solemn promise or vow made to God, often involving the dedication of a person, animal, or property. It was a voluntary act of devotion, but once made, it was considered legally and spiritually binding, requiring meticulous fulfillment. The theological significance lies in the seriousness of commitments made before God and the integrity required in one''s worship.', 1),
  ('אִישׁ', 'ʾîš', 'H376', 'A common Hebrew noun meaning ''man,'' ''male,'' or ''husband.'' In this context, it refers to any individual Israelite who might make a vow. Its usage here emphasizes the personal responsibility and agency of each member of the community in their relationship with God. The term highlights the individual''s capacity for personal devotion and commitment within the covenant framework.', 2),
  ('נְפָשֹׁת', 'nəphāšōt', 'H5315', 'The plural of ''nephesh'' (נֶפֶשׁ), which means ''soul,'' ''life,'' ''person,'' or ''being.'' Here, it refers to ''persons'' being dedicated by vow. The theological implication is that human life itself, in its entirety, can be consecrated to God. While not literal human sacrifice, it signifies the profound extent of devotion, where even one''s very being or the lives of those under one''s care could be symbolically offered to the Lord through monetary redemption.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 27 AND v.verse_number = 2;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('בְּהֵמָה', 'behemah', 'H929', 'A general term for ''beast'' or ''animal,'' often referring to domesticated livestock suitable for food or sacrifice. In this context, it specifically denotes clean animals that could be offered as sacrifices to the LORD. The dedication of such animals by vow signifies the offering of valuable resources and the best of one''s possessions to God, acknowledging His provision and sovereignty over all living creatures.', 1),
  ('קָרְבָּן', 'qorbān', 'H7133', 'Derived from the verb ''qārab'' (H7126), meaning ''to draw near.'' ''Qorbān'' signifies an ''offering'' or ''gift'' brought near to God. It encompasses various types of sacrifices and offerings, serving as a means for individuals to approach God, express devotion, seek atonement, or give thanks. The term underscores the purpose of the dedicated animal: to facilitate communion and worship with the divine.', 2),
  ('קֹדֶשׁ', 'qōḏeš', 'H6944', 'Meaning ''holiness,'' ''sacredness,'' or ''a holy thing.'' It denotes something set apart from the common for God''s exclusive use and purpose. Once an animal is declared ''qōḏeš,'' its status changes, becoming inviolable and dedicated to the sanctuary. This concept is central to Leviticus, emphasizing the separation and purity required in all aspects of worship and life before a holy God.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 27 AND v.verse_number = 9;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('שְׂדֵה', 'śāḏeh', 'H7704', 'Meaning ''field,'' ''country,'' or ''land.'' Here, it refers to agricultural land, specifically a ''field of his possession'' (שְׂדֵה אֲחֻזָּתוֹ), indicating inherited tribal land. The dedication of a field highlights the Israelites'' understanding that even their means of livelihood and the land itself were ultimately God''s. It reflects a commitment to consecrate their most vital resources to the Lord.', 1),
  ('זַרְעוֹ', 'zarʿô', 'H2233', 'From the root ''zāraʿ'' (H2232), meaning ''to sow.'' ''Zeraʿ'' means ''seed,'' ''sowing,'' or ''offspring.'' In this context, it refers to the amount of seed required to sow a field, which was used as the basis for its monetary valuation. This method provided a practical and standardized way to assess the productive capacity of land, linking its value directly to its agricultural potential and contribution to the community.', 2),
  ('חֹמֶר', 'ḥōmer', 'H2549', 'A Hebrew unit of dry measure, equivalent to ten ephahs or about 220 liters (approximately 6 bushels). It also means ''heap'' or ''donkey-load.'' Here, it specifies the quantity of barley seed used as a benchmark for valuing a dedicated field. The use of a precise measure like the homer underscores the meticulousness and standardization required in all transactions related to sacred vows and offerings.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 27 AND v.verse_number = 16;

-- Verse 21
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('חֵרֶם', 'ḥērem', 'H2764', 'Derived from the verb ''ḥāram'' (H2763), meaning ''to utterly destroy,'' ''to devote,'' or ''to put under a ban.'' ''Ḥērem'' refers to something irrevocably dedicated to God, often implying its destruction or complete separation from common use. It is ''most holy'' (קֹדֶשׁ קָדָשִׁים) and cannot be redeemed or sold. Theologically, it signifies God''s absolute claim and judgment, often applied to things or people deemed utterly defiled or dedicated for His exclusive purpose.', 1),
  ('כֹּהֵן', 'kōhēn', 'H3548', 'Meaning ''priest.'' The priests, descendants of Aaron, were divinely appointed mediators between God and Israel. Their duties included offering sacrifices, teaching the law, and making judgments in sacred matters. In this chapter, the priest''s role is crucial in assessing valuations, overseeing redemptions, and ensuring the proper handling of dedicated and devoted items, highlighting their authority in maintaining the sanctity of worship.', 2),
  ('אֲחֻזָּתוֹ', 'ʾaḥuzzātô', 'H272', 'Derived from ''ʾāḥaz'' (H270), meaning ''to grasp'' or ''to possess.'' ''ʾAḥuzzāh'' refers to ''possession,'' ''property,'' or ''inheritance,'' particularly ancestral land. In the context of the Jubilee, this land was inalienable, meant to remain within the family. When a field becomes ''ḥērem'' and is given to the priests, it signifies a permanent transfer of this ancestral possession, underscoring the profound and irreversible nature of such a dedication.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 27 AND v.verse_number = 21;

-- Verse 28
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('חֵרֶם', 'ḥērem', 'H2764', 'As in verse 21, ''ḥērem'' denotes a ''devoted thing'' that is irrevocably consecrated to God. This verse explicitly states that such an item, whether man, beast, or field, cannot be sold or redeemed. Its status as ''most holy'' (קֹדֶשׁ קָדָשִׁים) means it is entirely separated for God, often implying destruction or permanent dedication to the sanctuary. It represents the ultimate form of consecration, beyond any possibility of reclamation.', 1),
  ('מָכַר', 'māḵar', 'H4376', 'Meaning ''to sell.'' The prohibition against selling a ''ḥērem'' item emphasizes its sacred and inalienable status. Unlike other dedicated items that could be redeemed or sold for the sanctuary''s benefit, a ''ḥērem'' was removed from all commercial exchange. This reinforces the idea that once something is utterly devoted to God, it is no longer part of the human economy but belongs solely to the divine realm.', 2),
  ('גָּאַל', 'gāʾal', 'H1350', 'Meaning ''to redeem,'' ''to buy back,'' or ''to act as a kinsman-redeemer.'' The prohibition against redeeming a ''ḥērem'' item is crucial. While many dedicated items could be bought back with an added fee, a ''ḥērem'' could not. This highlights the irreversible nature of this type of consecration, signifying a complete and final transfer of ownership to God, with no possibility of human reclamation.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 27 AND v.verse_number = 28;

-- Verse 30
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('מַעְשַׂר', 'maʿśar', 'H4643', 'Derived from ''ʿāśar'' (H6237), meaning ''to be rich'' or ''to tithe.'' ''Maʿśar'' means ''tithe'' or ''tenth part.'' It refers to the mandatory giving of one-tenth of agricultural produce and livestock to the LORD. Unlike voluntary vows, the tithe was a fundamental obligation, acknowledging God''s ownership of all resources and providing for the sustenance of the Levites and the sanctuary. It is a foundational act of worship and obedience.', 1),
  ('הָאָרֶץ', 'hāʾāreṣ', 'H776', 'Meaning ''the land'' or ''the earth.'' In this context, it specifically refers to the land of Israel and its produce. The tithe of the land underscores the theological principle that the land itself, and all that it yields, belongs to God (Lev 25:23). Tithing is an act of recognizing divine sovereignty over the very ground from which sustenance comes, fostering a stewardship mindset.', 2),
  ('קֹדֶשׁ', 'qōḏeš', 'H6944', 'As seen previously, ''qōḏeš'' means ''holiness'' or ''a holy thing.'' Here, it declares the tithe to be inherently ''holy to the LORD.'' This means the tithe is set apart for God''s exclusive use and purpose, not merely a charitable donation. Its sacred status implies that it must be handled with reverence and cannot be treated as common property, reinforcing the seriousness of this divine command.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 27 AND v.verse_number = 30;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Leviticus 1:1', 1),
  (1, 'Leviticus 4:1', 2),
  (1, 'Numbers 1:1', 3),
  (1, 'Exodus 19:3', 4),
  (2, 'Numbers 6:2', 1),
  (2, 'Deuteronomy 23:21-23', 2),
  (2, 'Ecclesiastes 5:4-5', 3),
  (2, 'Psalm 66:13-14', 4),
  (3, 'Exodus 30:13', 1),
  (3, 'Numbers 3:47', 2),
  (3, 'Ezekiel 45:12', 3),
  (4, 'Leviticus 27:5', 1),
  (4, 'Leviticus 27:7', 2),
  (5, 'Leviticus 27:3', 1),
  (5, 'Leviticus 27:4', 2),
  (5, 'Leviticus 27:7', 3),
  (6, 'Leviticus 27:3', 1),
  (6, 'Leviticus 27:4', 2),
  (6, 'Leviticus 27:7', 3),
  (7, 'Leviticus 27:3', 1),
  (7, 'Leviticus 27:4', 2),
  (7, 'Leviticus 27:5', 3),
  (8, 'Leviticus 5:7', 1),
  (8, 'Leviticus 5:11', 2),
  (8, '2 Corinthians 8:12', 3),
  (9, 'Leviticus 1:2', 1),
  (9, 'Deuteronomy 12:6', 2),
  (9, 'Malachi 1:14', 3),
  (10, 'Deuteronomy 15:19', 1),
  (10, 'Malachi 1:8', 2),
  (10, 'Romans 12:1', 3),
  (11, 'Leviticus 11:1-47', 1),
  (11, 'Deuteronomy 14:3-20', 2),
  (12, 'Leviticus 27:8', 1),
  (12, 'Leviticus 27:14', 2),
  (13, 'Leviticus 27:15', 1),
  (13, 'Leviticus 27:19', 2),
  (13, 'Leviticus 27:27', 3),
  (14, 'Leviticus 27:12', 1),
  (14, 'Numbers 30:2', 2),
  (15, 'Leviticus 27:13', 1),
  (15, 'Leviticus 27:19', 2),
  (16, 'Leviticus 25:15-16', 1),
  (16, 'Numbers 18:21', 2),
  (17, 'Leviticus 25:10', 1),
  (17, 'Leviticus 25:28', 2),
  (18, 'Leviticus 25:15-16', 1),
  (18, 'Leviticus 25:50-52', 2),
  (19, 'Leviticus 27:13', 1),
  (19, 'Leviticus 27:15', 2),
  (20, 'Leviticus 25:23-28', 1),
  (21, 'Leviticus 25:10', 1),
  (21, 'Leviticus 27:28', 2),
  (21, 'Numbers 18:14', 3),
  (21, 'Ezekiel 44:29', 4),
  (22, 'Leviticus 25:25', 1),
  (22, 'Leviticus 25:30', 2),
  (23, 'Leviticus 25:16', 1),
  (23, 'Leviticus 25:50-52', 2),
  (24, 'Leviticus 25:10', 1),
  (24, 'Leviticus 25:28', 2),
  (25, 'Exodus 30:13', 1),
  (25, 'Numbers 3:47', 2),
  (25, 'Ezekiel 45:12', 3),
  (26, 'Exodus 13:2', 1),
  (26, 'Exodus 13:12', 2),
  (26, 'Numbers 18:15', 3),
  (26, 'Deuteronomy 15:19', 4),
  (27, 'Exodus 13:13', 1),
  (27, 'Exodus 34:20', 2),
  (27, 'Leviticus 27:13', 3),
  (28, 'Numbers 18:14', 1),
  (28, 'Joshua 6:17-19', 2),
  (28, 'Deuteronomy 7:26', 3),
  (28, 'Leviticus 27:21', 4),
  (29, 'Exodus 22:20', 1),
  (29, 'Deuteronomy 13:15', 2),
  (29, 'Joshua 7:25', 3),
  (30, 'Leviticus 23:39', 1),
  (30, 'Numbers 18:21', 2),
  (30, 'Deuteronomy 14:22-23', 3),
  (30, 'Malachi 3:8-10', 4),
  (31, 'Leviticus 27:13', 1),
  (31, 'Leviticus 27:15', 2),
  (31, 'Leviticus 27:19', 3),
  (32, 'Genesis 28:22', 1),
  (32, 'Numbers 18:26', 2),
  (32, 'Ezekiel 20:37', 3),
  (33, 'Leviticus 22:20-24', 1),
  (33, 'Malachi 1:8', 2),
  (33, 'Leviticus 27:10', 3),
  (34, 'Leviticus 26:46', 1),
  (34, 'Numbers 36:13', 2),
  (34, 'Deuteronomy 33:4', 3),
  (34, 'John 1:17', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Leviticus' AND c.chapter_number = 27 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Leviticus Chapter 27 Complete!
-- 34 verses · 6 key verses with word studies (18 words)
-- Cross-references for 34 verses (95 refs)
-- ═══════════════════════════════════════════════════════