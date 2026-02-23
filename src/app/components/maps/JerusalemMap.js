"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  temple:  "#D4A853", passion: "#E8625C", ministry: "#1B7A6E",
  gate:    "#C06C3E", pool:    "#8B5CF6",
};

const locs = [
  { id:"temple_mount", x:56, y:42, label:"Temple Mount",     type:"temple",  side:"right" },
  { id:"holy_of_holies",x:55,y:38, label:"Holy of Holies",   type:"temple",  side:"right" },
  { id:"golgotha",     x:42, y:36, label:"Golgotha",         type:"passion", side:"left"  },
  { id:"upper_room",   x:46, y:54, label:"Upper Room",       type:"ministry",side:"left"  },
  { id:"gethsemane",   x:62, y:40, label:"Gethsemane",       type:"passion", side:"right" },
  { id:"pool_siloam",  x:52, y:58, label:"Pool of Siloam",   type:"pool",    side:"left"  },
  { id:"pool_bethesda",x:56, y:34, label:"Pool of Bethesda", type:"pool",    side:"right" },
  { id:"praetorium",   x:46, y:40, label:"Praetorium",       type:"passion", side:"left"  },
  { id:"antonia",      x:56, y:36, label:"Antonia Fortress", type:"gate",    side:"right" },
  { id:"kidron",       x:64, y:46, label:"Kidron Valley",    type:"ministry",side:"right" },
];

export const JERUSALEM_DETAILS = {
  temple_mount: { title:"The Temple Mount",                  body:"Herod the Great spent 46 years expanding the Temple Mount into the largest religious precinct in the ancient world — a platform of 144,000 square metres supported by massive retaining walls. Jesus walked its courts, drove out the money changers, taught daily in its porticoes, and predicted its total destruction. In AD 70 every stone was cast down.", scripture:"Mark 11:15 — 'And they come to Jerusalem: and Jesus went into the temple, and began to cast out them that sold and bought in the temple.'" },
  holy_of_holies: { title:"The Holy of Holies",              body:"The innermost sanctuary of the Temple — a perfect cube of 30 feet, shrouded in darkness, entered only by the High Priest once a year on the Day of Atonement. A thick veil 60 feet high separated it from the world. At the moment Jesus died, the veil was torn in two from top to bottom — the way into God's presence now open to all.", scripture:"Matthew 27:51 — 'And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent.'" },
  golgotha:     { title:"Golgotha — The Place of the Skull", body:"Outside the city wall, Jesus was crucified between two criminals at Golgotha — 'the place of a skull.' For six hours He hung on the cross, taking the sin of the world upon Himself. At the ninth hour He cried: 'It is finished.' The sun refused to shine for three hours. The earth shook. The centurion declared: 'Truly this was the Son of God.'", scripture:"John 19:17-18 — 'And he bearing his cross went forth into a place called the place of a skull, which is called in the Hebrew Golgotha: Where they crucified him.'" },
  upper_room:   { title:"The Upper Room",                    body:"A large furnished upper room in Jerusalem was the setting of the Last Supper — where Jesus washed His disciples' feet, broke the bread and the cup, and spoke His farewell discourse (John 13-17). After the resurrection this same room became the prayer meeting place for 120 disciples awaiting Pentecost. The church was born here.", scripture:"Luke 22:19-20 — 'And he took bread, and gave thanks, and brake it, and gave unto them, saying, This is my body which is given for you: this do in remembrance of me.'" },
  gethsemane:   { title:"Gethsemane — The Agony",            body:"After the Last Supper, Jesus crossed the Kidron Valley to the Garden of Gethsemane on the Mount of Olives. He prayed three times: 'Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done.' His sweat was like drops of blood. An angel strengthened Him. Then Judas came with soldiers.", scripture:"Luke 22:42-44 — 'Not my will, but thine, be done. And there appeared an angel unto him from heaven, strengthening him.'" },
  pool_siloam:  { title:"The Pool of Siloam",                body:"Fed by Hezekiah's tunnel, the Pool of Siloam supplied Jerusalem with water. Jesus sent a man blind from birth to wash here after anointing his eyes with clay. 'He went his way therefore, and washed, and came seeing.' In 2004 archaeologists discovered the original first-century Pool of Siloam.", scripture:"John 9:7 — 'Go, wash in the pool of Siloam... He went his way therefore, and washed, and came seeing.'" },
  pool_bethesda: { title:"The Pool of Bethesda",             body:"Near the Sheep Gate, the Pool of Bethesda had five porches filled with sick people — blind, lame, paralysed — waiting for the water to stir. Jesus came to a man who had been ill for 38 years and said: 'Rise, take up thy bed, and walk.' The man took up his bed and walked. This healing was on the Sabbath — inflaming the Pharisees.", scripture:"John 5:8-9 — 'Jesus saith unto him, Rise, take up thy bed, and walk. And immediately the man was made whole.'" },
  praetorium:   { title:"The Praetorium — Pilate's Judgment Hall", body:"Pontius Pilate's Jerusalem headquarters — probably Herod's palace in the Upper City — was where Jesus stood before the Roman governor. Pilate found no fault in Him but yielded to the crowd's demands. He publicly washed his hands: 'I am innocent of the blood of this just person.' The crowd cried: 'His blood be on us, and on our children.'", scripture:"John 18:38 — 'And when he had said this, he went out again unto the Jews, and saith unto them, I find in him no fault at all.'" },
  antonia:      { title:"The Antonia Fortress",              body:"Herod's massive fortress adjacent to the Temple Mount — named after Mark Antony — housed the Roman garrison that kept watch over the Temple courts. Paul was arrested in the Temple courts and carried up the steps of Antonia, where he addressed the crowd in Hebrew. Peter was imprisoned here by Herod Agrippa before an angel released him.", scripture:"Acts 21:34-35 — 'And when he came upon the stairs, so it was, that he was borne of the soldiers for the violence of the people.'" },
  kidron:       { title:"The Kidron Valley",                 body:"The Kidron Valley separated Jerusalem from the Mount of Olives. Jesus crossed it on the night of His arrest to reach Gethsemane. David had crossed it weeping when fleeing Absalom. The valley is lined with ancient tombs. At the end of the age, the nations will be judged in the 'valley of decision' nearby — the Valley of Jehoshaphat.", scripture:"John 18:1 — 'When Jesus had spoken these words, he went forth with his disciples over the brook Cedron, where was a garden, into the which he entered.'" },
};

