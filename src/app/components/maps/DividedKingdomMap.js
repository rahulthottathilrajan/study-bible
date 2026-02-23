"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  north: "#E8625C", south: "#1B7A6E", capital: "#D4A853",
  prophet: "#8B5CF6", battle: "#C06C3E",
};

const locs = [
  { id:"samaria",    x:42, y:34, label:"Samaria",      type:"capital",  side:"left"  },
  { id:"jerusalem",  x:44, y:56, label:"Jerusalem",    type:"capital",  side:"right" },
  { id:"dan",        x:46, y:10, label:"Dan",          type:"north",    side:"right" },
  { id:"bethel",     x:44, y:44, label:"Bethel",       type:"north",    side:"left"  },
  { id:"jezreel",    x:44, y:26, label:"Jezreel",      type:"north",    side:"left"  },
  { id:"carmel",     x:36, y:24, label:"Mt. Carmel",   type:"prophet",  side:"left"  },
  { id:"ramoth",     x:58, y:30, label:"Ramoth-Gilead",type:"battle",   side:"right" },
  { id:"beersheba",  x:38, y:70, label:"Beersheba",    type:"south",    side:"left"  },
  { id:"jericho",    x:52, y:50, label:"Jericho",      type:"south",    side:"right" },
  { id:"lachish",    x:36, y:60, label:"Lachish",      type:"south",    side:"left"  },
];

export const DIVIDED_DETAILS = {
  samaria:   { title:"Samaria — Capital of Israel (North)",   body:"Omri built Samaria as the new capital of the northern kingdom — buying the hill from Shemer for two talents of silver. His son Ahab built an ivory palace here and married Jezebel. Samaria fell to Assyria in 722 BC after a 3-year siege, and the northern tribes were exiled.", scripture:"1 Kings 16:24 — 'And he bought the hill Samaria of Shemer for two talents of silver, and built on the hill, and called the name of the city which he built, after the name of Shemer, owner of the hill, Samaria.'" },
  jerusalem: { title:"Jerusalem — Capital of Judah (South)", body:"Jerusalem remained the capital of the southern kingdom of Judah throughout the divided period. Some kings were faithful — Asa, Jehoshaphat, Hezekiah, Josiah — and others led the nation into idolatry. Jerusalem finally fell to Babylon in 586 BC.", scripture:"1 Kings 12:21 — 'And when Rehoboam was come to Jerusalem, he assembled all the house of Judah, with the tribe of Benjamin.'" },
  dan:       { title:"Dan — The Northern Idol",              body:"Jeroboam set up one of his two golden calves at Dan — the northernmost city of Israel — saying 'Behold thy gods, O Israel, which brought thee up out of the land of Egypt.' This idolatry became the defining sin of the northern kingdom, referenced repeatedly as 'the sin of Jeroboam.'", scripture:"1 Kings 12:29 — 'And he set the one in Bethel, and the other put he in Dan.'" },
  bethel:    { title:"Bethel — The Southern Idol",           body:"Jeroboam placed his second golden calf at Bethel — the site of Jacob's dream and Abraham's altar. This was a deliberate perversion of sacred history. A man of God came from Judah and prophesied against the Bethel altar — a prophecy fulfilled 300 years later by King Josiah.", scripture:"1 Kings 13:2 — 'And he cried against the altar in the word of the LORD, and said, O altar, altar, thus saith the LORD.'" },
  jezreel:   { title:"Jezreel — Ahab and Naboth's Vineyard", body:"King Ahab coveted Naboth's vineyard in Jezreel. Jezebel arranged Naboth's murder on false charges. Elijah confronted Ahab: 'In the place where dogs licked Naboth's blood shall dogs lick thy blood.' The prophecy was fulfilled exactly — dogs licked Ahab's blood from his chariot in the pool of Samaria.", scripture:"1 Kings 21:19 — 'Thus saith the LORD, Hast thou killed, and also taken possession? In the place where dogs licked the blood of Naboth shall dogs lick thy blood, even thine.'" },
  carmel:    { title:"Mount Carmel — Elijah vs the Prophets of Baal", body:"The greatest confrontation of the divided kingdom era. Elijah challenged 450 prophets of Baal on Mount Carmel. After Baal's prophets cried all day in vain, Elijah repaired the altar, drenched it with water, and prayed. Fire fell from heaven and consumed the sacrifice, the altar, and even the water in the trench. The prophets of Baal were slain.", scripture:"1 Kings 18:38-39 — 'Then the fire of the LORD fell, and consumed the burnt sacrifice... And when all the people saw it, they fell on their faces: and they said, The LORD, he is the God.'" },
  ramoth:    { title:"Ramoth-Gilead — Ahab's Last Battle",   body:"Ahab disguised himself to fight at Ramoth-Gilead despite Micaiah's prophecy of his death. 'A certain man drew a bow at a venture' — an arrow struck Ahab between the joints of his armour. He propped himself in his chariot until evening and died. Dogs licked his blood as Elijah had prophesied.", scripture:"1 Kings 22:34 — 'And a certain man drew a bow at a venture, and smote the king of Israel between the joints of the harness.'" },
  beersheba: { title:"Beersheba — The Southern Boundary",    body:"Beersheba marked the southern limit of Judah — 'from Dan to Beersheba' was the expression for the full extent of the land. Elijah fled here after his victory on Carmel, overwhelmed and suicidal under the juniper tree. An angel touched him and said: 'Arise and eat; because the journey is too great for thee.'", scripture:"1 Kings 19:4 — 'But he himself went a day's journey into the wilderness, and came and sat down under a juniper tree: and he requested for himself that he might die.'" },
  jericho:   { title:"Jericho — School of the Prophets",    body:"A community of prophets — 'sons of the prophets' — lived at Jericho during the days of Elijah and Elisha. Fifty of them watched from afar as Elijah was taken up in a whirlwind. Elisha then parted the Jordan with Elijah's mantle and healed Jericho's bitter springs.", scripture:"2 Kings 2:5 — 'And the sons of the prophets that were at Jericho came to Elisha, and said unto him, Knowest thou that the LORD will take away thy master from thy head to day?'" },
  lachish:   { title:"Lachish — Judah's Second City",       body:"Lachish was the most important fortified city in Judah after Jerusalem. When Sennacherib invaded in 701 BC, he besieged Lachish while sending his Rabshakeh to Jerusalem. The Lachish siege is depicted in famous Assyrian reliefs now in the British Museum. Hezekiah paid tribute of 300 talents of silver and 30 talents of gold.", scripture:"2 Kings 18:14 — 'And Hezekiah king of Judah sent to the king of Assyria to Lachish, saying, I have offended; return from me: that which thou puttest on me will I bear.'" },
};

