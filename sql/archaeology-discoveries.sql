-- ============================================================
-- archaeology-discoveries.sql
-- The Bible Scrollers — Archaeological Evidence
--
-- Reference / archive only. Runtime data is served from
-- src/app/components/ArchaeologyData.js (static import).
-- This SQL exists for documentation and potential future
-- Supabase use (e.g. user favourites on discoveries).
-- ============================================================

-- ── Table ────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS archaeology_discoveries (
  id               TEXT PRIMARY KEY,
  name             TEXT NOT NULL,
  category         TEXT NOT NULL CHECK (category IN ('Manuscript','Inscription','Structure','Artifact','Seal/Bulla')),
  verified_status  TEXT NOT NULL CHECK (verified_status IN ('Confirmed','Probable','Debated')),
  description      TEXT NOT NULL,
  biblical_connection TEXT NOT NULL,
  scripture_text   TEXT,
  scripture_ref    TEXT,
  location         TEXT,
  discovered_year  TEXT,
  discovered_by    TEXT,
  current_location TEXT,
  icon             TEXT DEFAULT '🏛️',
  sort_order       INT DEFAULT 0
);

-- ── RLS (public read-only) ───────────────────────────────────
ALTER TABLE archaeology_discoveries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read access"
  ON archaeology_discoveries FOR SELECT
  USING (true);

-- No INSERT/UPDATE/DELETE policies — table is read-only.

-- ── Seed data (20 verified discoveries) ──────────────────────

INSERT INTO archaeology_discoveries (id, name, category, verified_status, description, biblical_connection, scripture_text, scripture_ref, location, discovered_year, discovered_by, current_location, icon, sort_order) VALUES

('dead-sea-scrolls', 'Dead Sea Scrolls', 'Manuscript', 'Confirmed',
 'A collection of nearly 900 manuscripts discovered in eleven caves near the northwestern shore of the Dead Sea between 1947 and 1956. The scrolls include the oldest known copies of every book of the Hebrew Bible except Esther, with the Great Isaiah Scroll preserving the complete text of Isaiah. Carbon-14 dating and palaeographic analysis place the manuscripts between the third century BC and the first century AD.',
 'The Great Isaiah Scroll, dated to approximately 125 BC, contains all 66 chapters of Isaiah and is substantially identical to the Masoretic text used for modern translations.',
 'The grass withereth, the flower fadeth: but the word of our God shall stand for ever.', 'Isaiah 40:8',
 'Qumran, Israel', '1947', 'Bedouin shepherds (Muhammad edh-Dhib)', 'Shrine of the Book, Israel Museum, Jerusalem', '📜', 1),

('codex-sinaiticus', 'Codex Sinaiticus', 'Manuscript', 'Confirmed',
 'One of the oldest and most complete manuscripts of the Greek Bible, written on vellum in the fourth century AD. Palaeographic and textual analysis dates it to approximately AD 330–360.',
 'As one of the two oldest substantially complete New Testament manuscripts, it provides direct evidence that the New Testament books were collected and circulated as a unified corpus within three centuries of composition.',
 'For ever, O LORD, thy word is settled in heaven.', 'Psalms 119:89',
 'Saint Catherine''s Monastery, Sinai, Egypt', '1844', 'Constantin von Tischendorf', 'British Library, London', '📖', 2),

('chester-beatty-papyri', 'Chester Beatty Papyri', 'Manuscript', 'Confirmed',
 'A group of eleven ancient papyrus codices containing portions of the Old and New Testaments in Greek, with dates ranging from the second to the fourth century AD.',
 'These papyri demonstrate that Paul''s letters and the four Gospels were already being copied and bound together as collections within a century of their composition.',
 'All scripture is given by inspiration of God, and is profitable for doctrine, for reproof, for correction, for instruction in righteousness.', '2 Timothy 3:16',
 'Egypt (exact provenance unknown)', '1930', 'Acquired by Alfred Chester Beatty', 'Chester Beatty Library, Dublin', '📃', 3),

