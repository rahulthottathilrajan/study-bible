"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  start: "#E8625C", route: "#C06C3E", miracle: "#D4A853",
  camp: "#2E4A33", milestone: "#8B5CF6", destination: "#1B7A6E",
};

const locs = [
  { id:"rameses",    x:73, y:32, label:"Rameses",          type:"start",       side:"right" },
  { id:"succoth",    x:80, y:38, label:"Succoth",          type:"route",       side:"right" },
  { id:"etham",      x:84, y:45, label:"Etham",            type:"route",       side:"right" },
  { id:"pihahiroth", x:81, y:54, label:"Pi-hahiroth",      type:"route",       side:"left"  },
  { id:"redsea",     x:76, y:62, label:"Red Sea Crossing", type:"miracle",     side:"left"  },
  { id:"marah",      x:70, y:69, label:"Marah",            type:"route",       side:"left"  },
  { id:"elim",       x:65, y:75, label:"Elim",             type:"camp",        side:"left"  },
  { id:"sinai",      x:59, y:88, label:"Mount Sinai",      type:"milestone",   side:"right" },
  { id:"kadesh",     x:43, y:70, label:"Kadesh Barnea",    type:"milestone",   side:"left"  },
  { id:"canaan",     x:33, y:35, label:"Canaan",           type:"destination", side:"left"  },
];

const route = "M73,32 L80,38 L84,45 L81,54 L76,62 L70,69 L65,75 L59,88 L43,70 L33,35";

export const EXODUS_DETAILS = {
  rameses:    { title:"Rameses (Goshen)",               body:"The Israelites lived and laboured in the region of Goshen, in the city of Rameses. This was their starting point after 430 years in Egypt. The pharaoh who refused Moses is believed by many scholars to be Ramesses II.", scripture:"Exodus 12:37 — 'And the children of Israel journeyed from Rameses to Succoth, about six hundred thousand on foot that were men, beside children.'" },
  succoth:    { title:"Succoth",                        body:"The first campsite after leaving Egypt, meaning 'booths' or 'shelters.' Around 600,000 men plus women and children — perhaps 2 million people — began their march to freedom here.", scripture:"Exodus 12:37 — 'And the children of Israel journeyed from Rameses to Succoth...'" },
  etham:      { title:"Etham",                          body:"On the edge of the wilderness, the Israelites camped at Etham. It was here that God first appeared as a pillar of cloud by day and a pillar of fire by night — leading every step of the journey.", scripture:"Exodus 13:20-21 — 'And the LORD went before them by day in a pillar of a cloud...'" },
  pihahiroth: { title:"Pi-hahiroth",                    body:"Trapped between the sea and Pharaoh's pursuing army, Israel cried out in fear. But Moses declared: 'Fear ye not, stand still, and see the salvation of the LORD.' This was the moment before the greatest miracle of the Old Testament.", scripture:"Exodus 14:2 — 'Speak unto the children of Israel, that they turn and encamp before Pi-hahiroth...'" },
  redsea:     { title:"The Red Sea Crossing",           body:"God commanded Moses to stretch out his rod, and the sea parted — creating walls of water on both sides. Israel crossed on dry ground. When Pharaoh's army pursued, the waters returned and swallowed them whole.", scripture:"Exodus 14:21-22 — 'And Moses stretched out his hand over the sea... and the children of Israel went into the midst of the sea upon the dry ground.'" },
  marah:      { title:"Marah — The Bitter Waters",      body:"After the triumph of the Red Sea, Israel faced bitter, undrinkable water. God showed Moses a tree — when cast into the water, it became sweet. A picture of the cross transforming bitterness into blessing.", scripture:"Exodus 15:23 — 'And when they came to Marah, they could not drink of the waters of Marah; for they were bitter.'" },
  elim:       { title:"Elim — The Oasis",               body:"After Marah's bitterness came Elim's abundance: twelve wells of water and seventy palm trees. The twelve wells matched the twelve tribes; the seventy palms, the seventy elders.", scripture:"Exodus 15:27 — 'And they came to Elim, where were twelve wells of water, and threescore and ten palm trees.'" },
  sinai:      { title:"Mount Sinai — The Law Given",    body:"The most significant campsite of the entire Exodus. Here God descended in fire and thunder, and gave Moses the Ten Commandments. The covenant between God and Israel was sealed at this mountain.", scripture:"Exodus 19:2-3 — 'There Israel camped before the mount. And Moses went up unto God, and the LORD called unto him out of the mountain.'" },
  kadesh:     { title:"Kadesh Barnea — The Turning Point", body:"From Kadesh, twelve spies were sent into Canaan. Ten returned with a fearful report; only Joshua and Caleb trusted God. Because of their unbelief, Israel was sentenced to 40 years of wilderness wandering.", scripture:"Numbers 13:26 — 'And they... came to Moses, and to Aaron, and to all the congregation... and shewed them the fruit of the land.'" },
  canaan:     { title:"Canaan — The Promised Land",     body:"The destination of the entire Exodus. God had promised this land to Abraham, Isaac, and Jacob — and now, 40 years after leaving Egypt, Joshua led the people across the Jordan into their inheritance.", scripture:"Joshua 1:2 — 'Moses my servant is dead; now therefore arise, go over this Jordan, thou, and all this people, unto the land which I do give to them.'" },
};

