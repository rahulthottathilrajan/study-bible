-- ═══════════════════════════════════════════════════
-- JOHN CHAPTER 5 — The Healing at Bethesda and the Son's Divine Authority
-- 47 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'John 5 marks a decisive turning point in the Gospel: the first major confrontation between Jesus and the Jewish authorities. At the pool of Bethesda in Jerusalem, Jesus heals a man who has been infirm for thirty-eight years: ''Rise, take up thy bed, and walk'' (v.8). The healing occurs on the Sabbath, provoking immediate conflict: ''It is the sabbath day: it is not lawful for thee to carry thy bed'' (v.10). When Jesus is identified as the healer, the Jews persecute him (v.16). Jesus responds with a statement that escalates the conflict dramatically: ''My Father worketh hitherto, and I work'' (v.17). The Jews understand perfectly — ''he said also that God was his Father, making himself equal with God'' (v.18). What follows (vv.19-47) is the most extensive christological discourse in John: Jesus claims equality with the Father in work (v.19), love (v.20), resurrection power (v.21), judgment (v.22), and honour (v.23). ''As the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will'' (v.21). ''The Father judgeth no man, but hath committed all judgment unto the Son'' (v.22). ''All men should honour the Son, even as they honour the Father'' (v.23). ''He that heareth my word, and believeth on him that sent me, hath everlasting life, and shall not come into condemnation; but is passed from death unto life'' (v.24). Jesus announces two resurrections: a present spiritual resurrection — ''The hour is coming, and now is, when the dead shall hear the voice of the Son of God: and they that hear shall live'' (v.25) — and a future bodily resurrection — ''all that are in the graves shall hear his voice, And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation'' (vv.28-29). Jesus then presents four witnesses to his identity: John the Baptist (vv.33-35), Jesus'' own works (v.36), the Father himself (vv.37-38), and the Scriptures (vv.39-40). He closes with a devastating indictment: ''Do not think that I will accuse you to the Father: there is one that accuseth you, even Moses, in whom ye trust. For had ye believed Moses, ye would have believed me: for he wrote of me'' (vv.45-46).',
  'The Son''s Divine Authority — Equal with the Father in Work, Judgment, and Life',
  'ἐξουσία (exousia)',
  'Authority, power, right, jurisdiction — from exesti (it is lawful, it is permitted). Exousia in John 5 refers to the delegated yet inherent authority the Son possesses from the Father. The Father has given the Son authority to give life (v.21), to execute judgment (v.22, 27), and to have life in himself (v.26). This is not mere permission but the bestowal of divine prerogatives upon One who is qualified to exercise them because he is himself God (1:1). The authority is delegated in the economy of redemption (the Father sends, the Son acts), yet inherent in nature (the Son does ''whatever the Father does,'' v.19).',
  '["The Pool of Bethesda: Thirty-Eight Years of Infirmity (vv.1-9): After this there was a feast of the Jews and Jesus went up to Jerusalem. Now there is at Jerusalem by the sheep market a pool called Bethesda having five porches. In these lay a great multitude of impotent folk blind halt withered waiting for the moving of the water. A certain man was there which had an infirmity thirty and eight years. Jesus saith unto him — Wilt thou be made whole? The impotent man answered — Sir I have no man when the water is troubled to put me into the pool. Jesus saith — Rise take up thy bed and walk. Immediately the man was made whole and took up his bed and walked — and on the same day was the sabbath","The Sabbath Controversy (vv.10-18): The Jews said unto him that was cured — It is the sabbath day it is not lawful for thee to carry thy bed. He answered — He that made me whole the same said unto me Take up thy bed and walk. They asked — What man is that? He that was healed wist not who it was for Jesus had conveyed himself away. Afterward Jesus findeth him in the temple — Behold thou art made whole sin no more lest a worse thing come unto thee. The man departed and told the Jews that it was Jesus. Therefore did the Jews persecute Jesus because he had done these things on the sabbath. Jesus answered — My Father worketh hitherto and I work. Therefore the Jews sought the more to kill him because he said God was his Father making himself equal with God","The Son Does What the Father Does (vv.19-23): Then answered Jesus — The Son can do nothing of himself but what he seeth the Father do — for what things soever he doeth these also doeth the Son likewise. The Father loveth the Son and sheweth him all things that himself doeth. Greater works than these shall he shew you. As the Father raiseth up the dead and quickeneth them even so the Son quickeneth whom he will. The Father judgeth no man but hath committed all judgment unto the Son — that all men should honour the Son even as they honour the Father","From Death to Life (vv.24-30): Verily verily I say unto you He that heareth my word and believeth on him that sent me hath everlasting life and shall not come into condemnation but is passed from death unto life. The hour is coming and now is when the dead shall hear the voice of the Son of God and they that hear shall live. As the Father hath life in himself so hath he given to the Son to have life in himself — and hath given him authority to execute judgment because he is the Son of man. Marvel not at this — the hour is coming in the which all that are in the graves shall hear his voice and shall come forth — they that have done good unto the resurrection of life and they that have done evil unto the resurrection of damnation. I can of mine own self do nothing — as I hear I judge and my judgment is just because I seek not mine own will but the will of the Father which hath sent me","Four Witnesses to the Son (vv.31-40): If I bear witness of myself my witness is not true. There is another that beareth witness of me. Ye sent unto John and he bare witness unto the truth. I receive not testimony from man — but these things I say that ye might be saved. He was a burning and a shining light and ye were willing for a season to rejoice in his light. But I have greater witness than that of John — the works which the Father hath given me to finish the same works that I do bear witness of me. And the Father himself which hath sent me hath borne witness of me. Ye have neither heard his voice at any time nor seen his shape. Ye have not his word abiding in you. Search the scriptures for in them ye think ye have eternal life — and they are they which testify of me. And ye will not come to me that ye might have life","Moses Accuses You (vv.41-47): I receive not honour from men. But I know you that ye have not the love of God in you. I am come in my Father''s name and ye receive me not — if another shall come in his own name him ye will receive. How can ye believe which receive honour one of another and seek not the honour that cometh from God only? Do not think that I will accuse you to the Father — there is one that accuseth you even Moses in whom ye trust. For had ye believed Moses ye would have believed me for he wrote of me. But if ye believe not his writings how shall ye believe my words?"]'
FROM books b WHERE b.name = 'John';

