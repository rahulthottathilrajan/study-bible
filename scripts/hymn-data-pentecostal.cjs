/**
 * Pentecostal / Revival Hymns — Public Domain
 *
 * 20 classic hymns associated with the Pentecostal and Revival traditions.
 * All hymns are public domain (published before 1927).
 *
 * Schema:
 *   id            — lowercase hyphenated slug
 *   title         — display title
 *   author        — lyricist
 *   composer      — melody composer
 *   year          — year of composition / publication
 *   categories    — ["pentecostal", ...secondary]
 *   scriptureRefs — [{ ref, note }]
 *   story         — 2-4 sentence background
 *   lyrics        — { structure: [{ type, number?, lines }] }
 *   translations  — [] (placeholder for future i18n)
 *   publicDomain  — true
 *   source        — "Public Domain"
 */

module.exports = [
  // ───────────────────────────────────────────────
  // 1. There Is Power in the Blood
  // ───────────────────────────────────────────────
  {
    id: "power-in-the-blood",
    title: "There Is Power in the Blood",
    author: "Lewis E. Jones",
    composer: "Lewis E. Jones",
    year: 1899,
    categories: ["pentecostal", "worship", "salvation"],
    scriptureRefs: [
      { ref: "1 John 1:7", note: "The blood of Jesus Christ his Son cleanseth us from all sin" },
      { ref: "Revelation 12:11", note: "They overcame him by the blood of the Lamb" },
      { ref: "Hebrews 9:22", note: "Without shedding of blood is no remission" }
    ],
    story: "Lewis Ellis Jones wrote this hymn in 1899 while attending a camp meeting at Mountain Lake Park, Maryland. During a sermon by Dr. Israel, the evangelist made the statement 'there is power in the blood of the Lamb,' which inspired Jones to immediately begin writing. The hymn became a staple of revival meetings and Pentecostal worship services throughout the early twentieth century.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "Would you be free from the burden of sin?",
          "There's pow'r in the blood, pow'r in the blood;",
          "Would you o'er evil a victory win?",
          "There's wonderful pow'r in the blood."
        ]},
        { type: "chorus", lines: [
          "There is pow'r, pow'r, wonder-working pow'r",
          "In the blood of the Lamb;",
          "There is pow'r, pow'r, wonder-working pow'r",
          "In the precious blood of the Lamb."
        ]},
        { type: "verse", number: 2, lines: [
          "Would you be free from your passion and pride?",
          "There's pow'r in the blood, pow'r in the blood;",
          "Come for a cleansing to Calvary's tide;",
          "There's wonderful pow'r in the blood."
        ]},
        { type: "verse", number: 3, lines: [
          "Would you be whiter, much whiter than snow?",
          "There's pow'r in the blood, pow'r in the blood;",
          "Sin stains are lost in its life-giving flow;",
          "There's wonderful pow'r in the blood."
        ]},
        { type: "verse", number: 4, lines: [
          "Would you do service for Jesus your King?",
          "There's pow'r in the blood, pow'r in the blood;",
          "Would you live daily His praises to sing?",
          "There's wonderful pow'r in the blood."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 2. Standing on the Promises
  // ───────────────────────────────────────────────
  {
    id: "standing-on-the-promises",
    title: "Standing on the Promises",
    author: "R. Kelso Carter",
    composer: "R. Kelso Carter",
    year: 1886,
    categories: ["pentecostal", "faith", "praise"],
    scriptureRefs: [
      { ref: "2 Corinthians 1:20", note: "For all the promises of God in him are yea, and in him Amen" },
      { ref: "Romans 8:28", note: "All things work together for good to them that love God" }
    ],
    story: "Russell Kelso Carter was a remarkable man who served as a military academy instructor, athlete, ordained minister, physician, and hymn writer. He wrote 'Standing on the Promises' in 1886 while serving as a professor at the Pennsylvania Military Academy. Carter had experienced a dramatic healing from a serious heart condition after committing his life fully to God, which deeply influenced his confidence in God's promises. The hymn became one of the most popular songs in Holiness and Pentecostal circles.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "Standing on the promises of Christ my King,",
          "Through eternal ages let His praises ring;",
          "Glory in the highest, I will shout and sing,",
          "Standing on the promises of God."
        ]},
        { type: "chorus", lines: [
          "Standing, standing,",
          "Standing on the promises of God my Savior;",
          "Standing, standing,",
          "I'm standing on the promises of God."
        ]},
        { type: "verse", number: 2, lines: [
          "Standing on the promises that cannot fail,",
          "When the howling storms of doubt and fear assail,",
          "By the living Word of God I shall prevail,",
          "Standing on the promises of God."
        ]},
        { type: "verse", number: 3, lines: [
          "Standing on the promises I now can see",
          "Perfect, present cleansing in the blood for me;",
          "Standing in the liberty where Christ makes free,",
          "Standing on the promises of God."
        ]},
        { type: "verse", number: 4, lines: [
          "Standing on the promises of Christ the Lord,",
          "Bound to Him eternally by love's strong cord,",
          "Overcoming daily with the Spirit's sword,",
          "Standing on the promises of God."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 3. I Surrender All
  // ───────────────────────────────────────────────
  {
    id: "i-surrender-all",
    title: "I Surrender All",
    author: "Judson W. Van DeVenter",
    composer: "Winfield S. Weeden",
    year: 1896,
    categories: ["pentecostal", "consecration", "worship"],
    scriptureRefs: [
      { ref: "Romans 12:1", note: "Present your bodies a living sacrifice, holy, acceptable unto God" },
      { ref: "Luke 14:33", note: "Whosoever he be of you that forsaketh not all that he hath, he cannot be my disciple" }
    ],
    story: "Judson Van DeVenter struggled for five years between pursuing a career as an art teacher and entering full-time evangelistic ministry. He finally surrendered completely to God's call during a meeting in East Palestine, Ohio, in 1896. The inner struggle and ultimate yielding he experienced became the inspiration for this beloved hymn of consecration. His friend Winfield Weeden composed the melody shortly after Van DeVenter shared the words.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "All to Jesus I surrender,",
          "All to Him I freely give;",
          "I will ever love and trust Him,",
          "In His presence daily live."
        ]},
        { type: "chorus", lines: [
          "I surrender all,",
          "I surrender all;",
          "All to Thee, my blessed Savior,",
          "I surrender all."
        ]},
        { type: "verse", number: 2, lines: [
          "All to Jesus I surrender,",
          "Humbly at His feet I bow,",
          "Worldly pleasures all forsaken,",
          "Take me, Jesus, take me now."
        ]},
        { type: "verse", number: 3, lines: [
          "All to Jesus I surrender,",
          "Make me, Savior, wholly Thine;",
          "Let me feel the Holy Spirit,",
          "Truly know that Thou art mine."
        ]},
        { type: "verse", number: 4, lines: [
          "All to Jesus I surrender,",
          "Lord, I give myself to Thee;",
          "Fill me with Thy love and power,",
          "Let Thy blessing fall on me."
        ]},
        { type: "verse", number: 5, lines: [
          "All to Jesus I surrender,",
          "Now I feel the sacred flame;",
          "O the joy of full salvation!",
          "Glory, glory, to His name!"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 4. Nothing but the Blood of Jesus
  // ───────────────────────────────────────────────
  {
    id: "nothing-but-the-blood",
    title: "Nothing but the Blood of Jesus",
    author: "Robert Lowry",
    composer: "Robert Lowry",
    year: 1876,
    categories: ["pentecostal", "salvation", "grace"],
    scriptureRefs: [
      { ref: "Hebrews 9:22", note: "Without shedding of blood is no remission" },
      { ref: "Ephesians 1:7", note: "In whom we have redemption through his blood, the forgiveness of sins" },
      { ref: "Romans 5:9", note: "Being now justified by his blood, we shall be saved from wrath through him" }
    ],
    story: "Robert Lowry was a Baptist pastor and prolific hymn writer who served churches in Pennsylvania, New York, and New Jersey. He wrote 'Nothing but the Blood of Jesus' in 1876, emphasizing the central Reformation doctrine that salvation comes solely through the atoning sacrifice of Christ. Lowry also wrote the well-known hymns 'Shall We Gather at the River' and 'Low in the Grave He Lay.' This hymn's simple, repetitive structure made it ideal for revival meetings and altar calls.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "What can wash away my sin?",
          "Nothing but the blood of Jesus;",
          "What can make me whole again?",
          "Nothing but the blood of Jesus."
        ]},
        { type: "chorus", lines: [
          "O precious is the flow",
          "That makes me white as snow;",
          "No other fount I know,",
          "Nothing but the blood of Jesus."
        ]},
        { type: "verse", number: 2, lines: [
          "For my pardon this I see—",
          "Nothing but the blood of Jesus;",
          "For my cleansing this my plea—",
          "Nothing but the blood of Jesus."
        ]},
        { type: "verse", number: 3, lines: [
          "Nothing can for sin atone—",
          "Nothing but the blood of Jesus;",
          "Naught of good that I have done—",
          "Nothing but the blood of Jesus."
        ]},
        { type: "verse", number: 4, lines: [
          "This is all my hope and peace—",
          "Nothing but the blood of Jesus;",
          "This is all my righteousness—",
          "Nothing but the blood of Jesus."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 5. Leaning on the Everlasting Arms
  // ───────────────────────────────────────────────
  {
    id: "leaning-on-the-everlasting-arms",
    title: "Leaning on the Everlasting Arms",
    author: "Elisha A. Hoffman",
    composer: "Anthony J. Showalter",
    year: 1887,
    categories: ["pentecostal", "trust", "comfort"],
    scriptureRefs: [
      { ref: "Deuteronomy 33:27", note: "The eternal God is thy refuge, and underneath are the everlasting arms" },
      { ref: "Isaiah 26:4", note: "Trust ye in the Lord for ever: for in the Lord Jehovah is everlasting strength" }
    ],
    story: "Anthony Showalter, a music teacher in Dalton, Georgia, received letters from two former students on the same day in 1887, each telling of the death of their wives. As he searched the Scriptures for words of comfort, he found Deuteronomy 33:27 and composed the chorus melody that evening. Feeling that the verses needed a more skilled hand, he sent the chorus to his friend Elisha Hoffman, who wrote the three stanzas. The collaboration produced one of the most comforting hymns in the revival tradition.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "What a fellowship, what a joy divine,",
          "Leaning on the everlasting arms;",
          "What a blessedness, what a peace is mine,",
          "Leaning on the everlasting arms."
        ]},
        { type: "chorus", lines: [
          "Leaning, leaning,",
          "Safe and secure from all alarms;",
          "Leaning, leaning,",
          "Leaning on the everlasting arms."
        ]},
        { type: "verse", number: 2, lines: [
          "O how sweet to walk in this pilgrim way,",
          "Leaning on the everlasting arms;",
          "O how bright the path grows from day to day,",
          "Leaning on the everlasting arms."
        ]},
        { type: "verse", number: 3, lines: [
          "What have I to dread, what have I to fear,",
          "Leaning on the everlasting arms?",
          "I have blessed peace with my Lord so near,",
          "Leaning on the everlasting arms."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 6. Revive Us Again
  // ───────────────────────────────────────────────
  {
    id: "revive-us-again",
    title: "Revive Us Again",
    author: "William P. Mackay",
    composer: "John J. Husband",
    year: 1863,
    categories: ["pentecostal", "revival", "praise"],
    scriptureRefs: [
      { ref: "Psalm 85:6", note: "Wilt thou not revive us again: that thy people may rejoice in thee?" },
      { ref: "Habakkuk 3:2", note: "O Lord, revive thy work in the midst of the years" }
    ],
    story: "William Paton Mackay was a Scottish physician and minister who wrote this hymn around 1863. The hymn was inspired by Psalm 85:6 and became closely associated with the great revival movements of the nineteenth century. It was popularized during Dwight L. Moody's evangelistic campaigns in Britain and America. The tune, composed by John J. Husband, gave the hymn its joyful, marching character that made it a natural fit for revival gatherings.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "We praise Thee, O God, for the Son of Thy love,",
          "For Jesus who died and is now gone above."
        ]},
        { type: "chorus", lines: [
          "Hallelujah! Thine the glory,",
          "Hallelujah! Amen!",
          "Hallelujah! Thine the glory,",
          "Revive us again."
        ]},
        { type: "verse", number: 2, lines: [
          "We praise Thee, O God, for Thy Spirit of light,",
          "Who has shown us our Savior and scattered our night."
        ]},
        { type: "verse", number: 3, lines: [
          "All glory and praise to the Lamb that was slain,",
          "Who has borne all our sins and has cleansed every stain."
        ]},
        { type: "verse", number: 4, lines: [
          "Revive us again; fill each heart with Thy love;",
          "May each soul be rekindled with fire from above."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 7. Sweet Hour of Prayer
  // ───────────────────────────────────────────────
  {
    id: "sweet-hour-of-prayer",
    title: "Sweet Hour of Prayer",
    author: "William W. Walford",
    composer: "William B. Bradbury",
    year: 1845,
    categories: ["pentecostal", "prayer", "devotion"],
    scriptureRefs: [
      { ref: "Matthew 6:6", note: "When thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father" },
      { ref: "Philippians 4:6", note: "In every thing by prayer and supplication with thanksgiving let your requests be made known unto God" },
      { ref: "1 Thessalonians 5:17", note: "Pray without ceasing" }
    ],
    story: "The authorship of this hymn is traditionally attributed to William Walford, a blind preacher from Coleshill, England. The poem was reportedly dictated to Reverend Thomas Salmon, who sent it to the New York Observer where it was published in 1845. William Bradbury composed the beloved melody that has carried the hymn through generations. The hymn captures the deep longing for communion with God that is central to the Pentecostal prayer tradition.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "Sweet hour of prayer! Sweet hour of prayer!",
          "That calls me from a world of care,",
          "And bids me at my Father's throne",
          "Make all my wants and wishes known.",
          "In seasons of distress and grief,",
          "My soul has often found relief,",
          "And oft escaped the tempter's snare",
          "By thy return, sweet hour of prayer!"
        ]},
        { type: "verse", number: 2, lines: [
          "Sweet hour of prayer! Sweet hour of prayer!",
          "The joys I feel, the bliss I share",
          "Of those whose anxious spirits burn",
          "With strong desires for thy return!",
          "With such I hasten to the place",
          "Where God my Savior shows His face,",
          "And gladly take my station there,",
          "And wait for thee, sweet hour of prayer!"
        ]},
        { type: "verse", number: 3, lines: [
          "Sweet hour of prayer! Sweet hour of prayer!",
          "Thy wings shall my petition bear",
          "To Him whose truth and faithfulness",
          "Engage the waiting soul to bless.",
          "And since He bids me seek His face,",
          "Believe His Word, and trust His grace,",
          "I'll cast on Him my every care,",
          "And wait for thee, sweet hour of prayer!"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 8. I Need Thee Every Hour
  // ───────────────────────────────────────────────
  {
    id: "i-need-thee-every-hour",
    title: "I Need Thee Every Hour",
    author: "Annie S. Hawks",
    composer: "Robert Lowry",
    year: 1872,
    categories: ["pentecostal", "devotion", "prayer"],
    scriptureRefs: [
      { ref: "John 15:5", note: "Without me ye can do nothing" },
      { ref: "Psalm 46:1", note: "God is our refuge and strength, a very present help in trouble" }
    ],
    story: "Annie Sherwood Hawks wrote this hymn in June 1872 while going about her household duties in Brooklyn, New York. She later recalled that she was filled with a sense of nearness to her Master and wondered how anyone could live without Him in both joy and pain. She gave the poem to her pastor, Robert Lowry, who added the chorus and composed the tune. Hawks later said the full meaning of the hymn came to her only after her husband's death in 1888.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "I need Thee every hour,",
          "Most gracious Lord;",
          "No tender voice like Thine",
          "Can peace afford."
        ]},
        { type: "chorus", lines: [
          "I need Thee, O I need Thee;",
          "Every hour I need Thee;",
          "O bless me now, my Savior,",
          "I come to Thee."
        ]},
        { type: "verse", number: 2, lines: [
          "I need Thee every hour,",
          "Stay Thou nearby;",
          "Temptations lose their pow'r",
          "When Thou art nigh."
        ]},
        { type: "verse", number: 3, lines: [
          "I need Thee every hour,",
          "In joy or pain;",
          "Come quickly and abide,",
          "Or life is vain."
        ]},
        { type: "verse", number: 4, lines: [
          "I need Thee every hour;",
          "Teach me Thy will;",
          "And Thy rich promises",
          "In me fulfill."
        ]},
        { type: "verse", number: 5, lines: [
          "I need Thee every hour,",
          "Most Holy One;",
          "O make me Thine indeed,",
          "Thou blessed Son."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 9. Breathe on Me, Breath of God
  // ───────────────────────────────────────────────
  {
    id: "breathe-on-me-breath-of-god",
    title: "Breathe on Me, Breath of God",
    author: "Edwin Hatch",
    composer: "Robert Jackson",
    year: 1878,
    categories: ["pentecostal", "holy-spirit", "consecration"],
    scriptureRefs: [
      { ref: "John 20:22", note: "He breathed on them, and saith unto them, Receive ye the Holy Ghost" },
      { ref: "Acts 2:4", note: "They were all filled with the Holy Ghost" },
      { ref: "Genesis 2:7", note: "The Lord God formed man of the dust of the ground, and breathed into his nostrils the breath of life" }
    ],
    story: "Edwin Hatch was an Oxford scholar and theologian who wrote this hymn in 1878 as a prayer for the infilling of the Holy Spirit. Despite his academic career, Hatch expressed profound spiritual longing in simple, elegant verse. The hymn's connection to John 20:22, where Jesus breathed on His disciples, makes it especially meaningful in Pentecostal worship. Robert Jackson composed the tune TRENTHAM, which has become the most widely used setting for these words.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "Breathe on me, Breath of God,",
          "Fill me with life anew,",
          "That I may love what Thou dost love,",
          "And do what Thou wouldst do."
        ]},
        { type: "verse", number: 2, lines: [
          "Breathe on me, Breath of God,",
          "Until my heart is pure,",
          "Until with Thee I will one will,",
          "To do and to endure."
        ]},
        { type: "verse", number: 3, lines: [
          "Breathe on me, Breath of God,",
          "Till I am wholly Thine,",
          "Until this earthly part of me",
          "Glows with Thy fire divine."
        ]},
        { type: "verse", number: 4, lines: [
          "Breathe on me, Breath of God,",
          "So shall I never die,",
          "But live with Thee the perfect life",
          "Of Thine eternity."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 10. Pass Me Not, O Gentle Saviour
  // ───────────────────────────────────────────────
  {
    id: "pass-me-not",
    title: "Pass Me Not, O Gentle Saviour",
    author: "Fanny J. Crosby",
    composer: "William H. Doane",
    year: 1868,
    categories: ["pentecostal", "prayer", "salvation"],
    scriptureRefs: [
      { ref: "Mark 10:47", note: "Jesus, thou son of David, have mercy on me" },
      { ref: "Luke 18:13", note: "God be merciful to me a sinner" },
      { ref: "Psalm 51:1", note: "Have mercy upon me, O God, according to thy lovingkindness" }
    ],
    story: "Fanny Crosby, the prolific blind hymn writer who penned over 8,000 hymns, wrote 'Pass Me Not' in 1868. She was inspired by a cry she heard at a prison service in Manhattan: 'Good Lord, do not pass me by!' The plea deeply moved her, and she wrote the hymn that same day. William Doane composed the tune, and the hymn became one of the most beloved altar-call songs in revivalist and Pentecostal churches worldwide.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "Pass me not, O gentle Savior,",
          "Hear my humble cry;",
          "While on others Thou art calling,",
          "Do not pass me by."
        ]},
        { type: "chorus", lines: [
          "Savior, Savior,",
          "Hear my humble cry;",
          "While on others Thou art calling,",
          "Do not pass me by."
        ]},
        { type: "verse", number: 2, lines: [
          "Let me at Thy throne of mercy",
          "Find a sweet relief,",
          "Kneeling there in deep contrition;",
          "Help my unbelief."
        ]},
        { type: "verse", number: 3, lines: [
          "Trusting only in Thy merit,",
          "Would I seek Thy face;",
          "Heal my wounded, broken spirit,",
          "Save me by Thy grace."
        ]},
        { type: "verse", number: 4, lines: [
          "Thou the Spring of all my comfort,",
          "More than life to me,",
          "Whom have I on earth beside Thee?",
          "Whom in heav'n but Thee?"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 11. Are You Washed in the Blood?
  // ───────────────────────────────────────────────
  {
    id: "are-you-washed-in-the-blood",
    title: "Are You Washed in the Blood?",
    author: "Elisha A. Hoffman",
    composer: "Elisha A. Hoffman",
    year: 1878,
    categories: ["pentecostal", "salvation", "worship"],
    scriptureRefs: [
      { ref: "Revelation 7:14", note: "These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb" },
      { ref: "Revelation 1:5", note: "Unto him that loved us, and washed us from our sins in his own blood" }
    ],
    story: "Elisha Albright Hoffman was an Evangelical minister in Pennsylvania who wrote over 2,000 hymns during his lifetime. He composed 'Are You Washed in the Blood?' in 1878, drawing directly from the imagery of Revelation 7:14. The hymn's pointed question and vivid imagery made it a powerful tool in revival meetings, where it served both as an invitation to salvation and a call to holy living. It remains a signature hymn in Pentecostal congregations.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "Have you been to Jesus for the cleansing pow'r?",
          "Are you washed in the blood of the Lamb?",
          "Are you fully trusting in His grace this hour?",
          "Are you washed in the blood of the Lamb?"
        ]},
        { type: "chorus", lines: [
          "Are you washed in the blood,",
          "In the soul-cleansing blood of the Lamb?",
          "Are your garments spotless? Are they white as snow?",
          "Are you washed in the blood of the Lamb?"
        ]},
        { type: "verse", number: 2, lines: [
          "Are you walking daily by the Savior's side?",
          "Are you washed in the blood of the Lamb?",
          "Do you rest each moment in the Crucified?",
          "Are you washed in the blood of the Lamb?"
        ]},
        { type: "verse", number: 3, lines: [
          "When the Bridegroom cometh will your robes be white?",
          "Are you washed in the blood of the Lamb?",
          "Will your soul be ready for the mansions bright,",
          "And be washed in the blood of the Lamb?"
        ]},
        { type: "verse", number: 4, lines: [
          "Lay aside the garments that are stained with sin,",
          "And be washed in the blood of the Lamb;",
          "There's a fountain flowing for the soul unclean,",
          "O be washed in the blood of the Lamb!"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 12. At the Cross
  // ───────────────────────────────────────────────
  {
    id: "at-the-cross",
    title: "At the Cross",
    author: "Isaac Watts",
    composer: "Ralph E. Hudson",
    year: 1885,
    categories: ["pentecostal", "salvation", "grace"],
    scriptureRefs: [
      { ref: "Galatians 6:14", note: "God forbid that I should glory, save in the cross of our Lord Jesus Christ" },
      { ref: "Romans 5:8", note: "While we were yet sinners, Christ died for us" }
    ],
    story: "The verses of this hymn were originally written by Isaac Watts in 1707 as part of his hymn 'Alas! and Did My Saviour Bleed.' Nearly two centuries later, in 1885, Ralph E. Hudson added the beloved chorus 'At the cross, at the cross where I first saw the light' and set it to a new tune. Hudson's addition transformed the contemplative Watts poem into a joyful testimony of conversion that became a staple of revival meetings and Pentecostal worship services.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "Alas! and did my Savior bleed,",
          "And did my Sov'reign die!",
          "Would He devote that sacred head",
          "For such a worm as I!"
        ]},
        { type: "chorus", lines: [
          "At the cross, at the cross where I first saw the light,",
          "And the burden of my heart rolled away,",
          "It was there by faith I received my sight,",
          "And now I am happy all the day!"
        ]},
        { type: "verse", number: 2, lines: [
          "Was it for crimes that I had done",
          "He groaned upon the tree?",
          "Amazing pity! Grace unknown!",
          "And love beyond degree!"
        ]},
        { type: "verse", number: 3, lines: [
          "Well might the sun in darkness hide,",
          "And shut his glories in,",
          "When Christ, the mighty Maker, died",
          "For man the creature's sin."
        ]},
        { type: "verse", number: 4, lines: [
          "But drops of grief can ne'er repay",
          "The debt of love I owe;",
          "Here, Lord, I give myself away,",
          "'Tis all that I can do!"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 13. Fill Me Now
  // ───────────────────────────────────────────────
  {
    id: "fill-me-now",
    title: "Fill Me Now",
    author: "Elwood H. Stokes",
    composer: "John R. Sweney",
    year: 1879,
    categories: ["pentecostal", "holy-spirit", "prayer"],
    scriptureRefs: [
      { ref: "Ephesians 5:18", note: "Be filled with the Spirit" },
      { ref: "Acts 1:8", note: "Ye shall receive power, after that the Holy Ghost is come upon you" },
      { ref: "Luke 11:13", note: "How much more shall your heavenly Father give the Holy Spirit to them that ask him" }
    ],
    story: "Elwood Stokes was a Methodist bishop and president of Ocean Grove Camp Meeting Association in New Jersey. He wrote 'Fill Me Now' in 1879 as a prayer for the fullness of the Holy Spirit, a theme that was central to the Holiness movement and later the Pentecostal revival. John Sweney, a prominent gospel music composer, set the words to a fervent melody. The hymn became a signature prayer song in Pentecostal services, often sung during times of spiritual seeking.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "Hover o'er me, Holy Spirit,",
          "Bathe my trembling heart and brow;",
          "Fill me with Thy hallowed presence,",
          "Come, O come and fill me now."
        ]},
        { type: "chorus", lines: [
          "Fill me now, fill me now,",
          "Jesus, come and fill me now;",
          "Fill me with Thy hallowed presence,",
          "Come, O come and fill me now."
        ]},
        { type: "verse", number: 2, lines: [
          "Thou canst fill me, gracious Spirit,",
          "Though I cannot tell Thee how;",
          "But I need Thee, greatly need Thee,",
          "Come, O come and fill me now."
        ]},
        { type: "verse", number: 3, lines: [
          "I am weakness, full of weakness,",
          "At Thy sacred feet I bow;",
          "Blest, divine, eternal Spirit,",
          "Fill with pow'r, and fill me now."
        ]},
        { type: "verse", number: 4, lines: [
          "Cleanse and comfort, bless and save me,",
          "Bathe, O bathe my heart and brow;",
          "Thou art comforting and saving,",
          "Thou art sweetly filling now."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 14. The Comforter Has Come
  // ───────────────────────────────────────────────
  {
    id: "the-comforter-has-come",
    title: "The Comforter Has Come",
    author: "Frank Bottome",
    composer: "William J. Kirkpatrick",
    year: 1890,
    categories: ["pentecostal", "holy-spirit", "praise"],
    scriptureRefs: [
      { ref: "John 14:16", note: "He shall give you another Comforter, that he may abide with you for ever" },
      { ref: "John 14:26", note: "The Comforter, which is the Holy Ghost, whom the Father will send in my name" },
      { ref: "Acts 2:1-4", note: "They were all filled with the Holy Ghost, and began to speak with other tongues" }
    ],
    story: "Frank Bottome was a Methodist Episcopal minister in New York City who wrote this jubilant hymn celebrating the coming of the Holy Spirit in 1890. The hymn draws from Jesus' promise in John 14 to send the Comforter, and from the fulfillment at Pentecost in Acts 2. William J. Kirkpatrick composed the exuberant tune that perfectly matched the triumphant proclamation of the text. It became one of the most important hymns of the early Pentecostal movement.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "O spread the tidings 'round, wherever man is found,",
          "Wherever human hearts and human woes abound;",
          "Let every Christian tongue proclaim the joyful sound:",
          "The Comforter has come!"
        ]},
        { type: "chorus", lines: [
          "The Comforter has come, the Comforter has come!",
          "The Holy Ghost from heav'n, the Father's promise giv'n;",
          "O spread the tidings 'round, wherever man is found—",
          "The Comforter has come!"
        ]},
        { type: "verse", number: 2, lines: [
          "The long, long night is past, the morning breaks at last,",
          "And hushed the dreadful wail and fury of the blast,",
          "As o'er the golden hills the day advances fast!",
          "The Comforter has come!"
        ]},
        { type: "verse", number: 3, lines: [
          "Lo, the great King of kings, with healing in His wings,",
          "To every captive soul a full deliv'rance brings;",
          "And through the vacant cells the song of triumph rings:",
          "The Comforter has come!"
        ]},
        { type: "verse", number: 4, lines: [
          "O boundless love divine! How shall this tongue of mine",
          "To wond'ring mortals tell the matchless grace divine—",
          "That I, a child of hell, should in His image shine!",
          "The Comforter has come!"
        ]},
        { type: "verse", number: 5, lines: [
          "Sing, till the echoes fly above the vaulted sky,",
          "And all the saints above to all below reply,",
          "In strains of endless love, the song that ne'er will die:",
          "The Comforter has come!"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 15. Blessed Be the Name
  // ───────────────────────────────────────────────
  {
    id: "blessed-be-the-name",
    title: "Blessed Be the Name",
    author: "Charles Wesley",
    composer: "Ralph E. Hudson",
    year: 1885,
    categories: ["pentecostal", "praise", "worship"],
    scriptureRefs: [
      { ref: "Psalm 113:2", note: "Blessed be the name of the Lord from this time forth and for evermore" },
      { ref: "Psalm 72:19", note: "Blessed be his glorious name for ever: and let the whole earth be filled with his glory" },
      { ref: "Acts 4:12", note: "There is none other name under heaven given among men, whereby we must be saved" }
    ],
    story: "The verses of this hymn are adapted from a poem by Charles Wesley, the great Methodist hymn writer, while Ralph E. Hudson arranged the hymn and added the well-known chorus in 1885. Hudson was a Union Army veteran who became an influential gospel song compiler in Alliance, Ohio. The hymn's exuberant praise of the name of Jesus made it a natural fit for the enthusiastic worship style of Pentecostal and revival services. It remains one of the most recognizable praise hymns in the tradition.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "All praise to Him who reigns above",
          "In majesty supreme,",
          "Who gave His Son for man to die,",
          "That He might man redeem!"
        ]},
        { type: "chorus", lines: [
          "Blessed be the name, blessed be the name,",
          "Blessed be the name of the Lord!",
          "Blessed be the name, blessed be the name,",
          "Blessed be the name of the Lord!"
        ]},
        { type: "verse", number: 2, lines: [
          "His name above all names shall stand,",
          "Exalted more and more,",
          "At God the Father's own right hand,",
          "Where angel hosts adore."
        ]},
        { type: "verse", number: 3, lines: [
          "Redeemer, Savior, Friend of man",
          "Once ruined by the fall,",
          "Thou hast devised salvation's plan,",
          "For Thou hast died for all."
        ]},
        { type: "verse", number: 4, lines: [
          "His name shall be the Counselor,",
          "The mighty Prince of Peace,",
          "Of all earth's kingdoms Conqueror,",
          "Whose reign shall never cease."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 16. There Shall Be Showers of Blessing
  // ───────────────────────────────────────────────
  {
    id: "showers-of-blessing",
    title: "There Shall Be Showers of Blessing",
    author: "Daniel W. Whittle",
    composer: "James McGranahan",
    year: 1883,
    categories: ["pentecostal", "revival", "prayer"],
    scriptureRefs: [
      { ref: "Ezekiel 34:26", note: "I will cause the shower to come down in his season; there shall be showers of blessing" },
      { ref: "Isaiah 44:3", note: "I will pour water upon him that is thirsty, and floods upon the dry ground" }
    ],
    story: "Daniel Webster Whittle was a Civil War major who became a prominent evangelist after the war. He wrote this hymn in 1883, taking the title directly from Ezekiel 34:26. Whittle often worked alongside the musician James McGranahan, who composed the tune. The hymn's imagery of spiritual refreshing through showers of blessing resonated deeply with revival congregations who longed for outpourings of the Holy Spirit. It became a prayer anthem in Pentecostal and Holiness camp meetings.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "\"There shall be showers of blessing:\"",
          "This is the promise of love;",
          "There shall be seasons refreshing,",
          "Sent from the Savior above."
        ]},
        { type: "chorus", lines: [
          "Showers of blessing,",
          "Showers of blessing we need;",
          "Mercy-drops round us are falling,",
          "But for the showers we plead."
        ]},
        { type: "verse", number: 2, lines: [
          "\"There shall be showers of blessing\"—",
          "Precious reviving again;",
          "Over the hills and the valleys,",
          "Sound of abundance of rain."
        ]},
        { type: "verse", number: 3, lines: [
          "\"There shall be showers of blessing;\"",
          "Send them upon us, O Lord;",
          "Grant to us now a refreshing,",
          "Come, and now honor Thy Word."
        ]},
        { type: "verse", number: 4, lines: [
          "\"There shall be showers of blessing:\"",
          "O that today they might fall,",
          "Now as to God we're confessing,",
          "Now as on Jesus we call!"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 17. Send the Light
  // ───────────────────────────────────────────────
  {
    id: "send-the-light",
    title: "Send the Light",
    author: "Charles H. Gabriel",
    composer: "Charles H. Gabriel",
    year: 1890,
    categories: ["pentecostal", "missions", "evangelism"],
    scriptureRefs: [
      { ref: "Matthew 28:19", note: "Go ye therefore, and teach all nations" },
      { ref: "John 8:12", note: "I am the light of the world: he that followeth me shall not walk in darkness" },
      { ref: "Isaiah 60:1", note: "Arise, shine; for thy light is come, and the glory of the Lord is risen upon thee" }
    ],
    story: "Charles Hutchinson Gabriel was one of the most prolific gospel songwriters of the late nineteenth and early twentieth centuries, composing over 7,000 hymns. He wrote 'Send the Light' in 1890 as a missions hymn calling Christians to spread the gospel to every corner of the world. The hymn captured the missionary zeal that was a defining feature of both the Holiness movement and the emerging Pentecostal movement. Its stirring melody and urgent call made it popular at missionary conventions and revival gatherings.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "There's a call comes ringing o'er the restless wave,",
          "\"Send the light! Send the light!\"",
          "There are souls to rescue, there are souls to save,",
          "Send the light! Send the light!"
        ]},
        { type: "chorus", lines: [
          "Send the light, the blessed gospel light;",
          "Let it shine from shore to shore!",
          "Send the light, the blessed gospel light;",
          "Let it shine forevermore!"
        ]},
        { type: "verse", number: 2, lines: [
          "We have heard the Macedonian call today,",
          "\"Send the light! Send the light!\"",
          "And a golden off'ring at the cross we lay,",
          "Send the light! Send the light!"
        ]},
        { type: "verse", number: 3, lines: [
          "Let us pray that grace may everywhere abound,",
          "\"Send the light! Send the light!\"",
          "And a Christlike spirit everywhere be found,",
          "Send the light! Send the light!"
        ]},
        { type: "verse", number: 4, lines: [
          "Let us not grow weary in the work of love,",
          "\"Send the light! Send the light!\"",
          "Let us gather jewels for a crown above,",
          "Send the light! Send the light!"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 18. Since Jesus Came into My Heart
  // ───────────────────────────────────────────────
  {
    id: "since-jesus-came-into-my-heart",
    title: "Since Jesus Came into My Heart",
    author: "Rufus H. McDaniel",
    composer: "Charles H. Gabriel",
    year: 1914,
    categories: ["pentecostal", "testimony", "joy"],
    scriptureRefs: [
      { ref: "2 Corinthians 5:17", note: "If any man be in Christ, he is a new creature: old things are passed away" },
      { ref: "Revelation 3:20", note: "Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in" },
      { ref: "Romans 8:1", note: "There is therefore now no condemnation to them which are in Christ Jesus" }
    ],
    story: "Rufus Henry McDaniel was an Ohio minister who wrote this joyful testimony hymn in 1914 during a time of personal sorrow. His son had recently undergone a serious surgical operation, and as McDaniel sat in anxiety, he reflected on the difference Christ had made in his life. Charles Gabriel, who had already composed thousands of gospel songs, set the words to an irresistibly joyful tune. The hymn's personal testimony style made it especially popular in Pentecostal churches where sharing one's experience of salvation was central to worship.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "What a wonderful change in my life has been wrought",
          "Since Jesus came into my heart!",
          "I have light in my soul for which long I had sought,",
          "Since Jesus came into my heart!"
        ]},
        { type: "chorus", lines: [
          "Since Jesus came into my heart,",
          "Since Jesus came into my heart,",
          "Floods of joy o'er my soul like the sea billows roll,",
          "Since Jesus came into my heart."
        ]},
        { type: "verse", number: 2, lines: [
          "I have ceased from my wand'ring and going astray,",
          "Since Jesus came into my heart!",
          "And my sins, which were many, are all washed away,",
          "Since Jesus came into my heart!"
        ]},
        { type: "verse", number: 3, lines: [
          "I'm possessed of a hope that is steadfast and sure,",
          "Since Jesus came into my heart!",
          "And no dark clouds of doubt now my pathway obscure,",
          "Since Jesus came into my heart!"
        ]},
        { type: "verse", number: 4, lines: [
          "There's a light in the valley of death now for me,",
          "Since Jesus came into my heart!",
          "And the gates of the City beyond I can see,",
          "Since Jesus came into my heart!"
        ]},
        { type: "verse", number: 5, lines: [
          "I shall go there to dwell in that City, I know,",
          "Since Jesus came into my heart!",
          "And I'm happy, so happy, as onward I go,",
          "Since Jesus came into my heart!"
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 19. 'Tis So Sweet to Trust in Jesus
  // ───────────────────────────────────────────────
  {
    id: "tis-so-sweet-to-trust-in-jesus",
    title: "'Tis So Sweet to Trust in Jesus",
    author: "Louisa M. R. Stead",
    composer: "William J. Kirkpatrick",
    year: 1882,
    categories: ["pentecostal", "trust", "faith"],
    scriptureRefs: [
      { ref: "Proverbs 3:5", note: "Trust in the Lord with all thine heart; and lean not unto thine own understanding" },
      { ref: "Isaiah 12:2", note: "I will trust, and not be afraid: for the Lord Jehovah is my strength and my song" }
    ],
    story: "Louisa Stead wrote this hymn around 1882 following a devastating personal tragedy. She and her husband witnessed a boy drowning at a beach on Long Island, and her husband drowned trying to save the child. Left a widow with a young daughter and no income, Stead clung to her faith in God. Out of that crucible of suffering came this tender hymn of trust. William Kirkpatrick composed the melody, and the hymn has comforted countless believers facing their own trials.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "'Tis so sweet to trust in Jesus,",
          "Just to take Him at His word;",
          "Just to rest upon His promise,",
          "Just to know, \"Thus saith the Lord.\""
        ]},
        { type: "chorus", lines: [
          "Jesus, Jesus, how I trust Him!",
          "How I've proved Him o'er and o'er!",
          "Jesus, Jesus, precious Jesus!",
          "O for grace to trust Him more!"
        ]},
        { type: "verse", number: 2, lines: [
          "O how sweet to trust in Jesus,",
          "Just to trust His cleansing blood;",
          "Just in simple faith to plunge me",
          "'Neath the healing, cleansing flood!"
        ]},
        { type: "verse", number: 3, lines: [
          "Yes, 'tis sweet to trust in Jesus,",
          "Just from sin and self to cease;",
          "Just from Jesus simply taking",
          "Life and rest, and joy and peace."
        ]},
        { type: "verse", number: 4, lines: [
          "I'm so glad I learned to trust Thee,",
          "Precious Jesus, Savior, Friend;",
          "And I know that Thou art with me,",
          "Wilt be with me to the end."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  },

  // ───────────────────────────────────────────────
  // 20. In the Garden
  // ───────────────────────────────────────────────
  {
    id: "in-the-garden",
    title: "In the Garden",
    author: "C. Austin Miles",
    composer: "C. Austin Miles",
    year: 1912,
    categories: ["pentecostal", "devotion", "worship"],
    scriptureRefs: [
      { ref: "John 20:15-16", note: "Jesus saith unto her, Mary. She turned herself, and saith unto him, Rabboni" },
      { ref: "Song of Solomon 2:1", note: "I am the rose of Sharon, and the lily of the valleys" },
      { ref: "Genesis 3:8", note: "They heard the voice of the Lord God walking in the garden in the cool of the day" }
    ],
    story: "C. Austin Miles wrote both the words and music of this hymn in March 1912. He later recounted that one day while reading the twentieth chapter of John, describing Mary Magdalene's encounter with the risen Christ in the garden, the scene became so vivid in his imagination that he seemed to be standing at the garden tomb himself. Under this spiritual inspiration, he wrote the words and then went to the organ and composed the melody. The hymn became one of the most beloved devotional songs of the twentieth century, expressing the intimate personal relationship with Christ that is central to Pentecostal spirituality.",
    lyrics: {
      structure: [
        { type: "verse", number: 1, lines: [
          "I come to the garden alone,",
          "While the dew is still on the roses;",
          "And the voice I hear, falling on my ear,",
          "The Son of God discloses."
        ]},
        { type: "chorus", lines: [
          "And He walks with me, and He talks with me,",
          "And He tells me I am His own;",
          "And the joy we share as we tarry there,",
          "None other has ever known."
        ]},
        { type: "verse", number: 2, lines: [
          "He speaks, and the sound of His voice",
          "Is so sweet the birds hush their singing,",
          "And the melody that He gave to me",
          "Within my heart is ringing."
        ]},
        { type: "verse", number: 3, lines: [
          "I'd stay in the garden with Him",
          "Though the night around me be falling,",
          "But He bids me go; through the voice of woe",
          "His voice to me is calling."
        ]}
      ]
    },
    translations: [],
    publicDomain: true,
    source: "Public Domain"
  }
];
