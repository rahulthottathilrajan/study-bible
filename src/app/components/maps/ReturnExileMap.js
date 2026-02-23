"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  origin: "#8B5CF6", destination: "#1B7A6E", leader: "#D4A853",
  rebuild: "#E8625C", route: "#C06C3E",
};

const locs = [
  { id:"babylon",    x:76, y:46, label:"Babylon",         type:"origin",      side:"right" },
  { id:"jerusalem",  x:36, y:48, label:"Jerusalem",       type:"destination", side:"left"  },
  { id:"cyrus",      x:86, y:36, label:"Susa (Persia)",   type:"leader",      side:"right" },
  { id:"temple",     x:37, y:46, label:"Temple Rebuilt",  type:"rebuild",     side:"right" },
  { id:"walls",      x:35, y:50, label:"Walls Rebuilt",   type:"rebuild",     side:"left"  },
  { id:"ezra",       x:74, y:52, label:"Nippur (Ezra)",   type:"leader",      side:"right" },
  { id:"samaria",    x:38, y:38, label:"Samaria (Opposed)", type:"route",     side:"left"  },
  { id:"euphrates",  x:58, y:30, label:"River Crossing",  type:"route",       side:"right" },
  { id:"tadmor",     x:62, y:26, label:"Desert Route",    type:"route",       side:"left"  },
  { id:"bethel",     x:36, y:44, label:"Bethel",          type:"destination", side:"left"  },
];

export const RETURN_DETAILS = {
  babylon:   { title:"Babylon — The Journey Begins",         body:"In 538 BC, Cyrus the Great of Persia issued his famous decree allowing Jewish exiles to return to Jerusalem and rebuild the Temple. This fulfilled Isaiah's prophecy — written 150 years earlier — which even named Cyrus as the king who would give the order. Around 50,000 Jews chose to return in the first wave.", scripture:"Ezra 1:2-3 — 'Thus saith Cyrus king of Persia, The LORD God of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem.'" },
  jerusalem: { title:"Jerusalem — The Return Home",          body:"The returning exiles found Jerusalem in ruins — walls broken down, gates burned, Temple a rubble heap. Yet they immediately set up the altar and began offering burnt offerings. Under Zerubbabel they laid the Temple foundation, with old men weeping at the memory of the first Temple and young men shouting for joy.", scripture:"Ezra 3:12-13 — 'Many of the priests and Levites and chief of the fathers, who were ancient men, that had seen the first house, wept with a loud voice; and many shouted aloud for joy.'" },
  cyrus:     { title:"Cyrus the Great — God's Instrument",   body:"Isaiah had prophesied by name that a king called Cyrus would authorise the Temple's rebuilding — 150 years before Cyrus was born. When Cyrus conquered Babylon in 539 BC, he found the scroll of Isaiah and read his own name in the prophecy. He issued the decree the following year.", scripture:"Isaiah 44:28 — 'That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.'" },
  temple:    { title:"The Second Temple — Rebuilt",          body:"The Temple was rebuilt under Zerubbabel and Joshua the high priest — completed in 516 BC after years of opposition and discouragement. The prophets Haggai and Zechariah encouraged the people to keep building. Though it lacked the glory of Solomon's Temple, God said: 'The latter glory of this house shall be greater than the former' — fulfilled when Jesus walked its courts.", scripture:"Haggai 2:9 — 'The glory of this latter house shall be greater than of the former, saith the LORD of hosts: and in this place will I give peace, saith the LORD of hosts.'" },
  walls:     { title:"The Walls of Jerusalem — Nehemiah",    body:"Nearly 100 years after the first return, Nehemiah — cupbearer to King Artaxerxes in Susa — received news that Jerusalem's walls were still broken. He wept, prayed, and asked the king for permission to rebuild. The walls of Jerusalem were rebuilt in 52 days — an engineering and spiritual miracle achieved against fierce opposition.", scripture:"Nehemiah 6:15-16 — 'So the wall was finished in the twenty and fifth day of the month Elul, in fifty and two days. And it came to pass, that when all our enemies heard thereof... they were much cast down in their own eyes.'" },
  ezra:      { title:"Ezra — The Great Scribe",              body:"Ezra the scribe led the second wave of returnees in 458 BC — 80 years after the first. A skilled teacher of the Law, Ezra was horrified to find Jewish men had married foreign wives in violation of the covenant. He tore his robe, pulled hair from his head and beard, and interceded for the people in great anguish.", scripture:"Ezra 7:10 — 'For Ezra had prepared his heart to seek the law of the LORD, and to do it, and to teach in Israel statutes and judgments.'" },
  samaria:   { title:"Samaria — The Opposition",             body:"The Samaritans — descendants of the foreign peoples settled in the north by Assyria — vigorously opposed the rebuilding of Jerusalem. They wrote letters to the Persian king to stop the work. They tried intimidation and slander. But God overruled their opposition and the building continued.", scripture:"Ezra 4:4-5 — 'Then the people of the land weakened the hands of the people of Judah, and troubled them in building, and hired counsellors against them, to frustrate their purpose.'" },
  euphrates:  { title:"Crossing the Euphrates",              body:"The returning exiles crossed the Euphrates — the great river that marked the boundary between Mesopotamia and the west. Ezra called a fast at the river Ahava before the crossing, ashamed to ask the king for a military escort after boasting of God's protection. They prayed — and God guarded them the whole journey.", scripture:"Ezra 8:21 — 'Then I proclaimed a fast there, at the river of Ahava, that we might afflict ourselves before our God, to seek of him a right way for us, and for our little ones, and for all our substance.'" },
  tadmor:    { title:"The Desert Route Home",                 body:"The return journey from Babylon to Jerusalem was approximately 900 miles — roughly 4 months on foot through the Syrian desert and Fertile Crescent. Ezra records: 'the hand of our God was upon us, and he delivered us from the hand of the enemy, and of such as lay in wait by the way.'", scripture:"Ezra 8:31 — 'Then we departed from the river of Ahava on the twelfth day of the first month, to go unto Jerusalem: and the hand of our God was upon us.'" },
  bethel:    { title:"Bethel — Resettled",                   body:"Among the towns resettled by returning exiles was Bethel — the ancient site of Jacob's dream and Abraham's altar. The exile had emptied the land of its Israelite inhabitants, and the return was a gradual repopulation of towns across Judah and Benjamin. Lists in Ezra and Nehemiah record the families who returned.", scripture:"Nehemiah 11:31 — 'The children also of Benjamin from Geba dwelt at Michmash, and Aija, and Bethel, and in their villages.'" },
};

