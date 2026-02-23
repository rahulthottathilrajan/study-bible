"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  capital: "#D4A853", fallen: "#E8625C", exile: "#8B5CF6",
  route: "#C06C3E", remnant: "#2E4A33",
};

const locs = [
  { id:"samaria",   x:44, y:42, label:"Samaria (Falls)",  type:"fallen",  side:"left"  },
  { id:"nineveh",   x:80, y:22, label:"Nineveh",          type:"capital", side:"right" },
  { id:"nimrud",    x:82, y:28, label:"Calah (Nimrud)",   type:"capital", side:"right" },
  { id:"haran",     x:68, y:26, label:"Haran",            type:"route",   side:"left"  },
  { id:"gozan",     x:74, y:18, label:"Gozan",            type:"exile",   side:"right" },
  { id:"halah",     x:78, y:16, label:"Halah",            type:"exile",   side:"right" },
  { id:"lachish",   x:38, y:56, label:"Lachish (Siege)",  type:"fallen",  side:"left"  },
  { id:"jerusalem", x:42, y:54, label:"Jerusalem (Saved)", type:"remnant", side:"right" },
  { id:"megiddo",   x:40, y:34, label:"Megiddo",          type:"fallen",  side:"left"  },
  { id:"damascus",  x:56, y:32, label:"Damascus (Falls)", type:"fallen",  side:"right" },
];

export const ASSYRIAN_DETAILS = {
  samaria:   { title:"Samaria — The Northern Kingdom Falls", body:"After a three-year siege, Samaria fell to the Assyrian king Shalmaneser V in 722 BC. The city was captured by his successor Sargon II, who deported 27,290 Israelites to distant lands. Foreign peoples were brought in to repopulate the land — beginning the mixed heritage of the Samaritans.", scripture:"2 Kings 17:6 — 'In the ninth year of Hoshea the king of Assyria took Samaria, and carried Israel away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes.'" },
  nineveh:   { title:"Nineveh — The Assyrian Capital",       body:"Nineveh was the greatest city of the ancient world under Sennacherib — a metropolis of canals, gardens, and massive palaces. Its walls were 8 miles around. Jonah had preached here a century earlier. Nahum prophesied its destruction; in 612 BC the city fell to Babylon and was never rebuilt.", scripture:"Jonah 1:2 — 'Arise, go to Nineveh, that great city, and cry against it; for their wickedness is come up before me.'" },
  nimrud:    { title:"Calah (Nimrud) — The Military Capital", body:"Calah, built by Nimrod in Genesis 10, became the military headquarters of the Assyrian empire. Shalmaneser III erected his famous Black Obelisk here — showing Jehu king of Israel bowing before the Assyrian king. The obelisk is now in the British Museum.", scripture:"Genesis 10:11-12 — 'Out of that land went forth Asshur, and builded Nineveh, and the city Rehoboth, and Calah... the same is a great city.'" },
  haran:     { title:"Haran — On the Road to Exile",         body:"The ancient city where Abraham's father died on the way from Ur. The exiled Israelites passed through Haran on their forced march east. Haran later became the last stand of the dying Assyrian empire, which made it a final capital before Babylon completed its conquest.", scripture:"2 Kings 19:12 — 'Have the gods of the nations delivered them which my fathers have destroyed; as Gozan, and Haran, and Rezeph...'" },
  gozan:     { title:"Gozan — Land of Exile",                body:"Gozan on the River Habor was one of the three main destinations for the deported northern tribes. It lies in modern northern Syria. The exiled Israelites were settled here among foreign peoples, and the ten northern tribes gradually lost their distinct identity — history's famous 'ten lost tribes of Israel.'", scripture:"2 Kings 17:6 — '...and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes.'" },
  halah:     { title:"Halah — Exile in Assyria",             body:"Halah was another major deportation site in the Assyrian heartland. The prophet Hosea had warned Israel for decades that this would come. 'They shall return to Egypt, and Assyria shall be their king, because they refused to return.' The exile was God's covenant judgment — Deuteronomy 28 had warned of it 700 years earlier.", scripture:"Hosea 11:5 — 'He shall not return into the land of Egypt, but the Assyrian shall be his king, because they refused to return.'" },
  lachish:   { title:"Lachish — Sennacherib's Great Siege",  body:"After deporting the north, Sennacherib invaded Judah in 701 BC and besieged Lachish. The Lachish siege is one of the best-documented events in biblical archaeology — recorded on massive stone reliefs in Sennacherib's palace at Nineveh, now in the British Museum. Sennacherib then turned to Jerusalem.", scripture:"2 Kings 18:13-14 — 'Now in the fourteenth year of king Hezekiah did Sennacherib king of Assyria come up against all the fenced cities of Judah, and took them.'" },
  jerusalem: { title:"Jerusalem — The Miracle Deliverance",  body:"Sennacherib surrounded Jerusalem and sent the Rabshakeh to taunt Hezekiah in Hebrew within earshot of the people. Hezekiah spread the threatening letter before the LORD. Isaiah prophesied Assyria would not shoot an arrow into the city. That night the angel of the LORD killed 185,000 Assyrian soldiers. Sennacherib returned to Nineveh and was murdered by his sons.", scripture:"2 Kings 19:35 — 'And it came to pass that night, that the angel of the LORD went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand.'" },
  megiddo:   { title:"Megiddo — Assyrian Control",           body:"Megiddo was captured by Tiglath-Pileser III in 732 BC and became the capital of an Assyrian province. The Israelite city was destroyed and rebuilt in Assyrian style. It was here that the good king Josiah of Judah was killed fighting Pharaoh Neco of Egypt — a tragic end to the greatest reforming king.", scripture:"2 Kings 23:29 — 'In his days Pharaohnechoh king of Egypt went up against the king of Assyria to the river Euphrates: and king Josiah went against him; and he slew him at Megiddo.'" },
  damascus:  { title:"Damascus — Syria Falls First",         body:"Damascus, capital of Aram (Syria), fell to Tiglath-Pileser III in 732 BC — before Samaria. The Syrians were deported to Kir as Amos had prophesied. This fulfilled the word of the LORD spoken through Amos decades earlier: 'I will send a fire into the house of Hazael, which shall devour the palaces of Ben-hadad.'", scripture:"2 Kings 16:9 — 'And the king of Assyria hearkened unto him: for the king of Assyria went up against Damascus, and took it, and carried the people of it captive to Kir, and slew Rezin.'" },
};

