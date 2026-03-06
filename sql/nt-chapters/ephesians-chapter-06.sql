-- ═══════════════════════════════════════════════════
-- EPHESIANS CHAPTER 6 — Household Duties and the Whole Armour of God
-- 24 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  'Ephesians 6 completes the household code begun in 5:22 and then presents the famous passage on spiritual warfare. Children are told: ''obey your parents in the Lord: for this is right'' (v.1) and ''honour thy father and mother; which is the first commandment with promise'' (v.2). Fathers: ''provoke not your children to wrath: but bring them up in the nurture and admonition of the Lord'' (v.4). Servants are to obey ''as unto Christ'' (v.5), ''not with eyeservice, as menpleasers; but as the servants of Christ, doing the will of God from the heart'' (v.6). Masters must do the same, ''knowing that your Master also is in heaven; neither is there respect of persons with him'' (v.9). The final section is the climax of the entire epistle: ''Put on the whole armour of God, that ye may be able to stand against the wiles of the devil'' (v.11). The warfare is ''not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places'' (v.12). Six pieces of armour are detailed: the girdle of truth, breastplate of righteousness, shoes of the gospel of peace, shield of faith, helmet of salvation, and sword of the Spirit (vv.14-17). Paul closes requesting prayer ''that I may open my mouth boldly, to make known the mystery of the gospel'' (v.19) and commending Tychicus as his messenger (vv.21-22). The benediction: ''Grace be with all them that love our Lord Jesus Christ in sincerity. Amen'' (v.24).',
  'Stand Firm — The Whole Armour of God',
  'πανοπλία (panoplia)',
  'Whole armour, full armour — from pan (all) + hoplon (weapon/armour). The complete set of equipment a Roman soldier wore for battle. The spiritual parallel: believers need every piece of God''s armour to stand against the devil''s stratagems. No piece can be omitted; the armour is a complete set.',
  '["Children and Parents (vv.1-4): Children obey your parents in the Lord for this is right; honour thy father and mother which is the first commandment with promise that it may be well with thee and thou mayest live long on the earth; and ye fathers provoke not your children to wrath but bring them up in the nurture and admonition of the Lord","Servants and Masters (vv.5-9): Servants be obedient to them that are your masters according to the flesh with fear and trembling in singleness of your heart as unto Christ; not with eyeservice as menpleasers but as the servants of Christ doing the will of God from the heart; with good will doing service as to the Lord and not to men; and ye masters do the same things unto them forbearing threatening knowing that your Master also is in heaven","The Whole Armour of God (vv.10-17): Finally my brethren be strong in the Lord and in the power of his might; put on the whole armour of God that ye may be able to stand against the wiles of the devil; for we wrestle not against flesh and blood but against principalities against powers against the rulers of the darkness of this world against spiritual wickedness in high places; wherefore take unto you the whole armour of God; stand therefore having your loins girt about with truth and having on the breastplate of righteousness; and your feet shod with the preparation of the gospel of peace; above all taking the shield of faith; and take the helmet of salvation and the sword of the Spirit which is the word of God","Prayer and Final Greetings (vv.18-24): Praying always with all prayer and supplication in the Spirit and watching thereunto with all perseverance and supplication for all saints; and for me that utterance may be given unto me that I may open my mouth boldly to make known the mystery of the gospel; peace be to the brethren and love with faith from God the Father and the Lord Jesus Christ; grace be with all them that love our Lord Jesus Christ in sincerity amen"]'
FROM books b WHERE b.name = 'Ephesians';

