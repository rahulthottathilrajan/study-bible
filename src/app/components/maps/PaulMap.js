"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard } from "./shared";

const j1 = "#E8625C", j2 = "#1B7A6E", j3 = "#8B5CF6";

const cities = [
  { id:"antioch",      x:68, y:30, label:"Antioch",      journey:[1,2,3], side:"right" },
  { id:"jerusalem",    x:66, y:44, label:"Jerusalem",    journey:[1,2,3], side:"right" },
  { id:"caesarea",     x:64, y:39, label:"Caesarea",     journey:[2,3],   side:"right" },
  { id:"cyprus",       x:57, y:37, label:"Cyprus",       journey:[1],     side:"left"  },
  { id:"perga",        x:60, y:32, label:"Perga",        journey:[1,2],   side:"left"  },
  { id:"iconium",      x:64, y:26, label:"Iconium",      journey:[1,2],   side:"right" },
  { id:"lystra",       x:61, y:29, label:"Lystra",       journey:[1,2],   side:"left"  },
  { id:"ephesus",      x:51, y:28, label:"Ephesus",      journey:[3],     side:"left"  },
  { id:"philippi",     x:36, y:19, label:"Philippi",     journey:[2,3],   side:"left"  },
  { id:"thessalonica", x:39, y:23, label:"Thessalonica", journey:[2,3],   side:"left"  },
  { id:"athens",       x:38, y:32, label:"Athens",       journey:[2],     side:"left"  },
  { id:"corinth",      x:35, y:35, label:"Corinth",      journey:[2,3],   side:"left"  },
  { id:"rome",         x:18, y:21, label:"Rome",         journey:[3],     side:"right" },
];

const dotColor = c => c.journey.length > 1 ? "#D4A853" : c.journey[0] === 1 ? j1 : c.journey[0] === 2 ? j2 : j3;

export const PAUL_DETAILS = {
  antioch:      { title:"Antioch — The Sending Church",      body:"Antioch of Syria was the launching pad of all three of Paul's missionary journeys. It was here that believers were first called 'Christians.' The Holy Spirit said: 'Separate me Barnabas and Saul for the work whereunto I have called them.'", scripture:"Acts 13:1-3 — 'As they ministered to the Lord, and fasted, the Holy Ghost said, Separate me Barnabas and Saul...'" },
  cyprus:       { title:"Cyprus — First Stop",               body:"Paul's first journey began on the island of Cyprus, homeland of Barnabas. Here the Roman proconsul Sergius Paulus became a believer after Paul struck the sorcerer Elymas with blindness.", scripture:"Acts 13:4-12 — 'Then the deputy, when he saw what was done, believed, being astonished at the doctrine of the Lord.'" },
  philippi:     { title:"Philippi — First Church in Europe", body:"At Philippi, Paul received the Macedonian call — 'Come over into Macedonia and help us.' The first European convert was Lydia. Paul and Silas sang hymns in prison at midnight — until an earthquake opened every door.", scripture:"Acts 16:12-40 — 'And at midnight Paul and Silas prayed, and sang praises unto God...'" },
  thessalonica: { title:"Thessalonica",                      body:"Paul preached here for three Sabbaths and many believed, but a riot drove him out. He later wrote 1 and 2 Thessalonians — containing the Bible's clearest teaching on the return of Christ.", scripture:"Acts 17:1-9 — 'These that have turned the world upside down are come hither also.'" },
  athens:       { title:"Athens — Mars Hill",                body:"At Athens, Paul stood on the Areopagus and delivered one of the most remarkable sermons in Scripture — beginning with their altar 'To the Unknown God' and ending with the resurrection of Christ.", scripture:"Acts 17:22-23 — 'Ye men of Athens, I perceive that in all things ye are too superstitious... I found an altar with this inscription, TO THE UNKNOWN GOD.'" },
  corinth:      { title:"Corinth — Eighteen Months",         body:"Paul spent 18 months in Corinth — longer than almost any other city. He worked as a tentmaker with Priscilla and Aquila. He wrote Romans from Corinth.", scripture:"Acts 18:1-18 — 'And he continued there a year and six months, teaching the word of God among them.'" },
  ephesus:      { title:"Ephesus — Three Years",             body:"Paul spent nearly three years in Ephesus — more than any other city. The church became a hub for all of Asia Minor. Home of the great temple of Artemis, one of the seven wonders of the ancient world.", scripture:"Acts 19:10 — 'This continued by the space of two years; so that all they which dwelt in Asia heard the word of the Lord.'" },
  rome:         { title:"Rome — The End and the Beginning",  body:"Paul arrived in Rome as a prisoner — yet he was allowed his own rented house where he preached freely for two years. The gospel had reached the capital of the empire.", scripture:"Acts 28:30-31 — 'Paul dwelt two whole years in his own hired house... preaching the kingdom of God... with all confidence, no man forbidding him.'" },
  jerusalem:    { title:"Jerusalem — The Heart of it All",   body:"Every journey ended with Paul returning to Jerusalem — to report to the apostles and remain connected to the Jewish roots of the gospel. His final visit led to his arrest and ultimately to Rome.", scripture:"Acts 21:17 — 'And when we were come to Jerusalem, the brethren received us gladly.'" },
  iconium:      { title:"Iconium",                           body:"Paul and Barnabas preached boldly in Iconium and a great multitude believed. But opposition arose and they fled when a plot to stone them was discovered.", scripture:"Acts 14:1-7 — 'Long time therefore abode they speaking boldly in the Lord...'" },
  lystra:       { title:"Lystra — Where Paul Was Stoned",    body:"At Lystra, Paul healed a man lame from birth. Then Jews stirred up the crowd and Paul was stoned and dragged out of the city, left for dead. He rose up and went back in.", scripture:"Acts 14:8-20 — 'Who, having stoned Paul, drew him out of the city, supposing he had been dead.'" },
  perga:        { title:"Perga",                             body:"Perga was where John Mark departed from the first missionary journey — a decision Paul felt strongly about, leading to a sharp disagreement with Barnabas on the second journey.", scripture:"Acts 13:13 — 'John departing from them returned to Jerusalem.'" },
  caesarea:     { title:"Caesarea Maritima",                 body:"The Roman administrative capital of Judea. Here Cornelius, the first Gentile convert, received the Holy Spirit. Paul was imprisoned here for two years before his voyage to Rome.", scripture:"Acts 10:1 — 'There was a certain man in Caesarea called Cornelius, a centurion of the band called the Italian band.'" },
};

