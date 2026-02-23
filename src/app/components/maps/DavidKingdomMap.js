"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  capital: "#D4A853", city: "#C06C3E", temple: "#E8625C",
  border: "#2E4A33", conquest: "#8B5CF6",
};

const locs = [
  { id:"jerusalem", x:44, y:52, label:"Jerusalem",     type:"capital",  side:"right" },
  { id:"hebron",    x:42, y:60, label:"Hebron",        type:"capital",  side:"left"  },
  { id:"bethlehem", x:43, y:56, label:"Bethlehem",     type:"city",     side:"left"  },
  { id:"temple",    x:45, y:50, label:"Temple Mount",  type:"temple",   side:"right" },
  { id:"megiddo",   x:40, y:30, label:"Megiddo",       type:"city",     side:"left"  },
  { id:"hazor",     x:46, y:20, label:"Hazor",         type:"city",     side:"right" },
  { id:"gezer",     x:36, y:48, label:"Gezer",         type:"conquest", side:"left"  },
  { id:"tadmor",    x:72, y:24, label:"Tadmor",        type:"city",     side:"right" },
  { id:"ezion",     x:48, y:86, label:"Ezion-Geber",   type:"city",     side:"right" },
  { id:"damascus",  x:56, y:18, label:"Damascus",      type:"conquest", side:"right" },
];

export const DAVID_DETAILS = {
  jerusalem: { title:"Jerusalem — The City of David",      body:"David captured the Jebusite stronghold and made it his capital — calling it the City of David. He brought the ark of the covenant to Jerusalem with dancing and celebration. Jerusalem became the spiritual and political heart of the united kingdom.", scripture:"2 Samuel 5:7 — 'Nevertheless David took the strong hold of Zion: the same is the city of David.'" },
  hebron:    { title:"Hebron — David's First Capital",     body:"David reigned from Hebron for 7 years over the tribe of Judah before capturing Jerusalem. Abraham, Isaac, Jacob, and their wives were buried here. Hebron was also where Absalom launched his rebellion against his father David.", scripture:"2 Samuel 2:11 — 'And the time that David was king in Hebron over the house of Judah was seven years and six months.'" },
  bethlehem: { title:"Bethlehem — City of David's Birth",  body:"David was born in Bethlehem — the youngest son of Jesse, a shepherd boy called in from the fields to be anointed king. The prophet Samuel came to Bethlehem not knowing which son God had chosen. 'Man looketh on the outward appearance, but the LORD looketh on the heart.'", scripture:"1 Samuel 16:13 — 'Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of the LORD came upon David from that day forward.'" },
  temple:    { title:"The Temple of Solomon",              body:"David desired to build a temple for God but was told his son would build it. Solomon built the magnificent first Temple — seven years in construction, with cedar from Lebanon and gold throughout. At its dedication, the glory of God filled the temple in a cloud so thick the priests could not stand to minister.", scripture:"1 Kings 8:11 — 'So that the priests could not stand to minister because of the cloud: for the glory of the LORD had filled the house of the LORD.'" },
  megiddo:   { title:"Megiddo — Solomon's Chariot City",   body:"Solomon built up Megiddo as one of his three great chariot cities. The plains of Megiddo controlled the most important military and trade route in Canaan. Megiddo gives its name to Armageddon — the site of history's final battle in Revelation.", scripture:"1 Kings 9:15 — 'And this is the reason of the levy which king Solomon raised; for to build the house of the LORD, and his own house, and Millo, and the wall of Jerusalem, and Hazor, and Megiddo, and Gezer.'" },
  hazor:     { title:"Hazor — Fortified City",             body:"Solomon rebuilt and fortified Hazor — previously destroyed by Joshua — along with Megiddo and Gezer. These three cities controlled the northern trade routes and military approaches into Israel. Hazor was excavated by Yigael Yadin in the 20th century, confirming Solomon's building activity.", scripture:"1 Kings 9:15 — 'And this is the reason of the levy which king Solomon raised; for to build... Hazor, and Megiddo, and Gezer.'" },
  gezer:     { title:"Gezer — A Royal Wedding Gift",       body:"An extraordinary detail: Pharaoh of Egypt conquered Gezer, burned it, and gave it as a wedding gift to his daughter — Solomon's wife. Solomon then rebuilt it. It is one of the few times in history Egypt gave a Canaanite city to Israel.", scripture:"1 Kings 9:16-17 — 'For Pharaoh king of Egypt had gone up, and taken Gezer, and burnt it with fire... and given it for a present unto his daughter, Solomon's wife.'" },
  tadmor:    { title:"Tadmor — Solomon's Desert City",    body:"Solomon built Tadmor (later called Palmyra) in the wilderness — a remarkable desert outpost on the trade route to Mesopotamia. This extended Solomon's influence deep into the Syrian desert, controlling the caravan routes between the Mediterranean and the East.", scripture:"1 Kings 9:18 — 'And Baalath, and Tadmor in the wilderness, in the land.'" },
  ezion:     { title:"Ezion-Geber — Solomon's Navy",      body:"At Ezion-Geber on the Red Sea, Solomon built a fleet of ships with Hiram of Tyre's help. These ships sailed to Ophir and brought back 420 talents of gold. Solomon's maritime trade brought in gold, silver, ivory, apes, and peacocks from distant lands.", scripture:"1 Kings 9:26 — 'And king Solomon made a navy of ships in Eziongeber, which is beside Eloth, on the shore of the Red sea.'" },
  damascus:  { title:"Damascus — Under David's Control",  body:"David defeated the Syrians of Damascus when they came to help Hadadezer king of Zobah. David put garrisons in Syria and the Syrians became his servants. The kingdom of Israel briefly extended its influence as far as the Euphrates River.", scripture:"2 Samuel 8:6 — 'Then David put garrisons in Syria of Damascus: and the Syrians became servants to David, and brought gifts.'" },
};

