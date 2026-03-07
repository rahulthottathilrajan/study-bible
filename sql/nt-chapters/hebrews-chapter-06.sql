-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 6 — The Third Warning and the Anchor of the Soul
-- 20 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  'Hebrews 6 contains the most sobering warning passage in the NT alongside one of its most comforting promises. The chapter opens with a call to move beyond elementary teachings toward maturity (vv.1-3), then delivers the devastating warning: ''For it is impossible for those who were once enlightened, and have tasted of the heavenly gift, and were made partakers of the Holy Ghost, and have tasted the good word of God, and the powers of the world to come, if they shall fall away, to renew them again unto repentance; seeing they crucify to themselves the Son of God afresh, and put him to an open shame'' (vv.4-6). The agricultural illustration reinforces the point: land that receives rain and produces thorns is ''rejected, and is nigh unto cursing; whose end is to be burned'' (vv.7-8). Yet the author immediately softens: ''But, beloved, we are persuaded better things of you, and things that accompany salvation'' (v.9) — he does not believe his readers have committed this apostasy. God is not unjust to forget their ''work and labour of love'' (v.10). He urges them to diligence ''to the full assurance of hope unto the end'' (v.11), not to be ''slothful, but followers of them who through faith and patience inherit the promises'' (v.12). The chapter then turns to the unshakeable certainty of God''s promise to Abraham, confirmed by an oath — ''two immutable things, in which it was impossible for God to lie'' (v.18). This hope is ''an anchor of the soul, both sure and stedfast, and which entereth into that within the veil; whither the forerunner is for us entered, even Jesus, made an high priest for ever after the order of Melchisedec'' (vv.19-20).',
  'The Third Warning, God''s Immutable Promise, and the Anchor of the Soul',
  'ἄγκυρα (ankyra)',
  'Anchor — the instrument that secures a ship against wind and current. In v.19 the believer''s hope is described as an anchor of the soul — not anchored to the sea floor but cast upward ''into that within the veil,'' the heavenly Holy of Holies where Christ has entered as forerunner. This is hope anchored in heaven itself, in the very presence of God, secured by Christ''s priestly ministry. The anchor holds because its grip is in the unshakeable reality of God''s throne room.',
  '["The Call to Maturity (vv.1-3): Therefore leaving the principles of the doctrine of Christ let us go on unto perfection not laying again the foundation of repentance from dead works and of faith toward God of the doctrine of baptisms and of laying on of hands and of resurrection of the dead and of eternal judgment; and this will we do if God permit","The Third Warning: Impossible to Renew (vv.4-8): For it is impossible for those who were once enlightened and have tasted of the heavenly gift and were made partakers of the Holy Ghost and have tasted the good word of God and the powers of the world to come if they shall fall away to renew them again unto repentance seeing they crucify to themselves the Son of God afresh and put him to an open shame; for the earth which drinketh in the rain that cometh oft upon it and bringeth forth herbs meet for them by whom it is dressed receiveth blessing from God but that which beareth thorns and briers is rejected and is nigh unto cursing whose end is to be burned","Better Things Accompanying Salvation (vv.9-12): But beloved we are persuaded better things of you and things that accompany salvation though we thus speak; for God is not unrighteous to forget your work and labour of love which ye have shewed toward his name in that ye have ministered to the saints and do minister; and we desire that every one of you do shew the same diligence to the full assurance of hope unto the end; that ye be not slothful but followers of them who through faith and patience inherit the promises","The Anchor of the Soul: God''s Oath to Abraham (vv.13-20): For when God made promise to Abraham because he could swear by no greater he sware by himself saying Surely blessing I will bless thee and multiplying I will multiply thee; and so after he had patiently endured he obtained the promise; for men verily swear by the greater and an oath for confirmation is to them an end of all strife; wherein God willing more abundantly to shew unto the heirs of promise the immutability of his counsel confirmed it by an oath; that by two immutable things in which it was impossible for God to lie we might have a strong consolation who have fled for refuge to lay hold upon the hope set before us; which hope we have as an anchor of the soul both sure and stedfast and which entereth into that within the veil; whither the forerunner is for us entered even Jesus made an high priest for ever after the order of Melchisedec"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 20 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Therefore leaving the principles of the doctrine of Christ, let us go on unto perfection; not laying again the foundation of repentance from dead works, and of faith toward God,',
   'διὸ ἀφέντες τὸν τῆς ἀρχῆς τοῦ Χριστοῦ λόγον ἐπὶ τὴν τελειότητα φερώμεθα μὴ πάλιν θεμέλιον καταβαλλόμενοι μετανοίας ἀπὸ νεκρῶν ἔργων καὶ πίστεως ἐπὶ θεόν',
   'dio aphentes ton tēs archēs tou Christou logon epi tēn teleiotēta pherōmetha mē palin themelion kataballomenoi metanoias apo nekrōn ergōn kai pisteōs epi theon',
   '''Leaving'' (aphentes — leaving behind, not abandoning but building upon). ''Principles of the doctrine of Christ'' (ton tēs archēs tou Christou logon — the word/teaching of the beginning of Christ; the elementary, introductory teaching). ''Go on unto perfection'' (epi tēn teleiotēta pherōmetha — let us be carried forward to maturity/completeness). The six foundations listed in vv.1-2 are presented in three pairs: (1) repentance from dead works and faith toward God; (2) doctrine of baptisms and laying on of hands; (3) resurrection of the dead and eternal judgment. ''Dead works'' (nekrōn ergōn) — works that produce spiritual death, whether sinful deeds or legalistic self-effort.',
   NULL),
  (2, 'Of the doctrine of baptisms, and of laying on of hands, and of resurrection of the dead, and of eternal judgment.',
   'βαπτισμῶν διδαχῆς ἐπιθέσεώς τε χειρῶν ἀναστάσεώς τε νεκρῶν καὶ κρίματος αἰωνίου',
   'baptismōn didachēs epitheseōs te cheirōn anastaseōs te nekrōn kai krimatos aiōniou',
   '''Baptisms'' (baptismōn — plural, suggesting instruction about various washings: the distinction between Jewish ritual washings, John''s baptism, and Christian baptism). ''Laying on of hands'' (epitheseōs cheirōn — the practice associated with ordination, commissioning, healing, and the imparting of the Spirit; Acts 8:17; 1 Tim 4:14). ''Resurrection of the dead'' (anastaseōs nekrōn — a fundamental doctrine shared with Pharisaic Judaism but given new content by Christ''s resurrection). ''Eternal judgment'' (krimatos aiōniou — the final, irreversible judgment at the consummation). These six doctrines form the catechetical foundation — essential but elementary.',
   NULL),
  (3, 'And this will we do, if God permit.',
   'καὶ τοῦτο ποιήσομεν ἐάνπερ ἐπιτρέπῃ ὁ θεός',
   'kai touto poiēsomen eanper epitrepē ho theos',
   '''If God permit'' (eanper epitrepē ho theos — if indeed God allows). A sobering qualifier: even the ability to progress toward maturity depends on God''s permission. This may hint at the warning that follows: for some, the opportunity for repentance and growth may be forfeited. Spiritual progress is not guaranteed; it requires both human diligence and divine enablement.',
   NULL),
  (4, 'For it is impossible for those who were once enlightened, and have tasted of the heavenly gift, and were made partakers of the Holy Ghost,',
   'ἀδύνατον γὰρ τοὺς ἅπαξ φωτισθέντας γευσαμένους τε τῆς δωρεᾶς τῆς ἐπουρανίου καὶ μετόχους γενηθέντας πνεύματος ἁγίου',
   'adynaton gar tous hapax photisthentas geusamenous te tēs dōreas tēs epouraniou kai metochous genēthentAs pneumatos hagiou',
   '''Impossible'' (adynaton — without power, unable to be done; the strongest possible negation). ''Once enlightened'' (hapax photisthentas — illuminated once for all; photizō was used in early church for baptismal instruction). ''Tasted of the heavenly gift'' (geusamenous tēs dōreas tēs epouraniou — experienced, sampled the gift from heaven; likely salvation itself or the Holy Spirit). ''Partakers of the Holy Ghost'' (metochous genēthentAs pneumatos hagiou — having become sharers in the Holy Spirit). Five descriptors (vv.4-5) characterize these persons — they have experienced real spiritual privileges. The debate is whether they describe genuine believers or those with external religious experience who were never truly regenerated. The language is strong: ''partakers of the Holy Ghost'' especially suggests genuine spiritual experience.',
   'This passage has generated more theological debate than perhaps any other in the NT. The five descriptions of those who ''fall away'' appear to describe genuine spiritual experience. Three main interpretive approaches exist: (1) Genuine believers who lose salvation (Arminian); (2) Those with genuine-appearing but ultimately superficial experience who reveal they were never truly saved (Reformed); (3) A hypothetical warning — describing what would be the case if genuine believers could fall away, to motivate perseverance (also Reformed). The author''s purpose is pastoral: to warn urgently against the danger of apostasy, whatever one''s theological system.'),
  (5, 'And have tasted the good word of God, and the powers of the world to come,',
   'καὶ καλὸν γευσαμένους θεοῦ ῥῆμα δυνάμεις τε μέλλοντος αἰῶνος',
   'kai kalon geusamenous theou rhēma dynameis te mellontos aiōnos',
   '''Tasted the good word of God'' (kalon geusamenous theou rhēma — having tasted God''s good/beautiful word). ''The powers of the world to come'' (dynameis mellontos aiōnos — the powers/miracles of the coming age). These persons experienced the eschatological in-breaking of the age to come — the miracles, spiritual gifts, and transforming power that characterize the messianic era. They tasted heavenly realities. The verb ''taste'' (geuomai) means genuine experience, not superficial sampling (cf. Heb 2:9, where Christ ''tasted death'' — He fully experienced it).',
   NULL),
  (6, 'If they shall fall away, to renew them again unto repentance; seeing they crucify to themselves the Son of God afresh, and put him to an open shame.',
   'καὶ παραπεσόντας πάλιν ἀνακαινίζειν εἰς μετάνοιαν ἀνασταυροῦντας ἑαυτοῖς τὸν υἱὸν τοῦ θεοῦ καὶ παραδειγματίζοντας',
   'kai parapesontas palin anakainizein eis metanoian anastaurountas heautois ton hyion tou theou kai paradeigmatizontas',
   '''Fall away'' (parapesontas — having fallen alongside, having fallen away; a deliberate, decisive rejection, not a momentary lapse). ''Renew them again unto repentance'' (palin anakainizein eis metanoian — to renovate, to make new again for repentance). The ''impossibility'' is not that God lacks power but that the apostate has irrevocably rejected the only means of salvation. ''Crucify to themselves the Son of God afresh'' (anastaurountas heautois ton hyion tou theou — re-crucifying the Son of God for themselves). The apostate treats Christ''s sacrifice as worthless, effectively siding with those who crucified Him. ''Put him to an open shame'' (paradeigmatizontas — to hold up to public contempt, to make a public spectacle). This is not mere backsliding but a deliberate, public repudiation of Christ.',
   'The impossibility of renewal is tied to the nature of apostasy: those who reject Christ''s sacrifice have no other sacrifice to turn to. There is no Plan B — ''there remaineth no more sacrifice for sins'' (10:26). The gravity of this warning is designed to prevent it from happening, not to describe a common occurrence. The author immediately expresses confidence that his readers are not in this category (v.9).'),
  (7, 'For the earth which drinketh in the rain that cometh oft upon it, and bringeth forth herbs meet for them by whom it is dressed, receiveth blessing from God:',
   'γῆ γὰρ ἡ πιοῦσα τὸν ἐπ᾽ αὐτῆς πολλάκις ἐρχόμενον ὑετὸν καὶ τίκτουσα βοτάνην εὔθετον ἐκείνοις δι᾽ οὓς καὶ γεωργεῖται μεταλαμβάνει εὐλογίας ἀπὸ τοῦ θεοῦ',
   'gē gar hē piousa ton ep autēs pollakis erchomenon hyeton kai tiktousa botanēn eutheton ekeinois di hous kai geōrgeitai metalambanei eulogias apo tou theou',
   'The agricultural parable: two types of land receive the same rain (God''s blessings). ''Earth which drinketh in the rain'' — both types of land receive abundant rain (pollakis — often). ''Bringeth forth herbs'' (tiktousa botanēn — producing vegetation). ''Meet for them by whom it is dressed'' (eutheton ekeinois di hous geōrgeitai — useful for those who cultivate it). Productive land receives blessing from God. The rain represents God''s gracious provision (His word, His Spirit, the means of grace); the response determines the outcome.',
   NULL),
  (8, 'But that which beareth thorns and briers is rejected, and is nigh unto cursing; whose end is to be burned.',
   'ἐκφέρουσα δὲ ἀκάνθας καὶ τριβόλους ἀδόκιμος καὶ κατάρας ἐγγύς ἧς τὸ τέλος εἰς καῦσιν',
   'ekpherousa de akanthas kai tribolous adokimos kai kataras engys hēs to telos eis kausin',
   '''Beareth thorns and briers'' (ekpherousa akanthas kai tribolous — producing thorns and thistles; echoing the curse of Genesis 3:18). ''Rejected'' (adokimos — disapproved, failing the test; the same word as 2 Cor 13:5-7). ''Nigh unto cursing'' (kataras engys — near to being cursed; not yet cursed but approaching it). ''Whose end is to be burned'' (hēs to telos eis kausin — whose end/destiny is burning). The burning of unproductive land was standard agricultural practice — clearing thorny ground with fire. The spiritual application is solemn: those who receive God''s rain (grace) but produce only thorns (apostasy) face judgment.',
   NULL),
  (9, 'But, beloved, we are persuaded better things of you, and things that accompany salvation, though we thus speak.',
   'πεπείσμεθα δὲ περὶ ὑμῶν ἀγαπητοί τὰ κρείττονα καὶ ἐχόμενα σωτηρίας εἰ καὶ οὕτως λαλοῦμεν',
   'pepeismetha de peri hymōn agapētoi ta kreittona kai echomena sōtērias ei kai houtōs laloumen',
   '''Beloved'' (agapētoi — the only time this term appears in Hebrews; a warm, affectionate address that softens the severity of the warning). ''We are persuaded'' (pepeismetha — we have been convinced and remain convinced; perfect tense: settled conviction). ''Better things'' (ta kreittona — the better things, the things that surpass the fate described in vv.4-8). ''Things that accompany salvation'' (echomena sōtērias — things connected to, clinging to salvation). The author believes his readers show the fruit of genuine salvation. The warning is not a verdict but a preventive measure — designed to keep them from the cliff, not to describe them as already over it.',
   'This verse is crucial for interpreting the warning. The author distinguishes between the hypothetical case of vv.4-8 and his actual assessment of his readers. He expects ''better things'' — fruit that ''accompanies salvation.'' The warning serves its purpose precisely by being heard and heeded; those who take it seriously demonstrate that they are not its targets.'),
  (10, 'For God is not unrighteous to forget your work and labour of love, which ye have shewed toward his name, in that ye have ministered to the saints, and do minister.',
   'οὐ γὰρ ἄδικος ὁ θεὸς ἐπιλαθέσθαι τοῦ ἔργου ὑμῶν καὶ τοῦ κόπου τῆς ἀγάπης ἧς ἐνεδείξασθε εἰς τὸ ὄνομα αὐτοῦ διακονήσαντες τοῖς ἁγίοις καὶ διακονοῦντες',
   'ou gar adikos ho theos epilathesthai tou ergou hymōn kai tou kopou tēs agapēs hēs enedeixasthe eis to onoma autou diakonēsantes tois hagiois kai diakonountes',
   '''God is not unrighteous to forget'' (ou adikos ho theos epilathesthai — God is not unjust so as to forget; God''s justice guarantees that He remembers and rewards faithful service). ''Work and labour of love'' (tou ergou kai tou kopou tēs agapēs — your work and toiling love). ''Ministered to the saints'' (diakonēsantes tois hagiois — having served the holy ones). ''And do minister'' (kai diakonountes — and continuing to serve; present participle: their loving service is ongoing). Their active love for fellow believers is evidence of genuine faith — the ''things that accompany salvation'' (v.9). Works do not save but they evidence salvation.',
   NULL),
  (11, 'And we desire that every one of you do shew the same diligence to the full assurance of hope unto the end:',
   'ἐπιθυμοῦμεν δὲ ἕκαστον ὑμῶν τὴν αὐτὴν ἐνδείκνυσθαι σπουδὴν πρὸς τὴν πληροφορίαν τῆς ἐλπίδος ἄχρι τέλους',
   'epithymoumen de hekaston hymōn tēn autēn endeiknysthai spoudēn pros tēn plērophorian tēs elpidos achri telous',
   '''Every one of you'' (hekaston hymōn — each individual one; the warning and encouragement apply to each person, not just the group). ''Same diligence'' (tēn autēn spoudēn — the same eagerness that they show in serving the saints). ''Full assurance of hope'' (tēn plērophorian tēs elpidos — the complete certainty, the full conviction of hope; plērophoria means fullness of bearing, being filled to overflowing with confidence). ''Unto the end'' (achri telous — until the completion, the finish). The author wants their service to be matched by an equally diligent pursuit of assurance — not presumption but confident, grounded hope.',
   NULL),
  (12, 'That ye be not slothful, but followers of them who through faith and patience inherit the promises.',
   'ἵνα μὴ νωθροὶ γένησθε μιμηταὶ δὲ τῶν διὰ πίστεως καὶ μακροθυμίας κληρονομούντων τὰς ἐπαγγελίας',
   'hina mē nōthroi genēsthe mimētai de tōn dia pisteōs kai makrothymias klēronomountōn tas epangelias',
   '''Slothful'' (nōthroi — sluggish, lazy; the same word from 5:11). ''Followers'' (mimētai — imitators; from which we get ''mimic''). ''Faith and patience'' (pisteōs kai makrothymias — faith and long-suffering, faith and patient endurance). ''Inherit the promises'' (klēronomountōn tas epangelias — those who are inheriting/receiving the promises). The model is Abraham (vv.13-15) and all the faithful who persevered. The chapter prepares for the great ''faith hall of fame'' of chapter 11. The twin virtues are faith (trusting God''s promises) and patience (enduring until they are fulfilled).',
   NULL),
  (13, 'For when God made promise to Abraham, because he could swear by no greater, he sware by himself,',
   'τῷ γὰρ Ἀβραὰμ ἐπαγγειλάμενος ὁ θεός ἐπεὶ κατ᾽ οὐδενὸς εἶχεν μείζονος ὀμόσαι ὤμοσεν καθ᾽ ἑαυτοῦ',
   'tō gar Abraam epangeilamenos ho theos epei kat oudenos eichen meizonos omosai ōmosen kath heautou',
   '''He could swear by no greater'' (kat oudenos eichen meizonos omosai — He had no one greater to swear by). ''He sware by himself'' (ōmosen kath heautou — He took an oath by Himself). When humans swear oaths, they swear by someone greater (v.16). God, having no one greater, swore by Himself — staking His own character and existence on the truth of His promise. This is the ultimate guarantee: if God''s promise fails, God Himself fails — which is impossible. The reference is to Genesis 22:16-17, after Abraham offered Isaac.',
   NULL),
  (14, 'Saying, Surely blessing I will bless thee, and multiplying I will multiply thee.',
   'λέγων ἦ μὴν εὐλογῶν εὐλογήσω σε καὶ πληθύνων πληθυνῶ σε',
   'legōn ē mēn eulogōn eulogēsō se kai plēthynōn plēthynō se',
   'Quoting Genesis 22:17. ''Surely blessing I will bless thee'' (eulogōn eulogēsō se — blessing I will bless you; the Hebrew idiom of the infinitive absolute, expressing certainty and emphasis: ''I will certainly bless you''). ''Multiplying I will multiply thee'' (plēthynōn plēthynō se — I will surely multiply you). The double construction in Hebrew (and preserved in the Greek) indicates God''s emphatic, irrevocable commitment. This was the covenant promise after Abraham''s supreme test of faith — the offering of Isaac.',
   NULL),
  (15, 'And so, after he had patiently endured, he obtained the promise.',
   'καὶ οὕτως μακροθυμήσας ἐπέτυχεν τῆς ἐπαγγελίας',
   'kai houtōs makrothymēsas epetychcn tēs epangelias',
   '''Patiently endured'' (makrothymēsas — having been long-tempered, having endured with patience; the same virtue commended in v.12). ''Obtained the promise'' (epetychcn tēs epangelias — he reached, attained, obtained the promise). Abraham waited 25 years for Isaac, endured the command to sacrifice him, and saw God''s faithfulness through it all. He is the model of faith-and-patience (v.12) — the exemplar for the readers who are tempted to give up.',
   NULL),
  (16, 'For men verily swear by the greater: and an oath for confirmation is to them an end of all strife.',
   'ἄνθρωποι μὲν γὰρ κατὰ τοῦ μείζονος ὀμνύουσιν καὶ πάσης αὐτοῖς ἀντιλογίας πέρας εἰς βεβαίωσιν ὁ ὅρκος',
   'anthrōpoi men gar kata tou meizonos omnyousin kai pasēs autois antilogias peras eis bebaiōsin ho horkos',
   '''Swear by the greater'' — human oaths invoke a higher authority as guarantor. ''An end of all strife'' (pasēs antilogias peras — the finish of every dispute; peras means boundary, limit, termination). ''For confirmation'' (eis bebaiōsin — for making firm, for establishing; bebaios means reliable, guaranteed). An oath settles disputes because it invokes a higher authority. God''s oath is the ultimate settlement — there is no appeal beyond God swearing by Himself.',
   NULL),
  (17, 'Wherein God, willing more abundantly to shew unto the heirs of promise the immutability of his counsel, confirmed it by an oath:',
   'ἐν ᾧ περισσότερον βουλόμενος ὁ θεὸς ἐπιδεῖξαι τοῖς κληρονόμοις τῆς ἐπαγγελίας τὸ ἀμετάθετον τῆς βουλῆς αὐτοῦ ἐμεσίτευσεν ὅρκῳ',
   'en hō perissoteron boulomenos ho theos epideixai tois klēronomois tēs epangelias to ametatheton tēs boulēs autou emesiteusen horkō',
   '''Willing more abundantly'' (perissoteron boulomenos — desiring even more, wishing to go beyond what was necessary). God did not need to swear an oath — His bare word is sufficient. But He condescended to human weakness by adding an oath on top of His promise. ''Immutability of his counsel'' (to ametatheton tēs boulēs autou — the unchangeableness of His deliberate purpose; ametathetos means not to be moved, unalterable). ''Confirmed it by an oath'' (emesiteusen horkō — He mediated with an oath; mesiteuō means to interpose as mediator — God interposed Himself as the guarantor of His own promise).',
   NULL),
  (18, 'That by two immutable things, in which it was impossible for God to lie, we might have a strong consolation, who have fled for refuge to lay hold upon the hope set before us:',
   'ἵνα διὰ δύο πραγμάτων ἀμεταθέτων ἐν οἷς ἀδύνατον ψεύσασθαι θεόν ἰσχυρὰν παράκλησιν ἔχωμεν οἱ καταφυγόντες κρατῆσαι τῆς προκειμένης ἐλπίδος',
   'hina dia dyo pragmatōn ametathetōn en hois adynaton pseusasthai theon ischyran paraklēsin echōmen hoi kataphygontes kratēsai tēs prokeimenēs elpidos',
   '''Two immutable things'' (dyo pragmatōn ametathetōn — two unchangeable realities): God''s promise and God''s oath. Both are irrevocable; neither can be altered. ''Impossible for God to lie'' (adynaton pseusasthai theon — it is without power for God to lie; the same adynaton from v.4, but here applied positively: just as it is impossible to renew apostates, it is impossible for God to deceive). ''Strong consolation'' (ischyran paraklēsin — mighty encouragement, powerful comfort). ''Who have fled for refuge'' (hoi kataphygontes — those who have fled for safety; the imagery of OT cities of refuge where the fugitive found safety). ''To lay hold upon the hope'' (kratēsai tēs prokeimenēs elpidos — to seize firmly the hope placed before us).',
   'The security of the believer rests on two immutable divine realities: God''s promise and God''s oath. Since God cannot lie, and He has staked both His word and His sworn oath on the salvation of His people, their hope is as certain as God''s character. This is the strongest possible ground for assurance — not human effort but divine fidelity.'),
  (19, 'Which hope we have as an anchor of the soul, both sure and stedfast, and which entereth into that within the veil;',
   'ἣν ὡς ἄγκυραν ἔχομεν τῆς ψυχῆς ἀσφαλῆ τε καὶ βεβαίαν καὶ εἰσερχομένην εἰς τὸ ἐσώτερον τοῦ καταπετάσματος',
   'hēn hōs ankyran echomen tēs psychēs asphalē te kai bebaian kai eiserchomenēn eis to esōteron tou katapetasmatos',
   '''Anchor of the soul'' (ankyran tēs psychēs) — one of the most beautiful metaphors in the NT. Unlike a ship''s anchor that is cast down into the sea, this anchor is cast upward — into the heavenly Holy of Holies behind the veil. ''Sure'' (asphalē — secure, safe, unfailing; from a- + sphallō, ''not to be tripped''). ''Stedfast'' (bebaian — firm, reliable, guaranteed). ''That within the veil'' (to esōteron tou katapetasmatos — the inner place of the curtain; the Holy of Holies in the tabernacle, separated from the Holy Place by the great veil). Our hope penetrates heaven itself — it is anchored in the very presence of God, in the heavenly sanctuary where Christ ministers.',
   'The ''anchor of the soul'' image beautifully combines the nautical (anchor) with the sacerdotal (the veil of the temple). The believer''s hope is anchored not in earthly circumstances but in the heavenly Holy of Holies — the very throne room of God. Because the anchor-point is in heaven, no earthly storm can dislodge it.'),
  (20, 'Whither the forerunner is for us entered, even Jesus, made an high priest for ever after the order of Melchisedec.',
   'ὅπου πρόδρομος ὑπὲρ ἡμῶν εἰσῆλθεν Ἰησοῦς κατὰ τὴν τάξιν Μελχισεδὲκ ἀρχιερεὺς γενόμενος εἰς τὸν αἰῶνα',
   'hopou prodromos hyper hēmōn eisēlthen Iēsous kata tēn taxin Melchisedek archiereus genomenos eis ton aiōna',
   '''Forerunner'' (prodromos — one who runs ahead, a scout, a pathfinder, an advance party; a NT hapax). In the OT system, the high priest entered the Holy of Holies alone — no one followed him. But Christ entered as a prodromos — a forerunner, implying that others will follow. He went ahead ''for us'' (hyper hēmōn — on our behalf) to prepare the way. ''Made an high priest for ever after the order of Melchisedec'' — this phrase creates the perfect transition to chapter 7''s full exposition of the Melchizedek priesthood. The chapter ends as it will begin in ch.7: with Melchizedek. Christ is both the anchor that holds us and the forerunner who has gone ahead of us into God''s presence.',
   'The concept of Christ as ''forerunner'' (prodromos) transforms the entire OT priestly system. The Levitical high priest entered the Holy of Holies as a solitary representative — the people waited outside. Christ entered as a forerunner — the first of many who will follow. Where He has gone, we will go. His entrance guarantees ours.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 6;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀδύνατον', 'adynaton', 'G102', 'Impossible, without power, unable — from a (not) + dynatos (powerful). Used twice in this chapter with devastating force: in v.4 it is impossible to renew apostates; in v.18 it is impossible for God to lie. The same word frames both the most terrifying warning and the most comforting assurance. The impossibility of renewal is as absolute as the impossibility of God lying — both are grounded in the immutable nature of spiritual and divine reality.', 1),
  ('παραπίπτω', 'parapiptō', 'G3895', 'To fall away, to fall beside, to commit apostasy — from para (beside) + piptō (to fall). A NT hapax (only in v.6). This is not stumbling or backsliding but a decisive, irreversible departure from the faith — falling away from the position one once held. The prefix para- (beside/aside) suggests moving away from the right path and landing in a position from which return is impossible. In context, it describes a deliberate, public repudiation of Christ.', 2),
  ('ἀνασταυρόω', 'anastauroō', 'G388', 'To crucify again, to re-crucify — from ana (again) + stauroō (to crucify). A NT hapax (only in v.6). The apostate, by rejecting Christ''s sacrifice, effectively participates in crucifying Him again. They treat His death as worthless — as though it needs to be repeated or was insufficient. This is the ultimate insult to the cross: not mere indifference but active repudiation of the sacrifice that was meant to save them.', 3),
  ('ἀμετάθετος', 'ametathetos', 'G276', 'Immutable, unchangeable, irrevocable — from a (not) + metatithēmi (to change, to transfer). Used twice in the chapter (vv.17-18) to describe God''s counsel (v.17) and the ''two things'' — His promise and His oath (v.18). That which is ametathetos cannot be moved, altered, or revoked. Applied to God''s saving purpose, it means His intention to save His people is as unchangeable as His own nature.', 4),
  ('ἄγκυρα', 'ankyra', 'G45', 'Anchor — the device that secures a ship against drift. In v.19 hope is the anchor of the soul — but unlike a maritime anchor that holds a ship to the sea floor, this anchor reaches upward into the heavenly Holy of Holies. The believer is anchored to heaven itself, to the very presence of God. The anchor is ''sure'' (asphalē — secure) and ''stedfast'' (bebaian — firm), and it penetrates behind the veil where Christ has entered as forerunner.', 5),
  ('πρόδρομος', 'prodromos', 'G4274', 'Forerunner, one who goes ahead, advance scout — from pro (before) + dromos (a running, a course). A NT hapax (only in v.20). In military usage, the prodromoi were the advance troops sent ahead of the main army. Christ is the prodromos who entered the heavenly sanctuary ahead of His people, guaranteeing that they will follow. The Levitical high priest entered alone as a representative; Christ entered as a pioneer, opening the way for all believers to follow.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 6
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4
    WHEN 2 THEN 6
    WHEN 3 THEN 6
    WHEN 4 THEN 17
    WHEN 5 THEN 19
    WHEN 6 THEN 20
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Hebrews 5:12-14', 1),
  (1, 'Philippians 3:13-14', 2),
  (4, 'Hebrews 10:26-29', 3),
  (4, '2 Peter 2:20-22', 4),
  (4, 'Hebrews 10:32', 5),
  (6, 'Hebrews 10:29', 6),
  (6, 'Matthew 12:31-32', 7),
  (7, 'Genesis 1:11-12', 8),
  (7, 'Isaiah 5:1-7', 9),
  (8, 'Genesis 3:17-18', 10),
  (8, 'John 15:6', 11),
  (9, '2 Thessalonians 1:3-4', 12),
  (10, 'Hebrews 10:32-34', 13),
  (10, '1 Thessalonians 1:3', 14),
  (11, 'Hebrews 3:14', 15),
  (11, 'Colossians 2:2', 16),
  (12, 'Hebrews 5:11', 17),
  (12, 'Hebrews 11:1-40', 18),
  (13, 'Genesis 22:16-17', 19),
  (14, 'Genesis 22:17', 20),
  (15, 'Romans 4:18-21', 21),
  (16, 'Exodus 22:11', 22),
  (17, 'Numbers 23:19', 23),
  (17, 'Titus 1:2', 24),
  (18, 'Numbers 35:6-15', 25),
  (18, 'Joshua 20:1-6', 26),
  (19, 'Leviticus 16:2', 27),
  (19, 'Hebrews 10:19-20', 28),
  (20, 'Hebrews 5:6', 29),
  (20, 'Hebrews 7:1-3', 30),
  (20, 'Psalm 110:4', 31)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 6
  AND v.verse_number = cr.verse_number;
