"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  origin: "#E8625C", city: "#C06C3E", river: "#1B7A6E",
  region: "#2E4A33", event: "#8B5CF6",
};

const locs = [
  { id:"eden",      x:68, y:42, label:"Garden of Eden",  type:"origin", side:"right" },
  { id:"tigris",    x:72, y:38, label:"Tigris",          type:"river",  side:"right" },
  { id:"euphrates", x:60, y:40, label:"Euphrates",       type:"river",  side:"left"  },
  { id:"ararat",    x:65, y:22, label:"Mt. Ararat",      type:"event",  side:"right" },
  { id:"babel",     x:66, y:50, label:"Tower of Babel",  type:"city",   side:"right" },
  { id:"ur",        x:72, y:58, label:"Ur of the Chaldees", type:"city", side:"right" },
  { id:"haran",     x:62, y:28, label:"Haran",           type:"city",   side:"left"  },
  { id:"nile",      x:28, y:52, label:"Nile",            type:"river",  side:"left"  },
  { id:"cush",      x:38, y:62, label:"Cush (Ethiopia)", type:"region", side:"right" },
  { id:"canaan",    x:42, y:40, label:"Canaan",          type:"region", side:"left"  },
];

export const EDEN_DETAILS = {
  eden:      { title:"Garden of Eden",          body:"God planted a garden eastward in Eden — a paradise of every tree pleasant to the sight and good for food. Four rivers flowed from Eden to water the earth. Adam named every living creature here, and Eve was formed from Adam's rib. Their fall into sin changed everything.", scripture:"Genesis 2:8-9 — 'And the LORD God planted a garden eastward in Eden; and there he put the man whom he had formed.'" },
  tigris:    { title:"The River Hiddekel (Tigris)", body:"One of the four rivers flowing out of Eden — 'the third river is Hiddekel: that is it which goeth toward the east of Assyria.' The Tigris runs through modern-day Turkey and Iraq, flowing into the Persian Gulf.", scripture:"Genesis 2:14 — 'And the name of the third river is Hiddekel: that is it which goeth toward the east of Assyria.'" },
  euphrates: { title:"The River Euphrates",     body:"The fourth and most prominent of Eden's rivers — the only one named without further description, as if its fame needed no explanation. The Euphrates became the great river of Abraham's world, forming the eastern boundary of the Promised Land.", scripture:"Genesis 2:14 — 'And the fourth river is Euphrates.'" },
  ararat:    { title:"Mount Ararat",            body:"After 150 days on the waters of the great flood, Noah's ark came to rest on the mountains of Ararat. From here, Noah's three sons — Shem, Ham, and Japheth — repopulated the entire earth. All nations trace their origin to this mountain.", scripture:"Genesis 8:4 — 'And the ark rested in the seventh month, on the seventeenth day of the month, upon the mountains of Ararat.'" },
  babel:     { title:"The Tower of Babel",      body:"In the plain of Shinar, all humanity gathered to build a tower reaching to heaven — to make a name for themselves. God confused their language and scattered them across the earth. From Babel came all the world's languages and nations.", scripture:"Genesis 11:4 — 'And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name.'" },
  ur:        { title:"Ur of the Chaldees",      body:"The great Sumerian city of Ur — one of the most advanced cities of the ancient world — was Abraham's birthplace. God called Abraham to leave this prosperous metropolis by faith, not knowing where he was going. Ur was located in modern southern Iraq.", scripture:"Genesis 11:31 — 'And Terah took Abram his son... and they went forth with them from Ur of the Chaldees, to go into the land of Canaan.'" },
  haran:     { title:"Haran",                   body:"The city of Haran in northern Mesopotamia (modern Turkey) was where Terah stopped on the journey from Ur, and where he died at 205 years old. God later called Abraham to continue the journey from Haran to Canaan at age 75.", scripture:"Genesis 12:1 — 'Now the LORD had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father's house, unto a land that I will shew thee.'" },
  nile:      { title:"The River Nile",          body:"The great river of Egypt — the gift of the Nile sustained one of history's greatest civilisations. In Scripture, Egypt and the Nile represent the world system that God calls His people out of. Moses was drawn from its waters; Israel was delivered across the Red Sea from its shadow.", scripture:"Genesis 41:1 — 'And it came to pass at the end of two full years, that Pharaoh dreamed: and, behold, he stood by the river.'" },
  cush:      { title:"Cush (Ethiopia)",         body:"One of the sons of Ham, Cush became father of the peoples of the region south of Egypt — modern Ethiopia and Sudan. The Bible associates Cush with Nimrod, who built Babylon and Nineveh. The Ethiopian eunuch in Acts 8 was from this ancient land.", scripture:"Genesis 10:6 — 'And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.'" },
  canaan:    { title:"The Land of Canaan",      body:"Named after Ham's son Canaan, this land became the focus of God's redemptive plan. Promised to Abraham, Isaac, and Jacob, it was the destination of the Exodus and the inheritance of the twelve tribes — the land flowing with milk and honey.", scripture:"Genesis 12:7 — 'And the LORD appeared unto Abram, and said, Unto thy seed will I give this land.'" },
};