('ketef-hinnom-scrolls', 'Ketef Hinnom Silver Scrolls', 'Manuscript', 'Confirmed',
 'Two tiny silver scrolls discovered in a burial cave at Ketef Hinnom, Jerusalem. Dated to the late seventh or early sixth century BC, they are the oldest known surviving texts from the Hebrew Bible.',
 'The scrolls contain the Aaronic blessing from Numbers 6:24–26, demonstrating this passage was in active liturgical use during the First Temple period.',
 'The LORD bless thee, and keep thee: The LORD make his face shine upon thee, and be gracious unto thee.', 'Numbers 6:24-25',
 'Ketef Hinnom, Jerusalem, Israel', '1979', 'Gabriel Barkay', 'Israel Museum, Jerusalem', '🪧', 4),

('tel-dan-stele', 'Tel Dan Stele', 'Inscription', 'Confirmed',
 'A broken basalt stele containing the first reference to David''s royal dynasty found outside the Bible, dated to the ninth century BC.',
 'The phrase "house of David" confirms the existence of a Davidic dynasty ruling in Judah during the ninth century BC.',
 'And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever.', '2 Samuel 7:16',
 'Tel Dan, Israel', '1993', 'Avraham Biran', 'Israel Museum, Jerusalem', '🪨', 5),

('mesha-stele', 'Mesha Stele (Moabite Stone)', 'Inscription', 'Confirmed',
 'A large basalt slab bearing an inscription by Mesha, king of Moab, commemorating his revolt against Israel in the ninth century BC.',
 'The stele confirms the biblical account of Moab''s subjugation to Israel and its subsequent rebellion, as described in 2 Kings 3:4–5.',
 'And Mesha king of Moab was a sheepmaster, and rendered unto the king of Israel an hundred thousand lambs, and an hundred thousand rams, with the wool.', '2 Kings 3:4',
 'Dhiban, Jordan', '1868', 'Frederick Augustus Klein', 'Louvre Museum, Paris', '🗿', 6),

('pilate-stone', 'Pilate Stone', 'Inscription', 'Confirmed',
 'A limestone block bearing a Latin dedicatory inscription that mentions Pontius Pilate by name and title as Prefect of Judaea.',
 'The inscription confirms Pilate''s historicity and his role as Roman prefect, corroborating the Gospel accounts of Jesus'' trial.',
 'And so Pilate, willing to content the people, released Barabbas unto them, and delivered Jesus, when he had scourged him, to be crucified.', 'Mark 15:15',
 'Caesarea Maritima, Israel', '1961', 'Antonio Frova', 'Israel Museum, Jerusalem', '🏛️', 7),

('cyrus-cylinder', 'Cyrus Cylinder', 'Inscription', 'Confirmed',
 'A barrel-shaped clay cylinder recording the conquest of Babylon by Cyrus the Great in 539 BC and his policy of allowing displaced peoples to return to their homelands.',
 'The cylinder corroborates the biblical account of Cyrus'' edict ending the Babylonian captivity, fulfilling Jeremiah''s prophecy.',
 'Thus saith Cyrus king of Persia, The LORD God of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Judah.', 'Ezra 1:2',
 'Babylon (modern Hillah), Iraq', '1879', 'Hormuzd Rassam', 'British Museum, London', '🏺', 8),

('siloam-inscription', 'Siloam Inscription', 'Inscription', 'Confirmed',
 'A Hebrew inscription carved into the rock wall of Hezekiah''s Tunnel, describing the moment two teams of diggers met in the middle. One of the oldest known examples of Hebrew prose writing.',
 'The inscription confirms the construction of the water tunnel described in 2 Kings 20:20, built by King Hezekiah to secure Jerusalem''s water supply.',
 'And the rest of the acts of Hezekiah, and all his might, and how he made a pool, and a conduit, and brought water into the city, are they not written in the book of the chronicles of the kings of Judah?', '2 Kings 20:20',
 'Jerusalem, Israel', '1880', 'Jacob Eliahu (a student)', 'Istanbul Archaeology Museums, Turkey', '✒️', 9),