-- Step 2: Insert all 47 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'After this there was a feast of the Jews; and Jesus went up to Jerusalem.',
   'μετὰ ταῦτα ἦν ἑορτὴ τῶν Ἰουδαίων καὶ ἀνέβη ὁ Ἰησοῦς εἰς Ἱεροσόλυμα',
   'meta tauta ēn heortē tōn Ioudaiōn kai anebē ho Iēsous eis Hierosolyma',
   '''A feast of the Jews'' (heortē tōn Ioudaiōn — some manuscripts have ''the feast,'' possibly Passover or Pentecost; the identity is debated). John identifies Jewish festivals for his readers. ''Went up'' (anebē — ascended) — the standard expression for going to Jerusalem, which sits on elevated ground. This is Jesus'' second visit to Jerusalem in John (after 2:13).',
   NULL),
  (2, 'Now there is at Jerusalem by the sheep market a pool, which is called in the Hebrew tongue Bethesda, having five porches.',
   'ἔστιν δὲ ἐν τοῖς Ἱεροσολύμοις ἐπὶ τῇ προβατικῇ κολυμβήθρα ἡ ἐπιλεγομένη Ἑβραϊστὶ Βηθεσδά πέντε στοὰς ἔχουσα',
   'estin de en tois Hierosolymois epi tē probatikē kolymbēthra hē epilegomenē Hebraisti Bēthesda pente stoas echousa',
   '''Bethesda'' (Bēthesda — ''House of Mercy'' or ''House of the Outpouring''). ''Having five porches'' (pente stoas echousa — five covered colonnades). Archaeologists discovered the pool in the 19th century near the Church of St. Anne — a trapezoid-shaped double pool with a central dividing colonnade, totaling five covered areas. The discovery confirmed John''s topographical accuracy and his detailed knowledge of pre-70 AD Jerusalem. ''By the sheep market'' (epi tē probatikē — near the Sheep Gate, cf. Nehemiah 3:1).',
   NULL),
  (3, 'In these lay a great multitude of impotent folk, of blind, halt, and withered, waiting for the moving of the water.',
   'ἐν ταύταις κατέκειτο πλῆθος πολὺ τῶν ἀσθενούντων τυφλῶν χωλῶν ξηρῶν ἐκδεχομένων τὴν τοῦ ὕδατος κίνησιν',
   'en tautais katekeito plēthos poly tōn asthenountōn typhlōn chōlōn xērōn ekdechomenōn tēn tou hydatos kinēsin',
   '''A great multitude of impotent folk'' (plēthos poly tōn asthenountōn — a large crowd of the sick, weak, powerless). ''Blind, halt, and withered'' (typhlōn chōlōn xērōn — blind, lame, withered/paralysed). ''Waiting for the moving of the water'' — the pool was fed by an intermittent spring; popular belief attributed healing power to the stirring of the water. The scene is one of desperate, helpless humanity — a fitting context for divine intervention.',
   NULL),
  (4, 'For an angel went down at a certain season into the pool, and troubled the water: whosoever then first after the troubling of the water stepped in was made whole of whatsoever disease he had.',
   'ἄγγελος γὰρ κατὰ καιρὸν κατέβαινεν ἐν τῇ κολυμβήθρᾳ καὶ ἐτάρασσεν τὸ ὕδωρ ὁ οὖν πρῶτος ἐμβὰς μετὰ τὴν ταραχὴν τοῦ ὕδατος ὑγιὴς ἐγίνετο ᾧ δήποτε κατείχετο νοσήματι',
   'angelos gar kata kairon katebainen en tē kolymbēthra kai etarassen to hydōr ho oun prōtos embas meta tēn tarachēn tou hydatos hygiēs egineto hō dēpote kateicheto nosēmati',
   'This verse is absent from the earliest and best Greek manuscripts (P66, P75, Sinaiticus, Vaticanus) and is likely a later scribal addition explaining the popular belief about the pool. Whether angelic or natural (an intermittent spring), the point of the narrative is that the man had no hope from this source — he needed someone greater. The textual note does not affect the story: Jesus heals where all other remedies have failed.',
   NULL),
  (5, 'And a certain man was there, which had an infirmity thirty and eight years.',
   'ἦν δέ τις ἄνθρωπος ἐκεῖ τριάκοντα καὶ ὀκτὼ ἔτη ἔχων ἐν τῇ ἀσθενείᾳ αὐτοῦ',
   'ēn de tis anthrōpos ekei triakonta kai oktō etē echōn en tē astheneia autou',
   '''Thirty and eight years'' (triakonta kai oktō etē — 38 years in his infirmity). The duration emphasises the hopelessness of his condition — nearly four decades of suffering, longer than Israel''s wilderness wandering (Deuteronomy 2:14: 38 years from Kadesh-barnea to crossing the Zered). The parallel may be intentional: as Israel wandered 38 years due to unbelief before entering the promised land, this man has waited 38 years before encountering the one who can make him whole.',
   NULL),
  (6, 'When Jesus saw him lie, and knew that he had been now a long time in that case, he saith unto him, Wilt thou be made whole?',
   'τοῦτον ἰδὼν ὁ Ἰησοῦς κατακείμενον καὶ γνοὺς ὅτι πολὺν ἤδη χρόνον ἔχει λέγει αὐτῷ Θέλεις ὑγιὴς γενέσθαι',
   'touton idōn ho Iēsous katakeimenon kai gnous hoti polyn ēdē chronon echei legei autō Theleis hygiēs genesthai',
   '''Knew'' (gnous — having known, perceived; Jesus'' supernatural knowledge again, cf. 2:24-25; 4:18). ''Wilt thou be made whole?'' (theleis hygiēs genesthai — do you want to become well?). The question seems obvious, but it is pastorally profound: (1) It awakens desire — the man''s hope may have died after 38 years. (2) It invites personal engagement — Jesus does not heal impersonally but relationally. (3) It probes whether the man wants healing on Jesus'' terms, not his own. The man does not answer ''yes'' but explains his helplessness (v.7).',
   NULL),
  (7, 'The impotent man answered him, Sir, I have no man, when the water is troubled, to put me into the pool: but while I am coming, another steppeth down before me.',
   'ἀπεκρίθη αὐτῷ ὁ ἀσθενῶν Κύριε ἄνθρωπον οὐκ ἔχω ἵνα ὅταν ταραχθῇ τὸ ὕδωρ βάλῃ με εἰς τὴν κολυμβήθραν ἐν ᾧ δὲ ἔρχομαι ἐγώ ἄλλος πρὸ ἐμοῦ καταβαίνει',
   'apekrithē autō ho asthenōn Kyrie anthrōpon ouk echō hina hotan tarachthē to hydōr balē me eis tēn kolymbēthran en hō de erchomai egō allos pro emou katabainei',
   '''I have no man'' (anthrōpon ouk echō — I have no person, no one to help me). The pathos is intense: friendless, helpless, always too slow. His answer reveals his hopelessness — he has given up on the pool but has nothing else. He does not yet know he is speaking to the One who needs no pool, no angel, no human helper. ''While I am coming, another steppeth down before me'' — the competitive, first-come system excludes the weakest. Jesus does not work this way; he goes to the one with no helper.',
   NULL),
  (8, 'Jesus saith unto him, Rise, take up thy bed, and walk.',
   'λέγει αὐτῷ ὁ Ἰησοῦς Ἔγειρε ἆρον τὸν κράβαττόν σου καὶ περιπάτει',
   'legei autō ho Iēsous Egeire aron ton krabatton sou kai peripatei',
   '''Rise'' (egeire — get up, arise; the same verb used for resurrection, egeirō). ''Take up thy bed'' (aron ton krabatton sou — pick up your mat/pallet; krabattos is a poor man''s sleeping mat). ''Walk'' (peripatei — walk around, keep walking; present imperative: continuous action). Three commands requiring obedience in faith: the man must act before he can see the result. He must attempt to rise before he discovers he is able. Jesus'' word carries creative power — the command itself enables the obedience it demands.',
   NULL),
  (9, 'And immediately the man was made whole, and took up his bed, and walked: and on the same day was the sabbath.',
   'καὶ εὐθέως ἐγένετο ὑγιὴς ὁ ἄνθρωπος καὶ ἦρεν τὸν κράβαττον αὐτοῦ καὶ περιεπάτει ἦν δὲ σάββατον ἐν ἐκείνῃ τῇ ἡμέρᾳ',
   'kai eutheōs egeneto hygiēs ho anthrōpos kai ēren ton krabatton autou kai periepatei ēn de sabbaton en ekeinē tē hēmera',
   '''Immediately'' (eutheōs — at once, instantly). ''Was made whole'' (egeneto hygiēs — became well, was healed completely). ''On the same day was the sabbath'' — John saves this crucial detail for last, creating dramatic tension. The healing on the Sabbath is not accidental but deliberate — Jesus chose this day. In the Synoptics, Jesus performs multiple Sabbath healings (Mark 3:1-6; Luke 13:10-17; 14:1-6). Here in John, the Sabbath controversy leads to the most extensive discourse on Jesus'' divine authority.',
   NULL),
  (10, 'The Jews therefore said unto him that was cured, It is the sabbath day: it is not lawful for thee to carry thy bed.',
   'ἔλεγον οὖν οἱ Ἰουδαῖοι τῷ τεθεραπευμένῳ Σάββατόν ἐστιν οὐκ ἔξεστίν σοι ἆραι τὸν κράβαττον',
   'elegon oun hoi Ioudaioi tō tetherapeumenō Sabbaton estin ouk exestin soi arai ton krabatton',
   '''It is not lawful'' (ouk exestin — it is not permitted). The Mishnah (Shabbat 7:2) lists 39 categories of work prohibited on the Sabbath; carrying objects from one domain to another was among them. The Jews see the bed-carrying but not the miracle — they focus on the letter of the law while missing the compassion of God. Jeremiah 17:21-22 prohibited carrying burdens on the Sabbath, but this prohibition was about commercial activity, not a healed man carrying his mat.',
   NULL),
  (11, 'He answered them, He that made me whole, the same said unto me, Take up thy bed, and walk.',
   'ἀπεκρίθη αὐτοῖς Ὁ ποιήσας με ὑγιῆ ἐκεῖνος μοι εἶπεν Ἆρον τὸν κράβαττόν σου καὶ περιπάτει',
   'apekrithē autois Ho poiēsas me hygiē ekeinos moi eipen Aron ton krabatton sou kai peripatei',
   'The healed man''s logic is simple and sound: the one who had the power to heal after 38 years surely has the authority to command bed-carrying on the Sabbath. The authority to heal implies authority over the Sabbath. The man does not yet know Jesus'' name (v.13) but recognises the authority behind the command.',
   NULL),
  (12, 'Then asked they him, What man is that which said unto thee, Take up thy bed, and walk?',
   'ἠρώτησαν οὖν αὐτόν Τίς ἐστιν ὁ ἄνθρωπος ὁ εἰπών σοι Ἆρον τὸν κράβαττόν σου καὶ περιπάτει',
   'ērōtēsan oun auton Tis estin ho anthrōpos ho eipōn soi Aron ton krabatton sou kai peripatei',
   'The Jews ask not ''Who healed you?'' but ''Who told you to carry your bed?'' — they are more interested in identifying the Sabbath-breaker than celebrating the miracle. Their question reveals misplaced priorities: legal compliance over human compassion. This pattern recurs throughout John (cf. 9:13-16, 24).',
   NULL),
  (13, 'And he that was healed wist not who it was: for Jesus had conveyed himself away, a multitude being in that place.',
   'ὁ δὲ ἰαθεὶς οὐκ ᾔδει τίς ἐστιν ὁ γὰρ Ἰησοῦς ἐξένευσεν ὄχλου ὄντος ἐν τῷ τόπῳ',
   'ho de iatheis ouk ēdei tis estin ho gar Iēsous exeneusen ochlou ontos en tō topō',
   '''Wist not'' (ouk ēdei — did not know). ''Conveyed himself away'' (exeneusen — slipped away, withdrew quietly; from ekneuō, to turn aside). Jesus healed anonymously and departed — he was not seeking publicity. The man received healing before knowing who healed him, illustrating that grace precedes knowledge. Jesus will later find the man (v.14) and complete the encounter.',
   NULL),
  (14, 'Afterward Jesus findeth him in the temple, and said unto him, Behold, thou art made whole: sin no more, lest a worse thing come unto thee.',
   'μετὰ ταῦτα εὑρίσκει αὐτὸν ὁ Ἰησοῦς ἐν τῷ ἱερῷ καὶ εἶπεν αὐτῷ Ἴδε ὑγιὴς γέγονας μηκέτι ἁμάρτανε ἵνα μὴ χεῖρόν σοί τι γένηται',
   'meta tauta heuriskei auton ho Iēsous en tō hierō kai eipen autō Ide hygiēs gegonas mēketi hamartane hina mē cheiron soi ti genētai',
   '''Findeth him'' (heuriskei — finds, seeks out). ''In the temple'' — the man has gone to worship, suggesting gratitude. ''Sin no more'' (mēketi hamartane — stop sinning, cease sinning; present imperative with mēketi: do not continue in sin). ''Lest a worse thing come unto thee'' — Jesus implies a connection between this man''s condition and sin (not universal: cf. 9:3 where Jesus denies such a connection). The ''worse thing'' is not more illness but spiritual judgment. Physical healing is temporary; spiritual transformation is what truly matters.',
   NULL),
  (15, 'The man departed, and told the Jews that it was Jesus, which had made him whole.',
   'ἀπῆλθεν ὁ ἄνθρωπος καὶ ἀνήγγειλεν τοῖς Ἰουδαίοις ὅτι Ἰησοῦς ἐστιν ὁ ποιήσας αὐτὸν ὑγιῆ',
   'apēlthen ho anthrōpos kai anēngeilen tois Ioudaiois hoti Iēsous estin ho poiēsas auton hygiē',
   'The man reports to the Jewish authorities that it was Jesus. His motive is debated: informing (neutral), testifying (positive), or betraying (negative). The text does not condemn him, and ''made him whole'' (poiēsas auton hygiē) focuses on the healing, not the Sabbath-breaking. The result, however, is that Jesus is now identified and targeted.',
   NULL),
  (16, 'And therefore did the Jews persecute Jesus, and sought to slay him, because he had done these things on the sabbath day.',
   'καὶ διὰ τοῦτο ἐδίωκον οἱ Ἰουδαῖοι τὸν Ἰησοῦν καὶ ἐζήτουν αὐτὸν ἀποκτεῖναι ὅτι ταῦτα ἐποίει ἐν σαββάτῳ',
   'kai dia touto ediōkon hoi Ioudaioi ton Iēsoun kai ezētoun auton apokteinai hoti tauta epoiei en sabbatō',
   '''Persecuted'' (ediōkon — pursued, harassed, persecuted). ''Sought to slay him'' (ezētoun auton apokteinai — were seeking to kill him). The persecution is not for the healing but for doing it on the Sabbath. The imperfect tenses (ediōkon, ezētoun) indicate ongoing, sustained hostility. This is the first mention of a plot to kill Jesus in John (cf. 7:1, 19, 25; 8:37, 40; 11:53).',
   NULL),
  (17, 'But Jesus answered them, My Father worketh hitherto, and I work.',
   'ὁ δὲ Ἰησοῦς ἀπεκρίνατο αὐτοῖς Ὁ πατήρ μου ἕως ἄρτι ἐργάζεται κἀγὼ ἐργάζομαι',
   'ho de Iēsous apekrinato autois Ho patēr mou heōs arti ergazetai kagō ergazomai',
   '''My Father worketh hitherto'' (ho patēr mou heōs arti ergazetai — my Father is working until now). ''And I work'' (kagō ergazomai — and I am working). The rabbis acknowledged that God continues to work on the Sabbath (sustaining creation, giving life, judging the dead — activities that cannot cease). Jesus claims the same prerogative: as the Father works continuously, so does the Son. ''My Father'' (ho patēr mou — not ''our Father'' but ''my Father'') claims a unique filial relationship. The implications are staggering: Jesus claims to operate on the same level as God.',
   'This verse is the trigger for the entire discourse of vv.19-47. The Jewish leaders correctly understand Jesus'' claim: (1) He calls God ''my Father'' in a unique, exclusive sense. (2) He claims the right to work as God works — even on the Sabbath. (3) He is ''making himself equal with God'' (v.18). Their conclusion is theologically accurate: Jesus is claiming deity. Their error is in rejecting the claim rather than accepting it. The discourse that follows is Jesus'' sustained defense of this equality — not as an independent rival to God, but as the Son who does exactly what the Father does.'),
  (18, 'Therefore the Jews sought the more to kill him, because he not only had broken the sabbath, but said also that God was his Father, making himself equal with God.',
   'διὰ τοῦτο οὖν μᾶλλον ἐζήτουν αὐτὸν οἱ Ἰουδαῖοι ἀποκτεῖναι ὅτι οὐ μόνον ἔλυεν τὸ σάββατον ἀλλὰ καὶ πατέρα ἴδιον ἔλεγεν τὸν θεόν ἴσον ἑαυτὸν ποιῶν τῷ θεῷ',
   'dia touto oun mallon ezētoun auton hoi Ioudaioi apokteinai hoti ou monon elyen to sabbaton alla kai patera idion elegen ton theon ison heauton poiōn tō theō',
   '''Making himself equal with God'' (ison heauton poiōn tō theō — making himself equal/identical to God). Isos means ''equal in quality, quantity, and nature.'' The Jews understand Jesus correctly: (1) He broke the Sabbath (or rather, claimed divine authority over it). (2) He called God ''his own Father'' (patera idion — his own, personal Father; idion emphasises the unique, exclusive nature of the claim). (3) He made himself equal with God. These are not misunderstandings but accurate perceptions. Jesus does not correct them — instead, he amplifies the claims in vv.19-47.',
   'The Jewish charge that Jesus was ''making himself equal with God'' is confirmed, not denied, by the discourse that follows. Jesus does not say ''You misunderstand me — I am not equal with God.'' Instead, he explains the nature of his equality: it is not independent autonomy (v.19: ''The Son can do nothing of himself'') but perfect correspondence with the Father (''what things soever he doeth, these also doeth the Son likewise''). The Son is equal in nature but subordinate in role: the Father sends, the Son obeys; the Father gives, the Son receives; yet what the Father does, the Son does equally. This is the pattern later formulated as the doctrine of the Trinity.'),
  (19, 'Then answered Jesus and said unto them, Verily, verily, I say unto you, The Son can do nothing of himself, but what he seeth the Father do: for what things soever he doeth, these also doeth the Son likewise.',
   'ἀπεκρίνατο οὖν ὁ Ἰησοῦς καὶ εἶπεν αὐτοῖς Ἀμὴν ἀμὴν λέγω ὑμῖν οὐ δύναται ὁ υἱὸς ποιεῖν ἀφ᾽ ἑαυτοῦ οὐδέν ἐὰν μή τι βλέπῃ τὸν πατέρα ποιοῦντα ἃ γὰρ ἂν ἐκεῖνος ποιῇ ταῦτα καὶ ὁ υἱὸς ὁμοίως ποιεῖ',
   'apekrinato oun ho Iēsous kai eipen autois Amēn amēn legō hymin ou dynatai ho huios poiein aph heautou ouden ean mē ti blepē ton patera poiounta ha gar an ekeinos poiē tauta kai ho huios homoiōs poiei',
   '''The Son can do nothing of himself'' (ou dynatai ho huios poiein aph heautou ouden — the Son is not able to do anything from himself). This is not a confession of weakness but of perfect unity: the Son does not act independently because he and the Father always act in concert. ''What he seeth the Father do'' (blepē ton patera poiounta — sees the Father doing). ''These also doeth the Son likewise'' (tauta kai ho huios homoiōs poiei — these same things the Son also does in the same way). The Son''s works are not different from or inferior to the Father''s — they are the same works done in the same manner. This is equality expressed through relational harmony.',
   NULL),
  (20, 'For the Father loveth the Son, and sheweth him all things that himself doeth: and he will shew him greater works than these, that ye may marvel.',
   'ὁ γὰρ πατὴρ φιλεῖ τὸν υἱὸν καὶ πάντα δείκνυσιν αὐτῷ ἃ αὐτὸς ποιεῖ καὶ μείζονα τούτων δείξει αὐτῷ ἔργα ἵνα ὑμεῖς θαυμάζητε',
   'ho gar patēr philei ton huion kai panta deiknusin autō ha autos poiei kai meizona toutōn deixei autō erga hina hymeis thaumazēte',
   '''The Father loveth the Son'' (ho patēr philei ton huion — uses phileō, denoting warm affection, intimate love, as between close friends or family; cf. 3:35 which uses agapaō). ''Sheweth him all things'' (panta deiknusin autō — shows, reveals everything to him). The Father holds nothing back from the Son — complete transparency, complete trust. ''Greater works'' (meizona erga) — the healing at Bethesda was impressive, but greater works are coming: raising the dead (vv.21, 25-29) and executing final judgment (v.22).',
   NULL),
  (21, 'For as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will.',
   'ὥσπερ γὰρ ὁ πατὴρ ἐγείρει τοὺς νεκροὺς καὶ ζωοποιεῖ οὕτως καὶ ὁ υἱὸς οὓς θέλει ζωοποιεῖ',
   'hōsper gar ho patēr egeirei tous nekrous kai zōopoiei houtōs kai ho huios hous thelei zōopoiei',
   '''As the Father raiseth up the dead and quickeneth them'' (hōsper ho patēr egeirei tous nekrous kai zōopoiei — just as the Father raises the dead and gives them life). ''Even so the Son quickeneth whom he will'' (houtōs kai ho huios hous thelei zōopoiei — so also the Son gives life to whomever he wills). Giving life to the dead is exclusively a divine prerogative in the OT (Deuteronomy 32:39; 1 Samuel 2:6; 2 Kings 5:7). Jesus claims this power as his own — and exercises it sovereignly (''whom he will''). This is not delegated permission but shared divine authority.',
   'The claim to raise the dead and give life is one of the most extraordinary in all of Scripture. In the OT, giving life is God''s exclusive prerogative: ''I kill, and I make alive'' (Deuteronomy 32:39). ''The LORD killeth, and maketh alive: he bringeth down to the grave, and bringeth up'' (1 Samuel 2:6). When Naaman came for healing, the king of Israel said, ''Am I God, to kill and to make alive?'' (2 Kings 5:7). Jesus claims precisely this power — and not as a mere instrument but sovereignly: ''whom he will'' (hous thelei). The Son''s will in giving life is identical to the Father''s will.'),
  (22, 'For the Father judgeth no man, but hath committed all judgment unto the Son:',
   'οὐδὲ γὰρ ὁ πατὴρ κρίνει οὐδένα ἀλλὰ τὴν κρίσιν πᾶσαν δέδωκεν τῷ υἱῷ',
   'oude gar ho patēr krinei oudena alla tēn krisin pasan dedōken tō huiō',
   '''Hath committed all judgment unto the Son'' (tēn krisin pasan dedōken tō huiō — has given all judgment to the Son; perfect tense: a completed, permanent transfer). Judgment, like giving life (v.21), is a divine prerogative. The Father has entrusted the entire judicial function to the Son. This fulfils Daniel 7:13-14, where ''one like the Son of man'' receives authority and dominion. The transfer is complete — ''all judgment'' (pasan), without exception.',
   NULL),
  (23, 'That all men should honour the Son, even as they honour the Father. He that honoureth not the Son honoureth not the Father which hath sent him.',
   'ἵνα πάντες τιμῶσιν τὸν υἱὸν καθὼς τιμῶσιν τὸν πατέρα ὁ μὴ τιμῶν τὸν υἱὸν οὐ τιμᾷ τὸν πατέρα τὸν πέμψαντα αὐτόν',
   'hina pantes timōsin ton huion kathōs timōsin ton patera ho mē timōn ton huion ou tima ton patera ton pempsanta auton',
   '''Honour the Son, even as they honour the Father'' (timōsin ton huion kathōs timōsin ton patera — the same honour, the same reverence, the same worship). ''Even as'' (kathōs — in the same manner, to the same degree). This is a demand for equal honour — the kind of honour due to God. ''He that honoureth not the Son honoureth not the Father'' — to reject the Son is to reject the Father who sent him. There is no path to the Father that bypasses the Son (cf. 14:6). No one can claim to worship God while dishonouring Jesus.',
   'John 5:23 is one of the clearest statements of Christ''s deity in the NT. The demand for equal honour with the Father would be blasphemous if Jesus were merely human. If Jesus is a created being — even the highest — to demand the same honour as the Creator would be idolatry. Yet Jesus makes exactly this demand, and the Father endorses it by giving all judgment to the Son (v.22). The logic is clear: equal work (v.19), equal life-giving power (v.21), equal judicial authority (v.22), therefore equal honour (v.23). To deny the Son''s deity is to deny the Father who sent him.'),
  (24, 'Verily, verily, I say unto you, He that heareth my word, and believeth on him that sent me, hath everlasting life, and shall not come into condemnation; but is passed from death unto life.',
   'ἀμὴν ἀμὴν λέγω ὑμῖν ὅτι ὁ τὸν λόγον μου ἀκούων καὶ πιστεύων τῷ πέμψαντί με ἔχει ζωὴν αἰώνιον καὶ εἰς κρίσιν οὐκ ἔρχεται ἀλλὰ μεταβέβηκεν ἐκ τοῦ θανάτου εἰς τὴν ζωήν',
   'amēn amēn legō hymin hoti ho ton logon mou akouōn kai pisteuōn tō pempsanti me echei zōēn aiōnion kai eis krisin ouk erchetai alla metabebēken ek tou thanatou eis tēn zōēn',
   '''Heareth my word'' (ton logon mou akouōn — present participle: the one hearing, listening to my word). ''Believeth on him that sent me'' (pisteuōn tō pempsanti me — believing the one who sent me; faith in the Son is faith in the Father). ''Hath everlasting life'' (echei zōēn aiōnion — present tense: possesses eternal life now). ''Shall not come into condemnation'' (eis krisin ouk erchetai — does not come into judgment). ''Is passed from death unto life'' (metabebēken ek tou thanatou eis tēn zōēn — has crossed over, transferred; perfect tense: a completed transition with permanent results). Three assurances: (1) present possession of eternal life, (2) no future condemnation, (3) the transition from death to life is already accomplished.',
   'John 5:24 is one of the most comprehensive salvation statements in Scripture. It contains: (1) The condition — hearing Christ''s word and believing the Father who sent him. (2) The present result — ''hath'' (echei, present tense) everlasting life. Eternal life is not a future reward but a present possession. (3) The judicial result — ''shall not come into condemnation'' — the believer will never face judgment for sin. (4) The ontological result — ''is passed from death unto life'' (metabebēken — perfect tense: has permanently crossed over). The believer has already made the decisive transition from the realm of death to the realm of life. This parallels 3:18 and anticipates Romans 8:1.'),
  (25, 'Verily, verily, I say unto you, The hour is coming, and now is, when the dead shall hear the voice of the Son of God: and they that hear shall live.',
   'ἀμὴν ἀμὴν λέγω ὑμῖν ὅτι ἔρχεται ὥρα καὶ νῦν ἐστιν ὅτε οἱ νεκροὶ ἀκούσονται τῆς φωνῆς τοῦ υἱοῦ τοῦ θεοῦ καὶ οἱ ἀκούσαντες ζήσονται',
   'amēn amēn legō hymin hoti erchetai hōra kai nyn estin hote hoi nekroi akousontai tēs phōnēs tou huiou tou theou kai hoi akousantes zēsontai',
   '''The hour is coming, and now is'' (erchetai hōra kai nyn estin — the ''already but not yet'' of Jesus'' ministry). ''The dead shall hear the voice of the Son of God'' (hoi nekroi akousontai tēs phōnēs tou huiou tou theou). The ''dead'' here are the spiritually dead (as distinct from the physically dead in vv.28-29). ''They that hear shall live'' — hearing here means responsive, faith-filled hearing that results in spiritual life. The voice of the Son of God has life-giving power: as God spoke creation into existence (Genesis 1:3), so the Son speaks spiritual life into dead souls.',
   NULL),
  (26, 'For as the Father hath life in himself; so hath he given to the Son to have life in himself;',
   'ὥσπερ γὰρ ὁ πατὴρ ἔχει ζωὴν ἐν ἑαυτῷ οὕτως ἔδωκεν καὶ τῷ υἱῷ ζωὴν ἔχειν ἐν ἑαυτῷ',
   'hōsper gar ho patēr echei zōēn en heautō houtōs edōken kai tō huiō zōēn echein en heautō',
   '''Life in himself'' (zōēn en heautō — self-existent, self-sustaining, underived life). God''s life is not received from any external source — it is intrinsic, essential, self-generated. ''Given to the Son to have life in himself'' — the Son possesses the same quality of self-existent life. The ''giving'' refers to the eternal relationship within the Trinity, not a temporal grant: the Father eternally generates the Son, who eternally possesses the same divine life. No created being has ''life in himself'' — all creature life is derived and dependent. The Son''s possession of self-existent life is a mark of his full deity.',
   'This is one of the most metaphysically profound statements in Scripture. Only God has life ''in himself'' — aseity, self-existence. All other life is derived (from God), dependent (on God), and contingent (can cease). The Son possesses the same quality of life as the Father — not derived from creation but inherent in his divine nature. The word ''given'' (edōken) does not imply that the Son once lacked this life and then received it; rather, it describes the eternal relationship within the Godhead: the Father eternally communicates his nature to the Son, and the Son eternally possesses it. This is the theological basis for Jesus'' claim to give life (v.21) and to execute judgment (v.22, 27).'),
  (27, 'And hath given him authority to execute judgment also, because he is the Son of man.',
   'καὶ ἐξουσίαν ἔδωκεν αὐτῷ καὶ κρίσιν ποιεῖν ὅτι υἱὸς ἀνθρώπου ἐστίν',
   'kai exousian edōken autō kai krisin poiein hoti huios anthrōpou estin',
   '''Authority'' (exousian — right, jurisdiction, delegated power). ''Because he is the Son of man'' (hoti huios anthrōpou estin — because he is Son of man; notably without the article, emphasising the quality of humanity). Jesus executes judgment because he is both divine (v.22: the Father gives all judgment to the Son) and human (v.27: as Son of man, he has experienced human life and can judge with experiential knowledge). The reference is to Daniel 7:13-14, where ''one like the Son of man'' receives authority, glory, and an everlasting kingdom. The judge of humanity is himself human — he judges from within, not from without.',
   NULL),
  (28, 'Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,',
   'μὴ θαυμάζετε τοῦτο ὅτι ἔρχεται ὥρα ἐν ᾗ πάντες οἱ ἐν τοῖς μνημείοις ἀκούσονται τῆς φωνῆς αὐτοῦ',
   'mē thaumazete touto hoti erchetai hōra en hē pantes hoi en tois mnēmeiois akousontai tēs phōnēs autou',
   '''All that are in the graves'' (pantes hoi en tois mnēmeiois — everyone in the tombs). The shift from v.25 is critical: v.25 speaks of the spiritually dead hearing now (''the hour... now is''); v.28 speaks of the physically dead hearing in the future (''the hour is coming'' — without ''and now is''). ''Shall hear his voice'' — the same voice that said ''Rise, take up thy bed'' (v.8) and that speaks spiritual life (v.25) will one day command universal, bodily resurrection.',
   NULL),
  (29, 'And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.',
   'καὶ ἐκπορεύσονται οἱ τὰ ἀγαθὰ ποιήσαντες εἰς ἀνάστασιν ζωῆς οἱ δὲ τὰ φαῦλα πράξαντες εἰς ἀνάστασιν κρίσεως',
   'kai ekporeusontai hoi ta agatha poiēsantes eis anastasin zōēs hoi de ta phaula praxantes eis anastasin kriseōs',
   '''Resurrection of life'' (anastasin zōēs — the resurrection that leads to life). ''Resurrection of damnation'' (anastasin kriseōs — the resurrection that leads to judgment/condemnation). Two universal resurrections leading to two destinies. ''Done good'' and ''done evil'' describe the fruit of faith and unbelief respectively (cf. 3:20-21): those who ''do truth'' come to the light; those who practice evil hate it. Good works are the evidence of faith (not the cause of salvation) — cf. v.24 where faith is the basis of passing from death to life.',
   'This verse affirms the doctrine of universal bodily resurrection — both the righteous and the wicked will rise. Jesus echoes Daniel 12:2: ''Many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.'' The two resurrections correspond to the two responses to the Son throughout John: faith (leading to life) and unbelief (leading to judgment). Works are mentioned as evidence, not meritorious cause — the basis of salvation remains faith in the Son (v.24). The one who believes has already passed from death to life; the resurrection is the physical consummation of what has already been spiritually accomplished.'),
  (30, 'I can of mine own self do nothing: as I hear, I judge: and my judgment is just; because I seek not mine own will, but the will of the Father which hath sent me.',
   'οὐ δύναμαι ἐγὼ ποιεῖν ἀπ᾽ ἐμαυτοῦ οὐδέν καθὼς ἀκούω κρίνω καὶ ἡ κρίσις ἡ ἐμὴ δικαία ἐστίν ὅτι οὐ ζητῶ τὸ θέλημα τὸ ἐμὸν ἀλλὰ τὸ θέλημα τοῦ πέμψαντός με',
   'ou dynamai egō poiein ap emautou ouden kathōs akouō krinō kai hē krisis hē emē dikaia estin hoti ou zētō to thelēma to emon alla to thelēma tou pempsantos me',
   '''I can of mine own self do nothing'' (ou dynamai egō poiein ap emautou ouden — echoing v.19). ''As I hear, I judge'' — Jesus'' judgment is not autonomous but derived from perfect communion with the Father. ''My judgment is just'' (hē krisis hē emē dikaia estin — my judgment is righteous, fair). ''I seek not mine own will but the will of the Father'' — the guarantee of righteous judgment is the Son''s perfect submission to the Father''s will. This is not weakness but the highest form of divine operation: Father and Son acting in perfect harmony.',
   NULL),
  (31, 'If I bear witness of myself, my witness is not true.',
   'ἐὰν ἐγὼ μαρτυρῶ περὶ ἐμαυτοῦ ἡ μαρτυρία μου οὐκ ἔστιν ἀληθής',
   'ean egō martyrō peri emautou hē martyria mou ouk estin alēthēs',
   '''If I bear witness of myself, my witness is not true'' — in Jewish law, self-testimony was insufficient (Deuteronomy 19:15: two or three witnesses required). Jesus is not saying his testimony is false but that self-testimony alone would not be legally valid. He will now present four independent witnesses (vv.33-39) to corroborate his claims. In 8:14, Jesus will say ''Though I bear record of myself, yet my record is true'' — there, he asserts the inherent truthfulness of his testimony even if the legal convention requires external corroboration.',
   NULL),
  (32, 'There is another that beareth witness of me; and I know that the witness which he witnesseth of me is true.',
   'ἄλλος ἐστὶν ὁ μαρτυρῶν περὶ ἐμοῦ καὶ οἶδα ὅτι ἀληθής ἐστιν ἡ μαρτυρία ἣν μαρτυρεῖ περὶ ἐμοῦ',
   'allos estin ho martyrōn peri emou kai oida hoti alēthēs estin hē martyria hēn martyrei peri emou',
   '''Another'' (allos — another of the same kind). Most interpreters identify this ''another'' as the Father (cf. vv.37-38; 8:18), though John the Baptist is named next (v.33). The Father''s testimony undergirds all other testimony. ''I know'' (oida — perfect knowledge, absolute certainty). Jesus is certain of the Father''s testimony about him.',
   NULL),
  (33, 'Ye sent unto John, and he bare witness unto the truth.',
   'ὑμεῖς ἀπεστάλκατε πρὸς Ἰωάννην καὶ μεμαρτύρηκεν τῇ ἀληθείᾳ',
   'hymeis apestalkate pros Iōannēn kai memartyrēken tē alētheia',
   '''Ye sent unto John'' — referring to the delegation of priests and Levites in 1:19-28. ''He bare witness unto the truth'' (memartyrēken tē alētheia — has testified to the truth; perfect tense: his testimony stands). John the Baptist is the first witness Jesus cites — Witness #1. His testimony was public, authoritative, and pointed directly to Jesus as the Lamb of God (1:29, 36), the Son of God (1:34).',
   NULL),
  (34, 'But I receive not testimony from man: but these things I say, that ye might be saved.',
   'ἐγὼ δὲ οὐ παρὰ ἀνθρώπου τὴν μαρτυρίαν λαμβάνω ἀλλὰ ταῦτα λέγω ἵνα ὑμεῖς σωθῆτε',
   'egō de ou para anthrōpou tēn martyrian lambanō alla tauta legō hina hymeis sōthēte',
   '''I receive not testimony from man'' — Jesus does not depend on human endorsement for validation. He cites John''s testimony not for his own benefit but for theirs: ''that ye might be saved'' (hina hymeis sōthēte — so that you might be saved). Even in confrontation, Jesus'' purpose is salvation, not condemnation (cf. 3:17).',
   NULL),
  (35, 'He was a burning and a shining light: and ye were willing for a season to rejoice in his light.',
   'ἐκεῖνος ἦν ὁ λύχνος ὁ καιόμενος καὶ φαίνων ὑμεῖς δὲ ἠθελήσατε ἀγαλλιαθῆναι πρὸς ὥραν ἐν τῷ φωτὶ αὐτοῦ',
   'ekeinos ēn ho lychnos ho kaiomenos kai phainōn hymeis de ēthelēsate agalliathēnai pros hōran en tō phōti autou',
   '''A burning and a shining light'' (ho lychnos ho kaiomenos kai phainōn — the lamp that burns and shines). John is a lychnos (lamp), not the phōs (the Light itself — that is Jesus, 1:4-9; 8:12). A lamp burns fuel — John''s ministry cost him everything, eventually his life. ''For a season'' (pros hōran — for an hour, temporarily). The Jewish leaders enjoyed John''s popularity for a time but did not heed his testimony when it pointed to Jesus.',
   NULL),
  (36, 'But I have greater witness than that of John: for the works which the Father hath given me to finish, the same works that I do, bear witness of me, that the Father hath sent me.',
   'ἐγὼ δὲ ἔχω τὴν μαρτυρίαν μείζω τοῦ Ἰωάννου τὰ γὰρ ἔργα ἃ ἔδωκέν μοι ὁ πατὴρ ἵνα τελειώσω αὐτά αὐτὰ τὰ ἔργα ἃ ἐγὼ ποιῶ μαρτυρεῖ περὶ ἐμοῦ ὅτι ὁ πατὴρ με ἀπέσταλκεν',
   'egō de echō tēn martyrian meizō tou Iōannou ta gar erga ha edōken moi ho patēr hina teleiōsō auta auta ta erga ha egō poiō martyrei peri emou hoti ho patēr me apestalken',
   '''Greater witness'' (tēn martyrian meizō — a testimony greater than John''s). Witness #2: Jesus'' works (ta erga — the works, the signs). The miracles are not mere displays of power but testimonies that the Father sent the Son. ''Given me to finish'' (teleiōsō — to bring to completion; the same word in 4:34 and 19:30). Each work Jesus performs is a word from the Father, a revelation of the Father''s will and power operating through the Son.',
   NULL),
  (37, 'And the Father himself, which hath sent me, hath borne witness of me. Ye have neither heard his voice at any time, nor seen his shape.',
   'καὶ ὁ πέμψας με πατὴρ αὐτὸς μεμαρτύρηκεν περὶ ἐμοῦ οὔτε φωνὴν αὐτοῦ ἀκηκόατε πώποτε οὔτε εἶδος αὐτοῦ ἑωράκατε',
   'kai ho pempsas me patēr autos memartyrēken peri emou oute phōnēn autou akēkoate pōpote oute eidos autou heōrakate',
   'Witness #3: The Father himself (ho pempsas me patēr autos — the Father who sent me, he himself). ''Hath borne witness'' (memartyrēken — perfect tense: has testified and the testimony stands). The Father''s testimony may refer to the voice at Jesus'' baptism (Matthew 3:17), or more broadly to the entire OT revelation, or to the inner testimony of the Spirit. ''Neither heard his voice... nor seen his shape'' — a devastating indictment: they claim to know God but have never truly heard him or perceived him. If they had, they would recognise his Son.',
   NULL),
  (38, 'And ye have not his word abiding in you: for whom he hath sent, him ye believe not.',
   'καὶ τὸν λόγον αὐτοῦ οὐκ ἔχετε μένοντα ἐν ὑμῖν ὅτι ὃν ἀπέστειλεν ἐκεῖνος τούτῳ ὑμεῖς οὐ πιστεύετε',
   'kai ton logon autou ouk echete menonta en hymin hoti hon apesteilen ekeinos toutō hymeis ou pisteuete',
   '''Ye have not his word abiding in you'' (ton logon autou ouk echete menonta en hymin — his word does not remain/dwell in you). The proof that God''s word does not abide in them is their rejection of the one God sent. If God''s word truly lived in them, they would recognise God''s Son — the living Word (1:1-14). Abiding (menō) is a key Johannine concept (15:4-10): God''s word must not just be heard but must take up permanent residence in the heart.',
   NULL),
  (39, 'Search the scriptures; for in them ye think ye have eternal life: and they are they which testify of me.',
   'ἐρευνᾶτε τὰς γραφάς ὅτι ὑμεῖς δοκεῖτε ἐν αὐταῖς ζωὴν αἰώνιον ἔχειν καὶ ἐκεῖναί εἰσιν αἱ μαρτυροῦσαι περὶ ἐμοῦ',
   'ereunate tas graphas hoti hymeis dokeite en autais zōēn aiōnion echein kai ekeinai eisin hai martyrousai peri emou',
   '''Search the scriptures'' (ereunate tas graphas — either imperative ''Search!'' or indicative ''You search'' — both make sense). Witness #4: The Scriptures themselves. ''Ye think ye have eternal life'' in them — the scribes and Pharisees meticulously studied the OT but missed its central message. The Scriptures are not an end in themselves but a testimony pointing to Christ: ''they are they which testify of me'' (ekeinai eisin hai martyrousai peri emou). Every page, every prophecy, every type and shadow points to Jesus. To study Scripture without finding Christ is to miss its entire purpose.',
   'This verse establishes a hermeneutical principle of immense importance: the OT Scriptures are christocentric — they testify about Jesus. The Law (vv.45-46), the Prophets, and the Writings all point to Christ. Jesus himself will demonstrate this after his resurrection: ''beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself'' (Luke 24:27). To read the Bible without seeing Christ is to read it incorrectly. The Pharisees'' error was not insufficient study but misdirected study — they searched the Scriptures diligently but refused to come to the One the Scriptures proclaimed.'),
  (40, 'And ye will not come to me, that ye might have life.',
   'καὶ οὐ θέλετε ἐλθεῖν πρός με ἵνα ζωὴν ἔχητε',
   'kai ou thelete elthein pros me hina zōēn echēte',
   '''Ye will not come to me'' (ou thelete elthein pros me — you are not willing to come to me; thelete: you do not will, you refuse). The problem is not inability but unwillingness — not intellectual but volitional. Life (zōēn) is available in Christ; they refuse to come. This is the tragedy of unbelief: the light shines, the testimony is clear, the invitation is open — yet they will not come. ''That ye might have life'' — the purpose is generous, the offer is genuine, but the will is resistant.',
   NULL),
  (41, 'I receive not honour from men.',
   'δόξαν παρὰ ἀνθρώπων οὐ λαμβάνω',
   'doxan para anthrōpōn ou lambanō',
   '''I receive not honour from men'' (doxan para anthrōpōn ou lambanō — I do not accept glory from human beings). Jesus does not seek human approval or popularity. His authority comes from the Father, not from human endorsement. This makes his testimony reliable: he has no self-serving motive.',
   NULL),
  (42, 'But I know you, that ye have not the love of God in you.',
   'ἀλλ᾽ ἔγνωκα ὑμᾶς ὅτι τὴν ἀγάπην τοῦ θεοῦ οὐκ ἔχετε ἐν ἑαυτοῖς',
   'all egnōka hymas hoti tēn agapēn tou theou ouk echete en heautois',
   '''I know you'' (egnōka hymas — I have come to know you; perfect tense: thorough, settled knowledge). ''The love of God'' (tēn agapēn tou theou) — this can mean ''love for God'' (subjective genitive) or ''the love that comes from God'' (objective genitive); both are true. They claim to love God but reject God''s Son. Their rejection of Jesus reveals the absence of genuine love for God. True love for God always leads to receiving the one God has sent.',
   NULL),
  (43, 'I am come in my Father''s name, and ye receive me not: if another shall come in his own name, him ye will receive.',
   'ἐγὼ ἐλήλυθα ἐν τῷ ὀνόματι τοῦ πατρός μου καὶ οὐ λαμβάνετέ με ἐὰν ἄλλος ἔλθῃ ἐν τῷ ὀνόματι τῷ ἰδίῳ ἐκεῖνον λήψεσθε',
   'egō elēlytha en tō onomati tou patros mou kai ou lambanete me ean allos elthē en tō onomati tō idiō ekeinon lēpsesthe',
   '''In my Father''s name'' (en tō onomati tou patros mou — with the Father''s authority, as the Father''s representative). ''If another shall come in his own name'' — a warning about false messiahs who come with self-generated authority. History fulfilled this prediction: Bar Kokhba (AD 132-135) was accepted by Rabbi Akiva as the Messiah, leading to disaster. The pattern persists: those who reject Christ become vulnerable to accepting counterfeits.',
   NULL),
  (44, 'How can ye believe, which receive honour one of another, and seek not the honour that cometh from God only?',
   'πῶς δύνασθε ὑμεῖς πιστεῦσαι δόξαν παρὰ ἀλλήλων λαμβάνοντες καὶ τὴν δόξαν τὴν παρὰ τοῦ μόνου θεοῦ οὐ ζητεῖτε',
   'pōs dynasthe hymeis pisteusai doxan para allēlōn lambanontes kai tēn doxan tēn para tou monou theou ou zēteite',
   '''How can ye believe?'' (pōs dynasthe pisteusai — how are you able to believe?). The obstacle to faith is not intellectual but moral: they seek honour from one another (doxan para allēlōn — glory from each other, peer approval, human reputation) rather than the glory that comes from God alone. The craving for human approval makes faith impossible — one cannot simultaneously serve the opinion of man and the truth of God. This diagnosis of unbelief is penetrating: pride, not ignorance, is the root barrier.',
   NULL),
  (45, 'Do not think that I will accuse you to the Father: there is one that accuseth you, even Moses, in whom ye trust.',
   'μὴ δοκεῖτε ὅτι ἐγὼ κατηγορήσω ὑμῶν πρὸς τὸν πατέρα ἔστιν ὁ κατηγορῶν ὑμῶν Μωϋσῆς εἰς ὃν ὑμεῖς ἠλπίκατε',
   'mē dokeite hoti egō katēgorēsō hymōn pros ton patera estin ho katēgorōn hymōn Mōysēs eis hon hymeis ēlpikate',
   '''Moses, in whom ye trust'' (Mōysēs eis hon hymeis ēlpikate — Moses, in whom you have placed your hope; perfect tense: your settled, ongoing hope). The irony is devastating: Moses, their champion, becomes their accuser. They trust in Moses but have not understood him. Moses testified about Christ (v.46); to reject Christ is to reject Moses. Their own authority figure condemns them.',
   NULL),
  (46, 'For had ye believed Moses, ye would have believed me: for he wrote of me.',
   'εἰ γὰρ ἐπιστεύετε Μωϋσεῖ ἐπιστεύετε ἂν ἐμοί περὶ γὰρ ἐμοῦ ἐκεῖνος ἔγραψεν',
   'ei gar episteuete Mōysei episteuete an emoi peri gar emou ekeinos egrapsen',
   '''He wrote of me'' (peri gar emou ekeinos egrapsen — for concerning me that one wrote). Moses wrote about Christ: (1) the seed of the woman crushing the serpent (Genesis 3:15), (2) the blessing through Abraham''s seed (Genesis 12:3; 22:18), (3) the prophet like Moses (Deuteronomy 18:15-18), (4) Shiloh from Judah (Genesis 49:10), (5) the Passover lamb (Exodus 12), (6) the bronze serpent (Numbers 21:8-9, cf. John 3:14), (7) the entire sacrificial system pointing to Christ. The Pentateuch is christological — to believe Moses truly is to believe in the one Moses foretold.',
   NULL),
  (47, 'But if ye believe not his writings, how shall ye believe my words?',
   'εἰ δὲ τοῖς ἐκείνου γράμμασιν οὐ πιστεύετε πῶς τοῖς ἐμοῖς ῥήμασιν πιστεύσετε',
   'ei de tois ekeinou grammasin ou pisteuete pōs tois emois rhēmasin pisteusete',
   '''His writings'' (tois ekeinou grammasin — that one''s writings; grammata: written documents, the Pentateuch). ''My words'' (tois emois rhēmasin — my spoken words). The argument is a fortiori (from the lesser to the greater): if you do not believe the written words of Moses (which you claim to revere), how will you believe the spoken words of Jesus (whom you are rejecting)? The written word and the living Word testify in harmony; to reject one is to reject both. This closing question leaves the Jewish leaders with no defense — their own Scriptures accuse them.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'John' AND c.chapter_number = 5;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, greek_word, transliteration, strongs_number, definition, word_order)
