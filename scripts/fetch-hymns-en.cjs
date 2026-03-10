#!/usr/bin/env node
/**
 * Fetch public-domain English hymn lyrics from OpenHymnal project (GitHub)
 * Source: https://github.com/mzealey/openhymnal (ABC notation files)
 * All hymns confirmed public domain by the OpenHymnal maintainer.
 *
 * Parses ABC w: lines to extract lyrics, outputs hymn-data-seasonal.cjs
 * Usage: node scripts/fetch-hymns-en.cjs
 */

const https = require("https");
const fs = require("fs");
const path = require("path");

const RAW_BASE = "https://raw.githubusercontent.com/mzealey/openhymnal/master/Complete";
const DELAY_MS = 500;

// ─── 51 NEW hymns not in classic/pentecostal data ─────────────────────
// Each: { dir, file (ABC filename), title, author, composer, year, categories, scriptureRefs, story }
const TARGET_HYMNS = [
  // ── Christmas (12) ──
  { dir: "Joy_To_The_World", file: "Joy_To_The_World-Antioch.abc", title: "Joy to the World", author: "Isaac Watts", composer: "George Frideric Handel (arr. Lowell Mason)", year: 1719, categories: ["christmas", "praise"], scriptureRefs: ["Psalm 98:4-9"], story: "Isaac Watts paraphrased Psalm 98 to celebrate the coming of Christ as King. Handel's majestic melody, arranged by Lowell Mason, became inseparable from these triumphant words." },
  { dir: "Silent_Night", file: "Silent_Night-Stille_Nacht.abc", title: "Silent Night", author: "Joseph Mohr", composer: "Franz Xaver Gruber", year: 1818, categories: ["christmas", "worship"], scriptureRefs: ["Luke 2:7-14"], story: "Written on Christmas Eve 1818 in Oberndorf, Austria. When the church organ broke, Fr. Mohr brought a poem to schoolteacher Gruber, who set it to guitar. The simplest carol became the world's most beloved." },
  { dir: "O_Come_All_Ye_Faithful", file: "O_Come_All_Ye_Faithful-Adeste_Fideles-Portugese_Hymn.abc", title: "O Come All Ye Faithful", author: "John Francis Wade", composer: "John Francis Wade", year: 1751, categories: ["christmas", "worship"], scriptureRefs: ["Luke 2:15-20"], story: "Originally written in Latin as 'Adeste Fideles' by Wade, a Catholic layman copying manuscripts in exile. The English translation by Frederick Oakeley (1841) became the definitive call to Christmas worship." },
  { dir: "Hark_The_Herald_Angels_Sing", file: "Hark_The_Herald_Angels_Sing-Mendelssohn.abc", title: "Hark the Herald Angels Sing", author: "Charles Wesley", composer: "Felix Mendelssohn", year: 1739, categories: ["christmas", "praise"], scriptureRefs: ["Luke 2:13-14"], story: "Wesley's original opened 'Hark how all the welkin rings!' His friend George Whitefield changed it to the familiar form. Mendelssohn's cantata melody was adapted by Cummings in 1855." },
  { dir: "O_Little_Town_Of_Bethlehem", file: "O_Little_Town_Of_Bethlehem-St_Louis.abc", title: "O Little Town of Bethlehem", author: "Phillips Brooks", composer: "Lewis Redner", year: 1868, categories: ["christmas", "worship"], scriptureRefs: ["Micah 5:2", "Luke 2:4-7"], story: "Phillips Brooks wrote this after visiting Bethlehem in 1865. His church organist Lewis Redner composed the melody, saying it came to him in a dream on Christmas Eve." },
  { dir: "Away_In_A_Manger", file: "Away_In_A_Manger-Mueller.abc", title: "Away in a Manger", author: "Anonymous", composer: "James R. Murray", year: 1885, categories: ["christmas", "children"], scriptureRefs: ["Luke 2:7", "Luke 2:12"], story: "Long attributed to Martin Luther, scholars now believe it was written by American Lutherans. Its gentle simplicity made it a favorite children's Christmas hymn worldwide." },
  { dir: "Angels_We_Have_Heard_On_High", file: "Angels_We_Have_Heard_On_High-Gloria.abc", title: "Angels We Have Heard on High", author: "Traditional French", composer: "Traditional French", year: null, categories: ["christmas", "praise"], scriptureRefs: ["Luke 2:13-14"], story: "This French carol dates to at least the 18th century. The soaring 'Gloria in excelsis Deo' refrain captures the angels' announcement to the shepherds." },
  { dir: "The_First_Noel", file: "The_First_Noel-The_First_Noel.abc", title: "The First Noel", author: "Traditional English", composer: "Traditional English", year: null, categories: ["christmas", "praise"], scriptureRefs: ["Luke 2:8-20", "Matthew 2:1-2"], story: "An English carol from as early as the 13th century, first published in 1823. It narrates the Christmas story from the shepherds' perspective through the visit of the Magi." },
  { dir: "It_Came_Upon_A_Midnight_Clear", file: "It_Came_Upon_A_Midnight_Clear-Carol.abc", title: "It Came Upon the Midnight Clear", author: "Edmund Sears", composer: "Richard Storrs Willis", year: 1849, categories: ["christmas", "comfort"], scriptureRefs: ["Luke 2:13-14"], story: "Written by Unitarian pastor Edmund Sears during a period of social upheaval. Unique among carols for its focus on peace and the angels' song echoing through a weary world." },
  { dir: "God_Rest_Ye_Merry_Gentlemen", file: "God_Rest_Ye_Merry_Gentlemen-God_Rest_Ye_Merry_Gentlemen.abc", title: "God Rest Ye Merry Gentlemen", author: "Traditional English", composer: "Traditional English", year: null, categories: ["christmas", "praise"], scriptureRefs: ["Luke 2:10-11"], story: "One of the oldest English carols, dating to the 15th century or earlier. 'Rest ye merry' means 'keep you content' — the carol tells the Christmas story as a ballad of great comfort and joy." },
  { dir: "I_Heard_The_Bells_On_Christmas_Day", file: "I_Heard_The_Bells_On_Christmas_Day-Waltham_Calkin.abc", title: "I Heard the Bells on Christmas Day", author: "Henry Wadsworth Longfellow", composer: "Jean Baptiste Calkin", year: 1863, categories: ["christmas", "comfort"], scriptureRefs: ["Luke 2:14", "Romans 8:28"], story: "Longfellow wrote this poem on Christmas Day 1863, during the Civil War, after his son was severely wounded. The final verses affirm that God is not dead and wrong shall fail — a testament of faith through suffering." },
  { dir: "What_Child_Is_This", file: "What_Child_Is_This-Greensleeves.abc", title: "What Child Is This", author: "William Chatterton Dix", composer: "Traditional English (Greensleeves)", year: 1865, categories: ["christmas", "worship"], scriptureRefs: ["Luke 2:12-16"], story: "Dix wrote this during a severe illness that kept him bedridden for months. Set to the beloved Greensleeves melody, it asks the timeless question about the identity of the baby in Bethlehem." },

  // ── Easter (4) ──
  { dir: "Christ_The_Lord_Is_Risen_Today", file: "Christ_The_Lord_Is_Risen_Today-Llanfair.abc", title: "Christ the Lord Is Risen Today", author: "Charles Wesley", composer: "From Lyra Davidica", year: 1739, categories: ["easter", "praise"], scriptureRefs: ["1 Corinthians 15:55-57", "Matthew 28:6"], story: "Wesley wrote this triumphant hymn for the first service at the Foundery Chapel in London. The repeated 'Alleluia' was added to fit the 14th-century Easter melody from Lyra Davidica." },
  { dir: "Christ_Arose", file: "Christ_Arose-Christ_Arose.abc", title: "Christ Arose (Low in the Grave He Lay)", author: "Robert Lowry", composer: "Robert Lowry", year: 1874, categories: ["easter", "praise"], scriptureRefs: ["Matthew 28:6", "Romans 6:9"], story: "Lowry, a Baptist pastor, wrote both words and music. The quiet, minor-key verses describing Christ's burial burst into the triumphant major-key chorus: 'He arose! Hallelujah! Christ arose!'" },
  { dir: "Were_You_There", file: "Were_You_There-Were_You_There.abc", title: "Were You There", author: "Traditional African American Spiritual", composer: "Traditional", year: null, categories: ["easter", "worship"], scriptureRefs: ["Matthew 27:35-50", "Matthew 28:1-6"], story: "An African American spiritual dating to the early 19th century. Its haunting simplicity invites personal witness of the crucifixion and resurrection." },
  { dir: "Alleluia_Alleluia_Hearts_to_Heaven_and_Voices_Raise", file: "Alleluia_Alleluia_Hearts_to_Heaven_and_Voices_Raise-Ode_To_Joy.abc", title: "Alleluia! Hearts to Heaven", author: "Christopher Wordsworth", composer: "Ludwig van Beethoven", year: 1862, categories: ["easter", "praise"], scriptureRefs: ["Revelation 5:12-13"], story: "Wordsworth, nephew of the poet William Wordsworth, wrote this jubilant Easter hymn. Set to Beethoven's Ode to Joy, it captures the exuberance of resurrection morning." },

  // ── Children (2) ──
  { dir: "Jesus_Loves_Me", file: "Jesus_Loves_Me-untitled.abc", title: "Jesus Loves Me", author: "Anna Bartlett Warner", composer: "William Bradbury", year: 1860, categories: ["children", "comfort"], scriptureRefs: ["Mark 10:14", "John 3:16"], story: "Originally a poem in Susan Warner's novel 'Say and Seal,' spoken to comfort a dying child. Bradbury added the chorus 'Yes, Jesus loves me!' It became the most widely sung children's hymn in history." },
  { dir: "I_Am_Jesus_Little_Lamb", file: "I_Am_Jesus_Little_Lamb-Weil_Ich_Jesu_Schaflein_Bin.abc", title: "I Am Jesus' Little Lamb", author: "Henrietta von Hayn", composer: "Traditional German", year: 1778, categories: ["children", "comfort"], scriptureRefs: ["John 10:14", "Psalm 23:1"], story: "Written by a Moravian deaconess for the children in her care. Its tender imagery of Jesus as the Good Shepherd carrying His little lamb speaks to the heart of childlike faith." },

  // ── Worship / Praise (11) ──
  { dir: "Joyful_Joyful_We_Adore_Thee", file: "Joyful_Joyful_We_Adore_Thee-Ode_To_Joy.abc", title: "Joyful Joyful We Adore Thee", author: "Henry van Dyke", composer: "Ludwig van Beethoven", year: 1907, categories: ["praise", "worship"], scriptureRefs: ["Psalm 100", "Psalm 148"], story: "Van Dyke wrote this poem while at Williams College, inspired by the Berkshire Mountains. He specified it be sung to Beethoven's 'Ode to Joy' — a perfect marriage of words and music." },
  { dir: "Praise_God_From_Whom_All_Blessings_Flow", file: "Praise_God_From_Whom_All_Blessings_Flow-Old_100th.abc", title: "Praise God from Whom All Blessings Flow (Doxology)", author: "Thomas Ken", composer: "Louis Bourgeois", year: 1674, categories: ["worship", "praise"], scriptureRefs: ["Psalm 150:6", "Ephesians 1:3"], story: "Bishop Thomas Ken wrote this as the final stanza of both his morning and evening hymns for Winchester College students. It became the most frequently sung verse in Christian worship." },
  { dir: "Immortal_Invisible_God_Only_Wise", file: "Immortal_Invisible_God_Only_Wise-St_Denio.abc", title: "Immortal Invisible God Only Wise", author: "Walter Chalmers Smith", composer: "Welsh Hymn Melody", year: 1867, categories: ["worship", "classic"], scriptureRefs: ["1 Timothy 1:17", "1 Timothy 6:16"], story: "Scottish Free Church minister Smith drew on 1 Timothy 1:17 to describe God's transcendent attributes. The Welsh melody 'St. Denio' gives energy to these theological meditations on God's eternal nature." },
  { dir: "Jesus_Shall_Reign", file: "Jesus_Shall_Reign-Duke_Street.abc", title: "Jesus Shall Reign", author: "Isaac Watts", composer: "John Hatton", year: 1719, categories: ["mission", "praise"], scriptureRefs: ["Psalm 72:8-19"], story: "Watts paraphrased Psalm 72 as a missionary hymn about Christ's universal kingdom. It was sung at the coronation of King George II and became an anthem of the global missionary movement." },
  { dir: "All_Creatures_Of_Our_God_And_King", file: "All_Creatures_Of_Our_God_And_King-Lasst_Uns_Erfreuen.abc", title: "All Creatures of Our God and King", author: "St. Francis of Assisi (tr. William H. Draper)", composer: "Geistliche Kirchengesäng", year: 1225, categories: ["praise", "worship"], scriptureRefs: ["Psalm 148", "Daniel 3:57-88"], story: "Francis of Assisi composed 'Canticle of the Sun' near the end of his life, nearly blind. Draper's English translation set to the German melody captures Francis's joyful creation theology." },
  { dir: "For_The_Beauty_Of_The_Earth", file: "For_The_Beauty_Of_The_Earth-Dix.abc", title: "For the Beauty of the Earth", author: "Folliot S. Pierpoint", composer: "Conrad Kocher", year: 1864, categories: ["praise", "worship"], scriptureRefs: ["Psalm 19:1", "Genesis 1:31"], story: "Pierpoint wrote this at age 29, inspired by the beautiful countryside around Bath, England. Originally a communion hymn, its grateful celebration of creation has made it one of the most beloved hymns of thanksgiving." },
  { dir: "Holy_God_We_Praise_Thy_Name", file: "Holy_God_We_Praise_Thy_Name-Te_Deum-Hursley.abc", title: "Holy God We Praise Thy Name", author: "Ignaz Franz (tr. Clarence Walworth)", composer: "Katholisches Gesangbuch", year: 1774, categories: ["worship", "classic"], scriptureRefs: ["Isaiah 6:3", "Revelation 4:8"], story: "Based on the Te Deum, this German Catholic hymn crossed all denominational boundaries. The melody from the Katholisches Gesangbuch of 1774 has a noble simplicity that befits worship of the Almighty." },
  { dir: "O_Come_O_Come_Emmanuel", file: "O_Come_O_Come_Emmanuel-Veni_Emmanuel.abc", title: "O Come O Come Emmanuel", author: "Latin Hymn (tr. John Mason Neale)", composer: "15th Century French", year: null, categories: ["christmas", "worship"], scriptureRefs: ["Isaiah 7:14", "Matthew 1:23"], story: "These ancient Advent antiphons date to at least the 8th century. Neale's translation and the haunting medieval melody create one of the most profound expressions of longing for the Messiah." },
  { dir: "Now_Thank_We_All_Our_God", file: "Now_Thank_We_All_Our_God-Nun_Danket.abc", title: "Now Thank We All Our God", author: "Martin Rinkart (tr. Catherine Winkworth)", composer: "Johann Crüger", year: 1636, categories: ["praise", "worship"], scriptureRefs: ["Psalm 106:1", "Sirach 50:22-24"], story: "Rinkart wrote this during the Thirty Years' War while serving as the only pastor in Eilenburg. Despite burying over 4,000 people including his wife, he composed this magnificent hymn of gratitude." },
  { dir: "Praise_My_Soul_The_King_Of_Heaven", file: "Praise_My_Soul_The_King_Of_Heaven-Praise_My_Soul-Lauda_Anima.abc", title: "Praise My Soul the King of Heaven", author: "Henry Francis Lyte", composer: "John Goss", year: 1834, categories: ["praise", "worship"], scriptureRefs: ["Psalm 103:1-5"], story: "Lyte paraphrased Psalm 103 into this magnificent hymn of praise. It was sung at the wedding of Princess Elizabeth (later Queen Elizabeth II) in 1947 and remains a favorite at royal occasions." },
  { dir: "Praise_The_Lord_Ye_Heavens_Adore_Him", file: "Praise_The_Lord_Ye_Heavens_Adore_Him-Austria_Haydn-Austrian_Hymn.abc", title: "Praise the Lord Ye Heavens Adore Him", author: "Edward Osler", composer: "Franz Joseph Haydn", year: 1796, categories: ["praise", "worship"], scriptureRefs: ["Psalm 148"], story: "Based on Psalm 148, this hymn calls on all creation — from heavenly hosts to earthly creatures — to praise the Lord. Haydn's 'Austria' melody, originally the Austrian national anthem, provides a fittingly majestic setting." },

  // ── Grace / Classic (8) ──
  { dir: "Faith_Of_Our_Fathers", file: "Faith_Of_Our_Fathers-St_Catherine.abc", title: "Faith of Our Fathers", author: "Frederick William Faber", composer: "Henri F. Hemy", year: 1849, categories: ["classic", "worship"], scriptureRefs: ["Hebrews 11:1-2", "2 Timothy 1:5"], story: "Faber wrote this as a tribute to English martyrs. Protestants adopted it with altered words, making it a universal hymn about faithful perseverance through persecution." },
  { dir: "Savior_Like_A_Shepherd_Lead_Us", file: "Savior_Like_A_Shepherd_Lead_Us-Bradbury.abc", title: "Saviour Like a Shepherd Lead Us", author: "Dorothy A. Thrupp (attr.)", composer: "William Bradbury", year: 1836, categories: ["comfort", "grace"], scriptureRefs: ["Psalm 23", "John 10:11-14"], story: "Published anonymously in Thrupp's 'Hymns for the Young.' The shepherd imagery weaves Psalm 23 and John 10 into a tender prayer for guidance." },
  { dir: "He_Leadeth_Me", file: "He_Leadeth_Me-He_Leadeth_Me.abc", title: "He Leadeth Me", author: "Joseph Gilmore", composer: "William Bradbury", year: 1862, categories: ["comfort", "classic"], scriptureRefs: ["Psalm 23:2-3", "Isaiah 40:11"], story: "Gilmore wrote these words after preaching on Psalm 23. His wife sent the poem to a newspaper without his knowledge. He discovered it had been published and set to music years later in a hymnbook." },
  { dir: "Under_His_Wings", file: "Under_His_Wings-Under_His_Wings.abc", title: "Under His Wings", author: "William Cushing", composer: "Ira Sankey", year: 1896, categories: ["comfort", "worship"], scriptureRefs: ["Psalm 91:4", "Ruth 2:12"], story: "Cushing, who lost his wife and his ability to preach due to illness, found solace in Psalm 91. Sankey composed the protective melody that shelters these words of trust." },
  { dir: "God_Will_Take_Care_Of_You", file: "God_Will_Take_Care_Of_You-Martin.abc", title: "God Will Take Care of You", author: "Civilla Martin", composer: "Walter Stillman Martin", year: 1904, categories: ["comfort", "classic"], scriptureRefs: ["1 Peter 5:7", "Matthew 6:25-34"], story: "Civilla wrote this while ill. Their young son said 'Father, if God wants you to preach, He will take care of Mother.' The hymn flowed from that childlike faith." },
  { dir: "Rescue_the_Perishing", file: "Rescue_the_Perishing-Rescue_the_Perishing.abc", title: "Rescue the Perishing", author: "Fanny Crosby", composer: "William Doane", year: 1869, categories: ["mission", "grace"], scriptureRefs: ["Luke 19:10", "Jude 1:23"], story: "Inspired by Crosby's work at New York City rescue missions. After speaking to a crowd, a young man approached saying he'd promised his mother to meet her in heaven." },
  { dir: "More_Love_To_Thee", file: "More_Love_To_Thee-More_Love_To_Thee.abc", title: "More Love to Thee O Christ", author: "Elizabeth Prentiss", composer: "William Doane", year: 1856, categories: ["worship", "grace"], scriptureRefs: ["Philippians 3:8-10", "1 John 4:19"], story: "Prentiss wrote this during a period of deep grief after losing two children. She kept it hidden for years before her husband discovered and published it. Its honest prayer for deeper love through suffering resonates with all who grieve." },
  { dir: "O_For_A_Thousand_Tongues", file: "O_For_A_Thousand_Tongues-Azmon.abc", title: "O for a Thousand Tongues to Sing", author: "Charles Wesley", composer: "Carl G. Gläser (arr. Lowell Mason)", year: 1739, categories: ["praise", "worship"], scriptureRefs: ["Psalm 51:15", "Psalm 103:1-5"], story: "Wesley wrote this on the first anniversary of his conversion. The title came from Peter Böhler's words: 'Had I a thousand tongues, I would praise Him with them all.' It opens most Methodist hymnals." },

  // ── Mission (3) ──
  { dir: "Hark_The_Voice_Of_Jesus_Calling", file: "Hark_The_Voice_Of_Jesus_Calling-Galilean.abc", title: "Hark the Voice of Jesus Calling", author: "Daniel March", composer: "Joseph Barnby", year: 1868, categories: ["mission", "worship"], scriptureRefs: ["Isaiah 6:8", "Matthew 9:37-38"], story: "March based this on Isaiah's call: 'Whom shall I send, and who will go for us?' It became a beloved missionary hymn, challenging Christians to answer God's call to service." },
  { dir: "He_Was_Not_Willing", file: "He_Was_Not_Willing-He_Was_Not_Willing.abc", title: "He Was Not Willing", author: "Lucy R. Meyer", composer: "Unknown", year: 1882, categories: ["mission", "grace"], scriptureRefs: ["2 Peter 3:9", "John 3:17"], story: "Meyer, a pioneer of the Methodist deaconess movement, wrote this reflecting on God's unwillingness that any should perish. Her social work among Chicago's poor gave these words lived authenticity." },
  { dir: "We_Give_Thee_But_Thine_Own", file: "We_Give_Thee_But_Thine_Own-Energy.abc", title: "We Give Thee But Thine Own", author: "William Walsham How", composer: "Robert A. Smith", year: 1858, categories: ["mission", "worship"], scriptureRefs: ["1 Chronicles 29:14", "2 Corinthians 9:7"], story: "Bishop How, known as 'the poor man's bishop' for his work in London's East End, wrote this stewardship hymn reminding Christians that all we have belongs to God." },

  // ── Communion (2) ──
  { dir: "Let_All_Mortal_Flesh_Keep_Silence", file: "Let_All_Mortal_Flesh_Keep_Silence-Picardy.abc", title: "Let All Mortal Flesh Keep Silence", author: "Liturgy of St. James (tr. Gerard Moultrie)", composer: "French Carol (Picardy)", year: null, categories: ["communion", "worship"], scriptureRefs: ["Habakkuk 2:20", "Isaiah 6:1-3"], story: "This ancient communion hymn from the Liturgy of St. James (4th century) describes the awesome mystery of Christ's presence. The haunting French melody 'Picardy' deepens its sense of holy reverence." },
  { dir: "Twas_On_That_Dark_That_Doleful_Night", file: "Twas_On_That_Dark_That_Doleful_Night-St_Cross.abc", title: "'Twas on That Dark That Doleful Night", author: "Isaac Watts", composer: "Freeman Lewis", year: 1709, categories: ["communion", "classic"], scriptureRefs: ["1 Corinthians 11:23-26", "Luke 22:19-20"], story: "Watts based this communion hymn directly on Paul's account of the Last Supper. Its solemn retelling of that final evening reminds believers why they gather at the Lord's Table." },

  // ── More Comfort / Classic (9) ──
  { dir: "Be_Still_My_Soul", file: "Be_Still_My_Soul-Finlandia.abc", title: "Be Still My Soul", author: "Katharina von Schlegel (tr. Jane Borthwick)", composer: "Jean Sibelius", year: 1752, categories: ["comfort", "worship"], scriptureRefs: ["Psalm 46:10", "Isaiah 41:10"], story: "Originally German, this hymn of patient trust was paired with Sibelius's Finlandia melody in 1933. It counsels quiet confidence in God through every trial — a favorite of missionaries and martyrs." },
  { dir: "Come_Ye_Disconsolate", file: "Come_Ye_Disconsolate-Consolator_Webbe.abc", title: "Come Ye Disconsolate", author: "Thomas Moore (revised by Thomas Hastings)", composer: "Samuel Webbe Sr.", year: 1816, categories: ["comfort", "grace"], scriptureRefs: ["Matthew 11:28", "Psalm 34:18"], story: "Irish poet Thomas Moore wrote the original, which Hastings revised. Its invitation to bring sorrows to the mercy seat, where 'earth has no sorrow that heaven cannot heal,' has comforted millions." },
  { dir: "The_Churchs_One_Foundation", file: "The_Churchs_One_Foundation-Aurelia.abc", title: "The Church's One Foundation", author: "Samuel John Stone", composer: "Samuel Sebastian Wesley", year: 1866, categories: ["classic", "worship"], scriptureRefs: ["1 Corinthians 3:11", "Ephesians 2:20"], story: "Stone wrote this during a bitter theological controversy to affirm what unites Christians: Jesus Christ. Wesley's noble 'Aurelia' tune (meaning 'golden') gave these words of unity their enduring power." },
  { dir: "Glorious_Things_of_Thee_Are_Spoken", file: "Glorious_Things_of_Thee_Are_Spoken-Austria_Haydn-Austrian_Hymn.abc", title: "Glorious Things of Thee Are Spoken", author: "John Newton", composer: "Franz Joseph Haydn", year: 1779, categories: ["classic", "praise"], scriptureRefs: ["Psalm 87:3", "Isaiah 33:20-21"], story: "Newton, the former slave trader who wrote Amazing Grace, composed this celebration of Zion as God's dwelling place. Haydn's Austrian Hymn melody lends it a grandeur befitting the New Jerusalem." },
  { dir: "Beneath_The_Cross_Of_Jesus", file: "Beneath_The_Cross_Of_Jesus-St_Christopher.abc", title: "Beneath the Cross of Jesus", author: "Elizabeth Clephane", composer: "Frederick Maker", year: 1868, categories: ["grace", "worship"], scriptureRefs: ["Galatians 6:14", "John 19:25"], story: "Clephane, a Scottish poet known for her generosity to the poor, wrote this shortly before her death at 39. Its vivid imagery of standing beneath the cross as 'a mighty Rock within a weary land' is deeply personal." },
  { dir: "O_Sacred_Head_Now_Wounded", file: "O_Sacred_Head_Now_Wounded-Passion_Chorale-Herzlich_Tut_Mich_Verlangen.abc", title: "O Sacred Head Now Wounded", author: "Bernard of Clairvaux (attr., tr. James Alexander)", composer: "Hans Leo Hassler", year: 1153, categories: ["easter", "worship"], scriptureRefs: ["Isaiah 53:3-5", "Matthew 27:29"], story: "This medieval Latin poem, attributed to Bernard, contemplates Christ's face on the cross. Bach used the melody in his St. Matthew Passion, cementing its place as the supreme Passion hymn." },
  { dir: "Moment_By_Moment", file: "Moment_By_Moment-Whittle.abc", title: "Moment by Moment", author: "Daniel Whittle", composer: "May Whittle Moody", year: 1893, categories: ["comfort", "worship"], scriptureRefs: ["Deuteronomy 33:27", "Psalm 73:23-26"], story: "Born from a conversation between Whittle and D.L. Moody about the difference between 'dying grace' and 'living grace.' His daughter May composed the melody, making it a family collaboration of faith." },
  { dir: "The_God_Of_Abraham_Praise", file: "The_God_Of_Abraham_Praise-Yigdal-Leoni.abc", title: "The God of Abraham Praise", author: "Thomas Olivers", composer: "Meyer Lyon (Leoni)", year: 1770, categories: ["worship", "classic"], scriptureRefs: ["Genesis 17:7", "Hebrews 11:8-10"], story: "Olivers, a Welsh cobbler turned Methodist preacher, heard cantor Meyer Lyon sing the Hebrew Yigdal in a London synagogue and was so moved he wrote this Christian adaptation. The melody 'Leoni' preserves the original Jewish cantorial style." },
  { dir: "The_Love_Of_God", file: "The_Love_Of_God-The_Love_Of_God.abc", title: "The Love of God", author: "Frederick M. Lehman", composer: "Frederick M. Lehman", year: 1917, categories: ["worship", "grace"], scriptureRefs: ["Romans 8:38-39", "Ephesians 3:17-19"], story: "Lehman found the final stanza written in pencil on the wall of a mental asylum room. The anonymous patient had versified an ancient Jewish poem about God's love being wider than the ocean. Lehman built the hymn around this discovery." },
];