('pool-of-siloam', 'Pool of Siloam', 'Structure', 'Confirmed',
 'The remains of a large, stone-lined pool from the Second Temple period, uncovered during sewer repair work in Jerusalem. Coin evidence dates construction to the Hasmonean or early Herodian period.',
 'The Gospel of John recounts Jesus sending a blind man to wash in the Pool of Siloam, after which the man received his sight. The discovery confirmed the historical accuracy of the narrative.',
 'Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.', 'John 9:7',
 'City of David, Jerusalem, Israel', '2004', 'Ronny Reich and Eli Shukron', 'Archaeological site (in situ), Jerusalem', '💧', 10),

('hezekiahs-tunnel', 'Hezekiah''s Tunnel', 'Structure', 'Confirmed',
 'An underground water channel running 533 metres through bedrock beneath the City of David, connecting the Gihon Spring to the Pool of Siloam. Dated to the late eighth century BC.',
 'Second Chronicles records Hezekiah stopping the upper watercourse of Gihon and bringing it to the west side of the city, precisely matching this tunnel.',
 'This same Hezekiah also stopped the upper watercourse of Gihon, and brought it straight down to the west side of the city of David.', '2 Chronicles 32:30',
 'City of David, Jerusalem, Israel', '1838', 'Edward Robinson', 'Archaeological site (in situ), Jerusalem', '⛏️', 11),

('walls-of-jericho', 'Walls of Jericho', 'Structure', 'Debated',
 'Excavations at Tell es-Sultan revealed massive collapsed mud-brick walls and evidence of violent destruction. Dating remains actively debated among archaeologists.',
 'The book of Joshua describes the walls of Jericho falling flat. Archaeological evidence of collapsed walls matches the account, though dating is disputed.',
 'So the people shouted when the priests blew with the trumpets: and it came to pass, when the people heard the sound of the trumpet, and the people shouted with a great shout, that the wall fell down flat.', 'Joshua 6:20',
 'Tell es-Sultan, Palestine', '1930–1936', 'John Garstang (initial); Kathleen Kenyon (1952–1958)', 'Archaeological site (in situ)', '🧱', 12),

('house-of-peter', 'House of Peter at Capernaum', 'Structure', 'Probable',
 'A first-century dwelling uncovered beneath a fifth-century octagonal church at Capernaum. Over a hundred Christian graffiti inscriptions were found, some invoking Peter by name.',
 'The Gospels describe Jesus healing Peter''s mother-in-law in his house at Capernaum. Early Christian veneration at this specific location supports the traditional identification.',
 'And when Jesus was come into Peter''s house, he saw his wife''s mother laid, and sick of a fever. And he touched her hand, and the fever left her.', 'Matthew 8:14-15',
 'Capernaum, Israel', '1968', 'Virgilio Corbo and Stanislao Loffreda', 'Archaeological site (in situ), beneath modern memorial church', '🏠', 13),

('pool-of-bethesda', 'Pool of Bethesda', 'Structure', 'Confirmed',
 'A large double-basin pool complex discovered near the Church of Saint Anne in Jerusalem. Excavations revealed five porches matching the Gospel description.',
 'The Gospel of John describes a pool called Bethesda having five porches. The discovery confirmed a detail once considered legendary by some scholars.',
 'Now there is at Jerusalem by the sheep market a pool, which is called in the Hebrew tongue Bethesda, having five porches.', 'John 5:2',
 'Old City, Jerusalem, Israel', '1888', 'Conrad Schick (initial excavation)', 'Archaeological site (in situ), near Church of Saint Anne', '⛲', 14),

