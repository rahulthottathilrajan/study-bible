"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  capital: "#D4A853", fallen: "#E8625C", exile: "#8B5CF6",
  prophet: "#1B7A6E", route: "#C06C3E",
};

const locs = [
  { id:"jerusalem", x:38, y:46, label:"Jerusalem (Falls)", type:"fallen",  side:"left"  },
  { id:"babylon",   x:76, y:48, label:"Babylon",           type:"capital", side:"right" },
  { id:"nippur",    x:78, y:54, label:"Nippur",            type:"exile",   side:"right" },
  { id:"tel_abib",  x:74, y:44, label:"Tel-Abib",          type:"exile",   side:"right" },
  { id:"chebar",    x:72, y:48, label:"River Chebar",      type:"prophet", side:"left"  },
  { id:"riblah",    x:50, y:28, label:"Riblah",            type:"route",   side:"right" },
  { id:"carchemish",x:60, y:18, label:"Carchemish",        type:"route",   side:"right" },
  { id:"haran",     x:62, y:22, label:"Haran",             type:"route",   side:"left"  },
  { id:"egypt",     x:22, y:56, label:"Egypt (Refugees)",  type:"exile",   side:"right" },
  { id:"mizpah",    x:40, y:42, label:"Mizpah",            type:"prophet", side:"right" },
];

export const BABYLONIAN_DETAILS = {
  jerusalem: { title:"Jerusalem — The City Burns",           body:"In 586 BC, Nebuchadnezzar's army breached Jerusalem's walls after an 18-month siege. The city was burned, the Temple of Solomon destroyed, and the walls demolished. King Zedekiah's sons were killed before his eyes — then his eyes were put out and he was taken to Babylon in chains. The ark of the covenant disappears from history here.", scripture:"2 Kings 25:9 — 'And he burnt the house of the LORD, and the king's house, and all the houses of Jerusalem, and every great man's house burnt he with fire.'" },
  babylon:   { title:"Babylon — The Great City",             body:"Babylon under Nebuchadnezzar was the greatest city on earth — its walls 56 miles around, the legendary Hanging Gardens one of the seven wonders. The exiled Jews settled here for 70 years. Daniel served in Nebuchadnezzar's court. The Jews by the rivers of Babylon wept and hung their harps on the willows.", scripture:"Psalm 137:1 — 'By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion.'" },
  nippur:    { title:"Nippur — Jewish Settlement",           body:"Nippur was one of the main Jewish settlement areas in Babylonia. Archaeological evidence — the Murashu archive — shows Jewish families thriving as merchants and landowners in Nippur during the exile. Not all Jews were slaves; many built houses, planted gardens, and established businesses as Jeremiah had instructed.", scripture:"Jeremiah 29:5-7 — 'Build ye houses, and dwell in them; and plant gardens, and eat the fruit of them... and seek the peace of the city whither I have caused you to be carried away captive.'" },
  tel_abib:  { title:"Tel-Abib — Ezekiel's Community",      body:"Tel-Abib on the Chebar Canal was where the prophet Ezekiel lived among the exiles. Ezekiel received his extraordinary visions here — the four living creatures, the wheel within a wheel, the valley of dry bones. He ministered to the despairing exiles with visions of future restoration.", scripture:"Ezekiel 3:15 — 'Then I came to them of the captivity at Telabib, that dwelt by the river of Chebar, and I sat where they sat.'" },
  chebar:    { title:"River Chebar — Ezekiel's Visions",    body:"The Chebar Canal near Nippur was where Ezekiel received his inaugural vision of God's glory — a chariot-throne of four living creatures with wings and wheels, surrounded by fire and lightning. The vision declared that God's glory was not confined to Jerusalem; He could be found in exile.", scripture:"Ezekiel 1:1 — 'Now it came to pass... as I was among the captives by the river of Chebar, that the heavens were opened, and I saw visions of God.'" },
  riblah:    { title:"Riblah — The Place of Judgment",      body:"Riblah in Syria was Nebuchadnezzar's military headquarters during his campaigns. King Zedekiah was brought here after his capture fleeing Jerusalem. His sons were slaughtered before him, his eyes put out, and he was taken to Babylon in bronze fetters — the last thing he ever saw was his sons' deaths.", scripture:"2 Kings 25:6-7 — 'So they took the king, and brought him up to the king of Babylon to Riblah; and they gave judgment upon him... And they slew the sons of Zedekiah before his eyes, and put out the eyes of Zedekiah.'" },
  carchemish: { title:"Carchemish — The Battle That Changed Everything", body:"In 605 BC, Nebuchadnezzar decisively defeated Pharaoh Neco at Carchemish — ending Egyptian power and establishing Babylon as the dominant world empire. This battle triggered Nebuchadnezzar's first deportation of Jerusalem, including the teenage Daniel and his three friends.", scripture:"Jeremiah 46:2 — 'Against Egypt, against the army of Pharaohnecho king of Egypt, which was by the river Euphrates in Carchemish, which Nebuchadrezzar king of Babylon smote in the fourth year of Jehoiakim.'" },
  haran:     { title:"Haran — The Exile Route",             body:"The deportees from Jerusalem were marched north through the Fertile Crescent — up through Syria past Haran, then east along the Euphrates to Babylon. This brutal march of over 900 miles on foot was itself a death sentence for the weak. Psalm 137 captures the anguish of those who arrived.", scripture:"Lamentations 1:3 — 'Judah is gone into captivity because of affliction, and because of great servitude: she dwelleth among the heathen, she findeth no rest.'" },
  egypt:     { title:"Egypt — The Disobedient Remnant",     body:"After Jerusalem fell, a group of surviving Jews — against Jeremiah's explicit warning — fled to Egypt, forcing Jeremiah to go with them. They settled at Tahpanhes, Noph, and other Egyptian cities. Jeremiah prophesied that Nebuchadnezzar would also conquer Egypt — and he did.", scripture:"Jeremiah 42:19 — 'O ye remnant of Judah; Go ye not into Egypt: know certainly that I have admonished you this day.'" },
  mizpah:    { title:"Mizpah — Gedaliah's Governorship",   body:"After Jerusalem fell, Nebuchadnezzar appointed Gedaliah as governor over the remaining poor in the land, headquartered at Mizpah. Jeremiah chose to stay with him. But Gedaliah was assassinated by Ishmael — a Judean prince — dashing hopes of a Jewish remnant in the land.", scripture:"2 Kings 25:22-25 — 'And as for the people that remained in the land of Judah, whom Nebuchadnezzar king of Babylon had left, even over them he made Gedaliah the son of Ahikam... governor.'" },
};

