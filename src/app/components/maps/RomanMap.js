"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = { capital:"#D4A853", holy:"#E8625C", church:"#1B7A6E", city:"#8B5CF6" };

const locs = [
  { id:"rome_re",      x:27, y:22, label:"Rome",      type:"capital", side:"right" },
  { id:"corinth_re",   x:36, y:30, label:"Corinth",   type:"church",  side:"left"  },
  { id:"athens_re",    x:38, y:27, label:"Athens",    type:"city",    side:"right" },
  { id:"ephesus_re",   x:50, y:26, label:"Ephesus",   type:"church",  side:"left"  },
  { id:"antioch_re",   x:66, y:26, label:"Antioch",   type:"church",  side:"right" },
  { id:"caesarea_re",  x:63, y:32, label:"Caesarea",  type:"city",    side:"right" },
  { id:"nazareth",     x:60, y:37, label:"Nazareth",  type:"holy",    side:"left"  },
  { id:"jerusalem_re", x:65, y:41, label:"Jerusalem", type:"holy",    side:"right" },
  { id:"bethlehem",    x:60, y:45, label:"Bethlehem", type:"holy",    side:"left"  },
  { id:"alexandria",   x:52, y:48, label:"Alexandria",type:"city",    side:"left"  },
];

export const ROMAN_DETAILS = {
  rome_re:      { title:"Rome — Caput Mundi",                  body:"The capital of the empire — 'head of the world.' Rome had perhaps one million inhabitants. The church at Rome received Paul's greatest theological letter. Tradition holds that both Peter and Paul were martyred here.", scripture:"Romans 1:7 — 'To all that be in Rome, beloved of God, called to be saints.'" },
  jerusalem_re: { title:"Jerusalem — The Holy City",           body:"Under Roman rule since 63 BC, Jerusalem was the spiritual heart of Judaism and the site of Christ's crucifixion and resurrection. In AD 70, Titus destroyed the city and Temple — fulfilling Jesus' prophecy in Matthew 24.", scripture:"Luke 21:24 — 'Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled.'" },
  bethlehem:    { title:"Bethlehem — City of David",           body:"Micah prophesied 700 years before Christ that out of Bethlehem would come the ruler of Israel. Joseph and Mary came here for the Roman census — and the Son of God was born in a manger.", scripture:"Luke 2:4-7 — 'And Joseph also went up from Galilee... unto the city of David, which is called Bethlehem.'" },
  nazareth:     { title:"Nazareth — Where Jesus Grew Up",      body:"A small, unremarkable town in Galilee — prompting Nathanael's question: 'Can any good thing come out of Nazareth?' Yet this was where the Son of God spent 30 of His 33 years on earth.", scripture:"Luke 2:51-52 — 'And he went down with them, and came to Nazareth, and was subject unto them... And Jesus increased in wisdom and stature.'" },
  antioch_re:   { title:"Antioch — Where Christianity Spread", body:"The third largest city in the Roman Empire. Here Gentiles first received the gospel in large numbers. The disciples were first called 'Christians' here. Antioch became the centre of the expanding church.", scripture:"Acts 11:26 — 'And the disciples were called Christians first in Antioch.'" },
  alexandria:   { title:"Alexandria — City of Learning",       body:"Founded by Alexander the Great, Alexandria was the intellectual capital of the ancient world. The Septuagint — the Greek Old Testament used by the apostles — was translated here.", scripture:"Acts 18:24 — 'And a certain Jew named Apollos, born at Alexandria, an eloquent man, and mighty in the scriptures, came to Ephesus.'" },
  corinth_re:   { title:"Corinth",                             body:"A major commercial city at the crossroads of east and west. Paul spent 18 months here and wrote Romans from this city.", scripture:"Acts 18:1 — 'After these things Paul departed from Athens, and came to Corinth.'" },
  ephesus_re:   { title:"Ephesus",                             body:"One of the largest cities in the Roman Empire with perhaps 250,000 inhabitants. Home to the Temple of Artemis, one of the Seven Wonders. Paul spent nearly three years here.", scripture:"Revelation 2:1 — 'Unto the angel of the church of Ephesus write...'" },
  athens_re:    { title:"Athens",                              body:"The philosophical capital of the ancient world. By Paul's day it was a university town living on its former glory. Yet here Paul preached the resurrection on Mars Hill.", scripture:"Acts 17:16 — 'Now while Paul waited for them at Athens, his spirit was stirred in him, when he saw the city wholly given to idolatry.'" },
  caesarea_re:  { title:"Caesarea Maritima",                   body:"Built by Herod the Great to honour Caesar Augustus — a magnificent Roman city with a man-made harbour, theatre, and hippodrome. Pontius Pilate lived here, not in Jerusalem.", scripture:"Acts 10:1 — 'There was a certain man in Caesarea called Cornelius, a centurion of the band called the Italian band.'" },
};

