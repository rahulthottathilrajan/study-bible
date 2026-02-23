"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  commended: "#1B7A6E",
  warned:    "#E8625C",
  mixed:     "#D4A853",
  dead:      "#8B5CF6",
};

const locs = [
  { id:"ephesus",       x:32, y:52, label:"Ephesus",       type:"mixed",     side:"left"  },
  { id:"smyrna",        x:28, y:40, label:"Smyrna",        type:"commended", side:"left"  },
  { id:"pergamum",      x:26, y:28, label:"Pergamum",      type:"warned",    side:"left"  },
  { id:"thyatira",      x:36, y:34, label:"Thyatira",      type:"warned",    side:"right" },
  { id:"sardis",        x:38, y:44, label:"Sardis",        type:"dead",      side:"right" },
  { id:"philadelphia",  x:44, y:48, label:"Philadelphia",  type:"commended", side:"right" },
  { id:"laodicea",      x:50, y:56, label:"Laodicea",      type:"warned",    side:"right" },
];

// Circuit route connecting all 7 churches
const circuit = "M32,52 L28,40 L26,28 L36,34 L38,44 L44,48 L50,56";

export const SEVEN_CHURCHES_DETAILS = {
  ephesus: {
    title: "Ephesus — Lost First Love",
    body: "Ephesus was the greatest church of the seven — doctrinally sound, hardworking, perseverant, intolerant of false apostles. Yet Christ had one devastating charge: 'Thou hast left thy first love.' Orthodoxy without love is empty. The church was warned to repent or have its lampstand removed. Ephesus was later abandoned and its harbour silted up.",
    scripture: "Revelation 2:4 — 'Nevertheless I have somewhat against thee, because thou hast left thy first love.'"
  },
  smyrna: {
    title: "Smyrna — Faithful Under Persecution",
    body: "Smyrna received no rebuke — only encouragement. Christ acknowledged their poverty, tribulation, and the slander of those who claimed to be Jews. He warned of coming imprisonment and ten days of tribulation, but promised: 'Be thou faithful unto death, and I will give thee a crown of life.' Polycarp, bishop of Smyrna, was martyred here c. AD 155.",
    scripture: "Revelation 2:10 — 'Be thou faithful unto death, and I will give thee a crown of life.'"
  },
  pergamum: {
    title: "Pergamum — Where Satan's Throne Is",
    body: "Pergamum was the centre of Roman imperial worship in Asia — home to a massive altar to Zeus and a temple to Augustus. Christ called it the place 'where Satan's throne is.' The church had held fast to Christ's name even when Antipas was martyred there. But some held the teaching of Balaam and the Nicolaitans. Christ called them to repent.",
    scripture: "Revelation 2:13 — 'I know thy works, and where thou dwellest, even where Satan's seat is: and thou holdest fast my name.'"
  },
  thyatira: {
    title: "Thyatira — The Jezebel Church",
    body: "Thyatira was a guild city — trade guilds dominated life, and every guild held feasts with food sacrificed to idols. A woman Christ calls 'Jezebel' was teaching the church to participate. Christ praised their love, faith, service, and growth — but warned that Jezebel and her followers would face severe judgment unless they repented.",
    scripture: "Revelation 2:20 — 'I have a few things against thee, because thou sufferest that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants.'"
  },
  sardis: {
    title: "Sardis — The Dead Church",
    body: "Sardis had a reputation for being alive — but Christ said it was dead. The city had twice been captured by enemies who scaled its supposedly impregnable cliff walls while the guards slept. The spiritual parallel was exact. Christ called them to wake up and strengthen what remained. Yet there were a few who had not defiled their garments — they would walk with Christ in white.",
    scripture: "Revelation 3:1-2 — 'Thou hast a name that thou livest, and art dead. Be watchful, and strengthen the things which remain.'"
  },
  philadelphia: {
    title: "Philadelphia — The Open Door",
    body: "Philadelphia received no rebuke — only the promise of an open door that no one could shut. The city sat on a major trade route into Asia Minor, making the open door image vivid. Christ promised to keep them from the hour of trial. 'Him that overcometh will I make a pillar in the temple of my God, and he shall go no more out.'",
    scripture: "Revelation 3:8 — 'Behold, I have set before thee an open door, and no man can shut it: for thou hast a little strength, and hast kept my word.'"
  },
  laodicea: {
    title: "Laodicea — Lukewarm",
    body: "Laodicea was one of the wealthiest cities in Asia — a banking centre, textile producer, and medical school. They boasted: 'I am rich, increased with goods, and have need of nothing.' Christ said they were wretched, miserable, poor, blind, and naked. Lukewarm — neither hot nor cold — He would spew them out. Yet even here Christ stood at the door and knocked.",
    scripture: "Revelation 3:20 — 'Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him, and will sup with him, and he with me.'"
  },
};