SELECT v.id, ws.greek_word, ws.transliteration, ws.strongs_number, ws.definition, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑγιής', 'hygiēs', 'G5199',
   'Whole, sound, healthy, well; complete restoration to full function.',
   'Jesus asks ''Wilt thou be made whole?'' (hygiēs genesthai, v.6) — the same word is used in v.9 (''was made whole''), v.11 (''he that made me whole''), v.14 (''thou art made whole''), and v.15 (''made him whole''). The emphasis is not merely on the removal of sickness but on the restoration of complete wholeness. This is the character of Jesus'' healing: not partial improvement but total restoration. The English word ''hygiene'' derives from this root.',
   1),
  ('ἐργάζομαι', 'ergazomai', 'G2038',
   'To work, to labour, to be active, to produce; to carry on a trade or business.',
   'In v.17, Jesus says ''My Father worketh hitherto, and I work'' (ho patēr mou heōs arti ergazetai kagō ergazomai). The rabbis acknowledged that God works on the Sabbath: he sustains creation, gives life at birth, and judges souls at death. Jesus claims the same divine prerogative: his Sabbath healing is the continuation of the Father''s unceasing work. Father and Son work together — the same work, at the same time, in the same manner. The verb connects to ergon (work, v.20, 36) and to the ''works'' the Father gives Jesus to finish.',
   2),
  ('ἴσος', 'isos', 'G2470',
   'Equal, equivalent, identical in quality, quantity, or nature; the same as.',
   'In v.18, the Jews accuse Jesus of ''making himself equal with God'' (ison heauton poiōn tō theō). Isos means equal in the fullest sense — the same in essence, not merely similar or comparable. This is the central christological issue in John 5: is Jesus truly equal with God? Jesus'' discourse (vv.19-47) confirms rather than denies the equality — but defines it as functional unity, not independent rivalry. The Son does everything the Father does (v.19), gives life as the Father does (v.21), judges as the Father does (v.22), and receives equal honour (v.23).',
   3),
  ('ζωοποιέω', 'zōopoieō', 'G2227',
   'To make alive, to give life, to quicken; to cause to live, to vivify dead things.',
   'From zōē (life) + poieō (to make). In v.21, ''the Son quickeneth whom he will'' (ho huios hous thelei zōopoiei). Zōopoieō is used of both spiritual vivification (the present giving of spiritual life, v.25: ''the dead shall hear... and live'') and bodily resurrection (the future raising of all in the graves, vv.28-29). The power to give life is God''s exclusive prerogative (Deuteronomy 32:39; 1 Samuel 2:6; 2 Kings 5:7); Jesus claims it as his own. Paul uses the same verb of the Spirit''s work: ''the Spirit giveth life'' (2 Corinthians 3:6; Romans 8:11).',
   4),
  ('κρίσις', 'krisis', 'G2920',
   'Judgment, verdict, decision, the act of judging; the process and result of judicial evaluation.',
   'Krisis occurs 11 times in John. In ch.5: the Father has committed all krisis to the Son (v.22), the believer does not come into krisis (v.24), the resurrection leads to krisis of damnation or life (v.29), Jesus'' krisis is just (v.30). Krisis in John has both present (3:19: ''this is the condemnation, that light is come'') and future (5:28-29: the final resurrection judgment) dimensions. The Son is both Saviour (3:17) and Judge (5:22) — two aspects of the same authority.',
   5),
  ('μαρτυρία', 'martyria', 'G3141',
   'Testimony, witness, evidence; the act or content of bearing witness.',
   'From martys (witness). Martyria is a central Johannine concept: the entire Gospel is structured around testimonies to Jesus'' identity. In ch.5, Jesus presents four witnesses: (1) John the Baptist (v.33), (2) Jesus'' works (v.36), (3) the Father (v.37), (4) the Scriptures (v.39). The cumulative testimony is overwhelming — multiple witnesses confirming a single truth (cf. Deuteronomy 19:15: ''at the mouth of two or three witnesses''). Martyria eventually gave rise to the English word ''martyr'' — one whose testimony costs their life.',
   6),
  ('γραφή', 'graphē', 'G1124',
   'Scripture, writing, the written word; the sacred writings of the Old Testament.',
   'In v.39, Jesus says ''Search the scriptures'' (ereunate tas graphas). Graphē refers to the OT Scriptures — the Law, Prophets, and Writings. Jesus affirms that the entire OT testifies about him (v.39: ''they are they which testify of me''). He also affirms Moses'' authorship of the Pentateuch (v.46: ''he wrote of me''). The Scriptures are not an end in themselves but a witness to Christ. To study them without coming to Christ is to miss their purpose. Jesus places his own words on the same level as Scripture (v.47: ''his writings... my words'').',
   7),
  ('ἀνάστασις', 'anastasis', 'G386',
   'Resurrection, rising up, standing up again; the raising of the dead to life.',
   'From ana (up, again) + histēmi (to stand). In vv.28-29, Jesus announces a universal resurrection: ''all that are in the graves shall hear his voice, and shall come forth'' — some to the ''resurrection of life'' (anastasin zōēs), others to the ''resurrection of damnation'' (anastasin kriseōs). John 5 presents two phases of resurrection: (1) present spiritual resurrection — the dead hearing the Son''s voice and living now (v.25), and (2) future bodily resurrection — all in the graves coming forth at the last day (vv.28-29). Martha confesses the latter in 11:24; Jesus declares himself to be the former in 11:25.',
   8)
) AS ws(greek_word, transliteration, strongs_number, definition, word_order)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 5
  AND v2.verse_number = CASE ws.word_order
    WHEN 1 THEN 6
    WHEN 2 THEN 17
    WHEN 3 THEN 18
    WHEN 4 THEN 21
    WHEN 5 THEN 22
    WHEN 6 THEN 36
    WHEN 7 THEN 39
    WHEN 8 THEN 29
  END
) v;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, referenced_verse, relationship_type, note)
SELECT v.id, cr.referenced_verse, cr.relationship_type, cr.note
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2: Pool of Bethesda
  (2, 'Nehemiah 3:1', 'context', 'The Sheep Gate near the temple — the location of Bethesda pool'),
  -- v.5: Thirty-eight years
  (5, 'Deuteronomy 2:14', 'allusion', 'Israel wandered 38 years from Kadesh-barnea — a possible parallel to this man''s waiting'),
  -- v.8: Rise, take up thy bed
  (8, 'Mark 2:9-12', 'parallel', '''Take up thy bed, and walk'' — the Synoptic healing of the paralytic with the same command'),
  (8, 'Acts 3:6-8', 'parallel', '''In the name of Jesus Christ of Nazareth rise up and walk'' — Peter''s healing echoes Jesus'''),
  -- v.9: On the same day was the sabbath
  (9, 'Mark 3:1-6', 'parallel', 'Healing on the Sabbath — the Synoptic controversy over the man with the withered hand'),
  (9, 'Luke 13:10-17', 'parallel', 'Healing the bent woman on the Sabbath — ''ought not this woman... be loosed?'''),
  (9, 'Luke 14:1-6', 'parallel', '''Is it lawful to heal on the sabbath day?'' — Jesus challenges the Pharisees'),
  -- v.14: Sin no more
  (14, 'John 8:11', 'parallel', '''Go, and sin no more'' — the same command to the woman caught in adultery'),
  (14, 'John 9:3', 'contrast', '''Neither hath this man sinned, nor his parents'' — not all suffering is caused by personal sin'),
  -- v.17: My Father worketh hitherto
  (17, 'John 10:30', 'thematic', '''I and my Father are one'' — the unity of Father and Son in work and nature'),
  (17, 'John 14:10', 'thematic', '''The Father that dwelleth in me, he doeth the works'''),
  -- v.18: Equal with God
  (18, 'Philippians 2:6', 'thematic', '''Who, being in the form of God, thought it not robbery to be equal with God'''),
  (18, 'John 10:33', 'parallel', '''Thou, being a man, makest thyself God'' — the same charge repeated'),
  -- v.19: The Son does what the Father does
  (19, 'John 8:28-29', 'thematic', '''I do nothing of myself; but as my Father hath taught me, I speak these things'''),
  (19, 'John 14:10', 'thematic', '''The words that I speak unto you I speak not of myself: but the Father that dwelleth in me'''),
  -- v.21: The Son quickeneth whom he will
  (21, 'Deuteronomy 32:39', 'allusion', '''I kill, and I make alive'' — giving life is God''s exclusive prerogative'),
  (21, '1 Samuel 2:6', 'allusion', '''The LORD killeth, and maketh alive: he bringeth down to the grave, and bringeth up'''),
  (21, '2 Kings 5:7', 'allusion', '''Am I God, to kill and to make alive?'' — the king recognises this as divine work'),
  (21, 'John 11:25-26', 'thematic', '''I am the resurrection, and the life'' — Jesus claims to be the source of life'),
  (21, 'John 11:43-44', 'parallel', '''Lazarus, come forth!'' — the Son gives life to the dead by his voice'),
  -- v.22: All judgment to the Son
  (22, 'Daniel 7:13-14', 'prophecy', '''One like the Son of man... given dominion, and glory, and a kingdom'''),
  (22, 'Acts 17:31', 'thematic', '''He hath appointed a day, in the which he will judge the world... by that man whom he hath ordained'''),
  (22, 'Matthew 25:31-32', 'thematic', '''The Son of man shall sit upon the throne of his glory... and he shall separate them'''),
  -- v.23: Honour the Son as the Father
  (23, 'Hebrews 1:6', 'thematic', '''Let all the angels of God worship him'' — the Son receives worship due to God alone'),
  (23, 'Revelation 5:13', 'thematic', '''Blessing, and honour, and glory, and power'' — the Lamb receives equal honour with God'),
  -- v.24: Passed from death unto life
  (24, 'John 3:18', 'parallel', '''He that believeth on him is not condemned'' — the believer''s judicial standing'),
  (24, 'Romans 8:1', 'thematic', '''There is therefore now no condemnation to them which are in Christ Jesus'''),
  (24, '1 John 3:14', 'thematic', '''We know that we have passed from death unto life, because we love the brethren'''),
  -- v.25: The dead shall hear
  (25, 'Ephesians 2:1, 5', 'thematic', '''You hath he quickened, who were dead in trespasses and sins'''),
  (25, 'Colossians 2:13', 'thematic', '''You, being dead in your sins... hath he quickened together with him'''),
  -- v.26: Life in himself
  (26, 'John 1:4', 'thematic', '''In him was life; and the life was the light of men'''),
  (26, 'John 11:25', 'thematic', '''I am the resurrection, and the life'''),
  (26, 'John 14:6', 'thematic', '''I am the way, the truth, and the life'''),
  -- v.28-29: Resurrection of life and damnation
  (29, 'Daniel 12:2', 'prophecy', '''Many... shall awake, some to everlasting life, and some to shame and everlasting contempt'''),
  (29, 'Acts 24:15', 'thematic', '''There shall be a resurrection of the dead, both of the just and unjust'''),
  (29, 'Revelation 20:12-15', 'thematic', 'The great white throne judgment — ''the dead were judged... according to their works'''),
  -- v.35: Burning and shining light
  (35, 'John 1:6-8', 'parallel', '''There was a man sent from God, whose name was John... to bear witness of that Light'''),
  -- v.36: The works bear witness
  (36, 'John 10:25', 'parallel', '''The works that I do in my Father''s name, they bear witness of me'''),
  (36, 'John 10:37-38', 'parallel', '''If I do not the works of my Father, believe me not. But if I do... believe the works'''),
  (36, 'John 14:11', 'thematic', '''Believe me... or else believe me for the very works'' sake'''),
  -- v.39: Search the scriptures
  (39, 'Luke 24:27', 'parallel', '''Beginning at Moses and all the prophets, he expounded unto them... the things concerning himself'''),
  (39, 'Luke 24:44', 'parallel', '''All things must be fulfilled, which were written in the law of Moses, and in the prophets, and in the psalms, concerning me'''),
  (39, '2 Timothy 3:15', 'thematic', '''The holy scriptures, which are able to make thee wise unto salvation through faith... in Christ Jesus'''),
  -- v.46: Moses wrote of me
  (46, 'Genesis 3:15', 'prophecy', 'The seed of the woman — the first messianic prophecy (protoevangelium)'),
  (46, 'Genesis 49:10', 'prophecy', '''The sceptre shall not depart from Judah... until Shiloh come'''),
  (46, 'Deuteronomy 18:15', 'prophecy', '''The LORD thy God will raise up unto thee a Prophet like unto me'''),
  (46, 'Numbers 21:8-9', 'typology', 'The bronze serpent — type of Christ lifted up on the cross (cf. John 3:14)')
) AS cr(verse_number, referenced_verse, relationship_type, note)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 5 AND v2.verse_number = cr.verse_number
) v;
