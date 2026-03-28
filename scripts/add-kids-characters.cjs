const fs = require("fs");
let data = fs.readFileSync("src/app/components/KidsCurriculumData.js", "utf8");

const chars = [
  [1,  "God the Creator","\u{1F451}","God created the entire universe just by speaking!","Genesis 1:1"],
  [2,  "Adam & Eve","\u{1F34E}","The first man and woman, made in God\u2019s image!","Genesis 1:27"],
  [3,  "Noah","\u{1F6A2}","Built an ark to save his family and the animals from the flood!","Genesis 6:14"],
  [4,  "The Tower Builders","\u{1F5FC}","Tried to build a tower to reach heaven, but God scattered them!","Genesis 11:4"],
  [5,  "Abraham","\u2B50","Left everything to follow God and became father of many nations!","Genesis 12:1"],
  [6,  "Isaac","\u{1F411}","The promised son whose birth made his mother laugh with joy!","Genesis 21:6"],
  [7,  "Jacob","\u{1FA9C}","Saw angels going up and down a ladder to heaven in a dream!","Genesis 28:12"],
  [8,  "Joseph","\u{1F9E5}","Sold by his brothers but became ruler of Egypt!","Genesis 50:20"],
  [9,  "Baby Moses","\u{1F476}","Hidden in a basket on the river and found by a princess!","Exodus 2:10"],
  [10, "Moses","\u{1F525}","God spoke to him from a burning bush that did not burn up!","Exodus 3:2"],
  [11, "The Passover Lamb","\u{1F411}","The blood of the lamb protected God\u2019s people from judgment!","Exodus 12:13"],
  [12, "Moses at the Red Sea","\u{1F30A}","God split the sea in two so His people could walk through on dry ground!","Exodus 14:21"],
  [13, "Moses on Sinai","\u26F0\uFE0F","Received the Ten Commandments from God on a mountain of fire and thunder!","Exodus 20:1"],
  [14, "The Tabernacle","\u26FA","A beautiful tent where God lived among His people in the wilderness!","Exodus 25:8"],
  [15, "Joshua","\u{1F3F0}","Led God\u2019s people into the Promised Land and conquered Jericho!","Joshua 1:9"],
  [16, "Deborah","\u2694\uFE0F","A brave judge and prophetess who led Israel to victory!","Judges 4:14"],
  [17, "Samson","\u{1F4AA}","The strongest man who ever lived, but pride was his weakness!","Proverbs 16:18"],
  [18, "Gideon","\u{1F526}","Defeated a massive army with just 300 men, torches, and trumpets!","Judges 7:7"],
  [19, "Ruth","\u{1F33E}","Left her homeland to stay with her mother-in-law and found God\u2019s blessing!","Ruth 1:16"],
  [20, "Hannah & Samuel","\u{1F64F}","Hannah prayed for a son and dedicated him to serve God!","1 Samuel 1:27"],
  [21, "Young Samuel","\u{1F442}","Heard God\u2019s voice calling him in the night when he was just a boy!","1 Samuel 3:10"],
  [22, "David & Goliath","\u{1FAA8}","A shepherd boy defeated a giant with just a stone and a sling!","1 Samuel 17:47"],
  [23, "David & Jonathan","\u{1F91D}","Best friends who showed loyal love even when it was dangerous!","1 Samuel 18:3"],
  [24, "King David","\u{1F451}","A shepherd who became king and wrote many of the Psalms!","2 Samuel 7:16"],
  [25, "Solomon","\u{1F4DA}","Asked God for wisdom instead of riches and became the wisest king!","1 Kings 3:9"],
  [26, "Elijah","\u{1F525}","Called down fire from heaven to prove that God is the true God!","1 Kings 18:39"],
  [27, "Elisha","\u2728","Performed miracles and helped a poor widow save her family!","2 Kings 4:6"],
  [28, "Isaiah","\u{1F4DC}","Saw God on His throne and volunteered to be His messenger!","Isaiah 6:8"],
  [29, "Jeremiah","\u{1F4A7}","Called by God before he was born to be a prophet to the nations!","Jeremiah 1:5"],
  [30, "Shadrach, Meshach & Abednego","\u{1F525}","Thrown into a fiery furnace but God protected them from the flames!","Daniel 3:25"],
  [31, "Daniel","\u{1F981}","Prayed to God even when it meant being thrown to the lions!","Daniel 6:22"],
  [32, "Jonah","\u{1F40B}","Ran from God, was swallowed by a great fish, then obeyed!","Jonah 2:9"],
  [33, "Esther","\u{1F478}","A brave queen who risked her life to save her people!","Esther 4:14"],
  [34, "Nehemiah","\u{1F9F1}","Rebuilt the walls of Jerusalem in just 52 days!","Nehemiah 2:18"],
  [35, "The Psalms","\u{1F3B5}","150 songs of praise, prayer, and worship to God!","Psalm 23:1"],
  [36, "The Suffering Servant","\u271D\uFE0F","Isaiah prophesied about Jesus hundreds of years before He was born!","Isaiah 53:5"],
  [37, "Zechariah & Elizabeth","\u{1F474}","An elderly couple who received the miracle of a baby!","Luke 1:13"],
  [38, "Mary","\u{1F4AB}","A young woman chosen by God to be the mother of Jesus!","Luke 1:38"],
  [39, "Baby Jesus","\u2B50","The Son of God was born in a humble manger in Bethlehem!","Luke 2:11"],
  [40, "John the Baptist","\u{1F30A}","Prepared the way for Jesus and baptised Him in the Jordan River!","Matthew 3:3"],
  [41, "Jesus the Teacher","\u{1F4D6}","Taught the Sermon on the Mount, the greatest sermon ever preached!","Matthew 5:2"],
  [42, "Jesus Calms the Storm","\u26F5","Even the wind and waves obey Him!","Mark 4:39"],
  [43, "Jesus Feeds 5000","\u{1F35E}","Fed 5000 people with just five loaves and two fish!","John 6:11"],
  [44, "The Prodigal Son","\u{1F3E0}","A story Jesus told about a father who never stops loving his son!","Luke 15:24"],
  [45, "Zacchaeus","\u{1F333}","A short tax collector who climbed a tree to see Jesus!","Luke 19:9"],
  [46, "Jesus Enters Jerusalem","\u{1F33F}","Rode into Jerusalem on a donkey while crowds waved palm branches!","Matthew 21:9"],
  [47, "Jesus at the Last Supper","\u{1F377}","Shared bread and wine with His disciples to remember His sacrifice!","Luke 22:19"],
  [48, "Jesus on the Cross","\u271D\uFE0F","Died on the cross to save the world from sin!","John 3:16"],
  [49, "The Risen Jesus","\u{1F305}","Rose from the dead on the third day. Death could not hold Him!","Matthew 28:6"],
  [50, "Jesus Ascends","\u2601\uFE0F","Gave the Great Commission and ascended to heaven!","Matthew 28:19"],
  [51, "The Holy Spirit","\u{1F525}","Came at Pentecost and gave the disciples power to spread the gospel!","Acts 2:4"],
  [52, "The New Creation","\u{1F308}","One day Jesus will return and make all things new!","Revelation 21:5"],
];

let count = 0;
for (const [week, name, icon, fact, verse] of chars) {
  const re = new RegExp("(week: " + week + ",\\r?\\n[\\s\\S]*?ageGroups: \\[\"3-5\",\"6-8\",\"9-12\"\\],)");
  const match = data.match(re);
  if (match) {
    const obj = JSON.stringify({ name, icon, fact, verse });
    data = data.replace(match[1], match[1] + "\r\n\r\n    character: " + obj + ",");
    count++;
  }
}

fs.writeFileSync("src/app/components/KidsCurriculumData.js", data);
console.log("Added character data to " + count + " lessons");
const found = [...data.matchAll(/character:/g)];
console.log("Character fields found: " + found.length);
