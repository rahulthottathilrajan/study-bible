-- ============================================
-- SEED DATA: Genesis Chapter 1 (All 31 Verses)
-- Run this in Supabase SQL Editor AFTER the schema
-- ============================================

-- 1. INSERT GENESIS BOOK
INSERT INTO books (name, testament, category, total_chapters, book_order, original_name, original_meaning, author, date_written, key_theme, summary)
VALUES (
  'Genesis', 'Old Testament', 'Pentateuch', 50, 1,
  'בְּרֵאשִׁית', 'In the Beginning',
  'Moses', 'c. 1446–1406 BC',
  'Origins — of the universe, humanity, sin, and redemption',
  'The book of beginnings. Genesis records the creation of the world, the fall of humanity, the flood, and God''s covenant with Abraham and his descendants. It establishes the foundation for the entire biblical narrative.'
);

-- 2. INSERT GENESIS CHAPTER 1
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
VALUES (
  (SELECT id FROM books WHERE name = 'Genesis'),
  1,
  'The Creation account — the foundational chapter of the entire Bible. In six days, God creates the heavens and the earth, bringing order out of chaos and filling the void with life. This chapter establishes God as the sovereign, all-powerful Creator who speaks all things into existence. The progression moves from formlessness to form (Days 1-3) and from emptiness to fullness (Days 4-6), culminating in the creation of humanity in God''s own image.',
  'Creation & the Sovereignty of God',
  'בָּרָא (bara)',
  'To create out of nothing — used exclusively for divine creative activity',
  '["Day 1 (vv.1-5): Light separated from Darkness","Day 2 (vv.6-8): Waters above separated from waters below (Firmament)","Day 3 (vv.9-13): Dry land and vegetation","Day 4 (vv.14-19): Sun, Moon, and Stars","Day 5 (vv.20-23): Sea creatures and Birds","Day 6 (vv.24-31): Land animals and Humanity"]'
);

-- 3. INSERT ALL 31 VERSES
-- Store the chapter_id for reuse
DO $$
DECLARE
  ch_id INTEGER;
  v_id INTEGER;