export default function PaulMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      {[[j1,"1st Journey","Acts 13–14"],[j2,"2nd Journey","Acts 15–18"],[j3,"3rd Journey","Acts 18–21"]].map(([color, label, ref]) => (
        <div key={label} style={{ display:"flex", alignItems:"center", gap:5 }}>
          <div style={{ width:22, height:3, background:color, borderRadius:2, opacity:0.9 }} />
          <div>
            <div style={{ fontFamily:"'Nunito',sans-serif", fontSize:9.5, fontWeight:700, color:P.inkFaint }}>{label}</div>
            <div style={{ fontFamily:"'Nunito',sans-serif", fontSize:8, color:P.inkFaint, opacity:0.65 }}>{ref}</div>
          </div>
        </div>
      ))}
    </>}>
      <svg viewBox="0 0 100 70" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-paul" />
        <ParchBg w={100} h={70} vigId="vig-paul" />
        <rect x="0" y="0" width="100" height="70" fill="url(#sea-paul)" opacity="0.62" />
        <HaloText x={16} y={56} text="MEDITERRANEAN  SEA" fontSize={3.8} bold opacity={0.45} color={P.inkFaint} />
        <polygon points="16,6 24,4 27,10 26,22 24,30 20,38 16,38 12,30 11,18" fill={P.land} opacity="0.9" stroke={P.edge} strokeWidth="0.4" />
        <polygon points="20,40 28,38 30,44 24,46 18,44" fill={P.land} opacity="0.85" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={17} y={22} text="ITALY" fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <ellipse cx="18" cy="28" rx="2.5" ry="4" fill={P.land} opacity="0.6" stroke={P.edge} strokeWidth="0.3" />
        <polygon points="30,12 44,10 47,16 46,26 44,36 40,40 36,40 32,34 30,22" fill={P.land} opacity="0.9" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={33} y={24} text="GREECE" fontSize={2.8} bold opacity={0.55} color={P.inkFaint} />
        <polygon points="30,8 46,6 48,12 44,12 30,14" fill={P.fertile} opacity="0.65" stroke={P.edge} strokeWidth="0.3" />
        <polygon points="44,6 80,5 82,14 80,28 74,38 58,40 50,36 46,28 46,16" fill={P.land} opacity="0.9" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={62} y={20} text="ASIA MINOR" fontSize={3.5} bold opacity={0.55} color={P.inkFaint} />
        <polygon points="60,26 80,24 82,46 70,52 62,50 58,42" fill={P.land} opacity="0.88" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={70} y={36} text="SYRIA" fontSize={2.8} bold opacity={0.5} color={P.inkFaint} />
        <polygon points="52,33 62,31 63,38 56,40 50,38" fill={P.land} opacity="0.82" stroke={P.edge} strokeWidth="0.3" />
        <polygon points="0,48 100,48 100,70 0,70" fill={P.desert} opacity="0.72" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={30} y={60} text="NORTH AFRICA" fontSize={3} bold opacity={0.5} color={P.inkFaint} />
        <polyline points="68,30 57,37 60,32 61,29 64,26 68,30 66,44" fill="none" stroke={j1} strokeWidth="1.3" strokeDasharray="3.5,2" opacity="0.88" />
        <polyline points="68,30 64,26 61,29 39,23 35,35 38,30 64,40 68,30" fill="none" stroke={j2} strokeWidth="1.3" strokeDasharray="2,2" opacity="0.88" />
        <polyline points="68,30 51,28 38,32 18,21 38,32 66,42 68,30" fill="none" stroke={j3} strokeWidth="1.4" strokeDasharray="4.5,2" opacity="0.88" />
        <rect x="0" y="0" width="100" height="70" fill="url(#vig-paul)" pointerEvents="none" />
        {cities.map(city => (
          <Dot key={city.id} cx={city.x} cy={city.y}
            r={city.journey.length > 1 ? 3 : 2.5}
            color={dotColor(city)}
            selected={selectedLocation?.id === city.id}
            onClick={() => onSelectLocation(city)}
            label={city.label} side={city.side}
          />
        ))}
        <Compass x={92} y={9} />
      </svg>
    </MapCard>
  );
}