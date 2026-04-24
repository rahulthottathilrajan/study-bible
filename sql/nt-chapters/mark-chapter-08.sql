-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 8 — Bread, Blindness, and Peter's Confession
-- 38 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 8,
  'Mark 8 is the structural centre and dramatic turning point of the entire Gospel. The chapter opens with the feeding of the 4,000 in Gentile territory (vv.1-9) — a deliberate parallel to the feeding of the 5,000 (6:30-44), now extending Jesus'' provision to the nations. The Pharisees then demand a sign from heaven, which Jesus refuses with ''a deep sigh'' (vv.10-13). On the boat, Jesus warns the disciples about ''the leaven of the Pharisees and Herod,'' but they misunderstand, worrying about literal bread (vv.14-21). Jesus rebukes them: ''Having eyes, see ye not? and having ears, hear ye not?'' — echoing the very blindness he denounced in chapter 4. At Bethsaida, Jesus heals a blind man in two stages — first partial sight (''I see men as trees, walking''), then full clarity (vv.22-26). This unique two-stage miracle becomes a living parable of the disciples'' own spiritual sight, which is partial but about to become clear. Then comes the watershed moment: at Caesarea Philippi, Jesus asks, ''Whom do men say that I am?'' and then the piercing personal question, ''But whom say ye that I am?'' Peter answers, ''Thou art the Christ'' (vv.27-30). This confession divides the Gospel in half. Immediately Jesus begins to teach ''that the Son of man must suffer many things, and be rejected... and be killed, and after three days rise again'' (v.31). Peter rebukes Jesus and receives the most severe rebuke in the Gospels: ''Get thee behind me, Satan'' (v.33). The chapter concludes with Jesus calling the crowd and disciples to radical discipleship: ''Whosoever will come after me, let him deny himself, and take up his cross, and follow me'' (v.34). The paradox of the kingdom: ''whosoever will save his life shall lose it; but whosoever shall lose his life for my sake and the gospel''s, the same shall save it'' (v.35). ''What shall it profit a man, if he shall gain the whole world, and lose his own soul?'' (v.36).',
  'The Turning Point — From Miracles to the Cross, From Partial Sight to Full Confession',
  'Χριστός (Christos)',
  'Christ, the Anointed One — from chriō (to anoint with oil). The Greek translation of Hebrew Mashiach (Messiah). Peter''s confession ''Thou art the Christ'' (sy ei ho Christos) is the climactic moment of the first half of Mark. But immediately Jesus redefines the Messiah: not a political conqueror but a suffering servant who must be rejected, killed, and raised. The title is correct; the popular understanding of it is wrong.',
  '["Feeding the Four Thousand in Gentile Territory (vv.1-9): Jesus has compassion on a great multitude that has been with him three days with nothing to eat. Seven loaves and a few small fishes feed 4000 men with seven baskets of fragments remaining. The feeding of the Gentiles mirrors and extends the feeding of the 5000","The Leaven of the Pharisees and the Disciples'' Blindness (vv.10-21): The Pharisees demand a sign from heaven and Jesus refuses. In the boat he warns of the leaven of the Pharisees and Herod but the disciples think he means literal bread. Jesus rebukes their hardened hearts — having eyes they do not see having ears they do not hear. Do ye not yet understand?","The Two-Stage Healing of the Blind Man at Bethsaida (vv.22-26): Jesus heals a blind man in two stages — first partial sight (I see men as trees walking) then complete clarity. This unique graduated miracle is a living parable: the disciples can partially see who Jesus is but full understanding will come only through the cross","Peter''s Confession and the First Passion Prediction (vv.27-33): At Caesarea Philippi Peter confesses Thou art the Christ. Jesus immediately teaches that the Son of man must suffer be rejected be killed and rise after three days. Peter rebukes Jesus and is rebuked as Satan — setting his mind on the things of men not God","The Cost of Discipleship (vv.34-38): Jesus calls the crowd and disciples to deny themselves take up the cross and follow him. Whoever saves his life will lose it whoever loses his life for Jesus and the gospel will save it. What shall it profit a man to gain the whole world and lose his own soul"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 38 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'In those days the multitude being very great, and having nothing to eat, Jesus called his disciples unto him, and saith unto them,',
   'ἐν ἐκείναις ταῖς ἡμέραις πάλιν πολλοῦ ὄχλου ὄντος καὶ μὴ ἐχόντων τί φάγωσιν προσκαλεσάμενος τοὺς μαθητὰς αὐτοῦ λέγει αὐτοῖς',
   'en ekeinais tais hēmerais palin pollou ochlou ontos kai mē echontōn ti phagōsin proskalesamenos tous mathētas autou legei autois',
   '''In those days'' — the context is still Gentile territory (Decapolis, cf. 7:31). ''The multitude being very great'' — a second large crowd follows Jesus, this time predominantly Gentile. ''Having nothing to eat'' — their need is genuine, their devotion evident in remaining with Jesus despite hunger. Jesus initiates the solution; the crowd does not ask.',
   NULL),
  (2, 'I have compassion on the multitude, because they have now been with me three days, and have nothing to eat:',
   'σπλαγχνίζομαι ἐπὶ τὸν ὄχλον ὅτι ἤδη ἡμέραι τρεῖς προσμένουσίν μοι καὶ οὐκ ἔχουσιν τί φάγωσιν',
   'splanchnizomai epi ton ochlon hoti ēdē hēmerai treis prosmenousin moi kai ouk echousin ti phagōsin',
   '''Compassion'' (splanchnizomai — to be moved in the bowels, deeply stirred with compassion; the strongest Greek word for pity). ''Three days'' — a long time without food, showing the crowd''s extraordinary dedication. Jesus does not only teach spiritual truth; he cares about physical needs. The same compassion that fed the 5,000 Jews now feeds Gentiles — God''s provision knows no ethnic boundary.',
   NULL),
  (3, 'And if I send them away fasting to their own houses, they will faint by the way: for divers of them came from far.',
   'καὶ ἐὰν ἀπολύσω αὐτοὺς νήστεις εἰς οἶκον αὐτῶν ἐκλυθήσονται ἐν τῇ ὁδῷ τινὲς γὰρ αὐτῶν μακρόθεν ἥκασιν',
   'kai ean apolysō autous nēsteis eis oikon autōneklythēsontai en tē hodō tines gar autōn makrothen hēkasin',
   '''Faint'' (eklythēsontai — collapse, give out from exhaustion). ''From far'' (makrothen — from a distance). Jesus shows practical concern for their physical safety. This detail — some came from far — may hint at the Gentile mission: those who were ''far off'' (Ephesians 2:13) are being brought near.',
   NULL),
  (4, 'And his disciples answered him, From whence can a man satisfy these men with bread here in the wilderness?',
   'καὶ ἀπεκρίθησαν αὐτῷ οἱ μαθηταὶ αὐτοῦ ὅτι πόθεν τούτους δυνήσεταί τις ὧδε χορτάσαι ἄρτων ἐπ᾿ ἐρημίας',
   'kai apekrithēsan autō hoi mathētai autou hoti pothen toutous dynēsetai tis hōde chortasai artōn ep erēmias',
   'The disciples'' question is astonishing: they have already witnessed the feeding of the 5,000 (6:35-44), yet they ask ''From whence?'' (pothen — from what source?). ''In the wilderness'' (ep erēmias — in a desolate place). Their amnesia illustrates a pattern in Mark: spiritual lessons must be learned repeatedly. Past miracles do not automatically produce present faith.',
   NULL),
  (5, 'And he asked them, How many loaves have ye? And they said, Seven.',
   'καὶ ἐπηρώτα αὐτούς πόσους ἔχετε ἄρτους οἱ δὲ εἶπον ἑπτά',
   'kai epērōta autous posous echete artous hoi de eipon hepta',
   '''Seven'' (hepta) — in Jewish symbolism, seven represents completeness and perfection (cf. the seven days of creation). While five loaves fed 5,000 Jews (representing the Torah/Pentateuch), seven loaves feed the Gentile crowd — perhaps symbolising the fullness of God''s provision for all nations.',
   NULL),
  (6, 'And he commanded the people to sit down on the ground: and he took the seven loaves, and gave thanks, and brake, and gave to his disciples to set before them; and they did set them before the people.',
   'καὶ παρήγγειλεν τῷ ὄχλῳ ἀναπεσεῖν ἐπὶ τῆς γῆς καὶ λαβὼν τοὺς ἑπτὰ ἄρτους εὐχαριστήσας ἔκλασεν καὶ ἐδίδου τοῖς μαθηταῖς αὐτοῦ ἵνα παραθῶσιν καὶ παρέθηκαν τῷ ὄχλῳ',
   'kai parēngeilen tō ochlō anapesein epi tēs gēs kai labōn tous hepta artous eucharistēsas eklasen kai edidou tois mathētais autou hina parathōsin kai parethēkan tō ochlō',
   '''Gave thanks'' (eucharistēsas — from eucharistia, thanksgiving; the word from which ''Eucharist'' derives). The pattern mirrors the Last Supper: took, gave thanks, broke, gave. The disciples serve as intermediaries between Jesus and the crowd — a pattern for ministry in every age.',
   NULL),
  (7, 'And they had a few small fishes: and he blessed, and commanded to set them also before them.',
   'καὶ εἶχον ἰχθύδια ὀλίγα καὶ εὐλογήσας αὐτὰ εἶπεν καὶ ταῦτα παρατιθέναι',
   'kai eichon ichthydia oliga kai eulogēsas auta eipen kai tauta paratithenai',
   '''Small fishes'' (ichthydia — diminutive: little fish, tiny fish). ''Blessed'' (eulogēsas — spoke well of, praised God for). The separate blessing of the fish may indicate they were brought to Jesus after the bread was distributed. The small size and few number emphasise the miracle: the provision is entirely disproportionate to the supply.',
   NULL),
  (8, 'So they did eat, and were filled: and they took up of the broken meat that was left seven baskets full.',
   'ἔφαγον δὲ καὶ ἐχορτάσθησαν καὶ ἦραν περισσεύματα κλασμάτων ἑπτὰ σπυρίδας',
   'ephagon de kai echortasthēsan kai ēran perisseumata klasmatōn hepta spyridas',
   '''Were filled'' (echortasthēsan — satisfied, fed to the full). ''Seven baskets'' (hepta spyridas — large woven baskets, different from the kophinos baskets used in the feeding of the 5,000). Spyris is a large hamper-basket (cf. Acts 9:25, Paul lowered in a spyris). Seven baskets of surplus — God''s abundance exceeds human need.',
   NULL),
  (9, 'And they that had eaten were about four thousand: and he sent them away.',
   'ἦσαν δὲ ὡς τετρακισχίλιοι καὶ ἀπέλυσεν αὐτούς',
   'ēsan de hōs tetrakischilioi kai apelysen autous',
   'Four thousand (tetrakischilioi) — men alone; with women and children, the number would be considerably larger. The two feeding miracles together (5,000 + 4,000) demonstrate Jesus as the bread of life for all peoples — Jew and Gentile alike.',
   NULL),
  (10, 'And straightway he entered into a ship with his disciples, and came into the parts of Dalmanutha.',
   'καὶ εὐθέως ἐμβὰς εἰς τὸ πλοῖον μετὰ τῶν μαθητῶν αὐτοῦ ἦλθεν εἰς τὰ μέρη Δαλμανουθά',
   'kai eutheōs embas eis to ploion meta tōn mathētōn autou ēlthen eis ta merē Dalmanoutha',
   '''Dalmanutha'' — a location on the western shore of the Sea of Galilee, mentioned only here in Scripture. Matthew''s parallel (15:39) says ''Magdala.'' Jesus returns to Jewish territory after the Gentile ministry, setting up the Pharisaic confrontation that follows.',
   NULL),
  (11, 'And the Pharisees came forth, and began to question with him, seeking of him a sign from heaven, tempting him.',
   'καὶ ἐξῆλθον οἱ Φαρισαῖοι καὶ ἤρξαντο συζητεῖν αὐτῷ ζητοῦντες παρ᾿ αὐτοῦ σημεῖον ἀπὸ τοῦ οὐρανοῦ πειράζοντες αὐτόν',
   'kai exēlthon hoi Pharisaioi kai ērxanto syzētein autō zētountes par autou sēmeion apo tou ouranou peirazontes auton',
   '''Sign from heaven'' (sēmeion apo tou ouranou — a cosmic portent, an unmistakable divine endorsement). ''Tempting'' (peirazontes — testing, putting to the test; the same word used of Satan''s temptation in 1:13). The Pharisees have seen earthly miracles and remain unconvinced; now they demand a heavenly spectacle. Their request is not genuine inquiry but hostile testing.',
   NULL),
  (12, 'And he sighed deeply in his spirit, and saith, Why doth this generation seek after a sign? verily I say unto you, There shall no sign be given unto this generation.',
   'καὶ ἀναστενάξας τῷ πνεύματι αὐτοῦ λέγει τί ἡ γενεὰ αὕτη ζητεῖ σημεῖον ἀμὴν λέγω ὑμῖν εἰ δοθήσεται τῇ γενεᾷ ταύτῃ σημεῖον',
   'kai anastenaxas tō pneumati autou legei ti hē genea hautē zētei sēmeion amēn legō hymin ei dothēsetai tē genea tautē sēmeion',
   '''Sighed deeply'' (anastenaxas — groaned from the depths; a compound intensifying the simple ''sigh'' of 7:34). ''This generation'' (hē genea hautē — not merely the current age but the kind of people characterised by unbelief). ''No sign'' — the Hebrew idiom ''ei dothēsetai'' is an absolute denial (''if a sign shall be given'' = ''no sign shall be given''). Jesus refuses to perform on demand. Signs are given by grace, not extracted by scepticism.',
   NULL),
  (13, 'And he left them, and entering into the ship again departed to the other side.',
   'καὶ ἀφεὶς αὐτοὺς ἐμβὰς πάλιν εἰς τὸ πλοῖον ἀπῆλθεν εἰς τὸ πέραν',
   'kai apheis autous embas palin eis to ploion apēlthen eis to peran',
   '''Left them'' (apheis — dismissed, abandoned; abrupt and final). Jesus physically departs from those who refuse to believe. The departure is both geographical and theological: persistent unbelief exhausts even divine patience. He crosses back to the other side, away from the hostile Pharisees.',
   NULL),
  (14, 'Now the disciples had forgotten to take bread, neither had they in the ship with them more than one loaf.',
   'καὶ ἐπελάθοντο λαβεῖν ἄρτους καὶ εἰ μὴ ἕνα ἄρτον οὐκ εἶχον μεθ᾿ ἑαυτῶν ἐν τῷ πλοίῳ',
   'kai epelathonto labein artous kai ei mē hena arton ouk eichon meth heautōn en tō ploiō',
   '''Forgotten'' (epelathonto — neglected, failed to remember). ''One loaf'' (hena arton) — ironically sufficient, since they are with the one who multiplied loaves twice. The one loaf in the boat is Jesus himself — but the disciples cannot see past their physical concern.',
   NULL),
  (15, 'And he charged them, saying, Take heed, beware of the leaven of the Pharisees, and of the leaven of Herod.',
   'καὶ διεστέλλετο αὐτοῖς λέγων ὁρᾶτε βλέπετε ἀπὸ τῆς ζύμης τῶν Φαρισαίων καὶ τῆς ζύμης Ἡρῴδου',
   'kai diestelleto autois legōn horate blepete apo tēs zymēs tōn Pharisaiōn kai tēs zymēs Hērōdou',
   '''Leaven'' (zymēs — yeast, ferment). ''Take heed, beware'' (horate, blepete — two imperatives: look out, keep watching). Leaven in Jewish imagery represents a small influence that permeates the whole (cf. 1 Corinthians 5:6). The leaven of the Pharisees is hypocritical religion; the leaven of Herod is worldly political compromise. Both corrupt from within.',
   NULL),
  (16, 'And they reasoned among themselves, saying, It is because we have no bread.',
   'καὶ διελογίζοντο πρὸς ἀλλήλους λέγοντες ὅτι ἄρτους οὐκ ἔχομεν',
   'kai dielogizonto pros allēlous legontes hoti artous ouk echomen',
   '''Reasoned'' (dielogizonto — discussed, debated among themselves). The disciples take Jesus'' spiritual warning literally — they think he is upset about the bread shortage. Their reasoning reveals the very blindness Jesus is about to diagnose: they have eyes but do not see, ears but do not hear.',
   NULL),
  (17, 'And when Jesus knew it, he saith unto them, Why reason ye, because ye have no bread? perceive ye not yet, neither understand? have ye your heart yet hardened?',
   'καὶ γνοὺς λέγει αὐτοῖς τί διαλογίζεσθε ὅτι ἄρτους οὐκ ἔχετε οὔπω νοεῖτε οὐδὲ συνίετε ἔτι πεπωρωμένην ἔχετε τὴν καρδίαν ὑμῶν',
   'kai gnous legei autois ti dialogizesthe hoti artous ouk echete oupō noeite oude syniete eti pepōrōmenēn echete tēn kardian hymōn',
   '''Perceive ye not yet'' (oupō noeite — do you still not grasp?). ''Understand'' (syniete — comprehend, put it together). ''Heart yet hardened'' (pepōrōmenēn echete tēn kardian — your heart remains petrified). The verb pōroō (to harden) was used of unbelieving Israel in 3:5 and 6:52. Now Jesus applies it to his own disciples — a shocking charge. They have witnessed two feeding miracles yet remain spiritually dense.',
   NULL),
  (18, 'Having eyes, see ye not? and having ears, hear ye not? and do ye not remember?',
   'ὀφθαλμοὺς ἔχοντες οὐ βλέπετε καὶ ὦτα ἔχοντες οὐκ ἀκούετε καὶ οὐ μνημονεύετε',
   'ophthalmous echontes ou blepete kai ōta echontes ouk akouete kai ou mnēmoneuete',
   'Jesus echoes Jeremiah 5:21 and Ezekiel 12:2 — the same prophetic charge levelled against rebellious Israel is now aimed at the Twelve. ''Do ye not remember?'' (ou mnēmoneuete — are you not mindful?). Three faculties that should function: sight, hearing, memory. All three are failing. The disciples are physically present at the miracles but spiritually absent from their meaning.',
   'This verse is one of Mark''s most important editorial moments. Jesus applies to his own disciples the same language of judicial blindness used for Israel''s enemies (4:12; 7:6-8). The disciples are not hostile — they are obtuse. They have witnessed the miracles but missed the message. This theme — partial sight, slow understanding — dominates the central section of Mark (8:22-10:52) and is resolved only at the cross.'),
  (19, 'When I brake the five loaves among five thousand, how many baskets full of fragments took ye up? They say unto him, Twelve.',
   'ὅτε τοὺς πέντε ἄρτους ἔκλασα εἰς τοὺς πεντακισχιλίους πόσους κοφίνους κλασμάτων πλήρεις ἤρατε λέγουσιν αὐτῷ δώδεκα',
   'hote tous pente artous eklasa eis tous pentakischilious posous kophinous klasmatōn plēreis ērate legousin autō dōdeka',
   '''Twelve baskets'' (dōdeka kophinous) — the disciples remember the facts perfectly. Five loaves, five thousand fed, twelve baskets left. The kophinos is a small wicker basket typically carried by Jews — twelve baskets, one for each tribe of Israel. The numerical symbolism points to Jesus'' sufficiency for all Israel.',
   NULL),
  (20, 'And when the seven among four thousand, how many baskets full of fragments took ye up? And they said, Seven.',
   'ὅτε δὲ τοὺς ἑπτὰ εἰς τοὺς τετρακισχιλίους πόσων σπυρίδων πληρώματα κλασμάτων ἤρατε καὶ λέγουσιν αὐτῷ ἑπτά',
   'hote de tous hepta eis tous tetrakischilious posōn spyridōn plērōmata klasmatōn ērate kai legousin autō hepta',
   '''Seven baskets'' (hepta spyridōn) — large hamper-baskets. Seven loaves, four thousand fed, seven baskets remaining. The numbers shift: from twelve (tribes of Israel) to seven (completeness/universality — the Gentile nations). The disciples can recall the data but not discern the theology. Memory without meaning is spiritually useless.',
   NULL),
  (21, 'And he said unto them, How is it that ye do not understand?',
   'καὶ ἔλεγεν αὐτοῖς πῶς οὐ συνίετε',
   'kai elegen autois pōs ou syniete',
   '''How is it'' (pōs — how is it possible?). ''Understand'' (syniete — comprehend, connect the dots). The question is left unanswered — deliberately open-ended. Jesus does not explain the symbolism; he expects them to work it out. The lesson of the loaves: if Jesus can provide abundantly for thousands, how can the disciples worry about bread? And if they cannot understand bread, how will they understand the cross?',
   NULL),
  (22, 'And he cometh to Bethsaida; and they bring a blind man unto him, and besought him to touch him.',
   'καὶ ἔρχεται εἰς Βηθσαϊδάν καὶ φέρουσιν αὐτῷ τυφλὸν καὶ παρακαλοῦσιν αὐτὸν ἵνα αὐτοῦ ἅψηται',
   'kai erchetai eis Bēthsaidan kai pherousin autō typhlon kai parakalousin auton hina autou hapsētai',
   '''Bethsaida'' — the hometown of Peter, Andrew, and Philip (John 1:44). ''Blind'' (typhlon — without sight). ''Touch'' (hapsētai — make physical contact). The friends bring the man and ask for touch — similar to the deaf man in 7:32. This healing serves as a hinge between the disciples'' blindness (vv.14-21) and Peter''s partial sight (vv.27-30).',
   NULL),
  (23, 'And he took the blind man by the hand, and led him out of the town; and when he had spit on his eyes, and put his hands upon him, he asked him if he saw ought.',
   'καὶ ἐπιλαβόμενος τῆς χειρὸς τοῦ τυφλοῦ ἐξήνεγκεν αὐτὸν ἔξω τῆς κώμης καὶ πτύσας εἰς τὰ ὄμματα αὐτοῦ ἐπιθεὶς τὰς χεῖρας αὐτῷ ἐπηρώτα αὐτὸν εἴ τι βλέπεις',
   'kai epilabomenos tēs cheiros tou typhlou exēnenken auton exō tēs kōmēs kai ptysas eis ta ommata autou epitheis tas cheiras autō epērōta auton ei ti blepeis',
   '''Led him out'' (exēnenken — brought him outside; privacy again, as with the deaf man). ''Spit on his eyes'' (ptysas eis ta ommata — saliva applied to the organs of blindness). ''Asked him'' — uniquely, Jesus checks the result. This is the only healing in the Gospels that occurs in stages, which is clearly deliberate, not a sign of difficulty. Jesus is acting out a parable.',
   NULL),
  (24, 'And he looked up, and said, I see men as trees, walking.',
   'καὶ ἀναβλέψας ἔλεγεν βλέπω τοὺς ἀνθρώπους ὅτι ὡς δένδρα ὁρῶ περιπατοῦντας',
   'kai anablepsas elegen blepō tous anthrōpous hoti hōs dendra horō peripatountas',
   '''I see men as trees, walking'' — partial sight: he can perceive shapes and movement but cannot distinguish clearly. The man sees, but sees wrongly — men look like walking trees. This is a perfect metaphor for the disciples'' condition: they see something about Jesus (he is powerful, compassionate, miraculous) but they cannot see clearly who he is or what he must do.',
   'This two-stage miracle is unique in the Gospels and is placed here with theological precision. It illustrates the disciples'' spiritual condition: they have partial sight. Peter is about to confess ''Thou art the Christ'' — correct but incomplete. He sees who Jesus is but not what the Christ must do (suffer and die). Full sight will come only through the cross. Mark uses this physical healing as a lived parable of spiritual perception progressing from blindness through partial sight to full clarity.'),
  (25, 'After that he put his hands again upon his eyes, and made him look up: and he was restored, and saw every man clearly.',
   'εἶτα πάλιν ἐπέθηκεν τὰς χεῖρας ἐπὶ τοὺς ὀφθαλμοὺς αὐτοῦ καὶ ἐποίησεν αὐτὸν ἀναβλέψαι καὶ ἀπεκατέστη καὶ ἐνέβλεπεν τηλαυγῶς ἅπαντα',
   'eita palin epethēken tas cheiras epi tous ophthalmous autou kai epoiēsen auton anablepsai kai apekatestē kai eneblepen tēlaugōs hapanta',
   '''Restored'' (apekatestē — fully restored to original condition). ''Clearly'' (tēlaugōs — at a distance, brilliantly; from tēle ''far'' + augē ''radiance'' — seeing far and clear). ''Every man'' (hapanta — all things). The second touch brings complete clarity. What was blurred becomes sharp; what was confused becomes distinct. Full sight replaces partial vision.',
   NULL),
  (26, 'And he sent him away to his house, saying, Neither go into the town, nor tell it to any in the town.',
   'καὶ ἀπέστειλεν αὐτὸν εἰς οἶκον αὐτοῦ λέγων μηδὲ εἰς τὴν κώμην εἰσέλθῃς μηδὲ εἴπῃς τινὶ ἐν τῇ κώμῃ',
   'kai apesteilen auton eis oikon autou legōn mēde eis tēn kōmēn eiselthēs mēde eipēs tini en tē kōmē',
   'The messianic secret again: Jesus commands silence. ''Go to your house'' — he is to return home, not enter the town of Bethsaida. This town was previously denounced by Jesus (Matthew 11:21) for unbelief despite the miracles performed there. The healed man is directed away from the unbelieving town.',
   NULL),
  (27, 'And Jesus went out, and his disciples, into the towns of Caesarea Philippi: and by the way he asked his disciples, saying unto them, Whom do men say that I am?',
   'καὶ ἐξῆλθεν ὁ Ἰησοῦς καὶ οἱ μαθηταὶ αὐτοῦ εἰς τὰς κώμας Καισαρείας τῆς Φιλίππου καὶ ἐν τῇ ὁδῷ ἐπηρώτα τοὺς μαθητὰς αὐτοῦ λέγων αὐτοῖς τίνα με λέγουσιν οἱ ἄνθρωποι εἶναι',
   'kai exēlthen ho Iēsous kai hoi mathētai autou eis tas kōmas Kaisareias tēs Philippou kai en tē hodō epērōta tous mathētas autou legōn autois tina me legousin hoi anthrōpoi einai',
   '''Caesarea Philippi'' — a predominantly pagan city at the base of Mount Hermon, near the source of the Jordan. Built by Philip the tetrarch and named for Caesar Augustus. Far from Jerusalem, far from the temple, in Gentile territory — an unlikely location for Israel''s most important confession. ''By the way'' (en tē hodō — on the road) — the question arises naturally during travel.',
   NULL),
  (28, 'And they answered, John the Baptist: but some say, Elias; and others, One of the prophets.',
   'οἱ δὲ ἀπεκρίθησαν Ἰωάννην τὸν βαπτιστήν καὶ ἄλλοι Ἠλίαν ἄλλοι δὲ ὅτι εἷς τῶν προφητῶν',
   'hoi de apekrithēsan Iōannēn ton baptistēn kai alloi Ēlian alloi de hoti heis tōn prophētōn',
   'Popular opinion categories Jesus as a prophet — great, but not unique. John the Baptist (Herod''s fear, 6:14-16), Elijah (the expected forerunner, Malachi 4:5), or one of the prophets (a general prophetic figure). All these identifications are flattering but inadequate. They see Jesus as a voice from the past, not the fulfilment of all prophecy.',
   NULL),
  (29, 'And he saith unto them, But whom say ye that I am? And Peter answereth and saith unto him, Thou art the Christ.',
   'καὶ αὐτὸς ἐπηρώτα αὐτούς ὑμεῖς δὲ τίνα με λέγετε εἶναι ἀποκριθεὶς ὁ Πέτρος λέγει αὐτῷ σὺ εἶ ὁ Χριστός',
   'kai autos epērōta autous hymeis de tina me legete einai apokritheis ho Petros legei autō sy ei ho Christos',
   '''But whom say ye'' (hymeis de — emphatic: but you yourselves). The question moves from public opinion to personal conviction. ''Thou art the Christ'' (sy ei ho Christos — you are the Anointed One, the Messiah). Peter''s confession is the climax of the first half of Mark. Everything has been building toward this moment. But as vv.31-33 will show, Peter''s confession is correct in content but wrong in understanding.',
   'Peter''s confession ''Thou art the Christ'' divides Mark''s Gospel in half. Before this, the question has been ''Who is this?'' (4:41). After this, the question becomes ''What kind of Messiah?'' Peter has the right title but the wrong definition. He confesses a Messiah of power; Jesus will reveal a Messiah of suffering. This gap between correct confession and correct understanding is the central tension of Mark 8:27-10:52. Orthodoxy (right words) must become orthopraxy (right understanding and action).'),
  (30, 'And he charged them that they should tell no man of him.',
   'καὶ ἐπετίμησεν αὐτοῖς ἵνα μηδενὶ λέγωσιν περὶ αὐτοῦ',
   'kai epetimēsen autois hina mēdeni legōsin peri autou',
   '''Charged'' (epetimēsen — sternly warned, rebuked). The messianic secret reaches its peak: Jesus forbids the disciples from telling anyone he is the Christ. Why? Because the title ''Christ'' without the cross is dangerous — it evokes political and military expectations that Jesus must first correct. He will not allow his identity to be proclaimed without his mission being understood.',
   NULL),
  (31, 'And he began to teach them, that the Son of man must suffer many things, and be rejected of the elders, and of the chief priests, and scribes, and be killed, and after three days rise again.',
   'καὶ ἤρξατο διδάσκειν αὐτοὺς ὅτι δεῖ τὸν υἱὸν τοῦ ἀνθρώπου πολλὰ παθεῖν καὶ ἀποδοκιμασθῆναι ὑπὸ τῶν πρεσβυτέρων καὶ τῶν ἀρχιερέων καὶ τῶν γραμματέων καὶ ἀποκτανθῆναι καὶ μετὰ τρεῖς ἡμέρας ἀναστῆναι',
   'kai ērxato didaskein autous hoti dei ton huion tou anthrōpou polla pathein kai apodokimasthēnai hypo tōn presbyterōn kai tōn archiereōn kai tōn grammateōn kai apoktanthēnai kai meta treis hēmeras anastēnai',
   '''Began to teach'' (ērxato didaskein — a new phase of instruction). ''Must'' (dei — it is divinely necessary; theological compulsion, not mere fate). ''Suffer many things'' (polla pathein — much suffering). ''Rejected'' (apodokimasthēnai — tested and declared unfit; a building term: examined as a stone and rejected as unsuitable). ''Killed'' (apoktanthēnai — put to death). ''Rise again'' (anastēnai — stand up again, resurrect). The three groups — elders, chief priests, scribes — constitute the Sanhedrin. This is the first of three passion predictions in Mark (8:31; 9:31; 10:33-34), each more detailed than the last.',
   'This is the first explicit passion prediction in Mark and the theological complement to Peter''s confession. The ''must'' (dei) is crucial — the cross is not an accident but a divine necessity woven into God''s redemptive plan. The Son of man title (from Daniel 7:13-14) evokes heavenly glory and universal dominion, yet Jesus fills it with suffering servant content (Isaiah 53). The rejection by all three divisions of the Sanhedrin means total institutional repudiation. But the prediction ends with resurrection — ''after three days rise again'' — which the disciples consistently fail to grasp.'),
  (32, 'And he spake that saying openly. And Peter took him, and began to rebuke him.',
   'καὶ παρρησίᾳ τὸν λόγον ἐλάλει καὶ προσλαβόμενος αὐτὸν ὁ Πέτρος ἤρξατο ἐπιτιμᾶν αὐτῷ',
   'kai parrēsia ton logon elalei kai proslabomenos auton ho Petros ērxato epitiman autō',
   '''Openly'' (parrēsia — with boldness, plainly, without concealment). ''Took him'' (proslabomenos — took him aside, pulled him apart). ''Began to rebuke'' (ērxato epitiman — started to censure him; the same verb used when Jesus rebukes demons and storms). Peter uses on Jesus the language Jesus uses on Satan. The presumption is staggering: the confessor becomes the corrector, the disciple rebukes the Master.',
   NULL),
  (33, 'But when he had turned about and looked on his disciples, he rebuked Peter, saying, Get thee behind me, Satan: for thou savourest not the things that be of God, but the things that be of men.',
   'ὁ δὲ ἐπιστραφεὶς καὶ ἰδὼν τοὺς μαθητὰς αὐτοῦ ἐπετίμησεν Πέτρῳ λέγων ὕπαγε ὀπίσω μου σατανᾶ ὅτι οὐ φρονεῖς τὰ τοῦ θεοῦ ἀλλὰ τὰ τῶν ἀνθρώπων',
   'ho de epistrapheis kai idōn tous mathētas autou epetimēsen Petrō legōn hypage opisō mou satana hoti ou phroneis ta tou theou alla ta tōn anthrōpōn',
   '''Turned about and looked on his disciples'' — Jesus replies publicly, not privately; Peter''s error is representative. ''Get thee behind me, Satan'' (hypage opisō mou satana — go behind me, adversary). Jesus addresses the tempter behind Peter''s words. ''Savourest'' (phroneis — think, set your mind on). ''Things of God'' vs. ''things of men'' — the fundamental divide. Peter''s theology is human-centred: a Messiah who conquers. God''s theology is cross-centred: a Messiah who suffers.',
   'This is the harshest rebuke Jesus gives any disciple. By calling Peter ''Satan,'' Jesus identifies the same temptation he faced in the wilderness (1:13; cf. Matthew 4:8-10): the offer of messianic glory without the cross. Peter''s well-intentioned rebuke channels the ultimate satanic strategy — to divert Jesus from the path of suffering. The distinction between ''things of God'' and ''things of men'' is the hermeneutical key to the rest of Mark: divine wisdom is cruciform, and human wisdom resists the cross.'),
  (34, 'And when he had called the people unto him with his disciples also, he said unto them, Whosoever will come after me, let him deny himself, and take up his cross, and follow me.',
   'καὶ προσκαλεσάμενος τὸν ὄχλον σὺν τοῖς μαθηταῖς αὐτοῦ εἶπεν αὐτοῖς ὅστις θέλει ὀπίσω μου ἐλθεῖν ἀπαρνησάσθω ἑαυτὸν καὶ ἀράτω τὸν σταυρὸν αὐτοῦ καὶ ἀκολουθείτω μοι',
   'kai proskalesamenos ton ochlon syn tois mathētais autou eipen autois hostis thelei opisō mou elthein aparnēsasthō heauton kai aratō ton stauron autou kai akoloutheitō moi',
   '''Whosoever will'' (hostis thelei — whoever wishes; the invitation is universal). ''Deny himself'' (aparnēsasthō heauton — say no to self, disown one''s own claims). ''Take up his cross'' (aratō ton stauron — lift and carry one''s execution stake). ''Follow me'' (akoloutheitō moi — present imperative: keep on following). Three imperatives: deny, take up, follow. The cross is not a metaphor for inconvenience but for execution. Before Jesus'' crucifixion, everyone knew what a cross meant: death.',
   'This is the foundational statement on Christian discipleship. Jesus extends the cross not just to himself but to all who follow. Three elements define discipleship: (1) Self-denial — not asceticism but a fundamental reorientation away from self-sovereignty. (2) Cross-bearing — accepting the cost, including social rejection and physical danger. (3) Following — ongoing obedience. The ''cross'' would have been shockingly literal to first-century hearers, who saw crucifixions regularly. Jesus is calling followers to a path of death that leads to life.'),
  (35, 'For whosoever will save his life shall lose it; but whosoever shall lose his life for my sake and the gospel''s, the same shall save it.',
   'ὃς γὰρ ἐὰν θέλῃ τὴν ψυχὴν αὐτοῦ σῶσαι ἀπολέσει αὐτήν ὃς δ᾿ ἂν ἀπολέσει τὴν ψυχὴν αὐτοῦ ἕνεκεν ἐμοῦ καὶ τοῦ εὐαγγελίου σώσει αὐτήν',
   'hos gar ean thelē tēn psychēn autou sōsai apolesei autēn hos d an apolesei tēn psychēn autou heneken emou kai tou euangeliou sōsei autēn',
   '''Life'' (psychēn — soul, self, life; the whole person). ''Save'' (sōsai — preserve, keep safe). ''Lose'' (apolesei — destroy, forfeit). ''For my sake and the gospel''s'' (heneken emou kai tou euangeliou — the dual ground: loyalty to Christ and his message). The great paradox: self-preservation leads to self-destruction; self-sacrifice leads to salvation. The logic of the kingdom inverts worldly wisdom.',
   'This paradox is the heart of Jesus'' ethical teaching and is repeated in all four Gospels (Matthew 16:25; Luke 9:24; John 12:25). The word psychē means both ''life'' and ''soul'' — the whole self. The person who clings to physical safety, social standing, and self-interest will ultimately lose everything. The person who surrenders these for Jesus and the gospel will find true life. ''For my sake and the gospel''s'' places Jesus and his message on the same plane — loyalty to Christ is inseparable from loyalty to his word.'),
  (36, 'For what shall it profit a man, if he shall gain the whole world, and lose his own soul?',
   'τί γὰρ ὠφελήσει ἄνθρωπον ἐὰν κερδήσῃ τὸν κόσμον ὅλον καὶ ζημιωθῇ τὴν ψυχὴν αὐτοῦ',
   'ti gar ōphelēsei anthrōpon ean kerdēsē ton kosmon holon kai zēmiōthē tēn psychēn autou',
   '''Profit'' (ōphelēsei — benefit, advantage). ''Gain'' (kerdēsē — acquire, win). ''The whole world'' (ton kosmon holon — everything the world offers). ''Lose'' (zēmiōthē — suffer loss, be forfeited). A rhetorical question expecting the answer ''nothing.'' The entire world is a bad trade for one''s soul. This is ultimate cost-benefit analysis: no temporal gain compensates for eternal loss.',
   NULL),
  (37, 'Or what shall a man give in exchange for his soul?',
   'ἢ τί δοῖ ἄνθρωπος ἀντάλλαγμα τῆς ψυχῆς αὐτοῦ',
   'ē ti doi anthrōpos antallagma tēs psychēs autou',
   '''Exchange'' (antallagma — ransom price, equivalent value, something given in return). Once the soul is lost, what can buy it back? No currency, no achievement, no possession can redeem it. The soul''s value is beyond calculation — it is priceless because it is eternal. This verse underscores the irreversibility of spiritual loss.',
   NULL),
  (38, 'Whosoever therefore shall be ashamed of me and of my words in this adulterous and sinful generation; of him also shall the Son of man be ashamed, when he cometh in the glory of his Father with the holy angels.',
   'ὃς γὰρ ἐὰν ἐπαισχυνθῇ με καὶ τοὺς ἐμοὺς λόγους ἐν τῇ γενεᾷ ταύτῃ τῇ μοιχαλίδι καὶ ἁμαρτωλῷ καὶ ὁ υἱὸς τοῦ ἀνθρώπου ἐπαισχυνθήσεται αὐτὸν ὅταν ἔλθῃ ἐν τῇ δόξῃ τοῦ πατρὸς αὐτοῦ μετὰ τῶν ἀγγέλων τῶν ἁγίων',
   'hos gar ean epaischynthē me kai tous emous logous en tē genea tautē tē moichalidi kai hamartōlō kai ho huios tou anthrōpou epaischynthēsetai auton hotan elthē en tē doxē tou patros autou meta tōn angelōn tōn hagiōn',
   '''Ashamed'' (epaischynthē — embarrassed by, unwilling to be publicly associated with). ''Adulterous'' (moichalidi — unfaithful, spiritually adulterous; evoking OT imagery of Israel as God''s unfaithful spouse). ''The Son of man... in the glory of his Father'' — the suffering Son of man (v.31) will return as the glorious judge (Daniel 7:13-14). The relationship is reciprocal: those who are ashamed of Jesus now, he will be ashamed of at the parousia.',
   'This verse connects present confession to future judgment. The Son of man who must now suffer (v.31) will come in ''the glory of his Father with the holy angels'' — a clear claim to divine prerogative and eschatological authority. The logic is symmetrical: public loyalty to Jesus in a hostile world guarantees public acknowledgment by Jesus before God. Public denial guarantees public disowning. This creates urgency: the cost of discipleship (v.34) is real, but the cost of non-discipleship is infinitely greater.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 8;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 compassion
  ('σπλαγχνίζομαι', 'splanchnizomai', 'G4697', 'To be moved with compassion, to feel deep pity — from splanchna (the inner organs, bowels; metaphorically the seat of deep emotion). The strongest Greek word for compassion, used exclusively of Jesus and characters representing God in parables. It denotes not mere sympathy but visceral, gut-level anguish at another''s suffering. Jesus'' compassion is not sentimental but active — it always issues in concrete help: feeding, healing, teaching.', 1),
  -- v.12 sign
  ('σημεῖον', 'sēmeion', 'G4592', 'Sign, mark, token, miracle viewed as evidence — from sēmainō (to signify, indicate). In the Synoptics, Jesus performs dynameis (mighty works, acts of power) but refuses to give sēmeia (signs) on demand. A sēmeion is a miracle designed to authenticate; the Pharisees want proof that compels belief. But Jesus refuses to reduce divine power to a vending machine that dispenses proof on request. Faith that requires compulsory evidence is not faith.', 2),
  -- v.15 leaven
  ('ζύμη', 'zymē', 'G2219', 'Leaven, yeast, ferment — a small amount of fermenting dough that permeates and transforms the entire batch. In most biblical usage, leaven symbolises corruption that spreads invisibly (cf. 1 Corinthians 5:6-8; Galatians 5:9). The ''leaven of the Pharisees'' is religious hypocrisy; the ''leaven of Herod'' is worldly compromise. Both are insidious: they start small and corrupt everything they touch.', 3),
  -- v.24 trees walking
  ('δένδρον', 'dendron', 'G1186', 'Tree — used here in the blind man''s description of his partial sight: ''I see men as trees, walking.'' He perceives vertical shapes and movement but lacks clarity and detail. The image becomes a powerful metaphor for the disciples'' spiritual condition throughout Mark 8-10: they can perceive that Jesus is significant (a large, upright figure) but cannot discern his true identity and mission with clarity. Full sight requires a second touch — the revelation of the cross.', 4),
  -- v.29 Christ
  ('Χριστός', 'Christos', 'G5547', 'Christ, Anointed One, Messiah — from chriō (to anoint with oil). The Greek equivalent of Hebrew Mashiach. In the OT, kings, priests, and prophets were anointed for service. ''The Christ'' is the ultimate anointed figure: the promised king from David''s line who would deliver Israel and establish God''s kingdom. Peter''s confession identifies Jesus as this figure. But Jesus immediately redefines the title through suffering — a Messiah who must be rejected and killed before rising.', 5),
  -- v.31 must suffer
  ('δεῖ', 'dei', 'G1163', 'It is necessary, one must, it is divinely ordained — from deō (to bind). The word expresses divine necessity: not fate or circumstance but God''s predetermined plan. The Son of man ''must'' (dei) suffer — this is not an unfortunate accident but the fulfilment of God''s redemptive purpose. The dei of the cross means suffering is not Plan B; it is the plan. The necessity is grounded in Scripture (Isaiah 53; Psalm 22; Daniel 7) and in God''s sovereign will.', 6),
  -- v.34 cross
  ('σταυρός', 'stauros', 'G4716', 'Cross, stake, the instrument of Roman crucifixion — an upright wooden beam to which the condemned person was nailed or bound. In first-century usage, ''take up your cross'' meant one thing: walk to your execution. Condemned criminals carried the crossbeam (patibulum) through the streets to the execution site. Jesus uses this image before his own crucifixion — a radical demand for followers to embrace a path of suffering, shame, and death to self.', 7),
  -- v.36 soul
  ('ψυχή', 'psychē', 'G5590', 'Soul, life, self, the whole person — from psychō (to breathe). Psychē encompasses physical life, inner personality, and eternal identity. In v.35, it means ''life'' (the whole self one might try to save); in v.36, it means ''soul'' (the eternal self that can be forfeited). The double meaning is deliberate: one''s temporal life and eternal soul are both at stake. To ''gain the whole world'' and ''lose one''s soul'' is the worst possible exchange — infinite loss for finite gain.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 8
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 12
    WHEN 3 THEN 15
    WHEN 4 THEN 24
    WHEN 5 THEN 29
    WHEN 6 THEN 31
    WHEN 7 THEN 34
    WHEN 8 THEN 36
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 feeding the 4000
  (1, 'Matthew 15:32-39', 1),
  -- v.2 compassion
  (2, 'Mark 6:34', 2),
  (2, 'Matthew 9:36', 3),
  -- v.6 gave thanks and brake
  (6, 'Mark 6:41', 4),
  (6, 'Mark 14:22', 5),
  -- v.11 sign from heaven
  (11, 'Matthew 12:38-39', 6),
  (11, 'Luke 11:16', 7),
  (11, '1 Corinthians 1:22', 8),
  -- v.12 no sign given
  (12, 'Matthew 16:4', 9),
  -- v.15 leaven
  (15, 'Matthew 16:6', 10),
  (15, 'Luke 12:1', 11),
  (15, '1 Corinthians 5:6-8', 12),
  -- v.17 hardened heart
  (17, 'Mark 6:52', 13),
  (17, 'Mark 3:5', 14),
  -- v.18 eyes not seeing
  (18, 'Jeremiah 5:21', 15),
  (18, 'Ezekiel 12:2', 16),
  (18, 'Mark 4:12', 17),
  -- v.19 twelve baskets
  (19, 'Mark 6:43', 18),
  -- v.22 blind man at Bethsaida
  (22, 'Mark 7:32-35', 19),
  -- v.27 who do men say
  (27, 'Matthew 16:13-16', 20),
  (27, 'Luke 9:18-20', 21),
  -- v.29 thou art the Christ
  (29, 'Matthew 16:16', 22),
  (29, 'John 6:69', 23),
  (29, 'John 11:27', 24),
  -- v.31 Son of man must suffer
  (31, 'Mark 9:31', 25),
  (31, 'Mark 10:33-34', 26),
  (31, 'Isaiah 53:3-5', 27),
  (31, 'Luke 24:26', 28),
  -- v.33 get thee behind me Satan
  (33, 'Matthew 4:10', 29),
  (33, 'Matthew 16:23', 30),
  -- v.34 take up cross
  (34, 'Matthew 10:38', 31),
  (34, 'Luke 14:27', 32),
  (34, 'Galatians 2:20', 33),
  -- v.35 save life lose it
  (35, 'Matthew 10:39', 34),
  (35, 'Luke 17:33', 35),
  (35, 'John 12:25', 36),
  -- v.36 gain world lose soul
  (36, 'Psalm 49:7-8', 37),
  (36, 'Luke 12:20', 38),
  -- v.38 ashamed of me
  (38, 'Luke 9:26', 39),
  (38, 'Romans 1:16', 40),
  (38, '2 Timothy 1:8', 41),
  (38, 'Daniel 7:13-14', 42)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 8
  AND v.verse_number = cr.verse_number;

-- MARK CHAPTER 8 — BACKFILL (additional word_studies + cross_references)

INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'πάλιν πολλοῦ ὄχλου', 'palin pollou ochlou', 'G3825/G3793', 'Again a great crowd — palin ("again") alerts the reader this is a second feeding; Decapolis Gentile setting following 7:31.', 100),
  (2, 'προσμένουσίν μοι ἡμέρας τρεῖς', 'prosmenousin moi hēmeras treis', 'G4357/G5140', 'Continue with me three days — prosmenō: remain in attendance; crowd has out-stayed its food supply pursuing Jesus.', 101),
  (3, 'ἐκλυθήσονται ἐν τῇ ὁδῷ', 'eklythēsontai en tē hodō', 'G1590/G3598', 'Will faint on the way — ekluō: unloose, collapse; Mark''s pastoral realism about crowd welfare.', 102),
  (3, 'τινὲς αὐτῶν μακρόθεν ἥκασιν', 'tines autōn makrothen hēkasin', 'G3113/G2240', 'Some of them are come from afar — makrothen: from a distance; Gentile clientele drawn from Decapolis hinterland.', 103),
  (4, 'ἐπ᾽ ἐρημίας', 'ep erēmias', 'G2047', 'In the wilderness — erēmia: uninhabited tract; disciples still stuck in same logic of scarcity despite 6:30-44.', 104),
  (5, 'ἑπτά', 'hepta', 'G2033', 'Seven [loaves] — Mark sets up a 7/4000 symbol pair distinct from ch.6''s 5/5000 + 12; "seven" has Gentile/creation resonance.', 105),
  (6, 'παραγγείλας τῷ ὄχλῳ ἀναπεσεῖν', 'parangeilas tō ochlō anapesein', 'G3853/G377', 'Having instructed the crowd to recline — parangellō: military-style order; Mark pictures Jesus as commanding host.', 106),
  (6, 'εὐχαριστήσας ἔκλασεν', 'eucharistēsas eklasen', 'G2168/G2806', 'Having given thanks, he broke — eucharistēsas: the verb behind "Eucharist"; slightly different term from eulogēsas in 6:41, suggesting varied early eucharistic vocabulary.', 107),
  (8, 'ἐχορτάσθησαν', 'echortasthēsan', 'G5526', 'They were filled — aorist passive of chortazō; LXX Ps 21:27 [22:26 MT] messianic banquet verb.', 108),
  (8, 'σπυρίδας ἑπτά', 'spyridas hepta', 'G4711/G2033', 'Seven large baskets — spyris: flexible woven basket (Acts 9:25 lowered Paul in one); larger than kophinos (6:43); Gentile-household style.', 109),
  (9, 'ὡς τετρακισχίλιοι', 'hōs tetrakischilioi', 'G5070', 'About four thousand — no women-and-children qualifier as in Matthew; whole crowd ~4000 souls; Gentile counterpart to the 5000 Jews.', 110),
  (10, 'Δαλμανουθά', 'Dalmanoutha', 'G1148', 'Dalmanutha — NT hapax; precise location unknown; possibly near Magdala on NW shore; scribes later "corrected" it to Magadan.', 111),
  (11, 'ζητοῦντες παρ᾽ αὐτοῦ σημεῖον ἀπὸ τοῦ οὐρανοῦ', 'zētountes par autou sēmeion apo tou ouranou', 'G2212/G4592/G3772', 'Seeking a sign from heaven — apocalyptic validation (e.g. fire, cloud); miracles already performed are deemed insufficient.', 112),
  (11, 'πειράζοντες αὐτόν', 'peirazontes auton', 'G3985', 'Testing him — peirazō: same verb used for Satan''s temptation (1:13); Mark frames the demand as satanic in tenor.', 113),
  (12, 'ἀναστενάξας τῷ πνεύματι αὐτοῦ', 'anastenaxas tō pneumati autou', 'G389/G4151', 'Having sighed deeply in his spirit — compound intensive of stenazō; Markan portrait of Jesus as emotionally invested in unbelief.', 114),
  (12, 'ἡ γενεὰ αὕτη', 'hē genea hautē', 'G1074', 'This generation — echoes Deut 32:5 / Ps 95:10 indictment of the wilderness cohort; corporate designation of rebellious Israel.', 115),
  (12, 'εἰ δοθήσεται', 'ei dothēsetai', 'G1487/G1325', 'If a sign shall be given — Hebraism for emphatic negation (literally "if it shall be given" = "certainly it shall not"); oath formula.', 116),
  (14, 'ἐπελάθοντο λαβεῖν ἄρτους', 'epelathonto labein artous', 'G1950/G740', 'Forgot to bring loaves — only Mark includes this domestic slip; sets up the misunderstanding that follows.', 117),
  (15, 'ὁρᾶτε, βλέπετε ἀπὸ τῆς ζύμης', 'horate, blepete apo tēs zymēs', 'G3708/G991/G2219', 'See, beware of the leaven — double imperative of visual perception; leaven = corrupting influence of pharisaic/Herodian political compromise.', 118),
  (15, 'τῶν Ἡρῳδιανῶν', 'tōn Hērōdianōn', 'G2265', 'Of the Herodians — party of Antipas supporters; Mark alone pairs them with Pharisees here (Matt 16:6 says "Sadducees").', 119),
  (17, 'οὔπω νοεῖτε οὐδὲ συνίετε', 'oupō noeite oude syniete', 'G3768/G3539/G4920', 'Neither perceive nor understand — noeō = intellectual grasp; syniēmi = connective insight; Jesus diagnoses a double cognitive failure.', 120),
  (17, 'πεπωρωμένην ἔχετε τὴν καρδίαν', 'pepōrōmenēn echete tēn kardian', 'G4456/G2588', 'Have you your heart hardened — perfect passive of pōroō; same hardening verb as 6:52; Mark diagnoses disciples with Pharaoh-style obduracy.', 121),
  (18, 'ὀφθαλμοὺς ἔχοντες οὐ βλέπετε', 'ophthalmous echontes ou blepete', 'G3788/G991', 'Having eyes do you not see — direct quotation of Jer 5:21; Mark applies prophetic indictment of apostate Israel to the Twelve.', 122),
  (22, 'Βηθσαϊδάν', 'Bēthsaidan', 'G966', 'Bethsaida — "house of fishing" on NE shore; Philip''s/Andrew''s/Peter''s hometown (John 1:44); site of two-stage healing.', 123),
  (23, 'ἐπιλαβόμενος τῆς χειρὸς τοῦ τυφλοῦ', 'epilabomenos tēs cheiros tou typhlou', 'G1949/G5185', 'Taking hold of the hand of the blind man — tactile gentleness; Mark alone preserves this detail.', 124),
  (23, 'ἐξήνεγκεν αὐτὸν ἔξω τῆς κώμης', 'exēnenken auton exō tēs kōmēs', 'G1627/G2968', 'Led him out of the village — private setting away from spectacle; Jesus curates the miracle away from publicity.', 125),
  (23, 'πτύσας εἰς τὰ ὄμματα', 'ptysas eis ta ommata', 'G4429/G3659', 'Having spat on his eyes — saliva-application recalls 7:33; pagan folk-medicine cognate rituals made this recognisable.', 126),
  (24, 'ὡς δένδρα περιπατοῦντας', 'hōs dendra peripatountas', 'G1186/G4043', 'As trees walking — only progressive cure in the gospels; models disciples'' partial sight re: Jesus''s identity in following pericope.', 127),
  (25, 'ἐνέβλεπεν τηλαυγῶς', 'eneblepen tēlaugōs', 'G1689/G5081', 'Saw everything clearly — tēlaugōs (NT hapax): from tēle + augē, "far-shining"; total visual restoration metaphor for spiritual illumination.', 128),
  (26, 'εἰς τὸν οἶκον', 'eis ton oikon', 'G3624', 'To his home — Jesus directs him away from the public in order not to spark the kind of publicity that derails his mission (cf. 1:44-45).', 129),
  (27, 'Καισαρείας τῆς Φιλίππου', 'Kaisareias tēs Philippou', 'G2542/G5376', 'Caesarea Philippi — Gentile city near Mt Hermon at the Paneas grotto sacred to Pan; pagan stage for Peter''s Christ-confession.', 130),
  (27, 'τίνα με λέγουσιν οἱ ἄνθρωποι εἶναι', 'tina me legousin hoi anthrōpoi einai', 'G5101/G3004', 'Who do men say that I am — Jesus first audits popular opinion before pressing the disciples'' own verdict.', 131),
  (28, 'Ἠλίαν ... ἕνα τῶν προφητῶν', 'Ēlian ... hena tōn prophētōn', 'G2243/G4396', 'Elijah ... one of the prophets — Mal 4:5 forerunner hope + generic eschatological prophet (Deut 18:15); all answers locate Jesus within existing categories.', 132),
  (29, 'σὺ εἶ ὁ Χριστός', 'sy ei ho Christos', 'G4771/G5547', 'Thou art the Christ — emphatic sy, definite article before Christos: the promised Messiah of Israel, no mere prophet.', 133),
  (30, 'ἐπετίμησεν αὐτοῖς', 'epetimēsen autois', 'G2008', 'Strictly charged them — epitimaō: stern rebuke-level command; Markan messianic secret at its sharpest.', 134),
  (31, 'ἤρξατο διδάσκειν αὐτοὺς', 'ērxato didaskein autous', 'G756/G1321', 'Began to teach them — new pedagogical phase: from "who" to "what he must undergo"; passion predictions now dominate.', 135),
  (31, 'παθεῖν ... ἀποδοκιμασθῆναι', 'pathein ... apodokimasthēnai', 'G3958/G593', 'To suffer ... to be rejected — apodokimazō: official rejection after examination; Ps 118:22 rejected-stone language.', 136),
  (31, 'ἀναστῆναι', 'anastēnai', 'G450', 'To rise again — anistēmi infinitive; the triumphant apodosis of every passion formula; neither suffering alone nor rising alone is the gospel.', 137),
  (32, 'παρρησίᾳ τὸν λόγον ἐλάλει', 'parrēsia ton logon elalei', 'G3954/G3056', 'Spoke the word openly — parrēsia: frank, unconcealed speech; Mark signals that the passion teaching is the secret now disclosed.', 138),
  (32, 'προσλαβόμενος αὐτὸν ὁ Πέτρος', 'proslabomenos auton ho Petros', 'G4355', 'Peter, having taken him aside — proslambanō: drew him into private consultation as if to correct; Peter''s presumption intensifies the rebuke.', 139),
  (33, 'ἐπιστραφεὶς καὶ ἰδὼν τοὺς μαθητὰς', 'epistrapheis kai idōn tous mathētas', 'G1994/G1492', 'Turning and seeing the disciples — Jesus rebukes Peter publicly; Peter''s private counsel exposed as collective temptation.', 140),
  (33, 'ὕπαγε ὀπίσω μου, Σατανᾶ', 'hypage opisō mou, Satana', 'G5217/G3694/G4567', 'Get behind me, Satan — same imperative as Matt 4:10; Peter unwittingly functions as satanic voice against the cross.', 141),
  (33, 'οὐ φρονεῖς τὰ τοῦ θεοῦ', 'ou phroneis ta tou theou', 'G5426', 'You are not minding the things of God — phroneō: settled pattern of thought; diagnostic verb Paul picks up in Rom 8:5-7.', 142),
  (34, 'ἀπαρνησάσθω ἑαυτόν', 'aparnēsasthō heauton', 'G533/G1438', 'Let him deny himself — aparneomai: categorical repudiation; the same verb used of Peter''s triple denial (14:30).', 143),
  (34, 'ἀράτω τὸν σταυρὸν αὐτοῦ', 'aratō ton stauron autou', 'G142/G4716', 'Let him take up his cross — possessive "his own cross": condemned men carried their own patibulum to execution; discipleship analogised to death-march.', 144),
  (35, 'ἕνεκεν ἐμοῦ καὶ τοῦ εὐαγγελίου', 'heneken emou kai tou euangeliou', 'G1752/G2098', 'For my sake and the gospel''s — Mark alone adds "and the gospel"; gospel-proclamation costs equated with allegiance to Christ himself.', 145),
  (36, 'ζημιωθῆναι τὴν ψυχὴν', 'zēmiōthēnai tēn psychēn', 'G2210/G5590', 'Forfeit the soul — zēmioō: suffer loss in commercial transaction; the "profit" of the world cannot offset this debit.', 146),
  (37, 'ἀντάλλαγμα τῆς ψυχῆς', 'antallagma tēs psychēs', 'G465/G5590', 'Exchange for the soul — antallagma NT hapax (cf. Matt 16:26); LXX Jer 15:13; Ps 49:7-8: no ransom price available in created order.', 147),
  (38, 'ἐπαισχυνθῇ ... ἐπαισχυνθήσεται', 'epaischynthē ... epaischynthēsetai', 'G1870', 'Is ashamed ... will be ashamed — talionic reciprocity; present-age shame matched by eschatological reckoning at the Parousia.', 148),
  (38, 'ἐν τῇ δόξῃ τοῦ πατρὸς', 'en tē doxē tou patros', 'G1391/G3962', 'In the glory of the Father — theophanic glory-cloud imagery (Exod 16:10; Dan 7:13-14); Son of Man shares Father''s own radiance.', 149)
) AS w(verse_number, original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 8 AND v.verse_number = w.verse_number
ON CONFLICT DO NOTHING;

INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, x.reference, x.ref_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Matthew 15:32', 100),
  (2, 'Matthew 12:40', 101),
  (3, '1 Samuel 14:28', 102),
  (4, 'Psalm 78:19-20', 103),
  (4, 'Numbers 11:22', 104),
  (5, 'Matthew 15:34', 105),
  (6, 'Mark 6:39', 106),
  (6, 'Matthew 15:36', 107),
  (6, '1 Corinthians 11:24', 108),
  (7, 'Matthew 15:34', 109),
  (8, 'Psalm 22:26', 110),
  (8, 'Matthew 15:37', 111),
  (9, 'Matthew 15:38', 112),
  (10, 'Matthew 15:39', 113),
  (11, 'Matthew 16:1', 114),
  (11, 'John 6:30', 115),
  (12, 'Matthew 12:39', 116),
  (12, 'Jonah 1:17', 117),
  (12, 'Deuteronomy 32:5', 118),
  (14, 'Matthew 16:5', 119),
  (15, 'Matthew 16:11', 120),
  (15, 'Mark 3:6', 121),
  (17, 'Isaiah 6:10', 122),
  (17, 'Mark 16:14', 123),
  (18, 'Jeremiah 5:21', 124),
  (18, 'Romans 11:8', 125),
  (19, 'John 6:13', 126),
  (19, 'Matthew 14:20', 127),
  (20, 'Matthew 15:37', 128),
  (21, 'Mark 8:17-18', 129),
  (22, 'Mark 6:45', 130),
  (22, 'Matthew 11:21', 131),
  (23, 'Mark 7:33', 132),
  (23, 'John 9:6', 133),
  (25, 'Acts 9:18', 134),
  (25, '2 Kings 6:17', 135),
  (26, 'Mark 7:36', 136),
  (26, 'Matthew 8:4', 137),
  (27, 'Matthew 16:13', 138),
  (28, 'Mark 6:14-15', 139),
  (28, 'Matthew 16:14', 140),
  (29, 'Acts 9:22', 141),
  (29, '1 John 4:15', 142),
  (30, 'Mark 9:9', 143),
  (30, 'Matthew 16:20', 144),
  (31, 'Psalm 118:22', 145),
  (31, 'Acts 4:11', 146),
  (31, '1 Corinthians 15:4', 147),
  (31, 'Hosea 6:2', 148),
  (32, 'Matthew 16:22', 149),
  (33, 'Mark 9:33-35', 150),
  (33, 'Romans 8:5-7', 151),
  (34, 'Luke 9:23', 152),
  (34, 'Matthew 16:24', 153),
  (34, 'Romans 8:13', 154),
  (34, 'Titus 2:12', 155),
  (35, 'Matthew 16:25', 156),
  (35, 'Revelation 12:11', 157),
  (36, 'Matthew 16:26', 158),
  (36, '1 Timothy 6:7', 159),
  (37, 'Psalm 49:8', 160),
  (37, 'Job 2:4', 161),
  (38, 'Matthew 16:27', 162),
  (38, 'Jude 1:14-15', 163),
  (38, 'Hebrews 11:26', 164)
) AS x(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 8 AND v.verse_number = x.verse_number
ON CONFLICT DO NOTHING;