export default function SevenChurchesMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#1B7A6E" label="Commended Only" />
      <LegendDot color="#D4A853" label="Mixed" />
      <LegendDot color="#E8625C" label="Strongly Warned" />
      <LegendDot color="#8B5CF6" label="Dead / Lukewarm" />
    </>}>
      <svg viewBox="0 0 90 80" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-7ch" />
        <ParchBg w={90} h={80} vigId="vig-7ch" />

        {/* Aegean Sea - west */}
        <polygon points="0,0 18,0 20,16 18,36 14,56 10,68 0,68 0,0" fill="url(#sea-7ch)" opacity="0.80" />
        <text x="2" y="44" fill={P.inkFaint} fontSize="2.4" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.55" transform="rotate(-90,2,44)">AEGEAN SEA</text>

        {/* Mediterranean - south */}
        <polygon points="0,68 90,68 90,80 0,80" fill="url(#sea-7ch)" opacity="0.72" />
        <HaloText x={44} y={76} text="MEDITERRANEAN SEA" fontSize={2.8} bold opacity={0.5} color={P.inkFaint} />

        {/* Asia Minor land mass */}
        <polygon points="16,0 90,0 90,68 20,68 18,52 16,36 18,16" fill={P.land} opacity="0.72" stroke={P.edge} strokeWidth="0.5" />

        {/* Coastal fertile strip */}
        <polygon points="16,10 30,8 32,20 28,38 22,56 16,58 14,40 16,22" fill={P.fertile} opacity="0.50" stroke={P.edge} strokeWidth="0.3" />

        {/* Inland regions */}
        <polygon points="30,8 70,6 74,20 70,36 56,44 40,42 32,32 30,18" fill={P.land} opacity="0.60" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={54} y={24} text="ASIA MINOR" fontSize={4} bold opacity={0.25} color={P.inkFaint} />

        {/* Mountain range hints */}
        <polygon points="58,8 62,4 66,8"  fill={P.mountain} opacity="0.38" />
        <polygon points="64,10 68,6 72,10" fill={P.mountain} opacity="0.32" />
        <polygon points="42,12 46,8 50,12" fill={P.mountain} opacity="0.30" />

        {/* Roman road circuit connecting all 7 */}
        <path d={circuit}
          fill="none" stroke="#C06C3E" strokeWidth="1.4"
          strokeDasharray="3,2" opacity="0.70" />

        {/* Hermos River */}
        <path d="M20,40 C28,38 36,36 44,34 C52,32 60,30 70,28"
          fill="none" stroke="#7AAEC8" strokeWidth="1.2" opacity="0.55" strokeLinecap="round" />
        <HaloText x={46} y={30} text="Hermos R." fontSize={2.2} opacity={0.5} anchor="middle" color={P.inkFaint} />

        {/* Maeander River */}
        <path d="M20,58 C28,56 36,54 46,52 C54,52 60,54 68,56"
          fill="none" stroke="#7AAEC8" strokeWidth="1.2" opacity="0.50" strokeLinecap="round" />
        <HaloText x={46} y={60} text="Maeander R." fontSize={2.2} opacity={0.45} anchor="middle" color={P.inkFaint} />

        {/* Patmos island */}
        <ellipse cx="8" cy="54" rx="3" ry="4.5" fill={P.land} opacity="0.75" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={8} y={50} text="Patmos" fontSize={2.2} bold opacity={0.65} anchor="middle" color={P.inkFaint} />
        <HaloText x={8} y={60} text="(John's exile)" fontSize={1.9} opacity={0.55} anchor="middle" color={P.inkFaint} />

        {/* Number labels on the circuit route */}
        <text x="30" y="55" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif" fontWeight="800" opacity="0.5" textAnchor="middle">①</text>
        <text x="26" y="43" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif" fontWeight="800" opacity="0.5" textAnchor="middle">②</text>
        <text x="24" y="31" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif" fontWeight="800" opacity="0.5" textAnchor="middle">③</text>
        <text x="38" y="37" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif" fontWeight="800" opacity="0.5" textAnchor="middle">④</text>
        <text x="40" y="47" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif" fontWeight="800" opacity="0.5" textAnchor="middle">⑤</text>
        <text x="46" y="51" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif" fontWeight="800" opacity="0.5" textAnchor="middle">⑥</text>
        <text x="52" y="59" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif" fontWeight="800" opacity="0.5" textAnchor="middle">⑦</text>

        {/* Vignette */}
        <rect x="0" y="0" width="90" height="80" fill="url(#vig-7ch)" pointerEvents="none" />

        {locs.map(loc => (
          <Dot key={loc.id} cx={loc.x} cy={loc.y} r={3}
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