-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 15 — The Trial Before Pilate, the Crucifixion, and the Burial
-- 47 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 15,
  'Mark 15 narrates the crucifixion of Jesus — the theological centre of the Gospel. At dawn, the Sanhedrin delivers Jesus to Pontius Pilate (v.1). Pilate asks ''Art thou the King of the Jews?'' and Jesus answers ''Thou sayest it'' (v.2). The chief priests accuse him of ''many things'' but Jesus makes no further reply, astonishing Pilate (vv.3-5). At the feast, Pilate customarily released a prisoner. The crowd, incited by the chief priests, demands Barabbas — a murderer and insurrectionist — instead of Jesus (vv.6-11). When Pilate asks ''What will ye then that I shall do unto him whom ye call the King of the Jews?'' they cry ''Crucify him'' (vv.12-13). Pilate, ''willing to content the people'' (v.15), releases Barabbas and delivers Jesus to be crucified. The soldiers mock him with a purple robe and crown of thorns, crying ''Hail, King of the Jews!'' (vv.16-20). Simon of Cyrene is compelled to carry the cross (v.21). At Golgotha (''the place of a skull''), Jesus refuses drugged wine (v.23) and is crucified at the third hour (9 AM, v.25). The superscription reads ''THE KING OF THE JEWS'' (v.26). Two thieves are crucified with him, fulfilling Isaiah 53:12 (v.28). Passers-by mock him: ''Save thyself, and come down from the cross'' (v.30). The chief priests taunt: ''He saved others; himself he cannot save'' (v.31). At the sixth hour (noon), darkness covers the land until the ninth hour (3 PM, v.33). Jesus cries ''Eloi, Eloi, lama sabachthani?'' — ''My God, my God, why hast thou forsaken me?'' (v.34). Some think he calls for Elijah (v.35). With a loud cry, Jesus dies (v.37). The veil of the temple is torn ''from the top to the bottom'' (v.38). The centurion declares: ''Truly this man was the Son of God'' (v.39). Women who followed Jesus watch from afar (vv.40-41). Joseph of Arimathaea, ''an honourable counseller,'' asks Pilate for the body, wraps it in linen, and lays it in a rock-hewn tomb (vv.42-46). Mary Magdalene and Mary the mother of Joses observe where he is laid (v.47).',
  'The Crucified King — Darkness, Abandonment, and the Torn Veil',
  'σταυρόω (stauroō)',
  'To crucify, to fix to a cross — from stauros (an upright stake or cross). Crucifixion was Rome''s most degrading and painful execution, reserved for slaves, rebels, and the worst criminals. The victim was stripped naked, nailed or bound to a wooden cross, and left to die of asphyxiation, dehydration, or shock over hours or days. Paul would later declare this shameful death the centre of the gospel: ''we preach Christ crucified'' (1 Corinthians 1:23). The cross transforms the symbol of Rome''s power into the symbol of God''s love.',
  '["Before Pilate and the Crowd (vv.1-15): The Sanhedrin delivers Jesus to Pilate at dawn. Pilate asks Art thou the King of the Jews — Jesus answers Thou sayest it. The chief priests accuse him of many things but Jesus answers nothing more. Pilate offers to release Jesus at the feast but the crowd demands Barabbas. They cry Crucify him. Pilate releases Barabbas and delivers Jesus to be scourged and crucified","The Soldiers'' Mockery and the Road to Golgotha (vv.16-24): Soldiers clothe Jesus in purple with a crown of thorns and mock Hail King of the Jews. They spit on him and strike him. They compel Simon of Cyrene to bear his cross. At Golgotha they offer him wine mingled with myrrh but he refuses. They crucify him and divide his garments casting lots","The Crucifixion and the Mocking (vv.25-32): The third hour — they crucify him. The superscription reads THE KING OF THE JEWS. Two thieves are crucified with him. Passers-by wag their heads — Save thyself and come down from the cross. Chief priests mock — He saved others himself he cannot save. Let Christ the King of Israel descend that we may see and believe","The Death of Jesus (vv.33-41): At the sixth hour darkness covers the land until the ninth hour. Jesus cries Eloi Eloi lama sabachthani — My God my God why hast thou forsaken me. Some say he calls Elijah. One runs and fills a sponge with vinegar. Jesus cries with a loud voice and gives up the ghost. The veil of the temple is rent from top to bottom. The centurion says Truly this man was the Son of God. Women including Mary Magdalene watch from afar","The Burial (vv.42-47): Joseph of Arimathaea an honourable counseller asks Pilate for the body. Pilate marvels that Jesus is already dead and confirms it with the centurion. Joseph wraps the body in linen and lays it in a tomb hewn out of rock and rolls a stone to the door. Mary Magdalene and Mary the mother of Joses observe where he is laid"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 47 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And straightway in the morning the chief priests held a consultation with the elders and scribes and the whole council, and bound Jesus, and carried him away, and delivered him to Pilate.',
   'καὶ εὐθέως ἐπὶ τὸ πρωῒ συμβούλιον ποιήσαντες οἱ ἀρχιερεῖς μετὰ τῶν πρεσβυτέρων καὶ γραμματέων καὶ ὅλον τὸ συνέδριον δήσαντες τὸν Ἰησοῦν ἀπήνεγκαν καὶ παρέδωκαν τῷ Πιλάτῳ',
   'kai eutheōs epi to prōi symboulion poiēsantes hoi archiereis meta tōn presbyterōn kai grammateōn kai holon to synedrion dēsantes ton Iēsoun apēnenkan kai paredōkan tō Pilatō',
   '''Straightway in the morning'' (eutheōs epi to prōi — at first light, at dawn). ''Consultation'' (symboulion — a formal counsel, a judicial session to ratify the night verdict). ''Bound'' (dēsantes — tied up, shackled). ''Delivered him to Pilate'' (paredōkan — handed over; the verb paradidōmi again). The Sanhedrin lacked authority to execute (John 18:31), so they transfer Jesus to Roman jurisdiction. The charge must be political — they will reframe the religious charge of blasphemy as treason against Caesar.',
   NULL),
  (2, 'And Pilate asked him, Art thou the King of the Jews? And he answering said unto him, Thou sayest it.',
   'καὶ ἐπηρώτησεν αὐτὸν ὁ Πιλᾶτος σὺ εἶ ὁ βασιλεὺς τῶν Ἰουδαίων ὁ δὲ ἀποκριθεὶς εἶπεν αὐτῷ σὺ λέγεις',
   'kai epērōtēsen auton ho Pilatos sy ei ho basileus tōn Ioudaiōn ho de apokritheis eipen autō sy legeis',
   '''Art thou the King of the Jews?'' (sy ei ho basileus tōn Ioudaiōn — the political charge). ''Thou sayest it'' (sy legeis — you say so; an affirmative answer that distances Jesus from the political implications of ''king''). Jesus is indeed a king, but not in the way Pilate means. ''King of the Jews'' is the charge that will be nailed to the cross (v.26).',
   NULL),
  (3, 'And the chief priests accused him of many things: but he answered nothing.',
   'καὶ κατηγόρουν αὐτοῦ οἱ ἀρχιερεῖς πολλά',
   'kai katēgoroun autou hoi archiereis polla',
   '''Accused him of many things'' (katēgoroun polla — kept accusing; imperfect tense: a stream of accusations). ''Answered nothing'' — Jesus'' silence before his accusers fulfils Isaiah 53:7. The chief priests pile up charges, hoping something will stick. Jesus does not defend himself — he has already accepted the cup (14:36).',
   NULL),
  (4, 'And Pilate asked him again, saying, Answerest thou nothing? behold how many things they witness against thee.',
   'ὁ δὲ Πιλᾶτος πάλιν ἐπηρώτα αὐτὸν λέγων οὐκ ἀποκρίνῃ οὐδέν ἴδε πόσα σου καταμαρτυροῦσιν',
   'ho de Pilatos palin epērōta auton legōn ouk apokrinē ouden ide posa sou katamartyrosin',
   'Pilate is baffled by Jesus'' silence. A defendant who refuses to speak is unusual — and potentially damaging to himself. ''How many things'' — the accusations are numerous. Pilate expects a defence; he receives none. Jesus'' silence is not passivity but purposeful submission to the Father''s will.',
   NULL),
  (5, 'But Jesus yet answered nothing; so that Pilate marvelled.',
   'ὁ δὲ Ἰησοῦς οὐκέτι οὐδὲν ἀπεκρίθη ὥστε θαυμάζειν τὸν Πιλᾶτον',
   'ho de Iēsous ouketi ouden apekrithē hōste thaumazein ton Pilaton',
   '''Marvelled'' (thaumazein — was amazed, astonished). Pilate, a hardened Roman governor accustomed to prisoners begging for their lives, is genuinely astonished at Jesus'' composure. The prisoner''s calm authority unnerves the judge. Jesus'' silence is a form of authority — he controls the proceedings by refusing to participate in them on their terms.',
   NULL),
  (6, 'Now at that feast he released unto them one prisoner, whomsoever they desired.',
   'κατὰ δὲ ἑορτὴν ἀπέλυεν αὐτοῖς ἕνα δέσμιον ὅνπερ ᾐτοῦντο',
   'kata de heortēn apelyeν autois hena desmion honper ētounto',
   '''At the feast'' — a Passover amnesty custom (the paschal pardon; not attested outside the Gospels but consistent with Roman practice of judicial leniency during festivals). ''Whomsoever they desired'' — the crowd chooses. Pilate apparently sees this as an opportunity to release Jesus without confronting the Sanhedrin directly.',
   NULL),
  (7, 'And there was one named Barabbas, which lay bound with them that had made insurrection with him, who had committed murder in the insurrection.',
   'ἦν δὲ ὁ λεγόμενος Βαραββᾶς μετὰ τῶν συστασιαστῶν δεδεμένος οἵτινες ἐν τῇ στάσει φόνον πεποιήκεισαν',
   'ēn de ho legomenos Barabbas meta tōn systasiastōn dedemenos hoitines en tē stasei phonon pepoiēkeisan',
   '''Barabbas'' (Barabbas — from Aramaic bar-abba, ''son of the father''). ''Insurrection'' (stasei — revolt, rebellion). ''Murder'' (phonon — killing). The irony is extraordinary: Barabbas (''son of the father'') is a violent criminal; Jesus is the true Son of the Father. The innocent Son is condemned so that the guilty ''son'' goes free. This is the gospel in microcosm: substitution.',
   NULL),
  (8, 'And the multitude crying aloud began to desire him to do as he had ever done unto them.',
   'καὶ ἀναβοήσας ὁ ὄχλος ἤρξατο αἰτεῖσθαι καθὼς ἀεὶ ἐποίει αὐτοῖς',
   'kai anaboēsas ho ochlos ērxato aiteisthai kathōs aei epoiei autois',
   'The crowd takes the initiative, reminding Pilate of the custom. They have not yet been manipulated by the chief priests (that comes in v.11). The crowd expects the customary release — they probably assume Jesus will be the obvious choice.',
   NULL),
  (9, 'But Pilate answered them, saying, Will ye that I release unto you the King of the Jews?',
   'ὁ δὲ Πιλᾶτος ἀπεκρίθη αὐτοῖς λέγων θέλετε ἀπολύσω ὑμῖν τὸν βασιλέα τῶν Ἰουδαίων',
   'ho de Pilatos apekrithē autois legōn thelete apolysō hymin ton basilea tōn Ioudaiōn',
   '''King of the Jews'' — Pilate uses the title provocatively. He has perceived that the chief priests act out of envy (v.10), not justice. By calling Jesus ''King of the Jews,'' Pilate needles the religious leaders. He expects the crowd to prefer Jesus. His calculation is about to be overturned.',
   NULL),
  (10, 'For he knew that the chief priests had delivered him for envy.',
   'ἐγίνωσκεν γὰρ ὅτι διὰ φθόνον παραδεδώκεισαν αὐτὸν οἱ ἀρχιερεῖς',
   'eginōsken gar hoti dia phthonon paradedōkeisan auton hoi archiereis',
   '''Envy'' (phthonon — jealousy, resentment of Jesus'' popularity and authority). Pilate sees through the religious pretence to the real motive. The chief priests are not concerned about blasphemy or Roman loyalty — they are threatened by Jesus'' influence. Yet knowing this, Pilate will still condemn an innocent man.',
   NULL),
  (11, 'But the chief priests moved the people, that he should rather release Barabbas unto them.',
   'οἱ δὲ ἀρχιερεῖς ἀνέσεισαν τὸν ὄχλον ἵνα μᾶλλον τὸν Βαραββᾶν ἀπολύσῃ αὐτοῖς',
   'hoi de archiereis aneseisan ton ochlon hina mallon ton Barabban apolysē autois',
   '''Moved the people'' (aneseisan — stirred up, incited, agitated). The chief priests work the crowd, turning popular opinion against Jesus. The same populace that cried ''Hosanna'' days ago (11:9) now demands his execution. Public opinion is fickle; it can be manipulated by those with institutional power.',
   NULL),
  (12, 'And Pilate answered and said again unto them, What will ye then that I shall do unto him whom ye call the King of the Jews?',
   'ὁ δὲ Πιλᾶτος ἀποκριθεὶς πάλιν εἶπεν αὐτοῖς τί οὖν θέλετε ποιήσω ὃν λέγετε τὸν βασιλέα τῶν Ἰουδαίων',
   'ho de Pilatos apokritheis palin eipen autois ti oun thelete poiēsō hon legete ton basilea tōn Ioudaiōn',
   'Pilate asks the crowd to decide Jesus'' fate — an abdication of judicial responsibility. ''Whom ye call the King of the Jews'' — Pilate uses the title again, distancing himself from the question. He puts the decision in the crowd''s hands, making them complicit in the verdict.',
   NULL),
  (13, 'And they cried out again, Crucify him.',
   'οἱ δὲ πάλιν ἔκραξαν σταύρωσον αὐτόν',
   'hoi de palin ekraxan staurōson auton',
   '''Crucify him'' (staurōson auton — an imperative: crucify!). The crowd demands the most degrading form of Roman execution. The shift from ''Hosanna'' to ''Crucify'' in less than a week demonstrates the catastrophic fickleness of popular religion. The crowd chooses a murderer over the Messiah.',
   NULL),
  (14, 'Then Pilate said unto them, Why, what evil hath he done? And they cried out the more exceedingly, Crucify him.',
   'ὁ δὲ Πιλᾶτος ἔλεγεν αὐτοῖς τί γὰρ ἐποίησεν κακόν οἱ δὲ περισσοτέρως ἔκραξαν σταύρωσον αὐτόν',
   'ho de Pilatos elegen autois ti gar epoiēsen kakon hoi de perissoterōs ekraxan staurōson auton',
   '''What evil hath he done?'' (ti epoiēsen kakon — what crime has he committed?). Pilate asks a rational question and receives an irrational answer — the crowd simply shouts louder. Logic gives way to mob frenzy. ''The more exceedingly'' (perissoterōs — even more vehemently). Pilate recognises Jesus'' innocence but lacks the courage to act on his knowledge.',
   NULL),
  (15, 'And so Pilate, willing to content the people, released Barabbas unto them, and delivered Jesus, when he had scourged him, to be crucified.',
   'ὁ δὲ Πιλᾶτος βουλόμενος τῷ ὄχλῳ τὸ ἱκανὸν ποιῆσαι ἀπέλυσεν αὐτοῖς τὸν Βαραββᾶν καὶ παρέδωκεν τὸν Ἰησοῦν φραγελλώσας ἵνα σταυρωθῇ',
   'ho de Pilatos boulomenos tō ochlō to hikanon poiēsai apelysen autois ton Barabban kai paredōken ton Iēsoun phragellōsas hina staurōthē',
   '''Willing to content the people'' (boulomenos to hikanon poiēsai — wanting to satisfy the crowd). ''Scourged'' (phragellōsas — from Latin flagellum; a Roman scourging with a leather whip embedded with bone and metal fragments, often fatal). ''Delivered'' (paredōken — handed over). Pilate''s motivation is purely political: crowd control. He sacrifices justice to maintain order. The innocent is scourged and condemned; the guilty is freed. This is the substitutionary exchange at the heart of the gospel.',
   'The Barabbas exchange is the most vivid picture of substitutionary atonement in the Gospels. Barabbas — a guilty murderer and rebel — is released. Jesus — the innocent Son of God — is condemned in his place. The crowd literally chooses between ''the son of the father'' (Bar-abba) and the true Son of the Father. The guilty goes free; the innocent dies. This is the gospel: ''Christ also hath once suffered for sins, the just for the unjust, that he might bring us to God'' (1 Peter 3:18). Pilate''s capitulation to the crowd — condemning a man he knows to be innocent — indicts every human institution: political power, when detached from moral courage, becomes complicit in injustice.'),
  (16, 'And the soldiers led him away into the hall, called Praetorium; and they call together the whole band of soldiers.',
   'οἱ δὲ στρατιῶται ἀπήγαγον αὐτὸν ἔσω τῆς αὐλῆς ὅ ἐστιν πραιτώριον καὶ συγκαλοῦσιν ὅλην τὴν σπεῖραν',
   'hoi de stratiōtai apēgagon auton esō tēs aulēs ho estin praitōrion kai synkalousin holēn tēn speiran',
   '''Praetorium'' (praitōrion — the governor''s official residence, likely Herod''s palace or the Fortress of Antonia). ''Whole band'' (holēn tēn speiran — the entire cohort; a Roman cohort comprised 600 soldiers, though the full number may not have been present). Jesus becomes entertainment for a garrison of soldiers.',
   NULL),
  (17, 'And they clothed him with purple, and platted a crown of thorns, and put it about his head,',
   'καὶ ἐνδύουσιν αὐτὸν πορφύραν καὶ περιτιθέασιν αὐτῷ πλέξαντες ἀκάνθινον στέφανον',
   'kai endyousin auton porphyran kai perititheasin autō plexantes akanthinon stephanon',
   '''Purple'' (porphyran — a purple/scarlet military cloak, imitating royal purple). ''Crown of thorns'' (akanthinon stephanon — woven from a thorny plant; a mock crown imitating the radiate crown worn by divine rulers). The soldiers create a parody coronation: the ''king'' receives a robe and a crown, but both are instruments of mockery and pain. The thorns may echo Genesis 3:18 — the curse of thorns placed on the ground after the Fall now rests on the brow of the one who bears the curse for humanity.',
   NULL),
  (18, 'And began to salute him, Hail, King of the Jews!',
   'καὶ ἤρξαντο ἀσπάζεσθαι αὐτόν χαῖρε ὁ βασιλεὺς τῶν Ἰουδαίων',
   'kai ērxanto aspazesthai auton chaire ho basileus tōn Ioudaiōn',
   '''Hail, King of the Jews'' (chaire basileus tōn Ioudaiōn — a parody of ''Ave, Caesar!''; the standard salute to the emperor). The soldiers mock Jesus'' royal claim. Yet Mark''s readers hear the irony: Jesus is the King of the Jews — and of the whole world. Every mocking word is truer than the speakers know.',
   NULL),
  (19, 'And they smote him on the head with a reed, and did spit upon him, and bowing their knees worshipped him.',
   'καὶ ἔτυπτον αὐτοῦ τὴν κεφαλὴν καλάμῳ καὶ ἐνέπτυον αὐτῷ καὶ τιθέντες τὰ γόνατα προσεκύνουν αὐτῷ',
   'kai etypton autou tēn kephalēn kalamō kai eneptyon autō kai tithentes ta gonata prosekynoun autō',
   '''Smote with a reed'' (etypton kalamō — struck repeatedly; the reed may have served as a mock sceptre). ''Spit upon him'' (eneptyon — expressed deepest contempt). ''Bowing their knees worshipped him'' (prosekynoun — mock worship, parody obeisance). Philippians 2:10 declares that every knee will truly bow to Jesus. The soldiers parody what one day the entire cosmos will do in earnest.',
   NULL),
  (20, 'And when they had mocked him, they took off the purple from him, and put his own clothes on him, and led him out to crucify him.',
   'καὶ ὅτε ἐνέπαιξαν αὐτῷ ἐξέδυσαν αὐτὸν τὴν πορφύραν καὶ ἐνέδυσαν αὐτὸν τὰ ἱμάτια τὰ ἴδια καὶ ἐξάγουσιν αὐτὸν ἵνα σταυρώσωσιν αὐτόν',
   'kai hote enepaixan autō exedysan auton tēn porphyran kai enedysan auton ta himatia ta idia kai exagousin auton hina staurōsōsin auton',
   '''Mocked'' (enepaixan — made sport of, treated as a toy). ''Led him out'' (exagousin — led outside the city; crucifixion occurred outside the walls, cf. Hebrews 13:12). Jesus goes from mockery to execution. The soldiers dress him in his own clothes — his brief ''coronation'' is over. The procession to Golgotha begins.',
   NULL),
  (21, 'And they compel one Simon a Cyrenian, who passed by, coming out of the country, the father of Alexander and Rufus, to bear his cross.',
   'καὶ ἀγγαρεύουσιν παράγοντά τινα Σίμωνα Κυρηναῖον ἐρχόμενον ἀπ᾿ ἀγροῦ τὸν πατέρα Ἀλεξάνδρου καὶ Ῥούφου ἵνα ἄρῃ τὸν σταυρὸν αὐτοῦ',
   'kai angareuousin paragonta tina Simōna Kyrēnaion erchomenon ap agrou ton patera Alexandrou kai Rhouφou hina arē ton stauron autou',
   '''Compel'' (angareuousin — press into service; a Persian loanword for forced requisition, also used in Matthew 5:41). ''Simon a Cyrenian'' — from Cyrene in North Africa; likely a Jewish pilgrim in Jerusalem for Passover. ''Father of Alexander and Rufus'' — Mark names his sons, suggesting they were known to the Roman church (Rufus may be the same person mentioned in Romans 16:13). Simon is forced to carry the patibulum (crossbeam) — Jesus is too weakened by scourging.',
   NULL),
  (22, 'And they bring him unto the place Golgotha, which is, being interpreted, The place of a skull.',
   'καὶ φέρουσιν αὐτὸν ἐπὶ Γολγοθᾶ τόπον ὅ ἐστιν μεθερμηνευόμενον κρανίου τόπος',
   'kai pherousin auton epi Golgotha topon ho estin methermēneuomenon kraniou topos',
   '''Golgotha'' — from Aramaic gulgulta (skull). ''Place of a skull'' (kraniou topos — Latin: Calvaria, from which we get ''Calvary''). The name may derive from the hill''s skull-like appearance or from its association with executions. Located outside the city walls (Hebrews 13:12) but near a road (v.29, passers-by). The most significant geographical location in human history — the place where the Son of God died.',
   NULL),
  (23, 'And they gave him to drink wine mingled with myrrh: but he received it not.',
   'καὶ ἐδίδουν αὐτῷ πιεῖν ἐσμυρνισμένον οἶνον ὁ δὲ οὐκ ἔλαβεν',
   'kai edidoun autō piein esmyrnismenon oinon ho de ouk elaben',
   '''Wine mingled with myrrh'' (esmyrnismenon oinon — wine mixed with myrrh, a narcotic that would dull pain; cf. Proverbs 31:6-7). ''He received it not'' (ouk elaben — refused to take it). Jesus declines the sedative. He will drink the cup of suffering to the full, with full consciousness. His refusal is deliberate: he will not have his senses dulled when he bears the sins of the world.',
   NULL),
  (24, 'And when they had crucified him, they parted his garments, casting lots upon them, what every man should take.',
   'καὶ σταυρώσαντες αὐτὸν διαμερίζονται τὰ ἱμάτια αὐτοῦ βάλλοντες κλῆρον ἐπ᾿ αὐτά τίς τί ἄρῃ',
   'kai staurōsantes auton diamerizontai ta himatia autou ballontes klēron ep auta tis ti arē',
   '''Crucified him'' — Mark states the fact without describing the horror. ''Parted his garments, casting lots'' — fulfilling Psalm 22:18 (''They part my garments among them, and cast lots upon my vesture''). The soldiers divide Jesus'' clothing as their legal perquisite. Jesus is stripped of everything — even his garments. The King of the universe hangs naked and owns nothing.',
   NULL),
  (25, 'And it was the third hour, and they crucified him.',
   'ἦν δὲ ὥρα τρίτη καὶ ἐσταύρωσαν αὐτόν',
   'ēn de hōra tritē kai estaurōsan auton',
   '''Third hour'' — approximately 9 AM by Jewish reckoning. Mark''s time stamp establishes the crucifixion''s chronology: 9 AM (crucified), noon (darkness begins), 3 PM (Jesus dies). The crucifixion coincides with the morning temple sacrifice — the Lamb of God is offered at the same hour as the morning lamb.',
   NULL),
  (26, 'And the superscription of his accusation was written over, THE KING OF THE JEWS.',
   'καὶ ἦν ἡ ἐπιγραφὴ τῆς αἰτίας αὐτοῦ ἐπιγεγραμμένη ὁ βασιλεὺς τῶν Ἰουδαίων',
   'kai ēn hē epigraphē tēs aitias autou epigegrammenē ho basileus tōn Ioudaiōn',
   '''Superscription'' (epigraphē — the titulus, a placard stating the condemned man''s crime, carried before him or nailed above him on the cross). ''THE KING OF THE JEWS'' — Pilate''s intended insult becomes unintentional proclamation. The charge is simultaneously true and ironic: Jesus is the King of the Jews, but his kingdom is established through crucifixion, not military conquest.',
   NULL),
  (27, 'And with him they crucify two thieves; the one on his right hand, and the other on his left.',
   'καὶ σὺν αὐτῷ σταυροῦσιν δύο λῃστάς ἕνα ἐκ δεξιῶν καὶ ἕνα ἐξ εὐωνύμων αὐτοῦ',
   'kai syn autō staurousin dyo lēstas hena ek dexiōn kai hena ex euōnymōn autou',
   '''Two thieves'' (dyo lēstas — two bandits/insurrectionists; the same word used in 11:17). ''Right hand... left'' — the positions of honour that James and John requested (10:37). Jesus promised: ''Ye shall indeed drink of the cup that I drink of'' (10:39). His ''throne'' is a cross, flanked not by apostles but by criminals. Isaiah 53:12 is fulfilled: ''he was numbered with the transgressors.''',
   NULL),
  (28, 'And the scripture was fulfilled, which saith, And he was numbered with the transgressors.',
   'καὶ ἐπληρώθη ἡ γραφὴ ἡ λέγουσα καὶ μετὰ ἀνόμων ἐλογίσθη',
   'kai eplērōthē hē graphē hē legousa kai meta anomōn elogisthē',
   '''Numbered with the transgressors'' (meta anomōn elogisthē — reckoned with the lawless; from Isaiah 53:12). ''Fulfilled'' (eplērōthē — brought to completion). Jesus''s crucifixion between two criminals is not an accident but the fulfilment of Isaiah''s Suffering Servant prophecy. He is counted among sinners so that sinners might be counted among the righteous.',
   NULL),
  (29, 'And they that passed by railed on him, wagging their heads, and saying, Ah, thou that destroyest the temple, and buildest it in three days,',
   'καὶ οἱ παραπορευόμενοι ἐβλασφήμουν αὐτὸν κινοῦντες τὰς κεφαλὰς αὐτῶν καὶ λέγοντες οὐὰ ὁ καταλύων τὸν ναὸν καὶ ἐν τρισὶν ἡμέραις οἰκοδομῶν',
   'kai hoi paraporeuomenoi eblasphēmoun auton kinountes tas kephalas autōn kai legontes oua ho katalyōn ton naon kai en trisin hēmerais oikodomōn',
   '''Railed on him'' (eblasphēmoun — blasphemed, reviled). ''Wagging their heads'' (kinountes tas kephalas — a gesture of scorn; fulfilling Psalm 22:7). ''Thou that destroyest the temple'' — they throw back the distorted accusation from the trial (14:58). The supreme irony: Jesus is in the very act of destroying the ''temple'' of his body and raising it in three days. The mockers speak the truth without knowing it.',
   NULL),
  (30, 'Save thyself, and come down from the cross.',
   'σῶσον σεαυτὸν καὶ κατάβα ἀπὸ τοῦ σταυροῦ',
   'sōson seauton kai kataba apo tou staurou',
   '''Save thyself'' (sōson seauton — rescue yourself). ''Come down from the cross'' — the temptation Jesus faces at the cross echoes the wilderness temptations (1:13). Satan tempted him to use his power for self-preservation; the crowd repeats the temptation. If Jesus comes down from the cross, he saves himself but loses the world. He stays on the cross precisely because he is saving others.',
   NULL),
  (31, 'Likewise also the chief priests mocking said among themselves with the scribes, He saved others; himself he cannot save.',
   'ὁμοίως δὲ καὶ οἱ ἀρχιερεῖς ἐμπαίζοντες πρὸς ἀλλήλους μετὰ τῶν γραμματέων ἔλεγον ἄλλους ἔσωσεν ἑαυτὸν οὐ δύναται σῶσαι',
   'homoiōs de kai hoi archiereis empaizontes pros allēlous meta tōn grammateōn elegon allous esōsen heauton ou dynatai sōsai',
   '''He saved others'' (allous esōsen — they acknowledge his miracles). ''Himself he cannot save'' (heauton ou dynatai sōsai — he is unable to save himself). The chief priests speak more truth than they know. It is precisely because Jesus saves others that he cannot save himself. The logic of substitutionary atonement requires that the Saviour bear the cost personally. If he saves himself, no one else is saved. Their mockery is the gospel in reverse.',
   'This verse is one of the most profound theological ironies in Scripture. The chief priests'' taunt contains a deep truth: Jesus cannot save himself AND save others. The cross is an either/or: either Jesus saves himself (and humanity perishes) or he saves humanity (and accepts death). ''Himself he cannot save'' is true — not because he lacks power but because his mission requires his death. The chief priests intend mockery; Mark''s readers hear theology. The Saviour''s inability to save himself is not weakness but the highest expression of his love and obedience. He has the power to come down (Matthew 26:53) but refuses to use it because his mission demands the cross.'),
  (32, 'Let Christ the King of Israel descend now from the cross, that we may see and believe. And they that were crucified with him reviled him.',
   'ὁ Χριστὸς ὁ βασιλεὺς τοῦ Ἰσραὴλ καταβάτω νῦν ἀπὸ τοῦ σταυροῦ ἵνα ἴδωμεν καὶ πιστεύσωμεν καὶ οἱ συνεσταυρωμένοι αὐτῷ ὠνείδιζον αὐτόν',
   'ho Christos ho basileus tou Israēl katabatō nyn apo tou staurou hina idōmen kai pisteusōmen kai hoi synestaurōmenoi autō ōneidizon auton',
   '''Let Christ descend... that we may see and believe'' — they demand a sign as a condition of faith. But faith that depends on signs is not genuine faith (cf. John 20:29). If Jesus descended from the cross, they would not believe — they would simply demand another sign. Even those crucified with him join the mockery (though Luke 23:39-43 records that one later repents).',
   NULL),
  (33, 'And when the sixth hour was come, there was darkness over the whole land until the ninth hour.',
   'γενομένης δὲ ὥρας ἕκτης σκότος ἐγένετο ἐφ᾿ ὅλην τὴν γῆν ἕως ὥρας ἐνάτης',
   'genomenēs de hōras hektēs skotos egeneto eph holēn tēn gēn heōs hōras enatēs',
   '''Sixth hour'' (noon). ''Darkness'' (skotos — darkness, obscurity). ''The whole land'' (holēn tēn gēn — the entire land/earth; could mean Judaea or the whole world). ''Ninth hour'' (3 PM). Three hours of supernatural darkness at midday. This is not an eclipse (impossible during Passover, which falls on a full moon). The darkness echoes the plague of darkness in Egypt (Exodus 10:22) and the prophetic association of darkness with divine judgment (Amos 8:9-10: ''I will cause the sun to go down at noon, and I will darken the earth in the clear day'').',
   NULL),
  (34, 'And at the ninth hour Jesus cried with a loud voice, saying, Eloi, Eloi, lama sabachthani? which is, being interpreted, My God, my God, why hast thou forsaken me?',
   'καὶ τῇ ὥρᾳ τῇ ἐνάτῃ ἐβόησεν ὁ Ἰησοῦς φωνῇ μεγάλῃ λέγων ἐλωΐ ἐλωΐ λαμὰ σαβαχθανί ὅ ἐστιν μεθερμηνευόμενον ὁ θεός μου ὁ θεός μου εἰς τί με ἐγκατέλιπες',
   'kai tē hōra tē enatē eboēsen ho Iēsous phōnē megalē legōn elōi elōi lama sabachthani ho estin methermēneuomenon ho theos mou ho theos mou eis ti me enkatelipes',
   '''Eloi, Eloi, lama sabachthani'' — Aramaic (Mark preserves Jesus'' actual words). ''My God, my God, why hast thou forsaken me?'' — quoting Psalm 22:1. ''Cried with a loud voice'' (eboēsen phōnē megalē — a shout, not a whisper). This is the most theologically dense moment in the Bible: Jesus experiences the abandonment by God that is the consequence of sin. He who knew no sin (2 Corinthians 5:21) becomes sin for us and bears its ultimate penalty — separation from the Father.',
   'The cry of dereliction (''My God, my God, why hast thou forsaken me?'') is the deepest mystery of the atonement. Jesus quotes Psalm 22:1, a psalm that moves from anguished abandonment (vv.1-21) to triumphant vindication (vv.22-31). Three interpretations exist: (1) Jesus experienced genuine God-forsakenness — the Father turned away as Jesus bore the full weight of human sin and its judgment. (2) Jesus felt forsaken but was not actually abandoned — the cry expresses subjective anguish, not objective separation. (3) By quoting Psalm 22:1, Jesus invokes the entire psalm, including its triumphant conclusion. Most evangelical theology holds (1): the cry is real. Jesus experienced what every sinner deserves — the withdrawal of God''s presence — so that no sinner who trusts in him would ever be forsaken.'),
  (35, 'And some of them that stood by, when they heard it, said, Behold, he calleth Elias.',
   'καί τινες τῶν παρεστηκότων ἀκούσαντες ἔλεγον ἰδοὺ Ἡλίαν φωνεῖ',
   'kai tines tōn parestēkotōn akousantes elegon idou Ēlian phōnei',
   '''Elias'' (Ēlian — Elijah). Some bystanders confuse ''Eloi'' (my God) with ''Elijah'' — perhaps because Jewish tradition expected Elijah to return to rescue the righteous in distress (Malachi 4:5). The confusion may be genuine or deliberate mockery. Either way, no one understands Jesus'' cry — the depth of his suffering is incomprehensible to onlookers.',
   NULL),
  (36, 'And one ran and filled a spunge full of vinegar, and put it on a reed, and gave him to drink, saying, Let alone; let us see whether Elias will come to take him down.',
   'δραμὼν δέ τις καὶ γεμίσας σπόγγον ὄξους περιθεὶς τε καλάμῳ ἐπότιζεν αὐτόν λέγων ἄφετε ἴδωμεν εἰ ἔρχεται Ἡλίας καθελεῖν αὐτόν',
   'dramōn de tis kai gemisas spongon oxous peritheis te kalamō epotizen auton legōn aphete idōmen ei erchetai Ēlias kathelein auton',
   '''Vinegar'' (oxous — sour wine, the common soldiers'' drink; posca). ''A reed'' (kalamō — a stalk, used to reach Jesus'' lips). ''Let us see whether Elias will come'' — the gesture may be either compassionate (offering moisture to extend consciousness and see if Elijah comes) or cruel (prolonging suffering for entertainment). The offer of vinegar fulfils Psalm 69:21: ''In my thirst they gave me vinegar to drink.''',
   NULL),
  (37, 'And Jesus cried with a loud voice, and gave up the ghost.',
   'ὁ δὲ Ἰησοῦς ἀφεὶς φωνὴν μεγάλην ἐξέπνευσεν',
   'ho de Iēsous apheis phōnēn megalēn exepneusen',
   '''Cried with a loud voice'' (apheis phōnēn megalēn — let out a great shout). ''Gave up the ghost'' (exepneusen — breathed out, expired; from ek + pneō, to breathe out). The loud cry is remarkable: crucifixion victims typically died of suffocation, growing weaker until they could no longer draw breath. A loud shout at the moment of death suggests supernatural strength — Jesus dies not from exhaustion but by a deliberate act of will. He releases his spirit.',
   NULL),
  (38, 'And the veil of the temple was rent in twain from the top to the bottom.',
   'καὶ τὸ καταπέτασμα τοῦ ναοῦ ἐσχίσθη εἰς δύο ἀπὸ ἄνωθεν ἕως κάτω',
   'kai to katapetasma tou naou eschisthē eis dyo ap anōthen heōs katō',
   '''The veil'' (to katapetasma — the inner curtain separating the Holy Place from the Most Holy Place, the Holy of Holies; cf. Exodus 26:31-33). ''Rent in twain'' (eschisthē eis dyo — torn into two pieces). ''From the top to the bottom'' (ap anōthen heōs katō — from above downward; indicating divine action, not human). The veil was reportedly 60 feet tall and 4 inches thick. God tears it from the top — signalling that he, not humans, has opened the way into his presence.',
   'The tearing of the temple veil at the moment of Jesus'' death is one of the most theologically significant events in the Passion narrative. The veil separated humanity from the Holy of Holies — the place of God''s direct presence, entered only by the high priest once a year on the Day of Atonement (Leviticus 16). Its tearing signifies: (1) The way into God''s presence is now open to all through Jesus'' death (Hebrews 10:19-22). (2) The old sacrificial system is ended — the ultimate sacrifice has been made. (3) God himself initiates access — the tear comes from the top down. (4) The temple''s function is obsolete — prefiguring its physical destruction in AD 70. What the temple veil represented (separation between God and humanity), Jesus'' death has permanently removed.'),
  (39, 'And when the centurion, which stood over against him, saw that he so cried out, and gave up the ghost, he said, Truly this man was the Son of God.',
   'ἰδὼν δὲ ὁ κεντυρίων ὁ παρεστηκὼς ἐξ ἐναντίας αὐτοῦ ὅτι οὕτως κράξας ἐξέπνευσεν εἶπεν ἀληθῶς οὗτος ὁ ἄνθρωπος υἱὸς θεοῦ ἦν',
   'idōn de ho kentyriōn ho parestēkōs ex enantias autou hoti houtōs kraxas exepneusen eipen alēthōs houtos ho anthrōpos huios theou ēn',
   '''Centurion'' (kentyriōn — a Roman officer commanding 100 soldiers). ''Stood over against him'' (parestēkōs ex enantias — standing facing him, watching from the front). ''Truly'' (alēthōs — genuinely, in truth). ''The Son of God'' (huios theou — without the article in Greek, but in Mark''s context this is a full confession of Jesus'' identity). The centurion — a pagan Gentile soldier — becomes the first human in Mark''s Gospel to confess Jesus as the Son of God after witnessing the crucifixion.',
   'The centurion''s confession is the theological climax of Mark''s Gospel. Mark began: ''The beginning of the gospel of Jesus Christ, the Son of God'' (1:1). Throughout the Gospel, demons recognise Jesus (1:24; 3:11; 5:7), God declares it (1:11; 9:7), but no human being makes this confession — until now. And it comes not from a disciple, not from a Jewish leader, but from a Roman centurion standing at the foot of the cross. The first human to see Jesus clearly is a Gentile who watches him die. Mark''s message: Jesus'' identity as Son of God is revealed not in his miracles or transfiguration but supremely in his death. The cross is not a defeat that obscures Jesus'' glory — it is the ultimate revelation of who he is.'),
  (40, 'There were also women looking on afar off: among whom was Mary Magdalene, and Mary the mother of James the less and of Joses, and Salome;',
   'ἦσαν δὲ καὶ γυναῖκες ἀπὸ μακρόθεν θεωροῦσαι ἐν αἷς ἦν καὶ Μαρία ἡ Μαγδαληνὴ καὶ Μαρία ἡ τοῦ Ἰακώβου τοῦ μικροῦ καὶ Ἰωσῆ μήτηρ καὶ Σαλώμη',
   'ēsan de kai gynaikes apo makrothen theōrousai en hais ēn kai Maria hē Magdalēnē kai Maria hē tou Iakōbou tou mikrou kai Iōsē mētēr kai Salōmē',
   '''Women looking on afar off'' — the male disciples have fled; the women remain. ''Mary Magdalene'' (from Magdala, a town on the Sea of Galilee). ''Mary the mother of James the less and Joses.'' ''Salome'' (possibly the mother of James and John). These women become the crucial link of continuity between the crucifixion, burial, and resurrection — they witness all three events.',
   NULL),
  (41, '(Who also, when he was in Galilee, followed him, and ministered unto him;) and many other women which came up with him unto Jerusalem.',
   'αἳ καὶ ὅτε ἦν ἐν τῇ Γαλιλαίᾳ ἠκολούθουν αὐτῷ καὶ διηκόνουν αὐτῷ καὶ ἄλλαι πολλαὶ αἱ συναναβᾶσαι αὐτῷ εἰς Ἱεροσόλυμα',
   'hai kai hote ēn en tē Galilaia ēkolouthoun autō kai diēkonoun autō kai allai pollai hai synanabasai autō eis Hierosolyma',
   '''Followed him and ministered unto him'' (ēkolouthoun... diēkonoun — they followed as disciples and served/supported his ministry). ''Many other women'' — the female following of Jesus was larger than often recognised. These women provided financial and practical support (Luke 8:2-3). They followed from Galilee to Jerusalem and now stand as witnesses when the male disciples have disappeared.',
   NULL),
  (42, 'And now when the even was come, because it was the preparation, that is, the day before the sabbath,',
   'καὶ ἤδη ὀψίας γενομένης ἐπεὶ ἦν παρασκευή ὅ ἐστιν προσάββατον',
   'kai ēdē opsias genomenēs epei ēn paraskeuē ho estin prosabbaton',
   '''Even'' (opsias — evening, late afternoon). ''Preparation'' (paraskeuē — Friday, the day of preparation for the Sabbath). ''Day before the sabbath'' (prosabbaton — Mark explains for his Gentile readers). The Sabbath begins at sunset — there is urgency to bury Jesus before then, as Jewish law required burial on the day of death (Deuteronomy 21:22-23) and Sabbath rest prohibited work.',
   NULL),
  (43, 'Joseph of Arimathaea, an honourable counseller, which also waited for the kingdom of God, came, and went in boldly unto Pilate, and craved the body of Jesus.',
   'ἐλθὼν Ἰωσὴφ ὁ ἀπὸ Ἁριμαθαίας εὐσχήμων βουλευτής ὃς καὶ αὐτὸς ἦν προσδεχόμενος τὴν βασιλείαν τοῦ θεοῦ τολμήσας εἰσῆλθεν πρὸς Πιλᾶτον καὶ ᾐτήσατο τὸ σῶμα τοῦ Ἰησοῦ',
   'elthōn Iōsēph ho apo Harimathaias euschēmōn bouleutēs hos kai autos ēn prosdechomenos tēn basileian tou theou tolmēsas eisēlthen pros Pilaton kai ētēsato to sōma tou Iēsou',
   '''Joseph of Arimathaea'' (a town in Judaea, possibly Ramathaim). ''Honourable counseller'' (euschēmōn bouleutēs — a respected member of the Sanhedrin; Luke 23:50-51 specifies he had not consented to their decision). ''Waited for the kingdom'' (prosdechomenos — looked forward to, anticipated). ''Boldly'' (tolmēsas — daring, with courage; requesting the body of a condemned criminal required real courage, especially from a council member who would be openly associating with Jesus). Joseph emerges at the moment of crisis when the Twelve have vanished.',
   NULL),
  (44, 'And Pilate marvelled if he were already dead: and calling unto him the centurion, he asked him whether he had been any while dead.',
   'ὁ δὲ Πιλᾶτος ἐθαύμασεν εἰ ἤδη τέθνηκεν καὶ προσκαλεσάμενος τὸν κεντυρίωνα ἐπηρώτησεν αὐτὸν εἰ πάλαι ἀπέθανεν',
   'ho de Pilatos ethaumasen ei ēdē tethnēken kai proskalesamenos ton kentyriōna epērōtēsen auton ei palai apethanen',
   '''Marvelled'' (ethaumasen — was surprised). ''Already dead'' — crucifixion typically lasted many hours or even days. Jesus died after approximately six hours (9 AM to 3 PM), surprisingly quickly. Pilate verifies the death with the centurion — this detail establishes the reality of Jesus'' death, countering any later claim that he merely swooned.',
   NULL),
  (45, 'And when he knew it of the centurion, he gave the body to Joseph.',
   'καὶ γνοὺς ἀπὸ τοῦ κεντυρίωνος ἐδωρήσατο τὸ σῶμα τῷ Ἰωσήφ',
   'kai gnous apo tou kentyriōnos edōrēsato to sōma tō Iōsēph',
   '''Knew it of the centurion'' (gnous apo — confirmed by). ''Gave the body'' (edōrēsato to sōma — granted the corpse as a gift). Pilate''s release of the body to Joseph is an act of unusual courtesy — crucified criminals'' bodies were often left to rot or thrown into common graves. Joseph''s request provides Jesus with an honourable burial in fulfilment of Isaiah 53:9 (''with the rich in his death'').',
   NULL),
  (46, 'And he bought fine linen, and took him down, and wrapped him in the linen, and laid him in a sepulchre which was hewn out of a rock, and rolled a stone unto the door of the sepulchre.',
   'καὶ ἀγοράσας σινδόνα καὶ καθελὼν αὐτὸν ἐνείλησεν τῇ σινδόνι καὶ κατέθηκεν αὐτὸν ἐν μνημείῳ ὃ ἦν λελατομημένον ἐκ πέτρας καὶ προσεκύλισεν λίθον ἐπὶ τὴν θύραν τοῦ μνημείου',
   'kai agorasas sindona kai kathelōn auton eneilēsen tē sindoni kai katethēken auton en mnēmeiō ho ēn lelatomēmenon ek petras kai prosekylisen lithon epi tēn thyran tou mnēmeiou',
   '''Fine linen'' (sindona — clean linen cloth; the same word used for the young man''s garment in 14:51-52). ''Took him down'' (kathelōn — removed from the cross). ''Wrapped'' (eneilēsen — wound in, swaddled). ''Sepulchre hewn out of a rock'' (mnēmeiō lelatomēmenon ek petras — a tomb carved from rock; a wealthy man''s burial place). ''Rolled a stone'' (prosekylisen lithon — rolled a circular stone to seal the entrance). Joseph provides everything: linen, tomb, burial care. Isaiah 53:9: ''He made his grave with the rich.''',
   NULL),
  (47, 'And Mary Magdalene and Mary the mother of Joses beheld where he was laid.',
   'ἡ δὲ Μαρία ἡ Μαγδαληνὴ καὶ Μαρία ἡ Ἰωσῆ ἐθεώρουν ποῦ τίθεται',
   'hē de Maria hē Magdalēnē kai Maria hē Iōsē etheōroun pou tithetai',
   '''Beheld'' (etheōroun — watched carefully, observed; imperfect tense: they kept watching). The women note the exact location of the tomb — this detail is crucial for the resurrection narrative (16:1-8). They know precisely where Jesus is buried; when they find the tomb empty on Sunday morning, there is no question of going to the wrong tomb. The women are the essential witnesses linking cross, burial, and empty tomb.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 15;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.7 Barabbas
  ('Βαραββᾶς', 'Barabbas', 'G912', 'Barabbas — from Aramaic bar-abba, meaning ''son of the father'' (or possibly ''son of the rabbi''). The name itself creates one of the most striking ironies in the Passion: the crowd chooses ''the son of the father'' (a criminal) over the true Son of the Father (Jesus). Barabbas was an insurrectionist and murderer — the kind of violent revolutionary the Jewish people hoped their Messiah would be. By choosing Barabbas, the crowd reveals their preference for a military liberator over a suffering servant.', 1),
  -- v.15 scourged
  ('φραγελλόω', 'phragelloō', 'G5417', 'To scourge, to flog with a Roman flagellum — from Latin flagellum (a whip). The Roman flagellum was a short whip with multiple leather thongs embedded with pieces of bone, lead, or metal. Scourging was a standard preliminary to crucifixion. The victim was stripped, tied to a post, and beaten. The lashes shredded skin and muscle, sometimes exposing bone. Many prisoners died from scourging alone. Jesus endured this before the crucifixion — his physical condition at the cross was already critical.', 2),
  -- v.22 Golgotha
  ('Γολγοθᾶ', 'Golgotha', 'G1115', 'Golgotha — from Aramaic gulgulta, meaning ''skull.'' The Latin equivalent is calvaria, from which we derive ''Calvary.'' A place of execution outside Jerusalem''s walls, likely named for its skull-like appearance or its association with death. The precise location is debated (the Church of the Holy Sepulchre or Gordon''s Calvary are the main candidates). What is not debated is the theological significance: Golgotha is where the Son of God died for the sins of the world. The most sacred ground in Christian theology.', 3),
  -- v.34 forsaken
  ('ἐγκαταλείπω', 'enkataleipō', 'G1459', 'To forsake, abandon, leave behind, desert — from en (in) + kata (down) + leipō (to leave). Jesus'' cry from Psalm 22:1 uses this intensified verb: not merely ''left'' but ''utterly abandoned.'' The question ''why'' (eis ti) is the anguished cry of one who cannot comprehend the rupture. The Son who has enjoyed eternal communion with the Father experiences — for the first and only time — the desolation of being cut off from God. This is the price of bearing sin: not merely physical pain but spiritual abandonment. He was forsaken so that we would never be.', 4),
  -- v.38 veil
  ('καταπέτασμα', 'katapetasma', 'G2665', 'The veil, the curtain — from kata (down) + petannymi (to spread). The massive curtain separating the Holy Place from the Most Holy Place (Holy of Holies) in the temple (Exodus 26:31-33). According to Jewish tradition, it was 60 feet high, 30 feet wide, and the breadth of a handbreadth (about 4 inches) thick. Its tearing ''from the top to the bottom'' at Jesus'' death signifies God''s own act of opening access. What was closed by the Fall (Genesis 3:24 — the cherubim guarding Eden) is now reopened by the cross. The barrier between God and humanity is permanently removed.', 5),
  -- v.39 Son of God
  ('υἱὸς θεοῦ', 'huios theou', 'G5207/G2316', 'Son of God — the supreme christological title in Mark. Mark frames his Gospel with this title: 1:1 (''Jesus Christ, the Son of God'') and here at 15:39, where a Roman centurion confesses what demons have known (1:24; 3:11; 5:7) and God has declared (1:11; 9:7). The centurion''s confession is the climax of Mark''s narrative Christology: Jesus'' divine sonship is revealed not in displays of power but in the manner of his death. The cross — the ultimate human weakness — is the ultimate divine revelation.', 6),
  -- v.43 boldly
  ('τολμάω', 'tolmaō', 'G5111', 'To dare, to be bold, to have courage — from tolma (boldness, daring). Joseph of Arimathaea ''dared'' to go to Pilate. This required extraordinary courage: (1) He was a member of the Sanhedrin that had just condemned Jesus — publicly requesting the body meant breaking ranks. (2) Contact with a dead body would render him ritually unclean during Passover. (3) Association with a condemned criminal carried political risk. Joseph''s boldness at the cross contrasts with the disciples'' cowardice. The secret follower becomes the open one when it costs the most.', 7),
  -- v.46 sepulchre
  ('μνημεῖον', 'mnēmeion', 'G3419', 'A tomb, sepulchre, memorial — from mnēmē (memory, remembrance). Joseph''s tomb was ''hewn out of rock'' (lelatomēmenon ek petras) — an expensive, hand-carved chamber in solid rock, the burial place of a wealthy man. Isaiah 53:9 prophesied the Servant would be ''with the rich in his death.'' The rock-hewn tomb, sealed with a large stone, also ensures the security of the burial — no one can claim the body was moved casually. The tomb that was meant to be a permanent memorial of death will become the empty witness to resurrection.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 15
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 7
    WHEN 2 THEN 15
    WHEN 3 THEN 22
    WHEN 4 THEN 34
    WHEN 5 THEN 38
    WHEN 6 THEN 39
    WHEN 7 THEN 43
    WHEN 8 THEN 46
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 delivered to Pilate
  (1, 'Matthew 27:1-2', 1),
  (1, 'Luke 23:1', 2),
  (1, 'John 18:28', 3),
  -- v.2 King of the Jews
  (2, 'John 18:33-37', 4),
  -- v.5 answered nothing
  (5, 'Isaiah 53:7', 5),
  (5, '1 Peter 2:23', 6),
  -- v.7 Barabbas
  (7, 'Matthew 27:16-17', 7),
  (7, 'John 18:40', 8),
  -- v.15 substitution
  (15, '1 Peter 3:18', 9),
  (15, '2 Corinthians 5:21', 10),
  -- v.17 crown of thorns
  (17, 'Genesis 3:18', 11),
  (17, 'John 19:2-3', 12),
  -- v.21 Simon of Cyrene
  (21, 'Matthew 27:32', 13),
  (21, 'Romans 16:13', 14),
  -- v.24 parted garments
  (24, 'Psalm 22:18', 15),
  (24, 'John 19:23-24', 16),
  -- v.27 numbered with transgressors
  (27, 'Isaiah 53:12', 17),
  (27, 'Luke 23:32-33', 18),
  -- v.29 wagging heads
  (29, 'Psalm 22:7', 19),
  (29, 'Psalm 109:25', 20),
  -- v.31 saved others
  (31, 'Matthew 27:42', 21),
  -- v.33 darkness
  (33, 'Exodus 10:22', 22),
  (33, 'Amos 8:9-10', 23),
  -- v.34 my God why forsaken
  (34, 'Psalm 22:1', 24),
  (34, 'Matthew 27:46', 25),
  (34, '2 Corinthians 5:21', 26),
  -- v.36 vinegar
  (36, 'Psalm 69:21', 27),
  -- v.37 gave up the ghost
  (37, 'John 19:30', 28),
  (37, 'Luke 23:46', 29),
  -- v.38 veil rent
  (38, 'Exodus 26:31-33', 30),
  (38, 'Hebrews 10:19-22', 31),
  (38, 'Hebrews 6:19-20', 32),
  -- v.39 Son of God
  (39, 'Mark 1:1', 33),
  (39, 'Mark 1:11', 34),
  (39, 'Mark 9:7', 35),
  -- v.43 Joseph of Arimathaea
  (43, 'Matthew 27:57-60', 36),
  (43, 'John 19:38-42', 37),
  -- v.46 rich man's tomb
  (46, 'Isaiah 53:9', 38),
  (46, 'Matthew 27:59-60', 39)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 15
  AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 15 — BACKFILL (additional word_studies + cross_references)
-- Pilate Trial · Barabbas · Mocking · Simon of Cyrene · Crucifixion · Darkness · Cry · Veil · Centurion · Burial
-- ═══════════════════════════════════════════════════

INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'πρωΐ συμβούλιον ποιήσαντες', 'prōi symboulion poiēsantes', 'G4404/G4824', 'Early in the morning, having held council — formal post-dawn confirmation of the night verdict (likely intended to gain procedural legitimacy after the irregular night trial). The Sanhedrin reconvenes at first light to ratify what was already decided.', 100),
  (1, 'παρέδωκαν Πιλάτῳ', 'paredōkan Pilatō', 'G3860/G4091', 'They handed him over to Pilate — paradidōmi yet again, Mark''s thread-word for the Passion (already used of Judas, the Sanhedrin, and now the prefect-handover). Pontius Pilate (prefect of Judea AD 26-36) holds capital authority the Sanhedrin lacks.', 101),
  (2, 'σὺ εἶ ὁ βασιλεὺς τῶν Ἰουδαίων', 'sy ei ho basileus tōn Ioudaiōn', 'G935/G2453', 'Are you the King of the Jews — Pilate''s opening question reframes the Sanhedrin''s religious charge (blasphemy) into political terms (treason / rival kingship), the only category Roman law would prosecute. Throughout Mark 15, the title ''King of the Jews'' is the leitmotif — placard, mockery, and ironic truth.', 102),
  (2, 'σὺ λέγεις', 'sy legeis', 'G4771/G3004', 'You say (it) — Jesus''s ambiguous reply: technically affirmative but reframing the answer back to the questioner. Not a denial, not a triumphal claim; a yes that lets Pilate own his own words. The same restraint that produced silence to false witnesses now produces minimal speech to the prefect.', 103),
  (3, 'κατηγόρουν αὐτοῦ ... πολλά', 'katēgoroun autou ... polla', 'G2723/G4183', 'They accused him of many things — imperfect tense; sustained, repeated accusation. Luke 23:2 lists the three charges: subverting the nation, opposing Caesar''s tribute, claiming to be Christ-king. The volley of charges is calculated to exceed the threshold for execution.', 104),
  (4, 'οὐκ ἀποκρίνῃ οὐδέν', 'ouk apokrinē ouden', 'G3756/G611/G3762', 'Do you answer nothing — Pilate''s incredulous question. Roman defendants normally fought charges energetically; Jesus''s silence is procedurally bizarre. Pilate is unsettled: this prisoner is not behaving like a guilty rebel.', 105),
  (5, 'θαυμάζειν τὸν Πιλάτον', 'thaumazein ton Pilaton', 'G2296', 'Pilate marveled — thaumazō: to wonder, be astonished. The Roman prefect is reduced to wonder at Jesus''s composure. Mark uses thaumazō elsewhere of crowds astonished at Jesus''s teaching (1:27); now even the executioner-magistrate is amazed.', 106),
  (6, 'ἕνα δέσμιον', 'hena desmion', 'G1520/G1198', 'One prisoner — Pilate''s Passover-amnesty practice, attested only in the Gospels but plausible as a goodwill gesture by a Roman governor to a notoriously volatile province. The custom (paraitountas, ''one whom they petitioned'') functions in Mark as the providential mechanism by which the crowd is forced to choose between Jesus and Barabbas.', 107),
  (7, 'στασιαστῶν ... φόνον πεποιήκεισαν', 'stasiastōn ... phonon pepoiēkeisan', 'G4955/G5408', 'Of the insurrectionists ... had committed murder — Barabbas is a stasiastēs (rebel insurrectionist), exactly the political crime Jesus is falsely accused of. The crowd will choose the actual revolutionary over the supposed one. The substitution is Markan irony at its sharpest.', 108),
  (10, 'φθόνον', 'phthonon', 'G5355', 'Envy — Pilate diagnoses the leaders'' motive correctly (cf. Matthew 27:18). Pilate''s political acumen (he sees the case is malicious) ought to acquit; instead, fear of crowd-uproar and Caesar''s displeasure overrides his judgment. The Roman knows Jesus is innocent, but politics decide otherwise.', 109),
  (11, 'ἀνέσεισαν τὸν ὄχλον', 'aneseisan ton ochlon', 'G383', 'They incited the crowd — anaseiō: to shake up, stir up (used of agitators in Luke 23:5). The chief priests work the Passover crowd against Jesus. The same crowd that cried Hosanna five days earlier is being orchestrated to cry Crucify.', 110),
  (13, 'σταύρωσον αὐτόν', 'staurōson auton', 'G4717', 'Crucify him — aorist imperative, twice repeated (vv.13, 14). The crowd''s cry is for Rome''s most degrading death penalty, reserved for slaves, rebels, and the dregs of the empire. They are demanding not merely execution but maximum dishonor.', 111),
  (15, 'βουλόμενος ... τῷ ὄχλῳ τὸ ἱκανὸν ποιῆσαι', 'boulomenos ... tō ochlō to hikanon poiēsai', 'G1014/G2425', 'Wishing to satisfy the crowd — to hikanon poiēsai: idiomatic ''to give satisfaction.'' Pilate''s decision-driver is not justice but populism. Mark exposes the moral failure of authority: the prefect knows truth but yields to the crowd''s pressure.', 112),
  (16, 'πραιτώριον ... σπεῖραν', 'praitōrion ... speiran', 'G4232/G4686', 'Praetorium ... cohort — praitōrion: the governor''s residence (likely the Antonia fortress or Herod''s palace); speira: a Roman cohort (nominally 600 men, actually 500-1000). The mockery is conducted before the entire on-duty cohort — a public regimental humiliation.', 113),
  (17, 'πορφύραν', 'porphyran', 'G4209', 'Purple — the imperial color, dyed from Murex shellfish (extraordinarily expensive); reserved for emperors, senators, and high officials. Likely a soldier''s scarlet sagum (cloak) re-described as ''purple'' for the mocking-king tableau. The robe parodies royal investiture.', 114),
  (17, 'ἀκάνθινον στέφανον', 'akanthinon stephanon', 'G174/G4735', 'Crown of thorns — stephanos was the wreath-crown of victors and rulers (in distinction from diadēma, the royal headband). The thorny wreath is anti-victory: a king crowned with the curse of fallen creation (Genesis 3:18). Mark frames the cross as paradoxical coronation.', 115),
  (18, 'χαῖρε βασιλεῦ τῶν Ἰουδαίων', 'chaire basileu tōn Ioudaiōn', 'G5463/G935', 'Hail, King of the Jews — chaire (rejoice/hail) was the formal greeting Ave used for the emperor (Ave Caesar). The soldiers parody imperial acclamation. Mark''s readers, knowing Jesus''s real kingship, hear the mockery as unintended truth.', 116),
  (19, 'καλάμῳ', 'kalamō', 'G2563', 'With a reed — kalamos: a reed or stalk used both as a mock-scepter (placed in the hand, v.17 of Matthew''s parallel) and as a club to beat his head. The sceptre that should symbolize royal authority becomes the tool of degradation.', 117),
  (19, 'τιθέντες τὰ γόνατα', 'tithentes ta gonata', 'G5087/G1119', 'Bending the knees — proskynesis, the obeisance owed to a king or emperor. The soldiers parody royal submission while assaulting Jesus. The whole tableau is dramatic-ironic: every gesture mocks a kingship that is in fact real.', 118),
  (21, 'ἀγγαρεύουσιν', 'angareuousin', 'G29', 'They compelled / pressed into service — angareuō: a Persian loan-word (root: state postal courier service). Roman soldiers had legal right to compel a civilian to bear burdens for one mile. The same verb in 5:41 (Sermon on the Mount, ''whoever compels you to go one mile''). Simon is conscripted under the empire''s right of impressment.', 119),
  (21, 'Σίμωνα Κυρηναῖον ... πατέρα Ἀλεξάνδρου καὶ Ῥούφου', 'Simōna Kyrēnaion ... patera Alexandrou kai Rouphou', 'G4613/G2956/G223/G4504', 'Simon of Cyrene ... father of Alexander and Rufus — Cyrene (Libya) had a large Jewish population. Mark''s identification of Simon by his sons suggests Alexander and Rufus were known to Mark''s Roman audience (cf. Romans 16:13 ''Rufus, chosen in the Lord, and his mother and mine''). A family touched by the cross became known believers in Rome.', 120),
  (22, 'Κρανίου Τόπος', 'Kraniou Topos', 'G2898/G5117', 'Place of a Skull — translation of Aramaic Golgotha. The Latin equivalent is Calvaria (whence ''Calvary''). The site''s shape (or perhaps its association with executions / unburied skulls) gave it the macabre name. Mark glosses the Aramaic for his Roman audience, as throughout the Gospel.', 121),
  (23, 'ἐσμυρνισμένον οἶνον', 'esmyrnismenon oinon', 'G4669/G3631', 'Wine drugged with myrrh — possibly a narcotic mercy offered by Jerusalem women (cf. Talmud b. Sanhedrin 43a: women provided wine with frankincense to numb the condemned). Jesus refuses (ouk elaben), choosing to face the cross fully conscious. Compare his vow (14:25) to abstain from wine until the kingdom.', 122),
  (24, 'σταυροῦσιν αὐτόν', 'staurousin auton', 'G4717', 'They crucify him — historical present. Mark''s shocking restraint: the most central fact of the narrative is reported in three words. No graphic detail; the reader knows what crucifixion means. Mark trusts the bare verb to do the work.', 123),
  (24, 'διαμερίζονται τὰ ἱμάτια ... βάλλοντες κλῆρον', 'diamerizontai ta himatia ... ballontes klēron', 'G1266/G2440/G906/G2819', 'They divide his garments ... casting lots — direct fulfillment of Psalm 22:18 LXX. Mark embeds the Passion in the matrix of Psalm 22 (the lament of the Righteous Sufferer): garment-casting (v.24), mocking by passersby (v.29 ~ Ps 22:7), reproach (v.32), the cry of forsakenness (v.34 ~ Ps 22:1). The whole crucifixion is a Psalm 22 enactment.', 124),
  (25, 'ἦν δὲ ὥρα τρίτη', 'ēn de hōra tritē', 'G5610/G5154', 'It was the third hour — 9am Jewish reckoning (counted from sunrise). The Synoptics place the crucifixion at the third hour; John 19:14 places Pilate''s sentence at the sixth hour (using Roman reckoning from midnight = 6am). The data are not contradictory but use different hour systems.', 125),
  (26, 'ἐπιγραφὴ τῆς αἰτίας αὐτοῦ', 'epigraphē tēs aitias autou', 'G1923/G156', 'Inscription of his charge — titulus crucis: the placard recording the offense, displayed above the crucified to deter passersby. Pilate''s wording (''King of the Jews,'' not ''claimed to be King'') is a calculated jab at the Sanhedrin (cf. John 19:21-22).', 126),
  (27, 'δύο λῃστάς ... ἕνα ἐκ δεξιῶν καὶ ἕνα ἐξ εὐωνύμων', 'dyo lēstas ... hena ek dexiōn kai hena ex euōnymōn', 'G3027/G1188/G2176', 'Two robbers/insurrectionists ... one on the right, one on the left — lēstēs again (the very label Jesus rejected at his arrest, 14:48). The flanking positions had been requested by James and John (10:37 ''one on your right, one on your left'' in the kingdom); here the right-and-left places are filled by criminals. Mark''s structural irony.', 127),
  (29, 'παραπορευόμενοι ἐβλασφήμουν αὐτὸν κινοῦντες τὰς κεφαλάς', 'paraporeuomenoi eblasphēmoun auton kinountes tas kephalas', 'G3899/G987/G2795/G2776', 'Those passing by blasphemed, wagging their heads — head-wagging is the gesture of contemptuous mockery in Psalm 22:7 and Lamentations 2:15. Mark''s vocabulary is saturated with Psalm 22 imagery; the mockers unknowingly enact the prophesied scene.', 128),
  (29, 'οὐά', 'oua', 'G3758', 'Aha! — interjection of taunting derision. Combined with the temple-destruction taunt (''you who would destroy the temple''), the mockers throw Jesus''s own (mis-)quoted words back at him at the moment when he is being ''destroyed.'' Mark''s sustained irony: the temple-of-his-body is being destroyed precisely as predicted (cf. John 2:19-21).', 129),
  (30, 'σῶσον σεαυτὸν καταβὰς ἀπὸ τοῦ σταυροῦ', 'sōson seauton katabas apo tou staurou', 'G4982/G2597/G4716', 'Save yourself, coming down from the cross — the satanic temptation in another form (cf. 1:13; 8:33). The same logic that tempted Jesus to skip the cross now mocks him for not skipping. Mark frames the staying as the saving: he will not save himself precisely because he is saving others.', 130),
  (31, 'ἄλλους ἔσωσεν, ἑαυτὸν οὐ δύναται σῶσαι', 'allous esōsen, heauton ou dynatai sōsai', 'G243/G4982/G1438', 'He saved others; he cannot save himself — the chief priests'' unintentional gospel. The mockery articulates a profound truth: the soteriology of substitution requires that he not save himself in order to save others. Mark places the gospel in the mouths of the mockers.', 131),
  (32, 'ἵνα ἴδωμεν καὶ πιστεύσωμεν', 'hina idōmen kai pisteusōmen', 'G2443/G3708/G4100', 'That we may see and believe — the demand for sign-confirmed faith (cf. 8:11-12, the Pharisees seeking a sign). Mark''s narrative theology: faith arises not from spectacle but from accepting the cross. The mockers ironically inverse the path of true belief.', 132),
  (33, 'ὥρας ἕκτης ... ἕως ὥρας ἐνάτης', 'hōras hektēs ... heōs hōras enatēs', 'G1623/G1766', 'From the sixth hour ... until the ninth hour — noon to 3pm. Three hours of supernatural darkness over the whole land (epi pasan tēn gēn). Echoes the Egypt-darkness (Exodus 10:22) and the prophesied Day-of-the-LORD darkness (Amos 8:9-10; Joel 2:31). Cosmos protests the death of its Maker.', 133),
  (34, 'Ἐλωΐ Ἐλωΐ λεμὰ σαβαχθανί', 'Elōi Elōi lema sabachthani', 'G1682/G2982/G4518', 'Eloi Eloi lema sabachthani — Aramaic of Psalm 22:1 preserved by Mark untranslated (he then provides the Greek). Mark''s preservation of the Aramaic intensifies the rawness; the words are recorded as Jesus spoke them, in the language of his Galilean upbringing. The cry quotes the lament psalm whose later verses prophesy resurrection-vindication.', 134),
  (35, 'Ἠλίαν φωνεῖ', 'Ēlian phōnei', 'G2243/G5455', 'He calls Elijah — the bystanders mishear ''Eloi'' as ''Eliyya/Elijah.'' Popular eschatology held that Elijah would come to rescue the righteous (cf. Malachi 4:5; Mark 9:11). The misunderstanding triggers the vinegar-sponge: ''let''s see if Elijah comes.'' Mockery up to the very end.', 135),
  (36, 'ὄξους ... σπόγγον', 'oxous ... spongon', 'G3690/G4699', 'Sour wine ... sponge — oxos: the cheap diluted wine vinegar (posca) drunk by Roman soldiers; offered now perhaps as a final mockery, perhaps as small mercy. Fulfills Psalm 69:21. The hyssop reed (John 19:29) lifts the sponge to Jesus''s lips at cross-height (~7-8 feet).', 136),
  (37, 'φωνὴν μεγάλην', 'phōnēn megalēn', 'G3173/G5456', 'A loud cry — uncharacteristic for crucifixion victims, who usually died silent and exhausted from suffocation. The loud cry signals reserve of strength; Jesus does not slowly fade but actively releases his life. John 19:30 records the content (tetelestai, ''it is finished''); Mark records only the volume.', 137),
  (37, 'ἐξέπνευσεν', 'exepneusen', 'G1606', 'He breathed out / expired — ek-pneō: literally to breathe out the spirit. Active rather than passive: Jesus releases his life rather than merely losing it. The verb anticipates the post-resurrection breathing-out of the Spirit on the disciples (John 20:22).', 138),
  (38, 'ἐσχίσθη ... ἀπ᾽ ἄνωθεν ἕως κάτω', 'eschisthē ... ap anōthen heōs katō', 'G4977/G509/G2736', 'Was torn ... from top to bottom — passive divine action (eschisthē): God himself tears the veil. The Holy of Holies, accessible only to the high priest once a year (Leviticus 16), is now open. The same verb (schizō) Mark uses of the heavens torn at Jesus''s baptism (1:10) — inclusio framing the entire ministry: heavens torn open, veil torn down.', 139),
  (39, 'κεντυρίων', 'kentyriōn', 'G2760', 'Centurion — Latin loan-word centurio (commander of 100). Mark uses the Latinism for his Roman audience (compare Matthew''s Greek hekatontarchēs). The centurion was the field-officer in charge of the execution detail: the most authoritative pagan witness possible.', 140),
  (39, 'ἀληθῶς οὗτος ὁ ἄνθρωπος υἱὸς θεοῦ ἦν', 'alēthōs houtos ho anthrōpos huios theou ēn', 'G230/G3778/G444/G5207/G2316', 'Truly this man was the Son of God — alēthōs (truly): conviction-language. Mark''s Christological climax: a Roman pagan, not a disciple, makes the first clear human confession of Jesus as Son of God at the cross. The Gospel''s opening title (1:1 ''gospel of Jesus Christ, Son of God'') is finally voiced by a human at 15:39 — and it is a Gentile.', 141),
  (40, 'γυναῖκες ἀπὸ μακρόθεν θεωροῦσαι', 'gynaikes apo makrothen theōrousai', 'G1135/G3113/G2334', 'Women looking on from afar — present participle theōrousai (sustained observation). The women remain when the Twelve have fled. Mark names three (Mary Magdalene, Mary mother of James/Joses, Salome) — eyewitnesses whose testimony will validate the resurrection narrative (16:1).', 142),
  (41, 'διηκόνουν αὐτῷ', 'diēkonoun autō', 'G1247', 'They ministered to him — imperfect of diakoneō (the same verb of the angels'' ministry to Jesus after the temptation, 1:13, and of Jesus''s own self-description as servant, 10:45). The women are revealed as Jesus''s sustained Galilean disciples; their service-discipleship outlasts the men''s.', 143),
  (42, 'παρασκευή ... προσάββατον', 'paraskeuē ... prosabbaton', 'G3904/G4315', 'Preparation ... day before the Sabbath — paraskeuē: Friday (the day food is prepared for sabbath). Mark glosses paraskeuē with the Hebraistic prosabbaton for clarity. Time pressure: burial must be completed before sundown (sabbath begins) — explaining the haste of vv.43-46.', 144),
  (43, 'εὐσχήμων βουλευτὴς ... προσδεχόμενος τὴν βασιλείαν', 'euschēmōn bouleutēs ... prosdechomenos tēn basileian', 'G2158/G1010/G4327', 'A respected councillor ... waiting for the kingdom — bouleutēs: member of a council, specifically the Sanhedrin. Joseph''s status (euschēmōn, prominent) makes his courageous request to Pilate possible; his kingdom-expectation (prosdechomenos) places him among the godly remnant of Israel. A Sanhedrist who dissented (cf. Luke 23:51) becomes the burial-agent.', 145),
  (44, 'ἐθαύμαζεν εἰ ἤδη τέθνηκεν', 'ethaumazen ei ēdē tethnēken', 'G2296/G2348', 'Marveled if already dead — Pilate''s surprise: crucifixion victims often took 2-3 days to die; Jesus expired in 6 hours. The brief duration evidences the depth of his prior scourging-shock. Pilate''s confirmation via the centurion is also Mark''s answer to later docetic claims that Jesus did not really die.', 146),
  (45, 'ἐδωρήσατο τὸ πτῶμα τῷ Ἰωσήφ', 'edōrēsato to ptōma tō Iōsēph', 'G1433/G4430', 'He granted the corpse to Joseph — dōreomai: to give as a gift. Roman law normally denied burial to crucifixion victims (the body was left to the elements); Pilate''s release of the corpse is unusual concession. Joseph''s respectability (and likely a bribe) made the request viable.', 147),
  (46, 'σινδών', 'sindōn', 'G4616', 'Linen cloth — fine linen wrapping. The same word as the young man''s linen at Gethsemane (14:51-52, the only other NT occurrences in Mark). The textual link: the cloth that fled Gethsemane reappears as the burial wrapping. Mark''s vocabulary creates a literary inclusio.', 148),
  (46, 'καθελὼν ... προσεκύλισεν λίθον', 'kathelōn ... prosekylisen lithon', 'G2507/G4351/G3037', 'Having taken him down ... rolled a stone — proskyliō: to roll up against. The disc-shaped sealing-stone (golel) ran in a slot in front of the tomb opening. Joseph closes the tomb just before sunset; the women note the location for their post-sabbath return (16:1-3).', 149),
  (47, 'ἐθεώρουν ποῦ τέθειται', 'etheōroun pou tetheitai', 'G2334/G5087', 'They observed where he was laid — imperfect theōroun: sustained witness. Mary Magdalene and Mary the mother of Joses serve as the chain-of-custody witnesses for the empty-tomb narrative: they saw where the corpse was placed, so that when they find the tomb empty (16:1-7), there is no possibility of mistake.', 150),
  (15, 'ἀπέλυσεν αὐτοῖς τὸν Βαραββᾶν', 'apelysen autois ton Barabban', 'G630/G912', 'Released to them Barabbas — apolyō: to release, set free. The substitution-pattern is unmistakable: a son-of-the-father (bar-abba) is released; the true Son of the Father is condemned. Mark''s Roman audience would catch the irony of names.', 151),
  (32, 'ὠνείδιζον αὐτόν', 'ōneidizon auton', 'G3679', 'They reproached him — even the criminals crucified with him (synestaurōmenoi) join the mockery. Luke 23:39-43 records one penitent''s later turning; Mark preserves only the initial joint-reviling, intensifying the universal isolation of Jesus on the cross.', 152),
  (38, 'καταπέτασμα ... εἰς δύο', 'katapetasma ... eis dyo', 'G2665/G1417', 'The veil ... in two — Josephus describes the temple veil as 60 feet tall and finger''s breadth thick. The tearing ''from top to bottom'' rules out human action; the divine origin is unmistakable. The way to God''s presence opens at the moment the Son dies.', 153),
  (16, 'ὅλην τὴν σπεῖραν', 'holēn tēn speiran', 'G3650/G4686', 'The whole cohort — the entire 500-1000-soldier unit, summoned for the mock-coronation. Public spectacle of degradation: the more witnesses, the deeper the king''s humiliation. Yet Mark''s reader perceives the inverse: this is the cosmic enthronement before the universe.', 154)
) AS w(verse_number, original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 15 AND v.verse_number = w.verse_number
ON CONFLICT DO NOTHING;

INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, x.reference, x.ref_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 sent to Pilate
  (1, 'Mark 10:33', 100),
  (1, 'Acts 3:13', 101),
  -- v.2 are you the king
  (2, '1 Timothy 6:13', 102),
  (2, 'Matthew 27:11', 103),
  -- v.3 accused of many things
  (3, 'Luke 23:2', 104),
  -- v.4 do you not answer
  (4, 'Matthew 27:13', 105),
  -- v.5 silent before accusers
  (5, 'Acts 8:32', 106),
  (5, 'Mark 14:61', 107),
  -- v.6 release prisoner
  (6, 'Matthew 27:15', 108),
  (6, 'Luke 23:17', 109),
  -- v.7 Barabbas insurrection
  (7, 'Acts 3:14', 110),
  (7, 'Luke 23:19', 111),
  -- v.8 crowd cried
  (8, 'Matthew 27:20', 112),
  -- v.9 will ye that I release
  (9, 'John 18:39', 113),
  -- v.10 envy
  (10, 'Genesis 37:11', 114),
  (10, 'Acts 7:9', 115),
  (10, 'Proverbs 27:4', 116),
  -- v.11 chief priests stirred crowd
  (11, 'Matthew 27:20', 117),
  -- v.13 crucify him
  (13, 'Luke 23:21', 118),
  (13, 'John 19:6', 119),
  (13, 'John 19:15', 120),
  -- v.14 what evil
  (14, 'Luke 23:22', 121),
  -- v.15 willing to content
  (15, 'John 19:1', 122),
  (15, 'Matthew 27:26', 123),
  -- v.16 praetorium
  (16, 'Matthew 27:27', 124),
  (16, 'John 19:9', 125),
  -- v.17 purple robe
  (17, 'John 19:5', 126),
  (17, 'Matthew 27:28', 127),
  -- v.18 hail king
  (18, 'John 19:3', 128),
  (18, 'Matthew 27:29', 129),
  -- v.19 reed and spit
  (19, 'Isaiah 50:6', 130),
  (19, 'Micah 5:1', 131),
  -- v.20 led out to crucify
  (20, 'Hebrews 13:12', 132),
  (20, 'Matthew 27:31', 133),
  -- v.21 Simon of Cyrene
  (21, 'Luke 23:26', 134),
  (21, 'Acts 13:1', 135),
  -- v.22 Golgotha
  (22, 'John 19:17', 136),
  (22, 'Hebrews 13:11-13', 137),
  -- v.23 wine with myrrh
  (23, 'Proverbs 31:6', 138),
  (23, 'Matthew 27:34', 139),
  -- v.24 dividing garments
  (24, 'Matthew 27:35', 140),
  (24, 'John 19:23', 141),
  -- v.25 third hour
  (25, 'Matthew 27:45', 142),
  -- v.26 inscription
  (26, 'Matthew 27:37', 143),
  (26, 'John 19:19-22', 144),
  (26, 'Luke 23:38', 145),
  -- v.27 thieves
  (27, 'Matthew 27:38', 146),
  (27, 'Mark 10:37', 147),
  -- v.29 those passing by
  (29, 'Matthew 27:39', 148),
  (29, 'Lamentations 2:15', 149),
  -- v.30 save thyself
  (30, 'Matthew 27:40', 150),
  -- v.31 saved others
  (31, 'Luke 23:35', 151),
  (31, 'John 12:32', 152),
  -- v.32 see and believe
  (32, 'John 12:38', 153),
  (32, 'Luke 23:39-43', 154),
  -- v.33 sixth to ninth hour
  (33, 'Matthew 27:45', 155),
  (33, 'Luke 23:44', 156),
  (33, 'Joel 2:31', 157),
  -- v.34 forsaken
  (34, 'Hebrews 13:5', 158),
  (34, 'Lamentations 1:12', 159),
  -- v.35 calling for Elijah
  (35, 'Matthew 27:47', 160),
  (35, 'Malachi 4:5', 161),
  -- v.36 vinegar sponge
  (36, 'John 19:28-29', 162),
  (36, 'Matthew 27:48', 163),
  -- v.37 great cry — gave up the ghost
  (37, 'Hebrews 5:7', 164),
  (37, 'Matthew 27:50', 165),
  -- v.38 veil rent
  (38, 'Matthew 27:51', 166),
  (38, 'Luke 23:45', 167),
  (38, 'Hebrews 9:8', 168),
  (38, 'Mark 1:10', 169),
  -- v.39 truly Son of God
  (39, 'Matthew 27:54', 170),
  (39, 'Luke 23:47', 171),
  -- v.40 women watching
  (40, 'Matthew 27:55-56', 172),
  (40, 'John 19:25', 173),
  (40, 'Luke 23:49', 174),
  -- v.41 ministered to him
  (41, 'Luke 8:1-3', 175),
  (41, 'Mark 1:13', 176),
  -- v.42 preparation day
  (42, 'John 19:31', 177),
  (42, 'John 19:42', 178),
  (42, 'Luke 23:54', 179),
  -- v.43 Joseph the councillor
  (43, 'Luke 23:50-51', 180),
  (43, 'Isaiah 53:9', 181),
  -- v.44 marveled if already dead
  (44, 'John 19:32-34', 182),
  -- v.45 corpse to Joseph
  (45, 'Mark 16:1', 183),
  -- v.46 linen and stone tomb
  (46, 'Luke 23:53', 184),
  (46, 'John 19:39-42', 185),
  -- v.47 watched where laid
  (47, 'Matthew 27:61', 186),
  (47, 'Luke 23:55-56', 187)
) AS x(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 15 AND v.verse_number = x.verse_number
ON CONFLICT DO NOTHING;