export default function RomanMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#D4A853" label="Capital" />
      <LegendDot color="#E8625C" label="Holy Site" />
      <LegendDot color="#1B7A6E" label="Church" />
      <LegendDot color="#8B5CF6" label="City" />
    </>}>
      <svg viewBox="0 0 100 65" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-roman" />
        <ParchBg w={100} h={65} vigId="vig-roman" />
        <rect x="0" y="0" width="100" height="65" fill="url(#sea-roman)" opacity="0.55" />
        <polygon points="6,4 40,3 44,7 80,5 88,10 90,46 80,54 66,56 50,54 32,48 18,46 8,36 6,20"
          fill={P.land} opacity="0.78" stroke={P.edge} strokeWidth="0.6" strokeDasharray="1.5,1" strokeOpacity="0.5" />
        <polygon points="6,6 20,4 22,10 20,24 12,28 6,22" fill={P.land} opacity="0.88" stroke={P.edge} strokeWidth="0.3" />
        <polygon points="20,4 34,3 36,8 34,20 24,24 20,16" fill={P.fertile} opacity="0.65" stroke={P.edge} strokeWidth="0.3" />
        <polygon points="28,8 36,8 38,14 36,26 32,34 28,36 24,28 24,16" fill={P.land} opacity="0.92" stroke={P.edge} strokeWidth="0.4" />
        <polygon points="34,12 44,10 46,18 44,28 40,34 36,32 34,24" fill={P.land} opacity="0.90" stroke={P.edge} strokeWidth="0.35" />
        <polygon points="44,7 74,5 76,16 74,28 60,34 50,32 46,22 44,14" fill={P.land} opacity="0.90" stroke={P.edge} strokeWidth="0.4" />
        <polygon points="60,22 78,20 80,46 68,50 58,48 56,38 58,28" fill={P.land} opacity="0.88" stroke={P.edge} strokeWidth="0.35" />
        <polygon points="28,48 80,46 84,58 22,58 20,52" fill={P.desert} opacity="0.82" stroke={P.edge} strokeWidth="0.35" />
        <polygon points="60,32 70,30 72,42 66,46 58,44 58,36" fill={P.mountain} opacity="0.35" />
        <HaloText x={11} y={16} text="GAUL"              fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <HaloText x={26} y={22} text="ITALY"             fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <HaloText x={36} y={22} text="GREECE"            fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <HaloText x={54} y={19} text="ASIA MINOR"        fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <HaloText x={64} y={30} text="JUDEA"             fontSize={2.5} bold opacity={0.5} color={P.inkFaint} />
        <HaloText x={32} y={54} text="NORTH AFRICA"      fontSize={2.8} bold opacity={0.55} color={P.inkFaint} />
        <HaloText x={14} y={44} text="MEDITERRANEAN SEA" fontSize={3}   bold opacity={0.38} color={P.inkFaint} />
        <line x1="27" y1="22" x2="62" y2="28" stroke={P.edge} strokeWidth="0.6" strokeDasharray="1.5,1.5" opacity="0.4" />
        <line x1="27" y1="22" x2="36" y2="28" stroke={P.edge} strokeWidth="0.6" strokeDasharray="1.5,1.5" opacity="0.4" />
        <line x1="36" y1="28" x2="62" y2="28" stroke={P.edge} strokeWidth="0.6" strokeDasharray="1.5,1.5" opacity="0.4" />
        <rect x="0" y="0" width="100" height="65" fill="url(#vig-roman)" pointerEvents="none" />
        {locs.map(loc => (
          <Dot key={loc.id} cx={loc.x} cy={loc.y}
            r={loc.type === "capital" ? 2.5 : 2}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label} side={loc.side}
          />
        ))}
        <Compass x={92} y={9} />
      </svg>
    </MapCard>
  );
}