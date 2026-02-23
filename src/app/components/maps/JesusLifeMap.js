"use client";
import { P, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot } from "./shared";

const typeColors = {
  birth: "#D4A853", childhood: "#C06C3E", ministry: "#1B7A6E",
  miracle: "#8B5CF6", passion: "#E8625C",
};

const locs = [
  { id:"bethlehem",    x:44, y:62, label:"Bethlehem",        type:"birth",     side:"left"  },
  { id:"nazareth",     x:40, y:32, label:"Nazareth",         type:"childhood", side:"left"  },
  { id:"jerusalem",    x:44, y:58, label:"Jerusalem",        type:"passion",   side:"right" },
  { id:"jordan_bap",   x:50, y:54, label:"Baptism (Jordan)", type:"ministry",  side:"right" },
  { id:"cana",         x:40, y:28, label:"Cana",             type:"miracle",   side:"left"  },
  { id:"capernaum",    x:46, y:24, label:"Capernaum",        type:"ministry",  side:"right" },
  { id:"galilee_sea",  x:48, y:26, label:"Sea of Galilee",   type:"ministry",  side:"right" },
  { id:"mount_sermon", x:44, y:26, label:"Sermon on Mount",  type:"ministry",  side:"left"  },
  { id:"caesarea_phi", x:50, y:16, label:"Caesarea Philippi",type:"ministry",  side:"right" },
  { id:"jericho",      x:50, y:52, label:"Jericho",          type:"ministry",  side:"right" },
  { id:"bethany",      x:46, y:58, label:"Bethany",          type:"miracle",   side:"right" },
  { id:"egypt_ret",    x:18, y:62, label:"Egypt (Refuge)",   type:"childhood", side:"right" },
];

