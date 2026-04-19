-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 12 — Cosmic Conflict: The Woman, the Dragon, and the Triumph of Christ and His People
-- 17 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 12,
  'Revelation 12 presents a dramatic cosmic conflict between divine forces and Satan, depicted through symbolic imagery. It introduces a ''woman'' representing God''s people (Israel and the Church) and her ''man child,'' who is Christ. The chapter narrates the birth and ascension of Christ, followed by Satan''s failed attempt to devour Him. Subsequently, a war erupts in heaven, resulting in Satan''s expulsion to earth. This expulsion leads to intensified persecution of God''s people, but they are divinely protected and ultimately overcome Satan through Christ''s sacrifice and their steadfast testimony. The chapter serves as a theological interlude, explaining the spiritual forces behind the tribulation and the ultimate victory of God''s kingdom.',
  'Cosmic Conflict: The Woman, the Dragon, and the Triumph of Christ and His People',
  'δράκων (drakōn)',
  'The Greek word ''drakōn'' refers to a ''dragon'' or ''serpent,'' often associated with mythical beasts. In Revelation 12, it is explicitly identified with ''that old serpent, called the Devil, and Satan'' (v. 9). This term vividly portrays Satan''s monstrous, destructive, and ancient nature, emphasizing his role as the primary antagonist against God''s plan and His people throughout history.',
  '["Section 1 (vv.1-4): The Woman, the Child, and the Dragon''s Threat","Section 2 (vv.5-6): The Child''s Ascension and the Woman''s Flight to the Wilderness","Section 3 (vv.7-9): War in Heaven and Satan''s Expulsion to Earth","Section 4 (vv.10-12): The Heavenly Proclamation of Salvation and Woe to the Earth","Section 5 (vv.13-16): The Dragon''s Persecution of the Woman and Divine Protection","Section 6 (v.17): The Dragon''s Continued War Against the Remnant"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 17 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And there appeared a great wonder in heaven; a woman clothed with the sun, and the moon under her feet, and upon her head a crown of twelve stars:',
   'Καὶ σημεῖον μέγα ὤφθη ἐν τῷ οὐρανῷ, γυνὴ περιβεβλημένη τὸν ἥλιον, καὶ ἡ σελήνη ὑποκάτω τῶν ποδῶν αὐτῆς, καὶ ἐπὶ τῆς κεφαλῆς αὐτῆς στέφανος ἀστέρων δώδεκα.',
   'Kai sēmeion mega ōphthē en tō ouranō, gynē peribeblēmenē ton hēlion, kai hē selēnē hypokatō tōn podōn autēs, kai epi tēs kephalēs autēs stephanos asterōn dōdeka.',
   'This verse introduces a ''great wonder'' or ''sign'' (σημεῖον) in heaven, a common motif in apocalyptic literature. The ''woman'' is a highly symbolic figure, widely interpreted as representing the faithful people of God throughout history—initially Israel, from whom the Messiah came, and subsequently the Church. Her attire, ''clothed with the sun, with the moon under her feet, and a crown of twelve stars,'' evokes imagery from Genesis 37:9-10 (Joseph''s dream), where the sun, moon, and eleven stars represent Jacob, Rachel, and the twelve tribes of Israel. This suggests a continuity of God''s covenant people.',
   'The woman symbolizes the corporate people of God, encompassing both Old Testament Israel and the New Testament Church, from whom Christ emerged. This imagery underscores the continuity of God''s redemptive plan through His chosen people, highlighting their divine origin and ultimate glory, even amidst tribulation.'),
  (2,
   'And she being with child cried, travailing in birth, and pained to be delivered.',
   'καὶ ἐν γαστρὶ ἔχουσα καὶ κράζουσα ὠδίνουσα καὶ βασανιζομένη τεκεῖν.',
   'kai en gastri echousa kai krazousa ōdinousa kai basanizomenē tekein.',
   'The woman''s ''travailing in birth'' signifies the intense suffering and anticipation preceding the birth of the Messiah. This imagery connects to Old Testament prophecies of Israel''s anguish before deliverance (e.g., Isaiah 26:17-18, Micah 4:9-10). It emphasizes the pain and struggle inherent in God''s redemptive plan, culminating in the incarnation of Christ. The ''pains to be delivered'' can also be seen as reflecting the spiritual travail of God''s people throughout history as they await the fulfillment of His promises.',
   NULL),
  (3,
   'And there appeared another wonder in heaven; and behold a great red dragon, having seven heads and ten horns, and seven crowns upon his heads.',
   'Καὶ ὤφθη ἄλλο σημεῖον ἐν τῷ οὐρανῷ, καὶ ἰδοὺ δράκων μέγας πυρρὸς ἔχων κεφαλὰς ἑπτὰ καὶ κέρατα δέκα, καὶ ἐπὶ τὰς κεφαλὰς αὐτοῦ ἑπτὰ διαδήματα.',
   'Kai ōphthē allo sēmeion en tō ouranō, kai idou drakōn megas pyrros echōn kephalas hepta kai kerata deka, kai epi tas kephalas autou hepta diadēmata.',
   'A second ''sign'' appears: a ''great red dragon.'' This figure is explicitly identified as Satan in verse 9. His ''red'' color often symbolizes bloodshed and destructive power. The ''seven heads and ten horns'' are common apocalyptic symbols of political power and dominion, often linked to oppressive empires (cf. Daniel 7:7, Revelation 13:1). The ''seven crowns'' (διαδήματα, ''diadems'') on his heads signify his usurped authority and claim to kingship over earthly kingdoms, contrasting with the woman''s crown of stars.',
   'The great red dragon is Satan, the arch-enemy of God and humanity. His description with seven heads, ten horns, and seven crowns symbolizes his vast, albeit temporary and illegitimate, power and dominion over earthly kingdoms, through which he opposes God''s sovereign rule and persecutes His people.'),
  (4,
   'And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.',
   'καὶ ἡ οὐρὰ αὐτοῦ σύρει τὸ τρίτον τῶν ἀστέρων τοῦ οὐρανοῦ καὶ ἔβαλεν αὐτοὺς εἰς τὴν γῆν. καὶ ὁ δράκων ἔστηκεν ἐνώπιον τῆς γυναικὸς τῆς μελλούσης τεκεῖν, ἵνα ὅταν τέκῃ τὸ τέκνον αὐτῆς καταφάγῃ.',
   'kai hē oura autou syrei to triton tōn asterōn tou ouranou kai ebalen autous eis tēn gēn. kai ho drakōn estēken enōpion tēs gynaikos tēs mellousēs tekein, hina hotan tekē to teknon autēs kataphagē.',
   'The dragon''s tail drawing ''the third part of the stars of heaven'' and casting them to earth is widely interpreted as Satan''s rebellion and the fall of a significant portion of angels who joined him (cf. Jude 1:6). This highlights Satan''s ancient origin and his power to deceive and lead others astray. His standing before the woman to ''devour her child'' immediately upon birth illustrates his relentless opposition to Christ from the very beginning, echoing historical events like Herod''s attempt to kill the infant Jesus (Matt 2:16).',
   'This verse reveals Satan''s ancient rebellion, leading a third of the angels in his fall, and his persistent, murderous intent against the Messiah. It underscores the spiritual reality of cosmic warfare and Satan''s direct opposition to God''s redemptive plan, particularly through the incarnation of Christ.'),
  (5,
   'And she brought forth a man child, who was to rule all nations with a rod of iron: and her child was caught up unto God, and to his throne.',
   'Καὶ ἔτεκεν υἱὸν ἄρσεν, ὃς μέλλει ποιμαίνειν πάντα τὰ ἔθνη ἐν ῥάβδῳ σιδηρᾷ· καὶ ἡρπάσθη τὸ τέκνον αὐτῆς πρὸς τὸν θεὸν καὶ πρὸς τὸν θρόνον αὐτοῦ.',
   'Kai eteken hyion arsen, hos mellei poimainein panta ta ethnē en rhabdō sidēra; kai hērpasthē to teknon autēs pros ton theon kai pros ton thronon autou.',
   'The ''man child'' is unequivocally identified as Jesus Christ. The description ''who was to rule all nations with a rod of iron'' directly quotes Psalm 2:9, a messianic prophecy affirming Christ''s ultimate authority and righteous judgment. The child being ''caught up unto God, and to his throne'' refers to Christ''s ascension into heaven after His resurrection (Acts 1:9-11). This swift ascension thwarts the dragon''s attempt to destroy Him, signifying Christ''s victory over Satan and His enthronement at the right hand of God.',
   'This verse is a concise Christological statement, affirming Jesus Christ as the promised Messiah, born of God''s people, destined to rule all nations with divine authority (Psalm 2:9). His immediate ascension to God''s throne signifies His triumph over Satan and His enthronement as sovereign Lord, securing salvation for humanity.'),
  (6,
   'And the woman fled into the wilderness, where she hath a place prepared of God, that they should feed her there a thousand two hundred and threescore days.',
   'Καὶ ἡ γυνὴ ἔφυγεν εἰς τὴν ἔρημον, ὅπου ἔχει ἐκεῖ τόπον ἡτοιμασμένον ἀπὸ τοῦ θεοῦ, ἵνα ἐκεῖ τρέφωσιν αὐτὴν ἡμέρας χιλίας διακοσίας ἑξήκοντα.',
   'Kai hē gynē ephugen eis tēn erēmon, hopou echei ekei topon hētoimasmenon apo tou theou, hina ekei trephōsin autēn hēmeras chilias diakosias hexēkonta.',
   'After Christ''s ascension, the woman (God''s people) flees into the ''wilderness,'' a place of refuge and divine sustenance, reminiscent of Israel''s forty years in the wilderness (Exodus 16:35). This symbolizes a period of persecution and protection for the Church. The duration, ''a thousand two hundred and threescore days'' (1260 days), is equivalent to 3.5 years or ''a time, and times, and half a time'' (v. 14), a symbolic period of tribulation and divine care found elsewhere in Daniel (7:25, 12:7) and Revelation (11:2-3).',
   NULL),
  (7,
   'And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,',
   'Καὶ ἐγένετο πόλεμος ἐν τῷ οὐρανῷ, ὁ Μιχαὴλ καὶ οἱ ἄγγελοι αὐτοῦ τοῦ πολεμῆσαι μετὰ τοῦ δράκοντος. καὶ ὁ δράκων ἐπολέμησεν καὶ οἱ ἄγγελοι αὐτοῦ,',
   'Kai egeneto polemos en tō ouranō, ho Michaēl kai hoi angeloi autou tou polemēsai meta tou drakontos. kai ho drakōn epolemēsen kai hoi angeloi autou,',
   'This verse describes a pivotal ''war in heaven.'' Michael, identified as an archangel and Israel''s guardian in Daniel 10:13, 21 and 12:1, leads God''s angelic forces against the dragon and his angels. This conflict is not merely symbolic but a real spiritual battle, reflecting the ongoing cosmic struggle between good and evil. The timing of this war is often understood to occur after Christ''s ascension, as His victory on the cross and subsequent enthronement seal Satan''s ultimate defeat.',
   'The war in heaven, led by Michael against Satan and his angels, signifies a decisive turning point in cosmic history. It underscores the reality of spiritual warfare and the ultimate triumph of God''s angelic host over the forces of evil, culminating in Satan''s expulsion from his place of access to God.'),
  (8,
   'And prevailed not; neither was their place found any more in heaven.',
   'καὶ οὐκ ἴσχυσαν, οὐδὲ τόπος εὑρέθη αὐτῶν ἔτι ἐν τῷ οὐρανῷ.',
   'kai ouk ischysan, oude topos heurethē autōn eti en tō ouranō.',
   'The outcome of the heavenly war is clear: the dragon and his angels ''prevailed not.'' This signifies Satan''s decisive defeat and loss of his position in heaven. The phrase ''neither was their place found any more in heaven'' indicates a permanent expulsion, stripping Satan of his access to God''s presence, where he previously acted as the ''accuser of our brethren'' (v. 10; cf. Job 1:6-12, Zechariah 3:1-2). This expulsion marks a significant shift in the spiritual battleground.',
   NULL),
  (9,
   'And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.',
   'καὶ ἐβλήθη ὁ δράκων ὁ μέγας, ὁ ὄφις ὁ ἀρχαῖος, ὁ καλούμενος Διάβολος καὶ ὁ Σατανᾶς, ὁ πλανῶν τὴν οἰκουμένην ὅλην, ἐβλήθη εἰς τὴν γῆν, καὶ οἱ ἄγγελοι αὐτοῦ μετ’ αὐτοῦ ἐβλήθησαν.',
   'kai eblēthē ho drakōn ho megas, ho ophis ho archaios, ho kaloumenos Diabolos kai ho Satanas, ho planōn tēn oikoumenēn holēn, eblēthē eis tēn gēn, kai hoi angeloi autou met'' autou eblēthēsan.',
   'This verse explicitly identifies the dragon with multiple titles: ''that old serpent'' (referencing Genesis 3:1-15), ''the Devil'' (Διάβολος, ''slanderer'' or ''accuser''), and ''Satan'' (Σατανᾶς, ''adversary''). He is also described as ''which deceiveth the whole world.'' His casting out ''into the earth'' signifies his restricted sphere of influence, now confined to the earthly realm. This event, often linked to Christ''s victory on the cross and ascension, marks a significant curtailment of Satan''s power and access, though not his complete annihilation.',
   'This verse provides a comprehensive identification of the cosmic enemy: the great dragon is the ancient serpent, the Devil, and Satan, the deceiver of the world. His expulsion from heaven to earth signifies a decisive defeat, limiting his sphere of influence and intensifying his wrath against humanity, knowing his time is short.'),
  (10,
   'And I heard a loud voice saying in heaven, Now is come salvation, and strength, and the kingdom of our God, and the power of his Christ: for the accuser of our brethren is cast down, which accused them before our God day and night.',
   'Καὶ ἤκουσα φωνὴν μεγάλην ἐν τῷ οὐρανῷ λέγουσαν, Ἄρτι ἐγένετο ἡ σωτηρία καὶ ἡ δύναμις καὶ ἡ βασιλεία τοῦ θεοῦ ἡμῶν καὶ ἡ ἐξουσία τοῦ Χριστοῦ αὐτοῦ, ὅτι ἐβλήθη ὁ κατήγορος τῶν ἀδελφῶν ἡμῶν, ὁ κατηγορῶν αὐτοὺς ἐνώπιον τοῦ θεοῦ ἡμῶν ἡμέρας καὶ νυκτός.',
   'Kai ēkousa phōnēn megalēn en tō ouranō legousan, Arti egeneto hē sōtēria kai hē dynamis kai hē basileia tou theou hēmōn kai hē exousia tou Christou autou, hoti eblēthē ho katēgoros tōn adelphōn hēmōn, ho katēgorōn autous enōpion tou theou hēmōn hēmeras kai nyktos.',
   'A ''loud voice'' in heaven proclaims the arrival of ''salvation, and strength, and the kingdom of our God, and the power of his Christ.'' This triumphant declaration directly links these divine realities to Satan''s expulsion. The voice celebrates the downfall of ''the accuser of our brethren,'' who ''accused them before our God day and night.'' This highlights one of Satan''s primary roles: to slander and condemn believers before God. His expulsion means believers are no longer subject to his constant accusations in the heavenly court.',
   'This heavenly proclamation celebrates the decisive victory of God''s kingdom and Christ''s authority, directly linked to Satan''s expulsion. It emphasizes that salvation and power are now fully realized because the ''accuser of the brethren'' has been cast down, signifying the believer''s freedom from condemnation through Christ''s work.'),
  (11,
   'And they overcame him by the blood of the Lamb, and by the word of their testimony; and they loved not their lives unto the death.',
   'καὶ αὐτοὶ ἐνίκησαν αὐτὸν διὰ τὸ αἷμα τοῦ Ἀρνίου καὶ διὰ τὸν λόγον τῆς μαρτυρίας αὐτῶν, καὶ οὐκ ἠγάπησαν τὴν ψυχὴν αὐτῶν ἄχρι θανάτου.',
   'kai autoi enikēsan auton dia to haima tou Arniou kai dia ton logon tēs martyrias autōn, kai ouk ēgapēsan tēn psychēn autōn achri thanatou.',
   'This verse reveals the means by which believers overcome Satan: ''by the blood of the Lamb'' and ''by the word of their testimony.'' The ''blood of the Lamb'' (Christ''s atoning sacrifice) is the foundational victory, providing forgiveness and redemption. Their ''testimony'' refers to their faithful proclamation of Christ and His truth, even under persecution. The phrase ''they loved not their lives unto the death'' underscores the martyrs'' unwavering commitment and willingness to sacrifice their lives rather than deny Christ, demonstrating ultimate faithfulness (cf. Philippians 1:21).',
   'This verse articulates the core of Christian victory over Satan: through the atoning ''blood of the Lamb'' (Christ''s sacrifice) and the steadfast ''word of their testimony.'' It highlights the power of Christ''s finished work and the courageous witness of believers, even to the point of martyrdom, as the means by which evil is overcome.'),
  (12,
   'Therefore rejoice, ye heavens, and ye that dwell in them. Woe to the inhabiters of the earth and of the sea! for the devil is come down unto you, having great wrath, because he knoweth that he hath but a short time.',
   'διὰ τοῦτο εὐφραίνεσθε, οὐρανοὶ καὶ οἱ ἐν αὐτοῖς σκηνοῦντες. οὐαὶ τὴν γῆν καὶ τὴν θάλασσαν, ὅτι κατέβη ὁ διάβολος πρὸς ὑμᾶς ἔχων θυμὸν μέγαν, εἰδὼς ὅτι ὀλίγον καιρὸν ἔχει.',
   'dia touto euphrainesthe, ouranoi kai hoi en autois skēnounes. ouai tēn gēn kai tēn thalassan, hoti katebē ho diabolos pros hymas echōn thymon megan, eidōs hoti oligon kairon echei.',
   'The heavenly rejoicing contrasts sharply with the ''woe'' pronounced upon the earth and sea. While heaven celebrates Satan''s expulsion, those on earth face intensified tribulation because ''the devil is come down unto you, having great wrath.'' This wrath is fueled by his knowledge that ''he hath but a short time.'' This ''short time'' refers to the period between his expulsion and Christ''s final return, during which his persecution of believers will be fierce but ultimately limited in duration and scope by God''s sovereignty (cf. Revelation 20:1-3).',
   NULL),
  (13,
   'And when the dragon saw that he was cast unto the earth, he persecuted the woman which brought forth the man child.',
   'Καὶ ὅτε εἶδεν ὁ δράκων ὅτι ἐβλήθη εἰς τὴν γῆν, ἐδίωξεν τὴν γυναῖκα τὴν τεκοῦσαν τὸν ἄρσενα.',
   'Kai hote eiden ho drakōn hoti eblēthē eis tēn gēn, ediōxen tēn gynaika tēn tekousan ton arsena.',
   'Realizing his defeat and expulsion from heaven, the dragon turns his fury directly upon ''the woman which brought forth the man child.'' This signifies Satan''s intensified persecution of God''s people (the Church) on earth, now that he can no longer accuse them in heaven. This persecution is a direct consequence of his hatred for Christ and his inability to harm Christ directly after His ascension. The Church, as the spiritual offspring of the woman, becomes the target of his wrath.',
   NULL),
  (14,
   'And to the woman were given two wings of a great eagle, that she might fly into the wilderness, into her place, where she is nourished for a time, and times, and half a time, from the face of the serpent.',
   'καὶ ἐδόθησαν τῇ γυναικὶ αἱ δύο πτέρυγες τοῦ ἀετοῦ τοῦ μεγάλου, ἵνα πέτηται εἰς τὴν ἔρημον εἰς τὸν τόπον αὐτῆς, ὅπου τρέφεται ἐκεῖ καιρὸν καὶ καιροὺς καὶ ἥμισυ καιροῦ ἀπὸ προσώπου τοῦ ὄφεως.',
   'kai edothēsan tē gynaiki hai dyo pterygēs tou aetou tou megalou, hina petētai eis tēn erēmon eis ton topon autēs, hopou trephetai ekei kairon kai kairous kai hēmisy kairou apo prosōpou tou opheōs.',
   'The woman is given ''two wings of a great eagle,'' enabling her to fly to her place in the wilderness for protection. This imagery recalls Exodus 19:4, where God tells Israel, ''I bore you on eagles'' wings and brought you to Myself.'' It symbolizes divine intervention and supernatural provision for God''s people during persecution. The period of nourishment, ''a time, and times, and half a time,'' is another way of expressing 3.5 years or 1260 days, emphasizing a divinely appointed and limited period of tribulation and protection.',
   'The divine provision of ''eagle''s wings'' for the woman''s flight into the wilderness symbolizes God''s supernatural protection and sustenance for His Church during periods of intense persecution. This demonstrates God''s faithfulness to preserve His people even when they face the full wrath of Satan.'),
  (15,
   'And the serpent cast out of his mouth water as a flood after the woman, that he might cause her to be carried away of the flood.',
   'Καὶ ἔβαλεν ὁ ὄφις ἐκ τοῦ στόματος αὐτοῦ ὀπίσω τῆς γυναικὸς ὕδωρ ὡς ποταμόν, ἵνα αὐτὴν ποταμοφόρητον ποιήσῃ.',
   'Kai ebalen ho ophis ek tou stomatos autou opisō tēs gynaikos hydōr hōs potamon, hina autēn potamophorēton poiēsē.',
   'The ''serpent'' (ὄφις, another name for Satan) attempts to destroy the woman by casting ''water as a flood'' out of his mouth. This ''flood'' is often interpreted as a torrent of persecution, false doctrines, or overwhelming forces aimed at sweeping away and annihilating God''s people (cf. Isaiah 59:19). It represents Satan''s relentless and multifaceted attacks, seeking to overwhelm the Church and prevent its survival.',
   NULL),
  (16,
   'And the earth helped the woman, and the earth opened her mouth, and swallowed up the flood which the dragon cast out of his mouth.',
   'καὶ ἐβοήθησεν ἡ γῆ τῇ γυναικί, καὶ ἤνοιξεν ἡ γῆ τὸ στόμα αὐτῆς καὶ κατέπιεν τὸν ποταμὸν ὃν ἔβαλεν ὁ δράκων ἐκ τοῦ στόματος αὐτοῦ.',
   'kai eboēthēsen hē gē tē gynaiki, kai ēnoixen hē gē to stoma autēs kai katepien ton potamon hon ebalen ho drakōn ek tou stomatos autou.',
   'In a miraculous act of divine intervention, ''the earth helped the woman'' by opening its mouth and swallowing the flood. This symbolizes unexpected, providential means by which God protects His Church from Satan''s destructive schemes. It could represent political or natural events, or even human actions, that inadvertently thwart the devil''s plans, demonstrating God''s sovereign control over all creation to preserve His people (cf. Numbers 16:30-32).',
   NULL),
  (17,
   'And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of God, and have the testimony of Jesus Christ.',
   'Καὶ ὠργίσθη ὁ δράκων ἐπὶ τῇ γυναικί, καὶ ἀπῆλθεν ποιῆσαι πόλεμον μετὰ τῶν λοιπῶν τοῦ σπέρματος αὐτῆς, τῶν τηρούντων τὰς ἐντολὰς τοῦ θεοῦ καὶ ἐχόντων τὴν μαρτυρίαν Ἰησοῦ.',
   'Kai ōrgisthē ho drakōn epi tē gynaiki, kai apēlthen poiēsai polemon meta tōn loipōn tou spermatos autēs, tōn tērountōn tas entolas tou theou kai echontōn tēn martyrian Iēsou.',
   'Frustrated by his inability to destroy the woman directly, the dragon turns his ''wrath'' to ''make war with the remnant of her seed.'' This ''remnant'' refers to individual believers, those ''who keep the commandments of God and have the testimony of Jesus Christ.'' This signifies that Satan''s war against the corporate Church now becomes a direct, personal assault on faithful Christians. This ongoing spiritual battle will continue until Christ''s return, targeting those who demonstrate obedience to God and bear witness to Jesus.',
   'This verse reveals Satan''s ultimate target: the ''remnant'' of God''s people—individual believers who obey God''s commands and bear witness to Jesus. It underscores the ongoing spiritual warfare against all who faithfully follow Christ, emphasizing the importance of steadfast obedience and testimony in the face of satanic opposition.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 12;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σημεῖον', 'sēmeion', 'G4592', 'Meaning ''sign,'' ''mark,'' or ''wonder.'' In Revelation, it often denotes a supernatural occurrence or symbolic representation that points to a deeper spiritual reality. Here, it introduces a profound vision, indicating that the woman and dragon are not literal but symbolic figures conveying significant theological truths about God''s plan and Satan''s opposition.', 1),
  ('γυνή', 'gynē', 'G1135', 'Meaning ''woman'' or ''wife.'' In this context, ''gynē'' is a highly symbolic figure, representing the corporate people of God—Israel in the Old Testament, from whom the Messiah came, and the Church in the New Testament. It signifies the lineage and community through which God''s redemptive purposes are fulfilled, enduring through various trials and persecutions.', 2),
  ('στέφανος', 'stephanos', 'G4735', 'Meaning ''crown,'' ''wreath,'' or ''garland.'' Unlike the ''diadema'' (diadem) of the dragon, which signifies royal authority, ''stephanos'' often denotes victory, honor, or reward. The woman''s crown of twelve stars symbolizes the glory and authority of God''s people, likely referencing the twelve tribes of Israel and/or the twelve apostles, representing the fullness of the Church.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 12 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δράκων', 'drakōn', 'G1404', 'Meaning ''dragon'' or ''serpent.'' This term is used exclusively in Revelation to describe Satan. It evokes imagery of a monstrous, powerful, and destructive beast, emphasizing his ancient, cunning, and malevolent nature as the primary antagonist against God''s kingdom. Its ''red'' color suggests violence and bloodshed.', 1),
  ('πυρρὸς', 'pyrros', 'G4449', 'Meaning ''fiery red'' or ''flame-colored.'' This adjective describes the dragon''s color, symbolizing his destructive, violent, and bloodthirsty character. It visually communicates the inherent evil and murderous intent of Satan, setting a stark contrast with the radiant, life-giving imagery associated with the woman.', 2),
  ('διαδήματα', 'diadēmata', 'G1238', 'Meaning ''diadems'' or ''royal crowns.'' Unlike the ''stephanos'' (crown of victory) worn by the woman, ''diadema'' specifically refers to the emblem of royal power and sovereignty. The seven diadems on the dragon''s heads signify his usurped authority and claim to dominion over earthly kingdoms, reflecting his desire to mimic and oppose God''s true kingship.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 12 AND v.verse_number = 3;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὄφις', 'ophis', 'G3789', 'Meaning ''serpent'' or ''snake.'' This term explicitly links the dragon to the ''old serpent'' from Genesis 3, identifying Satan as the original deceiver who brought sin into the world. It emphasizes his cunning, deceptive nature and his ancient role as the adversary of humanity and God''s plan of salvation.', 1),
  ('Διάβολος', 'Diabolos', 'G1228', 'Meaning ''slanderer,'' ''accuser,'' or ''devil.'' This title highlights Satan''s primary activity of slandering God to humanity and accusing humanity before God. His expulsion from heaven (v. 10) signifies the end of his role as the heavenly accuser, a crucial victory for believers who are now justified by Christ''s blood.', 2),
  ('Σατανᾶς', 'Satanas', 'G4567', 'Meaning ''adversary'' or ''opponent.'' This Hebrew-derived term emphasizes Satan''s role as the ultimate adversary of God and His people. It encapsulates his active opposition to all that is good and righteous, constantly seeking to thwart God''s purposes and destroy those who follow Him.', 3),
  ('πλανῶν', 'planōn', 'G4105', 'Present participle of ''planáō,'' meaning ''leading astray,'' ''deceiving,'' or ''misleading.'' This describes Satan''s pervasive influence as the one who ''deceiveth the whole world.'' It underscores his cunning ability to blind people to truth and lead them into error, making deception a core aspect of his warfare against humanity.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 12 AND v.verse_number = 9;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σωτηρία', 'sōtēria', 'G4991', 'Meaning ''salvation,'' ''deliverance,'' or ''preservation.'' Here, it refers to the comprehensive deliverance achieved through Christ''s work, particularly His victory over Satan. The proclamation ''Now is come salvation'' signifies that with Satan''s expulsion, God''s redemptive plan is advancing decisively, bringing full liberation to His people.', 1),
  ('βασιλεία', 'basileia', 'G932', 'Meaning ''kingdom,'' ''royal power,'' or ''reign.'' The declaration ''the kingdom of our God'' signifies the active, sovereign rule of God being established and manifested through Christ''s triumph. Satan''s expulsion marks a significant step in the full realization of God''s kingdom, where His authority is unchallenged.', 2),
  ('ἐξουσία', 'exousia', 'G1849', 'Meaning ''authority,'' ''power,'' or ''right.'' This refers to the inherent and delegated authority of Christ. With Satan cast down, Christ''s ''power'' or ''authority'' is fully affirmed and unleashed, demonstrating His supreme dominion over all spiritual forces and His rightful place as King.', 3),
  ('κατήγορος', 'katēgoros', 'G2725', 'Meaning ''accuser'' or ''prosecutor.'' This title for Satan highlights his role as the one who constantly slanders and condemns believers before God. His expulsion means this incessant accusation in the heavenly court has ceased, signifying a profound liberation for God''s people from his legalistic attacks.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 12 AND v.verse_number = 10;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐνίκησαν', 'enikēsan', 'G3528', 'Aorist active indicative of ''nikáō,'' meaning ''to conquer,'' ''to overcome,'' or ''to prevail.'' This verb emphasizes the decisive victory achieved by believers over Satan. It is a past, completed action, indicating that their triumph is secured through specific means, not merely a future hope, but a present reality rooted in Christ''s work.', 1),
  ('αἷμα', 'haima', 'G129', 'Meaning ''blood.'' Here, ''the blood of the Lamb'' refers to the atoning sacrifice of Jesus Christ on the cross. It is the central means of salvation and the ultimate basis for victory over Satan, providing forgiveness of sins and breaking the power of death and condemnation that Satan wields.', 2),
  ('μαρτυρίας', 'martyrias', 'G3141', 'Meaning ''testimony,'' ''witness,'' or ''evidence.'' ''The word of their testimony'' refers to the believers'' faithful proclamation of Christ and His truth, even in the face of persecution. This active witness, rooted in their personal experience of Christ, is a powerful weapon against Satan, demonstrating the reality of God''s saving power.', 3),
  ('ψυχὴν', 'psychēn', 'G5590', 'Meaning ''soul,'' ''life,'' or ''self.'' The phrase ''they loved not their lives unto the death'' signifies the ultimate commitment of believers, especially martyrs, to Christ. It means they valued their faithfulness to Jesus more than their physical lives, demonstrating a radical self-sacrifice that disarms Satan''s power of intimidation and fear.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 12 AND v.verse_number = 11;

-- Verse 14
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πτέρυγες', 'pterygēs', 'G4420', 'Meaning ''wings.'' The ''two wings of a great eagle'' symbolize divine protection and swift deliverance. This imagery recalls God''s care for Israel in the wilderness (Exodus 19:4), signifying that God supernaturally enables His people to escape Satan''s immediate grasp and find refuge in a place of safety and provision.', 1),
  ('ἔρημον', 'erēmon', 'G2047', 'Meaning ''wilderness,'' ''desert,'' or ''desolate place.'' This ''wilderness'' is a symbolic place of refuge and divine sustenance for the woman (God''s people). It represents a period of spiritual isolation and testing, yet also a place of miraculous provision and protection from the direct assaults of the dragon, echoing Israel''s journey.', 2),
  ('τρέφεται', 'trephetai', 'G5142', 'Present passive indicative of ''trephō,'' meaning ''to nourish,'' ''to feed,'' or ''to sustain.'' The woman being ''nourished'' in the wilderness emphasizes God''s active and continuous provision for His people during their time of tribulation. It highlights His faithfulness to sustain them spiritually and physically, even in hostile environments, ensuring their survival.', 3),
  ('καιρὸν', 'kairon', 'G2540', 'Meaning ''time,'' ''season,'' or ''appointed time.'' The phrase ''a time, and times, and half a time'' is a symbolic expression (equivalent to 3.5 years or 1260 days) for a divinely appointed period of tribulation and protection. It signifies that the duration of suffering and God''s care is fixed and limited by His sovereign plan, not by Satan''s power.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 12 AND v.verse_number = 14;

-- Verse 17
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὠργίσθη', 'ōrgisthē', 'G3710', 'Aorist passive indicative of ''orgízomai,'' meaning ''to be angry,'' ''to be enraged.'' The dragon''s ''wrath'' signifies his intense, frustrated fury at his inability to destroy the woman directly. This anger drives his subsequent persecution, highlighting the personal and malevolent nature of Satan''s opposition to God and His people.', 1),
  ('πόλεμον', 'polemon', 'G4171', 'Meaning ''war,'' ''battle,'' or ''conflict.'' The dragon going to ''make war'' signifies the ongoing spiritual conflict between Satan and believers. This is not a passive opposition but an active, aggressive campaign of persecution, deception, and temptation aimed at destroying the faith and witness of God''s people on earth.', 2),
  ('σπέρματος', 'spermatos', 'G4690', 'Meaning ''seed,'' ''offspring,'' or ''descendants.'' ''The remnant of her seed'' refers to individual believers who are the spiritual descendants of the woman (God''s people). This signifies that Satan''s war, having failed against the corporate body, now targets individual Christians who embody faithfulness to God and Christ.', 3),
  ('μαρτυρίαν', 'martyrian', 'G3141', 'Meaning ''testimony,'' ''witness,'' or ''evidence.'' ''The testimony of Jesus Christ'' refers to the faithful witness that believers bear concerning Jesus—His person, work, and teachings. This testimony is both the content of their faith and the means by which they overcome Satan, making them a specific target of his wrath.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 12 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Genesis 37:9-10', 1),
  (1, 'Isaiah 66:7-8', 2),
  (1, 'Galatians 4:26', 3),
  (1, 'Revelation 21:12', 4),
  (2, 'Isaiah 26:17-18', 1),
  (2, 'Micah 4:9-10', 2),
  (2, 'John 16:21', 3),
  (2, 'Romans 8:22', 4),
  (3, 'Daniel 7:7', 1),
  (3, 'Revelation 13:1', 2),
  (3, 'Revelation 17:3', 3),
  (3, 'Revelation 20:2', 4),
  (4, 'Genesis 3:15', 1),
  (4, 'Matthew 2:16', 2),
  (4, 'Isaiah 14:12-15', 3),
  (4, 'Luke 10:18', 4),
  (4, 'Jude 1:6', 5),
  (5, 'Psalm 2:9', 1),
  (5, 'Revelation 19:15', 2),
  (5, 'Acts 1:9-11', 3),
  (5, 'Hebrews 1:3', 4),
  (5, 'Revelation 3:21', 5),
  (6, 'Exodus 16:35', 1),
  (6, '1 Kings 17:2-6', 2),
  (6, 'Revelation 11:2-3', 3),
  (6, 'Daniel 7:25', 4),
  (6, 'Matthew 24:16', 5),
  (7, 'Daniel 10:13', 1),
  (7, 'Daniel 12:1', 2),
  (7, 'Jude 1:9', 3),
  (7, 'Ephesians 6:12', 4),
  (9, 'Genesis 3:1', 1),
  (9, 'John 8:44', 2),
  (9, '2 Corinthians 11:3', 3),
  (9, 'Revelation 20:2-3', 4),
  (9, '1 Peter 5:8', 5),
  (10, 'Job 1:6-12', 1),
  (10, 'Zechariah 3:1-2', 2),
  (10, 'Romans 8:33-34', 3),
  (10, 'Colossians 2:15', 4),
  (10, 'Hebrews 9:12', 5),
  (11, 'Romans 8:37', 1),
  (11, '1 John 4:4', 2),
  (11, 'Revelation 7:14', 3),
  (11, 'Revelation 1:5', 4),
  (11, 'Luke 14:26', 5),
  (12, 'Revelation 8:13', 1),
  (12, 'Revelation 11:18', 2),
  (12, 'John 12:31', 3),
  (12, '1 Peter 5:8', 4),
  (12, 'Revelation 20:1-3', 5),
  (13, 'Revelation 12:4', 1),
  (13, 'Revelation 12:17', 2),
  (13, 'John 15:18-20', 3),
  (14, 'Exodus 19:4', 1),
  (14, 'Deuteronomy 32:11', 2),
  (14, 'Daniel 7:25', 3),
  (14, 'Revelation 12:6', 4),
  (15, 'Isaiah 8:7-8', 1),
  (15, 'Isaiah 59:19', 2),
  (15, 'Psalm 18:4', 3),
  (15, 'Jeremiah 46:7-8', 4),
  (16, 'Numbers 16:30-32', 1),
  (16, 'Psalm 124:1-5', 2),
  (16, 'Romans 8:28', 3),
  (17, 'Genesis 3:15', 1),
  (17, 'Revelation 13:7', 2),
  (17, 'Revelation 14:12', 3),
  (17, '1 John 5:2-3', 4),
  (17, 'Revelation 19:10', 5)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 12 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 12 Complete!
-- 17 verses · 7 key verses with word studies (26 words)
-- Cross-references for 16 verses (70 refs)
-- ═══════════════════════════════════════════════════════