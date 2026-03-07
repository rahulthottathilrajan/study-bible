-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 12 — Spiritual Gifts and the Body of Christ
-- 31 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 12,
  'First Corinthians 12 begins a three-chapter unit on spiritual gifts (12-14) with the controlling metaphor of the body. Paul opens with ''Now concerning spiritual gifts, brethren, I would not have you ignorant'' (v.1). The foundational test of any spiritual utterance is christological: ''no man speaking by the Spirit of God calleth Jesus accursed: and no man can say that Jesus is the Lord, but by the Holy Ghost'' (v.3). Paul then establishes the Trinitarian source of all gifts: ''diversities of gifts, but the same Spirit... differences of administrations, but the same Lord... diversities of operations, but it is the same God which worketh all in all'' (vv.4-6). Each person receives a ''manifestation of the Spirit'' for the ''profit'' of all (v.7). Paul lists nine gifts: wisdom, knowledge, faith, healing, miracles, prophecy, discerning of spirits, tongues, and interpretation of tongues (vv.8-10). The Spirit distributes ''to every man severally as he will'' (v.11). The body metaphor occupies the rest of the chapter: ''For as the body is one, and hath many members, and all the members of that one body, being many, are one body: so also is Christ'' (v.12). ''By one Spirit are we all baptized into one body'' (v.13). No member can say to another ''I have no need of thee'' (v.21). The ''less honourable'' and ''uncomely'' parts receive greater honour (vv.22-24). God designed the body so that ''there should be no schism'' and all members ''should have the same care one for another'' (v.25). ''Whether one member suffer, all the members suffer with it; or one member be honoured, all the members rejoice with it'' (v.26). The chapter concludes with a second list of ministries and a series of rhetorical questions: ''Are all apostles? are all prophets?'' (v.29). The answer to each is ''no.'' The final exhortation: ''covet earnestly the best gifts: and yet shew I unto you a more excellent way'' (v.31) — setting up chapter 13.',
  'One Body, Many Members — Unity and Diversity of Spiritual Gifts',
  'χάρισμα (charisma)',
  'Grace-gift, spiritual endowment — from charis (grace). A charisma is a concrete expression of God''s grace given to individual believers for the common good of the church. Every charisma comes from the same Spirit, serves the same Lord, and empowers the same mission. No gift is self-generated or self-serving; all are other-directed. The diversity of gifts within the unity of one body is the heart of Paul''s ecclesiology.',
  '["The Test of Spiritual Utterance (vv.1-3): Now concerning spiritual gifts brethren I would not have you ignorant. Ye know that ye were Gentiles carried away unto these dumb idols even as ye were led. Wherefore I give you to understand that no man speaking by the Spirit of God calleth Jesus accursed and that no man can say that Jesus is the Lord but by the Holy Ghost","Trinitarian Source of All Gifts (vv.4-11): Now there are diversities of gifts but the same Spirit. And there are differences of administrations but the same Lord. And there are diversities of operations but it is the same God which worketh all in all. But the manifestation of the Spirit is given to every man to profit withal. All these worketh that one and the selfsame Spirit dividing to every man severally as he will","The Body Metaphor: One and Many (vv.12-20): For as the body is one and hath many members and all the members of that one body being many are one body so also is Christ. For by one Spirit are we all baptized into one body whether we be Jews or Gentiles whether we be bond or free and have been all made to drink into one Spirit. For the body is not one member but many","Every Member Essential (vv.21-26): And the eye cannot say unto the hand I have no need of thee nor again the head to the feet I have no need of you. Nay much more those members of the body which seem to be more feeble are necessary. And whether one member suffer all the members suffer with it or one member be honoured all the members rejoice with it","Gifts in the Church and the More Excellent Way (vv.27-31): Now ye are the body of Christ and members in particular. And God hath set some in the church first apostles secondarily prophets thirdly teachers after that miracles then gifts of healings helps governments diversities of tongues. Are all apostles are all prophets are all teachers are all workers of miracles. But covet earnestly the best gifts and yet shew I unto you a more excellent way"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 31 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Now concerning spiritual gifts, brethren, I would not have you ignorant.',
   'περὶ δὲ τῶν πνευματικῶν ἀδελφοί οὐ θέλω ὑμᾶς ἀγνοεῖν',
   'peri de tōn pneumatikōn adelphoi ou thelō hymas agnoein',
   '''Concerning spiritual gifts'' (peri tōn pneumatikōn — concerning the spirituals; the word can be neuter ''spiritual things/gifts'' or masculine ''spiritual persons''). ''I would not have you ignorant'' — Paul''s formula introducing important instruction (cf. 10:1; Romans 1:13; 11:25). The Corinthians were not lacking in spiritual gifts (1:7) but were confused about their proper use, especially tongues.',
   NULL),
  (2, 'Ye know that ye were Gentiles, carried away unto these dumb idols, even as ye were led.',
   'οἴδατε ὅτι ἔθνη ἦτε πρὸς τὰ εἴδωλα τὰ ἄφωνα ὡς ἂν ἤγεσθε ἀπαγόμενοι',
   'oidate hoti ethnē ēte pros ta eidōla ta aphōna hōs an ēgesthe apagomenoi',
   '''Gentiles'' (ethnē — pagans). ''Dumb idols'' (eidōla ta aphōna — voiceless, mute idols; they cannot speak). ''Carried away'' (apagomenoi — led away, dragged along; the passive suggests irresistible compulsion). Paul reminds them of their pre-Christian experience: they were swept along by spiritual forces connected to speechless idols. In contrast, the Spirit of God speaks — the fundamental difference between pagan ecstasy and genuine spiritual gifts.',
   NULL),
  (3, 'Wherefore I give you to understand, that no man speaking by the Spirit of God calleth Jesus accursed: and that no man can say that Jesus is the Lord, but by the Holy Ghost.',
   'διὸ γνωρίζω ὑμῖν ὅτι οὐδεὶς ἐν πνεύματι θεοῦ λαλῶν λέγει ἀνάθεμα Ἰησοῦν καὶ οὐδεὶς δύναται εἰπεῖν κύριον Ἰησοῦν εἰ μὴ ἐν πνεύματι ἁγίῳ',
   'dio gnōrizō hymin hoti oudeis en pneumati theou lalōn legei anathema Iēsoun kai oudeis dynatai eipein kyrion Iēsoun ei mē en pneumati hagiō',
   '''Accursed'' (anathema — devoted to destruction, cursed). ''Jesus is the Lord'' (kyrion Iēsoun — Jesus is Lord; the most basic Christian confession). The fundamental criterion for distinguishing true spiritual speech from false: does it exalt or curse Christ? No one speaking by God''s Spirit can curse Jesus; no one can make the genuine confession ''Jesus is Lord'' except by the Holy Spirit. Content, not emotional intensity, validates spiritual utterance.',
   'This verse establishes the christological test for all spiritual phenomena. In Corinth, ecstatic speech was valued for its intensity, not its content. Paul reverses the priority: the content of the utterance determines its source. Any ''spiritual'' experience that denies, diminishes, or curses Christ is not from the Holy Spirit. Conversely, the genuine confession ''Jesus is Lord'' (kyrion Iēsoun) — with all its implications of allegiance, submission, and devotion — can only be produced by the Holy Spirit. This test remains the primary criterion for evaluating all claims to spiritual experience.'),
  (4, 'Now there are diversities of gifts, but the same Spirit.',
   'διαιρέσεις δὲ χαρισμάτων εἰσίν τὸ δὲ αὐτὸ πνεῦμα',
   'diaireseis de charismatōn eisin to de auto pneuma',
   '''Diversities'' (diaireseis — distributions, apportionments; from diaireō, to divide, distribute). ''Gifts'' (charismatōn — grace-gifts). ''Same Spirit'' (to auto pneuma). The gifts are diverse; the source is singular. Diversity without division; variety without rivalry. The Spirit distributes different gifts to different people, but all gifts flow from the one Spirit. This is the Trinitarian basis for unity in diversity.',
   NULL),
  (5, 'And there are differences of administrations, but the same Lord.',
   'καὶ διαιρέσεις διακονιῶν εἰσίν καὶ ὁ αὐτὸς κύριος',
   'kai diaireseis diakoniōn eisin kai ho autos kyrios',
   '''Administrations'' (diakoniōn — ministries, services; from diakoneō, to serve). ''Same Lord'' (ho autos kyrios — Christ). Different forms of service, one Master to be served. The gifts (v.4) from the Spirit are expressed as ministries (v.5) under the Lord Jesus and empowered by operations (v.6) of God the Father. The Trinity is the source and framework of all spiritual gifts.',
   NULL),
  (6, 'And there are diversities of operations, but it is the same God which worketh all in all.',
   'καὶ διαιρέσεις ἐνεργημάτων εἰσίν ὁ δὲ αὐτὸς θεός ὁ ἐνεργῶν τὰ πάντα ἐν πᾶσιν',
   'kai diaireseis energēmatōn eisin ho de autos theos ho energōn ta panta en pasin',
   '''Operations'' (energēmatōn — workings, effects, energisings; from energeō, to work, be active). ''Same God which worketh all in all'' (ho autos theos ho energōn ta panta en pasin — the same God who energises all things in all people). The Father is the ultimate source of all spiritual energy. The Trinitarian pattern is complete: gifts from the Spirit (v.4), ministries under the Lord (v.5), empowerments from God the Father (v.6).',
   NULL),
  (7, 'But the manifestation of the Spirit is given to every man to profit withal.',
   'ἑκάστῳ δὲ δίδοται ἡ φανέρωσις τοῦ πνεύματος πρὸς τὸ συμφέρον',
   'hekastō de didotai hē phanerōsis tou pneumatos pros to sympheron',
   '''Manifestation'' (phanerōsis — disclosure, making visible). ''To every man'' (hekastō — to each one; no believer is giftless). ''To profit withal'' (pros to sympheron — for the common advantage, mutual benefit). Every spiritual gift is a disclosure of the Spirit''s presence and is given for the community''s benefit, not the individual''s self-exaltation. No gift is for private enjoyment.',
   NULL),
  (8, 'For to one is given by the Spirit the word of wisdom; to another the word of knowledge by the same Spirit;',
   'ᾧ μὲν γὰρ διὰ τοῦ πνεύματος δίδοται λόγος σοφίας ἄλλῳ δὲ λόγος γνώσεως κατὰ τὸ αὐτὸ πνεῦμα',
   'hō men gar dia tou pneumatos didotai logos sophias allō de logos gnōseōs kata to auto pneuma',
   '''Word of wisdom'' (logos sophias — an utterance of wisdom; practical insight into God''s purposes). ''Word of knowledge'' (logos gnōseōs — an utterance of knowledge; insight into divine truth). Both are given ''by the Spirit'' and ''by the same Spirit'' — the repeated attribution underscores the common source. Wisdom and knowledge are distinguished: wisdom applies truth practically; knowledge grasps truth intellectually.',
   NULL),
  (9, 'To another faith by the same Spirit; to another the gifts of healing by the same Spirit;',
   'ἑτέρῳ δὲ πίστις ἐν τῷ αὐτῷ πνεύματι ἄλλῳ δὲ χαρίσματα ἰαμάτων ἐν τῷ ἑνὶ πνεύματι',
   'heterō de pistis en tō autō pneumati allō de charismata iamatōn en tō heni pneumati',
   '''Faith'' (pistis — not saving faith, which all believers share, but a special gift of extraordinary trust in God for specific situations). ''Gifts of healing'' (charismata iamatōn — grace-gifts of cures; plural: different kinds of healing for different conditions). The double plural suggests that healing gifts are given situationally, not as a permanent possession.',
   NULL),
  (10, 'To another the working of miracles; to another prophecy; to another discerning of spirits; to another divers kinds of tongues; to another the interpretation of tongues:',
   'ἄλλῳ δὲ ἐνεργήματα δυνάμεων ἄλλῳ δὲ προφητεία ἄλλῳ δὲ διακρίσεις πνευμάτων ἑτέρῳ δὲ γένη γλωσσῶν ἄλλῳ δὲ ἑρμηνεία γλωσσῶν',
   'allō de energēmata dynameōn allō de prophēteia allō de diakriseis pneumatōn heterō de genē glōssōn allō de hermēneia glōssōn',
   '''Working of miracles'' (energēmata dynameōn — operations of powers; supernatural acts beyond healing). ''Prophecy'' (prophēteia — Spirit-inspired utterance). ''Discerning of spirits'' (diakriseis pneumatōn — distinguishing between spirits; the ability to discern whether a spiritual manifestation is from God, human, or demonic). ''Divers kinds of tongues'' (genē glōssōn — varieties of tongues/languages). ''Interpretation of tongues'' (hermēneia glōssōn — translation/explanation of tongue-speech). Nine gifts total, with tongues and interpretation listed last — possibly deliberately, given the Corinthians'' overvaluation of tongues.',
   NULL),
  (11, 'But all these worketh that one and the selfsame Spirit, dividing to every man severally as he will.',
   'πάντα δὲ ταῦτα ἐνεργεῖ τὸ ἓν καὶ τὸ αὐτὸ πνεῦμα διαιροῦν ἰδίᾳ ἑκάστῳ καθὼς βούλεται',
   'panta de tauta energei to hen kai to auto pneuma diairoun idia hekastō kathōs bouletai',
   '''All these'' (panta tauta — every one of these gifts). ''One and the selfsame Spirit'' (to hen kai to auto pneuma — the one identical Spirit). ''Dividing'' (diairoun — distributing, apportioning). ''As he will'' (kathōs bouletai — according to his sovereign will). The Spirit is the sole distributor, and the distribution is sovereign — ''as he will,'' not as the recipient demands. This demolishes spiritual elitism: no one chose their gift; the Spirit chose for them.',
   'This verse establishes the sovereignty of the Spirit in gift distribution. Three implications: (1) No one can demand a particular gift — the Spirit gives ''as he will''; (2) No one can boast in a gift — it was sovereignly distributed, not earned; (3) No one should despise their gift — it was chosen by divine wisdom. The Corinthians'' elevation of tongues above other gifts ignores this sovereign distribution. Every gift is the Spirit''s deliberate choice for the common good.'),
  (12, 'For as the body is one, and hath many members, and all the members of that one body, being many, are one body: so also is Christ.',
   'καθάπερ γὰρ τὸ σῶμα ἕν ἐστιν καὶ μέλη ἔχει πολλά πάντα δὲ τὰ μέλη τοῦ σώματος τοῦ ἑνός πολλὰ ὄντα ἕν ἐστιν σῶμα οὕτως καὶ ὁ Χριστός',
   'kathaper gar to sōma hen estin kai melē echei polla panta de ta melē tou sōmatos tou henos polla onta hen estin sōma houtōs kai ho Christos',
   '''So also is Christ'' (houtōs kai ho Christos) — a startling statement. Paul does not say ''so also is the church'' but ''so also is Christ.'' The church is not merely like a body; the church is Christ''s body. The identification is so close that what is true of the body is true of Christ himself. Unity and diversity are both essential: ''one body'' with ''many members.''',
   NULL),
  (13, 'For by one Spirit are we all baptized into one body, whether we be Jews or Gentiles, whether we be bond or free; and have been all made to drink into one Spirit.',
   'καὶ γὰρ ἐν ἑνὶ πνεύματι ἡμεῖς πάντες εἰς ἓν σῶμα ἐβαπτίσθημεν εἴτε Ἰουδαῖοι εἴτε Ἕλληνες εἴτε δοῦλοι εἴτε ἐλεύθεροι καὶ πάντες ἓν πνεῦμα ἐποτίσθημεν',
   'kai gar en heni pneumati hēmeis pantes eis hen sōma ebaptisthēmen eite Ioudaioi eite Hellēnes eite douloi eite eleutheroi kai pantes hen pneuma epotisthēmen',
   '''By one Spirit'' (en heni pneumati — in/by one Spirit). ''Baptized into one body'' — Spirit baptism creates the church: all believers are immersed by the Spirit into Christ''s body. ''Whether Jews or Gentiles, bond or free'' — all social, ethnic, and economic distinctions are transcended in Spirit baptism. ''Made to drink'' (epotisthēmen — given to drink, saturated). Two images: immersed from without (baptism) and saturated from within (drinking). The Spirit is both the element we are baptized in and the living water we have consumed.',
   'This verse is foundational for the doctrine of Spirit baptism and church unity. Every believer has been baptized by the one Spirit into the one body of Christ. This is not a second experience after conversion but the means of incorporation into Christ at conversion. The four categories (Jew/Gentile, slave/free) represent the most fundamental human divisions in the ancient world — all are dissolved in the Spirit''s baptism. The church is the one community where these walls come down. Disunity in the body contradicts the very act that created it.'),
  (14, 'For the body is not one member, but many.',
   'καὶ γὰρ τὸ σῶμα οὐκ ἔστιν ἓν μέλος ἀλλὰ πολλά',
   'kai gar to sōma ouk estin hen melos alla polla',
   'A simple but profound statement: the body is not a single organ but a complex unity of diverse parts. Uniformity is not unity. The church would be as dysfunctional as a body consisting of one giant eyeball or one enormous ear. Diversity is not a problem to be solved but a feature designed by God.',
   NULL),
  (15, 'If the foot shall say, Because I am not the hand, I am not of the body; is it therefore not of the body?',
   'ἐὰν εἴπῃ ὁ πούς ὅτι οὐκ εἰμὶ χείρ οὐκ εἰμὶ ἐκ τοῦ σώματος οὐ παρὰ τοῦτο οὐκ ἔστιν ἐκ τοῦ σώματος',
   'ean eipē ho pous hoti ouk eimi cheir ouk eimi ek tou sōmatos ou para touto ouk estin ek tou sōmatos',
   'The foot envies the hand and concludes it does not belong to the body. But feelings of inferiority do not remove a member from the body. Paul addresses the self-deprecating believer who devalues their own gift because it is not a ''prominent'' gift. You belong to the body regardless of your feelings about your function.',
   NULL),
  (16, 'And if the ear shall say, Because I am not the eye, I am not of the body; is it therefore not of the body?',
   'καὶ ἐὰν εἴπῃ τὸ οὖς ὅτι οὐκ εἰμὶ ὀφθαλμός οὐκ εἰμὶ ἐκ τοῦ σώματος οὐ παρὰ τοῦτο οὐκ ἔστιν ἐκ τοῦ σώματος',
   'kai ean eipē to ous hoti ouk eimi ophthalmos ouk eimi ek tou sōmatos ou para touto ouk estin ek tou sōmatos',
   'The ear envies the eye — same logic as v.15. Comparing oneself unfavourably to others does not change one''s placement in the body. The Spirit sovereignly placed each member (v.18). No member has the right to resign based on gift-comparison.',
   NULL),
  (17, 'If the whole body were an eye, where were the hearing? If the whole were hearing, where were the smelling?',
   'εἰ ὅλον τὸ σῶμα ὀφθαλμός ποῦ ἡ ἀκοή εἰ ὅλον ἀκοή ποῦ ἡ ὄσφρησις',
   'ei holon to sōma ophthalmos pou hē akoē ei holon akoē pou hē osphrēsis',
   'Reductio ad absurdum: a body that was all eye could see but not hear; all ear could hear but not smell. The body functions precisely because different parts perform different tasks. Applied to the church: if everyone had the same gift (say, tongues), the church would be grotesquely dysfunctional — a spiritual monstrosity.',
   NULL),
  (18, 'But now hath God set the members every one of them in the body, as it hath pleased him.',
   'νυνὶ δὲ ὁ θεὸς ἔθετο τὰ μέλη ἓν ἕκαστον αὐτῶν ἐν τῷ σώματι καθὼς ἠθέλησεν',
   'nyni de ho theos etheto ta melē hen hekaston autōn en tō sōmati kathōs ēthelēsen',
   '''God set'' (ho theos etheto — God placed, appointed). ''As it pleased him'' (kathōs ēthelēsen — according to his will). Divine sovereignty in body placement: God himself determined which member goes where. To complain about one''s gift is to quarrel with God''s design. This parallels v.11 (the Spirit distributes as he wills) and underscores that the body''s arrangement is divinely planned, not accidental.',
   NULL),
  (19, 'And if they were all one member, where were the body?',
   'εἰ δὲ ἦν τὰ πάντα ἓν μέλος ποῦ τὸ σῶμα',
   'ei de ēn ta panta hen melos pou to sōma',
   'If all were the same member, the body would cease to exist. Uniformity destroys the body. The church needs apostles and janitors, preachers and prayers, teachers and administrators. A church where everyone does the same thing is not a body — it is an organ.',
   NULL),
  (20, 'But now are they many members, yet but one body.',
   'νῦν δὲ πολλὰ μὲν μέλη ἓν δὲ σῶμα',
   'nyn de polla men melē hen de sōma',
   '''Many members, one body'' — the controlling affirmation. Diversity and unity are not competing values but complementary aspects of God''s design. The ''now'' (nyn) is emphatic: this is the present reality. Many parts, one organism. This is the corrective for both the self-deprecating member (vv.15-16) and the self-exalting member (v.21).',
   NULL),
  (21, 'And the eye cannot say unto the hand, I have no need of thee: nor again the head to the feet, I have no need of you.',
   'οὐ δύναται δὲ ὁ ὀφθαλμὸς εἰπεῖν τῇ χειρί χρείαν σου οὐκ ἔχω ἢ πάλιν ἡ κεφαλὴ τοῖς ποσίν χρείαν ὑμῶν οὐκ ἔχω',
   'ou dynatai de ho ophthalmos eipein tē cheiri chreian sou ouk echō ē palin hē kephalē tois posin chreian hymōn ouk echō',
   '''Cannot say'' (ou dynatai eipein — is unable to say; not just ''should not'' but ''cannot''). ''I have no need of thee'' (chreian sou ouk echō — I don''t need you). After addressing the self-deprecating (vv.15-16), Paul now confronts the self-exalting. The ''eye'' cannot dismiss the ''hand''; the ''head'' cannot dismiss the ''feet.'' No gift-holder can declare another unnecessary. Interdependence is not optional; it is structural.',
   NULL),
  (22, 'Nay, much more those members of the body, which seem to be more feeble, are necessary:',
   'ἀλλὰ πολλῷ μᾶλλον τὰ δοκοῦντα μέλη τοῦ σώματος ἀσθενέστερα ὑπάρχειν ἀναγκαῖά ἐστιν',
   'alla pollō mallon ta dokounta melē tou sōmatos asthenestera hyparchein anankaia estin',
   '''Much more'' (pollō mallon — to a far greater degree). ''Seem to be more feeble'' (dokounta asthenestera — those appearing weaker). ''Are necessary'' (anankaia — indispensable, essential). A paradox: the seemingly weakest members are the most necessary. Internal organs (heart, lungs, kidneys) are less visible than arms and legs but far more essential for survival. In the church, the ''unglamorous'' members — those who pray, serve, give, clean — are indispensable.',
   NULL),
  (23, 'And those members of the body, which we think to be less honourable, upon these we bestow more abundant honour; and our uncomely parts have more abundant comeliness.',
   'καὶ ἃ δοκοῦμεν ἀτιμότερα εἶναι τοῦ σώματος τούτοις τιμὴν περισσοτέραν περιτίθεμεν καὶ τὰ ἀσχήμονα ἡμῶν εὐσχημοσύνην περισσοτέραν ἔχει',
   'kai ha dokoumen atimotera einai tou sōmatos toutois timēn perissoteran peritithemen kai ta aschēmona hēmōn euschēmosynēn perissoteran echei',
   '''Less honourable'' (atimotera — less esteemed). ''More abundant honour'' (timēn perissoteran — greater honour). ''Uncomely'' (aschēmona — unpresentable, indecent). ''More abundant comeliness'' (euschēmosynēn perissoteran — greater propriety). We clothe the ''uncomely'' parts with finer garments. Applied to the church: the less visible, less glamorous members deserve greater honour and attention. The church should invert the world''s value system.',
   NULL),
  (24, 'For our comely parts have no need: but God hath tempered the body together, having given more abundant honour to that part which lacked:',
   'τὰ δὲ εὐσχήμονα ἡμῶν οὐ χρείαν ἔχει ἀλλ᾿ ὁ θεὸς συνεκέρασεν τὸ σῶμα τῷ ὑστεροῦντι περισσοτέραν δοὺς τιμήν',
   'ta de euschēmona hēmōn ou chreian echei all ho theos synekerasen to sōma tō hysterounti perissoteran dous timēn',
   '''Tempered'' (synekerasen — mixed together, blended, composed harmoniously; from synkerannymi). ''Having given more abundant honour to that which lacked'' — God''s deliberate design compensates for inequality. The purpose: equalisation within the body. God opposes the hierarchy of value the Corinthians have imposed on spiritual gifts.',
   NULL),
  (25, 'That there should be no schism in the body; but that the members should have the same care one for another.',
   'ἵνα μὴ ᾖ σχίσμα ἐν τῷ σώματι ἀλλὰ τὸ αὐτὸ ὑπὲρ ἀλλήλων μεριμνῶσιν τὰ μέλη',
   'hina mē ē schisma en tō sōmati alla to auto hyper allēlōn merimnōsin ta melē',
   '''No schism'' (mē schisma — no division, no split; cf. 1:10). ''Same care'' (to auto merimnōsin — equal concern, mutual solicitude). God designed the body to prevent division: by giving greater honour to lesser members, he ensures all are valued equally. The goal is mutual care — each member caring for every other. This directly addresses the Corinthians'' divisive favouritism of certain gifts.',
   NULL),
  (26, 'And whether one member suffer, all the members suffer with it; or one member be honoured, all the members rejoice with it.',
   'καὶ εἴτε πάσχει ἓν μέλος συμπάσχει πάντα τὰ μέλη εἴτε δοξάζεται ἓν μέλος συγχαίρει πάντα τὰ μέλη',
   'kai eite paschei hen melos sympaschei panta ta melē eite doxazetai hen melos synchairei panta ta melē',
   '''Suffer with it'' (sympaschei — co-suffer, share the pain). ''Rejoice with it'' (synchairei — co-rejoice, share the joy). Genuine body life produces empathy in both directions: shared suffering and shared celebration. If a toe is stubbed, the whole body reacts. If one member is honoured, all should genuinely rejoice. Envy at another''s honour and indifference to another''s pain are equally destructive to body life.',
   NULL),
  (27, 'Now ye are the body of Christ, and members in particular.',
   'ὑμεῖς δέ ἐστε σῶμα Χριστοῦ καὶ μέλη ἐκ μέρους',
   'hymeis de este sōma Christou kai melē ek merous',
   '''Ye are the body of Christ'' (este sōma Christou — you are Christ''s body). ''Members in particular'' (melē ek merous — members individually, each one a particular member). The application of the metaphor: ''you'' — the Corinthian church — collectively constitute Christ''s body. Each individual is a specific, designated member with a unique function. This is not mere analogy but ecclesiological reality: the church is Christ''s body on earth.',
   NULL),
  (28, 'And God hath set some in the church, first apostles, secondarily prophets, thirdly teachers, after that miracles, then gifts of healings, helps, governments, diversities of tongues.',
   'καὶ οὓς μὲν ἔθετο ὁ θεὸς ἐν τῇ ἐκκλησίᾳ πρῶτον ἀποστόλους δεύτερον προφήτας τρίτον διδασκάλους ἔπειτα δυνάμεις εἶτα χαρίσματα ἰαμάτων ἀντιλήμψεις κυβερνήσεις γένη γλωσσῶν',
   'kai hous men etheto ho theos en tē ekklēsia prōton apostolous deuteron prophētas triton didaskalous epeita dynameis eita charismata iamatōn antilēmpseis kybernēseis genē glōssōn',
   '''God hath set'' (etheto ho theos — God appointed). ''First... secondarily... thirdly'' — a deliberate ordering: apostles, prophets, teachers hold priority because they minister the word. ''After that'' — the ranking becomes looser: miracles, healings, helps (antilēmpseis — acts of assistance), governments (kybernēseis — administrations, steering; from kybernētēs, a helmsman). Tongues again appear last. The ordering is intentional: the Corinthians have reversed it by elevating tongues above all.',
   NULL),
  (29, 'Are all apostles? are all prophets? are all teachers? are all workers of miracles?',
   'μὴ πάντες ἀπόστολοι μὴ πάντες προφῆται μὴ πάντες διδάσκαλοι μὴ πάντες δυνάμεις',
   'mē pantes apostoloi mē pantes prophētai mē pantes didaskaloi mē pantes dynameis',
   'Seven rhetorical questions (vv.29-30), each expecting the answer ''no'' (introduced by mē). Not all are apostles; not all are prophets; not all are teachers; not all work miracles. The gift distribution is diverse by design. If everyone had the same gift, the body would be disfigured (v.17). The implication for tongues: not everyone should be expected to speak in tongues.',
   NULL),
  (30, 'Have all the gifts of healing? do all speak with tongues? do all interpret?',
   'μὴ πάντες χαρίσματα ἔχουσιν ἰαμάτων μὴ πάντες γλώσσαις λαλοῦσιν μὴ πάντες διερμηνεύουσιν',
   'mē pantes charismata echousin iamatōn mē pantes glōssais lalousin mē pantes diermēneuousin',
   'Continuing the rhetorical questions: Not all have healing gifts; not all speak in tongues; not all interpret. Each question expects ''no.'' This directly challenges any teaching that tongues is a universal sign of the Spirit''s presence. The Spirit distributes as he wills (v.11), and his will is diversity, not uniformity.',
   NULL),
  (31, 'But covet earnestly the best gifts: and yet shew I unto you a more excellent way.',
   'ζηλοῦτε δὲ τὰ χαρίσματα τὰ μείζονα καὶ ἔτι καθ᾿ ὑπερβολὴν ὁδὸν ὑμῖν δείκνυμι',
   'zēloute de ta charismata ta meizona kai eti kath hyperbolēn hodon hymin deiknymi',
   '''Covet earnestly'' (zēloute — be zealous for, eagerly desire). ''Best gifts'' (ta meizona — the greater gifts; those that most edify the body, especially prophecy, cf. 14:1). ''A more excellent way'' (kath hyperbolēn hodon — a way beyond comparison, a surpassingly superior path). Paul transitions from gifts to the ''way'' that makes all gifts valuable: love. Without love, even the greatest gifts are nothing (13:1-3). This sets up the love chapter.',
   'This verse serves as the bridge between the discussion of spiritual gifts (ch.12) and the hymn to love (ch.13). Paul encourages desiring the ''greater'' gifts — those that most build up the church — but then announces something even more important: ''a more excellent way.'' This is not a way instead of gifts but a way of exercising gifts. Love is the atmosphere in which spiritual gifts function properly. Without love, tongues are noise, prophecy is nothing, and faith moves mountains pointlessly. The ''more excellent way'' is not a replacement for gifts but the essential context for their use.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 12;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 spiritual gifts
  ('πνευματικός', 'pneumatikos', 'G4152', 'Spiritual, pertaining to the Spirit — from pneuma (spirit, wind, breath). Pneumatikos can be neuter (spiritual things/gifts) or masculine (spiritual persons). Paul uses it here to introduce the topic of Spirit-given endowments. The word implies that these gifts are not natural talents but supernatural endowments from the Holy Spirit, given for service in the body of Christ.', 1),
  -- v.4 gifts (charismata)
  ('χάρισμα', 'charisma', 'G5486', 'Grace-gift, free gift, spiritual endowment — from charis (grace) + the suffix -ma (the result of an action). A charisma is the concrete result of God''s grace: a specific ability given to a specific person for the common good. The word emphasises that spiritual gifts are unearned, undeserved, and other-directed. No one has a basis for boasting in a gift that was freely given by grace.', 2),
  -- v.7 manifestation
  ('φανέρωσις', 'phanerōsis', 'G5321', 'Manifestation, disclosure, making visible — from phaneroō (to make apparent, reveal). Each spiritual gift is a phanerōsis — a visible disclosure of the invisible Spirit''s presence. The Spirit, who cannot be seen, makes himself known through the gifts he distributes. Every gift is evidence that the Spirit is active in the community. The purpose is ''to profit withal'' (pros to sympheron — for the common advantage).', 3),
  -- v.10 discerning of spirits
  ('διάκρισις', 'diakrisis', 'G1253', 'Discernment, distinguishing, judging between — from dia (through) + krinō (to judge). The ability to distinguish between the Holy Spirit, human spirits, and demonic spirits as the source of spiritual manifestations. This gift is essential in a community that values charismatic experience: not every spiritual phenomenon is from God. Diakrisis provides the necessary quality control for the church''s prophetic and charismatic life.', 4),
  -- v.13 baptized into one body
  ('βαπτίζω', 'baptizō', 'G907', 'To baptize, immerse, dip, plunge — from baptō (to dip). ''By one Spirit are we all baptized into one body'' — Spirit baptism is the act by which the Holy Spirit incorporates every believer into Christ''s body at conversion. This is not a second experience after salvation but the foundational act that creates the church. All believers — without exception — have been Spirit-baptized into one body. This is what makes the body one, regardless of ethnic or social origin.', 5),
  -- v.25 schism
  ('σχίσμα', 'schisma', 'G4978', 'Schism, division, tear, split — from schizō (to split, rend). Used of a tear in a garment (Matthew 9:16) and of divisions in the church (1:10; 11:18). God designed the body to prevent schisma by giving greater honour to lesser members (v.24). Division in the body is not merely a social problem but a violation of God''s design. The body is meant to function as a unified organism where every member cares equally for every other.', 6),
  -- v.28 helps
  ('ἀντίλημψις', 'antilēmpsis', 'G484', 'Help, assistance, support — from antilambanomai (to take hold of, help). This refers to practical acts of service: caring for the poor, visiting the sick, providing material support, assisting in administration. Listed alongside apostles, prophets, and miracles, ''helps'' demonstrates that mundane acts of service are genuine spiritual gifts. The church needs helpers as much as it needs preachers. Quiet, behind-the-scenes service is a Spirit-distributed charisma.', 7),
  -- v.28 governments
  ('κυβέρνησις', 'kybernēsis', 'G2941', 'Government, administration, steering — from kybernētēs (a helmsman, ship''s pilot). The gift of leadership, guidance, and strategic direction. The helmsman steers the ship through dangerous waters; the church leader guides the congregation through complex situations. This gift combines wisdom, decisiveness, and navigational skill. Listed alongside healings and miracles, it shows that leadership is as much a spiritual gift as any supernatural manifestation.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 12
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 4
    WHEN 3 THEN 7
    WHEN 4 THEN 10
    WHEN 5 THEN 13
    WHEN 6 THEN 25
    WHEN 7 THEN 28
    WHEN 8 THEN 28
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 Jesus is Lord
  (3, 'Romans 10:9', 1),
  (3, 'Philippians 2:11', 2),
  -- v.4-6 Trinitarian source
  (4, 'Ephesians 4:4-6', 3),
  (6, 'Romans 12:4-6', 4),
  -- v.7 manifestation to profit
  (7, '1 Peter 4:10', 5),
  -- v.8 word of wisdom
  (8, 'James 1:5', 6),
  -- v.10 tongues
  (10, 'Acts 2:4', 7),
  (10, 'Acts 10:46', 8),
  -- v.11 Spirit distributes as he wills
  (11, 'Hebrews 2:4', 9),
  -- v.12 one body many members
  (12, 'Romans 12:4-5', 10),
  (12, 'Ephesians 4:4', 11),
  -- v.13 baptized into one body
  (13, 'Galatians 3:27-28', 12),
  (13, 'Ephesians 2:14-16', 13),
  -- v.18 God placed members
  (18, 'Romans 12:3', 14),
  -- v.21 need of one another
  (21, 'Romans 12:10', 15),
  -- v.26 suffer and rejoice together
  (26, 'Romans 12:15', 16),
  -- v.27 body of Christ
  (27, 'Ephesians 1:22-23', 17),
  (27, 'Colossians 1:18', 18),
  -- v.28 apostles prophets teachers
  (28, 'Ephesians 4:11', 19),
  -- v.31 more excellent way
  (31, '1 Corinthians 13:1-13', 20),
  (31, '1 Corinthians 14:1', 21)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 12
  AND v.verse_number = cr.verse_number;