export const JESUS_DETAILS = {
  bethlehem:    { title:"Bethlehem — The Incarnation",            body:"The eternal Son of God was born in a manger in Bethlehem — fulfilling Micah's 700-year-old prophecy. Angels announced His birth to shepherds in the fields. Wise men from the east followed a star. Herod slaughtered the infants of Bethlehem in a futile attempt to destroy the newborn King.", scripture:"Luke 2:11 — 'For unto you is born this day in the city of David a Saviour, which is Christ the Lord.'" },
  nazareth:     { title:"Nazareth — Thirty Years of Hiddenness",  body:"Jesus grew up in Nazareth — an obscure village of perhaps 400 people. He worked as a carpenter, lived with his family, attended the synagogue. For 30 years the Son of God lived in complete obscurity, growing 'in wisdom and stature and in favour with God and man.' When He later preached in Nazareth, they tried to throw Him off a cliff.", scripture:"Luke 2:52 — 'And Jesus increased in wisdom and stature, and in favour with God and man.'" },
  jerusalem:    { title:"Jerusalem — The Passion",                 body:"Jerusalem was both the destination and the climax of Jesus' life. He wept over the city: 'O Jerusalem, Jerusalem... how often would I have gathered thy children together, as a hen doth gather her brood under her wings, and ye would not.' Here He was betrayed, tried, crucified, buried, and rose from the dead.", scripture:"Luke 19:41 — 'And when he was come near, he beheld the city, and wept over it.'" },
  jordan_bap:   { title:"The Jordan — Baptism of Jesus",          body:"At approximately 30 years old, Jesus came to John the Baptist at the Jordan River. As Jesus was baptised, the heavens opened, the Spirit descended as a dove, and the Father's voice declared: 'This is my beloved Son, in whom I am well pleased.' The Trinity was revealed at the Jordan.", scripture:"Matthew 3:16-17 — 'And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.'" },
  cana:         { title:"Cana — The First Miracle",               body:"At a wedding in Cana of Galilee, the wine ran out. Jesus' mother told the servants: 'Whatsoever he saith unto you, do it.' Jesus turned six stone waterpots of water — 120-180 gallons — into the finest wine. This first miracle 'manifested forth his glory; and his disciples believed on him.'", scripture:"John 2:11 — 'This beginning of miracles did Jesus in Cana of Galilee, and manifested forth his glory; and his disciples believed on him.'" },
  capernaum:    { title:"Capernaum — His Own City",               body:"Capernaum on the Sea of Galilee became Jesus' base of ministry — Matthew called it 'his own city.' Here He healed the centurion's servant, Peter's mother-in-law, a paralytic lowered through the roof, and many others. He preached in its synagogue. Yet He pronounced judgment on it for its unbelief.", scripture:"Matthew 9:1 — 'And he entered into a ship, and passed over, and came into his own city.'" },
  galilee_sea:  { title:"Sea of Galilee — Storms and Miracles",   body:"Much of Jesus' ministry centred on the Sea of Galilee. He called fishermen Peter, Andrew, James, and John from its shores. He calmed a storm on it with a word. He walked on its waters. He taught from a boat to crowds on its banks. He cooked breakfast for His disciples on its shore after the resurrection.", scripture:"Mark 4:39 — 'And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm.'" },
  mount_sermon: { title:"The Sermon on the Mount",                body:"On a hillside above the Sea of Galilee, Jesus delivered the greatest sermon ever preached — the Beatitudes, the Lord's Prayer, 'turn the other cheek,' 'love your enemies,' 'seek ye first the kingdom of God.' The crowds were astonished: 'he taught them as one having authority, and not as the scribes.'", scripture:"Matthew 5:3 — 'Blessed are the poor in spirit: for theirs is the kingdom of heaven.'" },
  caesarea_phi: { title:"Caesarea Philippi — 'Who Do You Say I Am?'", body:"At Caesarea Philippi — a pagan shrine to Caesar and Pan — Jesus asked His disciples the defining question: 'But whom say ye that I am?' Peter answered: 'Thou art the Christ, the Son of the living God.' Jesus pronounced His blessing on Peter and declared: 'Upon this rock I will build my church; and the gates of hell shall not prevail against it.'", scripture:"Matthew 16:16 — 'And Simon Peter answered and said, Thou art the Christ, the Son of the living God.'" },
  jericho:      { title:"Jericho — Zacchaeus and Blind Bartimaeus", body:"Passing through Jericho on His final journey to Jerusalem, Jesus healed blind Bartimaeus who cried out: 'Jesus, thou Son of David, have mercy on me.' He also called Zacchaeus — the despised tax collector in the sycamore tree — down to dinner: 'Today salvation has come to this house.'", scripture:"Luke 19:9 — 'And Jesus said unto him, This day is salvation come to this house, forsomuch as he also is a son of Abraham.'" },
  bethany:      { title:"Bethany — The Raising of Lazarus",        body:"Bethany, just 2 miles from Jerusalem, was the home of Mary, Martha, and Lazarus — Jesus' beloved friends. When Lazarus died, Jesus wept — the shortest verse in Scripture. Then He commanded: 'Lazarus, come forth!' — and a man dead four days walked out of the tomb. This miracle sealed the Pharisees' decision to kill Jesus.", scripture:"John 11:35,43 — 'Jesus wept... And when he thus had spoken, he cried with a loud voice, Lazarus, come forth.'" },
  egypt_ret:    { title:"Egypt — The Holy Family's Refuge",        body:"Warned in a dream, Joseph fled to Egypt with Mary and the infant Jesus to escape Herod's massacre. They remained until Herod's death — fulfilling Hosea's prophecy: 'Out of Egypt have I called my Son.' The very nation where Israel was enslaved became the refuge for the Saviour of Israel.", scripture:"Matthew 2:14-15 — 'When he arose, he took the young child and his mother by night, and departed into Egypt... that it might be fulfilled which was spoken of the Lord by the prophet, saying, Out of Egypt have I called my son.'" },
};

