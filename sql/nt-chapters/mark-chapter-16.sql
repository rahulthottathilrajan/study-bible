-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 16 — The Resurrection and the Great Commission
-- 20 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 16,
  'Mark 16 narrates the resurrection of Jesus and its aftermath. When the Sabbath is past, Mary Magdalene, Mary the mother of James, and Salome buy spices to anoint Jesus'' body (v.1). ''Very early in the morning the first day of the week'' they come to the tomb at sunrise (v.2). Their concern about the stone is resolved: ''they saw that the stone was rolled away: for it was very great'' (v.4). Entering the tomb, they see ''a young man sitting on the right side, clothed in a long white garment'' (v.5). The angel''s message is the gospel in miniature: ''Ye seek Jesus of Nazareth, which was crucified: he is risen; he is not here: behold the place where they laid him'' (v.6). He commissions them: ''Go your way, tell his disciples and Peter that he goeth before you into Galilee: there shall ye see him, as he said unto you'' (v.7). The women flee the tomb ''for they trembled and were amazed: neither said they any thing to any man; for they were afraid'' (v.8). The longer ending (vv.9-20) — debated among scholars as to its original authorship — records Jesus'' appearance to Mary Magdalene (v.9), to two disciples walking in the country (v.12), and to the eleven at table (v.14). Jesus gives the Great Commission: ''Go ye into all the world, and preach the gospel to every creature'' (v.15). ''He that believeth and is baptized shall be saved; but he that believeth not shall be damned'' (v.16). Signs shall follow believers (vv.17-18). Jesus ascends and sits at the right hand of God (v.19). The disciples go forth and preach everywhere, ''the Lord working with them, and confirming the word with signs following'' (v.20).',
  'He Is Risen — The Empty Tomb, the Angelic Announcement, and the Commission to the World',
  'ἐγείρω (egeirō)',
  'To raise, rouse, awaken — from the root meaning to wake from sleep. When applied to the dead, it means to bring back to life, to resurrect. ''He is risen'' (ēgerthē, v.6) is the aorist passive: ''he was raised'' — by God the Father. The passive voice indicates divine action: the Father raised the Son. Yet the active force is also present: Jesus rose. The resurrection is the Father''s vindication of everything Jesus said and did — the rejected stone, the crucified King, the forsaken Son is raised and enthroned. Egeirō transforms the cross from defeat into victory.',
  '["The Women at the Empty Tomb (vv.1-4): When the Sabbath is past Mary Magdalene Mary the mother of James and Salome buy spices to anoint Jesus'' body. Very early in the morning on the first day of the week they come to the tomb at sunrise. They ask who will roll away the stone but find it already rolled away — for it was very great","The Angelic Announcement (vv.5-8): Entering the tomb they see a young man in a long white garment sitting on the right side and are terrified. He says Be not affrighted — ye seek Jesus of Nazareth which was crucified — he is risen he is not here — behold the place where they laid him. Go tell his disciples and Peter that he goeth before you into Galilee. They flee trembling and amazed and say nothing to anyone for they were afraid","The Longer Ending: Appearances and Commission (vv.9-20): Jesus appears first to Mary Magdalene out of whom he had cast seven devils. She tells the disciples but they do not believe. He appears to two walking in the country. He appears to the eleven and rebukes their unbelief. He commissions them — Go into all the world and preach the gospel to every creature. He that believeth and is baptized shall be saved. Signs shall follow believers. Jesus is received up into heaven and sits at the right hand of God. The disciples preach everywhere the Lord confirming the word with signs following"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 20 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And when the sabbath was past, Mary Magdalene, and Mary the mother of James, and Salome, had bought sweet spices, that they might come and anoint him.',
   'καὶ διαγενομένου τοῦ σαββάτου Μαρία ἡ Μαγδαληνὴ καὶ Μαρία ἡ τοῦ Ἰακώβου καὶ Σαλώμη ἠγόρασαν ἀρώματα ἵνα ἐλθοῦσαι ἀλείψωσιν αὐτόν',
   'kai diagenomenou tou sabbatou Maria hē Magdalēnē kai Maria hē tou Iakōbou kai Salōmē ēgorasan arōmata hina elthousai aleipsōsin auton',
   '''When the sabbath was past'' (diagenomenou tou sabbatou — after the Sabbath had ended; Saturday evening after sunset). ''Sweet spices'' (arōmata — aromatic spices for burial anointing). ''Anoint him'' (aleipsōsin — to apply oil or ointment to a body for burial). The women intend to complete the burial process that was hastily done on Friday evening. They expect to find a dead body. Their devotion persists beyond the cross — these women who witnessed the crucifixion and burial (15:40, 47) now come to honour the dead.',
   NULL),
  (2, 'And very early in the morning the first day of the week, they came unto the sepulchre at the rising of the sun.',
   'καὶ λίαν πρωῒ τῇ μιᾷ τῶν σαββάτων ἔρχονται ἐπὶ τὸ μνημεῖον ἀνατείλαντος τοῦ ἡλίου',
   'kai lian prōi tē mia tōn sabbatōn erchontai epi to mnēmeion anateilantos tou hēliou',
   '''Very early'' (lian prōi — extremely early). ''First day of the week'' (tē mia tōn sabbatōn — the first day after the Sabbath; Sunday). ''At the rising of the sun'' (anateilantos tou hēliou — at sunrise). The timing is theologically significant: the sun rises on the day the Son rises. The new creation begins on the first day of the week — echoing the first creation in Genesis 1:3 (''Let there be light''). This will become the Lord''s Day, the Christian day of worship.',
   NULL),
  (3, 'And they said among themselves, Who shall roll us away the stone from the door of the sepulchre?',
   'καὶ ἔλεγον πρὸς ἑαυτάς τίς ἀποκυλίσει ἡμῖν τὸν λίθον ἐκ τῆς θύρας τοῦ μνημείου',
   'kai elegon pros heautas tis apokylisei hēmin ton lithon ek tēs thyras tou mnēmeiou',
   '''Who shall roll away the stone?'' (tis apokylisei — who will roll it back?). Their practical concern reveals they have no expectation of resurrection. They come to tend a corpse, not to witness a miracle. The stone was large and heavy — rolling it back required multiple people. Their worry about the stone is about to be answered by God himself.',
   NULL),
  (4, 'And when they looked, they saw that the stone was rolled away: for it was very great.',
   'καὶ ἀναβλέψασαι θεωροῦσιν ὅτι ἀνακεκύλισται ὁ λίθος ἦν γὰρ μέγας σφόδρα',
   'kai anablepsasai theōrousin hoti anakekylistai ho lithos ēn gar megas sphodra',
   '''When they looked'' (anablepsasai — looked up, raised their eyes). ''Rolled away'' (anakekylistai — perfect tense: had been rolled back and remained open). ''Very great'' (megas sphodra — exceedingly large). Mark notes the stone''s size to emphasise the impossibility of the women doing this themselves — and to exclude any natural explanation. The stone was not just moved but rolled up from the entrance. Someone — or Someone — had already opened the tomb.',
   NULL),
  (5, 'And entering into the sepulchre, they saw a young man sitting on the right side, clothed in a long white garment; and they were affrighted.',
   'καὶ εἰσελθοῦσαι εἰς τὸ μνημεῖον εἶδον νεανίσκον καθήμενον ἐν τοῖς δεξιοῖς περιβεβλημένον στολὴν λευκήν καὶ ἐξεθαμβήθησαν',
   'kai eiselthousai eis to mnēmeion eidon neaniskon kathēmenon en tois dexiois peribeblēmenon stolēn leukēn kai exethambēthēsan',
   '''Young man'' (neaniskon — a youth; Mark''s term for the angel; Matthew 28:5 identifies him as an angel). ''Sitting on the right side'' — the position of authority and favour. ''Long white garment'' (stolēn leukēn — a white robe; white symbolises heavenly origin and purity). ''Affrighted'' (exethambēthēsan — utterly amazed, terrified; the same intense word used of Jesus in Gethsemane, 14:33). They expected a corpse; they encounter an angel. The tomb is not a place of death but a portal of revelation.',
   NULL),
  (6, 'And he saith unto them, Be not affrighted: Ye seek Jesus of Nazareth, which was crucified: he is risen; he is not here: behold the place where they laid him.',
   'ὁ δὲ λέγει αὐταῖς μὴ ἐκθαμβεῖσθε Ἰησοῦν ζητεῖτε τὸν Ναζαρηνὸν τὸν ἐσταυρωμένον ἠγέρθη οὐκ ἔστιν ὧδε ἴδε ὁ τόπος ὅπου ἔθηκαν αὐτόν',
   'ho de legei autais mē ekthambeisthe Iēsoun zēteite ton Nazarēnon ton estaurōmenon ēgerthē ouk estin hōde ide ho topos hopou ethēkan auton',
   '''Be not affrighted'' (mē ekthambeisthe — stop being terrified). ''Jesus of Nazareth, which was crucified'' (ton Nazarēnon ton estaurōmenon — the crucified one; the perfect participle means ''the one who was crucified and remains the crucified one''; even the risen Christ bears the identity of the crucified). ''He is risen'' (ēgerthē — he was raised; aorist passive: God raised him). ''He is not here'' — the most revolutionary sentence in history. ''Behold the place'' — the angel invites verification. The empty grave clothes, the empty slab — the evidence is available for inspection.',
   'This verse contains the core kerygma (proclamation) of the Christian faith in its simplest form: (1) Jesus of Nazareth (a historical person). (2) Which was crucified (he really died). (3) He is risen (God raised him from the dead). (4) He is not here (the tomb is empty — the resurrection is bodily, not merely spiritual). (5) Behold the place (the claim is verifiable). The angel does not ask for blind faith — he invites examination of evidence. The resurrection is presented as a fact to be investigated, not merely a doctrine to be accepted. The combination ''crucified... risen'' holds together the cross and the empty tomb as inseparable realities: the one who was truly dead is now truly alive.'),
  (7, 'But go your way, tell his disciples and Peter that he goeth before you into Galilee: there shall ye see him, as he said unto you.',
   'ἀλλ᾿ ὑπάγετε εἴπατε τοῖς μαθηταῖς αὐτοῦ καὶ τῷ Πέτρῳ ὅτι προάγει ὑμᾶς εἰς τὴν Γαλιλαίαν ἐκεῖ αὐτὸν ὄψεσθε καθὼς εἶπεν ὑμῖν',
   'all hypagete eipate tois mathētais autou kai tō Petrō hoti proagei hymas eis tēn Galilaian ekei auton opsesthe kathōs eipen hymin',
   '''Tell his disciples and Peter'' (tois mathētais autou kai tō Petrō — ''and Peter'' is unique to Mark). Peter is singled out not for rebuke but for reassurance: the one who denied Jesus three times is specifically invited back into fellowship. He is not expelled from the circle of disciples — he is specifically named and included. ''Goeth before you into Galilee'' — fulfilling 14:28. ''As he said'' — Jesus'' predictions are being confirmed point by point.',
   '''And Peter'' — these two words contain the gospel of grace. Peter had denied Jesus three times with curses and oaths (14:66-72). He might have assumed he was finished — disqualified, cast out, unforgiven. But the risen Christ sends a message specifically for him: ''Tell his disciples AND PETER.'' The singling out of Peter''s name is an act of specific, personal grace. Jesus does not wait for Peter to come crawling back; he reaches out first. This anticipates the threefold restoration of John 21:15-17, where Peter''s three denials are healed by three affirmations of love. The gospel is not only that Christ is risen but that the risen Christ seeks out those who have failed him.'),
  (8, 'And they went out quickly, and fled from the sepulchre; for they trembled and were amazed: neither said they any thing to any man; for they were afraid.',
   'καὶ ἐξελθοῦσαι ἔφυγον ἀπὸ τοῦ μνημείου εἶχεν δὲ αὐτὰς τρόμος καὶ ἔκστασις καὶ οὐδενὶ οὐδὲν εἶπον ἐφοβοῦντο γάρ',
   'kai exelthousai ephygon apo tou mnēmeiou eichen de autas tromos kai ekstasis kai oudeni ouden eipon ephobounto gar',
   '''Fled'' (ephygon — ran away). ''Trembled'' (tromos — trembling, shaking). ''Amazed'' (ekstasis — ecstasy, bewilderment; literally ''standing outside oneself''). ''Said nothing to anyone'' (oudeni ouden eipon — told absolutely no one). ''For they were afraid'' (ephobounto gar — for they were terrified). If the original Gospel ended here (many scholars believe it did), Mark''s ending is breathtakingly abrupt: fear, flight, and silence. The resurrection is so overwhelming it produces not immediate joy but awe and terror. The women''s silence is temporary — they must eventually have spoken, or we would not have the story.',
   'If Mark intentionally ended his Gospel at verse 8 (ephobounto gar — ''for they were afraid''), this is one of the most audacious literary decisions in ancient literature. The Gospel ends not with triumph but with trembling, not with proclamation but with silence, not with faith but with fear. Why? Several possibilities: (1) Mark wants the reader to complete the story — you, the reader, must proclaim what the women could not. (2) The fear is not unbelief but numinous awe — the appropriate response to encountering the living God. (3) Mark''s whole Gospel has been about the ''messianic secret'' — even the resurrection is initially wrapped in silence. (4) The resurrection is so reality-shattering that initial fear is the honest response. The reader knows the women eventually spoke — we have the Gospel in our hands because they did.'),
  (9, 'Now when Jesus was risen early the first day of the week, he appeared first to Mary Magdalene, out of whom he had cast seven devils.',
   'ἀναστὰς δὲ πρωῒ πρώτῃ σαββάτου ἐφάνη πρῶτον Μαρίᾳ τῇ Μαγδαληνῇ ἀφ᾿ ἧς ἐκβεβλήκει ἑπτὰ δαιμόνια',
   'anastas de prōi prōtē sabbatou ephanē prōton Maria tē Magdalēnē aph hēs ekbeblēkei hepta daimonia',
   '''Risen'' (anastas — having risen). ''Appeared first'' (ephanē prōton — was made visible first). ''Mary Magdalene'' — the first witness of the risen Christ is a woman, one from whom Jesus had cast out seven demons. In first-century Judaism, women could not serve as legal witnesses. That the Gospels present women as the first resurrection witnesses is a powerful argument for historicity — no ancient writer inventing a resurrection story would choose women as primary witnesses.',
   NULL),
  (10, 'And she went and told them that had been with him, as they mourned and wept.',
   'ἐκείνη πορευθεῖσα ἀπήγγειλεν τοῖς μετ᾿ αὐτοῦ γενομένοις πενθοῦσι καὶ κλαίουσιν',
   'ekeinē poreutheisa apēngeilen tois met autou genomenois penthousi kai klaiousin',
   '''Mourned and wept'' (penthousi kai klaiousin — grieving and weeping). The disciples are still in mourning — they have not expected the resurrection. Mary brings the most extraordinary news in history to people sunk in grief. The contrast between her joy and their sorrow mirrors the emotional chaos of that first Easter.',
   NULL),
  (11, 'And they, when they had heard that he was alive, and had been seen of her, believed not.',
   'κἀκεῖνοι ἀκούσαντες ὅτι ζῇ καὶ ἐθεάθη ὑπ᾿ αὐτῆς ἠπίστησαν',
   'kakeinoi akousantes hoti zē kai etheathe hyp autēs ēpistēsan',
   '''Alive'' (zē — lives, is living). ''Believed not'' (ēpistēsan — disbelieved, refused to believe). The disciples'' unbelief is consistent across all four Gospels — they did not expect the resurrection despite Jesus'' predictions (8:31; 9:31; 10:34). Their initial disbelief actually strengthens the case for the resurrection: they were not credulous people waiting for a miracle but grief-stricken sceptics who needed convincing.',
   NULL),
  (12, 'After that he appeared in another form unto two of them, as they walked, and went into the country.',
   'μετὰ δὲ ταῦτα δυσὶν ἐξ αὐτῶν περιπατοῦσιν ἐφανερώθη ἐν ἑτέρᾳ μορφῇ πορευομένοις εἰς ἀγρόν',
   'meta de tauta dysin ex autōn peripatousin ephanerōthē en hetera morphē poreuomenois eis agron',
   '''Another form'' (en hetera morphē — in a different form/appearance). ''Two of them'' — this corresponds to the Emmaus road appearance in Luke 24:13-35. ''Walking into the country'' — they are leaving Jerusalem, which represents their departure from the community. Jesus meets people where they are, even in their retreat from faith.',
   NULL),
  (13, 'And they went and told it unto the residue: neither believed they them.',
   'κἀκεῖνοι ἀπελθόντες ἀπήγγειλαν τοῖς λοιποῖς οὐδὲ ἐκείνοις ἐπίστευσαν',
   'kakeinoi apelthontes apēngeilan tois loipois oude ekeinois episteusan',
   '''Neither believed they them'' — the pattern repeats: the disciples refuse to believe multiple eyewitness reports. Mary Magdalene''s testimony was rejected (v.11); now two more witnesses are disbelieved. The cumulative unbelief makes the eventual transformation of the disciples even more remarkable — something dramatic must have changed them from sceptics to martyrs.',
   NULL),
  (14, 'Afterward he appeared unto the eleven as they sat at meat, and upbraided them with their unbelief and hardness of heart, because they believed not them which had seen him after he was risen.',
   'ὕστερον ἀνακειμένοις αὐτοῖς τοῖς ἕνδεκα ἐφανερώθη καὶ ὠνείδισεν τὴν ἀπιστίαν αὐτῶν καὶ σκληροκαρδίαν ὅτι τοῖς θεασαμένοις αὐτὸν ἐγηγερμένον οὐκ ἐπίστευσαν',
   'hysteron anakeimenois autois tois hendeka ephanerōthē kai ōneidisen tēn apistian autōn kai sklērokardian hoti tois theasamenois auton egēgermenon ouk episteusan',
   '''The eleven'' (tois hendeka — Judas is gone; the Twelve are now eleven). ''Upbraided'' (ōneidisen — rebuked, reproached). ''Unbelief'' (apistian — lack of faith). ''Hardness of heart'' (sklērokardian — stubborn-heartedness; the same charge levelled at the Pharisees in 3:5 and 10:5). Jesus rebukes them not for grief but for refusing to believe the testimony of eyewitnesses. They had multiple trustworthy reports and still did not believe.',
   NULL),
  (15, 'And he said unto them, Go ye into all the world, and preach the gospel to every creature.',
   'καὶ εἶπεν αὐτοῖς πορευθέντες εἰς τὸν κόσμον ἅπαντα κηρύξατε τὸ εὐαγγέλιον πάσῃ τῇ κτίσει',
   'kai eipen autois poreuthentes eis ton kosmon hapanta kēryxate to euangelion pasē tē ktisei',
   '''All the world'' (ton kosmon hapanta — the entire world, without exception). ''Preach'' (kēryxate — proclaim as a herald; the aorist imperative commands decisive action). ''The gospel'' (to euangelion — the good news). ''Every creature'' (pasē tē ktisei — all creation, every human being). The Great Commission: the gospel is not for one nation or ethnic group but for the entire human race. The scope is universal — every creature, all the world.',
   'The Great Commission in Mark''s longer ending parallels Matthew 28:18-20. The mission extends to ''all the world'' and ''every creature'' — the gospel breaks all boundaries of nation, language, culture, and social status. The risen Christ commissions his failed, doubting, frightened disciples to take the most important message in history to the ends of the earth. Their inadequacy is irrelevant — the power comes from the Lord who works with them (v.20). The commission creates the church''s identity: a missionary community sent into the world.'),
  (16, 'He that believeth and is baptized shall be saved; but he that believeth not shall be damned.',
   'ὁ πιστεύσας καὶ βαπτισθεὶς σωθήσεται ὁ δὲ ἀπιστήσας κατακριθήσεται',
   'ho pisteusas kai baptistheis sōthēsetai ho de apistēsas katakrithēsetai',
   '''Believeth'' (pisteusas — having believed; aorist participle: decisive faith). ''Baptized'' (baptistheis — having been immersed). ''Saved'' (sōthēsetai — will be delivered, rescued). ''Believeth not'' (apistēsas — having refused to believe). ''Damned'' (katakrithēsetai — will be condemned, sentenced). Note the structure: belief + baptism = salvation; unbelief = condemnation. The condemnation clause mentions only unbelief, not absence of baptism — indicating that faith, not baptism, is the essential condition. Baptism accompanies faith as its public expression.',
   'This verse summarises the gospel response: faith expressed in baptism results in salvation; unbelief results in condemnation. The verse has been debated regarding the relationship between faith and baptism. Key observation: the condemnation clause omits baptism — ''he that believeth not shall be damned,'' not ''he that believeth not and is not baptized.'' This suggests that faith is the indispensable condition; baptism is the normative expression of faith but not a second condition independent of it. The thief on the cross (Luke 23:43) was saved by faith without baptism. In normal circumstances, however, baptism is the expected public declaration of the faith that saves.'),
  (17, 'And these signs shall follow them that believe; In my name shall they cast out devils; they shall speak with new tongues;',
   'σημεῖα δὲ τοῖς πιστεύσασιν ταῦτα παρακολουθήσει ἐν τῷ ὀνόματί μου δαιμόνια ἐκβαλοῦσιν γλώσσαις λαλήσουσιν καιναῖς',
   'sēmeia de tois pisteusasin tauta parakolouthēsei en tō onomati mou daimonia ekbalousin glōssais lalēsousin kainais',
   '''Signs'' (sēmeia — miraculous indicators, authenticating marks). ''Follow'' (parakolouthēsei — accompany, attend). ''Cast out devils'' (daimonia ekbalousin — expel demons; cf. Acts 16:18). ''New tongues'' (glōssais kainais — speaking in languages not previously learned; fulfilled at Pentecost, Acts 2:4-11). The signs confirm the message — they authenticate the messengers of the gospel. These signs characterised the apostolic age as recorded in Acts.',
   NULL),
  (18, 'They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.',
   'ὄφεις ἀροῦσιν κἂν θανάσιμόν τι πίωσιν οὐ μὴ αὐτοὺς βλάψει ἐπὶ ἀρρώστους χεῖρας ἐπιθήσουσιν καὶ καλῶς ἕξουσιν',
   'opheis arousin kan thanasimon ti piōsin ou mē autous blapsē epi arrōstous cheiras epithēsousin kai kalōs hexousin',
   '''Take up serpents'' (opheis arousin — handle snakes; cf. Paul''s experience in Acts 28:3-6). ''Deadly thing'' (thanasimon — something fatal). ''Lay hands on the sick'' (cheiras epithēsousin — place hands upon; cf. Acts 28:8). These signs describe divine protection and healing power accompanying the spread of the gospel. They are not prescriptions for testing God but descriptions of God''s sovereign protection during mission.',
   NULL),
  (19, 'So then after the Lord had spoken unto them, he was received up into heaven, and sat on the right hand of God.',
   'ὁ μὲν οὖν κύριος μετὰ τὸ λαλῆσαι αὐτοῖς ἀνελήφθη εἰς τὸν οὐρανὸν καὶ ἐκάθισεν ἐκ δεξιῶν τοῦ θεοῦ',
   'ho men oun kyrios meta to lalēsai autois anelēphthē eis ton ouranon kai ekathisen ek dexiōn tou theou',
   '''The Lord'' (ho kyrios — the risen, exalted Lord). ''Received up into heaven'' (anelēphthē eis ton ouranon — was taken up, was assumed into heaven; cf. Acts 1:9-11). ''Sat on the right hand of God'' (ekathisen ek dexiōn tou theou — took the seat of supreme authority). The ascension completes the Christ-event: incarnation, ministry, death, resurrection, and now enthronement. Psalm 110:1 is fulfilled: ''Sit thou at my right hand.'' Jesus'' prediction before the Sanhedrin (14:62) is now reality.',
   'The ascension and session (sitting at God''s right hand) mark the completion of Jesus'' earthly mission and the beginning of his heavenly reign. ''The right hand of God'' is not a physical location but a metaphor for supreme authority and power. The one who was bound by soldiers (15:1) now rules the universe. The one who was seated on trial before the Sanhedrin now sits enthroned beside the Father. Every christological prophecy Jesus made about the Son of Man at the right hand of power (14:62) is fulfilled. From this position of authority, Jesus sends the Holy Spirit (Acts 2:33), intercedes for his people (Romans 8:34; Hebrews 7:25), and will return in glory (Acts 1:11).'),
  (20, 'And they went forth, and preached every where, the Lord working with them, and confirming the word with signs following. Amen.',
   'ἐκεῖνοι δὲ ἐξελθόντες ἐκήρυξαν πανταχοῦ τοῦ κυρίου συνεργοῦντος καὶ τὸν λόγον βεβαιοῦντος διὰ τῶν ἐπακολουθούντων σημείων ἀμήν',
   'ekeinoi de exelthontes ekēryxan pantachou tou kyriou synergountos kai ton logon bebaiountos dia tōn epakolouthountōn sēmeiōn amēn',
   '''Preached every where'' (ekēryxan pantachou — proclaimed universally). ''The Lord working with them'' (tou kyriou synergountos — the Lord cooperating, partnering). ''Confirming the word'' (ton logon bebaiountos — making the word firm, validating it). ''Signs following'' (epakolouthountōn sēmeiōn — accompanying signs). The Gospel ends with mission accomplished — the disciples do what they were commissioned to do. The Lord who ascended remains active: he works with his church, confirming the gospel through signs. The book that began with ''the beginning of the gospel'' (1:1) ends with that gospel going everywhere. ''Amen'' — so be it.',
   'Mark''s Gospel ends where it began: with the gospel being proclaimed. The ''beginning of the gospel'' (1:1) has become the worldwide preaching of the gospel (16:20). The trajectory is complete: from John the Baptist''s wilderness cry to the apostles'' proclamation ''every where.'' ''The Lord working with them'' establishes the pattern for all subsequent church history: the ascended Christ does not abandon his church but actively partners with his people through the Holy Spirit. The gospel''s advance is not a human achievement but a divine-human collaboration — the Lord confirms the word. The final ''Amen'' is both a conclusion and a commission: the reader is now invited to join the mission.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 16;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 first day of the week
  ('μία τῶν σαββάτων', 'mia tōn sabbatōn', 'G3391/G4521', 'The first day of the week — literally ''the first [day] of the sabbaths'' (the first day after the Sabbath). This became the Christian day of worship (Acts 20:7; 1 Corinthians 16:2; Revelation 1:10, ''the Lord''s day''). The resurrection on the first day establishes a new pattern: just as the old covenant observed the seventh day (remembering creation), the new covenant observes the first day (celebrating new creation). Sunday worship is not a replacement of Sabbath but a celebration of resurrection — every Lord''s Day is a mini-Easter.', 1),
  -- v.6 he is risen
  ('ἐγείρω', 'egeirō', 'G1453', 'To raise, rouse, awaken — the most theologically important verb in the NT. ''He is risen'' (ēgerthē) is aorist passive: he was raised by God the Father. The passive voice reveals the Father''s agency: the resurrection is God''s act of vindication, his ''Yes'' to everything Jesus claimed. Yet the active meaning is also present: Jesus rose. He is both the object of the Father''s raising and the subject of his own rising (John 10:18). The resurrection validates the cross, confirms Jesus'' identity, and inaugurates the new creation. Without egeirō, there is no gospel (1 Corinthians 15:14).', 2),
  -- v.7 and Peter
  ('Πέτρος', 'Petros', 'G4074', 'Peter — from petra (rock). The specific inclusion of Peter''s name (''tell his disciples AND Peter'') is unique to Mark. Peter, who denied Jesus three times (14:66-72), might have assumed he was permanently excluded from the apostolic circle. The angelic message singles him out for specific reassurance: you are still one of his disciples. This detail is widely attributed to Peter''s own testimony — he would have remembered and insisted that this grace be recorded. The rock who crumbled is being rebuilt.', 3),
  -- v.8 afraid
  ('φοβέω', 'phobeō', 'G5399', 'To fear, to be afraid, to be struck with awe — from phobos (fear, terror, reverence). In Mark, phobos has a dual meaning: craven fear (cowardice) and numinous awe (the appropriate human response to the divine). The women''s fear at the empty tomb is not cowardice but the primal human response to encountering the supernatural — Rudolf Otto''s ''mysterium tremendum et fascinans.'' The resurrection is not a comfortable domestic event but a cosmos-shaking eruption of divine power that shatters all human categories. Fear is the honest beginning of faith.', 4),
  -- v.15 preach
  ('κηρύσσω', 'kēryssō', 'G2784', 'To preach, herald, proclaim publicly — from kēryx (a herald, a public announcer). A herald did not share opinions or engage in dialogue — he proclaimed the king''s decree with authority. ''Preach the gospel to every creature'' commands the authoritative, public proclamation of the good news to every human being. The gospel is not a suggestion to be considered but an announcement to be received. The herald does not negotiate — he proclaims. The scope is universal (''every creature''), the method is public proclamation, and the content is ''the gospel'' (to euangelion).', 5),
  -- v.16 believe
  ('πιστεύω', 'pisteuō', 'G4100', 'To believe, trust, have faith in, be persuaded — from pistis (faith, trust). Pisteuō in the NT involves three elements: (1) Knowledge — understanding the gospel facts. (2) Assent — agreeing that these facts are true. (3) Trust — personally relying on Christ for salvation. ''He that believeth'' (ho pisteusas) uses the aorist participle, indicating a decisive act of faith. The opposite — ''he that believeth not'' (ho apistēsas) — results in condemnation. The dividing line of humanity is not morality, intelligence, or status, but faith or unbelief in response to the gospel.', 6),
  -- v.19 right hand of God
  ('δεξιὰ τοῦ θεοῦ', 'dexia tou theou', 'G1188/G2316', 'The right hand of God — the position of supreme honour, authority, and power. In the ancient world, the right side was the place of favour (cf. Psalm 110:1; 1 Kings 2:19). ''Sat on the right hand'' (ekathisen ek dexiōn) indicates completion and enthronement: Jesus'' work is finished, and he now reigns. This is the fulfilment of his claim before the Sanhedrin (14:62): ''ye shall see the Son of man sitting on the right hand of power.'' From this position, Jesus rules, intercedes, and will return.', 7),
  -- v.20 confirming
  ('βεβαιόω', 'bebaioō', 'G950', 'To confirm, validate, make firm, establish — from bebaios (firm, stable, secure). The Lord ''confirms'' (bebaiountos) the word through accompanying signs. The signs do not create the truth of the gospel — they validate it. The word comes first; the signs follow. The gospel is self-authenticating, but God graciously provides confirmatory evidence through miracles, changed lives, and the testimony of the Spirit. The church''s mission is a divine-human partnership: the disciples preach, the Lord confirms. The final word of Mark''s Gospel is not human effort but divine validation.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 16
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 6
    WHEN 3 THEN 7
    WHEN 4 THEN 8
    WHEN 5 THEN 15
    WHEN 6 THEN 16
    WHEN 7 THEN 19
    WHEN 8 THEN 20
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 women buy spices
  (1, 'Luke 23:56', 1),
  (1, 'Luke 24:1', 2),
  -- v.2 first day of the week
  (2, 'Matthew 28:1', 3),
  (2, 'John 20:1', 4),
  (2, 'Acts 20:7', 5),
  -- v.5 young man / angel
  (5, 'Matthew 28:2-5', 6),
  (5, 'Luke 24:4', 7),
  -- v.6 he is risen
  (6, 'Matthew 28:6', 8),
  (6, 'Luke 24:6-7', 9),
  (6, '1 Corinthians 15:3-8', 10),
  (6, 'Acts 2:24', 11),
  -- v.7 tell disciples and Peter
  (7, 'Mark 14:28', 12),
  (7, 'John 21:15-17', 13),
  -- v.8 they were afraid
  (8, 'Matthew 28:8', 14),
  -- v.9 appeared to Mary Magdalene
  (9, 'John 20:11-18', 15),
  (9, 'Luke 8:2', 16),
  -- v.12 two on the road
  (12, 'Luke 24:13-35', 17),
  -- v.14 appeared to the eleven
  (14, 'Luke 24:36-43', 18),
  (14, 'John 20:19-23', 19),
  (14, '1 Corinthians 15:5', 20),
  -- v.15 Great Commission
  (15, 'Matthew 28:18-20', 21),
  (15, 'Luke 24:46-49', 22),
  (15, 'Acts 1:8', 23),
  -- v.16 believe and be saved
  (16, 'John 3:16-18', 24),
  (16, 'Acts 2:38', 25),
  (16, 'Romans 10:9-10', 26),
  -- v.17 signs
  (17, 'Acts 2:4', 27),
  (17, 'Acts 16:18', 28),
  -- v.18 serpents / healing
  (18, 'Acts 28:3-6', 29),
  (18, 'Acts 28:8', 30),
  -- v.19 ascension and session
  (19, 'Acts 1:9-11', 31),
  (19, 'Psalm 110:1', 32),
  (19, 'Hebrews 1:3', 33),
  (19, 'Ephesians 1:20-22', 34),
  -- v.20 confirming the word
  (20, 'Acts 14:3', 35),
  (20, 'Hebrews 2:3-4', 36)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 16
  AND v.verse_number = cr.verse_number;
