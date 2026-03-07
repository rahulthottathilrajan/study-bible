-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 8 — The New Covenant and the Heavenly Sanctuary
-- 13 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 8,
  'Hebrews 8 is the doctrinal bridge between the Melchizedek priesthood (ch.7) and the sacrificial work (ch.9-10). It opens with a triumphant summary: ''We have such an high priest, who is set on the right hand of the throne of the Majesty in the heavens; a minister of the sanctuary, and of the true tabernacle, which the Lord pitched, and not man'' (vv.1-2). Christ ministers in the heavenly sanctuary — the true tabernacle — of which the earthly tabernacle was only ''the example and shadow'' (v.5). Moses was warned: ''See … that thou make all things according to the pattern shewed to thee in the mount'' (v.5, quoting Exod 25:40). But now Christ ''hath … obtained a more excellent ministry, by how much also he is the mediator of a better covenant, which was established upon better promises'' (v.6). If the first covenant were faultless, there would be no need for a second (v.7). The chapter then quotes the longest OT passage cited in the NT — Jeremiah 31:31-34 — the new covenant prophecy: ''Behold, the days come, saith the Lord, when I will make a new covenant with the house of Israel'' (v.8). This new covenant is characterized by four promises: (1) God''s law written on hearts, not tablets (v.10); (2) a direct personal knowledge of God — ''they shall all know me'' (v.11); (3) complete forgiveness — ''their sins and their iniquities will I remember no more'' (v.12). The chapter concludes with the devastating implication: ''In that he saith, A new covenant, he hath made the first old. Now that which decayeth and waxeth old is ready to vanish away'' (v.13).',
  'The New Covenant, the Heavenly Sanctuary, and Better Promises',
  'διαθήκη (diathēkē)',
  'Covenant, testament, binding agreement — from diatithēmi (to arrange, to dispose, to settle). Used 17 times in Hebrews, more than any other NT book. A diathēkē in Greek could mean either a covenant (mutual agreement) or a testament (last will). In Hebrews, both meanings are active: the new covenant is God''s sovereign arrangement for salvation (covenant) which was ratified by Christ''s death (testament, cf. 9:16-17). The ''new covenant'' (kainē diathēkē) replaces the ''first covenant'' (prōtē diathēkē) — not patching the old but establishing something qualitatively new.',
  '["Christ the Minister of the Heavenly Sanctuary (vv.1-6): Now of the things which we have spoken this is the sum we have such an high priest who is set on the right hand of the throne of the Majesty in the heavens a minister of the sanctuary and of the true tabernacle which the Lord pitched and not man; for every high priest is ordained to offer gifts and sacrifices wherefore it is of necessity that this man have somewhat also to offer; for if he were on earth he should not be a priest seeing that there are priests that offer gifts according to the law who serve unto the example and shadow of heavenly things as Moses was admonished of God when he was about to make the tabernacle for See saith he that thou make all things according to the pattern shewed to thee in the mount; but now hath he obtained a more excellent ministry by how much also he is the mediator of a better covenant which was established upon better promises","The New Covenant Prophecy from Jeremiah (vv.7-12): For if that first covenant had been faultless then should no place have been sought for the second; for finding fault with them he saith Behold the days come saith the Lord when I will make a new covenant with the house of Israel and with the house of Judah not according to the covenant that I made with their fathers in the day when I took them by the hand to lead them out of the land of Egypt because they continued not in my covenant and I regarded them not saith the Lord; for this is the covenant that I will make with the house of Israel after those days saith the Lord I will put my laws into their mind and write them in their hearts and I will be to them a God and they shall be to me a people; and they shall not teach every man his neighbour and every man his brother saying Know the Lord for all shall know me from the least to the greatest; for I will be merciful to their unrighteousness and their sins and their iniquities will I remember no more","The First Covenant Made Obsolete (v.13): In that he saith A new covenant he hath made the first old now that which decayeth and waxeth old is ready to vanish away"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 13 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Now of the things which we have spoken this is the sum: We have such an high priest, who is set on the right hand of the throne of the Majesty in the heavens;',
   'κεφάλαιον δὲ ἐπὶ τοῖς λεγομένοις τοιοῦτον ἔχομεν ἀρχιερέα ὃς ἐκάθισεν ἐν δεξιᾷ τοῦ θρόνου τῆς μεγαλωσύνης ἐν τοῖς οὐρανοῖς',
   'kephalaion de epi tois legomenois toiouton echomen archierea hos ekathisen en dexia tou thronou tēs megalōsynēs en tois ouranois',
   '''The sum'' (kephalaion — the chief point, the main thing, the crowning summary; from kephalē, head). The entire argument of chapters 1-7 is summarized: ''We have such an high priest.'' ''Set on the right hand'' (ekathisen en dexia — sat down at the right hand; the session motif from 1:3 returns). ''Of the throne of the Majesty in the heavens'' — not an earthly sanctuary but the heavenly throne room itself. The phrase ''the Majesty'' (tēs megalōsynēs) is a reverential circumlocution for God. Christ''s session indicates both completed work (He sat down) and supreme authority (at God''s right hand).',
   NULL),
  (2, 'A minister of the sanctuary, and of the true tabernacle, which the Lord pitched, and not man.',
   'τῶν ἁγίων λειτουργὸς καὶ τῆς σκηνῆς τῆς ἀληθινῆς ἣν ἔπηξεν ὁ κύριος καὶ οὐκ ἄνθρωπος',
   'tōn hagiōn leitourgos kai tēs skēnēs tēs alēthinēs hēn epēxen ho kyrios kai ouk anthrōpos',
   '''Minister'' (leitourgos — a public servant, a liturgical minister; the word from which ''liturgy'' derives). ''Of the sanctuary'' (tōn hagiōn — of the holy things/places). ''The true tabernacle'' (tēs skēnēs tēs alēthinēs — the genuine, real, original tabernacle). ''True'' (alēthinēs) does not mean ''true as opposed to false'' but ''the real thing as opposed to its copy.'' ''Which the Lord pitched, and not man'' (hēn epēxen ho kyrios — which the Lord set up). The earthly tabernacle was made by human hands according to a pattern; the heavenly sanctuary is God''s own construction — the original of which the earthly was merely a copy.',
   'The distinction between the earthly ''copy'' and the heavenly ''true'' tabernacle reflects a Platonic-sounding but thoroughly biblical cosmology: the earthly sanctuary was modeled on a heavenly reality (Exod 25:40). The earthly is not false but derivative — a shadow of the substance, a copy of the original. Christ ministers in the original, not the copy.'),
  (3, 'For every high priest is ordained to offer gifts and sacrifices: wherefore it is of necessity that this man have somewhat also to offer.',
   'πᾶς γὰρ ἀρχιερεὺς εἰς τὸ προσφέρειν δῶρά τε καὶ θυσίας καθίσταται ὅθεν ἀναγκαῖον ἔχειν τι καὶ τοῦτον ὃ προσενέγκῃ',
   'pas gar archiereus eis to prospherein dōra te kai thysias kathistatai hothen anankaion echein ti kai touton ho prosenenkē',
   '''Every high priest is ordained to offer'' — the essential function of priesthood is offering. ''It is of necessity'' (anankaion — necessary, required). ''That this man have somewhat also to offer'' — Christ must have something to offer if He is truly a high priest. What He offers is revealed in 9:12,14: His own blood, His own life. The offering is not repeated (7:27) but its effects are eternal. The verse sets up the sacrificial exposition of chapters 9-10.',
   NULL),
  (4, 'For if he were on earth, he should not be a priest, seeing that there are priests that offer gifts according to the law:',
   'εἰ μὲν γὰρ ἦν ἐπὶ γῆς οὐδ᾽ ἂν ἦν ἱερεύς ὄντων τῶν προσφερόντων κατὰ τὸν νόμον τὰ δῶρα',
   'ei men gar ēn epi gēs oud an ēn hiereus ontōn tōn prospherontōn kata ton nomon ta dōra',
   '''If he were on earth, he should not be a priest'' — Christ is from the tribe of Judah; under the Mosaic law, only Levites could serve as priests on earth. The earthly priesthood is filled. Christ''s priesthood operates in a different sphere — the heavenly sanctuary. His ministry does not compete with or duplicate the Levitical system; it transcends it entirely. This verse underscores that Christ''s priesthood is of a fundamentally different order and location.',
   NULL),
  (5, 'Who serve unto the example and shadow of heavenly things, as Moses was admonished of God when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount.',
   'οἵτινες ὑποδείγματι καὶ σκιᾷ λατρεύουσιν τῶν ἐπουρανίων καθὼς κεχρημάτισται Μωϋσῆς μέλλων ἐπιτελεῖν τὴν σκηνήν ὅρα γάρ φησίν ποιήσεις πάντα κατὰ τὸν τύπον τὸν δειχθέντα σοι ἐν τῷ ὄρει',
   'hoitines hypodeigmati kai skia latreuousin tōn epouraniōn kathōs kechrēmatistai Mōysēs mellōn epitelein tēn skēnēn hora gar phēsin poiēseis panta kata ton typon ton deichthenta soi en tō orei',
   '''Example and shadow'' (hypodeigmati kai skia — a copy/model and a shadow). The Levitical priests serve in a sanctuary that is a copy (hypodeigma — an example, a model, a pattern) and a shadow (skia — not the substance but the silhouette). Quoting Exodus 25:40: ''See that thou make all things according to the pattern'' (kata ton typon — according to the type/model). Moses was shown the typos — the heavenly original — and instructed to replicate it on earth. The earthly tabernacle was a deliberate, God-ordained reproduction of the heavenly reality. If the copy is this glorious (with its gold, jewels, and intricate design), how much more glorious the original?',
   'The type/antitype relationship between the earthly and heavenly tabernacle is foundational to Hebrews'' hermeneutic. The earthly sanctuary was not merely a human construction but a divinely patterned copy of the heavenly reality. Moses received the ''pattern'' (typos) on Sinai — the earthly was always intended to point beyond itself to the heavenly original where Christ now ministers.'),
  (6, 'But now hath he obtained a more excellent ministry, by how much also he is the mediator of a better covenant, which was established upon better promises.',
   'νυνὶ δὲ διαφορωτέρας τέτυχεν λειτουργίας ὅσῳ καὶ κρείττονός ἐστιν διαθήκης μεσίτης ἥτις ἐπὶ κρείττοσιν ἐπαγγελίαις νενομοθέτηται',
   'nyni de diaphorōteras tetychcn leitourgias hosō kai kreittonos estin diathēkēs mesitēs hētis epi kreittosin epangeliais nenomothetētai',
   '''More excellent ministry'' (diaphorōteras leitourgias — a more distinguished, superior ministry). ''Mediator'' (mesitēs — go-between, intermediary, one who stands between two parties; from mesos, middle). Christ is the mesitēs of a ''better covenant'' (kreittonos diathēkēs). ''Better promises'' (kreittosin epangeliais) — the four promises of the new covenant (vv.10-12) are qualitatively superior to the conditional promises of the Mosaic covenant. Three ''betters'' in one verse: better ministry, better covenant, better promises. The word kreittōn drives the argument of the entire epistle.',
   'This verse is the thesis statement for chapters 8-10: Christ''s ministry is better because His covenant is better, and His covenant is better because its promises are better. The progression is: better priest (ch.7) → better ministry in a better sanctuary → better covenant with better promises → better sacrifice (ch.9-10).'),
  (7, 'For if that first covenant had been faultless, then should no place have been sought for the second.',
   'εἰ γὰρ ἡ πρώτη ἐκείνη ἦν ἄμεμπτος οὐκ ἂν δευτέρας ἐζητεῖτο τόπος',
   'ei gar hē prōtē ekeinē ēn amemptos ouk an deuteras ezēteito topos',
   '''If the first … had been faultless'' (ei hē prōtē ēn amemptos — if the first covenant had been blameless/without defect). ''No place … for the second'' (ouk an deuteras ezēteito topos — no occasion for a second would have been sought). The argument from 7:11 repeats with a new object: there the Levitical priesthood was insufficient; here the first covenant itself is insufficient. The very prophecy of a ''new'' covenant in Jeremiah 31 proves the ''first'' was inadequate — not because God failed but because the covenant was designed to be temporary, to reveal sin and point forward to Christ.',
   NULL),
  (8, 'For finding fault with them, he saith, Behold, the days come, saith the Lord, when I will make a new covenant with the house of Israel and with the house of Judah:',
   'μεμφόμενος γὰρ αὐτοῖς λέγει ἰδοὺ ἡμέραι ἔρχονται λέγει κύριος καὶ συντελέσω ἐπὶ τὸν οἶκον Ἰσραὴλ καὶ ἐπὶ τὸν οἶκον Ἰούδα διαθήκην καινήν',
   'memphomenos gar autois legei idou hēmerai erchontai legei kyrios kai syntelesō epi ton oikon Israēl kai epi ton oikon Iouda diathēkēn kainēn',
   '''Finding fault with them'' (memphomenos autois — blaming them, censuring them). The fault was not with the covenant''s design but with the people''s inability to keep it. ''New covenant'' (diathēkēn kainēn — a covenant that is new in quality, fresh, unprecedented; kainos means new in kind, not merely neos/new in time). The Jeremiah 31:31-34 quotation begins — the longest OT passage quoted in the NT. ''The house of Israel and … Judah'' — the entire nation, both northern and southern kingdoms. This prophecy was given through Jeremiah during the darkest period of Israel''s history, just before the Babylonian exile — a promise of future restoration amid present devastation.',
   'The Jeremiah 31 new covenant prophecy is the theological foundation of NT Christianity. Jesus explicitly invoked it at the Last Supper (''This cup is the new testament/covenant in my blood,'' Luke 22:20). The new covenant is not an improvement of the old but a qualitatively different arrangement — internal rather than external, empowering rather than merely commanding.'),
  (9, 'Not according to the covenant that I made with their fathers in the day when I took them by the hand to lead them out of the land of Egypt; because they continued not in my covenant, and I regarded them not, saith the Lord.',
   'οὐ κατὰ τὴν διαθήκην ἣν ἐποίησα τοῖς πατράσιν αὐτῶν ἐν ἡμέρᾳ ἐπιλαβομένου μου τῆς χειρὸς αὐτῶν ἐξαγαγεῖν αὐτοὺς ἐκ γῆς Αἰγύπτου ὅτι αὐτοὶ οὐκ ἐνέμειναν ἐν τῇ διαθήκῃ μου κἀγὼ ἠμέλησα αὐτῶν λέγει κύριος',
   'ou kata tēn diathēkēn hēn epoiēsa tois patrasin autōn en hēmera epilabomenou mou tēs cheiros autōn exagagein autous ek gēs Aigyptou hoti autoi ouk enemeinan en tē diathēkē mou kagō ēmelēsa autōn legei kyrios',
   '''Not according to the covenant that I made with their fathers'' — the new covenant is explicitly contrasted with the Sinai covenant. ''Took them by the hand'' (epilabomenou mou tēs cheiros autōn — a tender image of God as a parent leading a child by the hand). Despite God''s fatherly care, ''they continued not in my covenant'' (ouk enemeinan — they did not abide in, they did not remain faithful). ''I regarded them not'' (ēmelēsa autōn — I disregarded them, I turned away from them). The old covenant was conditional: obedience brought blessing, disobedience brought rejection. Israel failed the condition — breaking the covenant that God had tenderly established.',
   NULL),
  (10, 'For this is the covenant that I will make with the house of Israel after those days, saith the Lord; I will put my laws into their mind, and write them in their hearts: and I will be to them a God, and they shall be to me a people:',
   'ὅτι αὕτη ἡ διαθήκη ἣν διαθήσομαι τῷ οἴκῳ Ἰσραὴλ μετὰ τὰς ἡμέρας ἐκείνας λέγει κύριος διδοὺς νόμους μου εἰς τὴν διάνοιαν αὐτῶν καὶ ἐπὶ καρδίας αὐτῶν ἐπιγράψω αὐτούς καὶ ἔσομαι αὐτοῖς εἰς θεὸν καὶ αὐτοὶ ἔσονταί μοι εἰς λαόν',
   'hoti hautē hē diathēkē hēn diathēsomai tō oikō Israēl meta tas hēmeras ekeinas legei kyrios didous nomous mou eis tēn dianoian autōn kai epi kardias autōn epigraphsō autous kai esomai autois eis theon kai autoi esontai moi eis laon',
   'The first two promises of the new covenant: (1) ''I will put my laws into their mind, and write them in their hearts'' (didous nomous mou eis tēn dianoian autōn kai epi kardias autōn epigraphsō autous — giving my laws into their understanding and upon their hearts I will inscribe them). The old covenant wrote the law on stone tablets (Exod 34:1); the new writes it on hearts. External command becomes internal desire. (2) ''I will be to them a God, and they shall be to me a people'' — the covenant formula (cf. Lev 26:12; Jer 7:23) is renewed on a deeper basis. Under the old covenant, the relationship was mediated by law; under the new, it is internalized by the Spirit.',
   'The internalization of God''s law is the distinguishing mark of the new covenant. The old covenant''s external law exposed sin but could not change hearts (Rom 8:3). The new covenant''s internal law transforms the person from within — through the Holy Spirit writing God''s desires on the heart (Ezek 36:26-27; 2 Cor 3:3). This is the theological basis for regeneration and sanctification.'),
  (11, 'And they shall not teach every man his neighbour, and every man his brother, saying, Know the Lord: for all shall know me, from the least to the greatest.',
   'καὶ οὐ μὴ διδάξωσιν ἕκαστος τὸν πολίτην αὐτοῦ καὶ ἕκαστος τὸν ἀδελφὸν αὐτοῦ λέγων γνῶθι τὸν κύριον ὅτι πάντες εἰδήσουσίν με ἀπὸ μικροῦ αὐτῶν ἕως μεγάλου αὐτῶν',
   'kai ou mē didaxōsin hekastos ton politēn autou kai hekastos ton adelphon autou legōn gnōthi ton kyrion hoti pantes eidēsousin me apo mikrou autōn heōs megalou autōn',
   'The third promise: ''All shall know me, from the least to the greatest'' (pantes eidēsousin me). ''Shall not teach … saying, Know the Lord'' — under the new covenant, every member of the covenant community personally knows God. The old covenant included people who were members by birth but did not personally know God. The new covenant community consists exclusively of those who personally know the Lord — there are no merely nominal members. This does not eliminate teaching (Eph 4:11) but describes the universality of personal knowledge within the covenant.',
   'This promise points to the nature of new covenant membership: every member personally knows God. Under the old covenant, infants were circumcised into the community and needed to be taught later. Under the new covenant, entry is through personal knowledge of God — through regeneration and faith. This has implications for ecclesiology: the new covenant church ideally consists of genuine believers, not merely those born into the community.'),
  (12, 'For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more.',
   'ὅτι ἵλεως ἔσομαι ταῖς ἀδικίαις αὐτῶν καὶ τῶν ἁμαρτιῶν αὐτῶν καὶ τῶν ἀνομιῶν αὐτῶν οὐ μὴ μνησθῶ ἔτι',
   'hoti hileōs esomai tais adikiais autōn kai tōn hamartiōn autōn kai tōn anomiōn autōn ou mē mnēsthō eti',
   'The fourth and foundational promise: ''I will be merciful to their unrighteousness'' (hileōs esomai — I will be propitious/gracious; the adjective form of hilaskomai from 2:17). ''Their sins and their iniquities will I remember no more'' (ou mē mnēsthō eti — I will absolutely not remember any longer; the double negative ou mē is the strongest negation in Greek). Three words for sin are used: ''unrighteousness'' (adikiais — injustice), ''sins'' (hamartiōn — missing the mark), ''iniquities'' (anomiōn — lawlessness). All three are covered. The promise is not that God suffers memory loss but that He will never bring these sins up again for judgment. They are dealt with — completely, finally, irrevocably.',
   'The forgiveness promise is the foundation of the new covenant — and the most important for the Hebrews argument. The old covenant sacrifices ''remembered'' sins annually (10:3) — they could not permanently remove them. The new covenant promises no more remembering — complete, final, once-for-all forgiveness. This is what Christ''s sacrifice accomplished (10:14-18). Where there is complete forgiveness, ''there is no more offering for sin'' (10:18).'),
  (13, 'In that he saith, A new covenant, he hath made the first old. Now that which decayeth and waxeth old is ready to vanish away.',
   'ἐν τῷ λέγειν καινὴν πεπαλαίωκεν τὴν πρώτην τὸ δὲ παλαιούμενον καὶ γηράσκον ἐγγὺς ἀφανισμοῦ',
   'en tō legein kainēn pepalaiōken tēn prōtēn to de palaioumenon kai gēraskon engys aphanismou',
   '''A new'' (kainēn — by saying ''new''). ''He hath made the first old'' (pepalaiōken tēn prōtēn — He has made the first one obsolete; perfect tense: it is now in a permanent state of obsolescence). The mere use of the word ''new'' in Jeremiah 31 logically implies that the existing covenant has become ''old'' — outdated, superseded, antiquated. ''Decayeth and waxeth old'' (palaioumenon kai gēraskon — growing old and aging). ''Ready to vanish away'' (engys aphanismou — near to disappearing). The author writes as if the old covenant system is still technically functioning (the temple still stood when Hebrews was written, before AD 70) but is theologically obsolete — already old, already aging, already near its end. The destruction of the temple in AD 70 would physically confirm what was already theologically true.',
   'This verse is one of the most significant in the NT for understanding the relationship between the Old and New Testaments. The old covenant is not evil or worthless — but it is obsolete. It has been superseded by something qualitatively better. The word ''new'' (kainos) in Jeremiah''s prophecy was itself a divine declaration that the first covenant''s days were numbered. Christ''s coming fulfilled that declaration.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 8;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λειτουργός', 'leitourgos', 'G3011', 'Minister, public servant, liturgical servant — from leitos (public) + ergon (work). In v.2 Christ is the leitourgos of the heavenly sanctuary — He performs sacred, priestly service in the true tabernacle. The word emphasizes the official, consecrated nature of His ministry. While angels are leitourgika pneumata (1:14, serving spirits), Christ is the leitourgos — the chief minister who serves in God''s very presence.', 1),
  ('μεσίτης', 'mesitēs', 'G3316', 'Mediator, go-between, intermediary — from mesos (middle). In v.6 Christ is the mesitēs of a better covenant. A mediator stands between two parties, negotiating and guaranteeing the agreement. Moses was mediator of the first covenant (Gal 3:19); Christ is mediator of the new and better covenant. His mediation is superior because He represents both sides perfectly: as God, He represents the divine party; as man, He represents humanity.', 2),
  ('τύπος', 'typos', 'G5179', 'Pattern, model, type, example — from typtō (to strike, to stamp). In v.5 the earthly tabernacle was built according to the typos shown to Moses on the mount. A typos is the original pattern from which a copy is made — like a die that stamps coins. The heavenly sanctuary is the typos (original); the earthly is the copy. This typological framework undergirds all of Hebrews'' OT interpretation: the old covenant institutions were divinely designed copies of heavenly realities.', 3),
  ('σκιά', 'skia', 'G4639', 'Shadow, silhouette, foreshadowing — in v.5 the earthly priests serve what is a ''shadow'' (skia) of heavenly things. A shadow gives the outline/shape of a reality but has no substance of its own. The Levitical system provided the outline of what Christ would accomplish — the shadow of the cross fell backward across the centuries — but the substance, the body that cast the shadow, is Christ (Col 2:17). Shadows are real but derivative; they point to something greater.', 4),
  ('καινός', 'kainos', 'G2537', 'New in quality, fresh, unprecedented, novel — distinct from neos (new in time). In vv.8,13 the ''new'' (kainē) covenant is qualitatively different from the old — not merely a newer version but a fundamentally different kind. The law is internalized rather than externalized; knowledge of God is universal rather than mediated; forgiveness is complete rather than provisional. Kainos implies a fresh creative act of God — something that has never existed before.', 5),
  ('ἀφανισμός', 'aphanismos', 'G854', 'Disappearance, vanishing, destruction — from aphanizō (to make unseen, to cause to vanish). In v.13 the old covenant is ''near to vanishing'' (engys aphanismou). The word suggests not violent destruction but gradual fading — the old covenant was slowly disappearing as its obsolescence became evident. The temple''s destruction in AD 70 completed the process that was already theologically accomplished at the cross.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 8
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 6
    WHEN 3 THEN 5
    WHEN 4 THEN 5
    WHEN 5 THEN 8
    WHEN 6 THEN 13
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Hebrews 1:3', 1),
  (1, 'Hebrews 10:12', 2),
  (1, 'Psalm 110:1', 3),
  (2, 'Hebrews 9:11', 4),
  (2, 'Hebrews 9:24', 5),
  (3, 'Hebrews 5:1', 6),
  (3, 'Hebrews 9:14', 7),
  (5, 'Exodus 25:40', 8),
  (5, 'Colossians 2:17', 9),
  (5, 'Hebrews 10:1', 10),
  (6, 'Hebrews 7:22', 11),
  (6, 'Hebrews 9:15', 12),
  (6, '2 Corinthians 3:6-11', 13),
  (7, 'Hebrews 7:11', 14),
  (8, 'Jeremiah 31:31-34', 15),
  (8, 'Luke 22:20', 16),
  (8, '1 Corinthians 11:25', 17),
  (9, 'Exodus 19:5-6', 18),
  (9, 'Deuteronomy 5:2-3', 19),
  (10, 'Ezekiel 36:26-27', 20),
  (10, '2 Corinthians 3:3', 21),
  (10, 'Romans 8:4', 22),
  (10, 'Leviticus 26:12', 23),
  (11, 'John 6:45', 24),
  (11, '1 John 2:27', 25),
  (12, 'Hebrews 10:17-18', 26),
  (12, 'Psalm 103:12', 27),
  (12, 'Isaiah 43:25', 28),
  (12, 'Micah 7:19', 29),
  (13, '2 Corinthians 3:11', 30),
  (13, 'Galatians 3:24-25', 31)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 8
  AND v.verse_number = cr.verse_number;