function fetchFile(url) {
  return new Promise((resolve, reject) => {
    https.get(url, { headers: { "User-Agent": "StudyBible/1.0" } }, (res) => {
      if (res.statusCode !== 200) return reject(new Error(`HTTP ${res.statusCode}`));
      let data = "";
      res.on("data", (c) => (data += c));
      res.on("end", () => resolve(data));
    }).on("error", reject);
  });
}

function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms));
}

/**
 * Parse lyrics from ABC notation w: lines.
 * ABC format interleaves verse lines: first lines of all verses, then second lines, etc.
 * Lines starting with N.~ are verse N beginnings.
 */
function parseAbcLyrics(abc) {
  const lines = abc.split("\n");
  const wLines = lines.filter((l) => /^[wW]:/.test(l)).map((l) => l.replace(/^[wW]:\s*/, ""));

  if (wLines.length === 0) return [];

  // Detect how many verses by looking for numbered prefixes (1.~, 2.~, 1. , 2. , etc.)
  const verseNumRegex = /^\d+[.][~\s]/;
  const numberedLines = wLines.filter((l) => verseNumRegex.test(l));
  const numVerses = numberedLines.length;

  if (numVerses === 0) {
    // No verse numbers — treat all as one verse
    const text = wLines
      .map((l) => cleanAbcLyric(l))
      .filter((l) => l.length > 0)
      .join(" ");
    return [{ type: "verse", number: 1, lines: splitIntoLines(text) }];
  }

  // Group w: lines into "rounds" — each round has numVerses lines
  // Round 1 = first line of each verse, Round 2 = second line, etc.
  // Handle trailing shared lines (e.g., chorus sung by all verses)
  const fullRounds = Math.floor(wLines.length / numVerses);
  const remainder = wLines.length % numVerses;
  const rounds = [];
  for (let i = 0; i < fullRounds * numVerses; i += numVerses) {
    rounds.push(wLines.slice(i, i + numVerses));
  }
  // Remainder lines are shared across all verses (chorus/refrain)
  const sharedLines = remainder > 0 ? wLines.slice(fullRounds * numVerses) : [];

  // Build verses by collecting corresponding lines from each round
  const verses = [];
  const verseStripRegex = /^\d+[.][~\s]+/;
  for (let v = 0; v < numVerses; v++) {
    let text = "";
    for (let r = 0; r < rounds.length; r++) {
      if (rounds[r][v]) {
        let line = rounds[r][v];
        // Remove verse number prefix from first round
        if (r === 0) line = line.replace(verseStripRegex, "");
        const cleaned = cleanAbcLyric(line);
        if (cleaned) text += (text ? " " : "") + cleaned;
      }
    }
    // Append shared lines to each verse
    for (const sl of sharedLines) {
      const cleaned = cleanAbcLyric(sl);
      if (cleaned) text += (text ? " " : "") + cleaned;
    }
    if (text.trim()) {
      verses.push({
        type: "verse",
        number: v + 1,
        lines: splitIntoLines(text),
      });
    }
  }

  return verses;
}