export default function DavidKingdomMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#D4A853" label="Capital" />
      <LegendDot color="#E8625C" label="Temple" />
      <LegendDot color="#C06C3E" label="Royal City" />
      <LegendDot color="#8B5CF6" label="Conquest" />
    </>}>
      <svg viewBox="0 0 100 100" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-david" />
        <ParchBg w={100} h={100} vigId="vig-david" />

        {/* Mediterranean */}
        <polygon points="0,0 26,0 28,14 24,36 20,56 16,70 0,70 0,0" fill="url(#sea-david)" opacity="0.78" />
        <text x="2" y="48" fill={P.inkFaint} fontSize="2.6" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.55" transform="rotate(-90,2,48)">MEDITERRANEAN SEA</text>

        {/* Red Sea */}
        <polygon points="30,80 40,76 46,88 42,100 28,100 24,90" fill="url(#sea-david)" opacity="0.65" />
        <HaloText x={32} y={94} text="RED SEA" fontSize={2.4} bold opacity={0.55} color={P.inkFaint} />

        {/* Kingdom boundary - David/Solomon at greatest extent */}
        <polygon
          points="24,10 60,8 68,14 72,24 68,36 56,18 54,28 60,36 56,44 50,48 48,62 44,72 38,76 30,72 22,60 20,44 20,28"
          fill={P.fertile} opacity="0.55" stroke="#B8860B" strokeWidth="1.2" strokeDasharray="3,1.5" strokeOpacity="0.7"
        />
        <HaloText x={38} y={44} text="UNITED KINGDOM" fontSize={3.5} bold opacity={0.28} color="#B8860B" />

        {/* Sub-regions */}
        {/* Philistia coast */}
        <polygon points="20,52 30,50 32,58 28,66 20,64" fill={P.land} opacity="0.60" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={24} y={58} text="PHILISTIA" fontSize={2.2} bold opacity={0.45} color={P.inkFaint} />

        {/* Edom - south */}
        <polygon points="36,76 50,72 54,80 50,92 38,92 34,84" fill={P.desert} opacity="0.65" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={44} y={84} text="EDOM" fontSize={2.5} bold opacity={0.45} color={P.inkFaint} />

        {/* Moab - east */}
        <polygon points="52,56 66,52 70,62 66,72 52,72 50,62" fill={P.land} opacity="0.55" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={58} y={64} text="MOAB" fontSize={2.5} bold opacity={0.4} color={P.inkFaint} />

        {/* Ammon */}
        <polygon points="54,40 68,36 72,46 66,52 54,50" fill={P.land} opacity="0.50" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={62} y={46} text="AMMON" fontSize={2.5} bold opacity={0.4} color={P.inkFaint} />

        {/* Aram / Syria */}
        <polygon points="46,6 80,4 84,18 76,28 60,30 52,26 48,16" fill={P.land} opacity="0.60" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={66} y={18} text="ARAM" fontSize={3} bold opacity={0.45} color={P.inkFaint} />

        {/* Jordan River */}
        <path d="M50,12 C50,20 50,28 52,38 C52,50 52,62 50,76"
          fill="none" stroke="#7AAEC8" strokeWidth="2.2" opacity="0.68" strokeLinecap="round" />
        <HaloText x={53} y={36} text="Jordan" fontSize={2.2} opacity={0.6} anchor="start" color={P.inkFaint} />

        {/* Sea of Galilee */}
        <ellipse cx="52" cy="22" rx="3.5" ry="5" fill="#7EB8D4" opacity="0.80" />

        {/* Dead Sea */}
        <ellipse cx="52" cy="60" rx="3" ry="7" fill="#7EB8D4" opacity="0.75" />
        <HaloText x={57} y={60} text="Dead Sea" fontSize={2.2} opacity={0.6} anchor="start" color={P.inkFaint} />

        {/* Cedar of Lebanon hint */}
        <polygon points="30,6 34,0 38,6" fill={P.fertile} opacity="0.55" />
        <polygon points="34,8 38,2 42,8" fill={P.fertile} opacity="0.50" />
        <HaloText x={36} y={10} text="LEBANON" fontSize={2.5} bold opacity={0.5} color={P.inkFaint} />

        {/* Vignette */}
        <rect x="0" y="0" width="100" height="100" fill="url(#vig-david)" pointerEvents="none" />

        {locs.map(loc => (
          <Dot key={loc.id} cx={loc.x} cy={loc.y} r={3}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label} side={loc.side}
          />
        ))}

        <Compass x={92} y={6} />
      </svg>
    </MapCard>
  );
}