-- Step 2: Insert all 24 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Children, obey your parents in the Lord: for this is right.',
   'Τὰ τέκνα ὑπακούετε τοῖς γονεῦσιν ὑμῶν ἐν κυρίῳ τοῦτο γάρ ἐστιν δίκαιον',
   'Ta tekna hypakouete tois goneusin hymōn en kyriō touto gar estin dikaion',
   '''Obey'' (hypakouete — listen under, heed, comply with; stronger than ''submit'' in 5:22; children are to actively obey). ''In the Lord'' (en kyriō — within the sphere of the Lord''s authority; obedience is Christian obedience, not blind compliance with what contradicts God). ''This is right'' (touto estin dikaion — this is just, fitting, proper). Obedience to parents is a universal moral principle, not merely a cultural convention.',
   NULL),
  (2, 'Honour thy father and mother; (which is the first commandment with promise;)',
   'τίμα τὸν πατέρα σου καὶ τὴν μητέρα ἥτις ἐστὶν ἐντολὴ πρώτη ἐν ἐπαγγελίᾳ',
   'tima ton patera sou kai tēn mētera hētis estin entolē prōtē en epangelia',
   '''Honour'' (tima — value, esteem, treat as precious; broader than obedience: honour continues even after childhood when obedience may no longer be required). Quoting the fifth commandment (Exod 20:12). ''First commandment with promise'' — the first of the Ten Commandments that carries a specific blessing. Paul appeals to the moral weight of the Decalogue while teaching under grace.',
   NULL),
  (3, 'That it may be well with thee, and thou mayest live long on the earth.',
   'ἵνα εὖ σοι γένηται καὶ ἔσῃ μακροχρόνιος ἐπὶ τῆς γῆς',
   'hina eu soi genētai kai esē makrochronios epi tēs gēs',
   '''Well with thee'' (eu soi genētai — it may go well for you). ''Live long on the earth'' (esē makrochronios epi tēs gēs — you may be long-lived on the earth). The original promise referred to the land of Israel; Paul universalises it to ''the earth.'' The principle: honouring parents generally leads to a stable, well-ordered life. This is a general principle of blessing, not an unconditional guarantee.',
   NULL),
  (4, 'And, ye fathers, provoke not your children to wrath: but bring them up in the nurture and admonition of the Lord.',
   'καὶ οἱ πατέρες μὴ παροργίζετε τὰ τέκνα ὑμῶν ἀλλ᾽ ἐκτρέφετε αὐτὰ ἐν παιδείᾳ καὶ νουθεσίᾳ κυρίου',
   'kai hoi pateres mē parorgizete ta tekna hymōn all'' ektrephete auta en paideia kai nouthesia kyriou',
   '''Provoke not'' (mē parorgizete — do not exasperate, do not stir up to anger; present imperative: stop provoking). ''Bring them up'' (ektrephete — nourish, rear, raise; the same word used of Christ nourishing the church in 5:29). ''Nurture'' (paideia — training, discipline, instruction; the whole process of education and correction). ''Admonition'' (nouthesia — verbal instruction, warning, counsel; from nous, mind + tithēmi, to place; putting sense into the mind). Parenting is positive (nurture and admonition) not merely negative (don''t provoke).',
   NULL),
  (5, 'Servants, be obedient to them that are your masters according to the flesh, with fear and trembling, in singleness of your heart, as unto Christ;',
   'Οἱ δοῦλοι ὑπακούετε τοῖς κυρίοις κατὰ σάρκα μετὰ φόβου καὶ τρόμου ἐν ἁπλότητι τῆς καρδίας ὑμῶν ὡς τῷ Χριστῷ',
   'Hoi douloi hypakouete tois kyriois kata sarka meta phobou kai tromou en haplotēti tēs kardias hymōn hōs tō Christō',
   '''Servants'' (douloi — slaves, bondservants). ''Masters according to the flesh'' (kyriois kata sarka — earthly masters; kata sarka limits their authority to the physical realm). ''Fear and trembling'' (meta phobou kai tromou — earnest seriousness, not cringing terror; the same phrase Paul uses of his own ministry, 1 Cor 2:3). ''Singleness of heart'' (haplotēti tēs kardias — sincerity, undivided loyalty, without hidden agendas). ''As unto Christ'' — the revolutionary principle: human work is transformed into divine service by doing it ''as unto Christ.''',
   NULL),
  (6, 'Not with eyeservice, as menpleasers; but as the servants of Christ, doing the will of God from the heart;',
   'μὴ κατ᾽ ὀφθαλμοδουλείαν ὡς ἀνθρωπάρεσκοι ἀλλ᾽ ὡς δοῦλοι τοῦ Χριστοῦ ποιοῦντες τὸ θέλημα τοῦ θεοῦ ἐκ ψυχῆς',
   'mē kat'' ophthalmodouleian hōs anthrōpareskoi all'' hōs douloi tou Christou poiountes to thelēma tou theou ek psychēs',
   '''Eyeservice'' (ophthalmodouleian — slave-service performed only when the master is watching; a word Paul likely coined, used only here and Col 3:22). ''Menpleasers'' (anthrōpareskoi — those who serve merely to please people; another rare compound). ''From the heart'' (ek psychēs — from the soul, wholeheartedly). The Christian worker''s motivation is not the employer''s eye but God''s eye — doing the will of God from the soul, regardless of human oversight.',
   NULL),
  (7, 'With good will doing service, as to the Lord, and not to men:',
   'μετ᾽ εὐνοίας δουλεύοντες τῷ κυρίῳ καὶ οὐκ ἀνθρώποις',
   'met'' eunoias douleuontes tō kyriō kai ouk anthrōpois',
   '''Good will'' (eunoias — benevolence, eagerness, goodwill). ''As to the Lord, and not to men'' — the ultimate reorientation of work: every task, however menial, is service to Christ. This dignifies all honest labour and transforms the workplace into a place of worship.',
   NULL),
  (8, 'Knowing that whatsoever good thing any man doeth, the same shall he receive of the Lord, whether he be bond or free.',
   'εἰδότες ὅτι ὃ ἐάν τι ἕκαστος ποιήσῃ ἀγαθόν τοῦτο κομιεῖται παρὰ τοῦ κυρίου εἴτε δοῦλος εἴτε ἐλεύθερος',
   'eidotes hoti ho ean ti hekastos poiēsē agathon touto komietai para tou kyriou eite doulos eite eleutheros',
   '''Receive of the Lord'' (komietai para tou kyriou — will be repaid by the Lord). ''Whether he be bond or free'' (eite doulos eite eleutheros — social status is irrelevant at the judgment seat of Christ). Every good deed will be rewarded by the Lord, regardless of the doer''s social position. This was revolutionary in a slave society: before God, the slave''s faithful work carries the same value as the free person''s.',
   NULL),
  (9, 'And, ye masters, do the same things unto them, forbearing threatening: knowing that your Master also is in heaven; neither is there respect of persons with him.',
   'καὶ οἱ κύριοι τὰ αὐτὰ ποιεῖτε πρὸς αὐτούς ἀνιέντες τὴν ἀπειλήν εἰδότες ὅτι καὶ ὑμῶν αὐτῶν ὁ κύριός ἐστιν ἐν οὐρανοῖς καὶ προσωποληψία οὐκ ἔστιν παρ᾽ αὐτῷ',
   'kai hoi kyrioi ta auta poieite pros autous anientes tēn apeilēn eidotes hoti kai hymōn autōn ho kyrios estin en ouranois kai prosōpolēpsia ouk estin par'' autō',
   '''Do the same things'' (ta auta poieite — treat them with the same spirit of goodwill, sincerity, and wholeheartedness). ''Forbearing threatening'' (anientes tēn apeilēn — relaxing the threat, laying aside intimidation). ''Your Master also is in heaven'' — the master has a Master; authority is accountable to higher authority. ''Respect of persons'' (prosōpolēpsia — partiality, favouritism based on face/status). God shows no favouritism between master and slave — both stand on level ground before him.',
   NULL),
  (10, 'Finally, my brethren, be strong in the Lord, and in the power of his might.',
   'Τὸ λοιπόν ἀδελφοί μου ἐνδυναμοῦσθε ἐν κυρίῳ καὶ ἐν τῷ κράτει τῆς ἰσχύος αὐτοῦ',
   'To loipon adelphoi mou endynamousthe en kyriō kai en tō kratei tēs ischyos autou',
   '''Be strong'' (endynamousthe — be empowered, be strengthened; present passive imperative: keep on being strengthened by God''s power). ''In the Lord'' (en kyriō — in union with the Lord; the source of strength). ''Power of his might'' (kratei tēs ischyos — the dominion of his strength; the same power vocabulary as 1:19). The armour passage begins not with activity but with dependence: our strength comes from the Lord, not from ourselves.',
   NULL),
  (11, 'Put on the whole armour of God, that ye may be able to stand against the wiles of the devil.',
   'ἐνδύσασθε τὴν πανοπλίαν τοῦ θεοῦ πρὸς τὸ δύνασθαι ὑμᾶς στῆναι πρὸς τὰς μεθοδείας τοῦ διαβόλου',
   'endysasthe tēn panoplian tou theou pros to dynasthai hymas stēnai pros tas methodeias tou diabolou',
   '''Put on'' (endysasthe — clothe yourselves with; aorist imperative: do it decisively). ''Whole armour'' (panoplian — the full equipment of a heavily armed soldier; every piece is needed). ''Of God'' (tou theou — God''s armour, not human-made; divine equipment for divine warfare). ''Wiles'' (methodeias — stratagems, schemes, cunning methods; the source of ''methods''; the devil is a strategist, not merely a brute force attacker). ''Stand'' (stēnai — hold your ground; the key verb of the passage, repeated in vv.11, 13, 14).',
   'The whole armour of God: The armour is God''s own — it belongs to him and he supplies it. It is ''whole'' (panoplia) — every piece is essential; no single piece provides complete protection. The goal is not to attack or advance but to ''stand'' (stēnai) — to hold the ground Christ has already won. The warfare is defensive: maintaining the victory Christ has already achieved, not winning a battle he has not yet fought.'),
  (12, 'For we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places.',
   'ὅτι οὐκ ἔστιν ἡμῖν ἡ πάλη πρὸς αἷμα καὶ σάρκα ἀλλὰ πρὸς τὰς ἀρχάς πρὸς τὰς ἐξουσίας πρὸς τοὺς κοσμοκράτορας τοῦ σκότους τοῦ αἰῶνος τούτου πρὸς τὰ πνευματικὰ τῆς πονηρίας ἐν τοῖς ἐπουρανίοις',
   'hoti ouk estin hēmin hē palē pros haima kai sarka alla pros tas archas pros tas exousias pros tous kosmokratoras tou skotous tou aiōnos toutou pros ta pneumatika tēs ponērias en tois epouraniois',
   '''Wrestle'' (palē — wrestling, hand-to-hand combat; the closest, most personal form of ancient warfare). ''Not against flesh and blood'' — our true enemies are not human. Four categories of spiritual opposition: (1) ''principalities'' (archas — ruling authorities); (2) ''powers'' (exousias — delegated authorities); (3) ''rulers of the darkness'' (kosmokratoras tou skotous — world-rulers of this darkness; used only here in the NT); (4) ''spiritual wickedness in high places'' (pneumatika tēs ponērias en tois epouraniois — spiritual forces of evil in the heavenly realms). The ''heavenly places'' where believers are seated (2:6) are also the arena of spiritual conflict.',
   'The nature of spiritual warfare: The Christian''s battle is not against human opponents but against organised, hierarchical spiritual powers. These are not metaphors for internal psychological struggles but real, personal spiritual beings. They operate in ''the heavenly places'' — the same realm where Christ is enthroned (1:20) and where believers are seated (2:6). Spiritual warfare is fought from a position of victory (seated with Christ) against enemies whose defeat is already accomplished.'),
  (13, 'Wherefore take unto you the whole armour of God, that ye may be able to withstand in the evil day, and having done all, to stand.',
   'διὰ τοῦτο ἀναλάβετε τὴν πανοπλίαν τοῦ θεοῦ ἵνα δυνηθῆτε ἀντιστῆναι ἐν τῇ ἡμέρᾳ τῇ πονηρᾷ καὶ ἅπαντα κατεργασάμενοι στῆναι',
   'dia touto analabete tēn panoplian tou theou hina dynēthēte antistēnai en tē hēmera tē ponēra kai hapanta katergasamenoi stēnai',
   '''Take unto you'' (analabete — take up, pick up; aorist imperative: act now). ''Withstand'' (antistēnai — resist, stand against, hold firm). ''The evil day'' (tē hēmera tē ponēra — the day of intense spiritual attack; each believer faces such days). ''Having done all'' (hapanta katergasamenoi — having accomplished everything, having fully prepared). ''To stand'' (stēnai — the same word as v.11). After all preparation, the goal is simple: remain standing. Not retreat, not advance, but hold the position.',
   NULL),
  (14, 'Stand therefore, having your loins girt about with truth, and having on the breastplate of righteousness;',
   'στῆτε οὖν περιζωσάμενοι τὴν ὀσφὺν ὑμῶν ἐν ἀληθείᾳ καὶ ἐνδυσάμενοι τὸν θώρακα τῆς δικαιοσύνης',
   'stēte oun perizōsamenoi tēn osphyn hymōn en alētheia kai endysamenoi ton thōraka tēs dikaiosynēs',
   '''Stand'' (stēte — stand firm; the fourth occurrence of this word). ''Loins girt about with truth'' (perizōsamenoi tēn osphyn en alētheia — the belt that holds everything together; truth is the foundation that keeps all other armour in place; alētheia may mean integrity/sincerity or gospel truth). ''Breastplate of righteousness'' (thōraka tēs dikaiosynēs — the breastplate that protects the heart and vital organs; dikaiosynē may be imputed righteousness, Christ''s righteousness credited to us, or practical righteous living — likely both).',
   NULL),
  (15, 'And your feet shod with the preparation of the gospel of peace;',
   'καὶ ὑποδησάμενοι τοὺς πόδας ἐν ἑτοιμασίᾳ τοῦ εὐαγγελίου τῆς εἰρήνης',
   'kai hypodēsamenoi tous podas en hetoimasia tou euangeliou tēs eirēnēs',
   '''Shod'' (hypodēsamenoi — having bound shoes under, having laced on footwear). ''Preparation'' (hetoimasia — readiness, preparedness, firm footing). ''Gospel of peace'' (euangeliou tēs eirēnēs — the good news that brings peace; cf. Isa 52:7). Roman soldiers wore caligae — hobnailed sandals that provided firm footing on any terrain. The gospel gives the believer stable footing for standing firm and readiness to advance with the message of peace.',
   NULL),
  (16, 'Above all, taking the shield of faith, wherewith ye shall be able to quench all the fiery darts of the wicked.',
   'ἐπὶ πᾶσιν ἀναλαβόντες τὸν θυρεὸν τῆς πίστεως ἐν ᾧ δυνήσεσθε πάντα τὰ βέλη τοῦ πονηροῦ τὰ πεπυρωμένα σβέσαι',
   'epi pasin analabontes ton thyreon tēs pisteōs en hō dynēsesthe panta ta belē tou ponērou ta pepyrōmena sbesai',
   '''Above all'' (epi pasin — in addition to all, over all). ''Shield'' (thyreon — the large, door-shaped Roman scutum that protected the entire body; distinguished from the small, round aspis). ''Faith'' (pisteōs — trust in God, reliance on his promises). ''Fiery darts'' (belē pepyrōmena — arrows tipped with burning pitch, designed to ignite and destroy). ''The wicked'' (tou ponērou — the evil one, Satan). Faith extinguishes every flaming missile — doubts, temptations, accusations, fears — that the devil launches. Faith does not merely deflect; it quenches, puts out the fire.',
   NULL),
  (17, 'And take the helmet of salvation, and the sword of the Spirit, which is the word of God:',
   'καὶ τὴν περικεφαλαίαν τοῦ σωτηρίου δέξασθε καὶ τὴν μάχαιραν τοῦ πνεύματος ὅ ἐστιν ῥῆμα θεοῦ',
   'kai tēn perikephalaian tou sōtēriou dexasthe kai tēn machairan tou pneumatos ho estin rhēma theou',
   '''Helmet'' (perikephalaian — that which goes around the head, protecting the mind). ''Of salvation'' (tou sōtēriou — the assurance of salvation protects the mind from despair, doubt, and hopelessness; cf. 1 Thess 5:8, ''the hope of salvation''). ''Sword of the Spirit'' (machairan tou pneumatos — the short sword, the gladius; the only offensive weapon in the list). ''Which is the word of God'' (ho estin rhēma theou — rhēma, the spoken word, the specific utterance of God applied to specific situations; not logos, the general word, but rhēma, the word in action). Jesus used the sword of the Spirit against Satan in the wilderness: ''It is written'' (Matt 4:4, 7, 10).',
   'The sword of the Spirit: This is the only offensive weapon in the armour. The sword (machaira) is the short Roman gladius — a weapon for close combat, not a javelin thrown from a distance. The word of God (rhēma theou) is the specific application of Scripture to specific situations. The Spirit wields the word; the believer who knows and speaks Scripture gives the Spirit his weapon. Jesus'' wilderness temptation (Matt 4) is the supreme demonstration of this weapon in action.'),
  (18, 'Praying always with all prayer and supplication in the Spirit, and watching thereunto with all perseverance and supplication for all saints;',
   'διὰ πάσης προσευχῆς καὶ δεήσεως προσευχόμενοι ἐν παντὶ καιρῷ ἐν πνεύματι καὶ εἰς αὐτὸ τοῦτο ἀγρυπνοῦντες ἐν πάσῃ προσκαρτερήσει καὶ δεήσει περὶ πάντων τῶν ἁγίων',
   'dia pasēs proseuchēs kai deēseōs proseuchomenoi en panti kairō en pneumati kai eis auto touto agrypnountes en pasē proskarterēsei kai deēsei peri pantōn tōn hagiōn',
   'Four ''alls'' saturate this verse: ''all prayer'' (pasēs proseuchēs), ''all times'' (panti kairō), ''all perseverance'' (pasē proskarterēsei), ''all saints'' (pantōn tōn hagiōn). ''In the Spirit'' (en pneumati — Spirit-directed, Spirit-empowered prayer). ''Watching'' (agrypnountes — staying awake, being alert, maintaining vigilance). Prayer is not the seventh piece of armour but the atmosphere in which the armour is worn — the battle environment of constant communion with God.',
   NULL),
  (19, 'And for me, that utterance may be given unto me, that I may open my mouth boldly, to make known the mystery of the gospel,',
   'καὶ ὑπὲρ ἐμοῦ ἵνα μοι δοθείη λόγος ἐν ἀνοίξει τοῦ στόματός μου ἐν παρρησίᾳ γνωρίσαι τὸ μυστήριον τοῦ εὐαγγελίου',
   'kai hyper emou hina moi dotheië logos en anoixei tou stomatos mou en parrēsia gnōrisai to mystērion tou euangeliou',
   '''Utterance'' (logos — the right words, the appropriate message). ''Boldly'' (en parrēsia — with bold confidence, with freedom of speech). ''The mystery of the gospel'' (to mystērion tou euangeliou — the same mystery of chapters 1 and 3: God''s plan to unite all things in Christ, including Gentiles as full members). Even the great apostle needs prayer for boldness. Paul does not ask for release from prison but for courage to proclaim the gospel while in chains.',
   NULL),
  (20, 'For which I am an ambassador in bonds: that therein I may speak boldly, as I ought to speak.',
   'ὑπὲρ οὗ πρεσβεύω ἐν ἁλύσει ἵνα ἐν αὐτῷ παρρησιάσωμαι ὡς δεῖ με λαλῆσαι',
   'hyper hou presbeuō en halysei hina en autō parrēsiasōmai hōs dei me lalēsai',
   '''Ambassador'' (presbeuō — to serve as an envoy, to represent a sovereign). ''In bonds'' (en halysei — in chains; a ''chained ambassador'' is a striking paradox: an envoy of the highest King, yet in chains). ''As I ought to speak'' (hōs dei me lalēsai — as it is necessary for me to speak). Paul sees his imprisonment not as defeat but as a diplomatic posting — he is Christ''s ambassador, even in chains.',
   NULL),
  (21, 'But that ye also may know my affairs, and how I do, Tychicus, a beloved brother and faithful minister in the Lord, shall make known to you all things:',
   'Ἵνα δὲ εἰδῆτε καὶ ὑμεῖς τὰ κατ᾽ ἐμέ τί πράσσω πάντα ὑμῖν γνωρίσει Τυχικὸς ὁ ἀγαπητὸς ἀδελφὸς καὶ πιστὸς διάκονος ἐν κυρίῳ',
   'Hina de eidēte kai hymeis ta kat'' eme ti prassō panta hymin gnōrisei Tychikos ho agapētos adelphos kai pistos diakonos en kyriō',
   '''Tychicus'' — Paul''s trusted messenger who carried this letter (and likely Colossians as well; cf. Col 4:7-8). ''Beloved brother and faithful minister'' (agapētos adelphos kai pistos diakonos) — two qualities: loved and trustworthy. Paul entrusted the delivery and explanation of this magnificent epistle to a faithful companion.',
   NULL),
  (22, 'Whom I have sent unto you for the same purpose, that ye might know our affairs, and that he might comfort your hearts.',
   'ὃν ἔπεμψα πρὸς ὑμᾶς εἰς αὐτὸ τοῦτο ἵνα γνῶτε τὰ περὶ ἡμῶν καὶ παρακαλέσῃ τὰς καρδίας ὑμῶν',
   'hon epempsa pros hymas eis auto touto hina gnōte ta peri hēmōn kai parakalesē tas kardias hymōn',
   '''Sent'' (epempsa — I have sent; epistolary aorist). ''Comfort'' (parakalesē — encourage, exhort, console). Two purposes: (1) to inform them of Paul''s situation, and (2) to encourage their hearts. Personal connection and pastoral care characterise Paul''s ministry even from prison.',
   NULL),
  (23, 'Peace be to the brethren, and love with faith, from God the Father and the Lord Jesus Christ.',
   'εἰρήνη τοῖς ἀδελφοῖς καὶ ἀγάπη μετὰ πίστεως ἀπὸ θεοῦ πατρὸς καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'eirēnē tois adelphois kai agapē meta pisteōs apo theou patros kai kyriou Iēsou Christou',
   '''Peace'' (eirēnē — the great theme of Ephesians: peace between Jew and Gentile, peace with God, the gospel of peace). ''Love with faith'' (agapē meta pisteōs — love accompanied by faith; the two are inseparable). ''From God the Father and the Lord Jesus Christ'' — the same dual source as 1:2. The benediction echoes the greeting, framing the entire epistle in grace and peace.',
   NULL),
  (24, 'Grace be with all them that love our Lord Jesus Christ in sincerity. Amen.',
   'ἡ χάρις μετὰ πάντων τῶν ἀγαπώντων τὸν κύριον ἡμῶν Ἰησοῦν Χριστὸν ἐν ἀφθαρσίᾳ ἀμήν',
   'hē charis meta pantōn tōn agapōntōn ton kyrion hēmōn Iēsoun Christon en aphtharsia amēn',
   '''Grace'' (charis — the first word and the last word of the epistle; cf. 1:2). ''In sincerity'' (en aphtharsia — in incorruptibility, in immortality, in unfading love; their love for Christ is genuine and imperishable). ''Amen'' (amēn — so be it; the seal of certainty). The epistle that began with ''grace'' (1:2) ends with ''grace'' — the eternal, unmerited favour of God in Christ is the first and last word of the Christian life.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Ephesians' AND c.chapter_number = 6;

-- Step 3: Word Studies for key verses

-- Verse 11 (Whole armour of God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πανοπλίαν', 'panoplian', 'G3833', 'Whole armour, full panoply — from pan (all) + hoplon (weapon, armour). The complete equipment of a heavily armed Roman soldier (hoplitēs). Used only here and v.13 in the NT. Every piece is necessary; to omit one is to leave a vulnerable gap. The armour is ''of God'' — it belongs to him and he provides it.', 1),
  ('μεθοδείας', 'methodeias', 'G3180', 'Wiles, stratagems, schemes — from meta (after, with) + hodos (way, path); a cunning method, a crafty following of a path. The devil is a strategist who uses calculated, methodical schemes. The source of the English word ''method.'' His attacks are not random but planned and targeted.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 6 AND v.verse_number = 11;

-- Verse 12 (Wrestling against principalities)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πάλη', 'palē', 'G3823', 'Wrestling — hand-to-hand combat, the closest and most personal form of ancient warfare. Not a battle fought at a distance but an intimate struggle. Used only here in the NT. Spiritual warfare is personal, close-quarters combat with real spiritual enemies.', 1),
  ('κοσμοκράτορας', 'kosmokratoras', 'G2888', 'World-rulers, cosmic powers — from kosmos (world) + krateō (to rule, to hold power). Used only here in the NT. These are spiritual beings that exercise authority over aspects of the fallen world system — the ''rulers of the darkness of this world.''', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 6 AND v.verse_number = 12;

-- Verse 16 (Shield of faith)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θυρεόν', 'thyreon', 'G2375', 'Shield — specifically the large, oblong Roman scutum (about 4 feet tall and 2.5 feet wide), shaped like a door (thyra). It protected the entire body and could be interlocked with other shields to form a wall (testudo). Distinguished from the smaller aspis. Faith provides comprehensive protection.', 1),
  ('πεπυρωμένα', 'pepyrōmena', 'G4448', 'Fiery, set ablaze, burning — perfect passive participle of pyroō (to set on fire). Ancient arrows were wrapped in pitch-soaked cloth and ignited before launching. Roman shields were covered with leather soaked in water to extinguish such missiles. Faith, like the water-soaked shield, quenches the burning attacks of the enemy.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 6 AND v.verse_number = 16;

-- Verse 17 (Sword of the Spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μάχαιραν', 'machairan', 'G3162', 'Sword — specifically the Roman gladius, a short sword (about 2 feet) used for close combat. Distinguished from the rhomphaia (long broadsword). The Spirit''s sword is for close-quarters engagement, not distant volleys. It requires knowledge of Scripture and skill in its application.', 1),
  ('ῥῆμα', 'rhēma', 'G4487', 'Word, spoken utterance — distinguished from logos (the word as a concept or body of truth). Rhēma is the specific utterance, the particular Scripture applied to a particular situation. Not the Bible sitting on the shelf (logos) but the Bible wielded in the moment of conflict (rhēma). Jesus'' ''It is written'' in the wilderness was rhēma — the specific word for the specific temptation.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 6 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Children obey parents
  (1, 'Colossians 3:20', 1), (1, 'Proverbs 1:8', 2),
  -- v2: Honour father and mother
  (2, 'Exodus 20:12', 1), (2, 'Deuteronomy 5:16', 2),
  -- v4: Fathers provoke not
  (4, 'Colossians 3:21', 1), (4, 'Proverbs 22:6', 2), (4, 'Deuteronomy 6:6-7', 3),
  -- v5: Servants obey
  (5, 'Colossians 3:22-23', 1), (5, '1 Peter 2:18', 2),
  -- v9: Masters forbear threatening
  (9, 'Colossians 4:1', 1), (9, 'James 2:1', 2),
  -- v10: Be strong in the Lord
  (10, 'Philippians 4:13', 1), (10, '2 Timothy 2:1', 2),
  -- v11: Whole armour of God
  (11, 'Romans 13:12', 1), (11, '2 Corinthians 10:4', 2), (11, '1 Peter 5:8-9', 3),
  -- v12: Wrestle not against flesh and blood
  (12, 'Daniel 10:12-13', 1), (12, '2 Corinthians 4:4', 2), (12, 'Ephesians 1:21', 3),
  -- v14: Belt of truth / breastplate of righteousness
  (14, 'Isaiah 11:5', 1), (14, 'Isaiah 59:17', 2),
  -- v16: Shield of faith
  (16, '1 John 5:4', 1), (16, '1 Peter 5:9', 2),
  -- v17: Helmet and sword
  (17, 'Isaiah 59:17', 1), (17, 'Hebrews 4:12', 2), (17, '1 Thessalonians 5:8', 3),
  -- v18: Praying always
  (18, 'Colossians 4:2', 1), (18, '1 Thessalonians 5:17', 2), (18, 'Romans 8:26-27', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 6 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Ephesians Chapter 6 Complete
-- 24 verses · 4 key verses with word studies (10 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