/**
 * Clean ABC lyric notation:
 * - Remove melisma markers (*) — they indicate notes held over
 * - Join hyphenated syllables (re- ceive → receive)
 * - Clean up whitespace
 */
function cleanAbcLyric(text) {
  return text
    .replace(/\*/g, "") // remove melisma markers
    .replace(/\s*-\s*/g, "") // join hyphenated syllables
    .replace(/\s{2,}/g, " ") // normalize whitespace
    .replace(/~+/g, " ") // ~ is word continuation in ABC
    .trim();
}

/**
 * Split a long text into hymn lines (roughly at punctuation or ~30-50 char boundaries)
 */
function splitIntoLines(text) {
  // Split at semicolons, commas followed by space + capital, or periods
  // But keep natural sentence flow
  const parts = text.split(/[;.!?]+\s*/).filter((p) => p.trim());

  if (parts.length >= 2) {
    return parts.map((p) => p.trim().replace(/,$/, ""));
  }

  // If no clear sentence breaks, split at commas
  const commaParts = text.split(/,\s*/).filter((p) => p.trim());
  if (commaParts.length >= 3) {
    // Rejoin pairs for natural line lengths
    const lines = [];
    for (let i = 0; i < commaParts.length; i += 2) {
      if (i + 1 < commaParts.length) {
        lines.push(commaParts[i] + ", " + commaParts[i + 1]);
      } else {
        lines.push(commaParts[i]);
      }
    }
    return lines;
  }

  // Fallback: split at approximate midpoint
  if (text.length > 60) {
    const mid = Math.floor(text.length / 2);
    const spaceIdx = text.indexOf(" ", mid);
    if (spaceIdx > 0) {
      return [text.substring(0, spaceIdx).trim(), text.substring(spaceIdx).trim()];
    }
  }

  return [text.trim()];
}