export default function DividedKingdomMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#E8625C" label="Israel (North)" />
      <LegendDot color="#1B7A6E" label="Judah (South)" />
      <LegendDot color="#D4A853" label="Capital" />
      <LegendDot color="#8B5CF6" label="Prophet" />
      <LegendDot color="#C06C3E" label="Battle" />
    </>}>
      <svg viewBox="0 0 85 100" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-div" />
        <ParchBg w={85} h={100} vigId="vig-div" />

        {/* Mediterranean */}
        <polygon points="0,0 20,0 22,12 18,36 14,58 10,72 0,72 0,0" fill="url(#sea-div)" opacity="0.80" />
        <text x="2" y="48" fill={P.inkFaint} fontSize="2.5" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.55" transform="rotate(-90,2,48)">MEDITERRANEAN SEA</text>

        {/* Northern Kingdom - Israel - RED tint */}
        <polygon points="18,10 62,8 64,18 60,32 54,36 48,40 40,42 32,38 22,36 18,24"
          fill="#E8625C" opacity="0.14" stroke="#E8625C" strokeWidth="1.2" strokeOpacity="0.5" strokeDasharray="3,1.5" />
        <HaloText x={36} y={26} text="ISRAEL" fontSize={5} bold opacity={0.18} color="#E8625C" />

        {/* Southern Kingdom - Judah - GREEN tint */}
        <polygon points="22,42 48,40 52,44 50,58 48,68 42,74 32,72 22,64 20,52"
          fill="#1B7A6E" opacity="0.14" stroke="#1B7A6E" strokeWidth="1.2" strokeOpacity="0.5" strokeDasharray="3,1.5" />
        <HaloText x={34} y={58} text="JUDAH" fontSize={4.5} bold opacity={0.2} color="#1B7A6E" />

        {/* Border line between kingdoms */}
        <line x1="20" y1="42" x2="62" y2="40" stroke="#8B5CF6" strokeWidth="1" strokeDasharray="2,2" opacity="0.5" />

        {/* Aram / Syria - north */}
        <polygon points="46,4 76,2 80,14 74,24 60,28 50,24 46,14" fill={P.land} opacity="0.55" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={64} y={16} text="ARAM (SYRIA)" fontSize={2.8} bold opacity={0.45} color={P.inkFaint} />

        {/* Moab - east */}
        <polygon points="54,48 70,44 74,58 68,66 54,66 52,56" fill={P.land} opacity="0.50" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={62} y={58} text="MOAB" fontSize={2.5} bold opacity={0.4} color={P.inkFaint} />

        {/* Edom - south */}
        <polygon points="34,74 52,70 56,80 50,90 36,90 30,82" fill={P.desert} opacity="0.55" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={44} y={82} text="EDOM" fontSize={2.5} bold opacity={0.4} color={P.inkFaint} />

        {/* Philistia coast */}
        <polygon points="14,52 24,50 26,62 20,70 12,66" fill={P.land} opacity="0.55" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={16} y={62} text="PHILISTIA" fontSize={2.2} bold opacity={0.4} color={P.inkFaint} />

        {/* Jordan River */}
        <path d="M52,8 C52,18 52,28 52,40 C52,52 50,64 48,80"
          fill="none" stroke="#7AAEC8" strokeWidth="2.2" opacity="0.68" strokeLinecap="round" />
        <HaloText x={54} y={36} text="Jordan" fontSize={2.2} opacity={0.6} anchor="start" color={P.inkFaint} />

        {/* Sea of Galilee */}
        <ellipse cx="52" cy="18" rx="3.5" ry="5" fill="#7EB8D4" opacity="0.80" />
        <HaloText x={57} y={18} text="Galilee" fontSize={2.2} opacity={0.6} anchor="start" color={P.inkFaint} />

        {/* Dead Sea */}
        <ellipse cx="52" cy="58" rx="3" ry="7" fill="#7EB8D4" opacity="0.75" />
        <HaloText x={57} y={58} text="Dead Sea" fontSize={2.2} opacity={0.6} anchor="start" color={P.inkFaint} />

        {/* Vignette */}
        <rect x="0" y="0" width="85" height="100" fill="url(#vig-div)" pointerEvents="none" />

        {locs.map(loc => (
          <Dot key={loc.id} cx={loc.x} cy={loc.y} r={3}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label} side={loc.side}
          />
        ))}

        <Compass x={77} y={6} />
      </svg>
    </MapCard>
  );
}