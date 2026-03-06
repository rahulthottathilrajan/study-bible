-- ═══════════════════════════════════════════════════
-- 1 JOHN CHAPTER 4 — Testing the Spirits and God Is Love
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  '1 John 4 opens with the command to ''try the spirits'' (v.1) — not every spiritual claim is from God, for ''many false prophets are gone out into the world.'' The test is Christological: every spirit that confesses Jesus Christ is come in the flesh is of God; every spirit that denies this is the spirit of antichrist (vv.2-3). Believers overcome false teachers because ''greater is he that is in you, than he that is in the world'' (v.4). John then launches into the epistle''s climactic declaration on the nature of God: ''God is love'' (vv.8,16). This is not sentimental — it is defined by the cross: ''Herein is love, not that we loved God, but that he loved us, and sent his Son to be the propitiation for our sins'' (v.10). Because God loved us, ''we ought also to love one another'' (v.11). Though ''no man hath seen God at any time,'' His love is made visible when believers love each other (v.12). The chapter builds to the magnificent declaration: ''There is no fear in love; but perfect love casteth out fear'' (v.18). The closing logic is devastating: ''If a man say, I love God, and hateth his brother, he is a liar'' (v.20).',
  'Testing the Spirits and the God Who Is Love',
  'ἀγάπη (agapē)',
  'Love — selfless, sacrificial, unconditional love. Not emotional affection (philia) or physical desire (erōs) but deliberate, self-giving commitment to the good of another. In this chapter, agapē is revealed as God''s essential nature: He does not merely love — He is love.',
  '["Try the Spirits (vv.1-3): Beloved believe not every spirit but try the spirits whether they are of God because many false prophets are gone out into the world; hereby know ye the Spirit of God every spirit that confesseth that Jesus Christ is come in the flesh is of God; and every spirit that confesseth not that Jesus Christ is come in the flesh is not of God and this is that spirit of antichrist","Greater Is He That Is in You (vv.4-6): Ye are of God little children and have overcome them because greater is he that is in you than he that is in the world; they are of the world therefore speak they of the world and the world heareth them; we are of God he that knoweth God heareth us he that is not of God heareth not us hereby know we the spirit of truth and the spirit of error","God Is Love — Defined by the Cross (vv.7-12): Beloved let us love one another for love is of God; he that loveth not knoweth not God for God is love; in this was manifested the love of God toward us because that God sent his only begotten Son into the world that we might live through him; herein is love not that we loved God but that he loved us and sent his Son to be the propitiation for our sins; no man hath seen God at any time if we love one another God dwelleth in us","Mutual Indwelling and Perfect Love (vv.13-21): Hereby know we that we dwell in him and he in us because he hath given us of his Spirit; the Father sent the Son to be the Saviour of the world; God is love and he that dwelleth in love dwelleth in God; herein is our love made perfect that we may have boldness in the day of judgment; there is no fear in love but perfect love casteth out fear; we love him because he first loved us; if a man say I love God and hateth his brother he is a liar"]'
