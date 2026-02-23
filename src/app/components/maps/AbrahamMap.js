"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  start: "#E8625C", stop: "#C06C3E", promise: "#D4A853",
  destination: "#1B7A6E", event: "#8B5CF6",
};

const locs = [
  { id:"ur",        x:82, y:62, label:"Ur",            type:"start",       side:"left"  },
  { id:"haran",     x:68, y:24, label:"Haran",         type:"stop",        side:"right" },
  { id:"shechem",   x:44, y:42, label:"Shechem",       type:"promise",     side:"left"  },
  { id:"bethel",    x:44, y:48, label:"Bethel",        type:"promise",     side:"left"  },
  { id:"hebron",    x:44, y:56, label:"Hebron",        type:"promise",     side:"left"  },
  { id:"egypt",     x:22, y:62, label:"Egypt",         type:"stop",        side:"right" },
  { id:"moriah",    x:45, y:52, label:"Mt. Moriah",    type:"event",       side:"right" },
  { id:"beersheba", x:40, y:62, label:"Beersheba",     type:"stop",        side:"left"  },
  { id:"canaan",    x:42, y:48, label:"Canaan",        type:"destination", side:"right" },
];

const journeyRoute = "M82,62 C75,50 70,38 68,24 C64,22 58,24 54,28 C50,32 48,36 46,40 C44,42 44,48 44,56 C36,58 28,60 22,62";

export const ABRAHAM_DETAILS = {
  ur:        { title:"Ur of the Chaldees — The Beginning", body:"God called Abraham out of Ur, one of the most sophisticated cities of the ancient world. Abraham left by faith — not knowing where he was going. This act of obedience launched the entire story of redemption.", scripture:"Genesis 12:1 — 'Now the LORD had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father's house, unto a land that I will shew thee.'" },
  haran:     { title:"Haran — The Halfway Stop",           body:"Abraham's father Terah led the family from Ur toward Canaan but stopped at Haran, where he died. After Terah's death, God renewed His call to Abraham. At 75 years old, Abraham departed Haran with Sarah, Lot, and all their possessions.", scripture:"Genesis 12:4 — 'So Abram departed, as the LORD had spoken unto him; and Lot went with him: and Abram was seventy and five years old when he departed out of Haran.'" },
  shechem:   { title:"Shechem — The First Promise",        body:"At Shechem, under the great oak of Moreh, God appeared to Abraham with the first land promise: 'Unto thy seed will I give this land.' Abraham built his first altar here — the beginning of a pattern of worship at every place God appeared to him.", scripture:"Genesis 12:6-7 — 'And Abram passed through the land unto the place of Sichem... And the LORD appeared unto Abram, and said, Unto thy seed will I give this land.'" },
  bethel:    { title:"Bethel — The Altar Between",         body:"Between Bethel and Ai, Abraham built another altar and called on the name of the LORD. He later returned to this same spot after his time in Egypt — to the altar he had made, and called on God's name again.", scripture:"Genesis 12:8 — 'And he removed from thence unto a mountain on the east of Bethel, and pitched his tent... and there he builded an altar unto the LORD.'" },
  hebron:    { title:"Hebron — Abraham's Home",            body:"Hebron became Abraham's main dwelling place, near the oaks of Mamre. God appeared to him here to announce the birth of Isaac. Sarah died here at 127. Abraham purchased the cave of Machpelah at Hebron as the first piece of land he owned in Canaan.", scripture:"Genesis 13:18 — 'Then Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto the LORD.'" },
  egypt:     { title:"Egypt — A Dangerous Detour",         body:"During a severe famine in Canaan, Abraham went down to Egypt. Fearing for his life because of Sarah's beauty, he asked her to say she was his sister. Pharaoh took Sarah, but God struck his house with plagues until she was returned. A preview of the later Exodus.", scripture:"Genesis 12:10 — 'And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.'" },
  moriah:    { title:"Mount Moriah — The Ultimate Test",   body:"God commanded Abraham to offer Isaac on Mount Moriah. Abraham obeyed, binding his son on the altar — but God stopped his hand and provided a ram instead. 'The LORD will provide.' A thousand years later, on this same mountain, God did not spare His own Son.", scripture:"Genesis 22:14 — 'And Abraham called the name of that place Jehovahjireh: as it is said to this day, In the mount of the LORD it shall be seen.'" },
  beersheba: { title:"Beersheba — The Well of the Oath",  body:"Abraham made a covenant with Abimelech at Beersheba over rights to a well — planting a tamarisk tree and calling on the name of the everlasting God. Beersheba became the southernmost boundary of the Promised Land — from Dan to Beersheba.", scripture:"Genesis 21:33 — 'And Abraham planted a grove in Beersheba, and called there on the name of the LORD, the everlasting God.'" },
  canaan:    { title:"Canaan — The Promised Land",         body:"God promised this entire land to Abraham and his descendants — from the river of Egypt to the great river Euphrates. Though Abraham owned only a burial cave, he lived as a stranger in the land of promise — looking for a city whose builder is God.", scripture:"Genesis 15:18 — 'In the same day the LORD made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates.'" },
};

