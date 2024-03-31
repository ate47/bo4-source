begin "gamedata/ddl/generated/cp_stats.ddl";
version 19;
metatable "hash_a05a70f64959e7b7";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_6962b6aa0c4853f4 facialfeatureproperties[5];
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[56];
    uint24 higheststats[6];
    hash_1608f63ae729eda5 weaponstats[200];
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    int32 combattrainingwins;
    uint4 currentweaponlevels[64];
    uint64 connectionid;
    hash_722a4055916df1ff hash_7dd9f1ac62a346d;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    uint4 currenthitlocationindex;
    uint32 hash_6dcaad4976588a44;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    uint32 hash_3de5a4846f45ad78[19];
    hash_2e0567490210dd82 playerstatsbymap[10];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_78a2c506849f9dda bunkcollectibles;
    uint64 hash_188ecc3aca50f93d;
    uint32 achievements[2];
    hash_2e1d3d3bb036d22c playerstatsbygametype[12];
    byte demonwareflags[32];
    uint5 companion;
    float skill_rating;
    int32 unlocktokencount_attachment;
    uint32 hash_3313a30250a39ec5;
    float hash_2363e7e74077b1c0[12];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    uint3 faction;
    hash_5cb2d75a230a501f trainingsimstats;
    hash_6ef8b9b7a8fd75e1 groupstats[21];
    uint4 hash_191fbfb9e1a3acf3;
    float hash_54a74aa3d5f3346d;
    hash_6b3db80d498eb06 playerstatslist[379];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[12];
    hash_6b411bb770fc8f6c afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    uint32 highestmapreached;
    bit hash_3ceb201776787882;
    hash_7690a9df20146d8a zmcampaigndata;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_46e7db8ceaba5b2f;
    bit hash_711b1260308620e7[20];
    bit playercpdecorations[20];
    bit hash_8cbe2e4ecb4fc43;
    bit completedfirsttimeflow;
    bit completedchallengeseen[77];
    padbit __pad[6];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_5ef0b8418736fce5 {
    uint24 score;
    bit valid;
    padbit __pad[7];
};

