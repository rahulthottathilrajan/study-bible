-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 7 — Marriage, Celibacy, and Calling
-- 40 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 7,
  'First Corinthians 7 is the NT''s most comprehensive treatment of marriage, celibacy, and the believer''s calling. Paul responds to the Corinthians'' written questions (''Now concerning the things whereof ye wrote unto me,'' v.1). Some in Corinth were advocating extreme asceticism: ''It is good for a man not to touch a woman'' (v.1) — likely a Corinthian slogan Paul quotes and qualifies. Paul affirms the goodness of both marriage and celibacy while addressing specific pastoral situations. Married couples owe each other conjugal rights and should not deprive one another except by mutual consent for prayer (vv.2-5). Paul wishes all were single as he is, but acknowledges that each has a different gift from God (v.7). To the unmarried and widows, singleness is good, but marriage is honourable — ''it is better to marry than to burn'' (v.9). The married should not divorce (vv.10-11). In mixed marriages (believer/unbeliever), the believer should not initiate divorce, for the unbelieving spouse is ''sanctified'' through the believing partner, and their children are ''holy'' (vv.12-14). But if the unbeliever departs, the believer ''is not under bondage'' (v.15). The chapter''s central principle emerges in vv.17-24: ''Let every man abide in the same calling wherein he was called.'' Whether circumcised or uncircumcised, slave or free, ''therein abide with God'' (v.24). Paul then addresses virgins and the ''present distress'' (v.26) — likely persecution or famine — advising that those who marry do not sin, but will face trouble (v.28). The time is short (v.29); the world''s form is passing away (v.31). The unmarried can give undivided attention to the Lord (vv.32-35). Paul concludes with guidance on betrothed virgins (vv.36-38) and widows, who are free to remarry ''only in the Lord'' (v.39). Throughout, Paul distinguishes his own counsel from direct dominical commands (vv.10, 12, 25, 40).',
  'Marriage, Celibacy, and Contentment in One''s Calling',
  'κλῆσις (klēsis)',
  'Calling, vocation — from kaleō (to call). Paul uses klēsis not primarily of a religious vocation but of the life situation in which one was when God called them to faith: married or single, circumcised or not, slave or free. The principle is revolutionary: one''s social station does not need to change for one to serve God fully. Bloom where you are planted.',
  '["Marriage and Conjugal Rights (vv.1-7): Now concerning the things whereof ye wrote unto me it is good for a man not to touch a woman. Nevertheless to avoid fornication let every man have his own wife and let every woman have her own husband. Let the husband render unto the wife due benevolence and likewise also the wife unto the husband. I would that all men were even as I myself but every man hath his proper gift of God one after this manner and another after that","To the Unmarried and Widows (vv.8-9): I say therefore to the unmarried and widows it is good for them if they abide even as I. But if they cannot contain let them marry for it is better to marry than to burn","Instructions on Divorce (vv.10-16): And unto the married I command yet not I but the Lord let not the wife depart from her husband. But and if she depart let her remain unmarried or be reconciled to her husband and let not the husband put away his wife. But to the rest speak I not the Lord if any brother hath a wife that believeth not and she be pleased to dwell with him let him not put her away. For the unbelieving husband is sanctified by the wife and the unbelieving wife is sanctified by the husband else were your children unclean but now are they holy. But if the unbelieving depart let him depart a brother or a sister is not under bondage in such cases but God hath called us to peace","Abide in Your Calling (vv.17-24): But as God hath distributed to every man as the Lord hath called every one so let him walk. Let every man abide in the same calling wherein he was called. Art thou called being a servant care not for it but if thou mayest be made free use it rather. For he that is called in the Lord being a servant is the Lord''s freeman. Ye are bought with a price be not ye the servants of men. Brethren let every man wherein he is called therein abide with God","Counsel for Virgins and the Present Distress (vv.25-35): Now concerning virgins I have no commandment of the Lord yet I give my judgment as one that hath obtained mercy of the Lord to be faithful. I suppose therefore that this is good for the present distress. But this I say brethren the time is short. For the fashion of this world passeth away. But I would have you without carefulness he that is unmarried careth for the things that belong to the Lord but he that is married careth for the things that are of the world","Betrothed Virgins and Widows (vv.36-40): But if any man think that he behaveth himself uncomely toward his virgin if she pass the flower of her age and need so require let him do what he will he sinneth not let them marry. So then he that giveth her in marriage doeth well but he that giveth her not in marriage doeth better. The wife is bound by the law as long as her husband liveth but if her husband be dead she is at liberty to be married to whom she will only in the Lord"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 40 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Now concerning the things whereof ye wrote unto me: It is good for a man not to touch a woman.',
   'περὶ δὲ ὧν ἐγράψατέ μοι καλὸν ἀνθρώπῳ γυναικὸς μὴ ἅπτεσθαι',
   'peri de hōn egrapsate moi kalon anthrōpō gynaikos mē haptesthai',
   '''Now concerning'' (peri de — Paul''s formula for responding to their written questions, used throughout the letter: 7:25; 8:1; 12:1; 16:1). ''Good'' (kalon — noble, fine, advantageous). ''Not to touch a woman'' (gynaikos mē haptesthai — a euphemism for sexual relations). This is likely a Corinthian slogan reflecting an ascetic faction that was discouraging marriage and sexual relations, possibly influenced by Stoic or proto-Gnostic dualism that devalued the body.',
   NULL),
  (2, 'Nevertheless, to avoid fornication, let every man have his own wife, and let every woman have her own husband.',
   'διὰ δὲ τὰς πορνείας ἕκαστος τὴν ἑαυτοῦ γυναῖκα ἐχέτω καὶ ἑκάστη τὸν ἴδιον ἄνδρα ἐχέτω',
   'dia de tas porneias hekastos tēn heautou gynaika echetō kai hekastē ton idion andra echetō',
   '''To avoid fornication'' (dia tas porneias — because of the fornications; plural: the many temptations in Corinth). ''Let each man have his own wife'' — the present imperative echetō (let him keep having, continue possessing) presupposes existing marriages. Paul is not commanding everyone to marry but affirming that marriage is the proper context for sexual expression. The reciprocal structure (man/wife, woman/husband) establishes sexual mutuality.',
   NULL),
  (3, 'Let the husband render unto the wife due benevolence: and likewise also the wife unto the husband.',
   'τῇ γυναικὶ ὁ ἀνὴρ τὴν ὀφειλομένην εὔνοιαν ἀποδιδότω ὁμοίως δὲ καὶ ἡ γυνὴ τῷ ἀνδρί',
   'tē gynaiki ho anēr tēn opheilomenēn eunoian apodidotō homoiōs de kai hē gynē tō andri',
   '''Due benevolence'' (tēn opheilomenēn eunoian — the owed goodwill/kindness; a euphemism for conjugal rights). ''Render'' (apodidotō — pay what is owed, fulfil an obligation). Paul establishes mutual sexual obligation within marriage. Remarkably for the ancient world, the wife''s rights are stated first and are equal to the husband''s. Neither spouse has the right to withhold sexual intimacy unilaterally.',
   NULL),
  (4, 'The wife hath not power of her own body, but the husband: and likewise also the husband hath not power of his own body, but the wife.',
   'ἡ γυνὴ τοῦ ἰδίου σώματος οὐκ ἐξουσιάζει ἀλλ᾿ ὁ ἀνήρ ὁμοίως δὲ καὶ ὁ ἀνὴρ τοῦ ἰδίου σώματος οὐκ ἐξουσιάζει ἀλλ᾿ ἡ γυνή',
   'hē gynē tou idiou sōmatos ouk exousiazei all ho anēr homoiōs de kai ho anēr tou idiou sōmatos ouk exousiazei all hē gynē',
   '''Hath not power'' (ouk exousiazei — does not have authority over). In marriage, each spouse surrenders bodily autonomy to the other. This is radically mutual: Paul does not give the husband authority over the wife''s body without giving the wife equal authority over the husband''s. In the ancient world, only the husband was assumed to have such authority. Paul''s teaching is revolutionary in its symmetry.',
   NULL),
  (5, 'Defraud ye not one the other, except it be with consent for a time, that ye may give yourselves to fasting and prayer; and come together again, that Satan tempt you not for your incontinency.',
   'μὴ ἀποστερεῖτε ἀλλήλους εἰ μή τι ἂν ἐκ συμφώνου πρὸς καιρόν ἵνα σχολάσητε τῇ νηστείᾳ καὶ τῇ προσευχῇ καὶ πάλιν ἐπὶ τὸ αὐτὸ συνέρχεσθε ἵνα μὴ πειράζῃ ὑμᾶς ὁ Σατανᾶς διὰ τὴν ἀκρασίαν ὑμῶν',
   'mē apostereite allēlous ei mē ti an ek symphōnou pros kairon hina scholasēte tē nēsteia kai tē proseuchē kai palin epi to auto synerchesthe hina mē peirazē hymas ho Satanas dia tēn akrasian hymōn',
   '''Defraud not'' (mē apostereite — do not deprive, rob; the same verb used of financial fraud in 6:7-8). ''With consent'' (ek symphōnou — by mutual agreement; from which ''symphony''). ''For a time'' (pros kairon — for a season, temporarily). ''Give yourselves to prayer'' (scholasēte tē proseuchē — devote yourselves; from which ''school'' — leisure for focused activity). Three conditions for abstinence: mutual consent, limited time, spiritual purpose. Prolonged abstinence invites Satan''s temptation through ''incontinency'' (akrasian — lack of self-control).',
   NULL),
  (6, 'But I speak this by permission, and not of commandment.',
   'τοῦτο δὲ λέγω κατὰ συγγνώμην οὐ κατ᾿ ἐπιταγήν',
   'touto de legō kata syngnōmēn ou kat epitagēn',
   '''By permission'' (kata syngnōmēn — as a concession, not as a command). ''Not of commandment'' (ou kat epitagēn — not as an authoritative order). Paul distinguishes between apostolic command and pastoral counsel. Marriage is a concession to human weakness, not a divine command. Paul would prefer that all had the gift of celibacy (v.7), but he realistically acknowledges different gifts.',
   NULL),
  (7, 'For I would that all men were even as I myself. But every man hath his proper gift of God, one after this manner, and another after that.',
   'θέλω γὰρ πάντας ἀνθρώπους εἶναι ὡς καὶ ἐμαυτόν ἀλλ᾿ ἕκαστος ἴδιον ἔχει χάρισμα ἐκ θεοῦ ὁ μὲν οὕτως ὁ δὲ οὕτως',
   'thelō gar pantas anthrōpous einai hōs kai emauton all hekastos idion echei charisma ek theou ho men houtōs ho de houtōs',
   '''Even as I myself'' — Paul was apparently unmarried at this time (whether never married, widowed, or divorced is debated). ''Proper gift'' (idion charisma — one''s own grace-gift from God). Both marriage and celibacy are charismata — gifts of grace. Neither is superior; each is God''s assignment for the individual. This prevents both the elevation of celibacy over marriage and the dismissal of singleness as deficient.',
   NULL),
  (8, 'I say therefore to the unmarried and widows, It is good for them if they abide even as I.',
   'λέγω δὲ τοῖς ἀγάμοις καὶ ταῖς χήραις καλὸν αὐτοῖς ἐστιν ἐὰν μείνωσιν ὡς κἀγώ',
   'legō de tois agamois kai tais chērais kalon autois estin ean meinōsin hōs kagō',
   '''Unmarried'' (agamois — those not currently married; this could include the never-married, widowers, or divorced). ''Widows'' (chērais — women whose husbands have died). ''Abide as I'' — Paul recommends singleness as advantageous (not morally superior) for undivided service to Christ. The conditional ''if they abide'' (ean meinōsin) indicates this is a recommendation, not a requirement.',
   NULL),
  (9, 'But if they cannot contain, let them marry: for it is better to marry than to burn.',
   'εἰ δὲ οὐκ ἐγκρατεύονται γαμησάτωσαν κρεῖσσον γάρ ἐστιν γαμῆσαι ἢ πυροῦσθαι',
   'ei de ouk enkrateuontai gamēsatōsan kreisson gar estin gamēsai ē pyrousthai',
   '''Cannot contain'' (ouk enkrateuontai — lack self-control; from egkrateia, self-mastery). ''Let them marry'' (gamēsatōsan — aorist imperative: go ahead and marry). ''Better to marry than to burn'' (pyrousthai — to be set on fire; to burn with sexual desire). Paul is realistic, not romantic: unfulfilled sexual desire that leads to sin is worse than marriage. Marriage is an honourable, God-given outlet for sexual expression.',
   NULL),
  (10, 'And unto the married I command, yet not I, but the Lord, Let not the wife depart from her husband:',
   'τοῖς δὲ γεγαμηκόσιν παραγγέλλω οὐκ ἐγὼ ἀλλ᾿ ὁ κύριος γυναῖκα ἀπὸ ἀνδρὸς μὴ χωρισθῆναι',
   'tois de gegamēkosin parangellō ouk egō all ho kyrios gynaika apo andros mē chōristhēnai',
   '''I command, yet not I, but the Lord'' — Paul appeals to Jesus'' own teaching on divorce (Matthew 5:32; 19:3-9; Mark 10:2-12). This is not merely Paul''s opinion but a dominical command. ''Depart'' (chōristhēnai — separate, divorce). The passive voice may suggest the wife should not allow herself to be separated, or should not initiate separation.',
   NULL),
  (11, 'But and if she depart, let her remain unmarried, or be reconciled to her husband: and let not the husband put away his wife.',
   'ἐὰν δὲ καὶ χωρισθῇ μενέτω ἄγαμος ἢ τῷ ἀνδρὶ καταλλαγήτω καὶ ἄνδρα γυναῖκα μὴ ἀφιέναι',
   'ean de kai chōristhē menetō agamos ē tō andri katallagētō kai andra gynaika mē aphienai',
   '''If she depart'' — Paul acknowledges that separation may occur despite the command. ''Remain unmarried'' (menetō agamos) or ''be reconciled'' (katallagētō — restore the relationship). Two options, not three — remarriage to another is not offered. ''Let not the husband put away'' (mē aphienai — not divorce, not send away). Both partners are bound by the same standard. Paul''s parenthetical concession shows pastoral realism within theological conviction.',
   NULL),
  (12, 'But to the rest speak I, not the Lord: If any brother hath a wife that believeth not, and she be pleased to dwell with him, let him not put her away.',
   'τοῖς δὲ λοιποῖς ἐγὼ λέγω οὐχ ὁ κύριος εἴ τις ἀδελφὸς γυναῖκα ἔχει ἄπιστον καὶ αὕτη συνευδοκεῖ οἰκεῖν μετ᾿ αὐτοῦ μὴ ἀφιέτω αὐτήν',
   'tois de loipois egō legō ouch ho kyrios ei tis adelphos gynaika echei apiston kai hautē syneudokei oikein met autou mē aphietō autēn',
   '''I, not the Lord'' — not a lesser authority but a new situation Jesus did not directly address (mixed marriages where one partner converts after marriage). ''Believeth not'' (apiston — unbelieving). ''Pleased to dwell'' (syneudokei oikein — consents to live together). If the unbelieving spouse is willing to stay, the believer must not initiate divorce. Conversion does not nullify the marriage bond.',
   NULL),
  (13, 'And the woman which hath an husband that believeth not, and if he be pleased to dwell with her, let her not leave him.',
   'καὶ γυνὴ ἥτις ἔχει ἄνδρα ἄπιστον καὶ αὐτὸς συνευδοκεῖ οἰκεῖν μετ᾿ αὐτῆς μὴ ἀφιέτω αὐτόν',
   'kai gynē hētis echei andra apiston kai autos syneudokei oikein met autēs mē aphietō auton',
   'The same instruction given to the wife with an unbelieving husband. The symmetry is again remarkable: Paul gives identical counsel to both genders. The believing wife has the same obligation as the believing husband — neither should initiate divorce if the unbeliever is willing to remain.',
   NULL),
  (14, 'For the unbelieving husband is sanctified by the wife, and the unbelieving wife is sanctified by the husband: else were your children unclean; but now are they holy.',
   'ἡγίασται γὰρ ὁ ἀνὴρ ὁ ἄπιστος ἐν τῇ γυναικί καὶ ἡγίασται ἡ γυνὴ ἡ ἄπιστος ἐν τῷ ἀδελφῷ ἐπεὶ ἄρα τὰ τέκνα ὑμῶν ἀκάθαρτά ἐστιν νῦν δὲ ἅγιά ἐστιν',
   'hēgiastai gar ho anēr ho apistos en tē gynaiki kai hēgiastai hē gynē hē apistos en tō adelphō epei ara ta tekna hymōn akatharta estin nyn de hagia estin',
   '''Sanctified'' (hēgiastai — has been set apart, consecrated; perfect tense: a settled state). This does not mean the unbeliever is saved through the spouse''s faith, but that the marriage is legitimate and the household set apart for God''s purposes. ''Children holy'' (hagia — consecrated, set apart) — children of even one believing parent are within the sphere of God''s covenant blessing, not ''unclean'' (akatharta — ritually impure, outside the covenant).',
   'This verse is theologically significant for understanding covenant holiness. ''Sanctified'' here is relational, not salvific: the unbelieving spouse is set apart through the marriage bond with a believer. The proof is the children: if the marriage were spiritually illegitimate, the children would be ''unclean.'' But they are ''holy'' — within the covenant community. This has been used to support infant baptism (as a sign of covenant inclusion) and to argue against the view that a mixed marriage is inherently defiling. The believing spouse''s faith creates a sphere of sanctification that encompasses the household.'),
  (15, 'But if the unbelieving depart, let him depart. A brother or a sister is not under bondage in such cases: but God hath called us to peace.',
   'εἰ δὲ ὁ ἄπιστος χωρίζεται χωριζέσθω οὐ δεδούλωται ὁ ἀδελφὸς ἢ ἡ ἀδελφὴ ἐν τοῖς τοιούτοις ἐν δὲ εἰρήνῃ κέκληκεν ἡμᾶς ὁ θεός',
   'ei de ho apistos chōrizetai chōrizesthō ou dedoulōtai ho adelphos ē hē adelphē en tois toioutois en de eirēnē keklēken hēmas ho theos',
   '''If the unbelieving depart'' (chōrizetai — separates, leaves; present tense: is in the process of leaving). ''Let him depart'' (chōrizesthō — let the separation happen). ''Not under bondage'' (ou dedoulōtai — has not been enslaved; perfect passive). The ''Pauline privilege'': if the unbelieving spouse insists on leaving, the believer is released from the marriage bond. ''Called us to peace'' — God''s calling is to peace, not to forced cohabitation.',
   'The ''Pauline privilege'' (as it came to be known) addresses a situation Jesus did not directly discuss: what happens when an unbelieving spouse abandons the marriage? Paul''s answer: the believer ''is not under bondage'' (ou dedoulōtai). The strength of this language (''enslaved'') suggests more than mere separation — it implies freedom from the marriage bond itself, potentially including freedom to remarry. The guiding principle is peace: God has called believers to peace, not to the impossible task of forcing an unwilling spouse to remain.'),
  (16, 'For what knowest thou, O wife, whether thou shalt save thy husband? or how knowest thou, O man, whether thou shalt save thy wife?',
   'τί γὰρ οἶδας γύναι εἰ τὸν ἄνδρα σώσεις ἢ τί οἶδας ἄνερ εἰ τὴν γυναῖκα σώσεις',
   'ti gar oidas gynai ei ton andra sōseis ē ti oidas aner ei tēn gynaika sōseis',
   'This verse can be read two ways: (1) Hopefully: ''Who knows? Perhaps you will save your spouse'' — motivating the believer to stay; or (2) Realistically: ''How do you know whether you will save your spouse?'' — warning against staying in a broken marriage solely on the uncertain hope of conversion. In context, the latter reading fits better: if the unbeliever wants to leave, the uncertain possibility of their conversion is not sufficient reason to force them to stay.',
   NULL),
  (17, 'But as God hath distributed to every man, as the Lord hath called every one, so let him walk. And so ordain I in all churches.',
   'εἰ μὴ ἑκάστῳ ὡς ἐμέρισεν ὁ κύριος ἕκαστον ὡς κέκληκεν ὁ θεός οὕτως περιπατείτω καὶ οὕτως ἐν ταῖς ἐκκλησίαις πάσαις διατάσσομαι',
   'ei mē hekastō hōs emerisen ho kyrios hekaston hōs keklēken ho theos houtōs peripateitō kai houtōs en tais ekklēsiais pasais diatassomai',
   '''As God hath distributed'' (hōs emerisen — as he has apportioned, assigned). ''As the Lord hath called'' (hōs keklēken — as he has called; perfect: a standing call). ''So let him walk'' (peripateitō — let him conduct his life). This is the chapter''s governing principle, stated three times (vv.17, 20, 24). Don''t seek to change your life situation merely because you have become a Christian. ''In all churches'' — this is universal apostolic teaching, not a local Corinthian exception.',
   'This verse introduces the ''remain in your calling'' principle that governs the entire middle section (vv.17-24). Paul is countering two extremes: (1) ascetics who wanted to dissolve marriages because of their faith; (2) those who thought conversion required changing social status. Paul''s principle is conservative in the best sense: the gospel does not demand social upheaval as a condition of faithfulness. One can serve God fully in whatever state one was called — married or single, circumcised or not, slave or free.'),
  (18, 'Is any man called being circumcised? let him not become uncircumcised. Is any called in uncircumcision? let him not be circumcised.',
   'περιτετμημένος τις ἐκλήθη μὴ ἐπισπάσθω ἐν ἀκροβυστίᾳ τις ἐκλήθη μὴ περιτεμνέσθω',
   'peritetmēmenos tis eklēthē mē epispasthō en akrobystia tis eklēthē mē peritemnesthō',
   '''Become uncircumcised'' (epispasthō — to draw over, pull forward the foreskin; a painful surgical procedure some Hellenised Jews underwent to disguise circumcision; cf. 1 Maccabees 1:15). ''Not be circumcised'' — Gentile converts should not adopt Jewish identity markers. Paul applies the ''remain'' principle to the Jewish/Gentile divide: conversion to Christ does not require ethnic or cultural transformation.',
   NULL),
  (19, 'Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of God.',
   'ἡ περιτομὴ οὐδέν ἐστιν καὶ ἡ ἀκροβυστία οὐδέν ἐστιν ἀλλὰ τήρησις ἐντολῶν θεοῦ',
   'hē peritomē ouden estin kai hē akrobystia ouden estin alla tērēsis entolōn theou',
   '''Circumcision is nothing'' (ouden estin — counts for nothing). Both circumcision and uncircumcision are adiaphora — matters of indifference in regard to salvation. What matters is ''keeping the commandments of God'' (tērēsis entolōn theou — observance of God''s commands). This does not contradict justification by faith but affirms that faith expresses itself in obedience (cf. Galatians 5:6; 6:15).',
   NULL),
  (20, 'Let every man abide in the same calling wherein he was called.',
   'ἕκαστος ἐν τῇ κλήσει ᾗ ἐκλήθη ἐν ταύτῃ μενέτω',
   'hekastos en tē klēsei hē eklēthē en tautē menetō',
   '''Abide'' (menetō — remain, stay). ''Calling'' (klēsei — the life situation in which God''s call found you). This is the second statement of the central principle (cf. vv.17, 24). Paul uses klēsis in an unusual way: not the call to salvation itself but the social condition at the time of conversion. The gospel transforms the person within their circumstances, not by requiring a change of circumstances.',
   NULL),
  (21, 'Art thou called being a servant? care not for it: but if thou mayest be made free, use it rather.',
   'δοῦλος ἐκλήθης μή σοι μελέτω ἀλλ᾿ εἰ καὶ δύνασαι ἐλεύθερος γενέσθαι μᾶλλον χρῆσαι',
   'doulos eklēthēs mē soi meletō all ei kai dynasai eleutheros genesthai mallon chrēsai',
   '''Servant'' (doulos — slave). ''Care not for it'' (mē soi meletō — let it not be a concern to you). ''Use it rather'' (mallon chrēsai — make use of it rather). The final clause is ambiguous: ''use'' what? Either (a) use the opportunity for freedom, or (b) use your slavery for Christ. Most scholars favour (a): if freedom is offered, take it. But slavery should not define your identity in Christ.',
   NULL),
  (22, 'For he that is called in the Lord, being a servant, is the Lord''s freeman: likewise also he that is called, being free, is Christ''s servant.',
   'ὁ γὰρ ἐν κυρίῳ κληθεὶς δοῦλος ἀπελεύθερος κυρίου ἐστίν ὁμοίως καὶ ὁ ἐλεύθερος κληθεὶς δοῦλός ἐστιν Χριστοῦ',
   'ho gar en kyriō klētheis doulos apeleutheros kyriou estin homoiōs kai ho eleutheros klētheis doulos estin Christou',
   '''The Lord''s freeman'' (apeleutheros kyriou — a freedman belonging to the Lord). ''Christ''s servant'' (doulos Christou — a slave of Christ). A paradox: the Christian slave is truly free in Christ; the free Christian is truly a slave of Christ. Social status is relativised by spiritual identity. Both slave and free belong to Christ and derive their true identity from him, not from their social position.',
   NULL),
  (23, 'Ye are bought with a price; be not ye the servants of men.',
   'τιμῆς ἠγοράσθητε μὴ γίνεσθε δοῦλοι ἀνθρώπων',
   'timēs ēgorasthēte mē ginesthe douloi anthrōpōn',
   '''Bought with a price'' (timēs ēgorasthēte — purchased at a cost; cf. 6:20). ''Be not servants of men'' (mē ginesthe douloi anthrōpōn — do not become slaves of human beings). The purchase price is Christ''s blood. Having been redeemed by Christ, believers should not voluntarily enslave themselves to human masters, opinions, or ideologies. This applies both literally (do not sell yourself into slavery) and spiritually (do not let human authority usurp Christ''s lordship).',
   NULL),
  (24, 'Brethren, let every man, wherein he is called, therein abide with God.',
   'ἕκαστος ἐν ᾧ ἐκλήθη ἀδελφοί ἐν τούτῳ μενέτω παρὰ θεῷ',
   'hekastos en hō eklēthē adelphoi en toutō menetō para theō',
   'Third and final statement of the ''remain'' principle (cf. vv.17, 20). ''Therein abide with God'' (menetō para theō — remain alongside God). The addition of ''with God'' transforms the instruction: you are not merely stuck in your situation — you are there with God. His presence sanctifies every calling and circumstance. This ''with God'' is the key that makes contentment possible in any station of life.',
   NULL),
  (25, 'Now concerning virgins I have no commandment of the Lord: yet I give my judgment, as one that hath obtained mercy of the Lord to be faithful.',
   'περὶ δὲ τῶν παρθένων ἐπιταγὴν κυρίου οὐκ ἔχω γνώμην δὲ δίδωμι ὡς ἠλεημένος ὑπὸ κυρίου πιστὸς εἶναι',
   'peri de tōn parthenōn epitagēn kyriou ouk echō gnōmēn de didōmi hōs ēleēmenos hypo kyriou pistos einai',
   '''Concerning virgins'' (peri tōn parthenōn — another topic from their letter). ''No commandment of the Lord'' — Jesus gave no direct teaching on this subject. ''My judgment'' (gnōmēn — opinion, considered advice). ''Obtained mercy to be faithful'' — Paul''s authority rests not on direct revelation here but on his Spirit-guided apostolic wisdom. He carefully distinguishes between what the Lord commanded and what Paul himself counsels.',
   NULL),
  (26, 'I suppose therefore that this is good for the present distress, I say, that it is good for a man so to be.',
   'νομίζω οὖν τοῦτο καλὸν ὑπάρχειν διὰ τὴν ἐνεστῶσαν ἀνάγκην ὅτι καλὸν ἀνθρώπῳ τὸ οὕτως εἶναι',
   'nomizō oun touto kalon hyparchein dia tēn enestōsan anankēn hoti kalon anthrōpō to houtōs einai',
   '''I suppose'' (nomizō — I consider, think, reckon). ''Present distress'' (tēn enestōsan anankēn — the current necessity, present crisis). This likely refers to a specific crisis in Corinth — famine, persecution, or social upheaval. ''Good for a man so to be'' — to remain in one''s current state, whether married or unmarried. Paul''s counsel is shaped by the circumstances: in crisis times, changing one''s situation adds unnecessary burden.',
   NULL),
  (27, 'Art thou bound unto a wife? seek not to be loosed. Art thou loosed from a wife? seek not a wife.',
   'δέδεσαι γυναικί μὴ ζήτει λύσιν λέλυσαι ἀπὸ γυναικός μὴ ζήτει γυναῖκα',
   'dedesai gynaiki mē zētei lysin lelysai apo gynaikos mē zētei gynaika',
   '''Bound'' (dedesai — tied, bound; perfect passive: currently in a state of being bound). ''Loosed'' (lelysai — released; perfect passive: currently free). ''Seek not'' (mē zētei — do not actively pursue). Married? Don''t seek divorce. Single? Don''t frantically pursue marriage. This is not a prohibition of marriage but counsel against restless seeking to change one''s status in a time of crisis.',
   NULL),
  (28, 'But and if thou marry, thou hast not sinned; and if a virgin marry, she hath not sinned. Nevertheless such shall have trouble in the flesh: but I spare you.',
   'ἐὰν δὲ καὶ γαμήσῃς οὐχ ἥμαρτες καὶ ἐὰν γήμῃ ἡ παρθένος οὐχ ἥμαρτεν θλῖψιν δὲ τῇ σαρκὶ ἕξουσιν οἱ τοιοῦτοι ἐγὼ δὲ ὑμῶν φείδομαι',
   'ean de kai gamēsēs ouch hēmartes kai ean gēmē hē parthenos ouch hēmarten thlipsin de tē sarki hexousin hoi toioutoi egō de hymōn pheidomai',
   '''Thou hast not sinned'' (ouch hēmartes — you did not sin). Marriage is not sin. ''Trouble in the flesh'' (thlipsin tē sarki — tribulation, distress in earthly life). ''I spare you'' (hymōn pheidomai — I am trying to protect you). Paul''s counsel against marriage in the present crisis is practical, not moral. Marriage will bring additional hardships during the ''present distress'' (v.26), and Paul wants to spare them unnecessary suffering.',
   NULL),
  (29, 'But this I say, brethren, the time is short: it remaineth, that both they that have wives be as though they had none;',
   'τοῦτο δέ φημι ἀδελφοί ὁ καιρὸς συνεσταλμένος τὸ λοιπόν ἐστιν ἵνα καὶ οἱ ἔχοντες γυναῖκας ὡς μὴ ἔχοντες ὦσιν',
   'touto de phēmi adelphoi ho kairos synestalmenos to loipon estin hina kai hoi echontes gynaikas hōs mē echontes ōsin',
   '''The time is short'' (ho kairos synestalmenos — the appointed season has been compressed, shortened, contracted). ''As though they had none'' — not abandonment of marriage but holding it with an open hand. Paul calls for an eschatological perspective: all earthly arrangements are temporary. The shortness of time relativises all human attachments — not abolishing them but preventing idolisation of them.',
   NULL),
  (30, 'And they that weep, as though they wept not; and they that rejoice, as though they rejoiced not; and they that buy, as though they possessed not;',
   'καὶ οἱ κλαίοντες ὡς μὴ κλαίοντες καὶ οἱ χαίροντες ὡς μὴ χαίροντες καὶ οἱ ἀγοράζοντες ὡς μὴ κατέχοντες',
   'kai hoi klaiontes hōs mē klaiontes kai hoi chairontes hōs mē chairontes kai hoi agorazontes hōs mē katechontes',
   'A series of ''as though not'' (hōs mē) statements describing the eschatological posture. Weeping, rejoicing, buying — all are relativised. This is not Stoic detachment but eschatological perspective: every earthly experience is temporary. The believer participates fully in human life but does not find ultimate meaning in it. Joy and sorrow alike are penultimate before the ultimate reality of Christ''s return.',
   NULL),
  (31, 'And they that use this world, as not abusing it: for the fashion of this world passeth away.',
   'καὶ οἱ χρώμενοι τὸν κόσμον ὡς μὴ καταχρώμενοι παράγει γὰρ τὸ σχῆμα τοῦ κόσμου τούτου',
   'kai hoi chrōmenoi ton kosmon hōs mē katachrōmenoi paragei gar to schēma tou kosmou toutou',
   '''Use'' (chrōmenoi — making use of). ''Abusing'' (katachrōmenoi — overusing, using to the full, exploiting). ''Fashion'' (schēma — outward form, appearance, present arrangement). ''Passeth away'' (paragei — is passing by, is in the process of disappearing). The present form (schēma) of the world is transient. Believers should use the world''s resources without being consumed by them.',
   NULL),
  (32, 'But I would have you without carefulness. He that is unmarried careth for the things that belong to the Lord, how he may please the Lord:',
   'θέλω δὲ ὑμᾶς ἀμερίμνους εἶναι ὁ ἄγαμος μεριμνᾷ τὰ τοῦ κυρίου πῶς ἀρέσει τῷ κυρίῳ',
   'thelō de hymas amerimnous einai ho agamos merimna ta tou kyriou pōs aresei tō kyriō',
   '''Without carefulness'' (amerimnous — free from anxiety, untroubled). ''Careth for'' (merimna — is concerned about, gives attention to). The single person can give undivided attention to the Lord''s things. This is Paul''s practical reason for preferring singleness: not that marriage is sinful but that it inevitably divides one''s attention between spouse and Lord.',
   NULL),
  (33, 'But he that is married careth for the things that are of the world, how he may please his wife.',
   'ὁ δὲ γαμήσας μεριμνᾷ τὰ τοῦ κόσμου πῶς ἀρέσει τῇ γυναικί',
   'ho de gamēsas merimna ta tou kosmou pōs aresei tē gynaiki',
   '''Careth for the things of the world'' — not worldliness but legitimate marital responsibilities. ''How he may please his wife'' — the married person must attend to the spouse''s needs. Paul does not condemn this concern but observes its practical consequence: divided attention. The married believer serves God both in spiritual devotion and in faithful marriage — but the attention is necessarily split.',
   NULL),
  (34, 'There is difference also between a wife and a virgin. The unmarried woman careth for the things of the Lord, that she may be holy both in body and in spirit: but she that is married careth for the things of the world, how she may please her husband.',
   'μεμέρισται ἡ γυνὴ καὶ ἡ παρθένος ἡ ἄγαμος μεριμνᾷ τὰ τοῦ κυρίου ἵνα ᾖ ἁγία καὶ σώματι καὶ πνεύματι ἡ δὲ γαμήσασα μεριμνᾷ τὰ τοῦ κόσμου πῶς ἀρέσει τῷ ἀνδρί',
   'memeristai hē gynē kai hē parthenos hē agamos merimna ta tou kyriou hina ē hagia kai sōmati kai pneumati hē de gamēsasa merimna ta tou kosmou pōs aresei tō andri',
   '''There is difference'' (memeristai — has been divided, is different). The unmarried woman can devote herself entirely to the Lord, being ''holy both in body and in spirit.'' The married woman has legitimate earthly obligations. Paul applies the same principle to women that he applied to men (v.33). The point is practical advantage, not moral superiority.',
   NULL),
  (35, 'And this I speak for your own profit; not that I may cast a snare upon you, but for that which is comely, and that ye may attend upon the Lord without distraction.',
   'τοῦτο δὲ πρὸς τὸ ὑμῶν αὐτῶν σύμφορον λέγω οὐχ ἵνα βρόχον ὑμῖν ἐπιβάλω ἀλλὰ πρὸς τὸ εὔσχημον καὶ εὐπάρεδρον τῷ κυρίῳ ἀπερισπάστως',
   'touto de pros to hymōn autōn sympheron legō ouch hina brochon hymin epibalō alla pros to euschēmon kai euparedron tō kyriō aperispastōs',
   '''For your own profit'' (pros to hymōn sympheron — for your benefit). ''Cast a snare'' (brochon epibalō — throw a noose over you, restrict you). ''Comely'' (euschēmon — fitting, proper, seemly). ''Without distraction'' (aperispastōs — without being pulled in different directions). Paul disclaims any desire to impose celibacy. His counsel aims at their welfare and undistracted devotion to the Lord.',
   NULL),
  (36, 'But if any man think that he behaveth himself uncomely toward his virgin, if she pass the flower of her age, and need so require, let him do what he will, he sinneth not: let them marry.',
   'εἰ δέ τις ἀσχημονεῖν ἐπὶ τὴν παρθένον αὐτοῦ νομίζει ἐὰν ᾖ ὑπέρακμος καὶ οὕτως ὀφείλει γίνεσθαι ὃ θέλει ποιείτω οὐχ ἁμαρτάνει γαμείτωσαν',
   'ei de tis aschēmonein epi tēn parthenon autou nomizei ean ē hyperakmos kai houtōs opheilei ginesthai ho thelei poieitō ouch hamartanei gameitōsan',
   '''Behaveth uncomely'' (aschēmonein — acting dishonourably). ''His virgin'' — either his betrothed daughter (father giving in marriage) or his fiancée. ''Flower of her age'' (hyperakmos — past the prime, beyond the bloom of youth). ''He sinneth not'' — marriage in this case is explicitly not sin. Paul gives freedom: if circumstances call for marriage, proceed without guilt.',
   NULL),
  (37, 'Nevertheless he that standeth stedfast in his heart, having no necessity, but hath power over his own will, and hath so decreed in his heart that he will keep his virgin, doeth well.',
   'ὃς δὲ ἕστηκεν ἑδραῖος ἐν τῇ καρδίᾳ μὴ ἔχων ἀνάγκην ἐξουσίαν δὲ ἔχει περὶ τοῦ ἰδίου θελήματος καὶ τοῦτο κέκρικεν ἐν τῇ καρδίᾳ αὐτοῦ τηρεῖν τὴν ἑαυτοῦ παρθένον καλῶς ποιεῖ',
   'hos de hestēken hedraios en tē kardia mē echōn anankēn exousian de echei peri tou idiou thelēmatos kai touto kekriken en tē kardia autou tērein tēn heautou parthenon kalōs poiei',
   '''Standeth stedfast'' (hestēken hedraios — stands firm, immovable in his resolved heart). Three conditions for not marrying: (1) no compelling necessity; (2) power over his own will (self-control); (3) a firm inner decision. If all three conditions are met, keeping the virgin unmarried is also ''well'' (kalōs poiei — does good). Both options — marriage and continued virginity — are legitimate.',
   NULL),
  (38, 'So then he that giveth her in marriage doeth well; but he that giveth her not in marriage doeth better.',
   'ὥστε καὶ ὁ ἐκγαμίζων καλῶς ποιεῖ καὶ ὁ μὴ ἐκγαμίζων κρεῖσσον ποιεῖ',
   'hōste kai ho ekgamizōn kalōs poiei kai ho mē ekgamizōn kreisson poiei',
   '''Doeth well'' (kalōs poiei — does something good). ''Doeth better'' (kreisson poiei — does something better, more advantageous). Paul''s comparative: both options are good, but in the context of the ''present distress'' (v.26) and the shortness of time (v.29), remaining single is the more advantageous choice. This is pragmatic counsel, not an absolute moral ranking of marriage vs. celibacy.',
   NULL),
  (39, 'The wife is bound by the law as long as her husband liveth; but if her husband be dead, she is at liberty to be married to whom she will; only in the Lord.',
   'γυνὴ δέδεται νόμῳ ἐφ᾿ ὅσον χρόνον ζῇ ὁ ἀνὴρ αὐτῆς ἐὰν δὲ κοιμηθῇ ὁ ἀνὴρ αὐτῆς ἐλευθέρα ἐστὶν ᾧ θέλει γαμηθῆναι μόνον ἐν κυρίῳ',
   'gynē dedetai nomō eph hoson chronon zē ho anēr autēs ean de koimēthē ho anēr autēs eleuthera estin hō thelei gamēthēnai monon en kyriō',
   '''Bound by the law'' (dedetai nomō — bound by legal obligation). ''As long as her husband liveth'' — marriage is a lifelong bond that only death dissolves. ''At liberty'' (eleuthera — free). ''Only in the Lord'' (monon en kyriō — the sole restriction: the new husband must be a believer). This phrase establishes the principle that believers should marry believers.',
   NULL),
  (40, 'But she is happier if she so abide, after my judgment: and I think also that I have the Spirit of God.',
   'μακαριωτέρα δέ ἐστιν ἐὰν οὕτως μείνῃ κατὰ τὴν ἐμὴν γνώμην δοκῶ δὲ κἀγὼ πνεῦμα θεοῦ ἔχειν',
   'makariotēra de estin ean houtōs meinē kata tēn emēn gnōmēn dokō de kagō pneuma theou echein',
   '''Happier'' (makariotēra — more blessed, more fortunate; comparative of makarios). ''After my judgment'' (kata tēn emēn gnōmēn — according to my considered opinion). ''I think I have the Spirit of God'' (dokō kagō pneuma theou echein) — modest irony, not uncertainty. Paul is gently asserting that his apostolic counsel carries the Spirit''s authority, while maintaining the distinction between direct commands from the Lord (v.10) and his own Spirit-guided advice.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 7;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.5 defraud
  ('ἀποστερέω', 'apostereō', 'G650', 'To defraud, deprive, rob, withhold — from apo (away) + stereō (to deprive). The same verb used of financial fraud (6:7-8) now applied to the marriage bed. Withholding conjugal rights from a spouse is a form of theft — robbing them of what is legitimately owed. Paul''s use of this strong verb shows that sexual neglect in marriage is a serious offense, not a trivial matter.', 1),
  -- v.7 gift (charisma)
  ('χάρισμα', 'charisma', 'G5486', 'A grace-gift, a free gift, a divine endowment — from charis (grace). Both marriage and celibacy are charismata: gifts freely given by God. This prevents the elevation of either state as intrinsically superior. The one who has the gift of celibacy is not more spiritual than the one who has the gift of marriage; each has received a different endowment from the same God.', 2),
  -- v.9 burn
  ('πυρόω', 'pyroō', 'G4448', 'To burn, set on fire, be inflamed — used metaphorically of burning with unfulfilled sexual desire. The present passive infinitive (pyrousthai — to keep on burning) describes a continuous state of unrelieved sexual frustration. Paul''s pastoral realism: if self-control is not one''s gift, marriage is the honourable and God-given remedy. Better to channel desire within marriage than to burn with it outside.', 3),
  -- v.14 sanctified
  ('ἁγιάζω', 'hagiazō', 'G37', 'To make holy, sanctify, consecrate, set apart — from hagios (holy). In this context, hagiazō does not refer to personal salvation but to relational consecration: the unbelieving spouse is set within the sphere of God''s covenant blessing through the marriage bond. The household is holy ground because one member belongs to Christ. This is covenantal, not magical — the unbeliever is sanctified relationally, not automatically saved.', 4),
  -- v.15 bondage
  ('δουλόω', 'douloō', 'G1402', 'To enslave, make a slave, bring into bondage — from doulos (slave). The perfect passive (dedoulōtai — has been enslaved) is emphatic: the believing spouse ''has not been enslaved.'' When an unbelieving spouse departs, the believer is freed from the marriage bond. The strong language of slavery/freedom suggests full release, not merely physical separation. God has called us to peace, not to bondage in an abandoned marriage.', 5),
  -- v.17 calling (klēsis)
  ('κλῆσις', 'klēsis', 'G2821', 'Calling, vocation, station in life — from kaleō (to call). Paul uses klēsis in a distinctive way: not the divine call to salvation (though that is presupposed) but the life situation in which one finds oneself when God''s saving call arrives. Married, single, circumcised, uncircumcised, slave, free — these are all ''callings'' in which one can fully serve God. The gospel sanctifies every legitimate station of life.', 6),
  -- v.29 time is short
  ('συστέλλω', 'systellō', 'G4958', 'To shorten, compress, contract, draw together — from syn (together) + stellō (to send, arrange). The perfect passive participle (synestalmenos — having been compressed) describes the time as already shortened by God. The eschaton compresses all human experience: marriages, griefs, joys, possessions, and worldly activities are all relativised by the approaching end. This creates an ''as though not'' posture (hōs mē) toward all earthly things.', 7),
  -- v.35 without distraction
  ('ἀπερισπάστως', 'aperispastōs', 'G563', 'Without distraction, without being pulled away — from a (not) + perispaomai (to be drawn away, distracted; cf. Luke 10:40 where Martha is ''distracted'' with much serving). This adverb appears only here in the NT. Paul''s ideal for every believer is undistracted devotion (euparedron — sitting well beside) to the Lord. Singleness facilitates this, though it is not the only path to devoted service.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 7
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 5
    WHEN 2 THEN 7
    WHEN 3 THEN 9
    WHEN 4 THEN 14
    WHEN 5 THEN 15
    WHEN 6 THEN 17
    WHEN 7 THEN 29
    WHEN 8 THEN 35
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 avoid fornication
  (2, '1 Thessalonians 4:3-5', 1),
  (2, 'Hebrews 13:4', 2),
  -- v.3 due benevolence
  (3, 'Exodus 21:10', 3),
  (3, '1 Peter 3:7', 4),
  -- v.7 each has a gift
  (7, 'Matthew 19:11-12', 5),
  -- v.9 better to marry than burn
  (9, '1 Timothy 5:14', 6),
  -- v.10 the Lord commands
  (10, 'Matthew 5:32', 7),
  (10, 'Matthew 19:3-9', 8),
  (10, 'Mark 10:2-12', 9),
  -- v.14 sanctified / children holy
  (14, 'Malachi 2:15', 10),
  (14, 'Acts 16:31', 11),
  -- v.15 not under bondage
  (15, 'Romans 12:18', 12),
  -- v.19 keeping commandments
  (19, 'Galatians 5:6', 13),
  (19, 'Galatians 6:15', 14),
  -- v.22 freeman / servant
  (22, 'Galatians 3:28', 15),
  (22, 'Philemon 1:16', 16),
  -- v.23 bought with a price
  (23, '1 Corinthians 6:20', 17),
  (23, '1 Peter 1:18-19', 18),
  -- v.29 time is short
  (29, 'Romans 13:11-12', 19),
  (29, '1 Peter 4:7', 20),
  -- v.31 fashion passeth away
  (31, '1 John 2:17', 21),
  (31, '2 Peter 3:10', 22),
  -- v.39 bound as long as husband liveth
  (39, 'Romans 7:2-3', 23),
  -- v.39 only in the Lord
  (39, '2 Corinthians 6:14', 24)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 7
  AND v.verse_number = cr.verse_number;