export default function EdenMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#E8625C" label="Origin" />
      <LegendDot color="#1B7A6E" label="River" />
      <LegendDot color="#C06C3E" label="City" />
      <LegendDot color="#8B5CF6" label="Key Event" />
      <LegendDot color="#2E4A33" label="Region" />
    </>}>
      <svg viewBox="0 0 110 80" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-eden" />
        <ParchBg w={110} h={80} vigId="vig-eden" />

        {/* Persian Gulf */}
        <polygon points="68,62 85,62 90,80 60,80" fill="url(#sea-eden)" opacity="0.75" />
        <HaloText x={78} y={74} text="PERSIAN GULF" fontSize={2.5} bold opacity={0.6} color={P.inkFaint} />

        {/* Mediterranean */}
        <polygon points="0,0 35,0 38,20 34,40 28,50 18,52 0,48 0,0" fill="url(#sea-eden)" opacity="0.75" />
        <HaloText x={10} y={28} text="MEDITERRANEAN" fontSize={2.4} bold opacity={0.55} color={P.inkFaint} />

        {/* Red Sea */}
        <polygon points="28,52 36,50 40,62 34,72 24,70 22,60" fill="url(#sea-eden)" opacity="0.65" />
        <HaloText x={26} y={66} text="RED SEA" fontSize={2.2} bold opacity={0.55} color={P.inkFaint} />

        {/* Caspian Sea */}
        <ellipse cx="84" cy="14" rx="6" ry="9" fill="url(#sea-eden)" opacity="0.60" />
        <HaloText x={84} y={10} text="CASPIAN" fontSize={2.2} bold opacity={0.5} color={P.inkFaint} />

        {/* Land masses */}
        {/* Anatolia / Asia Minor */}
        <polygon points="34,0 80,0 82,8 78,16 64,20 52,22 40,18 34,10" fill={P.land} opacity="0.85" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={58} y={12} text="ANATOLIA" fontSize={3} bold opacity={0.5} color={P.inkFaint} />

        {/* Mesopotamia (fertile crescent) */}
        <polygon points="54,20 80,14 88,22 86,38 78,46 68,50 58,48 52,40 50,28" fill={P.fertile} opacity="0.72" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={68} y={34} text="MESOPOTAMIA" fontSize={3} bold opacity={0.45} color={P.inkFaint} />

        {/* Canaan / Levant */}
        <polygon points="34,24 48,20 52,28 50,42 44,48 36,46 32,36" fill={P.fertile} opacity="0.65" stroke={P.edge} strokeWidth="0.35" />

        {/* Egypt */}
        <polygon points="18,50 34,46 36,52 34,64 26,70 18,66 14,56" fill={P.desert} opacity="0.78" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={24} y={58} text="EGYPT" fontSize={3} bold opacity={0.5} color={P.inkFaint} />

        {/* Arabia */}
        <polygon points="40,48 68,50 72,62 66,76 48,78 36,68 36,54" fill={P.desert} opacity="0.65" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={52} y={66} text="ARABIA" fontSize={3.5} bold opacity={0.35} color={P.inkFaint} />

        {/* Ararat mountain */}
        <polygon points="62,18 66,10 70,18" fill={P.mountain} opacity="0.55" />
        <polygon points="64,20 68,13 72,20" fill={P.mountain} opacity="0.45" />

        {/* Euphrates river */}
        <path d="M52,22 C54,28 58,34 60,40 C62,46 66,50 68,56" fill="none" stroke="#7AAEC8" strokeWidth="1.8" opacity="0.7" strokeLinecap="round" />

        {/* Tigris river */}
        <path d="M62,20 C64,28 68,36 72,44 C74,50 74,56 72,62" fill="none" stroke="#7AAEC8" strokeWidth="1.4" opacity="0.6" strokeLinecap="round" />

        {/* Nile river */}
        <path d="M26,52 C27,44 28,36 28,28 C28,20 26,12 24,4" fill="none" stroke="#7AAEC8" strokeWidth="1.4" opacity="0.6" strokeLinecap="round" />

        {/* Vignette */}
        <rect x="0" y="0" width="110" height="80" fill="url(#vig-eden)" pointerEvents="none" />

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