begin "gamedata/ddl/generated/wz_stats.ddl";
version 95;
metatable "hash_5d63470a1282b52f";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[133];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 94;
metatable "hash_8c8f5dd570cb85ba";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[133];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 93;
metatable "hash_60712e0fbe6a14fc";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[132];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 92;
metatable "hash_a2e65d1b8b4daf45";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[132];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 91;
metatable "hash_8442ba8fd9156c0c";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[131];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 90;
metatable "hash_2dce6d58c3b52a47";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[129];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 89;
metatable "hash_75f642729a6f225e";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[129];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 88;
metatable "hash_4dbbf21aff61c526";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[127];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 87;
metatable "hash_4db10b7eb0c0be4d";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[127];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 86;
metatable "hash_3df1c4816b02c985";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[126];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 85;
metatable "hash_3ef0efccce05fe5a";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[125];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 84;
metatable "hash_b4e844ea35d0fd5e";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[125];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 83;
metatable "hash_81432b6f07208cb3";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[125];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 82;
metatable "hash_ff589b3ffe742f01";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[124];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 81;
metatable "hash_67a1c7a821804f99";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[123];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 80;
metatable "hash_b07d77749aa958bc";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[121];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 79;
metatable "hash_82301a7882517ddc";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[120];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 78;
metatable "hash_98d2e43bcdf49cb4";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[119];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 77;
metatable "hash_e0fcc1c03a99c5d0";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[118];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 76;
metatable "hash_27d4942616786550";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[116];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 75;
metatable "hash_46ad56e324aaf719";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[110];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 74;
metatable "hash_9a4cc39781e78cc1";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_1898703fb0109487 hash_6326a574b8674519[110];
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_1898703fb0109487 {
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_46f3e7d5ffaa28e0[512];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 73;
metatable "hash_51b74138df596d70";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[52];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[52];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[52];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 72;
metatable "hash_123022952b2c917e";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[51];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[51];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[51];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 71;
metatable "hash_3d1476dfffbf2bcb";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[50];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[50];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[50];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 70;
metatable "hash_dd5d5790e40976e9";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[49];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[49];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[49];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 69;
metatable "hash_c2d29960bbdf4825";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    int32 hash_2cad871e3d814528;
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[48];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[48];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[48];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 68;
metatable "hash_f1365e77aa114207";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[48];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[48];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[48];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 67;
metatable "hash_af609bc0bc33e227";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[48];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[48];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[48];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 66;
metatable "hash_adffd00c5b1adad9";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[48];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[48];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[48];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 65;
metatable "hash_f57e58d9dc6bbee4";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[47];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[47];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[47];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 64;
metatable "hash_d4f44fdf13565848";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[44];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[44];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[44];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_2fba7de572ece495;
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 63;
metatable "hash_c76e0c00eee61de";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[44];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[44];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[44];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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
begin "gamedata/ddl/generated/wz_stats.ddl";
version 62;
metatable "hash_34ee7e50cec0dc92";

struct root {
    dlc_t dlc;
    int32 unlocktokencount_weapon;
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_2339e5df69e53c;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 recentearnings[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_18e73148b3ebc305 bestleague;
    hash_503eb0de8f9cf7c2 gamehistory[2];
    uint16 hash_3540aca568b64a66;
    hash_67b00e3091cde2fd attachments[56];
    hash_7f2fae1cba22e3f1 tenthspecialistcontract;
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    hash_ca5eede65d9c59e variantstats[251];
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[38];
    byte demonwareflags[32];
    float skill_rating;
    hash_491be2fc5d00eea5 hash_4e249739468187c[10];
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[38];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    hash_45cca7748ed66b4c consumables[8];
    uint3 onboardingstate;
    uint64 securexuid;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    hash_491be2fc5d00eea5 contracts[10];
    float skill_variance;
    int32 mp_loot_xp_due;
    float hash_3a7324ad328f0e2e[38];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    uint64 playerxuid;
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit hash_3984c62cdaf83d6f;
    bit hash_53ee6ecac1b7764d;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit hash_3cb8945408d8aac5;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_27e1cd3f650a7573;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_1bfec553ee076dde;
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_7f2fae1cba22e3f1 {
    int15 remaining_time;
    uint3 hash_77a4cc2b9fc476e;
    uint5 hash_79c7ec2cb1424be5;
    bit special_card_earned;
    bit active;
    padbit __pad[6];
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
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

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
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

struct hash_491be2fc5d00eea5 {
    uint16 index;
    uint24 hash_32271b98ab28ea47;
    uint24 hash_32271a98ab28e894;
    uint24 progress;
    bit hash_2c2d1020cb1a97eb;
    bit hash_2c2d0f20cb1a9638;
    bit hash_2c2d1220cb1a9b51;
    bit hash_2c2d1120cb1a999e;
    bit active;
    bit hash_766ec4f61a382e04;
    padbit __pad[2];
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

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_45cca7748ed66b4c {
    uint32 awarded;
    uint32 consumed;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
    byte selectedfeature;
    hash_118b324c3f145926 features[14];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    uint4 layerspurchased;
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 materials[128];
    hash_2d74f509e9d33a86 layers[12];
    padbit __pad[4];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
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

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_118b324c3f145926 {
    bit purchased;
    bit markedold;
    padbit __pad[6];
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