struct hash_6962b6aa0c4853f4 {
    float properties[20];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[19];
    bit hash_798921f18e351b13[8];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_722a4055916df1ff {
    uint32 hash_2b12202dea292a78;
    uint32 hash_65157f3e7aec5b46;
    uint32 hash_256e550d360e7cf6;
    uint32 hash_34212151b945069b;
    uint32 numplayers;
    uint32 hash_477109e1674d778e;
    uint32 hash_6f7512e92e96a86a;
    uint32 hash_52086efefda6cd87;
    uint32 hash_4c59bf00eb8047c0;
    uint32 hash_4cda3bb269028c08;
    uint32 hash_c159a616c8e909f;
    uint32 hash_1b75e7812ae582a0;
    uint32 hash_6e3edce84270ac4c;
    uint32 hash_3ed0ae0744c78900;
    uint32 hash_24bfa4caccae7ccc;
};

struct hash_ca5eede65d9c59e {
    uint32 stats[8];
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_2e0567490210dd82 {
    uint3 hash_bf847c54dac3b;
    uint32 higheststats[6];
    uint32 currentstats[6];
    uint32 hash_7787ac0184215bc1;
    hash_63565a3d40f66255 accolades[19];
    uint32 hash_3cd96ca92c6f0d4c;
    short hash_1cc8d841efacb52a;
    bit hash_1e0160af4fd80dff[6];
    bit hash_518113a79b08988[6];
    bit allcollectiblescollected;
    bit checkpointused;
    bit collectibles[10];
    bit hash_71b609b078e360c0;
    bit hash_657891d65d881524[6];
    bit hasbeencompleted;
    bit hash_233621878f97486b[6];
    padbit __pad[2];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_78a2c506849f9dda {
    hash_2efa05c484e77181 collectibles[10];
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_5cb2d75a230a501f {
    uint5 hash_44b4e9269c8dc12d;
    uint32 highestscore;
    uint32 hash_1b146f5d12b2b147;
    uint32 hash_25ce643c6cf6507e;
    uint32 hash_52dbe660cac88df9;
    bit ranksachieved[4];
    padbit __pad[4];
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[19];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6b411bb770fc8f6c {
    hash_656bfcb3838e2907 playerstats[12];
    bit valid;
    bit matchwon;
    bit privatematch;
    bit viewed;
    padbit __pad[4];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[640];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[19];
    bit hash_798921f18e351b13[8];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_7690a9df20146d8a {
    bit unlocked;
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_63565a3d40f66255 {
    uint2 state;
    uint32 value;
    uint32 highestvalue;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_2efa05c484e77181 {
    char mapname[40];
    uint4 collectibleindex;
    bit set;
    padbit __pad[7];
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_656bfcb3838e2907 {
    char name[32];
    char xuid[32];
    uint32 curxp;
    short kills;
    uint32 prvxp;
    short score;
    short revives;
    short currank;
    short deaths;
    short medals[3];
    short assists;
    short hash_59ef59765ff3f049;
    bit isactive;
    padbit __pad[7];
};

struct hash_18562676c03c7954 {
    bit purchased;
    bit markedold;
    bit unlocked;
    padbit __pad[5];
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_stats.ddl";
version 18;
metatable "hash_afe1d1921c4dede1";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_6962b6aa0c4853f4 facialfeatureproperties[5];
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[56];
    uint24 higheststats[6];
    hash_1608f63ae729eda5 weaponstats[200];
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    int32 combattrainingwins;
    uint4 currentweaponlevels[64];
    uint64 connectionid;
    hash_722a4055916df1ff hash_7dd9f1ac62a346d;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    uint4 currenthitlocationindex;
    uint32 hash_6dcaad4976588a44;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    uint32 hash_3de5a4846f45ad78[19];
    hash_2e0567490210dd82 playerstatsbymap[10];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_78a2c506849f9dda bunkcollectibles;
    uint64 hash_188ecc3aca50f93d;
    uint32 achievements[2];
    hash_2e1d3d3bb036d22c playerstatsbygametype[12];
    byte demonwareflags[32];
    uint5 companion;
    float skill_rating;
    int32 unlocktokencount_attachment;
    uint32 hash_3313a30250a39ec5;
    float hash_2363e7e74077b1c0[12];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    uint3 faction;
    hash_5cb2d75a230a501f trainingsimstats;
    hash_6ef8b9b7a8fd75e1 groupstats[21];
    uint4 hash_191fbfb9e1a3acf3;
    float hash_54a74aa3d5f3346d;
    hash_6b3db80d498eb06 playerstatslist[379];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[12];
    hash_6b411bb770fc8f6c afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    uint32 highestmapreached;
    bit hash_3ceb201776787882;
    hash_7690a9df20146d8a zmcampaigndata;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_46e7db8ceaba5b2f;
    bit hash_711b1260308620e7[20];
    bit playercpdecorations[20];
    bit hash_8cbe2e4ecb4fc43;
    bit completedfirsttimeflow;
    bit completedchallengeseen[77];
    padbit __pad[6];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_5ef0b8418736fce5 {
    uint24 score;
    bit valid;
    padbit __pad[7];
};

struct hash_6962b6aa0c4853f4 {
    float properties[20];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[19];
    bit hash_798921f18e351b13[8];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_722a4055916df1ff {
    uint32 hash_2b12202dea292a78;
    uint32 hash_65157f3e7aec5b46;
    uint32 hash_256e550d360e7cf6;
    uint32 hash_34212151b945069b;
    uint32 numplayers;
    uint32 hash_477109e1674d778e;
    uint32 hash_6f7512e92e96a86a;
    uint32 hash_52086efefda6cd87;
    uint32 hash_4c59bf00eb8047c0;
    uint32 hash_4cda3bb269028c08;
    uint32 hash_c159a616c8e909f;
    uint32 hash_1b75e7812ae582a0;
    uint32 hash_6e3edce84270ac4c;
    uint32 hash_3ed0ae0744c78900;
    uint32 hash_24bfa4caccae7ccc;
};

struct hash_ca5eede65d9c59e {
    uint32 stats[8];
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_2e0567490210dd82 {
    uint3 hash_bf847c54dac3b;
    uint32 higheststats[6];
    uint32 currentstats[6];
    uint32 hash_7787ac0184215bc1;
    hash_63565a3d40f66255 accolades[19];
    uint32 hash_3cd96ca92c6f0d4c;
    short hash_1cc8d841efacb52a;
    bit hash_1e0160af4fd80dff[6];
    bit hash_518113a79b08988[6];
    bit allcollectiblescollected;
    bit checkpointused;
    bit collectibles[10];
    bit hash_71b609b078e360c0;
    bit hash_657891d65d881524[6];
    bit hasbeencompleted;
    bit hash_233621878f97486b[6];
    padbit __pad[2];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_78a2c506849f9dda {
    hash_2efa05c484e77181 collectibles[10];
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_5cb2d75a230a501f {
    uint5 hash_44b4e9269c8dc12d;
    uint32 highestscore;
    uint32 hash_1b146f5d12b2b147;
    uint32 hash_25ce643c6cf6507e;
    uint32 hash_52dbe660cac88df9;
    bit ranksachieved[4];
    padbit __pad[4];
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[19];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6b411bb770fc8f6c {
    hash_656bfcb3838e2907 playerstats[12];
    bit valid;
    bit matchwon;
    bit privatematch;
    bit viewed;
    padbit __pad[4];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[640];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[19];
    bit hash_798921f18e351b13[8];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_7690a9df20146d8a {
    bit unlocked;
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_63565a3d40f66255 {
    uint2 state;
    uint32 value;
    uint32 highestvalue;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_2efa05c484e77181 {
    char mapname[40];
    uint4 collectibleindex;
    bit set;
    padbit __pad[7];
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_656bfcb3838e2907 {
    char name[32];
    char xuid[32];
    uint32 curxp;
    short kills;
    uint32 prvxp;
    short score;
    short revives;
    short currank;
    short deaths;
    short medals[3];
    short assists;
    short hash_59ef59765ff3f049;
    bit isactive;
    padbit __pad[7];
};

struct hash_18562676c03c7954 {
    bit purchased;
    bit markedold;
    bit unlocked;
    padbit __pad[5];
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_stats.ddl";
version 17;
metatable "hash_298315c475e28de2";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_6962b6aa0c4853f4 facialfeatureproperties[5];
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[56];
    uint24 higheststats[6];
    hash_1608f63ae729eda5 weaponstats[200];
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    int32 combattrainingwins;
    uint4 currentweaponlevels[64];
    uint64 connectionid;
    hash_722a4055916df1ff hash_7dd9f1ac62a346d;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    uint4 currenthitlocationindex;
    uint32 hash_6dcaad4976588a44;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    uint32 hash_3de5a4846f45ad78[19];
    hash_2e0567490210dd82 playerstatsbymap[10];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_78a2c506849f9dda bunkcollectibles;
    uint64 hash_188ecc3aca50f93d;
    uint32 achievements[2];
    hash_2e1d3d3bb036d22c playerstatsbygametype[12];
    byte demonwareflags[32];
    uint5 companion;
    float skill_rating;
    int32 unlocktokencount_attachment;
    uint32 hash_3313a30250a39ec5;
    float hash_2363e7e74077b1c0[12];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    uint3 faction;
    hash_5cb2d75a230a501f trainingsimstats;
    hash_6ef8b9b7a8fd75e1 groupstats[21];
    uint4 hash_191fbfb9e1a3acf3;
    float hash_54a74aa3d5f3346d;
    hash_6b3db80d498eb06 playerstatslist[378];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[12];
    hash_6b411bb770fc8f6c afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    uint32 highestmapreached;
    bit hash_3ceb201776787882;
    hash_7690a9df20146d8a zmcampaigndata;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_46e7db8ceaba5b2f;
    bit hash_711b1260308620e7[20];
    bit playercpdecorations[20];
    bit hash_8cbe2e4ecb4fc43;
    bit completedfirsttimeflow;
    bit completedchallengeseen[77];
    padbit __pad[6];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_5ef0b8418736fce5 {
    uint24 score;
    bit valid;
    padbit __pad[7];
};

struct hash_6962b6aa0c4853f4 {
    float properties[20];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[19];
    bit hash_798921f18e351b13[8];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_722a4055916df1ff {
    uint32 hash_2b12202dea292a78;
    uint32 hash_65157f3e7aec5b46;
    uint32 hash_256e550d360e7cf6;
    uint32 hash_34212151b945069b;
    uint32 numplayers;
    uint32 hash_477109e1674d778e;
    uint32 hash_6f7512e92e96a86a;
    uint32 hash_52086efefda6cd87;
    uint32 hash_4c59bf00eb8047c0;
    uint32 hash_4cda3bb269028c08;
    uint32 hash_c159a616c8e909f;
    uint32 hash_1b75e7812ae582a0;
    uint32 hash_6e3edce84270ac4c;
    uint32 hash_3ed0ae0744c78900;
    uint32 hash_24bfa4caccae7ccc;
};

struct hash_ca5eede65d9c59e {
    uint32 stats[8];
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_2e0567490210dd82 {
    uint3 hash_bf847c54dac3b;
    uint32 higheststats[6];
    uint32 currentstats[6];
    uint32 hash_7787ac0184215bc1;
    hash_63565a3d40f66255 accolades[19];
    uint32 hash_3cd96ca92c6f0d4c;
    short hash_1cc8d841efacb52a;
    bit hash_1e0160af4fd80dff[6];
    bit hash_518113a79b08988[6];
    bit allcollectiblescollected;
    bit checkpointused;
    bit collectibles[10];
    bit hash_71b609b078e360c0;
    bit hash_657891d65d881524[6];
    bit hasbeencompleted;
    bit hash_233621878f97486b[6];
    padbit __pad[2];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_78a2c506849f9dda {
    hash_2efa05c484e77181 collectibles[10];
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_5cb2d75a230a501f {
    uint5 hash_44b4e9269c8dc12d;
    uint32 highestscore;
    uint32 hash_1b146f5d12b2b147;
    uint32 hash_25ce643c6cf6507e;
    uint32 hash_52dbe660cac88df9;
    bit ranksachieved[4];
    padbit __pad[4];
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[19];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6b411bb770fc8f6c {
    hash_656bfcb3838e2907 playerstats[12];
    bit valid;
    bit matchwon;
    bit privatematch;
    bit viewed;
    padbit __pad[4];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[640];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[19];
    bit hash_798921f18e351b13[8];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_7690a9df20146d8a {
    bit unlocked;
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_63565a3d40f66255 {
    uint2 state;
    uint32 value;
    uint32 highestvalue;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_2efa05c484e77181 {
    char mapname[40];
    uint4 collectibleindex;
    bit set;
    padbit __pad[7];
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_656bfcb3838e2907 {
    char name[32];
    char xuid[32];
    uint32 curxp;
    short kills;
    uint32 prvxp;
    short score;
    short revives;
    short currank;
    short deaths;
    short medals[3];
    short assists;
    short hash_59ef59765ff3f049;
    bit isactive;
    padbit __pad[7];
};

struct hash_18562676c03c7954 {
    bit purchased;
    bit markedold;
    bit unlocked;
    padbit __pad[5];
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_stats.ddl";
version 16;
metatable "hash_15439fd61ac36bd8";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_6962b6aa0c4853f4 facialfeatureproperties[5];
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[64];
    uint24 higheststats[6];
    hash_1608f63ae729eda5 weaponstats[200];
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    int32 combattrainingwins;
    uint4 currentweaponlevels[64];
    uint64 connectionid;
    hash_722a4055916df1ff hash_7dd9f1ac62a346d;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    uint4 currenthitlocationindex;
    uint32 hash_6dcaad4976588a44;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    uint32 hash_3de5a4846f45ad78[19];
    hash_2e0567490210dd82 playerstatsbymap[10];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_78a2c506849f9dda bunkcollectibles;
    uint64 hash_188ecc3aca50f93d;
    uint32 achievements[2];
    hash_2e1d3d3bb036d22c playerstatsbygametype[12];
    byte demonwareflags[32];
    uint5 companion;
    float skill_rating;
    int32 unlocktokencount_attachment;
    uint32 hash_3313a30250a39ec5;
    float hash_2363e7e74077b1c0[12];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    uint3 faction;
    hash_5cb2d75a230a501f trainingsimstats;
    hash_6ef8b9b7a8fd75e1 groupstats[21];
    uint4 hash_191fbfb9e1a3acf3;
    float hash_54a74aa3d5f3346d;
    hash_6b3db80d498eb06 playerstatslist[378];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[12];
    hash_6b411bb770fc8f6c afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    uint32 highestmapreached;
    bit hash_3ceb201776787882;
    hash_7690a9df20146d8a zmcampaigndata;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_46e7db8ceaba5b2f;
    bit hash_711b1260308620e7[20];
    bit playercpdecorations[20];
    bit hash_8cbe2e4ecb4fc43;
    bit completedfirsttimeflow;
    bit completedchallengeseen[77];
    padbit __pad[6];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_5ef0b8418736fce5 {
    uint24 score;
    bit valid;
    padbit __pad[7];
};

struct hash_6962b6aa0c4853f4 {
    float properties[20];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[19];
    bit hash_798921f18e351b13[8];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[64];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_722a4055916df1ff {
    uint32 hash_2b12202dea292a78;
    uint32 hash_65157f3e7aec5b46;
    uint32 hash_256e550d360e7cf6;
    uint32 hash_34212151b945069b;
    uint32 numplayers;
    uint32 hash_477109e1674d778e;
    uint32 hash_6f7512e92e96a86a;
    uint32 hash_52086efefda6cd87;
    uint32 hash_4c59bf00eb8047c0;
    uint32 hash_4cda3bb269028c08;
    uint32 hash_c159a616c8e909f;
    uint32 hash_1b75e7812ae582a0;
    uint32 hash_6e3edce84270ac4c;
    uint32 hash_3ed0ae0744c78900;
    uint32 hash_24bfa4caccae7ccc;
};

struct hash_ca5eede65d9c59e {
    uint32 stats[8];
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_2e0567490210dd82 {
    uint3 hash_bf847c54dac3b;
    uint32 higheststats[6];
    uint32 currentstats[6];
    uint32 hash_7787ac0184215bc1;
    hash_63565a3d40f66255 accolades[19];
    uint32 hash_3cd96ca92c6f0d4c;
    short hash_1cc8d841efacb52a;
    bit hash_1e0160af4fd80dff[6];
    bit hash_518113a79b08988[6];
    bit allcollectiblescollected;
    bit checkpointused;
    bit collectibles[10];
    bit hash_71b609b078e360c0;
    bit hash_657891d65d881524[6];
    bit hasbeencompleted;
    bit hash_233621878f97486b[6];
    padbit __pad[2];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_78a2c506849f9dda {
    hash_2efa05c484e77181 collectibles[10];
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_5cb2d75a230a501f {
    uint5 hash_44b4e9269c8dc12d;
    uint32 highestscore;
    uint32 hash_1b146f5d12b2b147;
    uint32 hash_25ce643c6cf6507e;
    uint32 hash_52dbe660cac88df9;
    bit ranksachieved[4];
    padbit __pad[4];
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[19];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6b411bb770fc8f6c {
    hash_656bfcb3838e2907 playerstats[12];
    bit valid;
    bit matchwon;
    bit privatematch;
    bit viewed;
    padbit __pad[4];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[640];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[19];
    bit hash_798921f18e351b13[8];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_7690a9df20146d8a {
    bit unlocked;
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_63565a3d40f66255 {
    uint2 state;
    uint32 value;
    uint32 highestvalue;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_2efa05c484e77181 {
    char mapname[40];
    uint4 collectibleindex;
    bit set;
    padbit __pad[7];
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_656bfcb3838e2907 {
    char name[32];
    char xuid[32];
    uint32 curxp;
    short kills;
    uint32 prvxp;
    short score;
    short revives;
    short currank;
    short deaths;
    short medals[3];
    short assists;
    short hash_59ef59765ff3f049;
    bit isactive;
    padbit __pad[7];
};

struct hash_18562676c03c7954 {
    bit purchased;
    bit markedold;
    bit unlocked;
    padbit __pad[5];
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


