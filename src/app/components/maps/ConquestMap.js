"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  entry: "#D4A853", victory: "#E8625C", city: "#C06C3E",
  miracle: "#8B5CF6", territory: "#2E4A33",
};

const locs = [
  { id:"jordan",   x:54, y:38, label:"Jordan Crossing",  type:"miracle",   side:"right" },
  { id:"jericho",  x:54, y:44, label:"Jericho",          type:"victory",   side:"right" },
  { id:"ai",       x:48, y:42, label:"Ai",               type:"victory",   side:"left"  },
  { id:"gibeon",   x:46, y:46, label:"Gibeon",           type:"city",      side:"left"  },
  { id:"hazor",    x:48, y:16, label:"Hazor",            type:"victory",   side:"right" },
  { id:"gilgal",   x:55, y:42, label:"Gilgal",           type:"entry",     side:"right" },
  { id:"shiloh",   x:47, y:38, label:"Shiloh",           type:"territory", side:"left"  },
  { id:"hebron",   x:44, y:56, label:"Hebron",           type:"victory",   side:"left"  },
  { id:"lachish",  x:40, y:54, label:"Lachish",          type:"victory",   side:"left"  },
  { id:"shechem",  x:46, y:30, label:"Shechem",          type:"territory", side:"left"  },
];

export const CONQUEST_DETAILS = {
  jordan:  { title:"Crossing the Jordan",        body:"Forty years after the Red Sea, God parted another body of water. The priests carried the ark into the Jordan — and the river stopped flowing, piling up in a heap upstream. The entire nation crossed on dry ground. Twelve stones were set up as a memorial.", scripture:"Joshua 3:17 — 'And the priests that bare the ark of the covenant of the LORD stood firm on dry ground in the midst of Jordan, and all the Israelites passed over on dry ground.'" },
  gilgal:  { title:"Gilgal — The Base Camp",     body:"Gilgal served as Israel's military headquarters throughout the conquest. Here the reproach of Egypt was 'rolled away' as the new generation was circumcised. The Passover was celebrated. Gilgal was where Joshua returned after every campaign.", scripture:"Joshua 5:9 — 'And the LORD said unto Joshua, This day have I rolled away the reproach of Egypt from off you. Wherefore the name of the place is called Gilgal.'" },
  jericho: { title:"Jericho — The Walls Fall",   body:"The most dramatic victory of the conquest. No battering rams — just seven days of marching, seven priests with seven trumpets, and one great shout. The walls of Jericho collapsed flat. Only Rahab's household was spared — her scarlet cord a picture of saving grace.", scripture:"Joshua 6:20 — 'So the people shouted when the priests blew with the trumpets... and the wall fell down flat, so that the people went up into the city.'" },
  ai:      { title:"Ai — Defeat and Victory",    body:"Israel's first defeat — 36 men killed — because of Achan's hidden sin. After sin was exposed and dealt with, God gave a second strategy: an ambush. Ai was taken and burned. The lesson: no victory without holiness before God.", scripture:"Joshua 7:11 — 'Israel hath sinned, and they have also transgressed my covenant which I commanded them.'" },
  gibeon:  { title:"Gibeon — The Sun Stands Still", body:"Five kings attacked Gibeon for making peace with Israel. Joshua marched all night to defend them. God sent a hailstorm killing more than the sword — and Joshua prayed for the sun to stand still. 'There was no day like that before it or after it.'", scripture:"Joshua 10:13 — 'And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies.'" },
  hazor:   { title:"Hazor — Northern Campaign",  body:"Hazor was the greatest city in the north — 'the head of all those kingdoms.' Its king Jabin formed a massive coalition against Israel. Joshua attacked suddenly, defeated the coalition, burned Hazor, and broke the power of the north.", scripture:"Joshua 11:10 — 'And Joshua at that time turned back, and took Hazor, and smote the king thereof with the sword: for Hazor beforetime was the head of all those kingdoms.'" },
  shiloh:  { title:"Shiloh — The Tabernacle's Home", body:"After the main campaigns, the Tabernacle was set up at Shiloh — and remained there for over 300 years until the ark was captured by the Philistines. Here the land was divided among the remaining tribes by casting lots before the LORD.", scripture:"Joshua 18:1 — 'And the whole congregation of the children of Israel assembled together at Shiloh, and set up the tabernacle of the congregation there.'" },
  hebron:  { title:"Hebron — Caleb's Inheritance", body:"Caleb was 85 years old when he claimed his inheritance — the hill country where the giants lived. 'Give me this mountain,' he said. Forty-five years after the spies' report, Caleb drove out the sons of Anak and took Hebron.", scripture:"Joshua 14:12 — 'Now therefore give me this mountain, whereof the LORD spake in that day; for thou heardest in that day how the Anakims were there.'" },
  lachish: { title:"Lachish — Southern Campaign", body:"Part of Joshua's sweeping southern campaign where five kings were defeated in one day. Lachish was taken in two days — the coalition of southern kings was broken. Joshua then struck the entire region from Kadesh Barnea to Gaza.", scripture:"Joshua 10:32 — 'And the LORD delivered Lachish into the hand of Israel, which took it on the second day.'" },
  shechem: { title:"Shechem — The Covenant Renewed", body:"After the conquest, Joshua gathered all Israel at Shechem — the site of Abraham's first altar. He reviewed all of God's faithfulness and challenged the people to choose whom they would serve. 'As for me and my house, we will serve the LORD.'", scripture:"Joshua 24:15 — 'As for me and my house, we will serve the LORD.'" },
};