export default function JerusalemMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#D4A853" label="Temple" />
      <LegendDot color="#E8625C" label="Passion Sites" />
      <LegendDot color="#1B7A6E" label="Ministry" />
      <LegendDot color="#8B5CF6" label="Pools" />
      <LegendDot color="#C06C3E" label="Gates / Fortress" />
    </>}>
      <svg viewBox="0 0 90 80" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-jeru" />
        <ParchBg w={90} h={80} vigId="vig-jeru" />

        {/* Outer city boundary */}
        <polygon
          points="28,20 56,18 68,24 72,36 70,52 64,62 52,68 36,68 24,60 20,46 22,32"
          fill={P.land} opacity="0.60" stroke={P.edge} strokeWidth="0.8"
        />

        {/* Temple Mount platform */}
        <rect x="50" y="30" width="20" height="22" rx="1" fill={P.desert} opacity="0.75" stroke="#B8860B" strokeWidth="0.8" />
        <HaloText x={60} y={40} text="TEMPLE MOUNT" fontSize={2.4} bold opacity={0.65} color="#B8860B" />

        {/* Inner Temple */}
        <rect x="52" y="33" width="10" height="12" rx="0.5" fill="#D4A853" opacity="0.45" stroke="#B8860B" strokeWidth="0.6" />

        {/* Upper City - west */}
        <polygon points="28,34 46,30 50,38 48,56 42,62 28,60 22,50 24,38" fill={P.fertile} opacity="0.38" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={34} y={46} text="UPPER CITY" fontSize={2.2} bold opacity={0.45} color={P.inkFaint} />

        {/* Lower City */}
        <polygon points="44,54 60,52 64,62 52,68 40,66 38,58" fill={P.land} opacity="0.40" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={50} y={62} text="LOWER CITY" fontSize={2.2} bold opacity={0.4} color={P.inkFaint} />

        {/* Kidron Valley */}
        <polygon points="70,28 82,28 84,52 72,56 68,44 68,32" fill="url(#sea-jeru)" opacity="0.22" />
        <HaloText x={76} y={42} text="KIDRON" fontSize={2.2} bold opacity={0.45} color={P.inkFaint} />

        {/* Mount of Olives */}
        <polygon points="70,22 80,18 86,26 82,34 70,32" fill={P.mountain} opacity="0.38" />
        <HaloText x={78} y={26} text="Mt. of Olives" fontSize={2.2} bold opacity={0.5} color={P.inkFaint} />

        {/* Hinnom Valley */}
        <path d="M24,60 C28,66 36,70 46,70 C54,70 62,66 64,62" fill="none" stroke="#7AAEC8" strokeWidth="1.2" opacity="0.45" />
        <HaloText x={42} y={74} text="Hinnom Valley" fontSize={2.2} opacity={0.4} color={P.inkFaint} />

        {/* Golgotha - outside walls */}
        <polygon points="30,20 38,16 42,22 36,26 28,24" fill={P.mountain} opacity="0.35" />

        {/* City walls - outer */}
        <polygon points="28,20 56,18 68,24 72,36 70,52 64,62 52,68 36,68 24,60 20,46 22,32"
          fill="none" stroke={P.edge} strokeWidth="1.4" strokeOpacity="0.7" />

        {/* Second wall (northern) */}
        <path d="M36,26 C42,22 50,20 56,22 C60,24 64,28 66,32"
          fill="none" stroke={P.edge} strokeWidth="0.8" strokeDasharray="2,1.5" opacity="0.55" />

        {/* Hezekiah's tunnel hint */}
        <path d="M38,52 C44,52 50,54 52,58" fill="none" stroke="#7AAEC8" strokeWidth="1.2" strokeDasharray="1.5,1" opacity="0.55" />

        {/* Vignette */}
        <rect x="0" y="0" width="90" height="80" fill="url(#vig-jeru)" pointerEvents="none" />

        {locs.map(loc => (
          <Dot key={loc.id} cx={loc.x} cy={loc.y} r={2.8}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label} side={loc.side}
          />
        ))}

        <Compass x={82} y={6} />
      </svg>
    </MapCard>
  );
}