export default function AbrahamMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#E8625C" label="Starting Point" />
      <LegendDot color="#C06C3E" label="Stop" />
      <LegendDot color="#D4A853" label="Promise / Altar" />
      <LegendDot color="#8B5CF6" label="Key Event" />
      <LegendDot color="#1B7A6E" label="Destination" />
    </>}>
      <svg viewBox="0 0 110 80" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-abr" />
        <ParchBg w={110} h={80} vigId="vig-abr" />

        {/* Mediterranean */}
        <polygon points="0,0 30,0 32,16 28,36 22,48 14,52 0,50 0,0" fill="url(#sea-abr)" opacity="0.78" />
        <HaloText x={8} y={28} text="MEDITERRANEAN" fontSize={2.4} bold opacity={0.55} color={P.inkFaint} />

        {/* Red Sea */}
        <polygon points="22,52 30,48 36,58 32,70 22,68 18,60" fill="url(#sea-abr)" opacity="0.65" />
        <HaloText x={22} y={66} text="RED SEA" fontSize={2.2} bold opacity={0.5} color={P.inkFaint} />

        {/* Persian Gulf */}
        <polygon points="76,66 90,64 94,78 72,80" fill="url(#sea-abr)" opacity="0.70" />
        <HaloText x={82} y={75} text="PERSIAN GULF" fontSize={2.2} bold opacity={0.55} color={P.inkFaint} />

        {/* Anatolia */}
        <polygon points="30,0 90,0 92,10 88,18 74,22 60,22 46,18 34,12" fill={P.land} opacity="0.82" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={62} y={12} text="ANATOLIA" fontSize={3} bold opacity={0.45} color={P.inkFaint} />

        {/* Mesopotamia */}
        <polygon points="60,20 90,16 96,28 92,44 84,52 74,56 66,52 60,40 58,28" fill={P.fertile} opacity="0.68" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={76} y={36} text="MESOPOTAMIA" fontSize={2.8} bold opacity={0.4} color={P.inkFaint} />

        {/* Canaan */}
        <polygon points="30,28 46,22 50,30 50,46 46,58 38,62 28,56 26,42 28,32" fill={P.fertile} opacity="0.70" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={36} y={40} text="CANAAN" fontSize={3.5} bold opacity={0.38} color={P.inkFaint} />

        {/* Egypt */}
        <polygon points="14,52 28,48 32,56 30,68 22,72 14,68 10,60" fill={P.desert} opacity="0.75" stroke={P.edge} strokeWidth="0.35" />
        <HaloText x={20} y={60} text="EGYPT" fontSize={2.8} bold opacity={0.45} color={P.inkFaint} />

        {/* Syria */}
        <polygon points="46,18 62,18 66,26 62,36 52,38 44,34 42,24" fill={P.land} opacity="0.72" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={54} y={28} text="SYRIA" fontSize={2.5} bold opacity={0.45} color={P.inkFaint} />

        {/* Euphrates river */}
        <path d="M66,22 C64,30 62,38 62,46 C62,54 64,60 66,68" fill="none" stroke="#7AAEC8" strokeWidth="1.6" opacity="0.65" strokeLinecap="round" />
        <HaloText x={58} y={44} text="Euphrates" fontSize={2.2} opacity={0.6} color={P.inkFaint} anchor="end" />

        {/* Jordan River */}
        <path d="M44,32 C44,38 44,46 44,54 C44,60 42,64 40,68" fill="none" stroke="#7AAEC8" strokeWidth="1.2" opacity="0.6" strokeLinecap="round" />

        {/* Dead Sea */}
        <ellipse cx="43" cy="58" rx="2.2" ry="4" fill="#7EB8D4" opacity="0.75" />

        {/* Journey route */}
        <path d={journeyRoute} fill="none" stroke="#D4A853" strokeWidth="1.6" strokeDasharray="4,2.5" opacity="0.85" />

        {/* Mountain at Moriah */}
        <polygon points="42,48 46,42 50,48" fill={P.mountain} opacity="0.45" />

        {/* Vignette */}
        <rect x="0" y="0" width="110" height="80" fill="url(#vig-abr)" pointerEvents="none" />

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