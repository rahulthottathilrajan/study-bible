-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 2 — The Warning against Neglect and Christ's True Humanity
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Hebrews 2 pivots from the exalted Christology of chapter 1 to the first of five warning passages in the epistle: ''How shall we escape, if we neglect so great salvation?'' (v.3). If the word spoken by angels (the Mosaic law) carried penalties for disobedience, how much greater the danger of drifting from the message spoken by the Lord Himself (vv.1-4). The chapter then addresses an apparent difficulty: if the Son is so exalted, why did He become human? Quoting Psalm 8:4-6, the author shows that God''s original design was for man to have dominion — ''but now we see not yet all things put under him'' (v.8). Instead, ''we see Jesus, who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of God should taste death for every man'' (v.9). The incarnation was necessary for redemption: the Son became human so He could die as a substitute. He partook of flesh and blood ''that through death he might destroy him that had the power of death, that is, the devil; and deliver them who through fear of death were all their lifetime subject to bondage'' (vv.14-15). Christ is not ashamed to call believers ''brethren'' (v.11), and He had to be ''made like unto his brethren'' in every way so that He might be ''a merciful and faithful high priest'' to ''make reconciliation for the sins of the people'' (v.17). The chapter closes with the assurance: ''For in that he himself hath suffered being tempted, he is able to succour them that are tempted'' (v.18).',
  'Christ''s Incarnation, the First Warning, and Solidarity with Humanity',
  'ἀρχηγός (archēgos)',
  'Captain, pioneer, author, originator, leader who goes first — from archē (beginning, rule) + agō (to lead). In v.10 Christ is the archēgos of salvation: He is the pioneer who blazed the trail of salvation through suffering and death, opening the way for many sons to follow. He is both the source and the leader of salvation — the one who originates it and the one who leads His people through it.',
  '["The First Warning: Do Not Drift (vv.1-4): Therefore we ought to give the more earnest heed to the things which we have heard lest at any time we should let them slip for if the word spoken by angels was stedfast and every transgression and disobedience received a just recompence of reward how shall we escape if we neglect so great salvation which at the first began to be spoken by the Lord and was confirmed unto us by them that heard him God also bearing them witness both with signs and wonders and with divers miracles and gifts of the Holy Ghost according to his own will","The Son Made Lower Than Angels (vv.5-9): For unto the angels hath he not put in subjection the world to come whereof we speak but one in a certain place testified saying What is man that thou art mindful of him or the son of man that thou visitest him thou madest him a little lower than the angels thou crownedst him with glory and honour and didst set him over the works of thy hands thou hast put all things in subjection under his feet but now we see not yet all things put under him but we see Jesus who was made a little lower than the angels for the suffering of death crowned with glory and honour that he by the grace of God should taste death for every man","The Captain of Salvation Made Perfect Through Suffering (vv.10-13): For it became him for whom are all things and by whom are all things in bringing many sons unto glory to make the captain of their salvation perfect through sufferings for both he that sanctifieth and they who are sanctified are all of one for which cause he is not ashamed to call them brethren saying I will declare thy name unto my brethren in the midst of the church will I sing praise unto thee and again I will put my trust in him and again behold I and the children which God hath given me","Victory over Death and the Faithful High Priest (vv.14-18): Forasmuch then as the children are partakers of flesh and blood he also himself likewise took part of the same that through death he might destroy him that had the power of death that is the devil and deliver them who through fear of death were all their lifetime subject to bondage for verily he took not on him the nature of angels but he took on him the seed of Abraham wherefore in all things it behoved him to be made like unto his brethren that he might be a merciful and faithful high priest in things pertaining to God to make reconciliation for the sins of the people for in that he himself hath suffered being tempted he is able to succour them that are tempted"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Therefore we ought to give the more earnest heed to the things which we have heard, lest at any time we should let them slip.',
   'διὰ τοῦτο δεῖ περισσοτέρως ἡμᾶς προσέχειν τοῖς ἀκουσθεῖσιν μήποτε παραρρυῶμεν',
   'dia touto dei perissoterōs hēmas prosechein tois akoustheisin mēpote pararryōmen',
   '''Therefore'' (dia touto) — because the Son is infinitely superior to angels, the stakes of responding to His message are infinitely higher. ''Give the more earnest heed'' (perissoterōs prosechein — to pay attention more abundantly, with greater diligence). ''Lest we should let them slip'' (mēpote pararryōmen — lest we drift away). The verb pararrheō means to float past, to drift by, like a ship slipping past its harbor. The danger is not deliberate apostasy but careless drifting — gradual, imperceptible movement away from the truth. The passive voice suggests this happens naturally if one does not actively anchor oneself.',
   'The first of five warning passages in Hebrews (2:1-4; 3:7-4:13; 5:11-6:12; 10:26-39; 12:25-29). The danger is not violent rejection but negligent drifting — the slow erosion of attention to divine truth. The metaphor of drifting (pararryōmen) warns that spiritual decline is usually gradual, not sudden.'),
  (2, 'For if the word spoken by angels was stedfast, and every transgression and disobedience received a just recompence of reward;',
   'εἰ γὰρ ὁ δι᾽ ἀγγέλων λαληθεὶς λόγος ἐγένετο βέβαιος καὶ πᾶσα παράβασις καὶ παρακοὴ ἔλαβεν ἔνδικον μισθαποδοσίαν',
   'ei gar ho di angelōn lalētheis logos egeneto bebaios kai pasa parabasis kai parakoē elaben endikon misthapodosian',
   '''The word spoken by angels'' — the Mosaic law, which Jewish tradition held was mediated through angels (cf. Acts 7:53; Gal 3:19). ''Stedfast'' (bebaios — firm, reliable, legally valid). ''Transgression'' (parabasis — stepping across a line, deliberate violation). ''Disobedience'' (parakoē — failure to hear, negligent hearing; literally ''hearing beside'' — hearing but not heeding). ''Just recompence of reward'' (endikon misthapodosian — a righteous payment, a fair retribution). The argument is from the lesser to the greater (qal va-chomer): if the law given through angelic mediators carried strict penalties, how much more the gospel spoken by the Son Himself?',
   NULL),
  (3, 'How shall we escape, if we neglect so great salvation; which at the first began to be spoken by the Lord, and was confirmed unto us by them that heard him;',
   'πῶς ἡμεῖς ἐκφευξόμεθα τηλικαύτης ἀμελήσαντες σωτηρίας ἥτις ἀρχὴν λαβοῦσα λαλεῖσθαι διὰ τοῦ κυρίου ὑπὸ τῶν ἀκουσάντων εἰς ἡμᾶς ἐβεβαιώθη',
   'pōs hēmeis ekpheuxometha tēlikautēs amelēsantes sōtērias hētis archēn labousa laleisthai dia tou kyriou hypo tōn akousantōn eis hēmas ebebaiōthē',
   '''How shall we escape?'' (pōs ekpheuxometha — rhetorical question expecting the answer: there is no escape). ''Neglect'' (amelēsantes — having been careless about, having disregarded; from a-meleō, to have no care for). Note: the sin is not blasphemy or violent rejection but mere neglect — treating the gospel with indifference. ''So great salvation'' (tēlikautēs sōtērias — so great, so magnificent a salvation; the demonstrative pronoun emphasizes magnitude). ''Began to be spoken by the Lord'' — unlike the law mediated by angels, this salvation was inaugurated by the Lord Jesus Himself. ''Confirmed unto us by them that heard him'' — the second generation of believers received the gospel from eyewitnesses, suggesting the author was not himself an eyewitness.',
   'The seriousness of neglecting the gospel is proportional to the greatness of the salvation offered. This ''greater to lesser'' argument (a fortiori) is foundational: if breaking the law of Moses brought punishment, how much more devastating to ignore the salvation proclaimed by God''s own Son?'),
  (4, 'God also bearing them witness, both with signs and wonders, and with divers miracles, and gifts of the Holy Ghost, according to his own will?',
   'συνεπιμαρτυροῦντος τοῦ θεοῦ σημείοις τε καὶ τέρασιν καὶ ποικίλαις δυνάμεσιν καὶ πνεύματος ἁγίου μερισμοῖς κατὰ τὴν αὐτοῦ θέλησιν',
   'synepimartyrountos tou theou sēmeiois te kai terasin kai poikilais dynamesin kai pneumatos hagiou merismois kata tēn autou thelēsin',
   '''Bearing witness'' (synepimartyrountos — bearing witness together with, co-testifying; a compound verb suggesting God''s testimony alongside the apostles'' preaching). Four forms of divine confirmation: (1) ''signs'' (sēmeiois — miracles that point to a truth); (2) ''wonders'' (terasin — marvels that produce awe); (3) ''divers miracles'' (poikilais dynamesin — varied displays of power); (4) ''gifts of the Holy Ghost'' (pneumatos hagiou merismois — distributions, apportionments of the Holy Spirit). ''According to his own will'' (kata tēn autou thelēsin) — the Spirit''s gifts are sovereign, not earned or demanded.',
   NULL),
  (5, 'For unto the angels hath he not put in subjection the world to come, whereof we speak.',
   'οὐ γὰρ ἀγγέλοις ὑπέταξεν τὴν οἰκουμένην τὴν μέλλουσαν περὶ ἧς λαλοῦμεν',
   'ou gar angelois hypetaxen tēn oikoumenēn tēn mellousan peri hēs laloumen',
   '''The world to come'' (tēn oikoumenēn tēn mellousan — the coming inhabited earth, the future age). This is the messianic age — the world as it will be when fully redeemed. God did not subject this future world to angels but to the Son (and by extension, to redeemed humanity). The verse transitions from the warning (vv.1-4) to a discussion of the Son''s incarnation: if the future world belongs not to angels but to man, then the Son had to become man to claim it.',
   NULL),
  (6, 'But one in a certain place testified, saying, What is man, that thou art mindful of him? or the son of man, that thou visitest him?',
   'διεμαρτύρατο δέ πού τις λέγων τί ἐστιν ἄνθρωπος ὅτι μιμνήσκῃ αὐτοῦ ἢ υἱὸς ἀνθρώπου ὅτι ἐπισκέπτῃ αὐτόν',
   'diemartryato de pou tis legōn ti estin anthrōpos hoti mimnēskē autou ē hyios anthrōpou hoti episkeptē auton',
   'Quoting Psalm 8:4-6. ''One in a certain place'' — the author''s characteristic way of citing Scripture, emphasizing the divine Author rather than the human writer. ''What is man?'' (ti estin anthrōpos) — wonder at God''s attention to frail humanity. ''Mindful'' (mimnēskē — you remember, you keep in mind). ''Visitest'' (episkeptē — you visit, you attend to, you look after with care). The Psalm marvels that the infinite Creator pays attention to finite man. In context, the author will apply this to Christ — the ''son of man'' who was ''visited'' by God and given universal dominion.',
   NULL),
  (7, 'Thou madest him a little lower than the angels; thou crownedst him with glory and honour, and didst set him over the works of thy hands:',
   'ἠλάττωσας αὐτὸν βραχύ τι παρ᾽ ἀγγέλους δόξῃ καὶ τιμῇ ἐστεφάνωσας αὐτὸν καὶ κατέστησας αὐτὸν ἐπὶ τὰ ἔργα τῶν χειρῶν σου',
   'ēlattōsas auton brachy ti par angelous doxē kai timē estephanōsas auton kai katestēsas auton epi ta erga tōn cheirōn sou',
   '''A little lower'' (brachy ti — for a little while, or by a small degree; the phrase can be temporal or qualitative). In the LXX of Psalm 8, this describes man''s position relative to angels — slightly lower but destined for dominion. The author applies it christologically: Jesus was made lower than the angels temporarily (during His incarnation) so that He might be crowned with glory and honour after His atoning death. ''Crowned'' (estephanōsas — you crowned; the verb implies a victor''s wreath, the reward for accomplishment). ''Set him over'' (katestēsas — you appointed him over) — universal dominion.',
   NULL),
  (8, 'Thou hast put all things in subjection under his feet. For in that he put all in subjection under him, he left nothing that is not put under him. But now we see not yet all things put under him.',
   'πάντα ὑπέταξας ὑποκάτω τῶν ποδῶν αὐτοῦ ἐν γὰρ τῷ ὑποτάξαι αὐτῷ τὰ πάντα οὐδὲν ἀφῆκεν αὐτῷ ἀνυπότακτον νῦν δὲ οὔπω ὁρῶμεν αὐτῷ τὰ πάντα ὑποτεταγμένα',
   'panta hypetaxas hypokatō tōn podōn autou en gar tō hypotaxai autō ta panta ouden aphēken autō anypotakton nyn de oupō horōmen autō ta panta hypotetagmena',
   '''All things in subjection'' (panta hypetaxas — you subjected everything). ''He left nothing'' (ouden aphēken anypotakton — He left nothing un-subjected). The scope is absolute: God''s design is total dominion for the Son/man. ''But now we see not yet'' (nyn de oupō horōmen — but now we do not yet see) — honest acknowledgment of the ''already/not yet'' tension. The complete subjection of all things is God''s decree but not yet fully realized. This creates the space for the ''not yet'' of eschatological hope. The solution to the gap between God''s decree and present reality is found in the next verse.',
   'The ''already/not yet'' eschatological framework is established here: God has decreed the Son''s universal dominion, but its full realization awaits the consummation. Believers live in this tension — assured of God''s purpose but awaiting its completion.'),
  (9, 'But we see Jesus, who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of God should taste death for every man.',
   'τὸν δὲ βραχύ τι παρ᾽ ἀγγέλους ἠλαττωμένον βλέπομεν Ἰησοῦν διὰ τὸ πάθημα τοῦ θανάτου δόξῃ καὶ τιμῇ ἐστεφανωμένον ὅπως χάριτι θεοῦ ὑπὲρ παντὸς γεύσηται θανάτου',
   'ton de brachy ti par angelous ēlattōmenon blepomen Iēsoun dia to pathēma tou thanatou doxē kai timē estephanōmenon hopōs chariti theou hyper pantos geusētai thanatou',
   '''But we see Jesus'' (blepomen Iēsoun — we behold Jesus; the human name emphasizes His incarnation). Though we do not yet see all things subjected, we do see Jesus — and His story (humiliation → exaltation) guarantees the final outcome. ''Made a little lower'' — His incarnation temporarily placed Him below angels. ''For the suffering of death'' (dia to pathēma tou thanatou — because of the suffering of death; the purpose of His humiliation was to die). ''Crowned with glory and honour'' — His exaltation followed His death. ''Taste death for every man'' (hyper pantos geusētai thanatou — that He might taste death on behalf of everyone). ''Taste'' (geusētai — to experience fully, not merely sample). ''By the grace of God'' (chariti theou — this was an act of sheer grace).',
   'This verse is central to the doctrine of the atonement. Christ ''tasted death for every man'' (hyper pantos) — His death was substitutionary (hyper — on behalf of) and universal in its sufficiency. The incarnation was not an end in itself but the means to the cross: He became man so He could die, and He died so that humanity might live.'),
  (10, 'For it became him, for whom are all things, and by whom are all things, in bringing many sons unto glory, to make the captain of their salvation perfect through sufferings.',
   'ἔπρεπεν γὰρ αὐτῷ δι᾽ ὃν τὰ πάντα καὶ δι᾽ οὗ τὰ πάντα πολλοὺς υἱοὺς εἰς δόξαν ἀγαγόντα τὸν ἀρχηγὸν τῆς σωτηρίας αὐτῶν διὰ παθημάτων τελειῶσαι',
   'eprepen gar autō di hon ta panta kai di hou ta panta pollous hyious eis doxan agagonta ton archēgon tēs sōtērias autōn dia pathēmatōn teleiōsai',
   '''It became him'' (eprepen — it was fitting, it was appropriate; the suffering of Christ was not random but perfectly suited to God''s character and purpose). ''For whom are all things, and by whom are all things'' — God the Father, the source and goal of all existence. ''Many sons unto glory'' (pollous hyious eis doxan — the Father''s purpose is to bring many sons to share in glory). ''Captain'' (archēgon — pioneer, trailblazer, author, originator; one who goes first and leads others along the same path). ''Perfect through sufferings'' (dia pathēmatōn teleiōsai — to bring to completion, to make fully qualified through suffering). This does not mean Jesus was morally imperfect; teleiōsai means to bring to the goal, to qualify fully for His role. Suffering equipped Him experientially for His role as high priest and savior.',
   'Christ was made ''perfect'' (teleios) through suffering — not morally (He was sinless, 4:15) but vocationally. His sufferings completed His qualification as the perfect Savior, able to sympathize with human frailty. This ''perfection through suffering'' is a key Hebrews motif (5:8-9; 7:28).'),
  (11, 'For both he that sanctifieth and they who are sanctified are all of one: for which cause he is not ashamed to call them brethren,',
   'ὅ τε γὰρ ἁγιάζων καὶ οἱ ἁγιαζόμενοι ἐξ ἑνὸς πάντες δι᾽ ἣν αἰτίαν οὐκ ἐπαισχύνεται ἀδελφοὺς αὐτοὺς καλεῖν',
   'ho te gar hagiazōn kai hoi hagiazomenoi ex henos pantes di hēn aitian ouk epaischynetai adelphous autous kalein',
   '''He that sanctifieth'' (ho hagiazōn — the one who makes holy; present participle indicating ongoing action) is Christ. ''They who are sanctified'' (hoi hagiazomenoi — those being made holy) are believers. ''All of one'' (ex henos pantes — all from one; either ''one Father'' or ''one origin/nature'' — through the incarnation, Christ shares humanity with those He saves). ''Not ashamed to call them brethren'' (ouk epaischynetai adelphous autous kalein) — the Son of God, the Creator of the universe, is not embarrassed to call redeemed sinners His brothers and sisters. This is staggering condescension rooted in genuine identification: He truly shares our nature.',
   'The incarnation establishes a real solidarity between Christ and believers. He ''sanctifies'' (makes holy) and they ''are sanctified'' (are being made holy) — but both share a common humanity. This shared nature is the basis for His substitutionary death and ongoing sympathy.'),
  (12, 'Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee.',
   'λέγων ἀπαγγελῶ τὸ ὄνομά σου τοῖς ἀδελφοῖς μου ἐν μέσῳ ἐκκλησίας ὑμνήσω σε',
   'legōn apangelō to onoma sou tois adelphois mou en mesō ekklēsias hymnēsō se',
   'Quoting Psalm 22:22. The messianic Psalm that begins with ''My God, my God, why hast thou forsaken me?'' (cited by Jesus on the cross, Matt 27:46) transitions in v.22 to triumph: the Suffering Servant, having endured the cross, declares God''s name to His brethren and leads worship ''in the midst of the church'' (en mesō ekklēsias). Christ is pictured as the worship leader of the redeemed community — singing praise to the Father among His brothers. ''I will declare'' (apangelō — I will announce, proclaim) — Christ reveals the Father to His people.',
   NULL),
  (13, 'And again, I will put my trust in him. And again, Behold I and the children which God hath given me.',
   'καὶ πάλιν ἐγὼ ἔσομαι πεποιθὼς ἐπ᾽ αὐτῷ καὶ πάλιν ἰδοὺ ἐγὼ καὶ τὰ παιδία ἅ μοι ἔδωκεν ὁ θεός',
   'kai palin egō esomai pepoithōs ep autō kai palin idou egō kai ta paidia ha moi edōken ho theos',
   'Two more OT quotations applied to Christ. (1) Isaiah 8:17 — ''I will put my trust in him'' (egō esomai pepoithōs ep autō — I will be trusting in Him). Christ, in His true humanity, exercised faith in the Father — modeling the life of trust that believers are called to. (2) Isaiah 8:18 — ''Behold I and the children which God hath given me.'' In Isaiah, the prophet and his children were signs to Israel; in Hebrews, Christ and His ''children'' (believers) are presented together before God. ''Which God hath given me'' (ha moi edōken ho theos) — believers are the Father''s gift to the Son (cf. John 6:37; 17:6), chosen and given by sovereign grace.',
   NULL),
  (14, 'Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;',
   'ἐπεὶ οὖν τὰ παιδία κεκοινώνηκεν αἵματος καὶ σαρκός καὶ αὐτὸς παραπλησίως μετέσχεν τῶν αὐτῶν ἵνα διὰ τοῦ θανάτου καταργήσῃ τὸν τὸ κράτος ἔχοντα τοῦ θανάτου τοῦτ᾽ ἔστιν τὸν διάβολον',
   'epei oun ta paidia kekoinōnēken haimatos kai sarkos kai autos paraplēsiōs meteschen tōn autōn hina dia tou thanatou katargēsē ton to kratos echonta tou thanatou tout estin ton diabolon',
   '''Partakers of flesh and blood'' (kekoinōnēken haimatos kai sarkos — have shared in blood and flesh; the perfect tense shows this is the natural, permanent condition of the ''children''). ''He also himself likewise took part of the same'' (kai autos paraplēsiōs meteschen tōn autōn — and He similarly partook of the same things). Two different verbs are used: the children ''share'' (koinōneō — have in common, as an ongoing state) while Christ ''partook'' (metechō — took a share of, as a deliberate act). The incarnation was a voluntary decision, not a natural condition. ''Destroy'' (katargēsē — render powerless, make ineffective, abolish). ''Him that had the power of death, that is, the devil'' — Satan wielded death as his weapon of terror; Christ''s death destroyed death''s power from within.',
   'Christ''s death paradoxically destroyed death itself. By dying, He rendered the devil''s chief weapon — the power of death — impotent. This is the Christus Victor theme: Christ conquered the devil not by avoiding death but by going through it and emerging victorious in resurrection. The cross was simultaneously Satan''s apparent victory and his actual defeat.'),
  (15, 'And deliver them who through fear of death were all their lifetime subject to bondage.',
   'καὶ ἀπαλλάξῃ τούτους ὅσοι φόβῳ θανάτου διὰ παντὸς τοῦ ζῆν ἔνοχοι ἦσαν δουλείας',
   'kai apallaxē toutous hosoi phobō thanatou dia pantos tou zēn enochoi ēsan douleias',
   '''Deliver'' (apallaxē — to set free, to release, to liberate). ''Fear of death'' (phobō thanatou) — the universal human condition: the terror of death that enslaves the human race. ''All their lifetime'' (dia pantos tou zēn — throughout the whole of their living). ''Subject to bondage'' (enochoi douleias — held in slavery, liable to servitude). Death is not just an event but a tyrant that holds humanity in lifelong slavery through fear. Christ''s death and resurrection break this bondage — believers are freed from the terror of death because death has been conquered.',
   NULL),
  (16, 'For verily he took not on him the nature of angels; but he took on him the seed of Abraham.',
   'οὐ γὰρ δήπου ἀγγέλων ἐπιλαμβάνεται ἀλλὰ σπέρματος Ἀβραὰμ ἐπιλαμβάνεται',
   'ou gar dēpou angelōn epilambanetai alla spermatos Abraam epilambanetai',
   '''He took not on him the nature of angels'' — more literally, ''He does not take hold of angels'' (angelōn epilambanetai — He does not grasp angels to rescue them). ''But he took on him the seed of Abraham'' (spermatos Abraam epilambanetai — He takes hold of Abraham''s descendants). The verb epilambanomai means to seize, to take hold of, to lay hold of for the purpose of rescue. Christ''s incarnation was specifically as a human — and specifically as a descendant of Abraham, fulfilling the covenant promise that in Abraham''s seed all nations would be blessed (Gen 22:18; Gal 3:16). He did not become an angel; He became a man — a Jewish man, heir of the Abrahamic covenant.',
   'The specificity of the incarnation is theologically significant: Christ did not assume a generic humanity but became the ''seed of Abraham,'' linking the incarnation to the covenant promises of the OT. Salvation comes through the particular — through Israel, through Abraham''s line, through one specific man, Jesus of Nazareth.'),
  (17, 'Wherefore in all things it behoved him to be made like unto his brethren, that he might be a merciful and faithful high priest in things pertaining to God, to make reconciliation for the sins of the people.',
   'ὅθεν ὤφειλεν κατὰ πάντα τοῖς ἀδελφοῖς ὁμοιωθῆναι ἵνα ἐλεήμων γένηται καὶ πιστὸς ἀρχιερεὺς τὰ πρὸς τὸν θεόν εἰς τὸ ἱλάσκεσθαι τὰς ἁμαρτίας τοῦ λαοῦ',
   'hothen ōpheilen kata panta tois adelphois homoiōthēnai hina eleēmōn genētai kai pistos archiereus ta pros ton theon eis to hilaskesthai tas hamartias tou laou',
   '''It behoved him'' (ōpheilen — He was obligated, it was necessary; a moral and theological necessity). ''In all things'' (kata panta — in every respect, in every way). ''Made like unto his brethren'' (tois adelphois homoiōthēnai — to be made like His brothers). ''Merciful and faithful high priest'' (eleēmōn kai pistos archiereus) — the first explicit mention of Christ as ''high priest'' in Hebrews, the theme that will dominate chapters 5-10. Two qualities: merciful (eleēmōn — compassionate, moved by the sufferings of others) because He has shared our experience; faithful (pistos — trustworthy, reliable) because He perfectly represents God. ''Make reconciliation'' (hilaskesthai — to propitiate, to make atonement, to turn away wrath). The high priest''s role is to deal with sin — and Christ fulfills this role perfectly because He is both fully human and fully divine.',
   'This verse introduces the high priest Christology that is Hebrews'' most distinctive contribution to NT theology. Christ is the perfect high priest because His full humanity makes Him merciful (He understands human weakness) and His deity makes Him faithful (He perfectly represents God). The word hilaskesthai (propitiation) indicates that Christ''s priestly work deals with God''s just wrath against sin — not merely human guilt feelings.'),
  (18, 'For in that he himself hath suffered being tempted, he is able to succour them that are tempted.',
   'ἐν ᾧ γὰρ πέπονθεν αὐτὸς πειρασθείς δύναται τοῖς πειραζομένοις βοηθῆσαι',
   'en hō gar peponthen autos peirastheis dynatai tois peirazomenois boēthēsai',
   '''He himself hath suffered being tempted'' (peponthen autos peirastheis — He has suffered, having been tested/tempted). The perfect tense (peponthen) indicates the lasting relevance of Christ''s earthly suffering. ''He is able'' (dynatai — He has the power, the capacity). ''Succour'' (boēthēsai — to run to the aid of, to help, to come to the rescue; from boē + theō, literally ''to run at a cry for help''). Because Christ experienced genuine human temptation and suffering (without sinning), He can come to the rescue of those undergoing the same. His help is not theoretical but experiential — He knows what it feels like and He has the power to deliver.',
   'This verse establishes the pastoral application of the incarnation: Christ''s temptation experience equips Him to help His people in their temptations. His sympathy is not based on imagination but on actual experience. This theme is expanded in 4:15-16, where believers are invited to ''come boldly unto the throne of grace'' precisely because their high priest understands their struggles.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 2;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παραρρέω', 'parrarheō', 'G3901', 'To flow past, to drift away, to slip by — used of a boat drifting past its harbor or a ring slipping off a finger. A NT hapax (only in v.1). The danger described is not violent shipwreck but imperceptible drifting — the slow, unnoticed movement away from truth that comes from inattention rather than deliberate rejection. The passive voice suggests that drifting is the default: without active effort to stay anchored, one will naturally float away.', 1),
  ('ἀρχηγός', 'archēgos', 'G747', 'Captain, pioneer, author, originator, pathfinder — from archē (beginning, rule) + agō (to lead). Used four times in the NT (Acts 3:15; 5:31; Heb 2:10; 12:2). In v.10 Christ is the archēgos of salvation — the trailblazer who pioneers the path of salvation through suffering, leading ''many sons unto glory'' along the route He first traveled. He is both the source of salvation and the leader who goes before His people.', 2),
  ('τελειόω', 'teleioō', 'G5048', 'To make complete, to bring to the goal, to perfect, to bring to full maturity — from teleios (complete, mature, having reached its end/purpose). In v.10 Christ was ''made perfect through sufferings'' — not morally perfected (He was sinless) but vocationally completed: suffering equipped Him fully for His role as sympathetic high priest and pioneer of salvation. This verb appears 9 times in Hebrews (2:10; 5:9; 7:19,28; 9:9; 10:1,14; 11:40; 12:23).', 3),
  ('καταργέω', 'katargeō', 'G2673', 'To render powerless, to make ineffective, to abolish, to bring to nothing — from kata (down) + argeō (to be idle, from a-ergon, without work). In v.14 Christ''s death ''destroyed'' (katargēsē) the devil — not annihilated him but rendered his power over death ineffective. The devil still exists but his chief weapon — the power of death — has been broken by Christ''s resurrection.', 4),
  ('ἱλάσκομαι', 'hilaskomai', 'G2433', 'To propitiate, to make atonement, to expiate, to make reconciliation — related to hilasmos (propitiation, 1 John 2:2) and hilastērion (mercy seat, Rom 3:25). In v.17 Christ as high priest makes hilaskomai for the sins of the people — He satisfies divine justice, turns away God''s wrath, and restores the broken relationship between God and man. The word encompasses both the Godward aspect (propitiation — satisfying justice) and the manward aspect (expiation — removing guilt).', 5),
  ('βοηθέω', 'boētheō', 'G997', 'To run to help, to come to the aid of, to succour — from boē (a cry) + theō (to run). In v.18 Christ is able to ''succour'' (boēthēsai) those who are being tempted — He runs to their cry for help. The word conveys urgency and compassion: Christ does not wait to be found but runs to rescue His people in their moment of need. His ability to help is rooted in His own experience of suffering and temptation.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 2
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 10
    WHEN 3 THEN 10
    WHEN 4 THEN 14
    WHEN 5 THEN 17
    WHEN 6 THEN 18
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Hebrews 3:12-14', 1),
  (1, 'Hebrews 12:25', 2),
  (2, 'Acts 7:53', 3),
  (2, 'Galatians 3:19', 4),
  (2, 'Deuteronomy 33:2', 5),
  (3, 'Hebrews 10:28-29', 6),
  (3, 'Hebrews 12:25', 7),
  (4, '1 Corinthians 12:4-11', 8),
  (4, 'Mark 16:20', 9),
  (6, 'Psalm 8:4-6', 10),
  (7, 'Psalm 8:5', 11),
  (8, '1 Corinthians 15:25-27', 12),
  (8, 'Ephesians 1:22', 13),
  (9, 'Philippians 2:8-9', 14),
  (9, '1 Timothy 2:6', 15),
  (9, 'John 3:16', 16),
  (10, 'Hebrews 5:8-9', 17),
  (10, 'Hebrews 12:2', 18),
  (10, 'Acts 3:15', 19),
  (11, 'Hebrews 10:10', 20),
  (11, 'Romans 8:29', 21),
  (12, 'Psalm 22:22', 22),
  (12, 'Matthew 27:46', 23),
  (13, 'Isaiah 8:17-18', 24),
  (13, 'John 17:6', 25),
  (14, 'John 1:14', 26),
  (14, 'Colossians 2:15', 27),
  (14, '1 John 3:8', 28),
  (14, '2 Timothy 1:10', 29),
  (15, 'Romans 8:15', 30),
  (15, '1 Corinthians 15:55-57', 31),
  (16, 'Genesis 22:18', 32),
  (16, 'Galatians 3:16', 33),
  (17, 'Hebrews 4:15', 34),
  (17, 'Romans 3:25', 35),
  (17, '1 John 2:2', 36),
  (18, 'Hebrews 4:15-16', 37),
  (18, 'Hebrews 5:2', 38)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 2
  AND v.verse_number = cr.verse_number;
