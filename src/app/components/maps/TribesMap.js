"use client";
import { P, HaloText, ParchBg, SeaDef, Compass, MapCard } from "./shared";

const tribes = [
  { id:"dan_north",  label:"Dan",       cx:43, cy:13, color:"#E8625C", points:"36,8  52,8  52,18 48,22 38,22 34,16",                    scripture:"Joshua 19:40-48" },
  { id:"naphtali",   label:"Naphtali",  cx:57, cy:18, color:"#1B7A6E", points:"52,8  64,8  66,14 62,22 58,28 54,24 50,20 52,16",       scripture:"Joshua 19:32-39" },
  { id:"asher",      label:"Asher",     cx:30, cy:28, color:"#D4A853", points:"26,16 36,12 38,20 36,36 30,42 26,38 24,28",             scripture:"Joshua 19:24-31" },
  { id:"zebulun",    label:"Zebulun",   cx:43, cy:28, color:"#8B5CF6", points:"36,22 50,20 52,26 50,34 44,36 38,34 36,28",             scripture:"Joshua 19:10-16" },
  { id:"issachar",   label:"Issachar",  cx:44, cy:40, color:"#C06C3E", points:"36,36 50,34 54,38 52,46 46,48 36,46",                   scripture:"Joshua 19:17-23" },
  { id:"manasseh_w", label:"Manasseh",  cx:38, cy:52, color:"#2E4A33", points:"26,44 36,42 46,48 52,46 54,56 50,62 38,62 26,58 24,50", scripture:"Joshua 17:1-13"  },
  { id:"ephraim",    label:"Ephraim",   cx:41, cy:67, color:"#6BAE75", points:"30,62 50,62 54,66 50,72 44,74 32,72 28,68",             scripture:"Joshua 16:5-10"  },
  { id:"dan_south",  label:"Dan",       cx:27, cy:72, color:"#E8625C", points:"24,66 32,64 34,72 28,76 22,74",                         scripture:"Joshua 19:40-48" },
  { id:"benjamin",   label:"Benjamin",  cx:43, cy:75, color:"#B8860B", points:"36,72 50,70 52,76 48,80 38,80 34,76",                   scripture:"Joshua 18:11-28" },
  { id:"judah",      label:"Judah",     cx:37, cy:86, color:"#7A6B8A", points:"22,78 36,76 38,80 50,78 52,82 50,90 40,96 26,92 20,84", scripture:"Joshua 15:1-63"  },
  { id:"simeon",     label:"Simeon",    cx:37, cy:92, color:"#E8A87C", points:"30,90 44,88 46,96 36,98 28,96",                         scripture:"Joshua 19:1-9"   },
  { id:"manasseh_e", label:"Manasseh E",cx:62, cy:19, color:"#2E4A33", points:"56,10 72,10 74,20 70,28 60,30 56,26 54,18",             scripture:"Joshua 13:29-31" },
  { id:"gad",        label:"Gad",       cx:62, cy:46, color:"#9B8BA8", points:"56,36 64,32 70,34 72,56 62,58 56,56 54,44",             scripture:"Joshua 13:24-28" },
  { id:"reuben",     label:"Reuben",    cx:62, cy:67, color:"#5A8A82", points:"54,58 62,56 72,58 72,76 64,80 56,78 54,68",             scripture:"Joshua 13:15-23" },
];