export default function AssyrianExileMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#E8625C" label="City Falls" />
      <LegendDot color="#D4A853" label="Assyrian Capital" />
      <LegendDot color="#8B5CF6" label="Exile Destination" />
      <LegendDot color="#2E4A33" label="Miraculously Saved" />
    </>}>
      <svg viewBox="0 0 110 80" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-ass" />
        <ParchBg w={110} h={80} vigId="vig-ass" />

        {/* Mediterranean */}
        <polygon points="0,0 22,0 24,14 20,38 16,54 0,54 0,0" fill="url(#sea-ass)" opacity="0.78" />
        <text x="2" y="36" fill={P.inkFaint} fontSize="2.4" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.55" transform="rotate(-90,2,36)">MEDITERRANEAN</text>

        {/* Persian Gulf */}
        <polygon points="88,60 100,58 104,72 90,76 84,68" fill="url(#sea-ass)" opacity="0.65" />
        <HaloText x={94} y={70} text="PERSIAN GULF" fontSize={2.2} bold opacity={0.5} color={P.inkFaint} />

        {/* Caspian Sea */}
        <ellipse cx="100" cy="16" rx="8" ry="12" fill="url(#sea-ass)" opacity="0.55" />
        <HaloText x={100} y={10} text="CASPIAN" fontSize={2.2} bold opacity={0.45} color={P.inkFaint} />

        {/* Assyrian Empire shading */}
        <polygon points="38,20 96,10 104,24 100,44 88,56 72,60 58,56 46,48 36,38 34,26"
          fill="#C06C3E" opacity="0.10" stroke="#C06C3E" strokeWidth="1" strokeDasharray="3,2" strokeOpacity="0.4" />
        <HaloText x={72} y={36} text="ASSYRIAN EMPIRE" fontSize={4} bold opacity={0.18} color="#C06C3E" />

        {/* Canaan / Israel */}
        <polygon points="20,28 46,22 50,32 48,52 44,60 34,62 22,54 18,40" fill={P.fertile} opacity="0.55" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={32} y={38} text="ISRAEL / JUDAH" fontSize={2.5} bold opacity={0.4} color={P.inkFaint} />

        {/* Syria */}
        <polygon points="40,14 66,10 70,22 62,32 48,34 38,28" fill={P.land} opacity="0.55" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={54} y={22} text="ARAM" fontSize={2.5} bold opacity={0.4} color={P.inkFaint} />

        {/* Mesopotamia - Assyrian heartland */}
        <polygon points="62,8 96,6 100,20 96,38 84,50 70,52 58,46 56,30 60,16"
          fill={P.desert} opacity="0.55" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={78} y={30} text="ASSYRIA" fontSize={3.5} bold opacity={0.38} color={P.inkFaint} />

        {/* Media - northeast */}
        <polygon points="88,8 108,6 108,30 100,40 88,36 82,22" fill={P.land} opacity="0.50" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={96} y={22} text="MEDIA" fontSize={2.5} bold opacity={0.38} color={P.inkFaint} />

        {/* Exile route arrows */}
        <path d="M44,42 C52,38 58,34 64,30 C70,26 74,22 78,18" fill="none" stroke="#8B5CF6" strokeWidth="1.4" strokeDasharray="3,2" opacity="0.75" />
        <path d="M44,42 C54,40 62,38 70,36 C78,34 82,30 82,28" fill="none" stroke="#8B5CF6" strokeWidth="1.4" strokeDasharray="3,2" opacity="0.65" />

        {/* Tigris River */}
        <path d="M80,8 C80,18 78,30 76,44 C74,56 72,64 70,72" fill="none" stroke="#7AAEC8" strokeWidth="1.6" opacity="0.60" strokeLinecap="round" />
        <HaloText x={72} y={50} text="Tigris" fontSize={2.2} opacity={0.55} color={P.inkFaint} anchor="start" />

        {/* Euphrates River */}
        <path d="M60,14 C60,22 58,32 56,44 C54,56 52,64 50,74" fill="none" stroke="#7AAEC8" strokeWidth="1.4" opacity="0.55" strokeLinecap="round" />
        <HaloText x={48} y={44} text="Euphrates" fontSize={2.2} opacity={0.55} color={P.inkFaint} anchor="end" />

        {/* Jordan River */}
        <path d="M44,22 C44,30 44,40 44,52 C42,60 40,66 38,72" fill="none" stroke="#7AAEC8" strokeWidth="1.2" opacity="0.55" strokeLinecap="round" />

        {/* Dead Sea */}
        <ellipse cx="43" cy="56" rx="2.5" ry="5" fill="#7EB8D4" opacity="0.72" />

        {/* Vignette */}
        <rect x="0" y="0" width="110" height="80" fill="url(#vig-ass)" pointerEvents="none" />

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