export default function ExodusMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#E8625C" label="Start / End" />
      <LegendDot color="#D4A853" label="Miracle" />
      <LegendDot color="#8B5CF6" label="Milestone" />
      <LegendDot color="#2E4A33" label="Camp" />
    </>}>
      <svg viewBox="0 0 120 110" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-ex" />
        <ParchBg w={120} h={110} vigId="vig-ex" />
        <rect x="0" y="0" width="120" height="27" fill="url(#sea-ex)" opacity="0.88" />
        <HaloText x={26} y={17} text="MEDITERRANEAN  SEA" fontSize={3.5} bold opacity={0.7} color={P.inkFaint} />
        <polygon points="72,53 90,53 96,110 78,110" fill="url(#sea-ex)" opacity="0.75" />
        <polygon points="56,72 67,72 68,110 54,110" fill="url(#sea-ex)" opacity="0.55" />
        <HaloText x={86} y={86} text="RED SEA" fontSize={3} bold opacity={0.6} color={P.inkFaint} />
        <ellipse cx="58" cy="28" rx="16" ry="6" fill={P.fertile} opacity="0.65" />
        <path d="M58,6 C59,14 57,20 58,28" fill="none" stroke="#8ABFD0" strokeWidth="1.6" opacity="0.7" />
        <HaloText x={46} y={24} text="Nile Delta" fontSize={2.5} opacity={0.7} color={P.inkFaint} />
        <polygon points="44,27 96,27 97,54 90,53 84,50 80,56 76,64 70,72 62,90 52,110 44,110" fill={P.desert} opacity="0.72" />
        <HaloText x={74} y={40} text="EGYPT" fontSize={6} opacity={0.22} color={P.inkFaint} bold />
        <polygon points="50,52 82,52 80,60 76,66 68,76 60,92 50,110 44,110 44,62" fill={P.land} opacity="0.78" />
        <HaloText x={59} y={77} text="SINAI" fontSize={4} opacity={0.38} color={P.inkFaint} bold />
        <polygon points="22,27 46,27 46,68 42,78 36,82 22,72 20,50 22,36" fill={P.fertile} opacity="0.68" />
        <HaloText x={28} y={46} text="CANAAN" fontSize={4} opacity={0.5} color={P.inkFaint} bold />
        <polygon points="57,84 62,72 67,84" fill={P.mountain} opacity="0.35" />
        <polygon points="61,86 66,76 71,86" fill={P.mountain} opacity="0.30" />
        <rect x="0" y="0" width="120" height="110" fill="url(#vig-ex)" pointerEvents="none" />
        <path d={route} fill="none" stroke="#C06C3E" strokeWidth="1.5" strokeDasharray="4,2.5" opacity="0.9" />
        {locs.map(loc => (
          <Dot key={loc.id} cx={loc.x} cy={loc.y} r={3}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label} side={loc.side}
          />
        ))}
        <Compass x={110} y={9} />
      </svg>
    </MapCard>
  );
}