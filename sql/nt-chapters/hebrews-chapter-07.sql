-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 7 — The Melchizedek Priesthood and Christ's Eternal Ministry
-- 28 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 7,
  'Hebrews 7 is the theological center of the epistle, presenting the full exposition of Christ''s Melchizedek priesthood that was introduced in 5:6,10 and 6:20. The chapter unfolds in three movements. First (vv.1-10), the author interprets the enigmatic figure of Melchizedek from Genesis 14:18-20: he was ''king of Salem'' (king of peace), ''priest of the most high God'' (combining kingship and priesthood), and appeared ''without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of God; abideth a priest continually'' (v.3). Abraham paid tithes to Melchizedek, and Levi (still in Abraham''s loins) thereby acknowledged Melchizedek''s superiority (vv.4-10). Second (vv.11-19), the argument turns: if the Levitical priesthood were sufficient, there would be no need for ''another priest … after the order of Melchisedec'' (v.11). The change of priesthood implies a change of law (v.12). Christ comes from Judah, not Levi — ''of which tribe Moses spake nothing concerning priesthood'' (v.14). He is priest ''not after the law of a carnal commandment, but after the power of an endless life'' (v.16). The Levitical law is set aside because of its ''weakness and unprofitableness'' (v.18), ''for the law made nothing perfect'' (v.19). Third (vv.20-28), Christ''s priesthood is confirmed by God''s oath (Ps 110:4) — ''The Lord sware and will not repent, Thou art a priest for ever'' (v.21). This makes Jesus ''the surety of a better testament'' (v.22). Unlike mortal Levitical priests, He ''continueth ever'' and has ''an unchangeable priesthood'' (v.24). ''Wherefore he is able also to save them to the uttermost that come unto God by him, seeing he ever liveth to make intercession for them'' (v.25). The chapter climaxes with one of the NT''s greatest summaries: ''For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens'' (v.26).',
  'The Melchizedek Priesthood: Christ''s Eternal, Superior, Unchangeable Ministry',
  'ἀπαράβατος (aparabatos)',
  'Unchangeable, permanent, non-transferable, inviolable — from a (not) + parabainō (to pass beside, to transgress). A NT hapax (only in v.24). Christ''s priesthood is aparabatos — it cannot pass to another, it cannot be violated or set aside. Unlike the Levitical priesthood which was transferred from father to son because of death, Christ''s priesthood is permanent because He lives forever. It is the ''untransferable'' priesthood — belonging to Him alone, eternal and exclusive.',
  '["Melchizedek: Greater Than Abraham (vv.1-10): For this Melchisedec king of Salem priest of the most high God who met Abraham returning from the slaughter of the kings and blessed him to whom also Abraham gave a tenth part of all first being by interpretation King of righteousness and after that also King of Salem which is King of peace without father without mother without descent having neither beginning of days nor end of life but made like unto the Son of God abideth a priest continually; now consider how great this man was unto whom even the patriarch Abraham gave the tenth of the spoils; they that are of the sons of Levi who receive the office of the priesthood have a commandment to take tithes of the people; but he whose descent is not counted from them received tithes of Abraham and blessed him that had the promises; without all contradiction the less is blessed of the better; here men that die receive tithes but there he receiveth them of whom it is witnessed that he liveth; and as I may so say Levi also who receiveth tithes payed tithes in Abraham for he was yet in the loins of his father when Melchisedec met him","The Levitical Priesthood Set Aside (vv.11-19): If therefore perfection were by the Levitical priesthood what further need was there that another priest should rise after the order of Melchisedec; for the priesthood being changed there is made of necessity a change also of the law; for he of whom these things are spoken pertaineth to another tribe of which no man gave attendance at the altar; for it is evident that our Lord sprang out of Juda of which tribe Moses spake nothing concerning priesthood; and it is yet far more evident for that after the similitude of Melchisedec there ariseth another priest who is made not after the law of a carnal commandment but after the power of an endless life; for he testifieth Thou art a priest for ever after the order of Melchisedec; for there is verily a disannulling of the commandment going before for the weakness and unprofitableness thereof; for the law made nothing perfect but the bringing in of a better hope did by the which we draw nigh unto God","Christ''s Priesthood Confirmed by Oath (vv.20-28): And inasmuch as not without an oath he was made priest for those priests were made without an oath but this with an oath by him that said unto him The Lord sware and will not repent Thou art a priest for ever after the order of Melchisedec; by so much was Jesus made a surety of a better testament; and they truly were many priests because they were not suffered to continue by reason of death; but this man because he continueth ever hath an unchangeable priesthood; wherefore he is able also to save them to the uttermost that come unto God by him seeing he ever liveth to make intercession for them; for such an high priest became us who is holy harmless undefiled separate from sinners and made higher than the heavens; who needeth not daily as those high priests to offer up sacrifice first for his own sins and then for the peoples; for this he did once when he offered up himself; for the law maketh men high priests which have infirmity but the word of the oath which was since the law maketh the Son who is consecrated for evermore"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 28 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'For this Melchisedec, king of Salem, priest of the most high God, who met Abraham returning from the slaughter of the kings, and blessed him;',
   'οὗτος γὰρ ὁ Μελχισεδέκ βασιλεὺς Σαλήμ ἱερεὺς τοῦ θεοῦ τοῦ ὑψίστου ὁ συναντήσας Ἀβραὰμ ὑποστρέφοντι ἀπὸ τῆς κοπῆς τῶν βασιλέων καὶ εὐλογήσας αὐτόν',
   'houtos gar ho Melchisedek basileus Salēm hiereus tou theou tou hypsistou ho synantēsas Abraam hypostrephonti apo tēs kopēs tōn basileōn kai eulogēsas auton',
   'The Melchizedek exposition begins. Drawing from Genesis 14:18-20 (the only OT narrative about Melchizedek) and Psalm 110:4 (the only OT prophecy about him). ''King of Salem'' (basileus Salēm) — Salem is an ancient name for Jerusalem (Ps 76:2). ''Priest of the most high God'' (hiereus tou theou tou hypsistou) — Melchizedek uniquely combined kingship and priesthood, roles that were strictly separated in Israel (Saul was punished for offering sacrifice, 1 Sam 13). ''Met Abraham returning from the slaughter of the kings'' — after Abraham''s victory over Chedorlaomer and the allied kings (Gen 14:1-17). ''Blessed him'' — the priest blessed the patriarch, establishing Melchizedek''s superiority.',
   NULL),
  (2, 'To whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace;',
   'ᾧ καὶ δεκάτην ἀπὸ πάντων ἐμέρισεν Ἀβραάμ πρῶτον μὲν ἑρμηνευόμενος βασιλεὺς δικαιοσύνης ἔπειτα δὲ καὶ βασιλεὺς Σαλήμ ὅ ἐστιν βασιλεὺς εἰρήνης',
   'hō kai dekatēn apo pantōn emerisen Abraam prōton men hermēneuomenos basileus dikaiosynēs epeita de kai basileus Salēm ho estin basileus eirēnēs',
   '''A tenth part of all'' (dekatēn apo pantōn — a tithe of everything). Abraham — the greatest patriarch — voluntarily gave tithes to Melchizedek, acknowledging the latter''s superiority. The author then interprets Melchizedek''s names: (1) ''King of righteousness'' (basileus dikaiosynēs — ''Melchizedek'' in Hebrew means ''king of righteousness,'' from melek [king] + tsedeq [righteousness]). (2) ''King of peace'' (basileus eirēnēs — ''Salem'' means ''peace'' [shalom]). The order is significant: first righteousness, then peace — for there can be no true peace without righteousness (cf. Ps 85:10). Christ is both: the King of righteousness who establishes peace.',
   NULL),
  (3, 'Without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of God; abideth a priest continually.',
   'ἀπάτωρ ἀμήτωρ ἀγενεαλόγητος μήτε ἀρχὴν ἡμερῶν μήτε ζωῆς τέλος ἔχων ἀφωμοιωμένος δὲ τῷ υἱῷ τοῦ θεοῦ μένει ἱερεὺς εἰς τὸ διηνεκές',
   'apatōr amētōr agenealogētos mēte archēn hēmerōn mēte zōēs telos echōn aphōmoiōmenos de tō hyiō tou theou menei hiereus eis to diēnekes',
   '''Without father, without mother, without descent'' (apatōr, amētōr, agenealogētos — three striking terms, all NT hapax). This does not mean Melchizedek was a supernatural being; it means the Genesis record provides no genealogy for him — no parents, no ancestry, no birth or death recorded. In the Levitical system, genealogy was everything (a priest had to prove descent from Aaron). Melchizedek has no recorded genealogy yet is a priest — proving that a valid priesthood exists outside the Levitical line. ''Made like unto the Son of God'' (aphōmoiōmenos tō hyiō tou theou — made similar to, fashioned as a type of the Son of God). Melchizedek is the type; Christ is the reality. The silence of Scripture about Melchizedek''s beginning and end is a divinely intended picture of the Son''s eternal priesthood.',
   'The author''s argument rests on the theological significance of Scripture''s silence. What Genesis does not say about Melchizedek (no genealogy, no birth, no death) is as important as what it does say. This hermeneutical principle — the intentional silence of Scripture as theologically meaningful — is characteristic of Hebrews'' approach to the OT.'),
  (4, 'Now consider how great this man was, unto whom even the patriarch Abraham gave the tenth of the spoils.',
   'θεωρεῖτε δὲ πηλίκος οὗτος ᾧ καὶ δεκάτην Ἀβραὰμ ἔδωκεν ἐκ τῶν ἀκροθινίων ὁ πατριάρχης',
   'theōreite de pēlikos houtos hō kai dekatēn Abraam edōken ek tōn akrothinion ho patriarchēs',
   '''Consider how great'' (theōreite pēlikos — observe, contemplate how distinguished/important). ''The patriarch Abraham'' (ho patriarchēs) — the title emphasizes Abraham''s supreme standing in Israel. If Abraham, the greatest patriarch, paid tithes to Melchizedek, then Melchizedek is greater than Abraham. And if Melchizedek is greater than Abraham, then the priesthood ''after the order of Melchizedek'' is greater than the priesthood descended from Abraham through Levi. ''The spoils'' (tōn akrothinion — the top of the heap, the choicest portion of the plunder; Abraham gave the best, not the leftovers).',
   NULL),
  (5, 'And verily they that are of the sons of Levi, who receive the office of the priesthood, have a commandment to take tithes of the people according to the law, that is, of their brethren, though they come out of the loins of Abraham:',
   'καὶ οἱ μὲν ἐκ τῶν υἱῶν Λευὶ τὴν ἱερατείαν λαμβάνοντες ἐντολὴν ἔχουσιν ἀποδεκατοῦν τὸν λαὸν κατὰ τὸν νόμον τοῦτ᾽ ἔστιν τοὺς ἀδελφοὺς αὐτῶν καίπερ ἐξεληλυθότας ἐκ τῆς ὀσφύος Ἀβραάμ',
   'kai hoi men ek tōn hyiōn Leui tēn hierateian lambanontes entolēn echousin apodekatoun ton laon kata ton nomon tout estin tous adelphous autōn kaiper exelēlythotas ek tēs osphyos Abraam',
   'Levitical priests collected tithes from their fellow Israelites — all descendants of Abraham. Both the priests and the people traced their lineage to the same patriarch. The Levites'' right to tithes was ''according to the law'' — it was a commandment, not voluntary. But Melchizedek received tithes from Abraham himself — voluntarily, before the law existed, and from the one who was the ancestor of both the tithing people and the priestly tribe.',
   NULL),
  (6, 'But he whose descent is not counted from them received tithes of Abraham, and blessed him that had the promises.',
   'ὁ δὲ μὴ γενεαλογούμενος ἐξ αὐτῶν δεδεκάτωκεν τὸν Ἀβραάμ καὶ τὸν ἔχοντα τὰς ἐπαγγελίας εὐλόγηκεν',
   'ho de mē genealogoumenos ex autōn dedekatōken ton Abraam kai ton echonta tas epangelias eulogēken',
   '''Not counted from them'' (mē genealogoumenos ex autōn — not having his genealogy traced from the Levites). Melchizedek stands outside the Levitical lineage entirely. ''Received tithes of Abraham'' (dedekatōken — perfect tense: has tithed, the effect stands permanently). ''Blessed him that had the promises'' (eulogēken ton echonta tas epangelias). Abraham was the covenant-holder, the promise-bearer — yet Melchizedek blessed him. Two proofs of superiority: (1) receiving tithes, (2) bestowing blessing.',
   NULL),
  (7, 'And without all contradiction the less is blessed of the better.',
   'χωρὶς δὲ πάσης ἀντιλογίας τὸ ἔλαττον ὑπὸ τοῦ κρείττονος εὐλογεῖται',
   'chōris de pasēs antilogias to elatton hypo tou kreittonos eulogeitai',
   '''Without all contradiction'' (chōris pasēs antilogias — beyond all dispute, an axiom). ''The less is blessed of the better'' (to elatton hypo tou kreittonos eulogeitai — the lesser is blessed by the greater). This is an incontestable principle: the one who bestows the blessing holds a higher position than the one who receives it. Since Melchizedek blessed Abraham, Melchizedek is greater. The implication cascades: Melchizedek > Abraham > Levi > Levitical priests. Therefore the Melchizedek priesthood > the Levitical priesthood.',
   NULL),
  (8, 'And here men that die receive tithes; but there he receiveth them, of whom it is witnessed that he liveth.',
   'καὶ ὧδε μὲν δεκάτας ἀποθνῄσκοντες ἄνθρωποι λαμβάνουσιν ἐκεῖ δὲ μαρτυρούμενος ὅτι ζῇ',
   'kai hōde men dekatas apothnēskontes anthrōpoi lambanousin ekei de martyroumenos hoti zē',
   '''Here men that die'' (apothnēskontes anthrōpoi — mortal men, dying men). Levitical priests die and are replaced; their priesthood is inherently transient. ''There he … of whom it is witnessed that he liveth'' (martyroumenos hoti zē — of whom it is testified that he lives). Since Scripture records no death for Melchizedek, he ''lives'' in the record — serving as a type of the eternally living Christ. The contrast: mortal priests vs. a living priest. Death disqualifies; endless life qualifies.',
   NULL),
  (9, 'And as I may so say, Levi also, who receiveth tithes, payed tithes in Abraham.',
   'καὶ ὡς ἔπος εἰπεῖν διὰ Ἀβραὰμ καὶ Λευὶ ὁ δεκάτας λαμβάνων δεδεκάτωται',
   'kai hōs epos eipein dia Abraam kai Leui ho dekatas lambanōn dedekatōtai',
   '''As I may so say'' (hōs epos eipein — so to speak, in a manner of speaking; the author acknowledges the boldness of the argument). Levi, the ancestor of all Israelite priests, was ''in the loins of Abraham'' when Abraham paid tithes to Melchizedek. Therefore Levi himself paid tithes to Melchizedek — through Abraham. This corporate/seminal headship argument was common in ancient thinking: a descendant is contained in and represented by his ancestor. If Levi paid tithes to Melchizedek, then the entire Levitical priesthood acknowledged Melchizedek''s superiority.',
   NULL),
  (10, 'For he was yet in the loins of his father, when Melchisedec met him.',
   'ἔτι γὰρ ἐν τῇ ὀσφύϊ τοῦ πατρὸς ἦν ὅτε συνήντησεν αὐτῷ ὁ Μελχισεδέκ',
   'eti gar en tē osphyi tou patros ēn hote synēntēsen autō ho Melchisedek',
   '''In the loins of his father'' (en tē osphyi tou patros — Levi was biologically present in Abraham, two generations before his birth). The argument from seminal headship: what Abraham did, his descendants did ''in him.'' This concludes the first section: Melchizedek is demonstrably greater than Abraham and therefore greater than Levi and the entire Levitical system.',
   NULL),
  (11, 'If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melchisedec, and not be called after the order of Aaron?',
   'εἰ μὲν οὖν τελείωσις διὰ τῆς Λευϊτικῆς ἱερωσύνης ἦν ὁ λαὸς γὰρ ἐπ᾽ αὐτῇ νενομοθέτητο τίς ἔτι χρεία κατὰ τὴν τάξιν Μελχισεδὲκ ἕτερον ἀνίστασθαι ἱερέα καὶ οὐ κατὰ τὴν τάξιν Ἀαρὼν λέγεσθαι',
   'ei men oun teleiōsis dia tēs Leuitikēs hierōsynēs ēn ho laos gar ep autē nenomothetēto tis eti chreia kata tēn taxin Melchisedek heteron anistasthai hierea kai ou kata tēn taxin Aarōn legesthai',
   '''If perfection were by the Levitical priesthood'' (ei teleiōsis dia tēs Leuitikēs hierōsynēs — if completion, if the final goal could be reached through the Levitical priesthood). ''The people received the law'' under this priesthood — the entire Mosaic system was built on the Levitical order. ''What further need?'' The decisive argument: Psalm 110:4 prophesies ''another priest'' of a different order (Melchizedek, not Aaron). If the Levitical system could achieve perfection (teleōsis — bringing things to their intended goal), God would never have prophesied its replacement. The very existence of Psalm 110:4 proves the Levitical system was always temporary and insufficient.',
   'This verse contains the argument that overturns the entire Levitical system: if it could bring perfection, why did God promise another priest of a different order? The argument is from Scripture itself — not human reasoning but God''s own word declared the inadequacy of the system He Himself established. The law was never meant to be permanent; it was preparatory for Christ.'),
  (12, 'For the priesthood being changed, there is made of necessity a change also of the law.',
   'μετατιθεμένης γὰρ τῆς ἱερωσύνης ἐξ ἀνάγκης καὶ νόμου μετάθεσις γίνεται',
   'metatithemenēs gar tēs hierōsynēs ex anankēs kai nomou metathesis ginetai',
   '''The priesthood being changed'' (metatithemenēs tēs hierōsynēs — the priesthood being transferred/transposed). ''Of necessity'' (ex anankēs — by logical and theological necessity). ''A change also of the law'' (nomou metathesis — a transposition of the law). The argument is profound: the law and the priesthood are an integrated system. If the priesthood changes, the law must change with it. A new priesthood requires a new legal framework. This is one of the most radical statements in the NT: the Mosaic law is set aside because the priesthood that undergirded it has been superseded.',
   'This verse establishes a principle of immense theological significance: the Mosaic law was inseparable from the Levitical priesthood. When God replaced the Aaronic priesthood with the Melchizedek order in Christ, the entire Mosaic legal framework was necessarily set aside — not destroyed but fulfilled and superseded by a better covenant (ch.8).'),
  (13, 'For he of whom these things are spoken pertaineth to another tribe, of which no man gave attendance at the altar.',
   'ἐφ᾽ ὃν γὰρ λέγεται ταῦτα φυλῆς ἑτέρας μετέσχηκεν ἀφ᾽ ἧς οὐδεὶς προσέσχηκεν τῷ θυσιαστηρίῳ',
   'eph hon gar legetai tauta phylēs heteras meteschēken aph hēs oudeis proseschēken tō thysiastēriō',
   '''Another tribe'' (phylēs heteras — a different tribe entirely). ''No man gave attendance at the altar'' (oudeis proseschēken tō thysiastēriō — no one from that tribe has served at the altar). Jesus was from the tribe of Judah, which had no priestly function whatsoever. Under the Mosaic law, only Levites could serve as priests; a Judahite at the altar would be a violation. The fact that God appointed a priest from Judah proves a change in the system itself.',
   NULL),
  (14, 'For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.',
   'πρόδηλον γὰρ ὅτι ἐξ Ἰούδα ἀνατέταλκεν ὁ κύριος ἡμῶν εἰς ἣν φυλὴν οὐδὲν περὶ ἱερωσύνης Μωϋσῆς ἐλάλησεν',
   'prodēlon gar hoti ex Iouda anatetalken ho kyrios hēmōn eis hēn phylēn ouden peri hierōsynēs Mōysēs elalēsen',
   '''It is evident'' (prodēlon — clear beforehand, manifest, obvious). ''Sprang out of Juda'' (ex Iouda anatetalken — has risen, has dawned from Judah; the verb anatellō is used of the rising sun or a sprouting plant — messianic imagery from Isa 11:1; Zech 6:12). ''Moses spake nothing concerning priesthood'' — complete silence. The Mosaic law assigned no priestly role to Judah. Christ''s priesthood from Judah is therefore outside the Mosaic system entirely — a new order, not a modification of the old.',
   NULL),
  (15, 'And it is yet far more evident: for that after the similitude of Melchisedec there ariseth another priest,',
   'καὶ περισσότερον ἔτι κατάδηλόν ἐστιν εἰ κατὰ τὴν ὁμοιότητα Μελχισεδὲκ ἀνίσταται ἱερεὺς ἕτερος',
   'kai perissoteron eti katadēlon estin ei kata tēn homoiotēta Melchisedek anistatai hiereus heteros',
   '''Far more evident'' (perissoteron katadēlon — abundantly clear, emphatically obvious). ''After the similitude of Melchisedec'' (kata tēn homoiotēta — according to the likeness/pattern). ''Another priest'' (hiereus heteros — a priest of a different kind; heteros suggests qualitative difference, not just numerical addition). This priest is fundamentally different from the Levitical order — not a reform of the old system but an entirely new kind of priesthood.',
   NULL),
  (16, 'Who is made, not after the law of a carnal commandment, but after the power of an endless life.',
   'ὃς οὐ κατὰ νόμον ἐντολῆς σαρκίνης γέγονεν ἀλλὰ κατὰ δύναμιν ζωῆς ἀκαταλύτου',
   'hos ou kata nomon entolēs sarkinēs gegonen alla kata dynamin zōēs akatalytou',
   '''Not after the law of a carnal commandment'' (ou kata nomon entolēs sarkinēs — not according to a law of fleshly/physical commandment). The Levitical priesthood was based on physical descent — bodily lineage from Aaron. It was a ''carnal'' (sarkinēs — fleshly, belonging to the realm of flesh) arrangement. ''But after the power of an endless life'' (alla kata dynamin zōēs akatalytou — according to the power of an indestructible/indissoluble life). Christ''s priesthood is based not on genealogy but on resurrection power — His life cannot be destroyed. ''Endless'' (akatalytou — unable to be dissolved, indestructible; a NT hapax). The contrast is absolute: flesh vs. power; death vs. indestructible life.',
   'The distinction between ''carnal commandment'' and ''power of an endless life'' captures the fundamental difference between the old and new covenants. The Levitical system operated in the realm of flesh — external, temporal, and subject to death. Christ''s priesthood operates in the realm of resurrection power — internal, eternal, and beyond death''s reach.'),
  (17, 'For he testifieth, Thou art a priest for ever after the order of Melchisedec.',
   'μαρτυρεῖ γὰρ ὅτι σὺ ἱερεὺς εἰς τὸν αἰῶνα κατὰ τὴν τάξιν Μελχισεδέκ',
   'martyrei gar hoti sy hiereus eis ton aiōna kata tēn taxin Melchisedek',
   'Psalm 110:4 quoted again — the anchor text of the entire argument. ''He testifieth'' (martyrei — He bears witness; present tense: the testimony is ongoing and living). ''For ever'' (eis ton aiōna — unto the age, perpetually). The permanence of Christ''s priesthood is contrasted with the impermanence of the Levitical order. God Himself, through David, testified to an eternal priesthood of a different order — this is not the author''s invention but God''s own declaration.',
   NULL),
  (18, 'For there is verily a disannulling of the commandment going before for the weakness and unprofitableness thereof.',
   'ἀθέτησις μὲν γὰρ γίνεται προαγούσης ἐντολῆς διὰ τὸ αὐτῆς ἀσθενὲς καὶ ἀνωφελές',
   'athetēsis men gar ginetai proagousēs entolēs dia to autēs asthenes kai anōpheles',
   '''Disannulling'' (athetēsis — setting aside, annulment, abrogation). ''The commandment going before'' (proagousēs entolēs — the preceding commandment, the earlier regulation — i.e., the Mosaic law). ''Weakness'' (asthenes — powerless, feeble). ''Unprofitableness'' (anōpheles — useless, without benefit). The law is not wicked or evil — it is weak and unprofitable. It could diagnose sin but not cure it; it could command but not empower; it could reveal God''s standard but not enable compliance. This is not criticism of God''s law but recognition of its God-intended limitation.',
   NULL),
  (19, 'For the law made nothing perfect, but the bringing in of a better hope did; by the which we draw nigh unto God.',
   'οὐδὲν γὰρ ἐτελείωσεν ὁ νόμος ἐπεισαγωγὴ δὲ κρείττονος ἐλπίδος δι᾽ ἧς ἐγγίζομεν τῷ θεῷ',
   'ouden gar eteleiōsen ho nomos epeisagōgē de kreittonos elpidos di hēs engizomen tō theō',
   '''The law made nothing perfect'' (ouden eteleiōsen ho nomos — the law brought nothing to completion, to its intended goal). ''The bringing in of a better hope'' (epeisagōgē kreittonos elpidos — the introduction alongside, the superimposing of a superior hope). ''By the which we draw nigh unto God'' (di hēs engizomen tō theō — through which we approach God). The law could not bring us near to God — it kept us at a distance (cf. the veil, the restricted access, the penalties for trespassing sacred space). The ''better hope'' — Christ''s priesthood — does what the law never could: it brings us directly into God''s presence.',
   'This verse summarizes the entire Hebrews argument about the law: it was weak, unprofitable, and perfected nothing — but it was replaced by something incomparably better. The ''better hope'' enables what the law prohibited: direct access to God. Drawing near to God is the goal of all religion; only Christ achieves it.'),
  (20, 'And inasmuch as not without an oath he was made priest:',
   'καὶ καθ᾽ ὅσον οὐ χωρὶς ὁρκωμοσίας',
   'kai kath hoson ou chōris horkōmosias',
   '''Not without an oath'' (ou chōris horkōmosias — not without oath-swearing). A new argument for Christ''s superiority: the manner of His appointment. Levitical priests were appointed by hereditary succession — no oath was involved. Christ was appointed by a divine oath (Ps 110:4). An oath adds irrevocable solemnity to a promise. God''s appointment of Christ was not routine succession but a sworn, deliberate, unrepeatable decree.',
   NULL),
  (21, '(For those priests were made without an oath; but this with an oath by him that said unto him, The Lord sware and will not repent, Thou art a priest for ever after the order of Melchisedec:)',
   'οἱ μὲν γὰρ χωρὶς ὁρκωμοσίας εἰσὶν ἱερεῖς γεγονότες ὁ δὲ μετὰ ὁρκωμοσίας διὰ τοῦ λέγοντος πρὸς αὐτόν ὤμοσεν κύριος καὶ οὐ μεταμεληθήσεται σὺ ἱερεὺς εἰς τὸν αἰῶνα κατὰ τὴν τάξιν Μελχισεδέκ',
   'hoi men gar chōris horkōmosias eisin hiereis gegonotes ho de meta horkōmosias dia tou legontos pros auton ōmosen kyrios kai ou metamelēthēsetai sy hiereus eis ton aiōna kata tēn taxin Melchisedek',
   '''The Lord sware and will not repent'' (ōmosen kyrios kai ou metamelēthēsetai — the Lord has sworn and will not change His mind). Quoting Psalm 110:4 with the oath formula. ''Will not repent'' (ou metamelēthēsetai — will not regret, will not reverse His decision). God''s appointment of Christ is irrevocable. Unlike human decisions that may be reconsidered, God''s oath-bound decree stands forever. The Levitical priesthood was established by command (Exod 28); Christ''s was established by oath. Command can be superseded; an oath cannot.',
   NULL),
  (22, 'By so much was Jesus made a surety of a better testament.',
   'κατὰ τοσοῦτο κρείττονος διαθήκης γέγονεν ἔγγυος Ἰησοῦς',
   'kata tosouton kreittonos diathēkēs gegonen engyos Iēsous',
   '''Surety'' (engyos — guarantor, pledge, one who personally guarantees the fulfillment of an agreement; a NT hapax). Jesus is the engyos — the personal guarantor — of a ''better testament'' (kreittonos diathēkēs — a superior covenant). A surety pledges his own life and resources to ensure the covenant is kept. Jesus guarantees the new covenant not with His reputation but with His very person, His blood, His endless life. If the covenant fails, the guarantor fails — and since Jesus cannot fail, the covenant is absolutely secure.',
   'The introduction of ''testament/covenant'' (diathēkē) here anticipates the full exposition of the new covenant in chapters 8-10. Christ is not merely the mediator of the covenant (as Moses was of the old) but its surety — He personally guarantees every promise with His own eternal life.'),
  (23, 'And they truly were many priests, because they were not suffered to continue by reason of death:',
   'καὶ οἱ μὲν πλείονές εἰσιν γεγονότες ἱερεῖς διὰ τὸ θανάτῳ κωλύεσθαι παραμένειν',
   'kai hoi men pleiones eisin gegonotes hiereis dia to thanatō kōlyesthai paramenein',
   '''Many priests'' (pleiones hiereis — more numerous priests). ''Because they were not suffered to continue by reason of death'' (dia to thanatō kōlyesthai paramenein — because death prevented them from remaining permanently). The Levitical system had an inherent deficiency: every high priest died. Jewish tradition records 83 high priests from Aaron to the destruction of the temple. Each death interrupted the priestly ministry and required succession. Death was the fatal flaw in the system — not because the priests were bad but because they were mortal.',
   NULL),
  (24, 'But this man, because he continueth ever, hath an unchangeable priesthood.',
   'ὁ δὲ διὰ τὸ μένειν αὐτὸν εἰς τὸν αἰῶνα ἀπαράβατον ἔχει τὴν ἱερωσύνην',
   'ho de dia to menein auton eis ton aiōna aparabaton echei tēn hierōsynēn',
   '''Continueth ever'' (menein eis ton aiōna — He remains forever). ''Unchangeable priesthood'' (aparabaton tēn hierōsynēn — a priesthood that is inviolable, untransferable, permanent). Aparabatos is a NT hapax meaning ''not to be passed on to another'' — Christ''s priesthood does not transfer because He never dies. There is no successor because there is no vacancy. He is the first, last, and only priest of His order — and He holds that office forever.',
   NULL),
  (25, 'Wherefore he is able also to save them to the uttermost that come unto God by him, seeing he ever liveth to make intercession for them.',
   'ὅθεν καὶ σώζειν εἰς τὸ παντελὲς δύναται τοὺς προσερχομένους δι᾽ αὐτοῦ τῷ θεῷ πάντοτε ζῶν εἰς τὸ ἐντυγχάνειν ὑπὲρ αὐτῶν',
   'hothen kai sōzein eis to panteles dynatai tous proserchomenous di autou tō theō pantote zōn eis to entynchanein hyper autōn',
   '''Save … to the uttermost'' (sōzein eis to panteles — to save completely, to save to the fullest extent, to save without remainder). Panteles can mean either ''completely'' (in extent) or ''forever'' (in time) — and both are true. Christ saves totally and permanently. ''That come unto God by him'' (tous proserchomenous di autou tō theō — those who approach God through Him). The condition is continuous: ''those who are coming'' (present participle — ongoing approach). ''He ever liveth to make intercession'' (pantote zōn eis to entynchanein — always living for the purpose of interceding). Christ''s present heavenly ministry is intercession — He perpetually represents His people before the Father. His intercession is not anxious pleading but the authoritative presentation of His completed sacrifice.',
   'This verse is one of the greatest statements of salvation security in the NT. Christ''s ability to save ''to the uttermost'' is grounded in His eternal life and perpetual intercession. As long as He lives (forever), He intercedes. As long as He intercedes, His people are saved. His intercession is the application of His finished atonement — He does not re-sacrifice but continuously presents His accomplished work before the Father.'),
  (26, 'For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens;',
   'τοιοῦτος γὰρ ἡμῖν ἔπρεπεν ἀρχιερεύς ὅσιος ἄκακος ἀμίαντος κεχωρισμένος ἀπὸ τῶν ἁμαρτωλῶν καὶ ὑψηλότερος τῶν οὐρανῶν γενόμενος',
   'toioutos gar hēmin eprepen archiereus hosios akakos amiantos kechōrismenos apo tōn hamartōlōn kai hypsēloteros tōn ouranōn genomenos',
   '''Became us'' (hēmin eprepen — was fitting for us, was exactly appropriate for our need). Five magnificent qualities of our High Priest: (1) ''holy'' (hosios — devout, pious, consecrated to God; not hagios [set apart] but hosios [inherently devout in character]); (2) ''harmless'' (akakos — without evil, guileless, innocent; from a- + kakos); (3) ''undefiled'' (amiantos — unstained, uncontaminated by sin); (4) ''separate from sinners'' (kechōrismenos apo tōn hamartōlōn — having been separated from sinners; not that He avoided their company on earth, but that He is now exalted above all sinful humanity); (5) ''made higher than the heavens'' (hypsēloteros tōn ouranōn — higher than the heavens; He has ascended through all created realms to the very throne of God). This is the portrait of the perfect High Priest.',
   'These five qualities address the deficiency identified in vv.1-3 of chapter 5: the Levitical high priest was ''compassed with infirmity'' and had to offer for his own sins. Christ is the opposite: inherently holy, guiltless, unstained, exalted, and sinless. He never needs to offer for Himself — His sacrifice is entirely and exclusively for others.'),
  (27, 'Who needeth not daily, as those high priests, to offer up sacrifice, first for his own sins, and then for the people''s: for this he did once, when he offered up himself.',
   'ὃς οὐκ ἔχει καθ᾽ ἡμέραν ἀνάγκην ὥσπερ οἱ ἀρχιερεῖς πρότερον ὑπὲρ τῶν ἰδίων ἁμαρτιῶν θυσίας ἀναφέρειν ἔπειτα τῶν τοῦ λαοῦ τοῦτο γὰρ ἐποίησεν ἐφάπαξ ἑαυτὸν ἀνενέγκας',
   'hos ouk echei kath hēmeran anankēn hōsper hoi archiereis proteron hyper tōn idiōn hamartiōn thysias anapherein epeita tōn tou laou touto gar epoiēsen ephapax heauton anenenkas',
   '''Needeth not daily'' (ouk echei kath hēmeran anankēn — He has no daily necessity). The Levitical high priest offered daily sacrifices and the annual Day of Atonement sacrifice. Christ has no such need. ''First for his own sins'' — a limitation Christ does not share (He has no sins). ''Then for the people''s'' — Christ offered only for others. ''This he did once'' (touto epoiēsen ephapax — this He did once for all; ephapax means once-for-all, a single unrepeatable act). ''When he offered up himself'' (heauton anenenkas — having offered Himself). The priest and the sacrifice are the same person. He did not offer an animal; He offered Himself. This is the once-for-all, self-sacrificial, all-sufficient offering that renders all other sacrifices obsolete.',
   'The ''once for all'' (ephapax) offering of Christ is the theological climax of the chapter. Every feature of the Levitical system that repeated — daily sacrifices, annual atonement, successive priests — is superseded by Christ''s single, unrepeatable, all-sufficient self-offering. Repetition implied insufficiency; the once-for-all nature of Christ''s sacrifice implies its absolute sufficiency.'),
  (28, 'For the law maketh men high priests which have infirmity; but the word of the oath, which was since the law, maketh the Son, who is consecrated for evermore.',
   'ὁ νόμος γὰρ ἀνθρώπους καθίστησιν ἀρχιερεῖς ἔχοντας ἀσθένειαν ὁ λόγος δὲ τῆς ὁρκωμοσίας τῆς μετὰ τὸν νόμον υἱὸν εἰς τὸν αἰῶνα τετελειωμένον',
   'ho nomos gar anthrōpous kathistēsin archiereis echontas astheneian ho logos de tēs horkōmosias tēs meta ton nomon hyion eis ton aiōna teteleiōmenon',
   '''The law maketh men high priests which have infirmity'' — the Mosaic law appointed weak, mortal, sinful human beings. ''The word of the oath, which was since the law'' (ho logos tēs horkōmosias tēs meta ton nomon — the word of the oath-taking that came after the law). Psalm 110 was written after the law of Moses — the later replaces the earlier. ''Maketh the Son'' (hyion — not mere ''men'' but the Son). ''Consecrated for evermore'' (eis ton aiōna teteleiōmenon — perfected/completed unto the age; perfect participle: permanently perfected). The chapter ends with the ultimate contrast: the law → men → weakness vs. the oath → the Son → eternal perfection.',
   'This verse is the capstone summary of Hebrews 7. Every deficiency of the Levitical system is answered by Christ: mortal men replaced by the eternal Son; weakness replaced by perfection; temporary appointment replaced by an irrevocable divine oath; daily repetition replaced by a once-for-all sacrifice. The argument is complete: the Melchizedek priesthood of Christ is in every way superior to the Levitical order.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 7;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀγενεαλόγητος', 'agenealogētos', 'G35', 'Without genealogy, without recorded descent — from a (not) + genealogeō (to trace descent). A NT hapax (only in v.3). Applied to Melchizedek because Genesis records no parents, no birth, no death for him. In the Levitical system, priestly credentials depended entirely on genealogy (Ezra 2:62). Melchizedek''s lack of recorded genealogy proved that a legitimate priesthood could exist outside the Levitical line — preparing the way for Christ''s non-Levitical priesthood.', 1),
  ('ἀκατάλυτος', 'akatalytos', 'G179', 'Indestructible, indissoluble, unable to be broken down — from a (not) + katalyō (to destroy, to dissolve). A NT hapax (only in v.16). Christ''s priestly appointment is not based on physical descent (which ends in death) but on the power of an indestructible life. His resurrection life cannot be dissolved, terminated, or destroyed. This is the fundamental qualification of His priesthood: He lives forever, and therefore His ministry never ends.', 2),
  ('ἀπαράβατος', 'aparabatos', 'G531', 'Unchangeable, permanent, non-transferable, inviolable — from a (not) + parabainō (to pass beside, to transgress). A NT hapax (only in v.24). Christ''s priesthood is aparabatos — it cannot be transferred to a successor because He never vacates the office. Unlike the Levitical priesthood which passed from father to son because of death, Christ''s priesthood is His exclusively and eternally. There will never be another priest after His order; He is the first, last, and only one.', 3),
  ('ἐντυγχάνω', 'entynchanō', 'G1793', 'To intercede, to make petition, to plead on behalf of — from en (in) + tynchanō (to meet, to obtain). In v.25 Christ ''ever liveth to make intercession'' (entynchanein) for those who approach God through Him. His intercession is His ongoing heavenly ministry: the perpetual presentation of His completed sacrifice before the Father, the continuous advocacy for His people. This is not anxious pleading but authoritative representation based on accomplished atonement (cf. Rom 8:34; 1 John 2:1).', 4),
  ('ἐφάπαξ', 'ephapax', 'G2178', 'Once for all, once and never again, a single unrepeatable act — from epi (upon, adding emphasis) + hapax (once). In v.27 Christ offered Himself ''once for all'' (ephapax). This is the most significant word in Hebrews'' sacrificial theology: Christ''s sacrifice was a unique, unrepeatable, all-sufficient event. It cannot be repeated because it was complete; it need not be repeated because it was effective. Ephapax stands against every system that requires repeated sacrifice or re-offering of Christ.', 5),
  ('ἔγγυος', 'engyos', 'G1450', 'Surety, guarantor, one who pledges himself to ensure fulfillment of an agreement — a NT hapax (only in v.22). Jesus is the personal guarantor of the new covenant. A surety stakes his own person and resources on the covenant''s fulfillment. If the covenant fails, the guarantor bears the penalty. Since Christ, the eternal Son with an indestructible life, is the surety, the new covenant is absolutely and permanently guaranteed.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 7
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 16
    WHEN 3 THEN 24
    WHEN 4 THEN 25
    WHEN 5 THEN 27
    WHEN 6 THEN 22
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Genesis 14:18-20', 1),
  (1, 'Psalm 110:4', 2),
  (2, 'Isaiah 9:6-7', 3),
  (2, 'Psalm 85:10', 4),
  (3, 'Hebrews 1:2-3', 5),
  (3, 'John 1:1-2', 6),
  (7, 'Genesis 14:19', 7),
  (9, 'Acts 17:26', 8),
  (11, 'Hebrews 8:7', 9),
  (11, 'Psalm 110:4', 10),
  (12, 'Galatians 3:19-25', 11),
  (12, 'Romans 7:6', 12),
  (14, 'Matthew 1:2-3', 13),
  (14, 'Revelation 5:5', 14),
  (14, 'Isaiah 11:1', 15),
  (16, '2 Timothy 1:10', 16),
  (16, 'Romans 6:9', 17),
  (17, 'Psalm 110:4', 18),
  (18, 'Romans 8:3', 19),
  (18, 'Galatians 3:21', 20),
  (19, 'Hebrews 10:1', 21),
  (19, 'Ephesians 2:18', 22),
  (21, 'Psalm 110:4', 23),
  (21, 'Numbers 23:19', 24),
  (22, 'Hebrews 8:6', 25),
  (22, 'Hebrews 9:15', 26),
  (25, 'Romans 8:34', 27),
  (25, '1 John 2:1', 28),
  (25, 'Isaiah 53:12', 29),
  (26, 'Hebrews 4:15', 30),
  (26, '2 Corinthians 5:21', 31),
  (26, 'Ephesians 4:10', 32),
  (27, 'Hebrews 9:12', 33),
  (27, 'Hebrews 10:10', 34),
  (27, 'Leviticus 16:6', 35),
  (28, 'Hebrews 5:9', 36),
  (28, 'Hebrews 2:10', 37)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 7
  AND v.verse_number = cr.verse_number;