export default function BabylonianExileMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#E8625C" label="City Falls" />
      <LegendDot color="#D4A853" label="Babylon" />
      <LegendDot color="#8B5CF6" label="Exile Settlement" />
      <LegendDot color="#1B7A6E" label="Prophet" />
      <LegendDot color="#C06C3E" label="Exile Route" />
    </>}>
      <svg viewBox="0 0 110 80" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-bab" />
        <ParchBg w={110} h={80} vigId="vig-bab" />

        {/* Mediterranean */}
        <polygon points="0,0 20,0 22,14 18,36 14,52 0,52 0,0" fill="url(#sea-bab)" opacity="0.78" />
        <text x="2" y="34" fill={P.inkFaint} fontSize="2.4" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.55" transform="rotate(-90,2,34)">MEDITERRANEAN</text>

        {/* Red Sea */}
        <polygon points="16,58 26,54 30,66 24,76 14,74 12,64" fill="url(#sea-bab)" opacity="0.60" />

        {/* Persian Gulf */}
        <polygon points="80,62 96,58 100,72 84,76 76,68" fill="url(#sea-bab)" opacity="0.65" />
        <HaloText x={88} y={70} text="PERSIAN GULF" fontSize={2.2} bold opacity={0.5} color={P.inkFaint} />

        {/* Babylonian Empire shading */}
        <polygon points="32,22 88,16 96,30 94,52 80,64 60,68 40,60 28,48 24,32"
          fill="#2A4A6B" opacity="0.10" stroke="#2A4A6B" strokeWidth="1" strokeDasharray="3,2" strokeOpacity="0.4" />
        <HaloText x={62} y={40} text="BABYLONIAN EMPIRE" fontSize={3.5} bold opacity={0.18} color="#2A4A6B" />

        {/* Judah */}
        <polygon points="18,32 40,26 44,36 42,52 36,58 22,56 16,44" fill={P.fertile} opacity="0.55" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={28} y={42} text="JUDAH" fontSize={2.8} bold opacity={0.4} color={P.inkFaint} />

        {/* Syria */}
        <polygon points="34,10 66,6 70,18 64,28 48,32 36,26" fill={P.land} opacity="0.55" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={50} y={18} text="SYRIA" fontSize={2.8} bold opacity={0.38} color={P.inkFaint} />

        {/* Mesopotamia */}
        <polygon points="62,12 96,8 100,24 96,42 82,56 68,58 58,50 56,34 60,18"
          fill={P.desert} opacity="0.55" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={78} y={34} text="BABYLONIA" fontSize={3} bold opacity={0.38} color={P.inkFaint} />

        {/* Egypt */}
        <polygon points="10,54 26,50 30,58 28,70 18,74 10,68" fill={P.desert} opacity="0.65" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={18} y={62} text="EGYPT" fontSize={2.5} bold opacity={0.4} color={P.inkFaint} />

        {/* Exile route */}
        <path d="M38,46 C42,38 48,30 52,26 C58,22 62,20 68,18 C72,16 76,16 80,18 C84,22 80,36 78,44"
          fill="none" stroke="#8B5CF6" strokeWidth="1.6" strokeDasharray="4,2.5" opacity="0.80" />

        {/* Euphrates */}
        <path d="M60,14 C60,24 58,36 56,48 C54,58 52,66 50,76" fill="none" stroke="#7AAEC8" strokeWidth="1.6" opacity="0.60" strokeLinecap="round" />
        <HaloText x={52} y={44} text="Euphrates" fontSize={2.2} opacity={0.55} color={P.inkFaint} anchor="end" />

        {/* Tigris */}
        <path d="M74,12 C74,22 72,34 70,46 C68,56 66,64 64,74" fill="none" stroke="#7AAEC8" strokeWidth="1.4" opacity="0.55" strokeLinecap="round" />
        <HaloText x={76} y={42} text="Tigris" fontSize={2.2} opacity={0.55} color={P.inkFaint} anchor="start" />

        {/* Jordan River */}
        <path d="M38,26 C38,34 38,44 38,54 C36,62 34,68 32,74" fill="none" stroke="#7AAEC8" strokeWidth="1.2" opacity="0.55" strokeLinecap="round" />

        {/* Dead Sea */}
        <ellipse cx="37" cy="54" rx="2.2" ry="4.5" fill="#7EB8D4" opacity="0.72" />

        {/* Vignette */}
        <rect x="0" y="0" width="110" height="80" fill="url(#vig-bab)" pointerEvents="none" />

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