function slugify(title) {
  return title
    .toLowerCase()
    .replace(/['']/g, "")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-|-$/g, "");
}

async function main() {
  console.log("=== Fetching English Hymns from OpenHymnal (GitHub) ===\n");

  const results = [];
  const failed = [];
  let idCounter = 200;

  for (let i = 0; i < TARGET_HYMNS.length; i++) {
    const h = TARGET_HYMNS[i];
    // Try to find the ABC file
    const url = `${RAW_BASE}/${h.dir}/${h.file}`;
    process.stdout.write(`[${i + 1}/${TARGET_HYMNS.length}] ${h.title}... `);

    try {
      const abc = await fetchFile(url);
      const structure = parseAbcLyrics(abc);

      if (structure.length === 0) {
        console.log("WARN: no lyrics parsed, adding with empty lyrics");
      } else {
        console.log(`OK (${structure.length} verses)`);
      }

      results.push({
        id: `en-${idCounter++}`,
        lang: "en",
        title: h.title,
        author: h.author,
        composer: h.composer || "Unknown",
        year: h.year,
        categories: h.categories,
        scriptureRefs: h.scriptureRefs,
        story: h.story,
        lyrics: { structure },
        translations: [],
        publicDomain: true,
        source: `OpenHymnal Project (public domain) — ${h.dir}`,
      });
    } catch (err) {
      console.log(`ERROR: ${err.message}`);
      // Still add with empty lyrics
      failed.push(h.title);
      results.push({
        id: `en-${idCounter++}`,
        lang: "en",
        title: h.title,
        author: h.author,
        composer: h.composer || "Unknown",
        year: h.year,
        categories: h.categories,
        scriptureRefs: h.scriptureRefs,
        story: h.story,
        lyrics: { structure: [] },
        translations: [],
        publicDomain: true,
        source: `OpenHymnal Project (public domain) — lyrics pending`,
      });
    }

    if (i < TARGET_HYMNS.length - 1) await sleep(DELAY_MS);
  }

  // Write output
  const outPath = path.join(__dirname, "hymn-data-seasonal.cjs");
  const code = `// English seasonal/worship/children hymns — lyrics from OpenHymnal Project (public domain)
// Source: https://github.com/mzealey/openhymnal
// Generated: ${new Date().toISOString()}
// Total: ${results.length} hymns
module.exports = ${JSON.stringify(results, null, 2)};
`;
  fs.writeFileSync(outPath, code, "utf8");

  console.log(`\n✓ Wrote ${results.length} hymns to hymn-data-seasonal.cjs`);
  if (failed.length) {
    console.log(`⚠ ${failed.length} failed to fetch: ${failed.join(", ")}`);
  }

  // Summary
  const cats = {};
  results.forEach((r) => r.categories.forEach((c) => (cats[c] = (cats[c] || 0) + 1)));
  console.log("\nCategory breakdown:");
  Object.entries(cats)
    .sort((a, b) => b[1] - a[1])
    .forEach(([k, v]) => console.log(`  ${k}: ${v}`));

  console.log(`\nNext: node scripts/build-hymns.cjs && npx next build`);
}

main().catch(console.error);