BEGIN
  SELECT id INTO ch_id FROM chapters WHERE book_id = (SELECT id FROM books WHERE name = 'Genesis') AND chapter_number = 1;

  -- ═══ VERSE 1 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
  VALUES (ch_id, 1,
    'In the beginning God created the heaven and the earth.',
    'בְּרֵאשִׁית בָּרָא אֱלֹהִים אֵת הַשָּׁמַיִם וְאֵת הָאָרֶץ׃',
    'Bereshit bara Elohim et hashamayim ve''et ha''aretz.',
    'The opening verse of the Bible establishes the most fundamental truths in Scripture: (1) There was a beginning to the material universe, (2) God existed before and independent of that creation, (3) God alone is the Creator. The Hebrew word ''Elohim'' is grammatically plural used with a singular verb ''bara'' — this unity-in-plurality hints at the Trinitarian nature of God more fully revealed in the New Testament. The phrase ''the heaven and the earth'' is a merism — a Hebrew literary device using two opposites to encompass everything between them, meaning God created absolutely everything.',
    'This single verse refutes: atheism (God exists), agnosticism (God is knowable through His works), polytheism (one God created), pantheism (God is separate from creation), materialism (matter had a beginning), and humanism (God, not man, is the ultimate reality).'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'בְּרֵאשִׁית', 'Bereshit', 'H7225', 'In the beginning — the absolute starting point; the first, the chief. This word gives the Hebrew name of the entire book.', 1),
    (v_id, 'בָּרָא', 'bara', 'H1254', 'Created — to create ex nihilo (from nothing). This verb is used exclusively of God''s creative activity. Distinct from ''asah'' (to make/fashion) and ''yatsar'' (to form/mold).', 2),
    (v_id, 'אֱלֹהִים', 'Elohim', 'H430', 'God — a plural noun (literally ''Gods'') used with a singular verb, suggesting plurality within unity. The most common name for God in Genesis 1 (used 35 times).', 3),
    (v_id, 'הַשָּׁמַיִם', 'hashamayim', 'H8064', 'The heavens — the sky, the visible universe, the celestial realm. A dual/plural form, suggesting the vastness of creation.', 4),
    (v_id, 'הָאָרֶץ', 'ha''aretz', 'H776', 'The earth — the land, the ground. Together with ''heavens,'' this is a merism meaning God created absolutely everything.', 5);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'John 1:1-3', 1), (v_id, 'Hebrews 11:3', 2), (v_id, 'Psalm 33:6,9', 3),
    (v_id, 'Isaiah 45:18', 4), (v_id, 'Colossians 1:16-17', 5), (v_id, 'Nehemiah 9:6', 6), (v_id, 'Acts 17:24', 7);

  -- ═══ VERSE 2 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 2,
    'And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.',
    'וְהָאָרֶץ הָיְתָה תֹהוּ וָבֹהוּ וְחֹשֶׁךְ עַל־פְּנֵי תְהוֹם וְרוּחַ אֱלֹהִים מְרַחֶפֶת עַל־פְּנֵי הַמָּיִם׃',
    'Veha''aretz hayetah tohu vavohu vechoshekh al-penei tehom veruach Elohim merachefet al-penei hamayim.',
    'This verse describes the raw, unformed state of creation before God shaped it. ''Tohu vavohu'' describes two deficiencies: the earth was unformed (no structure) and unfilled (no inhabitants). Days 1-3 address the formlessness by creating realms, while Days 4-6 address the emptiness by filling them. The Spirit ''hovering'' (merachefet) uses the same word as a mother eagle hovering over her young (Deut 32:11) — suggesting protective, nurturing, creative power.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'תֹהוּ', 'tohu', 'H8414', 'Without form — formlessness, chaos, confusion. The earth in its initial unformed state.', 1),
    (v_id, 'בֹהוּ', 'vohu', 'H922', 'Void — emptiness, waste. Together with ''tohu,'' it describes total desolation — unformed and unfilled.', 2),
    (v_id, 'תְהוֹם', 'tehom', 'H8415', 'The deep — the primordial abyss, the deep waters. Here it is simply water, not a deity as in pagan myths.', 3),
    (v_id, 'רוּחַ', 'ruach', 'H7307', 'Spirit/Wind/Breath — here ''the Spirit of God,'' the Holy Spirit. The same word means spirit, wind, and breath.', 4),
    (v_id, 'מְרַחֶפֶת', 'merachefet', 'H7363', 'Moved/Hovered/Brooded — like a bird hovering protectively over its nest (cf. Deut 32:11). Conveys tender, creative energy.', 5);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Isaiah 45:18', 1), (v_id, 'Jeremiah 4:23', 2), (v_id, 'Psalm 104:30', 3),
    (v_id, 'Job 26:7', 4), (v_id, 'Deuteronomy 32:11', 5), (v_id, 'Job 33:4', 6);

  -- ═══ VERSE 3 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 3,
    'And God said, Let there be light: and there was light.',
    'וַיֹּאמֶר אֱלֹהִים יְהִי אוֹר וַיְהִי־אוֹר׃',
    'Vayomer Elohim yehi or vayehi-or.',
    'God creates by speaking — His word carries creative, life-giving power. The brevity of the Hebrew (just 6 words) underscores the effortlessness and immediacy of divine creation. Light was created before the sun (Day 4), indicating that God Himself is the ultimate source of light. Paul connects this to spiritual illumination in 2 Corinthians 4:6.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'וַיֹּאמֶר', 'vayomer', 'H559', 'And He said — the first recorded words of God. Creation by divine speech demonstrates absolute authority.', 1),
    (v_id, 'יְהִי', 'yehi', 'H1961', 'Let there be — jussive (command) form. Not a wish but a sovereign decree.', 2),
    (v_id, 'אוֹר', 'or', 'H216', 'Light — physical electromagnetic radiation, also symbolizing God''s presence, truth, and revelation throughout Scripture.', 3);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, '2 Corinthians 4:6', 1), (v_id, 'Psalm 33:6,9', 2), (v_id, 'John 1:4-5', 3),
    (v_id, '1 John 1:5', 4), (v_id, 'James 1:17', 5), (v_id, 'Psalm 148:5', 6);

  -- ═══ VERSE 4 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 4,
    'And God saw the light, that it was good: and God divided the light from the darkness.',
    'וַיַּרְא אֱלֹהִים אֶת־הָאוֹר כִּי־טוֹב וַיַּבְדֵּל אֱלֹהִים בֵּין הָאוֹר וּבֵין הַחֹשֶׁךְ׃',
    'Vayar Elohim et-ha''or ki-tov vayavdel Elohim bein ha''or uvein hachoshekh.',
    'Two significant acts: God evaluates (''saw... good'') and separates (''divided''). The pattern of evaluation and separation runs through the entire creation account. God''s work of creating involves making distinctions — between light and darkness, waters above and below, sea and land. This principle of holy distinction becomes foundational to the Law and to the Gospel.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'טוֹב', 'tov', 'H2896', 'Good — beautiful, pleasant, excellent, fit for purpose. God''s aesthetic and moral evaluation of His work.', 1),
    (v_id, 'וַיַּבְדֵּל', 'vayavdel', 'H914', 'Divided/Separated — to make a distinction, to set apart. A key creation verb — God creates order through holy distinctions.', 2);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Isaiah 45:7', 1), (v_id, '1 John 1:5-7', 2), (v_id, '2 Corinthians 6:14', 3), (v_id, 'Ephesians 5:8', 4);

  -- ═══ VERSE 5 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 5,
    'And God called the light Day, and the darkness he called Night. And the evening and the morning were the first day.',
    'וַיִּקְרָא אֱלֹהִים לָאוֹר יוֹם וְלַחֹשֶׁךְ קָרָא לָיְלָה וַיְהִי־עֶרֶב וַיְהִי־בֹקֶר יוֹם אֶחָד׃',
    'Vayikra Elohim la''or yom velachoshekh kara laylah vayehi-erev vayehi-voker yom echad.',
    'God''s naming act demonstrates His absolute sovereignty. To name something in Hebrew culture is to define it and have authority over it. The formula ''evening and morning'' establishes the Hebrew day beginning at sunset. The word ''echad'' (one) rather than ''rishon'' (first) is the same word used in the Shema (Deut 6:4) to describe God''s oneness — a word expressing composite unity.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'וַיִּקְרָא', 'vayikra', 'H7121', 'Called/Named — to name is to exercise sovereignty and authority over something.', 1),
    (v_id, 'יוֹם', 'yom', 'H3117', 'Day — can refer to a 24-hour period, daylight hours, or an era. With ''evening and morning,'' marks a defined period.', 2),
    (v_id, 'עֶרֶב', 'erev', 'H6153', 'Evening — the setting, the mixing of light and dark. The Hebrew day begins at evening.', 3),
    (v_id, 'בֹקֶר', 'voker', 'H1242', 'Morning — the breaking through, the dawn.', 4),
    (v_id, 'אֶחָד', 'echad', 'H259', 'One/First — a unified one. Same word used in the Shema to describe God''s oneness, expressing composite unity.', 5);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 74:16', 1), (v_id, 'Genesis 2:2-3', 2), (v_id, 'Exodus 20:11', 3), (v_id, 'Deuteronomy 6:4', 4);

  -- ═══ VERSE 6 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 6,
    'And God said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.',
    'וַיֹּאמֶר אֱלֹהִים יְהִי רָקִיעַ בְּתוֹךְ הַמָּיִם וִיהִי מַבְדִּיל בֵּין מַיִם לָמָיִם׃',
    'Vayomer Elohim yehi raqia betokh hamayim vihi mavdil bein mayim lamayim.',
    'Day 2 begins. The ''raqia'' (firmament/expanse) is the atmospheric expanse — the sky. God creates a separation between the waters on earth''s surface and the moisture in the atmosphere. This is the only day where God does not pronounce His work ''good'' — possibly because the separation is completed on Day 3.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'רָקִיעַ', 'raqia', 'H7549', 'Firmament/Expanse — from ''raqa'' (to spread out, expand). The vast expanse of the sky/atmosphere.', 1);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 19:1', 1), (v_id, 'Job 37:18', 2), (v_id, 'Proverbs 8:28', 3), (v_id, 'Isaiah 40:22', 4);

  -- ═══ VERSE 7 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 7,
    'And God made the firmament, and divided the waters which were under the firmament from the waters which were above the firmament: and it was so.',
    'וַיַּעַשׂ אֱלֹהִים אֶת־הָרָקִיעַ וַיַּבְדֵּל בֵּין הַמַּיִם אֲשֶׁר מִתַּחַת לָרָקִיעַ וּבֵין הַמַּיִם אֲשֶׁר מֵעַל לָרָקִיעַ וַיְהִי־כֵן׃',
    'Vaya''as Elohim et-haraqia vayavdel bein hamayim asher mitachat laraqia uvein hamayim asher me''al laraqia vayehi-khen.',
    'Note the shift from ''bara'' (create from nothing) to ''asah'' (make/fashion from existing material). God takes the formless creation and shapes it. ''And it was so'' (vayehi-khen) appears 6 times in Genesis 1, affirming the absolute efficacy of God''s word.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'וַיַּעַשׂ', 'vaya''as', 'H6213', 'Made/Fashioned — ''asah'' means to make from existing material, distinct from ''bara'' (create from nothing).', 1),
    (v_id, 'וַיְהִי־כֵן', 'vayehi-khen', 'H1961/H3651', 'And it was so — God''s commands are immediately and completely fulfilled.', 2);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Job 26:10', 1), (v_id, 'Psalm 148:4', 2), (v_id, 'Proverbs 8:27-29', 3), (v_id, '2 Peter 3:5', 4);

  -- ═══ VERSE 8 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 8,
    'And God called the firmament Heaven. And the evening and the morning were the second day.',
    'וַיִּקְרָא אֱלֹהִים לָרָקִיעַ שָׁמָיִם וַיְהִי־עֶרֶב וַיְהִי־בֹקֶר יוֹם שֵׁנִי׃',
    'Vayikra Elohim laraqia shamayim vayehi-erev vayehi-voker yom sheni.',
    'God names the expanse ''Heaven'' (shamayim). Scripture recognizes multiple heavens: (1) atmospheric, (2) celestial/outer space, (3) God''s dwelling place. This is the only day without ''it was good,'' as the work continues into Day 3.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'שָׁמַיִם', 'shamayim', 'H8064', 'Heaven/Sky — here the atmospheric heaven, as distinct from God''s dwelling place (Deut 10:14).', 1);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 19:1', 1), (v_id, 'Deuteronomy 10:14', 2), (v_id, '2 Corinthians 12:2', 3);

  -- ═══ VERSE 9 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 9,
    'And God said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.',
    'וַיֹּאמֶר אֱלֹהִים יִקָּווּ הַמַּיִם מִתַּחַת הַשָּׁמַיִם אֶל־מָקוֹם אֶחָד וְתֵרָאֶה הַיַּבָּשָׁה וַיְהִי־כֵן׃',
    'Vayomer Elohim yikkavu hamayim mitachat hashamayim el-maqom echad vetera''eh hayabashah vayehi-khen.',
    'Day 3 begins with God gathering the waters into seas and causing dry land to emerge. God''s command over the waters demonstrates absolute dominion over nature. Job 38:8-11 describes God setting boundaries for the sea.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'יִקָּווּ', 'yikkavu', 'H6960', 'Be gathered — to collect, bind together. The waters converge into defined basins.', 1),
    (v_id, 'הַיַּבָּשָׁה', 'hayabashah', 'H3004', 'Dry land — firm ground, the habitable surface of the earth emerges.', 2);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 33:7', 1), (v_id, 'Psalm 95:5', 2), (v_id, 'Job 38:8-11', 3), (v_id, 'Proverbs 8:29', 4), (v_id, 'Jeremiah 5:22', 5);

  -- ═══ VERSE 10 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 10,
    'And God called the dry land Earth; and the gathering together of the waters called he Seas: and God saw that it was good.',
    'וַיִּקְרָא אֱלֹהִים לַיַּבָּשָׁה אֶרֶץ וּלְמִקְוֵה הַמַּיִם קָרָא יַמִּים וַיַּרְא אֱלֹהִים כִּי־טוֹב׃',
    'Vayikra Elohim layabashah eretz ulemikveh hamayim kara yamim vayar Elohim ki-tov.',
    'The first ''good'' of Day 3. God names the dry ground ''Earth'' and the waters ''Seas,'' exercising sovereign authority. He names the realms before filling them with inhabitants.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 95:5', 1), (v_id, 'Psalm 146:6', 2), (v_id, 'Jonah 1:9', 3);

  -- ═══ VERSE 11 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 11,
    'And God said, Let the earth bring forth grass, the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself, upon the earth: and it was so.',
    'וַיֹּאמֶר אֱלֹהִים תַּדְשֵׁא הָאָרֶץ דֶּשֶׁא עֵשֶׂב מַזְרִיעַ זֶרַע עֵץ פְּרִי עֹשֶׂה פְּרִי לְמִינוֹ אֲשֶׁר זַרְעוֹ־בוֹ עַל־הָאָרֶץ וַיְהִי־כֵן׃',
    'Vayomer Elohim tadsheh ha''aretz deshe esev mazria zera etz peri oseh peri lemino asher zar''o-vo al-ha''aretz vayehi-khen.',
    'Three categories of vegetation: grass (simple ground cover), herbs (seed-bearing plants), and fruit trees. ''After his kind'' (lemino) appears 10 times in Genesis 1, establishing reproduction within defined types. The word ''seed'' (zera) becomes theologically crucial — the seed of the woman (Gen 3:15), the seed of Abraham, and ultimately Christ (Galatians 3:16).'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'דֶּשֶׁא', 'deshe', 'H1877', 'Grass/Vegetation — tender, young plant growth. The simplest category of plant life.', 1),
    (v_id, 'עֵשֶׂב', 'esev', 'H6212', 'Herb/Plant — seed-bearing plants, including grains and vegetables.', 2),
    (v_id, 'לְמִינוֹ', 'lemino', 'H4327', 'After its kind — according to its species/type. Reproduction within kinds.', 3),
    (v_id, 'זֶרַע', 'zera', 'H2233', 'Seed — means of reproduction; later becomes a key Messianic term (Gen 3:15, Gal 3:16).', 4);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 104:14', 1), (v_id, 'Matthew 6:28-30', 2), (v_id, '1 Corinthians 15:38', 3), (v_id, 'Genesis 3:15', 4);

  -- ═══ VERSE 12 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 12,
    'And the earth brought forth grass, and herb yielding seed after his kind, and the tree yielding fruit, whose seed was in itself, after his kind: and God saw that it was good.',
    'וַתּוֹצֵא הָאָרֶץ דֶּשֶׁא עֵשֶׂב מַזְרִיעַ זֶרַע לְמִינֵהוּ וְעֵץ עֹשֶׂה־פְּרִי אֲשֶׁר זַרְעוֹ־בוֹ לְמִינֵהוּ וַיַּרְא אֱלֹהִים כִּי־טוֹב׃',
    'Vatotze ha''aretz deshe esev mazria zera leminehu ve''etz oseh-peri asher zar''o-vo leminehu vayar Elohim ki-tov.',
    'The earth responds obediently to God''s command. The second ''good'' on Day 3 compensates for Day 2''s absence. Vegetation was created before the sun (Day 4) — showing plant life depends ultimately on God, not merely on natural processes.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Hebrews 6:7', 1), (v_id, 'James 5:18', 2), (v_id, 'Psalm 65:9-13', 3);

  -- ═══ VERSE 13 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 13,
    'And the evening and the morning were the third day.',
    'וַיְהִי־עֶרֶב וַיְהִי־בֹקֶר יוֹם שְׁלִישִׁי׃',
    'Vayehi-erev vayehi-voker yom shelishi.',
    'Day 3 closes with a double blessing. In the New Testament, the third day becomes the day of resurrection (1 Cor 15:4). Days 1-3 have addressed the formlessness — creating realms. Days 4-6 will address the emptiness by filling each realm.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Hosea 6:2', 1), (v_id, 'Matthew 12:40', 2), (v_id, '1 Corinthians 15:4', 3);

  -- ═══ VERSE 14 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 14,
    'And God said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:',
    'וַיֹּאמֶר אֱלֹהִים יְהִי מְאֹרֹת בִּרְקִיעַ הַשָּׁמַיִם לְהַבְדִּיל בֵּין הַיּוֹם וּבֵין הַלָּיְלָה וְהָיוּ לְאֹתֹת וּלְמוֹעֲדִים וּלְיָמִים וְשָׁנִים׃',
    'Vayomer Elohim yehi me''orot birqia hashamayim lehavdil bein hayom uvein halaylah vehayu le''otot ulemo''adim uleyamim veshanim.',
    'Day 4: Four purposes for the luminaries: (1) divide day from night, (2) signs — navigational, prophetic markers, (3) seasons (mo''adim) — literally ''appointed times,'' linking to God''s sacred calendar and feast days, (4) days and years. They are ''me''orot'' (light-bearers), not the source of light itself.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'מְאֹרֹת', 'me''orot', 'H3974', 'Lights/Luminaries — light-bearers or light-holders, not the source of light but vessels that regulate it.', 1),
    (v_id, 'אֹתֹת', 'otot', 'H226', 'Signs — signals, markers. Celestial bodies serve as God''s visible signs (cf. Star of Bethlehem).', 2),
    (v_id, 'מוֹעֲדִים', 'mo''adim', 'H4150', 'Seasons/Appointed times — literally ''appointed meetings.'' Later used for Israel''s feast days (Leviticus 23).', 3);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 19:1-6', 1), (v_id, 'Psalm 104:19', 2), (v_id, 'Jeremiah 31:35', 3), (v_id, 'Matthew 2:2', 4), (v_id, 'Leviticus 23:2', 5);

  -- ═══ VERSE 15 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 15,
    'And let them be for lights in the firmament of the heaven to give light upon the earth: and it was so.',
    'וְהָיוּ לִמְאוֹרֹת בִּרְקִיעַ הַשָּׁמַיִם לְהָאִיר עַל־הָאָרֶץ וַיְהִי־כֵן׃',
    'Vehayu lime''orot birqia hashamayim leha''ir al-ha''aretz vayehi-khen.',
    'The practical purpose of the luminaries: to illuminate the earth for its future inhabitants. They are servants, not masters — created to serve God''s purposes. This counters pagan worship of celestial bodies.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Genesis 1:3', 1), (v_id, 'Psalm 136:7-9', 2), (v_id, 'Revelation 22:5', 3);

  -- ═══ VERSE 16 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 16,
    'And God made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.',
    'וַיַּעַשׂ אֱלֹהִים אֶת־שְׁנֵי הַמְּאֹרֹת הַגְּדֹלִים אֶת־הַמָּאוֹר הַגָּדֹל לְמֶמְשֶׁלֶת הַיּוֹם וְאֶת־הַמָּאוֹר הַקָּטֹן לְמֶמְשֶׁלֶת הַלַּיְלָה וְאֵת הַכּוֹכָבִים׃',
    'Vaya''as Elohim et-shenei hame''orot hagedolim et-hama''or hagadol lememsheleth hayom ve''et-hama''or hakaton lememsheleth halaylah ve''et hakkokhavim.',
    'The sun and moon are not named — they are simply ''the greater light'' and ''the lesser light.'' This avoids naming pagan deities (shemesh/yareach). ''He made the stars also'' is one of Scripture''s greatest understatements — billions upon billions of stars are a casual afterthought to God who ''calleth them all by names'' (Psalm 147:4).'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'לְמֶמְשֶׁלֶת', 'lememsheleth', 'H4475', 'To rule/govern — delegated authority under God''s ultimate sovereignty.', 1),
    (v_id, 'הַכּוֹכָבִים', 'hakkokhavim', 'H3556', 'The stars — mentioned almost as an afterthought, yet numbering in the billions. This understatement magnifies God''s power.', 2);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 136:7-9', 1), (v_id, 'Psalm 8:3', 2), (v_id, 'Isaiah 40:26', 3), (v_id, 'Psalm 147:4', 4);

  -- ═══ VERSE 17 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 17,
    'And God set them in the firmament of the heaven to give light upon the earth,',
    'וַיִּתֵּן אֹתָם אֱלֹהִים בִּרְקִיעַ הַשָּׁמָיִם לְהָאִיר עַל־הָאָרֶץ׃',
    'Vayitten otam Elohim birqia hashamayim leha''ir al-ha''aretz.',
    'God ''set'' (placed intentionally) the luminaries. Every celestial body occupies its God-appointed place. Modern astronomy confirms the extraordinary precision of cosmic fine-tuning.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 8:3', 1), (v_id, 'Isaiah 40:22', 2), (v_id, 'Job 9:9', 3);

  -- ═══ VERSE 18 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 18,
    'And to rule over the day and over the night, and to divide the light from the darkness: and God saw that it was good.',
    'וְלִמְשֹׁל בַּיּוֹם וּבַלַּיְלָה וּלְהַבְדִּיל בֵּין הָאוֹר וּבֵין הַחֹשֶׁךְ וַיַּרְא אֱלֹהִים כִּי־טוֹב׃',
    'Velimshol bayom uvalaylah ulehavdil bein ha''or uvein hachoshekh vayar Elohim ki-tov.',
    'The governing function mirrors Day 1''s separation of light from darkness, now through appointed instruments. The reliability of the sun and moon becomes a metaphor for God''s covenant faithfulness (Jeremiah 33:20-21).'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 136:8-9', 1), (v_id, 'Jeremiah 33:20-21', 2), (v_id, 'Genesis 8:22', 3);

  -- ═══ VERSE 19 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 19,
    'And the evening and the morning were the fourth day.',
    'וַיְהִי־עֶרֶב וַיְהִי־בֹקֶר יוֹם רְבִיעִי׃',
    'Vayehi-erev vayehi-voker yom revi''i.',
    'Day 4 corresponds to Day 1: where Day 1 created light, Day 4 creates the light-bearers. This parallel (Day 1/4, Day 2/5, Day 3/6) reveals God''s orderly design — forming realms, then filling them.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Exodus 20:11', 1);

  -- ═══ VERSE 20 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 20,
    'And God said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.',
    'וַיֹּאמֶר אֱלֹהִים יִשְׁרְצוּ הַמַּיִם שֶׁרֶץ נֶפֶשׁ חַיָּה וְעוֹף יְעוֹפֵף עַל־הָאָרֶץ עַל־פְּנֵי רְקִיעַ הַשָּׁמָיִם׃',
    'Vayomer Elohim yishretzu hamayim sheretz nefesh chayyah ve''of ye''ofef al-ha''aretz al-penei reqia hashamayim.',
    'Day 5: God fills the realms created on Day 2 (sky and sea). ''Swarm'' (sharats) emphasizes extravagant abundance. ''Nefesh chayyah'' (living soul) marks a new level — animal life possesses an animating life-principle that plants do not.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'יִשְׁרְצוּ', 'yishretzu', 'H8317', 'Bring forth abundantly/Swarm — to teem in great numbers. God creates with lavish abundance.', 1),
    (v_id, 'נֶפֶשׁ חַיָּה', 'nefesh chayyah', 'H5315/H2416', 'Living creature/soul — the breath-soul, animating life principle. First use of ''nefesh'' distinguishing animal from plant life.', 2),
    (v_id, 'עוֹף', 'of', 'H5775', 'Fowl/Flying creatures — birds and all creatures that fly.', 3);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 104:25-26', 1), (v_id, 'Psalm 148:7-10', 2), (v_id, 'Job 12:7-9', 3);

  -- ═══ VERSE 21 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 21,
    'And God created great whales, and every living creature that moveth, which the waters brought forth abundantly, after their kind, and every winged fowl after his kind: and God saw that it was good.',
    'וַיִּבְרָא אֱלֹהִים אֶת־הַתַּנִּינִם הַגְּדֹלִים וְאֵת כָּל־נֶפֶשׁ הַחַיָּה הָרֹמֶשֶׂת אֲשֶׁר שָׁרְצוּ הַמַּיִם לְמִינֵהֶם וְאֵת כָּל־עוֹף כָּנָף לְמִינֵהוּ וַיַּרְא אֱלֹהִים כִּי־טוֹב׃',
    'Vayivra Elohim et-hatanninim hagedolim ve''et kol-nefesh hachayyah haromeset asher sharetzu hamayim lemineihem ve''et kol-of kanaf leminehu vayar Elohim ki-tov.',
    'The return of ''bara'' (second use after v.1) signals something new: animate life with ''nefesh'' (soul). ''Tanninim'' (great sea creatures) are merely creatures in God''s creation — countering pagan myths of sea monsters as chaos deities.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'הַתַּנִּינִם', 'hatanninim', 'H8577', 'Great whales/Sea monsters — large sea creatures. In pagan myth these were chaos deities; Genesis demythologizes them entirely.', 1),
    (v_id, 'בָּרָא', 'bara', 'H1254', 'Created — the special verb returns, signaling that animal life with ''nefesh'' required a new divine creative act.', 2);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 148:7', 1), (v_id, 'Job 41:1', 2), (v_id, 'Isaiah 27:1', 3), (v_id, 'Psalm 104:25-26', 4);

  -- ═══ VERSE 22 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 22,
    'And God blessed them, saying, Be fruitful, and multiply, and fill the waters in the seas, and let fowl multiply in the earth.',
    'וַיְבָרֶךְ אֹתָם אֱלֹהִים לֵאמֹר פְּרוּ וּרְבוּ וּמִלְאוּ אֶת־הַמַּיִם בַּיַּמִּים וְהָעוֹף יִרֶב בָּאָרֶץ׃',
    'Vayevarekh otam Elohim lemor peru urevu umil''u et-hamayim bayamim veha''of yirev ba''aretz.',
    'The first blessing in Scripture — God endows creatures with the capacity to reproduce. ''Be fruitful and multiply'' will be repeated to humanity (v.28) and to Noah (Gen 9:1). This is not merely permission but divine empowerment.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'וַיְבָרֶךְ', 'vayevarekh', 'H1288', 'Blessed — the first divine blessing in Scripture. To endow with power for success, fruitfulness, and prosperity.', 1),
    (v_id, 'פְּרוּ וּרְבוּ', 'peru urevu', 'H6509/H7235', 'Be fruitful and multiply — the first command to living creatures. God''s blessing enables what His command requires.', 2);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Genesis 1:28', 1), (v_id, 'Genesis 9:1', 2), (v_id, 'Genesis 9:7', 3);

  -- ═══ VERSE 23 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 23,
    'And the evening and the morning were the fifth day.',
    'וַיְהִי־עֶרֶב וַיְהִי־בֹקֶר יוֹם חֲמִישִׁי׃',
    'Vayehi-erev vayehi-voker yom chamishi.',
    'Day 5 corresponds to Day 2: where Day 2 created sky and sea, Day 5 fills them with inhabitants.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Exodus 20:11', 1);

  -- ═══ VERSE 24 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 24,
    'And God said, Let the earth bring forth the living creature after his kind, cattle, and creeping thing, and beast of the earth after his kind: and it was so.',
    'וַיֹּאמֶר אֱלֹהִים תּוֹצֵא הָאָרֶץ נֶפֶשׁ חַיָּה לְמִינָהּ בְּהֵמָה וָרֶמֶשׂ וְחַיְתוֹ־אֶרֶץ לְמִינָהּ וַיְהִי־כֵן׃',
    'Vayomer Elohim totze ha''aretz nefesh chayyah leminah behemah varemes vechayyeto-eretz leminah vayehi-khen.',
    'Day 6 begins — the climactic day. Three categories of land animals: livestock (behemah), creeping things (remes), and wild beasts (chayyah). All reproduce ''after their kind.'''
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'בְּהֵמָה', 'behemah', 'H929', 'Cattle/Livestock — domesticated or large land animals.', 1),
    (v_id, 'רֶמֶשׂ', 'remes', 'H7431', 'Creeping things — small animals that move close to the ground: reptiles, insects, small mammals.', 2),
    (v_id, 'חַיָּה', 'chayyah', 'H2416', 'Beast/Wild animal — untamed creatures of the field and forest.', 3);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 50:10', 1), (v_id, 'Job 12:7-10', 2), (v_id, 'Psalm 104:24-25', 3);

  -- ═══ VERSE 25 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 25,
    'And God made the beast of the earth after his kind, and cattle after their kind, and every thing that creepeth upon the earth after his kind: and God saw that it was good.',
    'וַיַּעַשׂ אֱלֹהִים אֶת־חַיַּת הָאָרֶץ לְמִינָהּ וְאֶת־הַבְּהֵמָה לְמִינָהּ וְאֵת כָּל־רֶמֶשׂ הָאֲדָמָה לְמִינֵהוּ וַיַּרְא אֱלֹהִים כִּי־טוֹב׃',
    'Vaya''as Elohim et-chayyat ha''aretz leminah ve''et-habehemah leminah ve''et kol-remes ha''adamah leminehu vayar Elohim ki-tov.',
    'God ''made'' (asah) the land animals. The word ''adamah'' (ground) appears here, foreshadowing the creation of ''adam'' (man) from the same ground (Gen 2:7). God pronounces this ''good,'' setting the stage for humanity.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Genesis 2:7', 1), (v_id, 'Genesis 2:19', 2), (v_id, 'Psalm 104:24', 3);

  -- ═══ VERSE 26 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
  VALUES (ch_id, 26,
    'And God said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.',
    'וַיֹּאמֶר אֱלֹהִים נַעֲשֶׂה אָדָם בְּצַלְמֵנוּ כִּדְמוּתֵנוּ וְיִרְדּוּ בִדְגַת הַיָּם וּבְעוֹף הַשָּׁמַיִם וּבַבְּהֵמָה וּבְכָל־הָאָרֶץ וּבְכָל־הָרֶמֶשׂ הָרֹמֵשׂ עַל־הָאָרֶץ׃',
    'Vayomer Elohim na''aseh adam betsalmenu kidmutenu veyirdu vidgat hayam uve''of hashamayim uvabehemah uvekhol-ha''aretz uvekhol-haremes haromes al-ha''aretz.',
    'The most theologically dense verse in Genesis 1. Unique features: (1) Divine deliberation — ''Let us make'' introduces a heavenly counsel. (2) The plural ''us/our'' — Christians see the Trinity in dialogue. (3) ''Image and likeness'' — humanity uniquely reflects God in rationality, morality, creativity, and relational capacity. (4) Dominion — humanity is God''s vice-regent, ruling creation on His behalf as stewards.',
    'The Imago Dei (Image of God): This doctrine is the foundation of human dignity, equality, ethics, and rights. Every human being bears God''s image regardless of age, ability, race, or status.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'נַעֲשֶׂה', 'na''aseh', 'H6213', 'Let us make — first person plural cohortative. A divine deliberation before the supreme creative act.', 1),
    (v_id, 'אָדָם', 'adam', 'H120', 'Man/Humanity — from ''adamah'' (ground). The one formed from dust who bears God''s image.', 2),
    (v_id, 'צֶלֶם', 'tselem', 'H6754', 'Image — a representative figure, reflection of the original. Essential nature and structural likeness.', 3),
    (v_id, 'דְּמוּת', 'demut', 'H1823', 'Likeness — resemblance, similitude. Relational and functional resemblance, not physical identity.', 4),
    (v_id, 'וְיִרְדּוּ', 'veyirdu', 'H7287', 'Have dominion — to rule as God''s vice-regent, exercising stewardship under divine authority.', 5);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Genesis 5:1-3', 1), (v_id, 'Genesis 9:6', 2), (v_id, 'Psalm 8:5-8', 3),
    (v_id, 'James 3:9', 4), (v_id, 'Colossians 3:10', 5), (v_id, '1 Corinthians 11:7', 6), (v_id, 'Ephesians 4:24', 7);

  -- ═══ VERSE 27 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
  VALUES (ch_id, 27,
    'So God created man in his own image, in the image of God created he him; male and female created he them.',
    'וַיִּבְרָא אֱלֹהִים אֶת־הָאָדָם בְּצַלְמוֹ בְּצֶלֶם אֱלֹהִים בָּרָא אֹתוֹ זָכָר וּנְקֵבָה בָּרָא אֹתָם׃',
    'Vayivra Elohim et-ha''adam betsalmo betselem Elohim bara oto zakhar unekevah bara otam.',
    '''Bara'' appears THREE times in this verse — a poetic triplet emphasizing the supreme significance of human creation. The threefold repetition may echo the Trinity. Both male and female bear God''s image equally. Gender distinction is part of God''s original design.',
    'Both male and female bear God''s image equally. Gender distinction is part of God''s original creative design, not a result of the Fall.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'בָּרָא', 'bara', 'H1254', 'Created — appears THREE times, a rare poetic intensification emphasizing humanity''s unique, sacred creation.', 1),
    (v_id, 'זָכָר', 'zakhar', 'H2145', 'Male — from a root meaning ''to remember, to be mindful of.''', 2),
    (v_id, 'נְקֵבָה', 'nekevah', 'H5347', 'Female — from a root meaning ''to pierce, to designate.'' Both equally bear God''s image.', 3);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Matthew 19:4', 1), (v_id, 'Mark 10:6', 2), (v_id, 'Galatians 3:28', 3),
    (v_id, 'Genesis 2:7', 4), (v_id, 'Genesis 2:21-23', 5), (v_id, 'Genesis 5:2', 6);

  -- ═══ VERSE 28 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
  VALUES (ch_id, 28,
    'And God blessed them, and God said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.',
    'וַיְבָרֶךְ אֹתָם אֱלֹהִים וַיֹּאמֶר לָהֶם אֱלֹהִים פְּרוּ וּרְבוּ וּמִלְאוּ אֶת־הָאָרֶץ וְכִבְשֻׁהָ וּרְדוּ בִּדְגַת הַיָּם וּבְעוֹף הַשָּׁמַיִם וּבְכָל־חַיָּה הָרֹמֶשֶׂת עַל־הָאָרֶץ׃',
    'Vayevarekh otam Elohim vayomer lahem Elohim peru urevu umil''u et-ha''aretz vekhivshuha uredu bidgat hayam uve''of hashamayim uvekhol-chayyah haromeset al-ha''aretz.',
    'The Cultural Mandate: God''s first words to humanity — a blessing followed by five commands: (1) Be fruitful, (2) Multiply, (3) Fill the earth, (4) Subdue it, (5) Have dominion. This is stewardship, not exploitation. Work, family, and cultural development are part of God''s original ''very good'' design.',
    'The Cultural Mandate: Human civilization — work, art, science, culture, family — is not secular but sacred. This mandate has never been revoked.'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'וַיְבָרֶךְ', 'vayevarekh', 'H1288', 'Blessed — God''s empowering word enabling humanity to fulfill its mandate.', 1),
    (v_id, 'פְּרוּ וּרְבוּ', 'peru urevu', 'H6509/H7235', 'Be fruitful and multiply — the cultural mandate to populate the earth.', 2),
    (v_id, 'וְכִבְשֻׁהָ', 'vekhivshuha', 'H3533', 'Subdue — bring under control, harness resources. Active cultivation, not passive existence.', 3),
    (v_id, 'וּרְדוּ', 'uredu', 'H7287', 'Have dominion — rule as God''s representative. Stewardship, not exploitation.', 4);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Genesis 9:1-3', 1), (v_id, 'Psalm 8:6-8', 2), (v_id, 'Psalm 115:16', 3), (v_id, 'Acts 17:26', 4);

  -- ═══ VERSE 29 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 29,
    'And God said, Behold, I have given you every herb bearing seed, which is upon the face of all the earth, and every tree, in the which is the fruit of a tree yielding seed; to you it shall be for meat.',
    'וַיֹּאמֶר אֱלֹהִים הִנֵּה נָתַתִּי לָכֶם אֶת־כָּל־עֵשֶׂב זֹרֵעַ זֶרַע אֲשֶׁר עַל־פְּנֵי כָל־הָאָרֶץ וְאֶת־כָּל־הָעֵץ אֲשֶׁר־בּוֹ פְרִי־עֵץ זֹרֵעַ זָרַע לָכֶם יִהְיֶה לְאָכְלָה׃',
    'Vayomer Elohim hinneh natatti lakhem et-kol-esev zorea zera asher al-penei khol-ha''aretz ve''et-kol-ha''etz asher-bo feri-etz zorea zara lakhem yihyeh le''okhlah.',
    'God''s original provision was a plant-based diet. Meat-eating is permitted only after the Flood (Gen 9:3). This vegetarian beginning points to the ideal state of creation before the Fall, and Isaiah 11:6-9 suggests a return to this harmony.'
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Genesis 2:16', 1), (v_id, 'Genesis 9:3', 2), (v_id, 'Psalm 104:14-15', 3), (v_id, '1 Timothy 4:3-4', 4);

  -- ═══ VERSE 30 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note)
  VALUES (ch_id, 30,
    'And to every beast of the earth, and to every fowl of the air, and to every thing that creepeth upon the earth, wherein there is life, I have given every green herb for meat: and it was so.',
    'וּלְכָל־חַיַּת הָאָרֶץ וּלְכָל־עוֹף הַשָּׁמַיִם וּלְכֹל רוֹמֵשׂ עַל־הָאָרֶץ אֲשֶׁר־בּוֹ נֶפֶשׁ חַיָּה אֶת־כָּל־יֶרֶק עֵשֶׂב לְאָכְלָה וַיְהִי־כֵן׃',
    'Ulekhol-chayyat ha''aretz ulekhol-of hashamayim ulekhol romes al-ha''aretz asher-bo nefesh chayyah et-kol-yerek esev le''okhlah vayehi-khen.',
    'All animals were also given plants for food — the original creation was entirely non-predatory. No death in the animal kingdom before the Fall. Isaiah 11:6-7 envisions a future restoration where ''the lion shall eat straw like the ox.'''
  ) RETURNING id INTO v_id;
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 104:14', 1), (v_id, 'Psalm 145:15-16', 2), (v_id, 'Isaiah 11:6-7', 3), (v_id, 'Isaiah 65:25', 4);

  -- ═══ VERSE 31 ═══
  INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
  VALUES (ch_id, 31,
    'And God saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day.',
    'וַיַּרְא אֱלֹהִים אֶת־כָּל־אֲשֶׁר עָשָׂה וְהִנֵּה־טוֹב מְאֹד וַיְהִי־עֶרֶב וַיְהִי־בֹקֶר יוֹם הַשִּׁשִּׁי׃',
    'Vayar Elohim et-kol-asher asah vehineh-tov me''od vayehi-erev vayehi-voker yom hashishi.',
    'The grand finale. God declares creation ''very good'' (tov me''od) — the only superlative used. Everything functions in perfect harmony. Note ''THE sixth day'' uniquely has the definite article (ha-shishi), giving this final day special prominence. This is the benchmark against which the Fall (Gen 3) and New Creation (Rev 21-22) must be understood.',
    'The original creation was entirely good — free from sin, death, suffering, and disorder. Evil is not part of God''s design but an intrusion. The biblical narrative arcs from ''very good'' through the Fall, through redemption, to ultimate restoration when God will ''make all things new'' (Rev 21:5).'
  ) RETURNING id INTO v_id;
  INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order) VALUES
    (v_id, 'וְהִנֵּה', 'vehineh', 'H2009', 'And behold! — an exclamation of wonder and delight. God beholds His completed creation with joyful satisfaction.', 1),
    (v_id, 'טוֹב מְאֹד', 'tov me''od', 'H2896/H3966', 'Very good — exceedingly, supremely good. The highest evaluation in the creation account.', 2),
    (v_id, 'הַשִּׁשִּׁי', 'hashishi', 'H8345', 'THE sixth — uniquely has the definite article, unlike days 1-5, giving it special emphasis as the climactic day.', 3);
  INSERT INTO cross_references (verse_id, reference, ref_order) VALUES
    (v_id, 'Psalm 104:31', 1), (v_id, '1 Timothy 4:4', 2), (v_id, 'Ecclesiastes 3:11', 3),
    (v_id, 'Romans 8:19-22', 4), (v_id, 'Revelation 21:1-5', 5);

END $$;

-- ============================================
-- VERIFY: Check your data
-- ============================================
-- Run this to confirm everything was inserted:
-- SELECT COUNT(*) as total_verses FROM verses;
-- Expected: 31
-- SELECT COUNT(*) as total_words FROM word_studies;
-- SELECT COUNT(*) as total_refs FROM cross_references;