('seal-of-hezekiah', 'Seal of King Hezekiah', 'Seal/Bulla', 'Confirmed',
 'A clay bulla bearing the inscription "Belonging to Hezekiah, [son of] Ahaz, King of Judah." The first seal impression of an Israelite king found in a controlled scientific excavation.',
 'The seal directly confirms the historical existence and royal status of one of the most prominent kings in the Old Testament.',
 'He trusted in the LORD God of Israel; so that after him was none like him among all the kings of Judah, nor any that were before him.', '2 Kings 18:5',
 'Ophel, Jerusalem, Israel', '2015', 'Eilat Mazar', 'Hebrew University, Jerusalem', '🔱', 15),

('bulla-of-baruch', 'Bulla of Baruch ben Neriah', 'Seal/Bulla', 'Confirmed',
 'A small clay seal impression inscribed "Belonging to Berekhyahu son of Neriyahu the scribe." Matches the biblical Baruch, personal scribe of Jeremiah.',
 'The seal impression places a named biblical figure into the physical record of ancient Judah.',
 'Then Jeremiah called Baruch the son of Neriah: and Baruch wrote from the mouth of Jeremiah all the words of the LORD.', 'Jeremiah 36:4',
 'Provenance unknown (antiquities market), Israel', '1975', 'Published by Nahman Avigad', 'Israel Museum, Jerusalem', '📦', 16),

('seal-of-isaiah', 'Seal of Isaiah (Proposed)', 'Seal/Bulla', 'Debated',
 'A clay bulla found three metres from the Hezekiah seal. The upper portion reads "Belonging to Isaiah" but the lower portion is damaged, and the reading "prophet" is disputed.',
 'If correct, this bulla belonged to Isaiah the prophet. Its proximity to Hezekiah''s seal mirrors the close relationship described in 2 Kings 19–20.',
 'Then Isaiah the son of Amoz sent to Hezekiah, saying, Thus saith the LORD God of Israel, That which thou hast prayed to me against Sennacherib king of Assyria I have heard.', '2 Kings 19:20',
 'Ophel, Jerusalem, Israel', '2018', 'Eilat Mazar', 'Hebrew University, Jerusalem', '🔍', 17),

('james-ossuary', 'James Ossuary', 'Artifact', 'Debated',
 'A first-century limestone bone box bearing the Aramaic inscription "James, son of Joseph, brother of Jesus." Subject of a high-profile forgery trial; owner acquitted but authenticity unresolved.',
 'If authentic, the inscription would be the earliest physical artefact naming Jesus of Nazareth.',
 'Is not this the carpenter''s son? is not his mother called Mary? and his brethren, James, and Joses, and Simon, and Judas?', 'Matthew 13:55',
 'Provenance unknown (antiquities market), Israel', '2002', 'Published by André Lemaire; owned by Oded Golan', 'Private collection, Israel', '⚖️', 18),

('pilate-ring', 'Pontius Pilate Ring', 'Artifact', 'Probable',
 'A bronze ring from Herodium, deciphered in 2018 to reveal the Greek inscription "of Pilatus." Provides a second physical inscription bearing Pilate''s name.',
 'The ring adds to physical evidence for Pilate''s administration in Judaea, corroborating the Gospel accounts.',
 'Then said Pilate unto them, Take ye him, and crucify him: for I find no fault in him.', 'John 19:6',
 'Herodium, Israel', '1968 (deciphered 2018)', 'Gideon Foerster (excavation); Shua Amorai-Stark (decipherment)', 'Hebrew University, Jerusalem', '💍', 19),

('nabonidus-cylinder', 'Nabonidus Cylinder', 'Artifact', 'Confirmed',
 'A clay cylinder by Nabonidus, last king of Neo-Babylon, naming his son Belshazzar as holder of royal authority. Confirmed a figure known only from the book of Daniel.',
 'The cylinder explains why Belshazzar could only offer Daniel the position of "third ruler" — Nabonidus was first and Belshazzar second.',
 'Then commanded Belshazzar, and they clothed Daniel with scarlet, and put a chain of gold about his neck, and made a proclamation concerning him, that he should be the third ruler in the kingdom.', 'Daniel 5:29',
 'Ur (modern Tell el-Muqayyar), Iraq', '1854', 'J. G. Taylor', 'British Museum, London', '🏺', 20);