FROM books b WHERE b.name = '1 John';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Beloved, believe not every spirit, but try the spirits whether they are of God: because many false prophets are gone out into the world.',
   'Ἀγαπητοί μὴ παντὶ πνεύματι πιστεύετε ἀλλὰ δοκιμάζετε τὰ πνεύματα εἰ ἐκ τοῦ θεοῦ ἐστιν ὅτι πολλοὶ ψευδοπροφῆται ἐξεληλύθασιν εἰς τὸν κόσμον',
   'Agapētoi mē panti pneumati pisteuete alla dokimazete ta pneumata ei ek tou theou estin hoti polloi pseudoprophētai exelēlythasin eis ton kosmon',
   '''Believe not every spirit'' (mē panti pneumati pisteuete — stop believing every spirit; present imperative). ''Try'' (dokimazete — test, examine, prove by testing; from dokimazō, to assay metals). ''False prophets'' (pseudoprophētai — lying prophets). ''Gone out into the world'' (exelēlythasin — have gone out and remain out; perfect tense). Behind every teacher is a spirit — either the Spirit of God or a spirit of error. Believers must not be naively accepting but discerning, testing every claim against the truth of Christ.',
   NULL),
  (2,
   'Hereby know ye the Spirit of God: Every spirit that confesseth that Jesus Christ is come in the flesh is of God:',
   'ἐν τούτῳ γινώσκετε τὸ πνεῦμα τοῦ θεοῦ πᾶν πνεῦμα ὃ ὁμολογεῖ Ἰησοῦν Χριστὸν ἐν σαρκὶ ἐληλυθότα ἐκ τοῦ θεοῦ ἐστιν',
   'en toutō ginōskete to pneuma tou theou pan pneuma ho homologei Iēsoun Christon en sarki elēlythota ek tou theou estin',
   '''Confesseth'' (homologei — agrees, affirms openly). ''Jesus Christ is come in the flesh'' (Iēsoun Christon en sarki elēlythota — Jesus Christ having come in flesh; perfect participle: came and remains incarnate). The test is specific: does the spirit affirm that Jesus the Christ has come — and continues to exist — in real human flesh? This counters the Gnostic denial that the divine Christ could inhabit material flesh. The incarnation is the non-negotiable truth.',
   'The Christological test: The foundational test for distinguishing true from false spirits is the confession of the incarnation. ''Jesus Christ is come in the flesh'' affirms: (1) the historical man Jesus is the divine Christ, (2) He came in real human flesh, (3) He continues in incarnate form (perfect tense). Any teaching that denies, diminishes, or spiritualises the incarnation is not from God.'),
  (3,
   'And every spirit that confesseth not that Jesus Christ is come in the flesh is not of God: and this is that spirit of antichrist, whereof ye have heard that it should come; and even now already is it in the world.',
   'καὶ πᾶν πνεῦμα ὃ μὴ ὁμολογεῖ τὸν Ἰησοῦν Χριστὸν ἐν σαρκὶ ἐληλυθότα ἐκ τοῦ θεοῦ οὐκ ἔστιν καὶ τοῦτό ἐστιν τὸ τοῦ ἀντιχρίστου ὃ ἀκηκόατε ὅτι ἔρχεται καὶ νῦν ἐν τῷ κόσμῳ ἐστὶν ἤδη',
   'kai pan pneuma ho mē homologei ton Iēsoun Christon en sarki elēlythota ek tou theou ouk estin kai touto estin to tou antichristou ho akēkoate hoti erchetai kai nyn en tō kosmō estin ēdē',
   '''Confesseth not'' (mē homologei — does not affirm, refuses to confess). ''Spirit of antichrist'' (to tou antichristou — that which belongs to the antichrist). ''Already is it in the world'' (en tō kosmō estin ēdē — is in the world already now). The spirit of antichrist is not merely a future eschatological phenomenon but a present reality working through false teachers who deny the incarnation.',
   NULL),
  (4,
   'Ye are of God, little children, and have overcome them: because greater is he that is in you, than he that is in the world.',
   'Ὑμεῖς ἐκ τοῦ θεοῦ ἐστε τεκνία καὶ νενικήκατε αὐτούς ὅτι μείζων ἐστὶν ὁ ἐν ὑμῖν ἢ ὁ ἐν τῷ κόσμῳ',
   'Hymeis ek tou theou este teknia kai nenikēkate autous hoti meizōn estin ho en hymin ē ho en tō kosmō',
   '''Ye are of God'' (ek tou theou este — you originate from God). ''Have overcome'' (nenikēkate — have conquered and stand victorious; perfect tense). ''Greater'' (meizōn — larger, more powerful). ''He that is in you'' (ho en hymin — the Holy Spirit dwelling in believers). ''He that is in the world'' (ho en tō kosmō — the devil, the spirit of antichrist). The believer''s victory over false teaching is guaranteed not by their own wisdom but by the indwelling Spirit who is infinitely greater than Satan. This is one of the most reassuring verses in Scripture.',
   NULL),
  (5,
   'They are of the world: therefore speak they of the world, and the world heareth them.',
   'αὐτοὶ ἐκ τοῦ κόσμου εἰσίν διὰ τοῦτο ἐκ τοῦ κόσμου λαλοῦσιν καὶ ὁ κόσμος αὐτῶν ἀκούει',
   'autoi ek tou kosmou eisin dia touto ek tou kosmou lalousin kai ho kosmos autōn akouei',
   'The false teachers are ''of the world'' (ek tou kosmou — originating from the world-system). Their message comes from the world and the world naturally receives it. Popularity is not a sign of truth. The world listens to its own. A message that the world enthusiastically embraces should be examined carefully — the world does not naturally love God''s truth.',
   NULL),
  (6,
   'We are of God: he that knoweth God heareth us; he that is not of God heareth not us. Hereby know we the spirit of truth, and the spirit of error.',
   'ἡμεῖς ἐκ τοῦ θεοῦ ἐσμεν ὁ γινώσκων τὸν θεὸν ἀκούει ἡμῶν ὃς οὐκ ἔστιν ἐκ τοῦ θεοῦ οὐκ ἀκούει ἡμῶν ἐκ τούτου γινώσκομεν τὸ πνεῦμα τῆς ἀληθείας καὶ τὸ πνεῦμα τῆς πλάνης',
   'hēmeis ek tou theou esmen ho ginōskōn ton theon akouei hēmōn hos ouk estin ek tou theou ouk akouei hēmōn ek toutou ginōskomen to pneuma tēs alētheias kai to pneuma tēs planēs',
   '''Spirit of truth'' (to pneuma tēs alētheias — the spirit that belongs to truth). ''Spirit of error'' (to pneuma tēs planēs — the spirit of deception, of wandering). The response to apostolic teaching is itself a test: those who know God receive apostolic truth; those who are not of God reject it. Two spirits are at work in the world — truth and error — and the dividing line is the response to the apostolic gospel.',
   NULL),
  (7,
   'Beloved, let us love one another: for love is of God; and every one that loveth is born of God, and knoweth God.',
   'Ἀγαπητοί ἀγαπῶμεν ἀλλήλους ὅτι ἡ ἀγάπη ἐκ τοῦ θεοῦ ἐστιν καὶ πᾶς ὁ ἀγαπῶν ἐκ τοῦ θεοῦ γεγέννηται καὶ γινώσκει τὸν θεόν',
   'Agapētoi agapōmen allēlous hoti hē agapē ek tou theou estin kai pas ho agapōn ek tou theou gegennētai kai ginōskei ton theon',
   '''Let us love'' (agapōmen — hortatory subjunctive: let us make it our practice to love). ''Love is of God'' (hē agapē ek tou theou — love originates from God, has its source in God). ''Born of God'' (ek tou theou gegennētai — has been begotten from God; perfect tense). ''Knoweth God'' (ginōskei ton theon — has experiential knowledge of God). John traces love to its source: God Himself. Genuine love is evidence of the new birth and knowledge of God. This is not human affection elevated but divine love flowing through regenerate hearts.',
   NULL),
  (8,
   'He that loveth not knoweth not God; for God is love.',
   'ὁ μὴ ἀγαπῶν οὐκ ἔγνω τὸν θεόν ὅτι ὁ θεὸς ἀγάπη ἐστίν',
   'ho mē agapōn ouk egnō ton theon hoti ho theos agapē estin',
   '''Loveth not'' (ho mē agapōn — the one who does not love; present participle: characteristically loveless). ''Knoweth not'' (ouk egnō — never came to know; aorist: at no point did he know God). ''God is love'' (ho theos agapē estin — God is love; no article before agapē: love is His very essence). This is the second great ''God is'' declaration (cf. 1:5, ''God is light''). Love is not one attribute among many — it is the defining characteristic of God''s being. To not love is to not know this God.',
   'God is love: This is not a statement that ''love is God'' (which would deify a human emotion) but that ''God is love'' (which grounds love in the divine nature). God''s love is defined not by human experience but by the cross (v.10). This love is holy (1:5), righteous (2:1), and sacrificial (3:16). All genuine love derives from and reflects this divine source.'),
  (9,
   'In this was manifested the love of God toward us, because that God sent his only begotten Son into the world, that we might live through him.',
   'ἐν τούτῳ ἐφανερώθη ἡ ἀγάπη τοῦ θεοῦ ἐν ἡμῖν ὅτι τὸν υἱὸν αὐτοῦ τὸν μονογενῆ ἀπέσταλκεν ὁ θεὸς εἰς τὸν κόσμον ἵνα ζήσωμεν δι᾽ αὐτοῦ',
   'en toutō ephanerōthē hē agapē tou theou en hēmin hoti ton huion autou ton monogenē apestalken ho theos eis ton kosmon hina zēsōmen di'' autou',
   '''Manifested'' (ephanerōthē — was made visible, was revealed). ''Only begotten'' (monogenē — unique, one-of-a-kind; from monos + genos: the only one of His kind). ''Sent'' (apestalken — has sent on a mission; perfect tense: sent and the mission continues). ''That we might live through him'' (hina zēsōmen di'' autou — so that we might have life through Him). God''s love is not abstract but historical: it was manifested in a specific act — sending His unique Son into the world so that the dead might live.',
   NULL),
  (10,
   'Herein is love, not that we loved God, but that he loved us, and sent his Son to be the propitiation for our sins.',
   'ἐν τούτῳ ἐστὶν ἡ ἀγάπη οὐχ ὅτι ἡμεῖς ἠγαπήσαμεν τὸν θεόν ἀλλ᾽ ὅτι αὐτὸς ἠγάπησεν ἡμᾶς καὶ ἀπέστειλεν τὸν υἱὸν αὐτοῦ ἱλασμὸν περὶ τῶν ἁμαρτιῶν ἡμῶν',
   'en toutō estin hē agapē ouch hoti hēmeis ēgapēsamen ton theon all'' hoti autos ēgapēsen hēmas kai apesteilen ton huion autou hilasmon peri tōn hamartiōn hēmōn',
   '''Herein is love'' (en toutō estin hē agapē — in this is the definition of love). ''Not that we loved God'' — love did not originate with us. ''He loved us'' — the initiative was entirely God''s. ''Propitiation'' (hilasmon — the atoning sacrifice that satisfies divine justice; cf. 2:2). The definition of love is the cross: God loving the unlovable by sending His Son to bear the penalty for their sins. This is the foundation of all Christian ethics: we love because He first loved us (v.19).',
   'Love defined by the cross: John gives the definitive definition of love. It is not human love reaching up to God but divine love reaching down to sinners. The cross is the supreme expression: God sent His Son as a propitiation — a sacrifice that satisfies His own justice while saving the sinner. Our love for God is always a response to His prior love for us.'),
  (11,
   'Beloved, if God so loved us, we ought also to love one another.',
   'Ἀγαπητοί εἰ οὕτως ὁ θεὸς ἠγάπησεν ἡμᾶς καὶ ἡμεῖς ὀφείλομεν ἀλλήλους ἀγαπᾶν',
   'Agapētoi ei houtōs ho theos ēgapēsen hēmas kai hēmeis opheilomen allēlous agapan',
   '''If God so loved us'' (ei houtōs — if in this manner, if to this degree). ''We ought'' (opheilomen — we owe, we are morally indebted). ''Love one another'' (allēlous agapan — to love each other). The logic is simple but inescapable: the manner and degree of God''s love creates an obligation. If God loved us enough to send His Son to die, we owe love to one another. This is not earning salvation but responding to grace.',
   NULL),
  (12,
   'No man hath seen God at any time. If we love one another, God dwelleth in us, and his love is perfected in us.',
   'θεὸν οὐδεὶς πώποτε τεθέαται ἐὰν ἀγαπῶμεν ἀλλήλους ὁ θεὸς ἐν ἡμῖν μένει καὶ ἡ ἀγάπη αὐτοῦ τετελειωμένη ἐστὶν ἐν ἡμῖν',
   'theon oudeis pōpote tetheatai ean agapōmen allēlous ho theos en hēmin menei kai hē agapē autou teteleiōmenē estin en hēmin',
   '''No man hath seen God'' (theon oudeis pōpote tetheatai — God no one has ever beheld; cf. John 1:18). ''God dwelleth in us'' (ho theos en hēmin menei — God remains in us). ''His love is perfected'' (hē agapē autou teteleiōmenē estin — His love has been brought to completion). The invisible God becomes visible through the love of His people. When believers love one another, the unseen God takes up residence and His love reaches its intended goal. The church''s love is the world''s glimpse of the invisible God.',
   NULL),
  (13,
   'Hereby know we that we dwell in him, and he in us, because he hath given us of his Spirit.',
   'ἐν τούτῳ γινώσκομεν ὅτι ἐν αὐτῷ μένομεν καὶ αὐτὸς ἐν ἡμῖν ὅτι ἐκ τοῦ πνεύματος αὐτοῦ δέδωκεν ἡμῖν',
   'en toutō ginōskomen hoti en autō menomen kai autos en hēmin hoti ek tou pneumatos autou dedōken hēmin',
   '''Given us of his Spirit'' (ek tou pneumatos autou dedōken — has given us from His Spirit; perfect tense: a permanent gift). The indwelling Spirit is the proof of mutual indwelling. This parallels 3:24 and completes the triad of assurance tests: obedience (ch.2), love (ch.3-4), and the Spirit (3:24; 4:13). The Spirit is not something believers earn but something God gives.',
   NULL),
  (14,
   'And we have seen and do testify that the Father sent the Son to be the Saviour of the world.',
   'καὶ ἡμεῖς τεθεάμεθα καὶ μαρτυροῦμεν ὅτι ὁ πατὴρ ἀπέσταλκεν τὸν υἱὸν σωτῆρα τοῦ κόσμου',
   'kai hēmeis tetheametha kai martyroumen hoti ho patēr apestalken ton huion sōtēra tou kosmou',
   '''Seen'' (tetheametha — have beheld, gazed upon; perfect tense: the vision persists in memory). ''Testify'' (martyroumen — we bear witness). ''Saviour of the world'' (sōtēra tou kosmou — deliverer of the world; cf. John 4:42). The apostles'' testimony is eyewitness: they saw the incarnate Son and continue to testify. The title ''Saviour of the world'' extends salvation''s offer beyond Israel to all peoples.',
   NULL),
  (15,
   'Whosoever shall confess that Jesus is the Son of God, God dwelleth in him, and he in God.',
   'ὃς ἂν ὁμολογήσῃ ὅτι Ἰησοῦς ἐστιν ὁ υἱὸς τοῦ θεοῦ ὁ θεὸς ἐν αὐτῷ μένει καὶ αὐτὸς ἐν τῷ θεῷ',
   'hos an homologēsē hoti Iēsous estin ho huios tou theou ho theos en autō menei kai autos en tō theō',
   '''Confess'' (homologēsē — acknowledge, declare openly). ''Jesus is the Son of God'' — the full Christian confession. ''God dwelleth in him, and he in God'' (mutual indwelling). Genuine confession of Christ''s divine sonship brings the believer into the deepest possible relationship: mutual indwelling with God. This confession is not mere verbal assent but Spirit-empowered acknowledgment (cf. 1 Cor 12:3).',
   NULL),
  (16,
   'And we have known and believed the love that God hath to us. God is love; and he that dwelleth in love dwelleth in God, and God in him.',
   'καὶ ἡμεῖς ἐγνώκαμεν καὶ πεπιστεύκαμεν τὴν ἀγάπην ἣν ἔχει ὁ θεὸς ἐν ἡμῖν Ὁ θεὸς ἀγάπη ἐστίν καὶ ὁ μένων ἐν τῇ ἀγάπῃ ἐν τῷ θεῷ μένει καὶ ὁ θεὸς ἐν αὐτῷ μένει',
   'kai hēmeis egnōkamen kai pepisteukamen tēn agapēn hēn echei ho theos en hēmin Ho theos agapē estin kai ho menōn en tē agapē en tō theō menei kai ho theos en autō menei',
   '''Known and believed'' (egnōkamen kai pepisteukamen — have come to know and have come to believe; both perfect tense: settled, established knowledge and faith). ''God is love'' — the second occurrence of this declaration (cf. v.8). ''Dwelleth in love'' (ho menōn en tē agapē — the one who remains in the sphere of love). ''Dwelleth in God'' (en tō theō menei). To abide in love is to abide in God, because God is love. Love is not merely a path to God but the very atmosphere of His presence.',
   NULL),
  (17,
   'Herein is our love made perfect, that we may have boldness in the day of judgment: because as he is, so are we in this world.',
   'ἐν τούτῳ τετελείωται ἡ ἀγάπη μεθ᾽ ἡμῶν ἵνα παρρησίαν ἔχωμεν ἐν τῇ ἡμέρᾳ τῆς κρίσεως ὅτι καθὼς ἐκεῖνός ἐστιν καὶ ἡμεῖς ἐσμεν ἐν τῷ κόσμῳ τούτῳ',
   'en toutō teteleiōtai hē agapē meth'' hēmōn hina parrēsian echōmen en tē hēmera tēs kriseōs hoti kathōs ekeinos estin kai hēmeis esmen en tō kosmō toutō',
   '''Made perfect'' (teteleiōtai — has been brought to completion; perfect tense). ''Boldness'' (parrēsian — confidence, freedom of speech). ''Day of judgment'' (hēmera tēs kriseōs). ''As he is, so are we'' (kathōs ekeinos estin kai hēmeis esmen — as that One is, so are we). The perfecting of love gives confidence at the judgment. The remarkable claim: ''as he is, so are we in this world'' — believers share Christ''s relationship to the Father now, and will therefore face the judgment without fear.',
   NULL),
  (18,
   'There is no fear in love; but perfect love casteth out fear: because fear hath torment. He that feareth is not made perfect in love.',
   'φόβος οὐκ ἔστιν ἐν τῇ ἀγάπῃ ἀλλ᾽ ἡ τελεία ἀγάπη ἔξω βάλλει τὸν φόβον ὅτι ὁ φόβος κόλασιν ἔχει ὁ δὲ φοβούμενος οὐ τετελείωται ἐν τῇ ἀγάπῃ',
   'phobos ouk estin en tē agapē all'' hē teleia agapē exō ballei ton phobon hoti ho phobos kolasin echei ho de phoboumenos ou teteleiōtai en tē agapē',
   '''Fear'' (phobos — dread, terror; specifically the fear of judgment and punishment). ''Perfect love'' (hē teleia agapē — the complete, mature, fully realised love). ''Casteth out'' (exō ballei — throws out, expels forcefully). ''Torment'' (kolasin — punishment, correction, the anticipation of penalty). Fear and love are mutually exclusive: where love is perfected, fear is expelled. The fear in view is not reverence for God but the dread of judgment. The believer who knows God''s love fully has no reason to fear condemnation.',
   'Perfect love and fear: Fear of judgment is the symptom of incomplete love. When God''s love is fully received and reciprocated, it expels the dread of punishment. This is not about human effort to love perfectly but about receiving God''s perfect love so deeply that the fear of His judgment dissolves. ''There is therefore now no condemnation to them which are in Christ Jesus'' (Rom 8:1).'),
  (19,
   'We love him, because he first loved us.',
   'ἡμεῖς ἀγαπῶμεν αὐτὸν ὅτι αὐτὸς πρῶτος ἠγάπησεν ἡμᾶς',
   'hēmeis agapōmen auton hoti autos prōtos ēgapēsen hēmas',
   '''We love'' (agapōmen — we love; some manuscripts read ''let us love''). ''He first loved us'' (autos prōtos ēgapēsen hēmas — He Himself first loved us). The priority of God''s love is absolute: our love is always a response, never an initiation. God loved first — before we existed, before we believed, while we were still sinners (Rom 5:8). This single sentence is the foundation of all Christian ethics: love is response to grace.',
   NULL),
  (20,
   'If a man say, I love God, and hateth his brother, he is a liar: for he that loveth not his brother whom he hath seen, how can he love God whom he hath not seen?',
   'ἐάν τις εἴπῃ ὅτι ἀγαπῶ τὸν θεόν καὶ τὸν ἀδελφὸν αὐτοῦ μισῇ ψεύστης ἐστίν ὁ γὰρ μὴ ἀγαπῶν τὸν ἀδελφὸν αὐτοῦ ὃν ἑώρακεν τὸν θεὸν ὃν οὐχ ἑώρακεν πῶς δύναται ἀγαπᾶν',
   'ean tis eipē hoti agapō ton theon kai ton adelphon autou misē pseustēs estin ho gar mē agapōn ton adelphon autou hon heōraken ton theon hon ouch heōraken pōs dynatai agapan',
   '''Liar'' (pseustēs — a false person). The logic is unanswerable: if you cannot love your brother whom you can see, how can you claim to love God whom you cannot see? Love for the visible brother is the test of love for the invisible God. The brother is the visible representation of the command to love; God is the invisible source. Failure to love what you can see proves you do not love what you cannot see.',
   NULL),
  (21,
   'And this commandment have we from him, That he who loveth God love his brother also.',
   'καὶ ταύτην τὴν ἐντολὴν ἔχομεν ἀπ᾽ αὐτοῦ ἵνα ὁ ἀγαπῶν τὸν θεὸν ἀγαπᾷ καὶ τὸν ἀδελφὸν αὐτοῦ',
   'kai tautēn tēn entolēn echomen ap'' autou hina ho agapōn ton theon agapa kai ton adelphon autou',
   '''This commandment'' (tautēn tēn entolēn — this specific command). ''From him'' (ap'' autou — from God or from Christ). The chapter ends with a direct command: love of God and love of brother are inseparable. You cannot have one without the other. This summarises the entire chapter: God is love (v.8,16), He loved us first (v.19), and His love flows through us to the brethren (v.21).',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 John' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 1 (Try the spirits)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δοκιμάζετε', 'dokimazete', 'G1381', 'Test, prove, examine — from dokimazō, to assay (as metals are tested by fire). Not cynical suspicion but careful evaluation. Believers are to test every spiritual claim against the truth of the incarnation. Cf. 1 Thess 5:21.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 4 AND v.verse_number = 1;

-- Verse 8 (God is love)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀγάπη', 'agapē', 'G26', 'Love — selfless, sacrificial, unconditional love. Not merely an attribute God possesses but His essential nature. God does not merely have love; He is love. This love is defined by the cross (v.10), not by human sentiment.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 4 AND v.verse_number = 8;

-- Verse 10 (Propitiation)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἱλασμόν', 'hilasmon', 'G2434', 'Propitiation, atoning sacrifice — the sacrifice that turns away God''s wrath by satisfying His justice. Christ is both the offerer and the offering. God''s love does not bypass His justice but satisfies it through the cross.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 4 AND v.verse_number = 10;

-- Verse 18 (Perfect love / fear / torment)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τελεία', 'teleia', 'G5046', 'Perfect, complete, mature — from teleios (reaching its end, fully developed). Not flawless but fully realised. Love that has reached its intended purpose and effect: driving out all dread of judgment.', 1),
  ('κόλασιν', 'kolasin', 'G2851', 'Punishment, torment, correction — the dread of coming punishment. Fear anticipates penalty. Perfect love removes this anticipation because the penalty has already been borne by Christ on the cross.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 4 AND v.verse_number = 18;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Try the spirits
  (1, '1 Thessalonians 5:21', 1), (1, 'Matthew 7:15', 2), (1, '2 Peter 2:1', 3),
  -- v2: Jesus Christ come in the flesh
  (2, '2 John 1:7', 1), (2, 'John 1:14', 2), (2, '1 Timothy 3:16', 3),
  -- v4: Greater is he that is in you
  (4, 'Romans 8:31', 1), (4, 'John 16:33', 2), (4, '2 Kings 6:16', 3),
  -- v8: God is love
  (8, '1 John 4:16', 1), (8, 'John 3:16', 2), (8, '2 Corinthians 13:11', 3),
  -- v9: Sent his only begotten Son
  (9, 'John 3:16', 1), (9, 'Romans 5:8', 2), (9, 'Galatians 4:4-5', 3),
  -- v10: Propitiation for our sins
  (10, '1 John 2:2', 1), (10, 'Romans 3:25', 2), (10, 'Romans 5:8', 3),
  -- v12: No man hath seen God
  (12, 'John 1:18', 1), (12, '1 Timothy 6:16', 2), (12, 'Exodus 33:20', 3),
  -- v18: Perfect love casteth out fear
  (18, 'Romans 8:1', 1), (18, 'Romans 8:15', 2), (18, '2 Timothy 1:7', 3),
  -- v19: He first loved us
  (19, 'Romans 5:8', 1), (19, 'Ephesians 2:4-5', 2), (19, 'Deuteronomy 7:7-8', 3),
  -- v20: Cannot love God and hate brother
  (20, '1 John 2:9-11', 1), (20, 'James 1:26', 2), (20, 'John 13:34', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 John' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 John Chapter 4 Complete
-- 21 verses · 5 key verses with word studies (6 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