export default function ReturnExileMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#8B5CF6" label="Starting Point" />
      <LegendDot color="#1B7A6E" label="Destination" />
      <LegendDot color="#D4A853" label="Key Leader" />
      <LegendDot color="#E8625C" label="Rebuilt" />
    </>}>
      <svg viewBox="0 0 110 80" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-ret" />
        <ParchBg w={110} h={80} vigId="vig-ret" />

        {/* Mediterranean */}
        <polygon points="0,0 18,0 20,14 16,36 12,52 0,52 0,0" fill="url(#sea-ret)" opacity="0.78" />
        <text x="2" y="34" fill={P.inkFaint} fontSize="2.4" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.55" transform="rotate(-90,2,34)">MEDITERRANEAN</text>

        {/* Persian Gulf */}
        <polygon points="80,62 96,58 100,72 84,76 76,68" fill="url(#sea-ret)" opacity="0.65" />
        <HaloText x={88} y={70} text="PERSIAN GULF" fontSize={2.2} bold opacity={0.5} color={P.inkFaint} />

        {/* Persian Empire shading */}
        <polygon points="28,16 100,10 106,34 100,56 80,68 54,66 32,56 22,40 24,22"
          fill="#6BAE75" opacity="0.08" stroke="#6BAE75" strokeWidth="1" strokeDasharray="3,2" strokeOpacity="0.35" />
        <HaloText x={66} y={20} text="PERSIAN EMPIRE" fontSize={4} bold opacity={0.16} color="#6BAE75" />

        {/* Judah / province of Yehud */}
        <polygon points="14,32 40,26 44,36 42,56 36,62 18,60 12,46" fill={P.fertile} opacity="0.55" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={26} y={44} text="YEHUD" fontSize={2.8} bold opacity={0.4} color={P.inkFaint} />

        {/* Syria */}
        <polygon points="30,10 64,6 68,18 60,28 44,32 32,24" fill={P.land} opacity="0.50" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={48} y={18} text="SYRIA" fontSize={2.5} bold opacity={0.35} color={P.inkFaint} />

        {/* Mesopotamia */}
        <polygon points="58,12 96,8 100,24 96,44 82,58 66,60 56,52 54,34 56,16"
          fill={P.desert} opacity="0.50" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={76} y={32} text="BABYLON" fontSize={2.8} bold opacity={0.38} color={P.inkFaint} />

        {/* Persia proper */}
        <polygon points="88,16 108,12 108,44 96,52 84,46 82,28" fill={P.land} opacity="0.52" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={96} y={30} text="PERSIA" fontSize={2.5} bold opacity={0.4} color={P.inkFaint} />

        {/* Return route - dashed gold */}
        <path d="M76,46 C70,40 64,32 58,28 C50,24 44,20 38,22 C36,28 36,36 36,46"
          fill="none" stroke="#D4A853" strokeWidth="1.8" strokeDasharray="4,2.5" opacity="0.85" />

        {/* Euphrates */}
        <path d="M58,14 C58,24 56,36 54,48 C52,58 50,66 48,76" fill="none" stroke="#7AAEC8" strokeWidth="1.6" opacity="0.60" strokeLinecap="round" />
        <HaloText x={50} y={42} text="Euphrates" fontSize={2.2} opacity={0.55} color={P.inkFaint} anchor="end" />

        {/* Tigris */}
        <path d="M72,12 C72,22 70,34 68,46 C66,56 64,64 62,74" fill="none" stroke="#7AAEC8" strokeWidth="1.4" opacity="0.55" strokeLinecap="round" />

        {/* Jordan River */}
        <path d="M36,26 C36,34 36,44 36,54 C34,62 32,68 30,74" fill="none" stroke="#7AAEC8" strokeWidth="1.2" opacity="0.55" strokeLinecap="round" />

        {/* Dead Sea */}
        <ellipse cx="35" cy="56" rx="2.2" ry="4.5" fill="#7EB8D4" opacity="0.72" />

        {/* Sea of Galilee */}
        <ellipse cx="38" cy="28" rx="2.5" ry="3.5" fill="#7EB8D4" opacity="0.70" />

        {/* Vignette */}
        <rect x="0" y="0" width="110" height="80" fill="url(#vig-ret)" pointerEvents="none" />

        {locs.map(loc => (
          <Dot key={loc.id} cx={loc.x} cy={loc.y} r={3}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label} side={loc.side}
          />
        ))}

        <Compass x={102} y={6} />
      </svg>
    </MapCard>
  );
}