export default function JesusLifeMap({ onSelectLocation, selectedLocation }) {
  return (
    <MapCard legend={<>
      <LegendDot color="#D4A853" label="Birth" />
      <LegendDot color="#C06C3E" label="Childhood" />
      <LegendDot color="#1B7A6E" label="Ministry" />
      <LegendDot color="#8B5CF6" label="Miracle" />
      <LegendDot color="#E8625C" label="Passion" />
    </>}>
      <svg viewBox="0 0 85 100" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-jes" />
        <ParchBg w={85} h={100} vigId="vig-jes" />

        {/* Mediterranean */}
        <polygon points="0,0 20,0 22,14 18,38 14,60 10,74 0,74 0,0" fill="url(#sea-jes)" opacity="0.80" />
        <text x="2" y="50" fill={P.inkFaint} fontSize="2.5" fontFamily="'Nunito',sans-serif"
          fontWeight="700" opacity="0.55" transform="rotate(-90,2,50)">MEDITERRANEAN SEA</text>

        {/* Egypt hint left */}
        <polygon points="0,70 16,66 20,76 16,88 0,88 0,70" fill={P.desert} opacity="0.60" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={8} y={80} text="EGYPT" fontSize={2.5} bold opacity={0.45} color={P.inkFaint} />

        {/* Galilee region */}
        <polygon points="18,14 56,12 60,22 56,34 44,38 30,36 18,28" fill={P.fertile} opacity="0.52" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={36} y={22} text="GALILEE" fontSize={3.5} bold opacity={0.28} color={P.inkFaint} />

        {/* Samaria */}
        <polygon points="18,36 44,34 48,44 44,52 30,54 18,48" fill={P.land} opacity="0.45" stroke={P.edge} strokeWidth="0.25" />
        <HaloText x={30} y={44} text="SAMARIA" fontSize={3} bold opacity={0.28} color={P.inkFaint} />

        {/* Judea */}
        <polygon points="16,54 46,50 50,58 48,72 40,76 22,74 14,64" fill={P.fertile} opacity="0.52" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={28} y={62} text="JUDEA" fontSize={3.5} bold opacity={0.28} color={P.inkFaint} />

        {/* Perea - east of Jordan */}
        <polygon points="52,36 68,32 72,48 68,62 52,64 50,50 50,40" fill={P.land} opacity="0.40" stroke={P.edge} strokeWidth="0.25" />
        <HaloText x={60} y={50} text="PEREA" fontSize={2.5} bold opacity={0.3} color={P.inkFaint} />

        {/* Decapolis hint */}
        <polygon points="54,22 72,18 74,32 66,36 52,34" fill={P.land} opacity="0.38" stroke={P.edge} strokeWidth="0.2" />
        <HaloText x={63} y={28} text="DECAPOLIS" fontSize={2.2} bold opacity={0.3} color={P.inkFaint} />

        {/* Jordan River */}
        <path d="M52,14 C52,22 50,34 50,44 C50,56 50,66 48,82"
          fill="none" stroke="#7AAEC8" strokeWidth="2.4" opacity="0.70" strokeLinecap="round" />
        <HaloText x={54} y={48} text="Jordan" fontSize={2.2} opacity={0.6} anchor="start" color={P.inkFaint} />

        {/* Sea of Galilee */}
        <ellipse cx="50" cy="22" rx="4" ry="6" fill="#7EB8D4" opacity="0.82" />

        {/* Dead Sea */}
        <ellipse cx="50" cy="62" rx="3.5" ry="7.5" fill="#7EB8D4" opacity="0.75" />
        <HaloText x={55} y={62} text="Dead Sea" fontSize={2.2} opacity={0.6} anchor="start" color={P.inkFaint} />

        {/* Ministry route: Galilee → Jerusalem */}
        <path d="M40,32 C42,38 44,44 44,50 C44,54 44,56 44,58"
          fill="none" stroke="#1B7A6E" strokeWidth="1.2" strokeDasharray="3,2" opacity="0.60" />

        {/* Mount of Transfiguration hint */}
        <polygon points="36,16 40,10 44,16" fill={P.mountain} opacity="0.50" />
        <HaloText x={40} y={10} text="Hermon" fontSize={2.2} opacity={0.5} anchor="middle" color={P.inkFaint} />

        {/* Vignette */}
        <rect x="0" y="0" width="85" height="100" fill="url(#vig-jes)" pointerEvents="none" />

        {locs.map(loc => (
          <Dot key={loc.id} cx={loc.x} cy={loc.y} r={3}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label} side={loc.side}
          />
        ))}

        <Compass x={77} y={6} />
      </svg>
    </MapCard>
  );
}