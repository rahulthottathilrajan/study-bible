-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 2 — The Righteous Judgment of God
-- 29 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Romans 2 springs a devastating trap on the self-righteous moralist. Having catalogued pagan depravity in chapter 1, Paul now turns to the person who says ''I would never do such things'' — and declares: ''Therefore thou art inexcusable, O man, whosoever thou art that judgest: for wherein thou judgest another, thou condemnest thyself; for thou that judgest doest the same things'' (v.1). God''s judgment is ''according to truth'' (v.2), and his goodness is designed to lead sinners to repentance (v.4). But the impenitent heart is ''treasuring up wrath'' for ''the day of wrath and revelation of the righteous judgment of God'' (v.5). God ''will render to every man according to his deeds'' (v.6): eternal life to those who seek glory and immortality (v.7), but ''indignation and wrath'' to the contentious who obey not the truth (v.8). ''There is no respect of persons with God'' (v.11). Paul then addresses the question of the law: Gentiles who sin without the law perish without the law; Jews who sin under the law are judged by the law (v.12). Remarkably, Paul says Gentiles who ''do by nature the things contained in the law'' show ''the work of the law written in their hearts'' (vv.14-15). From v.17 Paul directly confronts the Jewish reader who boasts in the law: ''thou that preachest a man should not steal, dost thou steal?'' (v.21). Circumcision profits only if one keeps the law (v.25); an uncircumcised Gentile who fulfils the law will judge the circumcised lawbreaker (v.27). The chapter culminates in the radical redefinition: ''he is a Jew, which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter'' (v.29).',
  'God''s Impartial Judgment and the Failure of Moral Privilege',
  'κρίμα (krima)',
  'Judgment, verdict, judicial decision — from krinō (to judge, to separate, to decide). God''s krima is according to truth (v.2), impartial (v.11), and inescapable (v.3). The chapter dismantles every form of self-righteous exemption from divine judgment: moral superiority, religious knowledge, and ritual observance all fail as defenses before the bar of God''s impartial justice.',
  '["The Self-Righteous Judge is Without Excuse (vv.1-5): Therefore thou art inexcusable O man whosoever thou art that judgest for wherein thou judgest another thou condemnest thyself for thou that judgest doest the same things and we know that the judgment of God is according to truth against them which commit such things despisest thou the riches of his goodness and forbearance and longsuffering not knowing that the goodness of God leadeth thee to repentance","God Renders to Every Man According to His Deeds (vv.6-11): Who will render to every man according to his deeds to them who by patient continuance in well doing seek for glory and honour and immortality eternal life but unto them that are contentious and do not obey the truth but obey unrighteousness indignation and wrath for there is no respect of persons with God","The Law Written on the Heart (vv.12-16): For as many as have sinned without law shall also perish without law and as many as have sinned in the law shall be judged by the law for when the Gentiles which have not the law do by nature the things contained in the law these having not the law are a law unto themselves which shew the work of the law written in their hearts","The Jew and the Law: Privilege Without Practice (vv.17-24): Behold thou art called a Jew and restest in the law and makest thy boast of God thou that preachest a man should not steal dost thou steal for the name of God is blasphemed among the Gentiles through you","True Circumcision is of the Heart (vv.25-29): For circumcision verily profiteth if thou keep the law but if thou be a breaker of the law thy circumcision is made uncircumcision for he is not a Jew which is one outwardly but he is a Jew which is one inwardly and circumcision is that of the heart in the spirit and not in the letter whose praise is not of men but of God"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 29 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Therefore thou art inexcusable, O man, whosoever thou art that judgest: for wherein thou judgest another, thou condemnest thyself; for thou that judgest doest the same things.',
   'Διὸ ἀναπολόγητος εἶ ὦ ἄνθρωπε πᾶς ὁ κρίνων ἐν ᾧ γὰρ κρίνεις τὸν ἕτερον σεαυτὸν κατακρίνεις τὰ γὰρ αὐτὰ πράσσεις ὁ κρίνων',
   'Dio anapologētos ei ō anthrōpe pas ho krinōn en hō gar krineis ton heteron seauton katakrineis ta gar auta prasseis ho krinōn',
   '''Inexcusable'' (anapologētos — the same word as 1:20; the moralist is as inexcusable as the pagan). ''O man'' (ō anthrōpe — a direct address to the reader who has been nodding along with chapter 1). ''Whosoever thou art that judgest'' — Paul does not say ''you Jew'' yet; the trap is set for anyone who judges. ''Doest the same things'' — not necessarily identical sins, but the same categories of sin (perhaps in subtler forms). The moral judge condemns himself by his own standard.',
   NULL),
  (2, 'But we are sure that the judgment of God is according to truth against them which commit such things.',
   'οἴδαμεν δὲ ὅτι τὸ κρίμα τοῦ θεοῦ ἐστιν κατὰ ἀλήθειαν ἐπὶ τοὺς τὰ τοιαῦτα πράσσοντας',
   'oidamen de hoti to krima tou theou estin kata alētheian epi tous ta toiauta prassontas',
   '''We are sure'' (oidamen — we know; common knowledge among believers). ''According to truth'' (kata alētheian — in accordance with reality, not appearances). Human judgment is based on externals; God''s judgment penetrates to reality. This is the first of three principles of divine judgment in this chapter: according to truth (v.2), according to deeds (v.6), without partiality (v.11).',
   NULL),
  (3, 'And thinkest thou this, O man, that judgest them which do such things, and doest the same, that thou shalt escape the judgment of God?',
   'λογίζῃ δὲ τοῦτο ὦ ἄνθρωπε ὁ κρίνων τοὺς τὰ τοιαῦτα πράσσοντας καὶ ποιῶν αὐτά ὅτι σὺ ἐκφεύξῃ τὸ κρίμα τοῦ θεοῦ',
   'logizē de touto ō anthrōpe ho krinōn tous ta toiauta prassontas kai poiōn auta hoti sy ekpheuxē to krima tou theou',
   '''Thinkest thou'' (logizē — do you reckon, do you calculate; the moralist has done a mental calculation: ''I judge others, therefore I am exempt''). ''Escape'' (ekpheuxē — flee out of, evade). The answer is emphatically no: judging others does not create an exemption from God''s judgment; it intensifies one''s own accountability.',
   NULL),
  (4, 'Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of God leadeth thee to repentance?',
   'ἢ τοῦ πλούτου τῆς χρηστότητος αὐτοῦ καὶ τῆς ἀνοχῆς καὶ τῆς μακροθυμίας καταφρονεῖς ἀγνοῶν ὅτι τὸ χρηστὸν τοῦ θεοῦ εἰς μετάνοιάν σε ἄγει',
   'ē tou ploutou tēs chrēstotētos autou kai tēs anochēs kai tēs makrothymias kataphroneis agnoōn hoti to chrēston tou theou eis metanoian se agei',
   '''Despisest'' (kataphroneis — think down on, treat with contempt; the moralist despises God''s patience by presuming upon it). ''Riches'' (ploutou — wealth, abundance). Three divine attributes: ''goodness'' (chrēstotētos — kindness, generosity), ''forbearance'' (anochēs — holding back, restraint), ''longsuffering'' (makrothymias — patience, slow anger). ''Leadeth thee to repentance'' (eis metanoian se agei — is leading you toward a change of mind). God''s patience is not indifference but an invitation.',
   'This verse reveals the purpose of divine patience: it is not approval of sin but an opportunity for repentance. God''s goodness is therapeutic — designed to lead (agei, present tense: keeps on leading) to metanoia (repentance, a complete change of mind). To mistake God''s patience for permission is to ''despise'' (kataphroneis) the very grace that is keeping one alive.'),
  (5, 'But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of God;',
   'κατὰ δὲ τὴν σκληρότητά σου καὶ ἀμετανόητον καρδίαν θησαυρίζεις σεαυτῷ ὀργὴν ἐν ἡμέρᾳ ὀργῆς καὶ ἀποκαλύψεως δικαιοκρισίας τοῦ θεοῦ',
   'kata de tēn sklērotēta sou kai ametanoēton kardian thēsaurizeis seautō orgēn en hēmera orgēs kai apokalypseōs dikaiokrisia tou theou',
   '''Hardness'' (sklērotēta — stubbornness, obstinacy; related to ''sclerosis''). ''Impenitent'' (ametanoēton — unrepentant; a- privative + metanoeō). ''Treasurest up'' (thēsaurizeis — storing up, accumulating treasure; a horrifying irony: the impenitent is building a savings account of wrath). ''Day of wrath'' (hēmera orgēs — the final judgment day). ''Righteous judgment'' (dikaiokrisia — a compound found only here in the NT: just-judgment). Every day of impenitence adds to the treasury of wrath.',
   NULL),
  (6, 'Who will render to every man according to his deeds:',
   'ὃς ἀποδώσει ἑκάστῳ κατὰ τὰ ἔργα αὐτοῦ',
   'hos apodōsei hekastō kata ta erga autou',
   '''Render'' (apodōsei — pay back, recompense; God is a just paymaster). ''According to his deeds'' (kata ta erga autou — quoting Psalm 62:12 and Proverbs 24:12). This is not salvation by works (which Paul will demolish in ch.3-4) but the principle that God judges the whole life, not just profession. Deeds reveal the heart; judgment is according to reality.',
   NULL),
  (7, 'To them who by patient continuance in well doing seek for glory and honour and immortality, eternal life:',
   'τοῖς μὲν καθ᾿ ὑπομονὴν ἔργου ἀγαθοῦ δόξαν καὶ τιμὴν καὶ ἀφθαρσίαν ζητοῦσιν ζωὴν αἰώνιον',
   'tois men kath hypomonēn ergou agathou doxan kai timēn kai aphtharsian zētousin zōēn aiōnion',
   '''Patient continuance'' (kath hypomonēn — by means of endurance). ''Well doing'' (ergou agathou — good work; singular: a life characterized by good). ''Seek'' (zētousin — actively pursuing). ''Glory and honour and immortality'' — the objects of their seeking. ''Eternal life'' (zōēn aiōnion) — God''s gift to those whose lives are oriented toward him. Paul is not contradicting justification by faith but describing the kind of life that faith produces.',
   NULL),
  (8, 'But unto them that are contentious, and do not obey the truth, but obey unrighteousness, indignation and wrath,',
   'τοῖς δὲ ἐξ ἐριθείας καὶ ἀπειθοῦσιν μὲν τῇ ἀληθείᾳ πειθομένοις δὲ τῇ ἀδικίᾳ θυμὸς καὶ ὀργή',
   'tois de ex eritheias kai apeithousin men tē alētheia peithomenois de tē adikia thymos kai orgē',
   '''Contentious'' (ex eritheias — from selfish ambition, factious rivalry). ''Do not obey the truth'' (apeithousin tē alētheia — disobey, are unpersuaded by the truth). ''Obey unrighteousness'' (peithomenois tē adikia — are persuaded by, yield to unrighteousness). ''Indignation and wrath'' (thymos kai orgē — fury and settled anger; thymos is the hot flash of anger, orgē the abiding disposition).',
   NULL),
  (9, 'Tribulation and anguish, upon every soul of man that doeth evil, of the Jew first, and also of the Gentile;',
   'θλῖψις καὶ στενοχωρία ἐπὶ πᾶσαν ψυχὴν ἀνθρώπου τοῦ κατεργαζομένου τὸ κακόν Ἰουδαίου τε πρῶτον καὶ Ἕλληνος',
   'thlipsis kai stenochōria epi pasan psychēn anthrōpou tou katergazomenou to kakon Ioudaiou te prōton kai Hellēnos',
   '''Tribulation'' (thlipsis — pressure, affliction). ''Anguish'' (stenochōria — narrowness, constriction; the feeling of being hemmed in with no escape). ''Of the Jew first'' — just as the gospel comes to the Jew first (1:16), so does judgment. Priority in privilege means priority in accountability.',
   NULL),
  (10, 'But glory, honour, and peace, to every man that worketh good, to the Jew first, and also to the Gentile:',
   'δόξα δὲ καὶ τιμὴ καὶ εἰρήνη παντὶ τῷ ἐργαζομένῳ τὸ ἀγαθόν Ἰουδαίῳ τε πρῶτον καὶ Ἕλληνι',
   'doxa de kai timē kai eirēnē panti tō ergazomenō to agathon Ioudaiō te prōton kai Hellēni',
   '''Glory, honour, and peace'' — the positive counterpart to v.9. ''To every man that worketh good'' — the same impartiality applies to blessing as to judgment. ''To the Jew first'' — consistent principle: Jewish priority in both blessing and accountability.',
   NULL),
  (11, 'For there is no respect of persons with God.',
   'οὐ γάρ ἐστιν προσωπολημψία παρὰ τῷ θεῷ',
   'ou gar estin prosōpolēmpsia para tō theō',
   '''Respect of persons'' (prosōpolēmpsia — partiality, face-receiving; from prosōpon [face] + lambanō [to receive]; literally ''receiving the face'' — judging by external appearance or social status). This is the third principle of God''s judgment: no favouritism. Being Jewish, being religious, being moral — none of these create an exemption. God looks through every mask to the heart beneath.',
   'This verse demolishes every claim to special exemption from divine judgment. God does not judge by ethnicity, religious pedigree, social status, or outward appearance. His judgment is according to truth (v.2), according to deeds (v.6), and without partiality (v.11). This triad of principles establishes the universal accountability of all humanity — the necessary foundation for the gospel of grace in chapters 3-5.'),
  (12, 'For as many as have sinned without law shall also perish without law: and as many as have sinned in the law shall be judged by the law;',
   'ὅσοι γὰρ ἀνόμως ἥμαρτον ἀνόμως καὶ ἀπολοῦνται καὶ ὅσοι ἐν νόμῳ ἥμαρτον διὰ νόμου κριθήσονται',
   'hosoi gar anomōs hēmarton anomōs kai apolountai kai hosoi en nomō hēmarton dia nomou krithēsontai',
   '''Without law'' (anomōs — without the Mosaic law; Gentiles). ''Perish without law'' — Gentiles will not be judged by a law they never received but by the light they did have. ''In the law'' (en nomō — under the Mosaic economy; Jews). ''Judged by the law'' (dia nomou krithēsontai — the law itself becomes the standard of judgment). Having the law is no advantage if one breaks the law; it only increases accountability.',
   NULL),
  (13, '(For not the hearers of the law are just before God, but the doers of the law shall be justified.',
   'οὐ γὰρ οἱ ἀκροαταὶ τοῦ νόμου δίκαιοι παρὰ τῷ θεῷ ἀλλ᾿ οἱ ποιηταὶ τοῦ νόμου δικαιωθήσονται',
   'ou gar hoi akroatai tou nomou dikaioi para tō theō all hoi poiētai tou nomou dikaiōthēsontai',
   '''Hearers'' (akroatai — listeners, auditors; those who attend the synagogue reading). ''Doers'' (poiētai — those who do, practitioners). ''Justified'' (dikaiōthēsontai — will be declared righteous). Mere possession or hearing of the law confers no righteousness; only doing the law would justify. But since no one does the law perfectly (3:10, 20, 23), this verse actually sets up the impossibility of law-based justification.',
   NULL),
  (14, 'For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves:',
   'ὅταν γὰρ ἔθνη τὰ μὴ νόμον ἔχοντα φύσει τὰ τοῦ νόμου ποιῇ οὗτοι νόμον μὴ ἔχοντες ἑαυτοῖς εἰσιν νόμος',
   'hotan gar ethnē ta mē nomon echonta physei ta tou nomou poiē houtoi nomon mē echontes heautois eisin nomos',
   '''By nature'' (physei — naturally, instinctively; not by Mosaic instruction but by an innate moral sense). ''Do the things contained in the law'' — not perfect obedience but partial conformity to moral principles that the law codifies. ''A law unto themselves'' — they have an internal moral standard that corresponds to the external Mosaic code. This does not mean they are saved by natural morality but that God has not left even Gentiles without moral witness.',
   NULL),
  (15, 'Which shew the work of the law written in their hearts, their conscience also bearing witness, and their thoughts the mean while accusing or else excusing one another;)',
   'οἵτινες ἐνδείκνυνται τὸ ἔργον τοῦ νόμου γραπτὸν ἐν ταῖς καρδίαις αὐτῶν συμμαρτυρούσης αὐτῶν τῆς συνειδήσεως καὶ μεταξὺ ἀλλήλων τῶν λογισμῶν κατηγορούντων ἢ καὶ ἀπολογουμένων',
   'hoitines endeiknyntai to ergon tou nomou grapton en tais kardiais autōn symmartyrousēs autōn tēs syneidēseōs kai metaxy allēlōn tōn logismōn katēgorountōn ē kai apologoumenōn',
   '''The work of the law written in their hearts'' (to ergon tou nomou grapton en tais kardiais — the requirement of the law inscribed on the heart; not the full Mosaic code but the moral essence). ''Conscience'' (syneidēseōs — co-knowledge, moral self-awareness; the inner witness that evaluates conduct). ''Accusing or else excusing'' — the conscience operates as an internal courtroom where thoughts prosecute and defend. This is the basis of universal moral accountability even without special revelation.',
   'This verse is foundational for the doctrine of conscience and natural moral law. Paul teaches that God has written the substance of his moral requirements on every human heart. The conscience (syneidēsis) functions as an internal witness, sometimes accusing and sometimes defending. This does not save anyone (conscience is imperfect and culturally conditioned) but it establishes that no human being is entirely without moral light. Cf. Jeremiah 31:33 for the new covenant promise of law written on the heart.'),
  (16, 'In the day when God shall judge the secrets of men by Jesus Christ according to my gospel.',
   'ἐν ἡμέρᾳ ὅτε κρινεῖ ὁ θεὸς τὰ κρυπτὰ τῶν ἀνθρώπων κατὰ τὸ εὐαγγέλιόν μου διὰ Ἰησοῦ Χριστοῦ',
   'en hēmera hote krinei ho theos ta krypta tōn anthrōpōn kata to euangelion mou dia Iēsou Christou',
   '''The secrets of men'' (ta krypta tōn anthrōpōn — the hidden things; God''s judgment penetrates beyond actions to motives, thoughts, and hidden deeds). ''By Jesus Christ'' (dia Iēsou Christou — through Jesus Christ; Christ is the appointed judge, cf. Acts 17:31). ''According to my gospel'' — the message of future judgment is part of the gospel, not separate from it.',
   NULL),
  (17, 'Behold, thou art called a Jew, and restest in the law, and makest thy boast of God,',
   'Ἴδε σὺ Ἰουδαῖος ἐπονομάζῃ καὶ ἐπαναπαύῃ τῷ νόμῳ καὶ καυχᾶσαι ἐν θεῷ',
   'Ide sy Ioudaios eponomazē kai epanapaūē tō nomō kai kauchāsai en theō',
   '''Behold'' (Ide — now then, look; Paul finally names his target). ''Called a Jew'' (Ioudaios eponomazē — bear the name Jew; the name itself was a source of pride, from Judah = praise). ''Restest in the law'' (epanapaūē tō nomō — lean upon, rely on the law as a pillow of security). ''Makest thy boast of God'' (kauchāsai en theō — glory in your relationship with God). These are genuine privileges — but they become dangerous when they substitute for actual obedience.',
   NULL),
  (18, 'And knowest his will, and approvest the things that are more excellent, being instructed out of the law;',
   'καὶ γινώσκεις τὸ θέλημα καὶ δοκιμάζεις τὰ διαφέροντα κατηχούμενος ἐκ τοῦ νόμου',
   'kai ginōskeis to thelēma kai dokimazeis ta diapheronta katēchoumenos ek tou nomou',
   '''Knowest his will'' (ginōskeis to thelēma — you know God''s will from the law). ''Approvest the things that are more excellent'' (dokimazeis ta diapheronta — you can test and distinguish what matters). ''Instructed'' (katēchoumenos — catechized, taught orally from the law). The Jewish person has a genuine advantage in moral knowledge. The question is whether knowledge produces obedience.',
   NULL),
  (19, 'And art confident that thou thyself art a guide of the blind, a light of them which are in darkness,',
   'πέποιθάς τε σεαυτὸν ὁδηγὸν εἶναι τυφλῶν φῶς τῶν ἐν σκότει',
   'pepoithas te seauton hodēgon einai typhlōn phōs tōn en skotei',
   '''Confident'' (pepoithas — persuaded, self-assured). ''Guide of the blind'' (hodēgon typhlōn — a leader of those who cannot see). ''Light of them which are in darkness'' — Israel''s self-understanding as teacher to the nations (cf. Isaiah 42:6-7). These claims are not wrong in themselves — Israel was called to be a light — but they become hypocritical when the teacher does not practice what he preaches.',
   NULL),
  (20, 'An instructor of the foolish, a teacher of babes, which hast the form of knowledge and of the truth in the law.',
   'παιδευτὴν ἀφρόνων διδάσκαλον νηπίων ἔχοντα τὴν μόρφωσιν τῆς γνώσεως καὶ τῆς ἀληθείας ἐν τῷ νόμῳ',
   'paideutēn aphronōn didaskalon nēpiōn echonta tēn morphōsin tēs gnōseōs kai tēs alētheias en tō nomō',
   '''Instructor'' (paideutēn — trainer, disciplinarian; one who educates by correction). ''Form of knowledge'' (morphōsin tēs gnōseōs — the embodiment, the outward shape of knowledge and truth). The law provides a genuine ''form'' (morphōsis) of truth — a framework, an outline. But having the form without the substance is worse than useless; it is self-deceiving.',
   NULL),
  (21, 'Thou therefore which teachest another, teachest thou not thyself? thou that preachest a man should not steal, dost thou steal?',
   'ὁ οὖν διδάσκων ἕτερον σεαυτὸν οὐ διδάσκεις ὁ κηρύσσων μὴ κλέπτειν κλέπτεις',
   'ho oun didaskōn heteron seauton ou didaskeis ho kēryssōn mē kleptein klepteis',
   'Paul launches four devastating rhetorical questions (vv.21-23). ''Teachest thou not thyself?'' — the teacher who does not learn from his own instruction. ''Dost thou steal?'' — perhaps literal theft, or perhaps broader dishonesty. The gap between teaching and practice is the essence of hypocrisy.',
   NULL),
  (22, 'Thou that sayest a man should not commit adultery, dost thou commit adultery? thou that abhorrest idols, dost thou commit sacrilege?',
   'ὁ λέγων μὴ μοιχεύειν μοιχεύεις ὁ βδελυσσόμενος τὰ εἴδωλα ἱεροσυλεῖς',
   'ho legōn mē moicheuein moicheueis ho bdelyssomenos ta eidōla hierosyleis',
   '''Commit sacrilege'' (hierosyleis — rob temples; some Jews, while abhorring idols, were willing to profit from pagan temple goods — a profitable hypocrisy). ''Abhorrest idols'' (bdelyssomenos ta eidōla — detest, regard as an abomination). The point: one can detest idolatry in principle while profiting from it in practice.',
   NULL),
  (23, 'Thou that makest thy boast of the law, through breaking the law dishonourest thou God?',
   'ὃς ἐν νόμῳ καυχᾶσαι διὰ τῆς παραβάσεως τοῦ νόμου τὸν θεὸν ἀτιμάζεις',
   'hos en nomō kauchāsai dia tēs parabaseōs tou nomou ton theon atimazeis',
   '''Boast of the law'' (en nomō kauchāsai — glory in the law). ''Breaking the law'' (parabaseōs tou nomou — transgression, stepping across the boundary). ''Dishonourest God'' (ton theon atimazeis — you bring dishonour upon God). The ultimate irony: the very law that is the source of boasting becomes the instrument of shame when it is broken. Boasting in the law while breaking it dishonours the Lawgiver.',
   NULL),
  (24, 'For the name of God is blasphemed among the Gentiles through you, as it is written.',
   'τὸ γὰρ ὄνομα τοῦ θεοῦ δι᾿ ὑμᾶς βλασφημεῖται ἐν τοῖς ἔθνεσιν καθὼς γέγραπται',
   'to gar onoma tou theou di hymas blasphēmeitai en tois ethnesin kathōs gegraptai',
   '''Blasphemed'' (blasphēmeitai — spoken against, dishonoured; present tense: it keeps happening). Paul quotes Isaiah 52:5 (cf. Ezekiel 36:22). The disobedience of God''s people causes the nations to speak evil of God himself. This is the severest indictment: Jewish sin does not merely harm the sinner but brings God''s name into disrepute among the very peoples Israel was meant to enlighten.',
   NULL),
  (25, 'For circumcision verily profiteth, if thou keep the law: but if thou be a breaker of the law, thy circumcision is made uncircumcision.',
   'περιτομὴ μὲν γὰρ ὠφελεῖ ἐὰν νόμον πράσσῃς ἐὰν δὲ παραβάτης νόμου ᾖς ἡ περιτομή σου ἀκροβυστία γέγονεν',
   'peritomē men gar ōphelei ean nomon prassēs ean de parabatēs nomou ēs hē peritomē sou akrobystia gegonen',
   '''Circumcision profiteth'' (peritomē ōphelei — circumcision has value). ''If thou keep the law'' — the value of circumcision is conditional on obedience. ''Made uncircumcision'' (akrobystia gegonen — has become uncircumcision; perfect tense: the transformation is complete). The sign without the substance is nullified. This was revolutionary for a Jew: the mark of the covenant could be effectively erased by disobedience.',
   NULL),
  (26, 'Therefore if the uncircumcision keep the righteousness of the law, shall not his uncircumcision be counted for circumcision?',
   'ἐὰν οὖν ἡ ἀκροβυστία τὰ δικαιώματα τοῦ νόμου φυλάσσῃ οὐχὶ ἡ ἀκροβυστία αὐτοῦ εἰς περιτομὴν λογισθήσεται',
   'ean oun hē akrobystia ta dikaiōmata tou nomou phylassē ouchi hē akrobystia autou eis peritomēn logisthēsetai',
   '''Counted for'' (logisthēsetai — reckoned, credited; the same verb Paul will use for justification by faith in ch.4). ''Keep the righteousness of the law'' (ta dikaiōmata tou nomou phylassē — guard the righteous requirements). A Gentile who fulfils the law''s moral intent is effectively circumcised in God''s sight. The reversal is complete: external ritual gives way to internal reality.',
   NULL),
  (27, 'And shall not uncircumcision which is by nature, if it fulfil the law, judge thee, who by the letter and circumcision dost transgress the law?',
   'καὶ κρινεῖ ἡ ἐκ φύσεως ἀκροβυστία τὸν νόμον τελοῦσα σὲ τὸν διὰ γράμματος καὶ περιτομῆς παραβάτην νόμου',
   'kai krinei hē ek physeōs akrobystia ton nomon telousa se ton dia grammatos kai peritomēs parabatēn nomou',
   '''Judge thee'' (krinei — the obedient Gentile will stand as a witness against the disobedient Jew at the last judgment). ''By the letter and circumcision'' (dia grammatos kai peritomēs — despite having the written code and the covenant sign). ''Transgress'' (parabatēn — a transgressor, one who steps across). Having Scripture and circumcision while breaking the law is worse than not having them at all.',
   NULL),
  (28, 'For he is not a Jew, which is one outwardly; neither is that circumcision, which is outward in the flesh:',
   'οὐ γὰρ ὁ ἐν τῷ φανερῷ Ἰουδαῖός ἐστιν οὐδὲ ἡ ἐν τῷ φανερῷ ἐν σαρκὶ περιτομή',
   'ou gar ho en tō phanerō Ioudaios estin oude hē en tō phanerō en sarki peritomē',
   '''Outwardly'' (en tō phanerō — in the visible, in the open). ''In the flesh'' (en sarki — the physical mark). Paul redefines Jewish identity: the external markers (ethnic descent, physical circumcision, cultural observance) do not constitute true Jewishness before God. This is not a rejection of Judaism but a deepening of it — reaching back to the prophetic vision of Deuteronomy 10:16 and 30:6.',
   NULL),
  (29, 'But he is a Jew, which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of God.',
   'ἀλλ᾿ ὁ ἐν τῷ κρυπτῷ Ἰουδαῖος καὶ περιτομὴ καρδίας ἐν πνεύματι οὐ γράμματι οὗ ὁ ἔπαινος οὐκ ἐξ ἀνθρώπων ἀλλ᾿ ἐκ τοῦ θεοῦ',
   'all ho en tō kryptō Ioudaios kai peritomē kardias en pneumati ou grammati hou ho epainos ouk ex anthrōpōn all ek tou theou',
   '''Inwardly'' (en tō kryptō — in the hidden, in secret). ''Circumcision of the heart'' (peritomē kardias — the inner transformation that the physical sign was always meant to represent; cf. Deuteronomy 30:6, Jeremiah 4:4). ''In the spirit'' (en pneumati — by the Spirit, or in the spiritual realm; contrasted with ''the letter''). ''Whose praise'' — a wordplay: ''Jew'' (Ioudaios) comes from ''Judah'' (Yehudah), which means ''praise.'' The true ''praise-one'' receives his praise not from men but from God.',
   'This verse is the climax of Paul''s argument in chapter 2 and one of the most revolutionary statements in the letter. True Jewish identity is not ethnic or ritual but spiritual — a matter of the heart, not the flesh. ''Circumcision of the heart'' draws on Deuteronomy 10:16 and 30:6, Jeremiah 4:4, and Ezekiel 36:26. Paul is not abolishing Jewish identity but radicalizing it: the true Jew is the one whose heart has been transformed by the Spirit. The wordplay on ''Judah/praise'' seals the argument: genuine praise comes from God, not from human recognition of external markers.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 2;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 goodness leads to repentance
  ('χρηστότης', 'chrēstotēs', 'G5544', 'Goodness, kindness, generosity — the quality of being useful and beneficial. God''s chrēstotēs is not weakness but purposeful grace: it is designed to lead sinners to repentance. Those who mistake divine patience for divine approval despise (kataphroneis) this kindness and store up wrath.', 1),
  ('μετάνοια', 'metanoia', 'G3341', 'Repentance — from meta (change) + nous (mind); a fundamental change of mind and direction. Not merely regret or remorse but a complete reorientation of thought, will, and conduct toward God. God''s goodness is the intended catalyst for this transformation. Without metanoia, divine patience only increases the treasury of wrath (v.5).', 2),
  -- v.5 treasuring up wrath
  ('θησαυρίζω', 'thēsaurizō', 'G2343', 'To store up, to treasure, to accumulate — from thēsauros (treasury, storehouse). The impenitent person is a miser of wrath, daily adding to a savings account that will be fully paid out on the day of judgment. The metaphor is devastating: the very thing one would most want to avoid, one is diligently accumulating.', 3),
  -- v.11 no respect of persons
  ('προσωπολημψία', 'prosōpolēmpsia', 'G4382', 'Partiality, favouritism, face-receiving — from prosōpon (face) + lambanō (to receive). In ancient courts, judges would ''receive the face'' of a litigant, showing favour based on social status, wealth, or connections. God never does this. His judgment is based on reality (v.2), deeds (v.6), and absolute impartiality (v.11).', 4),
  -- v.15 conscience
  ('συνείδησις', 'syneidēsis', 'G4893', 'Conscience — from syn (with) + oida (to know); literally co-knowledge, the faculty of moral self-awareness. The conscience is an internal witness that evaluates conduct by an innate moral standard. In v.15, it functions as a courtroom where thoughts prosecute (katēgorountōn) and defend (apologoumenōn). Conscience is not infallible but it demonstrates that God has not left humanity without moral witness.', 5),
  -- v.29 circumcision of heart
  ('περιτομή', 'peritomē', 'G4061', 'Circumcision — the cutting away of flesh as a sign of covenant membership. Paul distinguishes physical circumcision (en sarki, v.28) from spiritual circumcision (kardias, of the heart, v.29). True circumcision is the Spirit''s work of cutting away the sinful disposition of the heart — the reality to which the physical sign always pointed (Deut 30:6, Jer 4:4).', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 2
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4 WHEN 2 THEN 4
    WHEN 3 THEN 5
    WHEN 4 THEN 11
    WHEN 5 THEN 15
    WHEN 6 THEN 29
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 judging others
  (1, 'Matthew 7:1-5', 1),
  (1, 'John 8:7', 2),
  -- v.4 goodness leads to repentance
  (4, '2 Peter 3:9', 3),
  (4, '2 Peter 3:15', 4),
  (4, 'Exodus 34:6', 5),
  -- v.5 treasuring up wrath
  (5, 'Deuteronomy 32:34-35', 6),
  (5, 'James 5:3', 7),
  -- v.6 according to deeds
  (6, 'Psalm 62:12', 8),
  (6, 'Proverbs 24:12', 9),
  (6, 'Matthew 16:27', 10),
  (6, '2 Corinthians 5:10', 11),
  (6, 'Revelation 20:12', 12),
  -- v.11 no respect of persons
  (11, 'Deuteronomy 10:17', 13),
  (11, 'Acts 10:34', 14),
  (11, '1 Peter 1:17', 15),
  -- v.14-15 law written on hearts
  (14, 'Romans 1:19-20', 16),
  (15, 'Jeremiah 31:33', 17),
  -- v.16 judged by Jesus Christ
  (16, 'Acts 17:31', 18),
  (16, 'John 5:22', 19),
  -- v.24 name blasphemed
  (24, 'Isaiah 52:5', 20),
  (24, 'Ezekiel 36:22', 21),
  -- v.29 circumcision of heart
  (29, 'Deuteronomy 10:16', 22),
  (29, 'Deuteronomy 30:6', 23),
  (29, 'Jeremiah 4:4', 24),
  (29, 'Colossians 2:11', 25),
  (29, 'Philippians 3:3', 26)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 2
  AND v.verse_number = cr.verse_number;