export const TRIBES_DETAILS = {
  dan_north:  { title:"Tribe of Dan (North)",     body:"Dan eventually migrated north after struggling to hold their original southern territory. The city of Dan became one of Jeroboam's golden calf worship sites.", scripture:"Joshua 19:40-48" },
  naphtali:   { title:"Tribe of Naphtali",         body:"Naphtali received fertile territory around the Sea of Galilee. Jesus spent much of His ministry here — fulfilling Isaiah 9:1 about the land of Naphtali seeing a great light.", scripture:"Joshua 19:32-39; Isaiah 9:1; Matthew 4:13-16" },
  asher:      { title:"Tribe of Asher",            body:"Asher received the fertile coastal strip of northern Canaan. Moses blessed Asher: 'Let him dip his foot in oil.' The prophetess Anna was from Asher.", scripture:"Joshua 19:24-31; Luke 2:36" },
  zebulun:    { title:"Tribe of Zebulun",          body:"Zebulun was landlocked between the Sea of Galilee and the Mediterranean. Nazareth, where Jesus grew up, was in Zebulun — fulfilling Isaiah's prophecy.", scripture:"Joshua 19:10-16; Matthew 4:13" },
  issachar:   { title:"Tribe of Issachar",         body:"Issachar received the fertile Jezreel Valley. The men of Issachar were known for 'understanding the times' — wisdom about what Israel ought to do.", scripture:"Joshua 19:17-23; 1 Chronicles 12:32" },
  manasseh_w: { title:"Tribe of Manasseh (West)",  body:"The half-tribe of Manasseh received a large territory west of the Jordan. Jacob crossed his hands and blessed Ephraim first over Manasseh the firstborn.", scripture:"Joshua 17:1-13" },
  ephraim:    { title:"Tribe of Ephraim",          body:"Ephraim received a prominent central position and became one of the most influential tribes. Joshua was from Ephraim. Shiloh, where the Tabernacle rested, was in Ephraim.", scripture:"Joshua 16:5-10" },
  dan_south:  { title:"Tribe of Dan (Original)",   body:"Dan's original allotment was in the southwest, near Philistine territory. Samson was from Dan. Constant Philistine pressure caused much of the tribe to migrate north.", scripture:"Joshua 19:40-48; Judges 13:2" },
  benjamin:   { title:"Tribe of Benjamin",         body:"Benjamin's small but strategic territory contained Jerusalem on its border. King Saul was a Benjamite. The apostle Paul was also from Benjamin.", scripture:"Joshua 18:11-28; Philippians 3:5" },
  judah:      { title:"Tribe of Judah",            body:"Judah received the largest southern territory and became the royal tribe. David was from Judah. Jesus, the Lion of the tribe of Judah, fulfilled the Messianic promise.", scripture:"Joshua 15:1-63; Genesis 49:10; Revelation 5:5" },
  simeon:     { title:"Tribe of Simeon",           body:"Simeon received territory within Judah's allotment — fulfilling Jacob's prophecy that Simeon would be scattered. Over time Simeon was absorbed into Judah.", scripture:"Joshua 19:1-9; Genesis 49:7" },
  reuben:     { title:"Tribe of Reuben",           body:"Reuben the firstborn chose land east of the Jordan. Despite being firstborn, Reuben lost his preeminence due to sin and was among the first tribes carried into exile.", scripture:"Joshua 13:15-23; 1 Chronicles 5:1" },
  gad:        { title:"Tribe of Gad",              body:"Gad settled in Gilead east of the Jordan. The Gadites were mighty warriors. Elijah the prophet was from Gilead.", scripture:"Joshua 13:24-28; 1 Chronicles 12:8" },
  manasseh_e: { title:"Tribe of Manasseh (East)",  body:"The eastern half of Manasseh settled in Bashan. Like Reuben and Gad, the eastern Manassites were among the first tribes exiled by Assyria.", scripture:"Joshua 13:29-31; 2 Kings 15:29" },
};

export default function TribesMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={
      <span style={{ fontFamily:"'Nunito',sans-serif", fontSize:10, color:P.inkFaint, fontWeight:600 }}>
        Tap any tribe territory to explore its history and scripture
      </span>
    }>
      <svg viewBox="0 0 90 110" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-tribes" />
        <ParchBg w={90} h={110} vigId="vig-tribes" />
        <polygon points="0,0 26,0 28,14 26,44 24,68 22,86 0,86 0,0" fill="url(#sea-tribes)" opacity="0.82" />
        <text x="2" y="60" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.6" transform="rotate(-90,2,60)">MEDITERRANEAN SEA</text>
        <polygon points="24,0 90,0 90,110 22,110 24,90 22,68 24,44 26,14" fill={P.fertile} opacity="0.38" />
        <path d="M54,12 C55,24 52,36 54,52 C56,66 54,82 53,104"
          fill="none" stroke="#7AAEC8" strokeWidth="2.8" opacity="0.72" strokeLinecap="round" />
        <HaloText x={57} y={50} text="Jordan" fontSize={2.5} opacity={0.65} color={P.inkFaint} />
        <ellipse cx="53" cy="26" rx="3.2" ry="4.8" fill="#7EB8D4" opacity="0.82" />
        <HaloText x={57} y={26} text="Sea of Galilee" fontSize={2.2} opacity={0.7} anchor="start" color={P.inkFaint} />
        <ellipse cx="52" cy="72" rx="2.8" ry="6.5" fill="#7EB8D4" opacity="0.78" />
        <HaloText x={56} y={72} text="Dead Sea" fontSize={2.2} opacity={0.7} anchor="start" color={P.inkFaint} />
        <polygon points="74,14 78,8 82,14" fill={P.mountain} opacity="0.28" />
        <polygon points="78,18 82,12 86,18" fill={P.mountain} opacity="0.22" />

        {tribes.map(tribe => {
          const isSel = selectedLocation?.id === tribe.id;
          return (
            <g key={tribe.id} onClick={() => onSelectLocation(tribe)} style={{ cursor:"pointer" }}>
              <polygon points={tribe.points} fill={tribe.color}
                opacity={isSel ? 0.58 : 0.26}
                stroke={tribe.color}
                strokeWidth={isSel ? 1.8 : 0.9}
                strokeOpacity={isSel ? 0.9 : 0.55}
              />
              {isSel && <polygon points={tribe.points} fill="none" stroke={tribe.color} strokeWidth="3" strokeOpacity="0.18" />}
              <text x={tribe.cx} y={tribe.cy}
                fill={isSel ? tribe.color : P.ink}
                fontSize={tribe.label.length > 8 ? 2.6 : 3.0}
                fontFamily="'Nunito',sans-serif" fontWeight="800"
                textAnchor="middle" dominantBaseline="middle"
                opacity={isSel ? 1 : 0.82}
                style={{ filter:`drop-shadow(0 0 2.5px ${P.bg}) drop-shadow(0 0 2px ${P.bg})` }}
              >{tribe.label}</text>
            </g>
          );
        })}

        <rect x="0" y="0" width="90" height="110" fill="url(#vig-tribes)" pointerEvents="none" />
        <Compass x={81} y={9} />
      </svg>
    </MapCard>
  );
}