export default function ConquestMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#D4A853" label="Entry Point" />
      <LegendDot color="#8B5CF6" label="Miracle" />
      <LegendDot color="#E8625C" label="Victory" />
      <LegendDot color="#2E4A33" label="Camp / Covenant" />
    </>}>
      <svg viewBox="0 0 85 100" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-con" />
        <ParchBg w={85} h={100} vigId="vig-con" />

        {/* Mediterranean */}
        <polygon points="0,0 22,0 24,12 22,36 18,58 14,72 0,72 0,0" fill="url(#sea-con)" opacity="0.80" />
        <text x="2" y="50" fill={P.inkFaint} fontSize="2.6" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.55" transform="rotate(-90,2,50)">MEDITERRANEAN SEA</text>

        {/* Land */}
        <polygon points="20,0 85,0 85,100 18,100 20,80 18,58 22,36 24,12" fill={P.fertile} opacity="0.35" />

        {/* Jordan River */}
        <path d="M56,10 C56,18 54,28 54,38 C54,50 54,62 52,80 C50,90 48,96 46,100"
          fill="none" stroke="#7AAEC8" strokeWidth="2.4" opacity="0.70" strokeLinecap="round" />
        <HaloText x={58} y={50} text="Jordan River" fontSize={2.4} opacity={0.6} color={P.inkFaint} anchor="start" />

        {/* Sea of Galilee */}
        <ellipse cx="56" cy="18" rx="4" ry="5.5" fill="#7EB8D4" opacity="0.80" />
        <HaloText x={62} y={18} text="Sea of Galilee" fontSize={2.2} opacity={0.65} anchor="start" color={P.inkFaint} />

        {/* Dead Sea */}
        <ellipse cx="54" cy="58" rx="3.5" ry="7" fill="#7EB8D4" opacity="0.75" />
        <HaloText x={59} y={58} text="Dead Sea" fontSize={2.2} opacity={0.65} anchor="start" color={P.inkFaint} />

        {/* Regions */}
        <HaloText x={35} y={20} text="GALILEE"   fontSize={3.5} bold opacity={0.3} color={P.inkFaint} />
        <HaloText x={35} y={38} text="SAMARIA"   fontSize={3.5} bold opacity={0.3} color={P.inkFaint} />
        <HaloText x={33} y={52} text="JUDAH"     fontSize={3.5} bold opacity={0.3} color={P.inkFaint} />
        <HaloText x={64} y={38} text="GILEAD"    fontSize={3} bold opacity={0.3} color={P.inkFaint} />
        <HaloText x={64} y={55} text="MOAB"      fontSize={3} bold opacity={0.3} color={P.inkFaint} />

        {/* Campaign arrows */}
        <path d="M55,42 C50,42 46,42 44,46 C40,50 38,54 40,54" fill="none" stroke="#E8625C" strokeWidth="0.8" strokeDasharray="2,1.5" opacity="0.6" />
        <path d="M55,42 C52,36 50,28 48,22 C48,18 48,16 48,16" fill="none" stroke="#E8625C" strokeWidth="0.8" strokeDasharray="2,1.5" opacity="0.6" />

        {/* Vignette */}
        <rect x="0" y="0" width="85" height="100" fill="url(#vig-con)" pointerEvents="none" />

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