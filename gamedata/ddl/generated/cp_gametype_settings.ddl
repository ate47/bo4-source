// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_dce2cd2b6846cb17"

version 49 {
    // idx 1 members 309 size 0x998
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x8
        uint:5 hash_ecf2124e9108fc4;
        // offset 0x1a0, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1b0, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1c0, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1d0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1e0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e8, size 0x8
        uint:2 platoonassignment;
        // offset 0x1f0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1f8, size 0x8
        uint:5 maxallocation;
        // offset 0x200, size 0x8
        uint:4 carryscore;
        // offset 0x208, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x210, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x218, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x220, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x228, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x230, size 0x8
        uint:7 idleflagresettime;
        // offset 0x238, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x240, size 0x8
        uint:4 setbacks;
        // offset 0x248, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x268, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x278, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x288, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x298, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x2a8, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2b8, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2c8, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2d0, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2d8, size 0x10
        uint:15 scorelimit;
        // offset 0x2e8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2f0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2f8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x300, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x308, size 0x10
        uint:10 playermaxhealth;
        // offset 0x318, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x320, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x328, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x330, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4c0, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4c8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4d0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4d8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4e0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4e8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4f0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x500, size 0x8
        uint:5 boottime;
        // offset 0x508, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x510, size 0x8
        uint:6 hash_5d5f4ee35c9977c7;
        // offset 0x518, size 0x8
        uint:2 roundstartfriendlyfiretype;
        // offset 0x520, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x528, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x530, size 0x8
        uint:7 teamnumlives;
        // offset 0x538, size 0x8
        fixed<8,2> planttime;
        // offset 0x540, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x548, size 0x10
        uint:10 inactivitykick;
        // offset 0x558, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x560, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x588, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x598, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x5a8, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x5b8, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5c8, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5d0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5d8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5e0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5e8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5f0, size 0x10
        uint:11 objectivehealth;
        // offset 0x600, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x608, size 0x8
        uint:2 robotspeed;
        // offset 0x610, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x618, size 0x8
        uint:3 hash_68e3f54e05f57d85;
        // offset 0x620, size 0x8
        uint:7 servermsec;
        // offset 0x628, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x630, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x638, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x648, size 0x10
        uint:10 leaderbonus;
        // offset 0x658, size 0x8
        uint:5 hash_5c918cbf75e16116;
        // offset 0x660, size 0x8
        uint:3 hash_51e989796c38cd87;
        // offset 0x668, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x670, size 0x10
        uint:9 autodestroytime;
        // offset 0x680, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x688, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x690, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x698, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x6a0, size 0x8
        uint:6 prematchperiod;
        // offset 0x6a8, size 0x8
        uint:6 teamkillscore;
        // offset 0x6b0, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x6b8, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x6c0, size 0x8
        uint:3 platooncount;
        // offset 0x6c8, size 0x20
        int deployablebarrierhealth;
        // offset 0x6e8, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6f0, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6f8, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x700, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x708, size 0x8
        uint:7 playernumlives;
        // offset 0x710, size 0x8
        uint:2 infectionmode;
        // offset 0x718, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x720, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x728, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x730, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x738, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x740, size 0x8
        uint:6 reboottime;
        // offset 0x748, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x750, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x758, size 0x8
        uint:4 pickuptime;
        // offset 0x760, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x770, size 0x20
        int hash_64727525f5957d06;
        // offset 0x790, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x7b0, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x7b8, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x7c0, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x7c8, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x7d0, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x7d8, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7e8, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7f0, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7f8, size 0x8
        uint:7 startplayers;
        // offset 0x800, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x808, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x810, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x818, size 0x8
        uint:5 totalkillsmax;
        // offset 0x820, size 0x8
        uint:4 roundswitch;
        // offset 0x828, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x830, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x838, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x840, size 0x8
        uint:5 weaponcount;
        // offset 0x848, size 0x8
        uint:7 weapontimer;
        // offset 0x850, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x860, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x868, size 0x8
        uint:7 drafttime;
        // offset 0x870, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x878, size 0x8
        uint:7 objectivespawntime;
        // offset 0x880, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x890, size 0x8
        uint:4 throwscore;
        // offset 0x898, size 0x8
        uint:4 deposittime;
        // offset 0x8a0, size 0x10
        fixed<10,2> extratime;
        // offset 0x8b0, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x8b8, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x8c0, size 0x8
        uint:7 teamcount;
        // offset 0x8c8, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8e8, size 0x8
        uint:4 roundlimit;
        // offset 0x8f0, size 0x8
        uint:2 charactercustomization;
        // offset 0x8f8, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x900, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x908, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x910, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x920, size 0x1
        bool delayplayer;
        // offset 0x921, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x922, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x923, size 0x1
        bool hash_729930c3c52653c3;
        // offset 0x924, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x925, size 0x1
        bool draftenabled;
        // offset 0x926, size 0x1
        bool droppedtagrespawn;
        // offset 0x927, size 0x1
        bool voipkillershearvictim;
        // offset 0x928, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x929, size 0x1
        bool deathcirclerespawn;
        // offset 0x92a, size 0x1
        bool presetclassesperteam;
        // offset 0x92b, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x92c, size 0x1
        bool hardcoremode;
        // offset 0x92d, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x92e, size 0x1
        bool useitemspawns;
        // offset 0x92f, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x930, size 0x1
        bool silentplant;
        // offset 0x931, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x932, size 0x1
        bool drafteveryround;
        // offset 0x933, size 0x1
        bool timepauseswheninzone;
        // offset 0x934, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x935, size 0x1
        bool scoreperplayer;
        // offset 0x936, size 0x1
        bool ekiaresetondeath;
        // offset 0x937, size 0x1
        bool kothmode;
        // offset 0x938, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x939, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x93a, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x93b, size 0x1
        bool decayprogress;
        // offset 0x93c, size 0x1
        bool playerqueuedrespawn;
        // offset 0x93d, size 0x1
        bool cumulativeroundscores;
        // offset 0x93e, size 0x1
        bool voipdeadhearkiller;
        // offset 0x93f, size 0x1
        bool skiplaststand;
        // offset 0x940, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x941, size 0x1
        bool usespawngroups;
        // offset 0x942, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x943, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0x944, size 0x1
        bool allowbattlechatter;
        // offset 0x945, size 0x1
        bool fowrevealenabled;
        // offset 0x946, size 0x1
        bool disablecontracts;
        // offset 0x947, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x948, size 0x1
        bool allowannouncer;
        // offset 0x949, size 0x1
        bool disallowaimslowdown;
        // offset 0x94a, size 0x1
        bool vehiclesenabled;
        // offset 0x94b, size 0x1
        bool decaycapturedzones;
        // offset 0x94c, size 0x1
        bool neutralzone;
        // offset 0x94d, size 0x1
        bool boastallowcam;
        // offset 0x94e, size 0x1
        bool onlyheadshots;
        // offset 0x94f, size 0x1
        bool flagcapturecondition;
        // offset 0x950, size 0x1
        bool flagcanbeneutralized;
        // offset 0x951, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x952, size 0x1
        bool vehiclestimed;
        // offset 0x953, size 0x1
        bool pregamedraftenabled;
        // offset 0x954, size 0x1
        bool fogofwarminimap;
        // offset 0x955, size 0x1
        bool teamkillpointloss;
        // offset 0x956, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x957, size 0x1
        bool perksenabled;
        // offset 0x958, size 0x1
        bool hash_33bc6781006ae83d;
        // offset 0x959, size 0x1
        bool allowmapscripting;
        // offset 0x95a, size 0x1
        bool robotshield;
        // offset 0x95b, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x95c, size 0x1
        bool allowkillcam;
        // offset 0x95d, size 0x1
        bool disableattachments;
        // offset 0x95e, size 0x1
        bool disablecompass;
        // offset 0x95f, size 0x1
        bool disableweapondrop;
        // offset 0x960, size 0x1
        bool escalationenabled;
        // offset 0x961, size 0x1
        bool disablecac;
        // offset 0x962, size 0x1
        bool disableclassselection;
        // offset 0x963, size 0x1
        bool hash_48670d9509071424;
        // offset 0x964, size 0x1
        bool autoteambalance;
        // offset 0x965, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x966, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x967, size 0x1
        bool allowplayofthematch;
        // offset 0x968, size 0x1
        bool allowprone;
        // offset 0x969, size 0x1
        bool scoreresetondeath;
        // offset 0x96a, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x96b, size 0x1
        bool playerforcerespawn;
        // offset 0x96c, size 0x1
        bool multibomb;
        // offset 0x96d, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x96e, size 0x1
        bool deathcircle;
        // offset 0x96f, size 0x1
        bool boastenabled;
        // offset 0x970, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x971, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x972, size 0x1
        bool deathpointloss;
        // offset 0x973, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x974, size 0x1
        bool rebootplayers;
        // offset 0x975, size 0x1
        bool oldschoolmode;
        // offset 0x976, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x977, size 0x1
        bool allowfinalkillcam;
        // offset 0x978, size 0x1
        bool allowspectating;
        // offset 0x979, size 0x1
        bool usabledynents;
        // offset 0x97a, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x97b, size 0x1
        bool spawnselectenabled;
        // offset 0x97c, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x97d, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x97e, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x97f, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x980, size 0x1
        bool disallowprone;
        // offset 0x981, size 0x1
        bool moveplayers;
        // offset 0x982, size 0x1
        bool disabletacinsert;
        // offset 0x983, size 0x1
        bool voipdeadhearallliving;
        // offset 0x984, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x985, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x986, size 0x1
        bool flagcapturerateincrease;
        // offset 0x987, size 0x1
        bool use_doors;
        // offset 0x988, size 0x1
        bool pvponly;
        // offset 0x989, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x98a, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x98b, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x98c, size 0x1
        bool allowingameteamchange;
        // offset 0x98d, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x98e, size 0x1
        bool deathzones;
        // offset 0x98f, size 0x1
        bool classicmode;
        // offset 0x990, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x991, size 0x1
        bool capdecay;
        // offset 0x992, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x993, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x994, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x995, size 0x1
        bool laststandfinishing;
        // offset 0x996, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x997, size 0x1
        uint:1 __pad[1];
    };

    // idx 0 members 1 size 0x998
    // offset 0x0, size 0x998
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_68666b0a354cef8e"

version 48 {
    // idx 1 members 308 size 0x990
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x8
        uint:5 hash_ecf2124e9108fc4;
        // offset 0x1a0, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1b0, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1c0, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1d0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1e0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1f0, size 0x8
        uint:5 maxallocation;
        // offset 0x1f8, size 0x8
        uint:4 carryscore;
        // offset 0x200, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x208, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x210, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x218, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x220, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x228, size 0x8
        uint:7 idleflagresettime;
        // offset 0x230, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x238, size 0x8
        uint:4 setbacks;
        // offset 0x240, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x260, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x270, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x280, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x290, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x2a0, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2b0, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2c0, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c8, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2d0, size 0x10
        uint:15 scorelimit;
        // offset 0x2e0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2f0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x300, size 0x10
        uint:10 playermaxhealth;
        // offset 0x310, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x318, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x320, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x328, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b8, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4c0, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c8, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4d0, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d8, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4e0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f8, size 0x8
        uint:5 boottime;
        // offset 0x500, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x508, size 0x8
        uint:6 hash_5d5f4ee35c9977c7;
        // offset 0x510, size 0x8
        uint:2 roundstartfriendlyfiretype;
        // offset 0x518, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x520, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x528, size 0x8
        uint:7 teamnumlives;
        // offset 0x530, size 0x8
        fixed<8,2> planttime;
        // offset 0x538, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x540, size 0x10
        uint:10 inactivitykick;
        // offset 0x550, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x558, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x560, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x570, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x580, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x590, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x5a0, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x5b0, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5c0, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5c8, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5d0, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5d8, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5e0, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5e8, size 0x10
        uint:11 objectivehealth;
        // offset 0x5f8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x600, size 0x8
        uint:2 robotspeed;
        // offset 0x608, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x610, size 0x8
        uint:3 hash_68e3f54e05f57d85;
        // offset 0x618, size 0x8
        uint:7 servermsec;
        // offset 0x620, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x628, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x630, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x640, size 0x10
        uint:10 leaderbonus;
        // offset 0x650, size 0x8
        uint:5 hash_5c918cbf75e16116;
        // offset 0x658, size 0x8
        uint:3 hash_51e989796c38cd87;
        // offset 0x660, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x668, size 0x10
        uint:9 autodestroytime;
        // offset 0x678, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x680, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x688, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x690, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x698, size 0x8
        uint:6 prematchperiod;
        // offset 0x6a0, size 0x8
        uint:6 teamkillscore;
        // offset 0x6a8, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x6b0, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x6b8, size 0x8
        uint:3 platooncount;
        // offset 0x6c0, size 0x20
        int deployablebarrierhealth;
        // offset 0x6e0, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6e8, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6f0, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6f8, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x700, size 0x8
        uint:7 playernumlives;
        // offset 0x708, size 0x8
        uint:2 infectionmode;
        // offset 0x710, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x718, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x720, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x728, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x730, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x738, size 0x8
        uint:6 reboottime;
        // offset 0x740, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x748, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x750, size 0x8
        uint:4 pickuptime;
        // offset 0x758, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x768, size 0x20
        int hash_64727525f5957d06;
        // offset 0x788, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x7a8, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x7b0, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x7b8, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x7c0, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x7c8, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x7d0, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7e0, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7e8, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7f0, size 0x8
        uint:7 startplayers;
        // offset 0x7f8, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x800, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x808, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x810, size 0x8
        uint:5 totalkillsmax;
        // offset 0x818, size 0x8
        uint:4 roundswitch;
        // offset 0x820, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x828, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x830, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x838, size 0x8
        uint:5 weaponcount;
        // offset 0x840, size 0x8
        uint:7 weapontimer;
        // offset 0x848, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x858, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x860, size 0x8
        uint:7 drafttime;
        // offset 0x868, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x870, size 0x8
        uint:7 objectivespawntime;
        // offset 0x878, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x888, size 0x8
        uint:4 throwscore;
        // offset 0x890, size 0x8
        uint:4 deposittime;
        // offset 0x898, size 0x10
        fixed<10,2> extratime;
        // offset 0x8a8, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x8b0, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x8b8, size 0x8
        uint:7 teamcount;
        // offset 0x8c0, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8e0, size 0x8
        uint:4 roundlimit;
        // offset 0x8e8, size 0x8
        uint:2 charactercustomization;
        // offset 0x8f0, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8f8, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x900, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x908, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x918, size 0x1
        bool delayplayer;
        // offset 0x919, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x91a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x91b, size 0x1
        bool hash_729930c3c52653c3;
        // offset 0x91c, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x91d, size 0x1
        bool draftenabled;
        // offset 0x91e, size 0x1
        bool droppedtagrespawn;
        // offset 0x91f, size 0x1
        bool voipkillershearvictim;
        // offset 0x920, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x921, size 0x1
        bool deathcirclerespawn;
        // offset 0x922, size 0x1
        bool presetclassesperteam;
        // offset 0x923, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x924, size 0x1
        bool hardcoremode;
        // offset 0x925, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x926, size 0x1
        bool useitemspawns;
        // offset 0x927, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x928, size 0x1
        bool silentplant;
        // offset 0x929, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x92a, size 0x1
        bool drafteveryround;
        // offset 0x92b, size 0x1
        bool timepauseswheninzone;
        // offset 0x92c, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x92d, size 0x1
        bool scoreperplayer;
        // offset 0x92e, size 0x1
        bool ekiaresetondeath;
        // offset 0x92f, size 0x1
        bool kothmode;
        // offset 0x930, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x931, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x932, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x933, size 0x1
        bool decayprogress;
        // offset 0x934, size 0x1
        bool playerqueuedrespawn;
        // offset 0x935, size 0x1
        bool cumulativeroundscores;
        // offset 0x936, size 0x1
        bool voipdeadhearkiller;
        // offset 0x937, size 0x1
        bool skiplaststand;
        // offset 0x938, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x939, size 0x1
        bool usespawngroups;
        // offset 0x93a, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x93b, size 0x1
        bool platoonassignment;
        // offset 0x93c, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0x93d, size 0x1
        bool allowbattlechatter;
        // offset 0x93e, size 0x1
        bool fowrevealenabled;
        // offset 0x93f, size 0x1
        bool disablecontracts;
        // offset 0x940, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x941, size 0x1
        bool allowannouncer;
        // offset 0x942, size 0x1
        bool disallowaimslowdown;
        // offset 0x943, size 0x1
        bool vehiclesenabled;
        // offset 0x944, size 0x1
        bool decaycapturedzones;
        // offset 0x945, size 0x1
        bool neutralzone;
        // offset 0x946, size 0x1
        bool boastallowcam;
        // offset 0x947, size 0x1
        bool onlyheadshots;
        // offset 0x948, size 0x1
        bool flagcapturecondition;
        // offset 0x949, size 0x1
        bool flagcanbeneutralized;
        // offset 0x94a, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x94b, size 0x1
        bool vehiclestimed;
        // offset 0x94c, size 0x1
        bool pregamedraftenabled;
        // offset 0x94d, size 0x1
        bool fogofwarminimap;
        // offset 0x94e, size 0x1
        bool teamkillpointloss;
        // offset 0x94f, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x950, size 0x1
        bool perksenabled;
        // offset 0x951, size 0x1
        bool hash_33bc6781006ae83d;
        // offset 0x952, size 0x1
        bool allowmapscripting;
        // offset 0x953, size 0x1
        bool robotshield;
        // offset 0x954, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x955, size 0x1
        bool allowkillcam;
        // offset 0x956, size 0x1
        bool disableattachments;
        // offset 0x957, size 0x1
        bool disablecompass;
        // offset 0x958, size 0x1
        bool disableweapondrop;
        // offset 0x959, size 0x1
        bool escalationenabled;
        // offset 0x95a, size 0x1
        bool disablecac;
        // offset 0x95b, size 0x1
        bool disableclassselection;
        // offset 0x95c, size 0x1
        bool hash_48670d9509071424;
        // offset 0x95d, size 0x1
        bool autoteambalance;
        // offset 0x95e, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x95f, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x960, size 0x1
        bool allowplayofthematch;
        // offset 0x961, size 0x1
        bool allowprone;
        // offset 0x962, size 0x1
        bool scoreresetondeath;
        // offset 0x963, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x964, size 0x1
        bool playerforcerespawn;
        // offset 0x965, size 0x1
        bool multibomb;
        // offset 0x966, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x967, size 0x1
        bool deathcircle;
        // offset 0x968, size 0x1
        bool boastenabled;
        // offset 0x969, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x96a, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x96b, size 0x1
        bool deathpointloss;
        // offset 0x96c, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x96d, size 0x1
        bool rebootplayers;
        // offset 0x96e, size 0x1
        bool oldschoolmode;
        // offset 0x96f, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x970, size 0x1
        bool allowfinalkillcam;
        // offset 0x971, size 0x1
        bool allowspectating;
        // offset 0x972, size 0x1
        bool usabledynents;
        // offset 0x973, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x974, size 0x1
        bool spawnselectenabled;
        // offset 0x975, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x976, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x977, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x978, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x979, size 0x1
        bool disallowprone;
        // offset 0x97a, size 0x1
        bool moveplayers;
        // offset 0x97b, size 0x1
        bool disabletacinsert;
        // offset 0x97c, size 0x1
        bool voipdeadhearallliving;
        // offset 0x97d, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x97e, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x97f, size 0x1
        bool flagcapturerateincrease;
        // offset 0x980, size 0x1
        bool use_doors;
        // offset 0x981, size 0x1
        bool pvponly;
        // offset 0x982, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x983, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x984, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x985, size 0x1
        bool allowingameteamchange;
        // offset 0x986, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x987, size 0x1
        bool deathzones;
        // offset 0x988, size 0x1
        bool classicmode;
        // offset 0x989, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x98a, size 0x1
        bool capdecay;
        // offset 0x98b, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x98c, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x98d, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x98e, size 0x1
        bool laststandfinishing;
        // offset 0x98f, size 0x1
        bool hash_201c1769d32b30d3;
    };

    // idx 0 members 1 size 0x990
    // offset 0x0, size 0x990
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_105d1fce3d97bd4"

version 47 {
    // idx 1 members 308 size 0x990
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x8
        uint:5 hash_ecf2124e9108fc4;
        // offset 0x1a0, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1b0, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1c0, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1d0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1e0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1f0, size 0x8
        uint:5 maxallocation;
        // offset 0x1f8, size 0x8
        uint:4 carryscore;
        // offset 0x200, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x208, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x210, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x218, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x220, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x228, size 0x8
        uint:7 idleflagresettime;
        // offset 0x230, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x238, size 0x8
        uint:4 setbacks;
        // offset 0x240, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x260, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x270, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x280, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x290, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x2a0, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2b0, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2c0, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c8, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2d0, size 0x10
        uint:15 scorelimit;
        // offset 0x2e0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2f0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x300, size 0x10
        uint:10 playermaxhealth;
        // offset 0x310, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x318, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x320, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x328, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b8, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4c0, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c8, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4d0, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d8, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4e0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f8, size 0x8
        uint:5 boottime;
        // offset 0x500, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x508, size 0x8
        uint:6 hash_5d5f4ee35c9977c7;
        // offset 0x510, size 0x8
        uint:2 roundstartfriendlyfiretype;
        // offset 0x518, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x520, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x528, size 0x8
        uint:7 teamnumlives;
        // offset 0x530, size 0x8
        fixed<8,2> planttime;
        // offset 0x538, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x540, size 0x10
        uint:10 inactivitykick;
        // offset 0x550, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x558, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x560, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x570, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x580, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x590, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x5a0, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x5b0, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5c0, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5c8, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5d0, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5d8, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5e0, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5e8, size 0x10
        uint:11 objectivehealth;
        // offset 0x5f8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x600, size 0x8
        uint:2 robotspeed;
        // offset 0x608, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x610, size 0x8
        uint:3 hash_68e3f54e05f57d85;
        // offset 0x618, size 0x8
        uint:7 servermsec;
        // offset 0x620, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x628, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x630, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x640, size 0x10
        uint:10 leaderbonus;
        // offset 0x650, size 0x8
        uint:5 hash_5c918cbf75e16116;
        // offset 0x658, size 0x8
        uint:3 hash_51e989796c38cd87;
        // offset 0x660, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x668, size 0x10
        uint:9 autodestroytime;
        // offset 0x678, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x680, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x688, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x690, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x698, size 0x8
        uint:6 prematchperiod;
        // offset 0x6a0, size 0x8
        uint:6 teamkillscore;
        // offset 0x6a8, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x6b0, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x6b8, size 0x8
        uint:3 platooncount;
        // offset 0x6c0, size 0x20
        int deployablebarrierhealth;
        // offset 0x6e0, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6e8, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6f0, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6f8, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x700, size 0x8
        uint:7 playernumlives;
        // offset 0x708, size 0x8
        uint:2 infectionmode;
        // offset 0x710, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x718, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x720, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x728, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x730, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x738, size 0x8
        uint:6 reboottime;
        // offset 0x740, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x748, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x750, size 0x8
        uint:4 pickuptime;
        // offset 0x758, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x768, size 0x20
        int hash_64727525f5957d06;
        // offset 0x788, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x7a8, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x7b0, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x7b8, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x7c0, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x7c8, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x7d0, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7e0, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7e8, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7f0, size 0x8
        uint:7 startplayers;
        // offset 0x7f8, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x800, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x808, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x810, size 0x8
        uint:5 totalkillsmax;
        // offset 0x818, size 0x8
        uint:4 roundswitch;
        // offset 0x820, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x828, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x830, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x838, size 0x8
        uint:5 weaponcount;
        // offset 0x840, size 0x8
        uint:7 weapontimer;
        // offset 0x848, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x858, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x860, size 0x8
        uint:7 drafttime;
        // offset 0x868, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x870, size 0x8
        uint:7 objectivespawntime;
        // offset 0x878, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x888, size 0x8
        uint:4 throwscore;
        // offset 0x890, size 0x8
        uint:4 deposittime;
        // offset 0x898, size 0x10
        fixed<10,2> extratime;
        // offset 0x8a8, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x8b0, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x8b8, size 0x8
        uint:7 teamcount;
        // offset 0x8c0, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8e0, size 0x8
        uint:4 roundlimit;
        // offset 0x8e8, size 0x8
        uint:2 charactercustomization;
        // offset 0x8f0, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8f8, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x900, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x908, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x918, size 0x1
        bool delayplayer;
        // offset 0x919, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x91a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x91b, size 0x1
        bool hash_729930c3c52653c3;
        // offset 0x91c, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x91d, size 0x1
        bool draftenabled;
        // offset 0x91e, size 0x1
        bool droppedtagrespawn;
        // offset 0x91f, size 0x1
        bool voipkillershearvictim;
        // offset 0x920, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x921, size 0x1
        bool deathcirclerespawn;
        // offset 0x922, size 0x1
        bool presetclassesperteam;
        // offset 0x923, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x924, size 0x1
        bool hardcoremode;
        // offset 0x925, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x926, size 0x1
        bool useitemspawns;
        // offset 0x927, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x928, size 0x1
        bool silentplant;
        // offset 0x929, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x92a, size 0x1
        bool drafteveryround;
        // offset 0x92b, size 0x1
        bool timepauseswheninzone;
        // offset 0x92c, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x92d, size 0x1
        bool scoreperplayer;
        // offset 0x92e, size 0x1
        bool ekiaresetondeath;
        // offset 0x92f, size 0x1
        bool kothmode;
        // offset 0x930, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x931, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x932, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x933, size 0x1
        bool decayprogress;
        // offset 0x934, size 0x1
        bool playerqueuedrespawn;
        // offset 0x935, size 0x1
        bool cumulativeroundscores;
        // offset 0x936, size 0x1
        bool voipdeadhearkiller;
        // offset 0x937, size 0x1
        bool skiplaststand;
        // offset 0x938, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x939, size 0x1
        bool usespawngroups;
        // offset 0x93a, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x93b, size 0x1
        bool platoonassignment;
        // offset 0x93c, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0x93d, size 0x1
        bool allowbattlechatter;
        // offset 0x93e, size 0x1
        bool fowrevealenabled;
        // offset 0x93f, size 0x1
        bool disablecontracts;
        // offset 0x940, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x941, size 0x1
        bool allowannouncer;
        // offset 0x942, size 0x1
        bool disallowaimslowdown;
        // offset 0x943, size 0x1
        bool vehiclesenabled;
        // offset 0x944, size 0x1
        bool decaycapturedzones;
        // offset 0x945, size 0x1
        bool neutralzone;
        // offset 0x946, size 0x1
        bool boastallowcam;
        // offset 0x947, size 0x1
        bool onlyheadshots;
        // offset 0x948, size 0x1
        bool flagcapturecondition;
        // offset 0x949, size 0x1
        bool flagcanbeneutralized;
        // offset 0x94a, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x94b, size 0x1
        bool vehiclestimed;
        // offset 0x94c, size 0x1
        bool pregamedraftenabled;
        // offset 0x94d, size 0x1
        bool fogofwarminimap;
        // offset 0x94e, size 0x1
        bool teamkillpointloss;
        // offset 0x94f, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x950, size 0x1
        bool perksenabled;
        // offset 0x951, size 0x1
        bool allowmapscripting;
        // offset 0x952, size 0x1
        bool robotshield;
        // offset 0x953, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x954, size 0x1
        bool allowkillcam;
        // offset 0x955, size 0x1
        bool disableattachments;
        // offset 0x956, size 0x1
        bool disablecompass;
        // offset 0x957, size 0x1
        bool disableweapondrop;
        // offset 0x958, size 0x1
        bool escalationenabled;
        // offset 0x959, size 0x1
        bool disablecac;
        // offset 0x95a, size 0x1
        bool disableclassselection;
        // offset 0x95b, size 0x1
        bool hash_48670d9509071424;
        // offset 0x95c, size 0x1
        bool autoteambalance;
        // offset 0x95d, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x95e, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x95f, size 0x1
        bool allowplayofthematch;
        // offset 0x960, size 0x1
        bool allowprone;
        // offset 0x961, size 0x1
        bool scoreresetondeath;
        // offset 0x962, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x963, size 0x1
        bool playerforcerespawn;
        // offset 0x964, size 0x1
        bool multibomb;
        // offset 0x965, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x966, size 0x1
        bool deathcircle;
        // offset 0x967, size 0x1
        bool boastenabled;
        // offset 0x968, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x969, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x96a, size 0x1
        bool deathpointloss;
        // offset 0x96b, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x96c, size 0x1
        bool rebootplayers;
        // offset 0x96d, size 0x1
        bool oldschoolmode;
        // offset 0x96e, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x96f, size 0x1
        bool allowfinalkillcam;
        // offset 0x970, size 0x1
        bool allowspectating;
        // offset 0x971, size 0x1
        bool usabledynents;
        // offset 0x972, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x973, size 0x1
        bool spawnselectenabled;
        // offset 0x974, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x975, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x976, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x977, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x978, size 0x1
        bool disallowprone;
        // offset 0x979, size 0x1
        bool moveplayers;
        // offset 0x97a, size 0x1
        bool disabletacinsert;
        // offset 0x97b, size 0x1
        bool voipdeadhearallliving;
        // offset 0x97c, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x97d, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x97e, size 0x1
        bool flagcapturerateincrease;
        // offset 0x97f, size 0x1
        bool use_doors;
        // offset 0x980, size 0x1
        bool pvponly;
        // offset 0x981, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x982, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x983, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x984, size 0x1
        bool allowingameteamchange;
        // offset 0x985, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x986, size 0x1
        bool deathzones;
        // offset 0x987, size 0x1
        bool classicmode;
        // offset 0x988, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x989, size 0x1
        bool capdecay;
        // offset 0x98a, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x98b, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x98c, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x98d, size 0x1
        bool laststandfinishing;
        // offset 0x98e, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x98f, size 0x1
        uint:1 __pad[1];
    };

    // idx 0 members 1 size 0x990
    // offset 0x0, size 0x990
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_fb257fe20f234692"

version 46 {
    // idx 1 members 307 size 0x990
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x8
        uint:5 hash_ecf2124e9108fc4;
        // offset 0x1a0, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1b0, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1c0, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1d0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1e0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1f0, size 0x8
        uint:5 maxallocation;
        // offset 0x1f8, size 0x8
        uint:4 carryscore;
        // offset 0x200, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x208, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x210, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x218, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x220, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x228, size 0x8
        uint:7 idleflagresettime;
        // offset 0x230, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x238, size 0x8
        uint:4 setbacks;
        // offset 0x240, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x260, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x270, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x280, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x290, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x2a0, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2b0, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2c0, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c8, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2d0, size 0x10
        uint:15 scorelimit;
        // offset 0x2e0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2f0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x300, size 0x10
        uint:10 playermaxhealth;
        // offset 0x310, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x318, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x320, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x328, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b8, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4c0, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c8, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4d0, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d8, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4e0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f8, size 0x8
        uint:5 boottime;
        // offset 0x500, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x508, size 0x8
        uint:6 hash_5d5f4ee35c9977c7;
        // offset 0x510, size 0x8
        uint:2 roundstartfriendlyfiretype;
        // offset 0x518, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x520, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x528, size 0x8
        uint:7 teamnumlives;
        // offset 0x530, size 0x8
        fixed<8,2> planttime;
        // offset 0x538, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x540, size 0x10
        uint:10 inactivitykick;
        // offset 0x550, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x558, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x560, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x570, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x580, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x590, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x5a0, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x5b0, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5c0, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5c8, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5d0, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5d8, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5e0, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5e8, size 0x10
        uint:11 objectivehealth;
        // offset 0x5f8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x600, size 0x8
        uint:2 robotspeed;
        // offset 0x608, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x610, size 0x8
        uint:3 hash_68e3f54e05f57d85;
        // offset 0x618, size 0x8
        uint:7 servermsec;
        // offset 0x620, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x628, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x630, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x640, size 0x10
        uint:10 leaderbonus;
        // offset 0x650, size 0x8
        uint:5 hash_5c918cbf75e16116;
        // offset 0x658, size 0x8
        uint:3 hash_51e989796c38cd87;
        // offset 0x660, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x668, size 0x10
        uint:9 autodestroytime;
        // offset 0x678, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x680, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x688, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x690, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x698, size 0x8
        uint:6 prematchperiod;
        // offset 0x6a0, size 0x8
        uint:6 teamkillscore;
        // offset 0x6a8, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x6b0, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x6b8, size 0x8
        uint:3 platooncount;
        // offset 0x6c0, size 0x20
        int deployablebarrierhealth;
        // offset 0x6e0, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6e8, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6f0, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6f8, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x700, size 0x8
        uint:7 playernumlives;
        // offset 0x708, size 0x8
        uint:2 infectionmode;
        // offset 0x710, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x718, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x720, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x728, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x730, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x738, size 0x8
        uint:6 reboottime;
        // offset 0x740, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x748, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x750, size 0x8
        uint:4 pickuptime;
        // offset 0x758, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x768, size 0x20
        int hash_64727525f5957d06;
        // offset 0x788, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x7a8, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x7b0, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x7b8, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x7c0, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x7c8, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x7d0, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7e0, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7e8, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7f0, size 0x8
        uint:7 startplayers;
        // offset 0x7f8, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x800, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x808, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x810, size 0x8
        uint:5 totalkillsmax;
        // offset 0x818, size 0x8
        uint:4 roundswitch;
        // offset 0x820, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x828, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x830, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x838, size 0x8
        uint:5 weaponcount;
        // offset 0x840, size 0x8
        uint:7 weapontimer;
        // offset 0x848, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x858, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x860, size 0x8
        uint:7 drafttime;
        // offset 0x868, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x870, size 0x8
        uint:7 objectivespawntime;
        // offset 0x878, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x888, size 0x8
        uint:4 throwscore;
        // offset 0x890, size 0x8
        uint:4 deposittime;
        // offset 0x898, size 0x10
        fixed<10,2> extratime;
        // offset 0x8a8, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x8b0, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x8b8, size 0x8
        uint:7 teamcount;
        // offset 0x8c0, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8e0, size 0x8
        uint:4 roundlimit;
        // offset 0x8e8, size 0x8
        uint:2 charactercustomization;
        // offset 0x8f0, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8f8, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x900, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x908, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x918, size 0x1
        bool delayplayer;
        // offset 0x919, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x91a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x91b, size 0x1
        bool hash_729930c3c52653c3;
        // offset 0x91c, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x91d, size 0x1
        bool draftenabled;
        // offset 0x91e, size 0x1
        bool droppedtagrespawn;
        // offset 0x91f, size 0x1
        bool voipkillershearvictim;
        // offset 0x920, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x921, size 0x1
        bool deathcirclerespawn;
        // offset 0x922, size 0x1
        bool presetclassesperteam;
        // offset 0x923, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x924, size 0x1
        bool hardcoremode;
        // offset 0x925, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x926, size 0x1
        bool useitemspawns;
        // offset 0x927, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x928, size 0x1
        bool silentplant;
        // offset 0x929, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x92a, size 0x1
        bool drafteveryround;
        // offset 0x92b, size 0x1
        bool timepauseswheninzone;
        // offset 0x92c, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x92d, size 0x1
        bool scoreperplayer;
        // offset 0x92e, size 0x1
        bool ekiaresetondeath;
        // offset 0x92f, size 0x1
        bool kothmode;
        // offset 0x930, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x931, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x932, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x933, size 0x1
        bool decayprogress;
        // offset 0x934, size 0x1
        bool playerqueuedrespawn;
        // offset 0x935, size 0x1
        bool cumulativeroundscores;
        // offset 0x936, size 0x1
        bool voipdeadhearkiller;
        // offset 0x937, size 0x1
        bool skiplaststand;
        // offset 0x938, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x939, size 0x1
        bool usespawngroups;
        // offset 0x93a, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x93b, size 0x1
        bool platoonassignment;
        // offset 0x93c, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0x93d, size 0x1
        bool allowbattlechatter;
        // offset 0x93e, size 0x1
        bool fowrevealenabled;
        // offset 0x93f, size 0x1
        bool disablecontracts;
        // offset 0x940, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x941, size 0x1
        bool allowannouncer;
        // offset 0x942, size 0x1
        bool disallowaimslowdown;
        // offset 0x943, size 0x1
        bool vehiclesenabled;
        // offset 0x944, size 0x1
        bool decaycapturedzones;
        // offset 0x945, size 0x1
        bool neutralzone;
        // offset 0x946, size 0x1
        bool boastallowcam;
        // offset 0x947, size 0x1
        bool onlyheadshots;
        // offset 0x948, size 0x1
        bool flagcapturecondition;
        // offset 0x949, size 0x1
        bool flagcanbeneutralized;
        // offset 0x94a, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x94b, size 0x1
        bool vehiclestimed;
        // offset 0x94c, size 0x1
        bool pregamedraftenabled;
        // offset 0x94d, size 0x1
        bool fogofwarminimap;
        // offset 0x94e, size 0x1
        bool teamkillpointloss;
        // offset 0x94f, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x950, size 0x1
        bool perksenabled;
        // offset 0x951, size 0x1
        bool allowmapscripting;
        // offset 0x952, size 0x1
        bool robotshield;
        // offset 0x953, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x954, size 0x1
        bool allowkillcam;
        // offset 0x955, size 0x1
        bool disableattachments;
        // offset 0x956, size 0x1
        bool disablecompass;
        // offset 0x957, size 0x1
        bool disableweapondrop;
        // offset 0x958, size 0x1
        bool escalationenabled;
        // offset 0x959, size 0x1
        bool disablecac;
        // offset 0x95a, size 0x1
        bool disableclassselection;
        // offset 0x95b, size 0x1
        bool hash_48670d9509071424;
        // offset 0x95c, size 0x1
        bool autoteambalance;
        // offset 0x95d, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x95e, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x95f, size 0x1
        bool allowplayofthematch;
        // offset 0x960, size 0x1
        bool allowprone;
        // offset 0x961, size 0x1
        bool scoreresetondeath;
        // offset 0x962, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x963, size 0x1
        bool playerforcerespawn;
        // offset 0x964, size 0x1
        bool multibomb;
        // offset 0x965, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x966, size 0x1
        bool deathcircle;
        // offset 0x967, size 0x1
        bool boastenabled;
        // offset 0x968, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x969, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x96a, size 0x1
        bool deathpointloss;
        // offset 0x96b, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x96c, size 0x1
        bool rebootplayers;
        // offset 0x96d, size 0x1
        bool oldschoolmode;
        // offset 0x96e, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x96f, size 0x1
        bool allowfinalkillcam;
        // offset 0x970, size 0x1
        bool allowspectating;
        // offset 0x971, size 0x1
        bool usabledynents;
        // offset 0x972, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x973, size 0x1
        bool spawnselectenabled;
        // offset 0x974, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x975, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x976, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x977, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x978, size 0x1
        bool disallowprone;
        // offset 0x979, size 0x1
        bool moveplayers;
        // offset 0x97a, size 0x1
        bool disabletacinsert;
        // offset 0x97b, size 0x1
        bool voipdeadhearallliving;
        // offset 0x97c, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x97d, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x97e, size 0x1
        bool flagcapturerateincrease;
        // offset 0x97f, size 0x1
        bool use_doors;
        // offset 0x980, size 0x1
        bool pvponly;
        // offset 0x981, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x982, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x983, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x984, size 0x1
        bool allowingameteamchange;
        // offset 0x985, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x986, size 0x1
        bool deathzones;
        // offset 0x987, size 0x1
        bool classicmode;
        // offset 0x988, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x989, size 0x1
        bool capdecay;
        // offset 0x98a, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x98b, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x98c, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x98d, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x98e, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x990
    // offset 0x0, size 0x990
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_4b0c8a4a6c45d2ae"

version 45 {
    // idx 1 members 303 size 0x970
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1a8, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1b8, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1c8, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1d8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1e8, size 0x8
        uint:5 maxallocation;
        // offset 0x1f0, size 0x8
        uint:4 carryscore;
        // offset 0x1f8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x200, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x208, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x210, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x218, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x220, size 0x8
        uint:7 idleflagresettime;
        // offset 0x228, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x230, size 0x8
        uint:4 setbacks;
        // offset 0x238, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x258, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x268, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x278, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x288, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x298, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2a8, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2b8, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c0, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2c8, size 0x10
        uint:15 scorelimit;
        // offset 0x2d8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2e8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2f8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x308, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x310, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x318, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x320, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b0, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4b8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4c8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4d8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f0, size 0x8
        uint:5 boottime;
        // offset 0x4f8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x500, size 0x8
        uint:6 hash_5d5f4ee35c9977c7;
        // offset 0x508, size 0x8
        uint:2 roundstartfriendlyfiretype;
        // offset 0x510, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x518, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x520, size 0x8
        uint:7 teamnumlives;
        // offset 0x528, size 0x8
        fixed<8,2> planttime;
        // offset 0x530, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x538, size 0x10
        uint:10 inactivitykick;
        // offset 0x548, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x550, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x588, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x598, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x5a8, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5b8, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5c0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5c8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5d0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5d8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5e0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5f0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5f8, size 0x8
        uint:2 robotspeed;
        // offset 0x600, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x608, size 0x8
        uint:7 servermsec;
        // offset 0x610, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x618, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x620, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x630, size 0x10
        uint:10 leaderbonus;
        // offset 0x640, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x648, size 0x10
        uint:9 autodestroytime;
        // offset 0x658, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x660, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x668, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x670, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x678, size 0x8
        uint:6 prematchperiod;
        // offset 0x680, size 0x8
        uint:6 teamkillscore;
        // offset 0x688, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x690, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x698, size 0x8
        uint:3 platooncount;
        // offset 0x6a0, size 0x20
        int deployablebarrierhealth;
        // offset 0x6c0, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6c8, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6d0, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6d8, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6e0, size 0x8
        uint:7 playernumlives;
        // offset 0x6e8, size 0x8
        uint:2 infectionmode;
        // offset 0x6f0, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6f8, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x700, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x708, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x710, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x718, size 0x8
        uint:6 reboottime;
        // offset 0x720, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x728, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x730, size 0x8
        uint:4 pickuptime;
        // offset 0x738, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x748, size 0x20
        int hash_64727525f5957d06;
        // offset 0x768, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x788, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x790, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x798, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x7a0, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x7a8, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x7b0, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7c0, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7c8, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7d0, size 0x8
        uint:7 startplayers;
        // offset 0x7d8, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x7e0, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x7e8, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7f0, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7f8, size 0x8
        uint:4 roundswitch;
        // offset 0x800, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x808, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x810, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x818, size 0x8
        uint:5 weaponcount;
        // offset 0x820, size 0x8
        uint:7 weapontimer;
        // offset 0x828, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x838, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x840, size 0x8
        uint:7 drafttime;
        // offset 0x848, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x850, size 0x8
        uint:7 objectivespawntime;
        // offset 0x858, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x868, size 0x8
        uint:4 throwscore;
        // offset 0x870, size 0x8
        uint:4 deposittime;
        // offset 0x878, size 0x10
        fixed<10,2> extratime;
        // offset 0x888, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x890, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x898, size 0x8
        uint:7 teamcount;
        // offset 0x8a0, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8c0, size 0x8
        uint:4 roundlimit;
        // offset 0x8c8, size 0x8
        uint:2 charactercustomization;
        // offset 0x8d0, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8d8, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x8e0, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x8e8, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8f8, size 0x1
        bool delayplayer;
        // offset 0x8f9, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8fa, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8fb, size 0x1
        bool hash_729930c3c52653c3;
        // offset 0x8fc, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8fd, size 0x1
        bool draftenabled;
        // offset 0x8fe, size 0x1
        bool droppedtagrespawn;
        // offset 0x8ff, size 0x1
        bool voipkillershearvictim;
        // offset 0x900, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x901, size 0x1
        bool deathcirclerespawn;
        // offset 0x902, size 0x1
        bool presetclassesperteam;
        // offset 0x903, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x904, size 0x1
        bool hardcoremode;
        // offset 0x905, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x906, size 0x1
        bool useitemspawns;
        // offset 0x907, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x908, size 0x1
        bool silentplant;
        // offset 0x909, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x90a, size 0x1
        bool drafteveryround;
        // offset 0x90b, size 0x1
        bool timepauseswheninzone;
        // offset 0x90c, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x90d, size 0x1
        bool scoreperplayer;
        // offset 0x90e, size 0x1
        bool ekiaresetondeath;
        // offset 0x90f, size 0x1
        bool kothmode;
        // offset 0x910, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x911, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x912, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x913, size 0x1
        bool decayprogress;
        // offset 0x914, size 0x1
        bool playerqueuedrespawn;
        // offset 0x915, size 0x1
        bool cumulativeroundscores;
        // offset 0x916, size 0x1
        bool voipdeadhearkiller;
        // offset 0x917, size 0x1
        bool skiplaststand;
        // offset 0x918, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x919, size 0x1
        bool usespawngroups;
        // offset 0x91a, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x91b, size 0x1
        bool platoonassignment;
        // offset 0x91c, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0x91d, size 0x1
        bool allowbattlechatter;
        // offset 0x91e, size 0x1
        bool fowrevealenabled;
        // offset 0x91f, size 0x1
        bool disablecontracts;
        // offset 0x920, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x921, size 0x1
        bool allowannouncer;
        // offset 0x922, size 0x1
        bool disallowaimslowdown;
        // offset 0x923, size 0x1
        bool vehiclesenabled;
        // offset 0x924, size 0x1
        bool decaycapturedzones;
        // offset 0x925, size 0x1
        bool neutralzone;
        // offset 0x926, size 0x1
        bool boastallowcam;
        // offset 0x927, size 0x1
        bool onlyheadshots;
        // offset 0x928, size 0x1
        bool flagcapturecondition;
        // offset 0x929, size 0x1
        bool flagcanbeneutralized;
        // offset 0x92a, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x92b, size 0x1
        bool vehiclestimed;
        // offset 0x92c, size 0x1
        bool pregamedraftenabled;
        // offset 0x92d, size 0x1
        bool fogofwarminimap;
        // offset 0x92e, size 0x1
        bool teamkillpointloss;
        // offset 0x92f, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x930, size 0x1
        bool perksenabled;
        // offset 0x931, size 0x1
        bool allowmapscripting;
        // offset 0x932, size 0x1
        bool robotshield;
        // offset 0x933, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x934, size 0x1
        bool allowkillcam;
        // offset 0x935, size 0x1
        bool disableattachments;
        // offset 0x936, size 0x1
        bool disablecompass;
        // offset 0x937, size 0x1
        bool disableweapondrop;
        // offset 0x938, size 0x1
        bool escalationenabled;
        // offset 0x939, size 0x1
        bool disablecac;
        // offset 0x93a, size 0x1
        bool disableclassselection;
        // offset 0x93b, size 0x1
        bool hash_48670d9509071424;
        // offset 0x93c, size 0x1
        bool autoteambalance;
        // offset 0x93d, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x93e, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x93f, size 0x1
        bool allowplayofthematch;
        // offset 0x940, size 0x1
        bool allowprone;
        // offset 0x941, size 0x1
        bool scoreresetondeath;
        // offset 0x942, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x943, size 0x1
        bool playerforcerespawn;
        // offset 0x944, size 0x1
        bool multibomb;
        // offset 0x945, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x946, size 0x1
        bool deathcircle;
        // offset 0x947, size 0x1
        bool boastenabled;
        // offset 0x948, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x949, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x94a, size 0x1
        bool deathpointloss;
        // offset 0x94b, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x94c, size 0x1
        bool rebootplayers;
        // offset 0x94d, size 0x1
        bool oldschoolmode;
        // offset 0x94e, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x94f, size 0x1
        bool allowfinalkillcam;
        // offset 0x950, size 0x1
        bool allowspectating;
        // offset 0x951, size 0x1
        bool usabledynents;
        // offset 0x952, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x953, size 0x1
        bool spawnselectenabled;
        // offset 0x954, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x955, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x956, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x957, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x958, size 0x1
        bool disallowprone;
        // offset 0x959, size 0x1
        bool moveplayers;
        // offset 0x95a, size 0x1
        bool disabletacinsert;
        // offset 0x95b, size 0x1
        bool voipdeadhearallliving;
        // offset 0x95c, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x95d, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x95e, size 0x1
        bool flagcapturerateincrease;
        // offset 0x95f, size 0x1
        bool use_doors;
        // offset 0x960, size 0x1
        bool pvponly;
        // offset 0x961, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x962, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x963, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x964, size 0x1
        bool allowingameteamchange;
        // offset 0x965, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x966, size 0x1
        bool deathzones;
        // offset 0x967, size 0x1
        bool classicmode;
        // offset 0x968, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x969, size 0x1
        bool capdecay;
        // offset 0x96a, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x96b, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x96c, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x96d, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x96e, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x970
    // offset 0x0, size 0x970
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_111cfce11352e58f"

version 44 {
    // idx 1 members 301 size 0x960
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1a8, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1b8, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1c8, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1d8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1e8, size 0x8
        uint:5 maxallocation;
        // offset 0x1f0, size 0x8
        uint:4 carryscore;
        // offset 0x1f8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x200, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x208, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x210, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x218, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x220, size 0x8
        uint:7 idleflagresettime;
        // offset 0x228, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x230, size 0x8
        uint:4 setbacks;
        // offset 0x238, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x258, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x268, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x278, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x288, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x298, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2a8, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2b8, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c0, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2c8, size 0x10
        uint:15 scorelimit;
        // offset 0x2d8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2e8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2f8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x308, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x310, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x318, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x320, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b0, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4b8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4c8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4d8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f0, size 0x8
        uint:5 boottime;
        // offset 0x4f8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x500, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x508, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x510, size 0x8
        uint:7 teamnumlives;
        // offset 0x518, size 0x8
        fixed<8,2> planttime;
        // offset 0x520, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x528, size 0x10
        uint:10 inactivitykick;
        // offset 0x538, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x540, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x588, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x598, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5a8, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5b0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5b8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5c0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5c8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5d0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5e0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5e8, size 0x8
        uint:2 robotspeed;
        // offset 0x5f0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5f8, size 0x8
        uint:7 servermsec;
        // offset 0x600, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x608, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x610, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x620, size 0x10
        uint:10 leaderbonus;
        // offset 0x630, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x638, size 0x10
        uint:9 autodestroytime;
        // offset 0x648, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x650, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x658, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x660, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x668, size 0x8
        uint:6 prematchperiod;
        // offset 0x670, size 0x8
        uint:6 teamkillscore;
        // offset 0x678, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x680, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x688, size 0x8
        uint:3 platooncount;
        // offset 0x690, size 0x20
        int deployablebarrierhealth;
        // offset 0x6b0, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6b8, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6c0, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6c8, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6d0, size 0x8
        uint:7 playernumlives;
        // offset 0x6d8, size 0x8
        uint:2 infectionmode;
        // offset 0x6e0, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6e8, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6f0, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6f8, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x700, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x708, size 0x8
        uint:6 reboottime;
        // offset 0x710, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x718, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x720, size 0x8
        uint:4 pickuptime;
        // offset 0x728, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x738, size 0x20
        int hash_64727525f5957d06;
        // offset 0x758, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x778, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x780, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x788, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x790, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x798, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x7a0, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7b0, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7b8, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7c0, size 0x8
        uint:7 startplayers;
        // offset 0x7c8, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x7d0, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x7d8, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7e0, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7e8, size 0x8
        uint:4 roundswitch;
        // offset 0x7f0, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7f8, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x800, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x808, size 0x8
        uint:5 weaponcount;
        // offset 0x810, size 0x8
        uint:7 weapontimer;
        // offset 0x818, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x828, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x830, size 0x8
        uint:7 drafttime;
        // offset 0x838, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x840, size 0x8
        uint:7 objectivespawntime;
        // offset 0x848, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x858, size 0x8
        uint:4 throwscore;
        // offset 0x860, size 0x8
        uint:4 deposittime;
        // offset 0x868, size 0x10
        fixed<10,2> extratime;
        // offset 0x878, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x880, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x888, size 0x8
        uint:7 teamcount;
        // offset 0x890, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8b0, size 0x8
        uint:4 roundlimit;
        // offset 0x8b8, size 0x8
        uint:2 charactercustomization;
        // offset 0x8c0, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8c8, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x8d0, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x8d8, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8e8, size 0x1
        bool delayplayer;
        // offset 0x8e9, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8ea, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8eb, size 0x1
        bool hash_729930c3c52653c3;
        // offset 0x8ec, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8ed, size 0x1
        bool draftenabled;
        // offset 0x8ee, size 0x1
        bool droppedtagrespawn;
        // offset 0x8ef, size 0x1
        bool voipkillershearvictim;
        // offset 0x8f0, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8f1, size 0x1
        bool deathcirclerespawn;
        // offset 0x8f2, size 0x1
        bool presetclassesperteam;
        // offset 0x8f3, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8f4, size 0x1
        bool hardcoremode;
        // offset 0x8f5, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8f6, size 0x1
        bool useitemspawns;
        // offset 0x8f7, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8f8, size 0x1
        bool silentplant;
        // offset 0x8f9, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8fa, size 0x1
        bool drafteveryround;
        // offset 0x8fb, size 0x1
        bool timepauseswheninzone;
        // offset 0x8fc, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8fd, size 0x1
        bool scoreperplayer;
        // offset 0x8fe, size 0x1
        bool ekiaresetondeath;
        // offset 0x8ff, size 0x1
        bool kothmode;
        // offset 0x900, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x901, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x902, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x903, size 0x1
        bool decayprogress;
        // offset 0x904, size 0x1
        bool playerqueuedrespawn;
        // offset 0x905, size 0x1
        bool cumulativeroundscores;
        // offset 0x906, size 0x1
        bool voipdeadhearkiller;
        // offset 0x907, size 0x1
        bool skiplaststand;
        // offset 0x908, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x909, size 0x1
        bool usespawngroups;
        // offset 0x90a, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x90b, size 0x1
        bool platoonassignment;
        // offset 0x90c, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0x90d, size 0x1
        bool allowbattlechatter;
        // offset 0x90e, size 0x1
        bool fowrevealenabled;
        // offset 0x90f, size 0x1
        bool disablecontracts;
        // offset 0x910, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x911, size 0x1
        bool allowannouncer;
        // offset 0x912, size 0x1
        bool disallowaimslowdown;
        // offset 0x913, size 0x1
        bool vehiclesenabled;
        // offset 0x914, size 0x1
        bool decaycapturedzones;
        // offset 0x915, size 0x1
        bool neutralzone;
        // offset 0x916, size 0x1
        bool boastallowcam;
        // offset 0x917, size 0x1
        bool onlyheadshots;
        // offset 0x918, size 0x1
        bool flagcapturecondition;
        // offset 0x919, size 0x1
        bool flagcanbeneutralized;
        // offset 0x91a, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x91b, size 0x1
        bool vehiclestimed;
        // offset 0x91c, size 0x1
        bool pregamedraftenabled;
        // offset 0x91d, size 0x1
        bool fogofwarminimap;
        // offset 0x91e, size 0x1
        bool teamkillpointloss;
        // offset 0x91f, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x920, size 0x1
        bool perksenabled;
        // offset 0x921, size 0x1
        bool allowmapscripting;
        // offset 0x922, size 0x1
        bool robotshield;
        // offset 0x923, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x924, size 0x1
        bool allowkillcam;
        // offset 0x925, size 0x1
        bool disableattachments;
        // offset 0x926, size 0x1
        bool disablecompass;
        // offset 0x927, size 0x1
        bool disableweapondrop;
        // offset 0x928, size 0x1
        bool escalationenabled;
        // offset 0x929, size 0x1
        bool disablecac;
        // offset 0x92a, size 0x1
        bool disableclassselection;
        // offset 0x92b, size 0x1
        bool hash_48670d9509071424;
        // offset 0x92c, size 0x1
        bool autoteambalance;
        // offset 0x92d, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x92e, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x92f, size 0x1
        bool allowplayofthematch;
        // offset 0x930, size 0x1
        bool allowprone;
        // offset 0x931, size 0x1
        bool scoreresetondeath;
        // offset 0x932, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x933, size 0x1
        bool playerforcerespawn;
        // offset 0x934, size 0x1
        bool multibomb;
        // offset 0x935, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x936, size 0x1
        bool deathcircle;
        // offset 0x937, size 0x1
        bool boastenabled;
        // offset 0x938, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x939, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x93a, size 0x1
        bool deathpointloss;
        // offset 0x93b, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x93c, size 0x1
        bool rebootplayers;
        // offset 0x93d, size 0x1
        bool oldschoolmode;
        // offset 0x93e, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x93f, size 0x1
        bool allowfinalkillcam;
        // offset 0x940, size 0x1
        bool allowspectating;
        // offset 0x941, size 0x1
        bool usabledynents;
        // offset 0x942, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x943, size 0x1
        bool spawnselectenabled;
        // offset 0x944, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x945, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x946, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x947, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x948, size 0x1
        bool disallowprone;
        // offset 0x949, size 0x1
        bool moveplayers;
        // offset 0x94a, size 0x1
        bool disabletacinsert;
        // offset 0x94b, size 0x1
        bool voipdeadhearallliving;
        // offset 0x94c, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x94d, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x94e, size 0x1
        bool flagcapturerateincrease;
        // offset 0x94f, size 0x1
        bool use_doors;
        // offset 0x950, size 0x1
        bool pvponly;
        // offset 0x951, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x952, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x953, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x954, size 0x1
        bool allowingameteamchange;
        // offset 0x955, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x956, size 0x1
        bool deathzones;
        // offset 0x957, size 0x1
        bool classicmode;
        // offset 0x958, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x959, size 0x1
        bool capdecay;
        // offset 0x95a, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x95b, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x95c, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x95d, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x95e, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x960
    // offset 0x0, size 0x960
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_1db7e9313d43e77a"

version 43 {
    // idx 1 members 300 size 0x960
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1a8, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1b8, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1c8, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1d8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1e8, size 0x8
        uint:5 maxallocation;
        // offset 0x1f0, size 0x8
        uint:4 carryscore;
        // offset 0x1f8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x200, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x208, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x210, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x218, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x220, size 0x8
        uint:7 idleflagresettime;
        // offset 0x228, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x230, size 0x8
        uint:4 setbacks;
        // offset 0x238, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x258, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x268, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x278, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x288, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x298, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2a8, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2b8, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c0, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2c8, size 0x10
        uint:15 scorelimit;
        // offset 0x2d8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2e8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2f8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x308, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x310, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x318, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x320, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b0, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4b8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4c8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4d8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f0, size 0x8
        uint:5 boottime;
        // offset 0x4f8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x500, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x508, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x510, size 0x8
        uint:7 teamnumlives;
        // offset 0x518, size 0x8
        fixed<8,2> planttime;
        // offset 0x520, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x528, size 0x10
        uint:10 inactivitykick;
        // offset 0x538, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x540, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x588, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x598, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5a8, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5b0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5b8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5c0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5c8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5d0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5e0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5e8, size 0x8
        uint:2 robotspeed;
        // offset 0x5f0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5f8, size 0x8
        uint:7 servermsec;
        // offset 0x600, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x608, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x610, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x620, size 0x10
        uint:10 leaderbonus;
        // offset 0x630, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x638, size 0x10
        uint:9 autodestroytime;
        // offset 0x648, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x650, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x658, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x660, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x668, size 0x8
        uint:6 prematchperiod;
        // offset 0x670, size 0x8
        uint:6 teamkillscore;
        // offset 0x678, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x680, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x688, size 0x8
        uint:3 platooncount;
        // offset 0x690, size 0x20
        int deployablebarrierhealth;
        // offset 0x6b0, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6b8, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6c0, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6c8, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6d0, size 0x8
        uint:7 playernumlives;
        // offset 0x6d8, size 0x8
        uint:2 infectionmode;
        // offset 0x6e0, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6e8, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6f0, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6f8, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x700, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x708, size 0x8
        uint:6 reboottime;
        // offset 0x710, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x718, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x720, size 0x8
        uint:4 pickuptime;
        // offset 0x728, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x738, size 0x20
        int hash_64727525f5957d06;
        // offset 0x758, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x778, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x780, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x788, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x790, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x798, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x7a0, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7b0, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7b8, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7c0, size 0x8
        uint:7 startplayers;
        // offset 0x7c8, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x7d0, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x7d8, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7e0, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7e8, size 0x8
        uint:4 roundswitch;
        // offset 0x7f0, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7f8, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x800, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x808, size 0x8
        uint:5 weaponcount;
        // offset 0x810, size 0x8
        uint:7 weapontimer;
        // offset 0x818, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x828, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x830, size 0x8
        uint:7 drafttime;
        // offset 0x838, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x840, size 0x8
        uint:7 objectivespawntime;
        // offset 0x848, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x858, size 0x8
        uint:4 throwscore;
        // offset 0x860, size 0x8
        uint:4 deposittime;
        // offset 0x868, size 0x10
        fixed<10,2> extratime;
        // offset 0x878, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x880, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x888, size 0x8
        uint:7 teamcount;
        // offset 0x890, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8b0, size 0x8
        uint:4 roundlimit;
        // offset 0x8b8, size 0x8
        uint:2 charactercustomization;
        // offset 0x8c0, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8c8, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x8d0, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x8d8, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8e8, size 0x1
        bool delayplayer;
        // offset 0x8e9, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8ea, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8eb, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8ec, size 0x1
        bool draftenabled;
        // offset 0x8ed, size 0x1
        bool droppedtagrespawn;
        // offset 0x8ee, size 0x1
        bool voipkillershearvictim;
        // offset 0x8ef, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8f0, size 0x1
        bool deathcirclerespawn;
        // offset 0x8f1, size 0x1
        bool presetclassesperteam;
        // offset 0x8f2, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8f3, size 0x1
        bool hardcoremode;
        // offset 0x8f4, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8f5, size 0x1
        bool useitemspawns;
        // offset 0x8f6, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8f7, size 0x1
        bool silentplant;
        // offset 0x8f8, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8f9, size 0x1
        bool drafteveryround;
        // offset 0x8fa, size 0x1
        bool timepauseswheninzone;
        // offset 0x8fb, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8fc, size 0x1
        bool scoreperplayer;
        // offset 0x8fd, size 0x1
        bool ekiaresetondeath;
        // offset 0x8fe, size 0x1
        bool kothmode;
        // offset 0x8ff, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x900, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x901, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x902, size 0x1
        bool decayprogress;
        // offset 0x903, size 0x1
        bool playerqueuedrespawn;
        // offset 0x904, size 0x1
        bool cumulativeroundscores;
        // offset 0x905, size 0x1
        bool voipdeadhearkiller;
        // offset 0x906, size 0x1
        bool skiplaststand;
        // offset 0x907, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x908, size 0x1
        bool usespawngroups;
        // offset 0x909, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x90a, size 0x1
        bool platoonassignment;
        // offset 0x90b, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0x90c, size 0x1
        bool allowbattlechatter;
        // offset 0x90d, size 0x1
        bool fowrevealenabled;
        // offset 0x90e, size 0x1
        bool disablecontracts;
        // offset 0x90f, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x910, size 0x1
        bool allowannouncer;
        // offset 0x911, size 0x1
        bool disallowaimslowdown;
        // offset 0x912, size 0x1
        bool vehiclesenabled;
        // offset 0x913, size 0x1
        bool decaycapturedzones;
        // offset 0x914, size 0x1
        bool neutralzone;
        // offset 0x915, size 0x1
        bool boastallowcam;
        // offset 0x916, size 0x1
        bool onlyheadshots;
        // offset 0x917, size 0x1
        bool flagcapturecondition;
        // offset 0x918, size 0x1
        bool flagcanbeneutralized;
        // offset 0x919, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x91a, size 0x1
        bool vehiclestimed;
        // offset 0x91b, size 0x1
        bool pregamedraftenabled;
        // offset 0x91c, size 0x1
        bool fogofwarminimap;
        // offset 0x91d, size 0x1
        bool teamkillpointloss;
        // offset 0x91e, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x91f, size 0x1
        bool perksenabled;
        // offset 0x920, size 0x1
        bool allowmapscripting;
        // offset 0x921, size 0x1
        bool robotshield;
        // offset 0x922, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x923, size 0x1
        bool allowkillcam;
        // offset 0x924, size 0x1
        bool disableattachments;
        // offset 0x925, size 0x1
        bool disablecompass;
        // offset 0x926, size 0x1
        bool disableweapondrop;
        // offset 0x927, size 0x1
        bool escalationenabled;
        // offset 0x928, size 0x1
        bool disablecac;
        // offset 0x929, size 0x1
        bool disableclassselection;
        // offset 0x92a, size 0x1
        bool hash_48670d9509071424;
        // offset 0x92b, size 0x1
        bool autoteambalance;
        // offset 0x92c, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x92d, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x92e, size 0x1
        bool allowplayofthematch;
        // offset 0x92f, size 0x1
        bool allowprone;
        // offset 0x930, size 0x1
        bool scoreresetondeath;
        // offset 0x931, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x932, size 0x1
        bool playerforcerespawn;
        // offset 0x933, size 0x1
        bool multibomb;
        // offset 0x934, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x935, size 0x1
        bool deathcircle;
        // offset 0x936, size 0x1
        bool boastenabled;
        // offset 0x937, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x938, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x939, size 0x1
        bool deathpointloss;
        // offset 0x93a, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x93b, size 0x1
        bool rebootplayers;
        // offset 0x93c, size 0x1
        bool oldschoolmode;
        // offset 0x93d, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x93e, size 0x1
        bool allowfinalkillcam;
        // offset 0x93f, size 0x1
        bool allowspectating;
        // offset 0x940, size 0x1
        bool usabledynents;
        // offset 0x941, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x942, size 0x1
        bool spawnselectenabled;
        // offset 0x943, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x944, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x945, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x946, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x947, size 0x1
        bool disallowprone;
        // offset 0x948, size 0x1
        bool moveplayers;
        // offset 0x949, size 0x1
        bool disabletacinsert;
        // offset 0x94a, size 0x1
        bool voipdeadhearallliving;
        // offset 0x94b, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x94c, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x94d, size 0x1
        bool flagcapturerateincrease;
        // offset 0x94e, size 0x1
        bool use_doors;
        // offset 0x94f, size 0x1
        bool pvponly;
        // offset 0x950, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x951, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x952, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x953, size 0x1
        bool allowingameteamchange;
        // offset 0x954, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x955, size 0x1
        bool deathzones;
        // offset 0x956, size 0x1
        bool classicmode;
        // offset 0x957, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x958, size 0x1
        bool capdecay;
        // offset 0x959, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x95a, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x95b, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x95c, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x95d, size 0x3
        uint:1 __pad[3];
    };

    // idx 0 members 1 size 0x960
    // offset 0x0, size 0x960
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_2cbd1124d0dce099"

version 42 {
    // idx 1 members 298 size 0x958
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1a8, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1b8, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1c8, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1d8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1e8, size 0x8
        uint:5 maxallocation;
        // offset 0x1f0, size 0x8
        uint:4 carryscore;
        // offset 0x1f8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x200, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x208, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x210, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x218, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x220, size 0x8
        uint:7 idleflagresettime;
        // offset 0x228, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x230, size 0x8
        uint:4 setbacks;
        // offset 0x238, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x258, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x268, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x278, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x288, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x298, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2a8, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2b8, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c0, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2c8, size 0x10
        uint:15 scorelimit;
        // offset 0x2d8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2e8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2f8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x308, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x310, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x318, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x320, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b0, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4b8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4c8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4d8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f0, size 0x8
        uint:5 boottime;
        // offset 0x4f8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x500, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x508, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x510, size 0x8
        uint:7 teamnumlives;
        // offset 0x518, size 0x8
        fixed<8,2> planttime;
        // offset 0x520, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x528, size 0x10
        uint:10 inactivitykick;
        // offset 0x538, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x540, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x588, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x598, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5a8, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5b0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5b8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5c0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5c8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5d0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5e0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5e8, size 0x8
        uint:2 robotspeed;
        // offset 0x5f0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5f8, size 0x8
        uint:7 servermsec;
        // offset 0x600, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x608, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x610, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x620, size 0x10
        uint:10 leaderbonus;
        // offset 0x630, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x638, size 0x10
        uint:9 autodestroytime;
        // offset 0x648, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x650, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x658, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x660, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x668, size 0x8
        uint:6 prematchperiod;
        // offset 0x670, size 0x8
        uint:6 teamkillscore;
        // offset 0x678, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x680, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x688, size 0x20
        int deployablebarrierhealth;
        // offset 0x6a8, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6b0, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6b8, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6c0, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6c8, size 0x8
        uint:7 playernumlives;
        // offset 0x6d0, size 0x8
        uint:2 infectionmode;
        // offset 0x6d8, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6e0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6e8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6f0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6f8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x700, size 0x8
        uint:6 reboottime;
        // offset 0x708, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x710, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x718, size 0x8
        uint:4 pickuptime;
        // offset 0x720, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x730, size 0x20
        int hash_64727525f5957d06;
        // offset 0x750, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x770, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x778, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x780, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x788, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x790, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x798, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7a8, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7b0, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7b8, size 0x8
        uint:7 startplayers;
        // offset 0x7c0, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x7c8, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x7d0, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7d8, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7e0, size 0x8
        uint:4 roundswitch;
        // offset 0x7e8, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7f0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7f8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x800, size 0x8
        uint:5 weaponcount;
        // offset 0x808, size 0x8
        uint:7 weapontimer;
        // offset 0x810, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x820, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x828, size 0x8
        uint:7 drafttime;
        // offset 0x830, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x838, size 0x8
        uint:7 objectivespawntime;
        // offset 0x840, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x850, size 0x8
        uint:4 throwscore;
        // offset 0x858, size 0x8
        uint:4 deposittime;
        // offset 0x860, size 0x10
        fixed<10,2> extratime;
        // offset 0x870, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x878, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x880, size 0x8
        uint:7 teamcount;
        // offset 0x888, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8a8, size 0x8
        uint:4 roundlimit;
        // offset 0x8b0, size 0x8
        uint:2 charactercustomization;
        // offset 0x8b8, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8c0, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x8c8, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x8d0, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8e0, size 0x1
        bool delayplayer;
        // offset 0x8e1, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8e2, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8e3, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8e4, size 0x1
        bool draftenabled;
        // offset 0x8e5, size 0x1
        bool droppedtagrespawn;
        // offset 0x8e6, size 0x1
        bool voipkillershearvictim;
        // offset 0x8e7, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8e8, size 0x1
        bool deathcirclerespawn;
        // offset 0x8e9, size 0x1
        bool presetclassesperteam;
        // offset 0x8ea, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8eb, size 0x1
        bool hardcoremode;
        // offset 0x8ec, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8ed, size 0x1
        bool useitemspawns;
        // offset 0x8ee, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8ef, size 0x1
        bool silentplant;
        // offset 0x8f0, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8f1, size 0x1
        bool drafteveryround;
        // offset 0x8f2, size 0x1
        bool timepauseswheninzone;
        // offset 0x8f3, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8f4, size 0x1
        bool scoreperplayer;
        // offset 0x8f5, size 0x1
        bool ekiaresetondeath;
        // offset 0x8f6, size 0x1
        bool kothmode;
        // offset 0x8f7, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8f8, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8f9, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x8fa, size 0x1
        bool decayprogress;
        // offset 0x8fb, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8fc, size 0x1
        bool cumulativeroundscores;
        // offset 0x8fd, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8fe, size 0x1
        bool skiplaststand;
        // offset 0x8ff, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x900, size 0x1
        bool usespawngroups;
        // offset 0x901, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x902, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0x903, size 0x1
        bool allowbattlechatter;
        // offset 0x904, size 0x1
        bool fowrevealenabled;
        // offset 0x905, size 0x1
        bool disablecontracts;
        // offset 0x906, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x907, size 0x1
        bool allowannouncer;
        // offset 0x908, size 0x1
        bool disallowaimslowdown;
        // offset 0x909, size 0x1
        bool vehiclesenabled;
        // offset 0x90a, size 0x1
        bool decaycapturedzones;
        // offset 0x90b, size 0x1
        bool neutralzone;
        // offset 0x90c, size 0x1
        bool boastallowcam;
        // offset 0x90d, size 0x1
        bool onlyheadshots;
        // offset 0x90e, size 0x1
        bool flagcapturecondition;
        // offset 0x90f, size 0x1
        bool flagcanbeneutralized;
        // offset 0x910, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x911, size 0x1
        bool vehiclestimed;
        // offset 0x912, size 0x1
        bool pregamedraftenabled;
        // offset 0x913, size 0x1
        bool fogofwarminimap;
        // offset 0x914, size 0x1
        bool teamkillpointloss;
        // offset 0x915, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x916, size 0x1
        bool perksenabled;
        // offset 0x917, size 0x1
        bool allowmapscripting;
        // offset 0x918, size 0x1
        bool robotshield;
        // offset 0x919, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x91a, size 0x1
        bool allowkillcam;
        // offset 0x91b, size 0x1
        bool disableattachments;
        // offset 0x91c, size 0x1
        bool disablecompass;
        // offset 0x91d, size 0x1
        bool disableweapondrop;
        // offset 0x91e, size 0x1
        bool escalationenabled;
        // offset 0x91f, size 0x1
        bool disablecac;
        // offset 0x920, size 0x1
        bool disableclassselection;
        // offset 0x921, size 0x1
        bool hash_48670d9509071424;
        // offset 0x922, size 0x1
        bool autoteambalance;
        // offset 0x923, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x924, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x925, size 0x1
        bool allowplayofthematch;
        // offset 0x926, size 0x1
        bool allowprone;
        // offset 0x927, size 0x1
        bool scoreresetondeath;
        // offset 0x928, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x929, size 0x1
        bool playerforcerespawn;
        // offset 0x92a, size 0x1
        bool multibomb;
        // offset 0x92b, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x92c, size 0x1
        bool deathcircle;
        // offset 0x92d, size 0x1
        bool boastenabled;
        // offset 0x92e, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x92f, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x930, size 0x1
        bool deathpointloss;
        // offset 0x931, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x932, size 0x1
        bool rebootplayers;
        // offset 0x933, size 0x1
        bool oldschoolmode;
        // offset 0x934, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x935, size 0x1
        bool allowfinalkillcam;
        // offset 0x936, size 0x1
        bool allowspectating;
        // offset 0x937, size 0x1
        bool usabledynents;
        // offset 0x938, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x939, size 0x1
        bool spawnselectenabled;
        // offset 0x93a, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x93b, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x93c, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x93d, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x93e, size 0x1
        bool disallowprone;
        // offset 0x93f, size 0x1
        bool moveplayers;
        // offset 0x940, size 0x1
        bool disabletacinsert;
        // offset 0x941, size 0x1
        bool voipdeadhearallliving;
        // offset 0x942, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x943, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x944, size 0x1
        bool flagcapturerateincrease;
        // offset 0x945, size 0x1
        bool use_doors;
        // offset 0x946, size 0x1
        bool pvponly;
        // offset 0x947, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x948, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x949, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x94a, size 0x1
        bool allowingameteamchange;
        // offset 0x94b, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x94c, size 0x1
        bool deathzones;
        // offset 0x94d, size 0x1
        bool classicmode;
        // offset 0x94e, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x94f, size 0x1
        bool capdecay;
        // offset 0x950, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x951, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x952, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x953, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x954, size 0x4
        uint:1 __pad[4];
    };

    // idx 0 members 1 size 0x958
    // offset 0x0, size 0x958
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_b596a18c1efad946"

version 41 {
    // idx 1 members 297 size 0x958
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1a8, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1b8, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1c8, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1d8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1e8, size 0x8
        uint:5 maxallocation;
        // offset 0x1f0, size 0x8
        uint:4 carryscore;
        // offset 0x1f8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x200, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x208, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x210, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x218, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x220, size 0x8
        uint:7 idleflagresettime;
        // offset 0x228, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x230, size 0x8
        uint:4 setbacks;
        // offset 0x238, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x258, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x268, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x278, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x288, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x298, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2a8, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2b8, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c0, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2c8, size 0x10
        uint:15 scorelimit;
        // offset 0x2d8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2e8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2f8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x308, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x310, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x318, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x320, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b0, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4b8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4c8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4d8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f0, size 0x8
        uint:5 boottime;
        // offset 0x4f8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x500, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x508, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x510, size 0x8
        uint:7 teamnumlives;
        // offset 0x518, size 0x8
        fixed<8,2> planttime;
        // offset 0x520, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x528, size 0x10
        uint:10 inactivitykick;
        // offset 0x538, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x540, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x588, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x598, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5a8, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5b0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5b8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5c0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5c8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5d0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5e0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5e8, size 0x8
        uint:2 robotspeed;
        // offset 0x5f0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5f8, size 0x8
        uint:7 servermsec;
        // offset 0x600, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x608, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x610, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x620, size 0x10
        uint:10 leaderbonus;
        // offset 0x630, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x638, size 0x10
        uint:9 autodestroytime;
        // offset 0x648, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x650, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x658, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x660, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x668, size 0x8
        uint:6 prematchperiod;
        // offset 0x670, size 0x8
        uint:6 teamkillscore;
        // offset 0x678, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x680, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x688, size 0x20
        int deployablebarrierhealth;
        // offset 0x6a8, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6b0, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6b8, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6c0, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6c8, size 0x8
        uint:7 playernumlives;
        // offset 0x6d0, size 0x8
        uint:2 infectionmode;
        // offset 0x6d8, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6e0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6e8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6f0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6f8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x700, size 0x8
        uint:6 reboottime;
        // offset 0x708, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x710, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x718, size 0x8
        uint:4 pickuptime;
        // offset 0x720, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x730, size 0x20
        int hash_64727525f5957d06;
        // offset 0x750, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x770, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x778, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x780, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x788, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x790, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x798, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7a8, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7b0, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7b8, size 0x8
        uint:7 startplayers;
        // offset 0x7c0, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x7c8, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x7d0, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7d8, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7e0, size 0x8
        uint:4 roundswitch;
        // offset 0x7e8, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7f0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7f8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x800, size 0x8
        uint:5 weaponcount;
        // offset 0x808, size 0x8
        uint:7 weapontimer;
        // offset 0x810, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x820, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x828, size 0x8
        uint:7 drafttime;
        // offset 0x830, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x838, size 0x8
        uint:7 objectivespawntime;
        // offset 0x840, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x850, size 0x8
        uint:4 throwscore;
        // offset 0x858, size 0x8
        uint:4 deposittime;
        // offset 0x860, size 0x10
        fixed<10,2> extratime;
        // offset 0x870, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x878, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x880, size 0x8
        uint:7 teamcount;
        // offset 0x888, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8a8, size 0x8
        uint:4 roundlimit;
        // offset 0x8b0, size 0x8
        uint:2 charactercustomization;
        // offset 0x8b8, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8c0, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x8c8, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x8d0, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8e0, size 0x1
        bool delayplayer;
        // offset 0x8e1, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8e2, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8e3, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8e4, size 0x1
        bool draftenabled;
        // offset 0x8e5, size 0x1
        bool droppedtagrespawn;
        // offset 0x8e6, size 0x1
        bool voipkillershearvictim;
        // offset 0x8e7, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8e8, size 0x1
        bool deathcirclerespawn;
        // offset 0x8e9, size 0x1
        bool presetclassesperteam;
        // offset 0x8ea, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8eb, size 0x1
        bool hardcoremode;
        // offset 0x8ec, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8ed, size 0x1
        bool useitemspawns;
        // offset 0x8ee, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8ef, size 0x1
        bool silentplant;
        // offset 0x8f0, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8f1, size 0x1
        bool drafteveryround;
        // offset 0x8f2, size 0x1
        bool timepauseswheninzone;
        // offset 0x8f3, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8f4, size 0x1
        bool scoreperplayer;
        // offset 0x8f5, size 0x1
        bool ekiaresetondeath;
        // offset 0x8f6, size 0x1
        bool kothmode;
        // offset 0x8f7, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8f8, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8f9, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x8fa, size 0x1
        bool decayprogress;
        // offset 0x8fb, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8fc, size 0x1
        bool cumulativeroundscores;
        // offset 0x8fd, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8fe, size 0x1
        bool skiplaststand;
        // offset 0x8ff, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x900, size 0x1
        bool usespawngroups;
        // offset 0x901, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x902, size 0x1
        bool allowbattlechatter;
        // offset 0x903, size 0x1
        bool fowrevealenabled;
        // offset 0x904, size 0x1
        bool disablecontracts;
        // offset 0x905, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x906, size 0x1
        bool allowannouncer;
        // offset 0x907, size 0x1
        bool disallowaimslowdown;
        // offset 0x908, size 0x1
        bool vehiclesenabled;
        // offset 0x909, size 0x1
        bool decaycapturedzones;
        // offset 0x90a, size 0x1
        bool neutralzone;
        // offset 0x90b, size 0x1
        bool boastallowcam;
        // offset 0x90c, size 0x1
        bool onlyheadshots;
        // offset 0x90d, size 0x1
        bool flagcapturecondition;
        // offset 0x90e, size 0x1
        bool flagcanbeneutralized;
        // offset 0x90f, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x910, size 0x1
        bool vehiclestimed;
        // offset 0x911, size 0x1
        bool pregamedraftenabled;
        // offset 0x912, size 0x1
        bool fogofwarminimap;
        // offset 0x913, size 0x1
        bool teamkillpointloss;
        // offset 0x914, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x915, size 0x1
        bool perksenabled;
        // offset 0x916, size 0x1
        bool allowmapscripting;
        // offset 0x917, size 0x1
        bool robotshield;
        // offset 0x918, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x919, size 0x1
        bool allowkillcam;
        // offset 0x91a, size 0x1
        bool disableattachments;
        // offset 0x91b, size 0x1
        bool disablecompass;
        // offset 0x91c, size 0x1
        bool disableweapondrop;
        // offset 0x91d, size 0x1
        bool escalationenabled;
        // offset 0x91e, size 0x1
        bool disablecac;
        // offset 0x91f, size 0x1
        bool disableclassselection;
        // offset 0x920, size 0x1
        bool hash_48670d9509071424;
        // offset 0x921, size 0x1
        bool autoteambalance;
        // offset 0x922, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0x923, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x924, size 0x1
        bool allowplayofthematch;
        // offset 0x925, size 0x1
        bool allowprone;
        // offset 0x926, size 0x1
        bool scoreresetondeath;
        // offset 0x927, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x928, size 0x1
        bool playerforcerespawn;
        // offset 0x929, size 0x1
        bool multibomb;
        // offset 0x92a, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x92b, size 0x1
        bool deathcircle;
        // offset 0x92c, size 0x1
        bool boastenabled;
        // offset 0x92d, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x92e, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x92f, size 0x1
        bool deathpointloss;
        // offset 0x930, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x931, size 0x1
        bool rebootplayers;
        // offset 0x932, size 0x1
        bool oldschoolmode;
        // offset 0x933, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x934, size 0x1
        bool allowfinalkillcam;
        // offset 0x935, size 0x1
        bool allowspectating;
        // offset 0x936, size 0x1
        bool usabledynents;
        // offset 0x937, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x938, size 0x1
        bool spawnselectenabled;
        // offset 0x939, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x93a, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x93b, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x93c, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x93d, size 0x1
        bool disallowprone;
        // offset 0x93e, size 0x1
        bool moveplayers;
        // offset 0x93f, size 0x1
        bool disabletacinsert;
        // offset 0x940, size 0x1
        bool voipdeadhearallliving;
        // offset 0x941, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x942, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x943, size 0x1
        bool flagcapturerateincrease;
        // offset 0x944, size 0x1
        bool use_doors;
        // offset 0x945, size 0x1
        bool pvponly;
        // offset 0x946, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x947, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x948, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x949, size 0x1
        bool allowingameteamchange;
        // offset 0x94a, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x94b, size 0x1
        bool deathzones;
        // offset 0x94c, size 0x1
        bool classicmode;
        // offset 0x94d, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x94e, size 0x1
        bool capdecay;
        // offset 0x94f, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x950, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x951, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x952, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x953, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 1 size 0x958
    // offset 0x0, size 0x958
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_3ed186971f2020b"

version 40 {
    // idx 1 members 295 size 0x958
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x188, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x190, size 0x8
        uint:5 roundwinlimit;
        // offset 0x198, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1a8, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1b8, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1c8, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1d0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1d8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1e0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1e8, size 0x8
        uint:5 maxallocation;
        // offset 0x1f0, size 0x8
        uint:4 carryscore;
        // offset 0x1f8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x200, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x208, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x210, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x218, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x220, size 0x8
        uint:7 idleflagresettime;
        // offset 0x228, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x230, size 0x8
        uint:4 setbacks;
        // offset 0x238, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x258, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x268, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x278, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x288, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x298, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2a8, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2b8, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2c0, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2c8, size 0x10
        uint:15 scorelimit;
        // offset 0x2d8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2e0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2e8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2f0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2f8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x308, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x310, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x318, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x320, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4b0, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x4b8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4c0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4c8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4d0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4d8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4e0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4f0, size 0x8
        uint:5 boottime;
        // offset 0x4f8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x500, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x508, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x510, size 0x8
        uint:7 teamnumlives;
        // offset 0x518, size 0x8
        fixed<8,2> planttime;
        // offset 0x520, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x528, size 0x10
        uint:10 inactivitykick;
        // offset 0x538, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x540, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x588, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x598, size 0x10
        fixed<10,2> destroytime;
        // offset 0x5a8, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5b0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5b8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5c0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5c8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5d0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5e0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5e8, size 0x8
        uint:2 robotspeed;
        // offset 0x5f0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5f8, size 0x8
        uint:7 servermsec;
        // offset 0x600, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x608, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x610, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x620, size 0x10
        uint:10 leaderbonus;
        // offset 0x630, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x638, size 0x10
        uint:9 autodestroytime;
        // offset 0x648, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x650, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x658, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x660, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x668, size 0x8
        uint:6 prematchperiod;
        // offset 0x670, size 0x8
        uint:6 teamkillscore;
        // offset 0x678, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x680, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x688, size 0x20
        int deployablebarrierhealth;
        // offset 0x6a8, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6b0, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6b8, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6c0, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6c8, size 0x8
        uint:7 playernumlives;
        // offset 0x6d0, size 0x8
        uint:2 infectionmode;
        // offset 0x6d8, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6e0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6e8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6f0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6f8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x700, size 0x8
        uint:6 reboottime;
        // offset 0x708, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x710, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x718, size 0x8
        uint:4 pickuptime;
        // offset 0x720, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x730, size 0x20
        int hash_64727525f5957d06;
        // offset 0x750, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x770, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x778, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x780, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x788, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x790, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x798, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x7a8, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7b0, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7b8, size 0x8
        uint:7 startplayers;
        // offset 0x7c0, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x7c8, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x7d0, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7d8, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7e0, size 0x8
        uint:4 roundswitch;
        // offset 0x7e8, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7f0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7f8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x800, size 0x8
        uint:5 weaponcount;
        // offset 0x808, size 0x8
        uint:7 weapontimer;
        // offset 0x810, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x820, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x828, size 0x8
        uint:7 drafttime;
        // offset 0x830, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x838, size 0x8
        uint:7 objectivespawntime;
        // offset 0x840, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x850, size 0x8
        uint:4 throwscore;
        // offset 0x858, size 0x8
        uint:4 deposittime;
        // offset 0x860, size 0x10
        fixed<10,2> extratime;
        // offset 0x870, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x878, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x880, size 0x8
        uint:7 teamcount;
        // offset 0x888, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x8a8, size 0x8
        uint:4 roundlimit;
        // offset 0x8b0, size 0x8
        uint:2 charactercustomization;
        // offset 0x8b8, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8c0, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x8c8, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x8d0, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8e0, size 0x1
        bool delayplayer;
        // offset 0x8e1, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8e2, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8e3, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8e4, size 0x1
        bool draftenabled;
        // offset 0x8e5, size 0x1
        bool droppedtagrespawn;
        // offset 0x8e6, size 0x1
        bool voipkillershearvictim;
        // offset 0x8e7, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8e8, size 0x1
        bool presetclassesperteam;
        // offset 0x8e9, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8ea, size 0x1
        bool hardcoremode;
        // offset 0x8eb, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8ec, size 0x1
        bool useitemspawns;
        // offset 0x8ed, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8ee, size 0x1
        bool silentplant;
        // offset 0x8ef, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8f0, size 0x1
        bool drafteveryround;
        // offset 0x8f1, size 0x1
        bool timepauseswheninzone;
        // offset 0x8f2, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8f3, size 0x1
        bool scoreperplayer;
        // offset 0x8f4, size 0x1
        bool ekiaresetondeath;
        // offset 0x8f5, size 0x1
        bool kothmode;
        // offset 0x8f6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8f7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8f8, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x8f9, size 0x1
        bool decayprogress;
        // offset 0x8fa, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8fb, size 0x1
        bool cumulativeroundscores;
        // offset 0x8fc, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8fd, size 0x1
        bool skiplaststand;
        // offset 0x8fe, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x8ff, size 0x1
        bool usespawngroups;
        // offset 0x900, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x901, size 0x1
        bool allowbattlechatter;
        // offset 0x902, size 0x1
        bool fowrevealenabled;
        // offset 0x903, size 0x1
        bool disablecontracts;
        // offset 0x904, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x905, size 0x1
        bool allowannouncer;
        // offset 0x906, size 0x1
        bool disallowaimslowdown;
        // offset 0x907, size 0x1
        bool vehiclesenabled;
        // offset 0x908, size 0x1
        bool decaycapturedzones;
        // offset 0x909, size 0x1
        bool neutralzone;
        // offset 0x90a, size 0x1
        bool boastallowcam;
        // offset 0x90b, size 0x1
        bool onlyheadshots;
        // offset 0x90c, size 0x1
        bool flagcapturecondition;
        // offset 0x90d, size 0x1
        bool flagcanbeneutralized;
        // offset 0x90e, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x90f, size 0x1
        bool vehiclestimed;
        // offset 0x910, size 0x1
        bool pregamedraftenabled;
        // offset 0x911, size 0x1
        bool fogofwarminimap;
        // offset 0x912, size 0x1
        bool teamkillpointloss;
        // offset 0x913, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x914, size 0x1
        bool perksenabled;
        // offset 0x915, size 0x1
        bool allowmapscripting;
        // offset 0x916, size 0x1
        bool robotshield;
        // offset 0x917, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x918, size 0x1
        bool allowkillcam;
        // offset 0x919, size 0x1
        bool disableattachments;
        // offset 0x91a, size 0x1
        bool disablecompass;
        // offset 0x91b, size 0x1
        bool disableweapondrop;
        // offset 0x91c, size 0x1
        bool escalationenabled;
        // offset 0x91d, size 0x1
        bool disablecac;
        // offset 0x91e, size 0x1
        bool disableclassselection;
        // offset 0x91f, size 0x1
        bool hash_48670d9509071424;
        // offset 0x920, size 0x1
        bool autoteambalance;
        // offset 0x921, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x922, size 0x1
        bool allowplayofthematch;
        // offset 0x923, size 0x1
        bool allowprone;
        // offset 0x924, size 0x1
        bool scoreresetondeath;
        // offset 0x925, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x926, size 0x1
        bool playerforcerespawn;
        // offset 0x927, size 0x1
        bool multibomb;
        // offset 0x928, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x929, size 0x1
        bool deathcircle;
        // offset 0x92a, size 0x1
        bool boastenabled;
        // offset 0x92b, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x92c, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x92d, size 0x1
        bool deathpointloss;
        // offset 0x92e, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x92f, size 0x1
        bool rebootplayers;
        // offset 0x930, size 0x1
        bool oldschoolmode;
        // offset 0x931, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x932, size 0x1
        bool allowfinalkillcam;
        // offset 0x933, size 0x1
        bool allowspectating;
        // offset 0x934, size 0x1
        bool usabledynents;
        // offset 0x935, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x936, size 0x1
        bool spawnselectenabled;
        // offset 0x937, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x938, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x939, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x93a, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x93b, size 0x1
        bool disallowprone;
        // offset 0x93c, size 0x1
        bool moveplayers;
        // offset 0x93d, size 0x1
        bool disabletacinsert;
        // offset 0x93e, size 0x1
        bool voipdeadhearallliving;
        // offset 0x93f, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x940, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x941, size 0x1
        bool flagcapturerateincrease;
        // offset 0x942, size 0x1
        bool use_doors;
        // offset 0x943, size 0x1
        bool pvponly;
        // offset 0x944, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x945, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x946, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x947, size 0x1
        bool allowingameteamchange;
        // offset 0x948, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x949, size 0x1
        bool deathzones;
        // offset 0x94a, size 0x1
        bool classicmode;
        // offset 0x94b, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x94c, size 0x1
        bool capdecay;
        // offset 0x94d, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x94e, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x94f, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x950, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x951, size 0x7
        uint:1 __pad[7];
    };

    // idx 0 members 1 size 0x958
    // offset 0x0, size 0x958
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_c8491b85b6c917fc"

version 39 {
    // idx 1 members 293 size 0x948
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x188, size 0x8
        uint:5 roundwinlimit;
        // offset 0x190, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1a0, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1b0, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1c0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1c8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1d0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1d8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1e0, size 0x8
        uint:5 maxallocation;
        // offset 0x1e8, size 0x8
        uint:4 carryscore;
        // offset 0x1f0, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1f8, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x200, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x208, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x210, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x218, size 0x8
        uint:7 idleflagresettime;
        // offset 0x220, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x228, size 0x8
        uint:4 setbacks;
        // offset 0x230, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x250, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x260, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x270, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x280, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x290, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2a0, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2b0, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2b8, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2c0, size 0x10
        uint:15 scorelimit;
        // offset 0x2d0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2d8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2e0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2e8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2f0, size 0x10
        uint:10 playermaxhealth;
        // offset 0x300, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x308, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x310, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x318, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4a8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4b0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4b8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4c0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4c8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4d0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4e0, size 0x8
        uint:5 boottime;
        // offset 0x4e8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4f0, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4f8, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x500, size 0x8
        uint:7 teamnumlives;
        // offset 0x508, size 0x8
        fixed<8,2> planttime;
        // offset 0x510, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x518, size 0x10
        uint:10 inactivitykick;
        // offset 0x528, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x530, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x538, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x588, size 0x10
        fixed<10,2> destroytime;
        // offset 0x598, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5a0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5a8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5b0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5b8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5c0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5d0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5d8, size 0x8
        uint:2 robotspeed;
        // offset 0x5e0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5e8, size 0x8
        uint:7 servermsec;
        // offset 0x5f0, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x5f8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x600, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x610, size 0x10
        uint:10 leaderbonus;
        // offset 0x620, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x628, size 0x10
        uint:9 autodestroytime;
        // offset 0x638, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x640, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x648, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x650, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x658, size 0x8
        uint:6 prematchperiod;
        // offset 0x660, size 0x8
        uint:6 teamkillscore;
        // offset 0x668, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x670, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x678, size 0x20
        int deployablebarrierhealth;
        // offset 0x698, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6a0, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6a8, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6b0, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6b8, size 0x8
        uint:7 playernumlives;
        // offset 0x6c0, size 0x8
        uint:2 infectionmode;
        // offset 0x6c8, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6d0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6d8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6e0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6e8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6f0, size 0x8
        uint:6 reboottime;
        // offset 0x6f8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x700, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x708, size 0x8
        uint:4 pickuptime;
        // offset 0x710, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x720, size 0x20
        int hash_64727525f5957d06;
        // offset 0x740, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x760, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x768, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x770, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x778, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x780, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x788, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x798, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7a0, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7a8, size 0x8
        uint:7 startplayers;
        // offset 0x7b0, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x7b8, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x7c0, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7c8, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7d0, size 0x8
        uint:4 roundswitch;
        // offset 0x7d8, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7e0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7e8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7f0, size 0x8
        uint:5 weaponcount;
        // offset 0x7f8, size 0x8
        uint:7 weapontimer;
        // offset 0x800, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x810, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x818, size 0x8
        uint:7 drafttime;
        // offset 0x820, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x828, size 0x8
        uint:7 objectivespawntime;
        // offset 0x830, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x840, size 0x8
        uint:4 throwscore;
        // offset 0x848, size 0x8
        uint:4 deposittime;
        // offset 0x850, size 0x10
        fixed<10,2> extratime;
        // offset 0x860, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x868, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x870, size 0x8
        uint:7 teamcount;
        // offset 0x878, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x898, size 0x8
        uint:4 roundlimit;
        // offset 0x8a0, size 0x8
        uint:2 charactercustomization;
        // offset 0x8a8, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8b0, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x8b8, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x8c0, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8d0, size 0x1
        bool delayplayer;
        // offset 0x8d1, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8d2, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8d3, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8d4, size 0x1
        bool draftenabled;
        // offset 0x8d5, size 0x1
        bool droppedtagrespawn;
        // offset 0x8d6, size 0x1
        bool voipkillershearvictim;
        // offset 0x8d7, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8d8, size 0x1
        bool presetclassesperteam;
        // offset 0x8d9, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8da, size 0x1
        bool hardcoremode;
        // offset 0x8db, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8dc, size 0x1
        bool useitemspawns;
        // offset 0x8dd, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8de, size 0x1
        bool silentplant;
        // offset 0x8df, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8e0, size 0x1
        bool drafteveryround;
        // offset 0x8e1, size 0x1
        bool timepauseswheninzone;
        // offset 0x8e2, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8e3, size 0x1
        bool scoreperplayer;
        // offset 0x8e4, size 0x1
        bool ekiaresetondeath;
        // offset 0x8e5, size 0x1
        bool kothmode;
        // offset 0x8e6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8e7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8e8, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0x8e9, size 0x1
        bool decayprogress;
        // offset 0x8ea, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8eb, size 0x1
        bool cumulativeroundscores;
        // offset 0x8ec, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8ed, size 0x1
        bool skiplaststand;
        // offset 0x8ee, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x8ef, size 0x1
        bool usespawngroups;
        // offset 0x8f0, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8f1, size 0x1
        bool allowbattlechatter;
        // offset 0x8f2, size 0x1
        bool fowrevealenabled;
        // offset 0x8f3, size 0x1
        bool disablecontracts;
        // offset 0x8f4, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8f5, size 0x1
        bool allowannouncer;
        // offset 0x8f6, size 0x1
        bool disallowaimslowdown;
        // offset 0x8f7, size 0x1
        bool vehiclesenabled;
        // offset 0x8f8, size 0x1
        bool decaycapturedzones;
        // offset 0x8f9, size 0x1
        bool neutralzone;
        // offset 0x8fa, size 0x1
        bool boastallowcam;
        // offset 0x8fb, size 0x1
        bool onlyheadshots;
        // offset 0x8fc, size 0x1
        bool flagcapturecondition;
        // offset 0x8fd, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8fe, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8ff, size 0x1
        bool vehiclestimed;
        // offset 0x900, size 0x1
        bool pregamedraftenabled;
        // offset 0x901, size 0x1
        bool fogofwarminimap;
        // offset 0x902, size 0x1
        bool teamkillpointloss;
        // offset 0x903, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x904, size 0x1
        bool perksenabled;
        // offset 0x905, size 0x1
        bool allowmapscripting;
        // offset 0x906, size 0x1
        bool robotshield;
        // offset 0x907, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x908, size 0x1
        bool allowkillcam;
        // offset 0x909, size 0x1
        bool disableattachments;
        // offset 0x90a, size 0x1
        bool disablecompass;
        // offset 0x90b, size 0x1
        bool disableweapondrop;
        // offset 0x90c, size 0x1
        bool escalationenabled;
        // offset 0x90d, size 0x1
        bool disablecac;
        // offset 0x90e, size 0x1
        bool disableclassselection;
        // offset 0x90f, size 0x1
        bool hash_48670d9509071424;
        // offset 0x910, size 0x1
        bool autoteambalance;
        // offset 0x911, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x912, size 0x1
        bool allowplayofthematch;
        // offset 0x913, size 0x1
        bool allowprone;
        // offset 0x914, size 0x1
        bool scoreresetondeath;
        // offset 0x915, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x916, size 0x1
        bool playerforcerespawn;
        // offset 0x917, size 0x1
        bool multibomb;
        // offset 0x918, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x919, size 0x1
        bool deathcircle;
        // offset 0x91a, size 0x1
        bool boastenabled;
        // offset 0x91b, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x91c, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x91d, size 0x1
        bool deathpointloss;
        // offset 0x91e, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x91f, size 0x1
        bool rebootplayers;
        // offset 0x920, size 0x1
        bool oldschoolmode;
        // offset 0x921, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x922, size 0x1
        bool allowfinalkillcam;
        // offset 0x923, size 0x1
        bool allowspectating;
        // offset 0x924, size 0x1
        bool usabledynents;
        // offset 0x925, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x926, size 0x1
        bool spawnselectenabled;
        // offset 0x927, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x928, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x929, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x92a, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x92b, size 0x1
        bool disallowprone;
        // offset 0x92c, size 0x1
        bool moveplayers;
        // offset 0x92d, size 0x1
        bool disabletacinsert;
        // offset 0x92e, size 0x1
        bool voipdeadhearallliving;
        // offset 0x92f, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x930, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x931, size 0x1
        bool flagcapturerateincrease;
        // offset 0x932, size 0x1
        bool use_doors;
        // offset 0x933, size 0x1
        bool pvponly;
        // offset 0x934, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x935, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x936, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x937, size 0x1
        bool allowingameteamchange;
        // offset 0x938, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x939, size 0x1
        bool deathzones;
        // offset 0x93a, size 0x1
        bool classicmode;
        // offset 0x93b, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x93c, size 0x1
        bool capdecay;
        // offset 0x93d, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x93e, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x93f, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x940, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x941, size 0x7
        uint:1 __pad[7];
    };

    // idx 0 members 1 size 0x948
    // offset 0x0, size 0x948
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_3c928afb2649d19d"

version 38 {
    // idx 1 members 291 size 0x940
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x58, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x60, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x80, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x90, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x98, size 0x8
        uint:6 maxteamplayers;
        // offset 0xa0, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xb0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xc0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xd0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd8, size 0x8
        uint:6 preroundperiod;
        // offset 0xe0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xf0, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x100, size 0x8
        uint:7 maxplayers;
        // offset 0x108, size 0x20
        int forwardspawnhealth;
        // offset 0x128, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x130, size 0x8
        uint:3 ballcount;
        // offset 0x138, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x140, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x150, size 0x8
        uint:3 gunselection;
        // offset 0x158, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x160, size 0x8
        uint:7 maxbots;
        // offset 0x168, size 0x8
        uint:5 prematchrequirement;
        // offset 0x170, size 0x8
        uint:3 spectatetype;
        // offset 0x178, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x180, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x188, size 0x8
        uint:5 roundwinlimit;
        // offset 0x190, size 0x10
        uint:10 antiboostdistance;
        // offset 0x1a0, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1b0, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1c0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1c8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1d0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1d8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1e0, size 0x8
        uint:5 maxallocation;
        // offset 0x1e8, size 0x8
        uint:4 carryscore;
        // offset 0x1f0, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1f8, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x200, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x208, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x210, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x218, size 0x8
        uint:7 idleflagresettime;
        // offset 0x220, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x228, size 0x8
        uint:4 setbacks;
        // offset 0x230, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x250, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x260, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x270, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x280, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x290, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x2a0, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2b0, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2b8, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2c0, size 0x10
        uint:15 scorelimit;
        // offset 0x2d0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2d8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2e0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2e8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2f0, size 0x10
        uint:10 playermaxhealth;
        // offset 0x300, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x308, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x310, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x318, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x4a8, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4b0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4b8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4c0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4c8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4d0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4e0, size 0x8
        uint:5 boottime;
        // offset 0x4e8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4f0, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4f8, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x500, size 0x8
        uint:7 teamnumlives;
        // offset 0x508, size 0x8
        fixed<8,2> planttime;
        // offset 0x510, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x518, size 0x10
        uint:10 inactivitykick;
        // offset 0x528, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x530, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x538, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x578, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x588, size 0x10
        fixed<10,2> destroytime;
        // offset 0x598, size 0x8
        uint:7 flagrespawntime;
        // offset 0x5a0, size 0x8
        uint:2 shutdowndamage;
        // offset 0x5a8, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5b0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5b8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5c0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5d0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5d8, size 0x8
        uint:2 robotspeed;
        // offset 0x5e0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5e8, size 0x8
        uint:7 servermsec;
        // offset 0x5f0, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x5f8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x600, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x610, size 0x10
        uint:10 leaderbonus;
        // offset 0x620, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x628, size 0x10
        uint:9 autodestroytime;
        // offset 0x638, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x640, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x648, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x650, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x658, size 0x8
        uint:6 prematchperiod;
        // offset 0x660, size 0x8
        uint:6 teamkillscore;
        // offset 0x668, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x670, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x678, size 0x20
        int deployablebarrierhealth;
        // offset 0x698, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x6a0, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x6a8, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x6b0, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6b8, size 0x8
        uint:7 playernumlives;
        // offset 0x6c0, size 0x8
        uint:2 infectionmode;
        // offset 0x6c8, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6d0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6d8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6e0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6e8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6f0, size 0x8
        uint:6 reboottime;
        // offset 0x6f8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x700, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x708, size 0x8
        uint:4 pickuptime;
        // offset 0x710, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x720, size 0x20
        int hash_64727525f5957d06;
        // offset 0x740, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x760, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x768, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x770, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x778, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x780, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x788, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x798, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x7a0, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x7a8, size 0x8
        uint:7 startplayers;
        // offset 0x7b0, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x7b8, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x7c0, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7c8, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7d0, size 0x8
        uint:4 roundswitch;
        // offset 0x7d8, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7e0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7e8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7f0, size 0x8
        uint:5 weaponcount;
        // offset 0x7f8, size 0x8
        uint:7 weapontimer;
        // offset 0x800, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x810, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x818, size 0x8
        uint:7 drafttime;
        // offset 0x820, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x828, size 0x8
        uint:7 objectivespawntime;
        // offset 0x830, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x840, size 0x8
        uint:4 throwscore;
        // offset 0x848, size 0x8
        uint:4 deposittime;
        // offset 0x850, size 0x10
        fixed<10,2> extratime;
        // offset 0x860, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x868, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x870, size 0x8
        uint:7 teamcount;
        // offset 0x878, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x898, size 0x8
        uint:4 roundlimit;
        // offset 0x8a0, size 0x8
        uint:2 charactercustomization;
        // offset 0x8a8, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x8b0, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x8b8, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x8c0, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8d0, size 0x1
        bool delayplayer;
        // offset 0x8d1, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8d2, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8d3, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8d4, size 0x1
        bool draftenabled;
        // offset 0x8d5, size 0x1
        bool droppedtagrespawn;
        // offset 0x8d6, size 0x1
        bool voipkillershearvictim;
        // offset 0x8d7, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8d8, size 0x1
        bool presetclassesperteam;
        // offset 0x8d9, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8da, size 0x1
        bool hardcoremode;
        // offset 0x8db, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8dc, size 0x1
        bool useitemspawns;
        // offset 0x8dd, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8de, size 0x1
        bool silentplant;
        // offset 0x8df, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8e0, size 0x1
        bool drafteveryround;
        // offset 0x8e1, size 0x1
        bool timepauseswheninzone;
        // offset 0x8e2, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8e3, size 0x1
        bool scoreperplayer;
        // offset 0x8e4, size 0x1
        bool ekiaresetondeath;
        // offset 0x8e5, size 0x1
        bool kothmode;
        // offset 0x8e6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8e7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8e8, size 0x1
        bool decayprogress;
        // offset 0x8e9, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8ea, size 0x1
        bool cumulativeroundscores;
        // offset 0x8eb, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8ec, size 0x1
        bool skiplaststand;
        // offset 0x8ed, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x8ee, size 0x1
        bool usespawngroups;
        // offset 0x8ef, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8f0, size 0x1
        bool allowbattlechatter;
        // offset 0x8f1, size 0x1
        bool fowrevealenabled;
        // offset 0x8f2, size 0x1
        bool disablecontracts;
        // offset 0x8f3, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8f4, size 0x1
        bool allowannouncer;
        // offset 0x8f5, size 0x1
        bool disallowaimslowdown;
        // offset 0x8f6, size 0x1
        bool vehiclesenabled;
        // offset 0x8f7, size 0x1
        bool decaycapturedzones;
        // offset 0x8f8, size 0x1
        bool neutralzone;
        // offset 0x8f9, size 0x1
        bool boastallowcam;
        // offset 0x8fa, size 0x1
        bool onlyheadshots;
        // offset 0x8fb, size 0x1
        bool flagcapturecondition;
        // offset 0x8fc, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8fd, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8fe, size 0x1
        bool vehiclestimed;
        // offset 0x8ff, size 0x1
        bool pregamedraftenabled;
        // offset 0x900, size 0x1
        bool fogofwarminimap;
        // offset 0x901, size 0x1
        bool teamkillpointloss;
        // offset 0x902, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x903, size 0x1
        bool perksenabled;
        // offset 0x904, size 0x1
        bool allowmapscripting;
        // offset 0x905, size 0x1
        bool robotshield;
        // offset 0x906, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x907, size 0x1
        bool allowkillcam;
        // offset 0x908, size 0x1
        bool disableattachments;
        // offset 0x909, size 0x1
        bool disablecompass;
        // offset 0x90a, size 0x1
        bool disableweapondrop;
        // offset 0x90b, size 0x1
        bool escalationenabled;
        // offset 0x90c, size 0x1
        bool disablecac;
        // offset 0x90d, size 0x1
        bool disableclassselection;
        // offset 0x90e, size 0x1
        bool hash_48670d9509071424;
        // offset 0x90f, size 0x1
        bool autoteambalance;
        // offset 0x910, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x911, size 0x1
        bool allowplayofthematch;
        // offset 0x912, size 0x1
        bool allowprone;
        // offset 0x913, size 0x1
        bool scoreresetondeath;
        // offset 0x914, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x915, size 0x1
        bool playerforcerespawn;
        // offset 0x916, size 0x1
        bool multibomb;
        // offset 0x917, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x918, size 0x1
        bool deathcircle;
        // offset 0x919, size 0x1
        bool boastenabled;
        // offset 0x91a, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x91b, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x91c, size 0x1
        bool deathpointloss;
        // offset 0x91d, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x91e, size 0x1
        bool rebootplayers;
        // offset 0x91f, size 0x1
        bool oldschoolmode;
        // offset 0x920, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x921, size 0x1
        bool allowfinalkillcam;
        // offset 0x922, size 0x1
        bool allowspectating;
        // offset 0x923, size 0x1
        bool usabledynents;
        // offset 0x924, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x925, size 0x1
        bool spawnselectenabled;
        // offset 0x926, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x927, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x928, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x929, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x92a, size 0x1
        bool disallowprone;
        // offset 0x92b, size 0x1
        bool moveplayers;
        // offset 0x92c, size 0x1
        bool disabletacinsert;
        // offset 0x92d, size 0x1
        bool voipdeadhearallliving;
        // offset 0x92e, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x92f, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x930, size 0x1
        bool flagcapturerateincrease;
        // offset 0x931, size 0x1
        bool use_doors;
        // offset 0x932, size 0x1
        bool pvponly;
        // offset 0x933, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x934, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x935, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x936, size 0x1
        bool allowingameteamchange;
        // offset 0x937, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x938, size 0x1
        bool deathzones;
        // offset 0x939, size 0x1
        bool classicmode;
        // offset 0x93a, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x93b, size 0x1
        bool capdecay;
        // offset 0x93c, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x93d, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x93e, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x93f, size 0x1
        bool hash_201c1769d32b30d3;
    };

    // idx 0 members 1 size 0x940
    // offset 0x0, size 0x940
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_389fe73baf8bf648"

version 37 {
    // idx 1 members 287 size 0x918
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf0, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf8, size 0x8
        uint:7 maxplayers;
        // offset 0x100, size 0x20
        int forwardspawnhealth;
        // offset 0x120, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x128, size 0x8
        uint:3 ballcount;
        // offset 0x130, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x140, size 0x8
        uint:3 gunselection;
        // offset 0x148, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x150, size 0x8
        uint:7 maxbots;
        // offset 0x158, size 0x8
        uint:5 prematchrequirement;
        // offset 0x160, size 0x8
        uint:3 spectatetype;
        // offset 0x168, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x170, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x178, size 0x8
        uint:5 roundwinlimit;
        // offset 0x180, size 0x10
        uint:10 antiboostdistance;
        // offset 0x190, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1a0, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1b0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1b8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1c0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1c8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1d0, size 0x8
        uint:5 maxallocation;
        // offset 0x1d8, size 0x8
        uint:4 carryscore;
        // offset 0x1e0, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1e8, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1f0, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1f8, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x200, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x208, size 0x8
        uint:7 idleflagresettime;
        // offset 0x210, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x218, size 0x8
        uint:4 setbacks;
        // offset 0x220, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x240, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x250, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x260, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x270, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x280, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x290, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2a0, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2a8, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2b0, size 0x10
        uint:15 scorelimit;
        // offset 0x2c0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2c8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2d0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2d8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2e0, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2f0, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2f8, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x300, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x308, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x498, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4a0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4a8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4b0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4b8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4c0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4d0, size 0x8
        uint:5 boottime;
        // offset 0x4d8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4e0, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4e8, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4f0, size 0x8
        uint:7 teamnumlives;
        // offset 0x4f8, size 0x8
        fixed<8,2> planttime;
        // offset 0x500, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x508, size 0x10
        uint:10 inactivitykick;
        // offset 0x518, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x520, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x528, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x538, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x578, size 0x10
        fixed<10,2> destroytime;
        // offset 0x588, size 0x8
        uint:7 flagrespawntime;
        // offset 0x590, size 0x8
        uint:2 shutdowndamage;
        // offset 0x598, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5a0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5a8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5b0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5c0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5c8, size 0x8
        uint:2 robotspeed;
        // offset 0x5d0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5d8, size 0x8
        uint:7 servermsec;
        // offset 0x5e0, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5e8, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5f8, size 0x10
        uint:10 leaderbonus;
        // offset 0x608, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x610, size 0x10
        uint:9 autodestroytime;
        // offset 0x620, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x628, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x630, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x638, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x640, size 0x8
        uint:6 prematchperiod;
        // offset 0x648, size 0x8
        uint:6 teamkillscore;
        // offset 0x650, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x658, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x660, size 0x20
        int deployablebarrierhealth;
        // offset 0x680, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x688, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x690, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x698, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6a0, size 0x8
        uint:7 playernumlives;
        // offset 0x6a8, size 0x8
        uint:2 infectionmode;
        // offset 0x6b0, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6b8, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6c0, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6c8, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6d0, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6d8, size 0x8
        uint:6 reboottime;
        // offset 0x6e0, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6e8, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6f0, size 0x8
        uint:4 pickuptime;
        // offset 0x6f8, size 0x20
        int hash_64727525f5957d06;
        // offset 0x718, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x738, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x740, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x748, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x750, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x758, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x760, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x770, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x778, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x780, size 0x8
        uint:7 startplayers;
        // offset 0x788, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x790, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x798, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7a0, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7a8, size 0x8
        uint:4 roundswitch;
        // offset 0x7b0, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7b8, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7c0, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7c8, size 0x8
        uint:5 weaponcount;
        // offset 0x7d0, size 0x8
        uint:7 weapontimer;
        // offset 0x7d8, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7e8, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7f0, size 0x8
        uint:7 drafttime;
        // offset 0x7f8, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x800, size 0x8
        uint:7 objectivespawntime;
        // offset 0x808, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x818, size 0x8
        uint:4 throwscore;
        // offset 0x820, size 0x8
        uint:4 deposittime;
        // offset 0x828, size 0x10
        fixed<10,2> extratime;
        // offset 0x838, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x840, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x848, size 0x8
        uint:7 teamcount;
        // offset 0x850, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x870, size 0x8
        uint:4 roundlimit;
        // offset 0x878, size 0x8
        uint:2 charactercustomization;
        // offset 0x880, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x888, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x890, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x898, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8a8, size 0x1
        bool delayplayer;
        // offset 0x8a9, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8aa, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8ab, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8ac, size 0x1
        bool draftenabled;
        // offset 0x8ad, size 0x1
        bool droppedtagrespawn;
        // offset 0x8ae, size 0x1
        bool voipkillershearvictim;
        // offset 0x8af, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8b0, size 0x1
        bool presetclassesperteam;
        // offset 0x8b1, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8b2, size 0x1
        bool hardcoremode;
        // offset 0x8b3, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8b4, size 0x1
        bool useitemspawns;
        // offset 0x8b5, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8b6, size 0x1
        bool silentplant;
        // offset 0x8b7, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8b8, size 0x1
        bool drafteveryround;
        // offset 0x8b9, size 0x1
        bool timepauseswheninzone;
        // offset 0x8ba, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8bb, size 0x1
        bool scoreperplayer;
        // offset 0x8bc, size 0x1
        bool ekiaresetondeath;
        // offset 0x8bd, size 0x1
        bool kothmode;
        // offset 0x8be, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8bf, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8c0, size 0x1
        bool decayprogress;
        // offset 0x8c1, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8c2, size 0x1
        bool cumulativeroundscores;
        // offset 0x8c3, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8c4, size 0x1
        bool skiplaststand;
        // offset 0x8c5, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0x8c6, size 0x1
        bool usespawngroups;
        // offset 0x8c7, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8c8, size 0x1
        bool allowbattlechatter;
        // offset 0x8c9, size 0x1
        bool fowrevealenabled;
        // offset 0x8ca, size 0x1
        bool disablecontracts;
        // offset 0x8cb, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8cc, size 0x1
        bool allowannouncer;
        // offset 0x8cd, size 0x1
        bool disallowaimslowdown;
        // offset 0x8ce, size 0x1
        bool vehiclesenabled;
        // offset 0x8cf, size 0x1
        bool decaycapturedzones;
        // offset 0x8d0, size 0x1
        bool neutralzone;
        // offset 0x8d1, size 0x1
        bool boastallowcam;
        // offset 0x8d2, size 0x1
        bool onlyheadshots;
        // offset 0x8d3, size 0x1
        bool flagcapturecondition;
        // offset 0x8d4, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8d5, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8d6, size 0x1
        bool vehiclestimed;
        // offset 0x8d7, size 0x1
        bool pregamedraftenabled;
        // offset 0x8d8, size 0x1
        bool fogofwarminimap;
        // offset 0x8d9, size 0x1
        bool teamkillpointloss;
        // offset 0x8da, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8db, size 0x1
        bool perksenabled;
        // offset 0x8dc, size 0x1
        bool allowmapscripting;
        // offset 0x8dd, size 0x1
        bool robotshield;
        // offset 0x8de, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8df, size 0x1
        bool allowkillcam;
        // offset 0x8e0, size 0x1
        bool disableattachments;
        // offset 0x8e1, size 0x1
        bool disablecompass;
        // offset 0x8e2, size 0x1
        bool disableweapondrop;
        // offset 0x8e3, size 0x1
        bool escalationenabled;
        // offset 0x8e4, size 0x1
        bool disablecac;
        // offset 0x8e5, size 0x1
        bool disableclassselection;
        // offset 0x8e6, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8e7, size 0x1
        bool autoteambalance;
        // offset 0x8e8, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8e9, size 0x1
        bool allowplayofthematch;
        // offset 0x8ea, size 0x1
        bool allowprone;
        // offset 0x8eb, size 0x1
        bool scoreresetondeath;
        // offset 0x8ec, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8ed, size 0x1
        bool playerforcerespawn;
        // offset 0x8ee, size 0x1
        bool multibomb;
        // offset 0x8ef, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x8f0, size 0x1
        bool deathcircle;
        // offset 0x8f1, size 0x1
        bool boastenabled;
        // offset 0x8f2, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8f3, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8f4, size 0x1
        bool deathpointloss;
        // offset 0x8f5, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8f6, size 0x1
        bool rebootplayers;
        // offset 0x8f7, size 0x1
        bool oldschoolmode;
        // offset 0x8f8, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8f9, size 0x1
        bool allowfinalkillcam;
        // offset 0x8fa, size 0x1
        bool allowspectating;
        // offset 0x8fb, size 0x1
        bool usabledynents;
        // offset 0x8fc, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x8fd, size 0x1
        bool spawnselectenabled;
        // offset 0x8fe, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8ff, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x900, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x901, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x902, size 0x1
        bool disallowprone;
        // offset 0x903, size 0x1
        bool moveplayers;
        // offset 0x904, size 0x1
        bool disabletacinsert;
        // offset 0x905, size 0x1
        bool voipdeadhearallliving;
        // offset 0x906, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x907, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x908, size 0x1
        bool flagcapturerateincrease;
        // offset 0x909, size 0x1
        bool use_doors;
        // offset 0x90a, size 0x1
        bool pvponly;
        // offset 0x90b, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x90c, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x90d, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x90e, size 0x1
        bool allowingameteamchange;
        // offset 0x90f, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x910, size 0x1
        bool deathzones;
        // offset 0x911, size 0x1
        bool classicmode;
        // offset 0x912, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x913, size 0x1
        bool capdecay;
        // offset 0x914, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x915, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x916, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x917, size 0x1
        bool hash_201c1769d32b30d3;
    };

    // idx 0 members 1 size 0x918
    // offset 0x0, size 0x918
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_8375a8ee6729bd64"

version 36 {
    // idx 1 members 287 size 0x918
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf0, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf8, size 0x8
        uint:7 maxplayers;
        // offset 0x100, size 0x20
        int forwardspawnhealth;
        // offset 0x120, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x128, size 0x8
        uint:3 ballcount;
        // offset 0x130, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x140, size 0x8
        uint:3 gunselection;
        // offset 0x148, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x150, size 0x8
        uint:7 maxbots;
        // offset 0x158, size 0x8
        uint:5 prematchrequirement;
        // offset 0x160, size 0x8
        uint:3 spectatetype;
        // offset 0x168, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x170, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x178, size 0x8
        uint:5 roundwinlimit;
        // offset 0x180, size 0x10
        uint:10 antiboostdistance;
        // offset 0x190, size 0x10
        uint:15 roundscorelimit;
        // offset 0x1a0, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1b0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1b8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1c0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1c8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1d0, size 0x8
        uint:5 maxallocation;
        // offset 0x1d8, size 0x8
        uint:4 carryscore;
        // offset 0x1e0, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1e8, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1f0, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1f8, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x200, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x208, size 0x8
        uint:7 idleflagresettime;
        // offset 0x210, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x218, size 0x8
        uint:4 setbacks;
        // offset 0x220, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x240, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x250, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x260, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x270, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x280, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x290, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x2a0, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2a8, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2b0, size 0x10
        uint:15 scorelimit;
        // offset 0x2c0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2c8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2d0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2d8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2e0, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2f0, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2f8, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x300, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x308, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x498, size 0x8
        uint:3 objectivepingtime;
        // offset 0x4a0, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4a8, size 0x8
        uint:8 carrierarmor;
        // offset 0x4b0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4b8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4c0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4d0, size 0x8
        uint:5 boottime;
        // offset 0x4d8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4e0, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4e8, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4f0, size 0x8
        uint:7 teamnumlives;
        // offset 0x4f8, size 0x8
        fixed<8,2> planttime;
        // offset 0x500, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x508, size 0x10
        uint:10 inactivitykick;
        // offset 0x518, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x520, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x528, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x538, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x568, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x578, size 0x10
        fixed<10,2> destroytime;
        // offset 0x588, size 0x8
        uint:7 flagrespawntime;
        // offset 0x590, size 0x8
        uint:2 shutdowndamage;
        // offset 0x598, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x5a0, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5a8, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5b0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5c0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5c8, size 0x8
        uint:2 robotspeed;
        // offset 0x5d0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5d8, size 0x8
        uint:7 servermsec;
        // offset 0x5e0, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5e8, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5f8, size 0x10
        uint:10 leaderbonus;
        // offset 0x608, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x610, size 0x10
        uint:9 autodestroytime;
        // offset 0x620, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x628, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x630, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x638, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x640, size 0x8
        uint:6 prematchperiod;
        // offset 0x648, size 0x8
        uint:6 teamkillscore;
        // offset 0x650, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x658, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x660, size 0x20
        int deployablebarrierhealth;
        // offset 0x680, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x688, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x690, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x698, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x6a0, size 0x8
        uint:7 playernumlives;
        // offset 0x6a8, size 0x8
        uint:2 infectionmode;
        // offset 0x6b0, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6b8, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6c0, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6c8, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6d0, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6d8, size 0x8
        uint:6 reboottime;
        // offset 0x6e0, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6e8, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6f0, size 0x8
        uint:4 pickuptime;
        // offset 0x6f8, size 0x20
        int hash_64727525f5957d06;
        // offset 0x718, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x738, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x740, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x748, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x750, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x758, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x760, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x770, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x778, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x780, size 0x8
        uint:7 startplayers;
        // offset 0x788, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x790, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x798, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x7a0, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7a8, size 0x8
        uint:4 roundswitch;
        // offset 0x7b0, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7b8, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7c0, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7c8, size 0x8
        uint:5 weaponcount;
        // offset 0x7d0, size 0x8
        uint:7 weapontimer;
        // offset 0x7d8, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7e8, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7f0, size 0x8
        uint:7 drafttime;
        // offset 0x7f8, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x800, size 0x8
        uint:7 objectivespawntime;
        // offset 0x808, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x818, size 0x8
        uint:4 throwscore;
        // offset 0x820, size 0x8
        uint:4 deposittime;
        // offset 0x828, size 0x10
        fixed<10,2> extratime;
        // offset 0x838, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x840, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x848, size 0x8
        uint:7 teamcount;
        // offset 0x850, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x870, size 0x8
        uint:4 roundlimit;
        // offset 0x878, size 0x8
        uint:2 charactercustomization;
        // offset 0x880, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x888, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x890, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x898, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8a8, size 0x1
        bool delayplayer;
        // offset 0x8a9, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8aa, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8ab, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8ac, size 0x1
        bool draftenabled;
        // offset 0x8ad, size 0x1
        bool droppedtagrespawn;
        // offset 0x8ae, size 0x1
        bool voipkillershearvictim;
        // offset 0x8af, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8b0, size 0x1
        bool presetclassesperteam;
        // offset 0x8b1, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8b2, size 0x1
        bool hardcoremode;
        // offset 0x8b3, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8b4, size 0x1
        bool useitemspawns;
        // offset 0x8b5, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8b6, size 0x1
        bool silentplant;
        // offset 0x8b7, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8b8, size 0x1
        bool drafteveryround;
        // offset 0x8b9, size 0x1
        bool timepauseswheninzone;
        // offset 0x8ba, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8bb, size 0x1
        bool scoreperplayer;
        // offset 0x8bc, size 0x1
        bool ekiaresetondeath;
        // offset 0x8bd, size 0x1
        bool kothmode;
        // offset 0x8be, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8bf, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8c0, size 0x1
        bool decayprogress;
        // offset 0x8c1, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8c2, size 0x1
        bool cumulativeroundscores;
        // offset 0x8c3, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8c4, size 0x1
        bool skiplaststand;
        // offset 0x8c5, size 0x1
        bool usespawngroups;
        // offset 0x8c6, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8c7, size 0x1
        bool allowbattlechatter;
        // offset 0x8c8, size 0x1
        bool fowrevealenabled;
        // offset 0x8c9, size 0x1
        bool disablecontracts;
        // offset 0x8ca, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8cb, size 0x1
        bool allowannouncer;
        // offset 0x8cc, size 0x1
        bool disallowaimslowdown;
        // offset 0x8cd, size 0x1
        bool vehiclesenabled;
        // offset 0x8ce, size 0x1
        bool decaycapturedzones;
        // offset 0x8cf, size 0x1
        bool neutralzone;
        // offset 0x8d0, size 0x1
        bool boastallowcam;
        // offset 0x8d1, size 0x1
        bool onlyheadshots;
        // offset 0x8d2, size 0x1
        bool flagcapturecondition;
        // offset 0x8d3, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8d4, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8d5, size 0x1
        bool vehiclestimed;
        // offset 0x8d6, size 0x1
        bool pregamedraftenabled;
        // offset 0x8d7, size 0x1
        bool fogofwarminimap;
        // offset 0x8d8, size 0x1
        bool teamkillpointloss;
        // offset 0x8d9, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8da, size 0x1
        bool perksenabled;
        // offset 0x8db, size 0x1
        bool allowmapscripting;
        // offset 0x8dc, size 0x1
        bool robotshield;
        // offset 0x8dd, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8de, size 0x1
        bool allowkillcam;
        // offset 0x8df, size 0x1
        bool disableattachments;
        // offset 0x8e0, size 0x1
        bool disablecompass;
        // offset 0x8e1, size 0x1
        bool disableweapondrop;
        // offset 0x8e2, size 0x1
        bool escalationenabled;
        // offset 0x8e3, size 0x1
        bool disablecac;
        // offset 0x8e4, size 0x1
        bool disableclassselection;
        // offset 0x8e5, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8e6, size 0x1
        bool autoteambalance;
        // offset 0x8e7, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8e8, size 0x1
        bool allowplayofthematch;
        // offset 0x8e9, size 0x1
        bool allowprone;
        // offset 0x8ea, size 0x1
        bool scoreresetondeath;
        // offset 0x8eb, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8ec, size 0x1
        bool playerforcerespawn;
        // offset 0x8ed, size 0x1
        bool multibomb;
        // offset 0x8ee, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0x8ef, size 0x1
        bool deathcircle;
        // offset 0x8f0, size 0x1
        bool boastenabled;
        // offset 0x8f1, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8f2, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8f3, size 0x1
        bool deathpointloss;
        // offset 0x8f4, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8f5, size 0x1
        bool rebootplayers;
        // offset 0x8f6, size 0x1
        bool oldschoolmode;
        // offset 0x8f7, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8f8, size 0x1
        bool allowfinalkillcam;
        // offset 0x8f9, size 0x1
        bool allowspectating;
        // offset 0x8fa, size 0x1
        bool usabledynents;
        // offset 0x8fb, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x8fc, size 0x1
        bool spawnselectenabled;
        // offset 0x8fd, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8fe, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8ff, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x900, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x901, size 0x1
        bool disallowprone;
        // offset 0x902, size 0x1
        bool moveplayers;
        // offset 0x903, size 0x1
        bool disabletacinsert;
        // offset 0x904, size 0x1
        bool voipdeadhearallliving;
        // offset 0x905, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x906, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x907, size 0x1
        bool flagcapturerateincrease;
        // offset 0x908, size 0x1
        bool use_doors;
        // offset 0x909, size 0x1
        bool pvponly;
        // offset 0x90a, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x90b, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x90c, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x90d, size 0x1
        bool allowingameteamchange;
        // offset 0x90e, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x90f, size 0x1
        bool deathzones;
        // offset 0x910, size 0x1
        bool classicmode;
        // offset 0x911, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x912, size 0x1
        bool capdecay;
        // offset 0x913, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x914, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x915, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x916, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x917, size 0x1
        uint:1 __pad[1];
    };

    // idx 0 members 1 size 0x918
    // offset 0x0, size 0x918
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_73b049ebb7b0f3a2"

version 35 {
    // idx 1 members 285 size 0x910
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0xf0, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf8, size 0x8
        uint:7 maxplayers;
        // offset 0x100, size 0x20
        int forwardspawnhealth;
        // offset 0x120, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x128, size 0x8
        uint:3 ballcount;
        // offset 0x130, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x140, size 0x8
        uint:3 gunselection;
        // offset 0x148, size 0x8
        uint:7 maxbots;
        // offset 0x150, size 0x8
        uint:5 prematchrequirement;
        // offset 0x158, size 0x8
        uint:3 spectatetype;
        // offset 0x160, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x168, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x170, size 0x8
        uint:5 roundwinlimit;
        // offset 0x178, size 0x10
        uint:10 antiboostdistance;
        // offset 0x188, size 0x10
        uint:15 roundscorelimit;
        // offset 0x198, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1a8, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1b0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1b8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1c0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1c8, size 0x8
        uint:5 maxallocation;
        // offset 0x1d0, size 0x8
        uint:4 carryscore;
        // offset 0x1d8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1e0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1e8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1f0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1f8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x200, size 0x8
        uint:7 idleflagresettime;
        // offset 0x208, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x210, size 0x8
        uint:4 setbacks;
        // offset 0x218, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x238, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x248, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x258, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x268, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x278, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x288, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x298, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x2a0, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2a8, size 0x10
        uint:15 scorelimit;
        // offset 0x2b8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2c0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2c8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2d0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2d8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2e8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2f0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2f8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x300, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x490, size 0x8
        uint:3 objectivepingtime;
        // offset 0x498, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x4a0, size 0x8
        uint:8 carrierarmor;
        // offset 0x4a8, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4b0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4b8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4c8, size 0x8
        uint:5 boottime;
        // offset 0x4d0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4d8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4e0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4e8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4f0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4f8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x500, size 0x10
        uint:10 inactivitykick;
        // offset 0x510, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x518, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x540, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x550, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x560, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x570, size 0x10
        fixed<10,2> destroytime;
        // offset 0x580, size 0x8
        uint:7 flagrespawntime;
        // offset 0x588, size 0x8
        uint:2 shutdowndamage;
        // offset 0x590, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x598, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x5a0, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5a8, size 0x10
        uint:11 objectivehealth;
        // offset 0x5b8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5c0, size 0x8
        uint:2 robotspeed;
        // offset 0x5c8, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5d0, size 0x8
        uint:7 servermsec;
        // offset 0x5d8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5e0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5f0, size 0x10
        uint:10 leaderbonus;
        // offset 0x600, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x608, size 0x10
        uint:9 autodestroytime;
        // offset 0x618, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x620, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x628, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x630, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x638, size 0x8
        uint:6 prematchperiod;
        // offset 0x640, size 0x8
        uint:6 teamkillscore;
        // offset 0x648, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x650, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x658, size 0x20
        int deployablebarrierhealth;
        // offset 0x678, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x680, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x688, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x690, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x698, size 0x8
        uint:7 playernumlives;
        // offset 0x6a0, size 0x8
        uint:2 infectionmode;
        // offset 0x6a8, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6b0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6b8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6c0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6c8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6d0, size 0x8
        uint:6 reboottime;
        // offset 0x6d8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6e0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6e8, size 0x8
        uint:4 pickuptime;
        // offset 0x6f0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x710, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x730, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x738, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x740, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x748, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x750, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x758, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x768, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x770, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x778, size 0x8
        uint:7 startplayers;
        // offset 0x780, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x788, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x790, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x798, size 0x8
        uint:5 totalkillsmax;
        // offset 0x7a0, size 0x8
        uint:4 roundswitch;
        // offset 0x7a8, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7b0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7b8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7c0, size 0x8
        uint:5 weaponcount;
        // offset 0x7c8, size 0x8
        uint:7 weapontimer;
        // offset 0x7d0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7e0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7e8, size 0x8
        uint:7 drafttime;
        // offset 0x7f0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7f8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x800, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x810, size 0x8
        uint:4 throwscore;
        // offset 0x818, size 0x8
        uint:4 deposittime;
        // offset 0x820, size 0x10
        fixed<10,2> extratime;
        // offset 0x830, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x838, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x840, size 0x8
        uint:7 teamcount;
        // offset 0x848, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x868, size 0x8
        uint:4 roundlimit;
        // offset 0x870, size 0x8
        uint:2 charactercustomization;
        // offset 0x878, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x880, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x888, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x890, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x8a0, size 0x1
        bool delayplayer;
        // offset 0x8a1, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x8a2, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x8a3, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x8a4, size 0x1
        bool draftenabled;
        // offset 0x8a5, size 0x1
        bool droppedtagrespawn;
        // offset 0x8a6, size 0x1
        bool voipkillershearvictim;
        // offset 0x8a7, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8a8, size 0x1
        bool presetclassesperteam;
        // offset 0x8a9, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8aa, size 0x1
        bool hardcoremode;
        // offset 0x8ab, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8ac, size 0x1
        bool useitemspawns;
        // offset 0x8ad, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8ae, size 0x1
        bool silentplant;
        // offset 0x8af, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8b0, size 0x1
        bool drafteveryround;
        // offset 0x8b1, size 0x1
        bool timepauseswheninzone;
        // offset 0x8b2, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8b3, size 0x1
        bool scoreperplayer;
        // offset 0x8b4, size 0x1
        bool ekiaresetondeath;
        // offset 0x8b5, size 0x1
        bool kothmode;
        // offset 0x8b6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8b7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8b8, size 0x1
        bool decayprogress;
        // offset 0x8b9, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8ba, size 0x1
        bool cumulativeroundscores;
        // offset 0x8bb, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8bc, size 0x1
        bool skiplaststand;
        // offset 0x8bd, size 0x1
        bool usespawngroups;
        // offset 0x8be, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8bf, size 0x1
        bool allowbattlechatter;
        // offset 0x8c0, size 0x1
        bool fowrevealenabled;
        // offset 0x8c1, size 0x1
        bool disablecontracts;
        // offset 0x8c2, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8c3, size 0x1
        bool allowannouncer;
        // offset 0x8c4, size 0x1
        bool disallowaimslowdown;
        // offset 0x8c5, size 0x1
        bool vehiclesenabled;
        // offset 0x8c6, size 0x1
        bool decaycapturedzones;
        // offset 0x8c7, size 0x1
        bool neutralzone;
        // offset 0x8c8, size 0x1
        bool boastallowcam;
        // offset 0x8c9, size 0x1
        bool onlyheadshots;
        // offset 0x8ca, size 0x1
        bool flagcapturecondition;
        // offset 0x8cb, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8cc, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8cd, size 0x1
        bool vehiclestimed;
        // offset 0x8ce, size 0x1
        bool pregamedraftenabled;
        // offset 0x8cf, size 0x1
        bool fogofwarminimap;
        // offset 0x8d0, size 0x1
        bool teamkillpointloss;
        // offset 0x8d1, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8d2, size 0x1
        bool perksenabled;
        // offset 0x8d3, size 0x1
        bool allowmapscripting;
        // offset 0x8d4, size 0x1
        bool robotshield;
        // offset 0x8d5, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8d6, size 0x1
        bool allowkillcam;
        // offset 0x8d7, size 0x1
        bool disableattachments;
        // offset 0x8d8, size 0x1
        bool disablecompass;
        // offset 0x8d9, size 0x1
        bool disableweapondrop;
        // offset 0x8da, size 0x1
        bool escalationenabled;
        // offset 0x8db, size 0x1
        bool disablecac;
        // offset 0x8dc, size 0x1
        bool disableclassselection;
        // offset 0x8dd, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8de, size 0x1
        bool autoteambalance;
        // offset 0x8df, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8e0, size 0x1
        bool allowplayofthematch;
        // offset 0x8e1, size 0x1
        bool allowprone;
        // offset 0x8e2, size 0x1
        bool scoreresetondeath;
        // offset 0x8e3, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8e4, size 0x1
        bool playerforcerespawn;
        // offset 0x8e5, size 0x1
        bool multibomb;
        // offset 0x8e6, size 0x1
        bool deathcircle;
        // offset 0x8e7, size 0x1
        bool boastenabled;
        // offset 0x8e8, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8e9, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8ea, size 0x1
        bool deathpointloss;
        // offset 0x8eb, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8ec, size 0x1
        bool rebootplayers;
        // offset 0x8ed, size 0x1
        bool oldschoolmode;
        // offset 0x8ee, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8ef, size 0x1
        bool allowfinalkillcam;
        // offset 0x8f0, size 0x1
        bool allowspectating;
        // offset 0x8f1, size 0x1
        bool usabledynents;
        // offset 0x8f2, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x8f3, size 0x1
        bool spawnselectenabled;
        // offset 0x8f4, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8f5, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8f6, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8f7, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8f8, size 0x1
        bool disallowprone;
        // offset 0x8f9, size 0x1
        bool moveplayers;
        // offset 0x8fa, size 0x1
        bool disabletacinsert;
        // offset 0x8fb, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8fc, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8fd, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8fe, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8ff, size 0x1
        bool use_doors;
        // offset 0x900, size 0x1
        bool pvponly;
        // offset 0x901, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x902, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x903, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x904, size 0x1
        bool allowingameteamchange;
        // offset 0x905, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x906, size 0x1
        bool deathzones;
        // offset 0x907, size 0x1
        bool classicmode;
        // offset 0x908, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x909, size 0x1
        bool capdecay;
        // offset 0x90a, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x90b, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x90c, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x90d, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x90e, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x910
    // offset 0x0, size 0x910
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_7e7963b0eb29c4c6"

version 34 {
    // idx 1 members 284 size 0x908
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf0, size 0x8
        uint:7 maxplayers;
        // offset 0xf8, size 0x20
        int forwardspawnhealth;
        // offset 0x118, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x120, size 0x8
        uint:3 ballcount;
        // offset 0x128, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x138, size 0x8
        uint:3 gunselection;
        // offset 0x140, size 0x8
        uint:7 maxbots;
        // offset 0x148, size 0x8
        uint:5 prematchrequirement;
        // offset 0x150, size 0x8
        uint:3 spectatetype;
        // offset 0x158, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x160, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x168, size 0x8
        uint:5 roundwinlimit;
        // offset 0x170, size 0x10
        uint:10 antiboostdistance;
        // offset 0x180, size 0x10
        uint:15 roundscorelimit;
        // offset 0x190, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1a0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1a8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1b0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1b8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1c0, size 0x8
        uint:5 maxallocation;
        // offset 0x1c8, size 0x8
        uint:4 carryscore;
        // offset 0x1d0, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1d8, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1e0, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1e8, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1f0, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1f8, size 0x8
        uint:7 idleflagresettime;
        // offset 0x200, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x208, size 0x8
        uint:4 setbacks;
        // offset 0x210, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x230, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x240, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x250, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x260, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x270, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x280, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x290, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x298, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2a0, size 0x10
        uint:15 scorelimit;
        // offset 0x2b0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2b8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2c0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2c8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2d0, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2e0, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2e8, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2f0, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2f8, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x488, size 0x8
        uint:3 objectivepingtime;
        // offset 0x490, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x498, size 0x8
        uint:8 carrierarmor;
        // offset 0x4a0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4a8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4b0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4c0, size 0x8
        uint:5 boottime;
        // offset 0x4c8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4d0, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4d8, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4e0, size 0x8
        uint:7 teamnumlives;
        // offset 0x4e8, size 0x8
        fixed<8,2> planttime;
        // offset 0x4f0, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4f8, size 0x10
        uint:10 inactivitykick;
        // offset 0x508, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x510, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x518, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x528, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x538, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x568, size 0x10
        fixed<10,2> destroytime;
        // offset 0x578, size 0x8
        uint:7 flagrespawntime;
        // offset 0x580, size 0x8
        uint:2 shutdowndamage;
        // offset 0x588, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x590, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x598, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5a0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5b0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5b8, size 0x8
        uint:2 robotspeed;
        // offset 0x5c0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5c8, size 0x8
        uint:7 servermsec;
        // offset 0x5d0, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5d8, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5e8, size 0x10
        uint:10 leaderbonus;
        // offset 0x5f8, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x600, size 0x10
        uint:9 autodestroytime;
        // offset 0x610, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x618, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x620, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x628, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x630, size 0x8
        uint:6 prematchperiod;
        // offset 0x638, size 0x8
        uint:6 teamkillscore;
        // offset 0x640, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x648, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x650, size 0x20
        int deployablebarrierhealth;
        // offset 0x670, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x678, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x680, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x688, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x690, size 0x8
        uint:7 playernumlives;
        // offset 0x698, size 0x8
        uint:2 infectionmode;
        // offset 0x6a0, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6a8, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6b0, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6b8, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6c0, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6c8, size 0x8
        uint:6 reboottime;
        // offset 0x6d0, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6d8, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6e0, size 0x8
        uint:4 pickuptime;
        // offset 0x6e8, size 0x20
        int hash_64727525f5957d06;
        // offset 0x708, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x728, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x730, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x738, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x740, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x748, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x750, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x760, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x768, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x770, size 0x8
        uint:7 startplayers;
        // offset 0x778, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x780, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x788, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x790, size 0x8
        uint:5 totalkillsmax;
        // offset 0x798, size 0x8
        uint:4 roundswitch;
        // offset 0x7a0, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7a8, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7b0, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7b8, size 0x8
        uint:5 weaponcount;
        // offset 0x7c0, size 0x8
        uint:7 weapontimer;
        // offset 0x7c8, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7d8, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7e0, size 0x8
        uint:7 drafttime;
        // offset 0x7e8, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7f0, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7f8, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x808, size 0x8
        uint:4 throwscore;
        // offset 0x810, size 0x8
        uint:4 deposittime;
        // offset 0x818, size 0x10
        fixed<10,2> extratime;
        // offset 0x828, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x830, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x838, size 0x8
        uint:7 teamcount;
        // offset 0x840, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x860, size 0x8
        uint:4 roundlimit;
        // offset 0x868, size 0x8
        uint:2 charactercustomization;
        // offset 0x870, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x878, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x880, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x888, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x898, size 0x1
        bool delayplayer;
        // offset 0x899, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x89a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x89b, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x89c, size 0x1
        bool draftenabled;
        // offset 0x89d, size 0x1
        bool droppedtagrespawn;
        // offset 0x89e, size 0x1
        bool voipkillershearvictim;
        // offset 0x89f, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8a0, size 0x1
        bool presetclassesperteam;
        // offset 0x8a1, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8a2, size 0x1
        bool hardcoremode;
        // offset 0x8a3, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8a4, size 0x1
        bool useitemspawns;
        // offset 0x8a5, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8a6, size 0x1
        bool silentplant;
        // offset 0x8a7, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8a8, size 0x1
        bool drafteveryround;
        // offset 0x8a9, size 0x1
        bool timepauseswheninzone;
        // offset 0x8aa, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8ab, size 0x1
        bool scoreperplayer;
        // offset 0x8ac, size 0x1
        bool ekiaresetondeath;
        // offset 0x8ad, size 0x1
        bool kothmode;
        // offset 0x8ae, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8af, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8b0, size 0x1
        bool decayprogress;
        // offset 0x8b1, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8b2, size 0x1
        bool cumulativeroundscores;
        // offset 0x8b3, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8b4, size 0x1
        bool skiplaststand;
        // offset 0x8b5, size 0x1
        bool usespawngroups;
        // offset 0x8b6, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8b7, size 0x1
        bool allowbattlechatter;
        // offset 0x8b8, size 0x1
        bool fowrevealenabled;
        // offset 0x8b9, size 0x1
        bool disablecontracts;
        // offset 0x8ba, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8bb, size 0x1
        bool allowannouncer;
        // offset 0x8bc, size 0x1
        bool disallowaimslowdown;
        // offset 0x8bd, size 0x1
        bool vehiclesenabled;
        // offset 0x8be, size 0x1
        bool decaycapturedzones;
        // offset 0x8bf, size 0x1
        bool neutralzone;
        // offset 0x8c0, size 0x1
        bool boastallowcam;
        // offset 0x8c1, size 0x1
        bool onlyheadshots;
        // offset 0x8c2, size 0x1
        bool flagcapturecondition;
        // offset 0x8c3, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8c4, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8c5, size 0x1
        bool vehiclestimed;
        // offset 0x8c6, size 0x1
        bool pregamedraftenabled;
        // offset 0x8c7, size 0x1
        bool fogofwarminimap;
        // offset 0x8c8, size 0x1
        bool teamkillpointloss;
        // offset 0x8c9, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8ca, size 0x1
        bool perksenabled;
        // offset 0x8cb, size 0x1
        bool allowmapscripting;
        // offset 0x8cc, size 0x1
        bool robotshield;
        // offset 0x8cd, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8ce, size 0x1
        bool allowkillcam;
        // offset 0x8cf, size 0x1
        bool disableattachments;
        // offset 0x8d0, size 0x1
        bool disablecompass;
        // offset 0x8d1, size 0x1
        bool disableweapondrop;
        // offset 0x8d2, size 0x1
        bool escalationenabled;
        // offset 0x8d3, size 0x1
        bool disablecac;
        // offset 0x8d4, size 0x1
        bool disableclassselection;
        // offset 0x8d5, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8d6, size 0x1
        bool autoteambalance;
        // offset 0x8d7, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8d8, size 0x1
        bool allowplayofthematch;
        // offset 0x8d9, size 0x1
        bool allowprone;
        // offset 0x8da, size 0x1
        bool scoreresetondeath;
        // offset 0x8db, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8dc, size 0x1
        bool playerforcerespawn;
        // offset 0x8dd, size 0x1
        bool multibomb;
        // offset 0x8de, size 0x1
        bool deathcircle;
        // offset 0x8df, size 0x1
        bool boastenabled;
        // offset 0x8e0, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8e1, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8e2, size 0x1
        bool deathpointloss;
        // offset 0x8e3, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8e4, size 0x1
        bool rebootplayers;
        // offset 0x8e5, size 0x1
        bool oldschoolmode;
        // offset 0x8e6, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8e7, size 0x1
        bool allowfinalkillcam;
        // offset 0x8e8, size 0x1
        bool allowspectating;
        // offset 0x8e9, size 0x1
        bool usabledynents;
        // offset 0x8ea, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x8eb, size 0x1
        bool spawnselectenabled;
        // offset 0x8ec, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8ed, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8ee, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8ef, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8f0, size 0x1
        bool disallowprone;
        // offset 0x8f1, size 0x1
        bool moveplayers;
        // offset 0x8f2, size 0x1
        bool disabletacinsert;
        // offset 0x8f3, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8f4, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8f5, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8f6, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8f7, size 0x1
        bool use_doors;
        // offset 0x8f8, size 0x1
        bool pvponly;
        // offset 0x8f9, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8fa, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8fb, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8fc, size 0x1
        bool allowingameteamchange;
        // offset 0x8fd, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8fe, size 0x1
        bool deathzones;
        // offset 0x8ff, size 0x1
        bool classicmode;
        // offset 0x900, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x901, size 0x1
        bool capdecay;
        // offset 0x902, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x903, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x904, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x905, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x906, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x908
    // offset 0x0, size 0x908
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_df7fa56984e82b02"

version 33 {
    // idx 1 members 284 size 0x908
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf0, size 0x8
        uint:7 maxplayers;
        // offset 0xf8, size 0x20
        int forwardspawnhealth;
        // offset 0x118, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x120, size 0x8
        uint:3 ballcount;
        // offset 0x128, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x138, size 0x8
        uint:3 gunselection;
        // offset 0x140, size 0x8
        uint:7 maxbots;
        // offset 0x148, size 0x8
        uint:5 prematchrequirement;
        // offset 0x150, size 0x8
        uint:3 spectatetype;
        // offset 0x158, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x160, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x168, size 0x8
        uint:5 roundwinlimit;
        // offset 0x170, size 0x10
        uint:10 antiboostdistance;
        // offset 0x180, size 0x10
        uint:15 roundscorelimit;
        // offset 0x190, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x1a0, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1a8, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1b0, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1b8, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1c0, size 0x8
        uint:5 maxallocation;
        // offset 0x1c8, size 0x8
        uint:4 carryscore;
        // offset 0x1d0, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1d8, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1e0, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1e8, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1f0, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1f8, size 0x8
        uint:7 idleflagresettime;
        // offset 0x200, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x208, size 0x8
        uint:4 setbacks;
        // offset 0x210, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x230, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x240, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x250, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x260, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x270, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x280, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x290, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x298, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x2a0, size 0x10
        uint:15 scorelimit;
        // offset 0x2b0, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2b8, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2c0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2c8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2d0, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2e0, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2e8, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2f0, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2f8, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x488, size 0x8
        uint:3 objectivepingtime;
        // offset 0x490, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x498, size 0x8
        uint:8 carrierarmor;
        // offset 0x4a0, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4a8, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4b0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4c0, size 0x8
        uint:5 boottime;
        // offset 0x4c8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4d0, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4d8, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4e0, size 0x8
        uint:7 teamnumlives;
        // offset 0x4e8, size 0x8
        fixed<8,2> planttime;
        // offset 0x4f0, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4f8, size 0x10
        uint:10 inactivitykick;
        // offset 0x508, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x510, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x518, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x528, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x538, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x548, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x558, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x568, size 0x10
        fixed<10,2> destroytime;
        // offset 0x578, size 0x8
        uint:7 flagrespawntime;
        // offset 0x580, size 0x8
        uint:2 shutdowndamage;
        // offset 0x588, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x590, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x598, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x5a0, size 0x10
        uint:11 objectivehealth;
        // offset 0x5b0, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5b8, size 0x8
        uint:2 robotspeed;
        // offset 0x5c0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5c8, size 0x8
        uint:7 servermsec;
        // offset 0x5d0, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5d8, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5e8, size 0x10
        uint:10 leaderbonus;
        // offset 0x5f8, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x600, size 0x10
        uint:9 autodestroytime;
        // offset 0x610, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x618, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x620, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x628, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x630, size 0x8
        uint:6 prematchperiod;
        // offset 0x638, size 0x8
        uint:6 teamkillscore;
        // offset 0x640, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x648, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x650, size 0x20
        int deployablebarrierhealth;
        // offset 0x670, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x678, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x680, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x688, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x690, size 0x8
        uint:7 playernumlives;
        // offset 0x698, size 0x8
        uint:2 infectionmode;
        // offset 0x6a0, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6a8, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6b0, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6b8, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6c0, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6c8, size 0x8
        uint:6 reboottime;
        // offset 0x6d0, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6d8, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6e0, size 0x8
        uint:4 pickuptime;
        // offset 0x6e8, size 0x20
        int hash_64727525f5957d06;
        // offset 0x708, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x728, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x730, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x738, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x740, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x748, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x750, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x760, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x768, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x770, size 0x8
        uint:7 startplayers;
        // offset 0x778, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x780, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x788, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x790, size 0x8
        uint:5 totalkillsmax;
        // offset 0x798, size 0x8
        uint:4 roundswitch;
        // offset 0x7a0, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7a8, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7b0, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7b8, size 0x8
        uint:5 weaponcount;
        // offset 0x7c0, size 0x8
        uint:7 weapontimer;
        // offset 0x7c8, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7d8, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7e0, size 0x8
        uint:7 drafttime;
        // offset 0x7e8, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7f0, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7f8, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x808, size 0x8
        uint:4 throwscore;
        // offset 0x810, size 0x8
        uint:4 deposittime;
        // offset 0x818, size 0x10
        fixed<10,2> extratime;
        // offset 0x828, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x830, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x838, size 0x8
        uint:7 teamcount;
        // offset 0x840, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x860, size 0x8
        uint:4 roundlimit;
        // offset 0x868, size 0x8
        uint:2 charactercustomization;
        // offset 0x870, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x878, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x880, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x888, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x898, size 0x1
        bool delayplayer;
        // offset 0x899, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x89a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x89b, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x89c, size 0x1
        bool draftenabled;
        // offset 0x89d, size 0x1
        bool droppedtagrespawn;
        // offset 0x89e, size 0x1
        bool voipkillershearvictim;
        // offset 0x89f, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x8a0, size 0x1
        bool presetclassesperteam;
        // offset 0x8a1, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x8a2, size 0x1
        bool hardcoremode;
        // offset 0x8a3, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x8a4, size 0x1
        bool useitemspawns;
        // offset 0x8a5, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x8a6, size 0x1
        bool silentplant;
        // offset 0x8a7, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8a8, size 0x1
        bool drafteveryround;
        // offset 0x8a9, size 0x1
        bool timepauseswheninzone;
        // offset 0x8aa, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8ab, size 0x1
        bool scoreperplayer;
        // offset 0x8ac, size 0x1
        bool ekiaresetondeath;
        // offset 0x8ad, size 0x1
        bool kothmode;
        // offset 0x8ae, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8af, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8b0, size 0x1
        bool decayprogress;
        // offset 0x8b1, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8b2, size 0x1
        bool cumulativeroundscores;
        // offset 0x8b3, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8b4, size 0x1
        bool skiplaststand;
        // offset 0x8b5, size 0x1
        bool usespawngroups;
        // offset 0x8b6, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8b7, size 0x1
        bool allowbattlechatter;
        // offset 0x8b8, size 0x1
        bool fowrevealenabled;
        // offset 0x8b9, size 0x1
        bool disablecontracts;
        // offset 0x8ba, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8bb, size 0x1
        bool allowannouncer;
        // offset 0x8bc, size 0x1
        bool disallowaimslowdown;
        // offset 0x8bd, size 0x1
        bool vehiclesenabled;
        // offset 0x8be, size 0x1
        bool decaycapturedzones;
        // offset 0x8bf, size 0x1
        bool neutralzone;
        // offset 0x8c0, size 0x1
        bool boastallowcam;
        // offset 0x8c1, size 0x1
        bool onlyheadshots;
        // offset 0x8c2, size 0x1
        bool flagcapturecondition;
        // offset 0x8c3, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8c4, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8c5, size 0x1
        bool vehiclestimed;
        // offset 0x8c6, size 0x1
        bool pregamedraftenabled;
        // offset 0x8c7, size 0x1
        bool fogofwarminimap;
        // offset 0x8c8, size 0x1
        bool teamkillpointloss;
        // offset 0x8c9, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8ca, size 0x1
        bool perksenabled;
        // offset 0x8cb, size 0x1
        bool allowmapscripting;
        // offset 0x8cc, size 0x1
        bool robotshield;
        // offset 0x8cd, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8ce, size 0x1
        bool allowkillcam;
        // offset 0x8cf, size 0x1
        bool disableattachments;
        // offset 0x8d0, size 0x1
        bool disablecompass;
        // offset 0x8d1, size 0x1
        bool disableweapondrop;
        // offset 0x8d2, size 0x1
        bool escalationenabled;
        // offset 0x8d3, size 0x1
        bool disablecac;
        // offset 0x8d4, size 0x1
        bool disableclassselection;
        // offset 0x8d5, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8d6, size 0x1
        bool autoteambalance;
        // offset 0x8d7, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8d8, size 0x1
        bool allowplayofthematch;
        // offset 0x8d9, size 0x1
        bool allowprone;
        // offset 0x8da, size 0x1
        bool scoreresetondeath;
        // offset 0x8db, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8dc, size 0x1
        bool playerforcerespawn;
        // offset 0x8dd, size 0x1
        bool multibomb;
        // offset 0x8de, size 0x1
        bool deathcircle;
        // offset 0x8df, size 0x1
        bool boastenabled;
        // offset 0x8e0, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8e1, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8e2, size 0x1
        bool deathpointloss;
        // offset 0x8e3, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8e4, size 0x1
        bool rebootplayers;
        // offset 0x8e5, size 0x1
        bool oldschoolmode;
        // offset 0x8e6, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8e7, size 0x1
        bool allowfinalkillcam;
        // offset 0x8e8, size 0x1
        bool allowspectating;
        // offset 0x8e9, size 0x1
        bool usabledynents;
        // offset 0x8ea, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x8eb, size 0x1
        bool spawnselectenabled;
        // offset 0x8ec, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8ed, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8ee, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8ef, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8f0, size 0x1
        bool disallowprone;
        // offset 0x8f1, size 0x1
        bool moveplayers;
        // offset 0x8f2, size 0x1
        bool disabletacinsert;
        // offset 0x8f3, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8f4, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8f5, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8f6, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8f7, size 0x1
        bool use_doors;
        // offset 0x8f8, size 0x1
        bool pvponly;
        // offset 0x8f9, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8fa, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8fb, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8fc, size 0x1
        bool allowingameteamchange;
        // offset 0x8fd, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8fe, size 0x1
        bool deathzones;
        // offset 0x8ff, size 0x1
        bool classicmode;
        // offset 0x900, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x901, size 0x1
        bool capdecay;
        // offset 0x902, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x903, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x904, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x905, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x906, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x908
    // offset 0x0, size 0x908
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_e4de75c4f1b28ed3"

version 32 {
    // idx 1 members 283 size 0x900
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf0, size 0x8
        uint:7 maxplayers;
        // offset 0xf8, size 0x20
        int forwardspawnhealth;
        // offset 0x118, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x120, size 0x8
        uint:3 ballcount;
        // offset 0x128, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x138, size 0x8
        uint:3 gunselection;
        // offset 0x140, size 0x8
        uint:5 prematchrequirement;
        // offset 0x148, size 0x8
        uint:3 spectatetype;
        // offset 0x150, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x158, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x160, size 0x8
        uint:5 roundwinlimit;
        // offset 0x168, size 0x10
        uint:10 antiboostdistance;
        // offset 0x178, size 0x10
        uint:15 roundscorelimit;
        // offset 0x188, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x198, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1a0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1a8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1b0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1b8, size 0x8
        uint:5 maxallocation;
        // offset 0x1c0, size 0x8
        uint:4 carryscore;
        // offset 0x1c8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1d0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1d8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1e0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1e8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1f0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1f8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x200, size 0x8
        uint:4 setbacks;
        // offset 0x208, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x228, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x238, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x248, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x258, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x268, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x278, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x288, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x290, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x298, size 0x10
        uint:15 scorelimit;
        // offset 0x2a8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2b0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2b8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2c0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2c8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2d8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2e0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2e8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2f0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x480, size 0x8
        uint:3 objectivepingtime;
        // offset 0x488, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x490, size 0x8
        uint:8 carrierarmor;
        // offset 0x498, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4a0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4a8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4b8, size 0x8
        uint:5 boottime;
        // offset 0x4c0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4c8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4d0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4d8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4e0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4e8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4f0, size 0x10
        uint:10 inactivitykick;
        // offset 0x500, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x508, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x540, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x550, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x560, size 0x10
        fixed<10,2> destroytime;
        // offset 0x570, size 0x8
        uint:7 flagrespawntime;
        // offset 0x578, size 0x8
        uint:2 shutdowndamage;
        // offset 0x580, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x588, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x590, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x598, size 0x10
        uint:11 objectivehealth;
        // offset 0x5a8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5b0, size 0x8
        uint:2 robotspeed;
        // offset 0x5b8, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5c0, size 0x8
        uint:7 servermsec;
        // offset 0x5c8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5d0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5e0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5f0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5f8, size 0x10
        uint:9 autodestroytime;
        // offset 0x608, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x610, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x618, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x620, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x628, size 0x8
        uint:6 prematchperiod;
        // offset 0x630, size 0x8
        uint:6 teamkillscore;
        // offset 0x638, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x640, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x648, size 0x20
        int deployablebarrierhealth;
        // offset 0x668, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x670, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x678, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x680, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x688, size 0x8
        uint:7 playernumlives;
        // offset 0x690, size 0x8
        uint:2 infectionmode;
        // offset 0x698, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6a0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6a8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6b0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6b8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6c0, size 0x8
        uint:6 reboottime;
        // offset 0x6c8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6d0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6d8, size 0x8
        uint:4 pickuptime;
        // offset 0x6e0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x700, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x720, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x728, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x730, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x738, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x740, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x748, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x758, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x760, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x768, size 0x8
        uint:7 startplayers;
        // offset 0x770, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x778, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x780, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x788, size 0x8
        uint:5 totalkillsmax;
        // offset 0x790, size 0x8
        uint:4 roundswitch;
        // offset 0x798, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7a0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7a8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7b0, size 0x8
        uint:5 weaponcount;
        // offset 0x7b8, size 0x8
        uint:7 weapontimer;
        // offset 0x7c0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7d0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7d8, size 0x8
        uint:7 drafttime;
        // offset 0x7e0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7e8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7f0, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x800, size 0x8
        uint:4 throwscore;
        // offset 0x808, size 0x8
        uint:4 deposittime;
        // offset 0x810, size 0x10
        fixed<10,2> extratime;
        // offset 0x820, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x828, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x830, size 0x8
        uint:7 teamcount;
        // offset 0x838, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x858, size 0x8
        uint:4 roundlimit;
        // offset 0x860, size 0x8
        uint:2 charactercustomization;
        // offset 0x868, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x870, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x878, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x880, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x890, size 0x1
        bool delayplayer;
        // offset 0x891, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x892, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x893, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x894, size 0x1
        bool draftenabled;
        // offset 0x895, size 0x1
        bool droppedtagrespawn;
        // offset 0x896, size 0x1
        bool voipkillershearvictim;
        // offset 0x897, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x898, size 0x1
        bool presetclassesperteam;
        // offset 0x899, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x89a, size 0x1
        bool hardcoremode;
        // offset 0x89b, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x89c, size 0x1
        bool useitemspawns;
        // offset 0x89d, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x89e, size 0x1
        bool silentplant;
        // offset 0x89f, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8a0, size 0x1
        bool drafteveryround;
        // offset 0x8a1, size 0x1
        bool timepauseswheninzone;
        // offset 0x8a2, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8a3, size 0x1
        bool scoreperplayer;
        // offset 0x8a4, size 0x1
        bool ekiaresetondeath;
        // offset 0x8a5, size 0x1
        bool kothmode;
        // offset 0x8a6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8a7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8a8, size 0x1
        bool decayprogress;
        // offset 0x8a9, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8aa, size 0x1
        bool cumulativeroundscores;
        // offset 0x8ab, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8ac, size 0x1
        bool skiplaststand;
        // offset 0x8ad, size 0x1
        bool usespawngroups;
        // offset 0x8ae, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8af, size 0x1
        bool allowbattlechatter;
        // offset 0x8b0, size 0x1
        bool fowrevealenabled;
        // offset 0x8b1, size 0x1
        bool disablecontracts;
        // offset 0x8b2, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8b3, size 0x1
        bool allowannouncer;
        // offset 0x8b4, size 0x1
        bool disallowaimslowdown;
        // offset 0x8b5, size 0x1
        bool vehiclesenabled;
        // offset 0x8b6, size 0x1
        bool decaycapturedzones;
        // offset 0x8b7, size 0x1
        bool neutralzone;
        // offset 0x8b8, size 0x1
        bool boastallowcam;
        // offset 0x8b9, size 0x1
        bool onlyheadshots;
        // offset 0x8ba, size 0x1
        bool flagcapturecondition;
        // offset 0x8bb, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8bc, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8bd, size 0x1
        bool vehiclestimed;
        // offset 0x8be, size 0x1
        bool pregamedraftenabled;
        // offset 0x8bf, size 0x1
        bool fogofwarminimap;
        // offset 0x8c0, size 0x1
        bool teamkillpointloss;
        // offset 0x8c1, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8c2, size 0x1
        bool perksenabled;
        // offset 0x8c3, size 0x1
        bool allowmapscripting;
        // offset 0x8c4, size 0x1
        bool robotshield;
        // offset 0x8c5, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8c6, size 0x1
        bool allowkillcam;
        // offset 0x8c7, size 0x1
        bool disableattachments;
        // offset 0x8c8, size 0x1
        bool disablecompass;
        // offset 0x8c9, size 0x1
        bool disableweapondrop;
        // offset 0x8ca, size 0x1
        bool escalationenabled;
        // offset 0x8cb, size 0x1
        bool disablecac;
        // offset 0x8cc, size 0x1
        bool disableclassselection;
        // offset 0x8cd, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8ce, size 0x1
        bool autoteambalance;
        // offset 0x8cf, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8d0, size 0x1
        bool allowplayofthematch;
        // offset 0x8d1, size 0x1
        bool allowprone;
        // offset 0x8d2, size 0x1
        bool scoreresetondeath;
        // offset 0x8d3, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8d4, size 0x1
        bool playerforcerespawn;
        // offset 0x8d5, size 0x1
        bool multibomb;
        // offset 0x8d6, size 0x1
        bool deathcircle;
        // offset 0x8d7, size 0x1
        bool boastenabled;
        // offset 0x8d8, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8d9, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8da, size 0x1
        bool deathpointloss;
        // offset 0x8db, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8dc, size 0x1
        bool rebootplayers;
        // offset 0x8dd, size 0x1
        bool oldschoolmode;
        // offset 0x8de, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8df, size 0x1
        bool allowfinalkillcam;
        // offset 0x8e0, size 0x1
        bool allowspectating;
        // offset 0x8e1, size 0x1
        bool usabledynents;
        // offset 0x8e2, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x8e3, size 0x1
        bool spawnselectenabled;
        // offset 0x8e4, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8e5, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8e6, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8e7, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8e8, size 0x1
        bool disallowprone;
        // offset 0x8e9, size 0x1
        bool moveplayers;
        // offset 0x8ea, size 0x1
        bool disabletacinsert;
        // offset 0x8eb, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8ec, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8ed, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8ee, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8ef, size 0x1
        bool use_doors;
        // offset 0x8f0, size 0x1
        bool pvponly;
        // offset 0x8f1, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8f2, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8f3, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8f4, size 0x1
        bool allowingameteamchange;
        // offset 0x8f5, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8f6, size 0x1
        bool deathzones;
        // offset 0x8f7, size 0x1
        bool classicmode;
        // offset 0x8f8, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8f9, size 0x1
        bool capdecay;
        // offset 0x8fa, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8fb, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8fc, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8fd, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x8fe, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x900
    // offset 0x0, size 0x900
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_d16ab25ea8f9dd5f"

version 31 {
    // idx 1 members 282 size 0x900
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf0, size 0x8
        uint:7 maxplayers;
        // offset 0xf8, size 0x20
        int forwardspawnhealth;
        // offset 0x118, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x120, size 0x8
        uint:3 ballcount;
        // offset 0x128, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x138, size 0x8
        uint:3 gunselection;
        // offset 0x140, size 0x8
        uint:5 prematchrequirement;
        // offset 0x148, size 0x8
        uint:3 spectatetype;
        // offset 0x150, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x158, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x160, size 0x8
        uint:5 roundwinlimit;
        // offset 0x168, size 0x10
        uint:10 antiboostdistance;
        // offset 0x178, size 0x10
        uint:15 roundscorelimit;
        // offset 0x188, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x198, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1a0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1a8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1b0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1b8, size 0x8
        uint:5 maxallocation;
        // offset 0x1c0, size 0x8
        uint:4 carryscore;
        // offset 0x1c8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1d0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1d8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1e0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1e8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1f0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1f8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x200, size 0x8
        uint:4 setbacks;
        // offset 0x208, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x228, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x238, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x248, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x258, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x268, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x278, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x288, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x290, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x298, size 0x10
        uint:15 scorelimit;
        // offset 0x2a8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2b0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2b8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2c0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2c8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2d8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2e0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2e8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2f0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x480, size 0x8
        uint:3 objectivepingtime;
        // offset 0x488, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x490, size 0x8
        uint:8 carrierarmor;
        // offset 0x498, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4a0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4a8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4b8, size 0x8
        uint:5 boottime;
        // offset 0x4c0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4c8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4d0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4d8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4e0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4e8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4f0, size 0x10
        uint:10 inactivitykick;
        // offset 0x500, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x508, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x540, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x550, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x560, size 0x10
        fixed<10,2> destroytime;
        // offset 0x570, size 0x8
        uint:7 flagrespawntime;
        // offset 0x578, size 0x8
        uint:2 shutdowndamage;
        // offset 0x580, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x588, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x590, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x598, size 0x10
        uint:11 objectivehealth;
        // offset 0x5a8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5b0, size 0x8
        uint:2 robotspeed;
        // offset 0x5b8, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5c0, size 0x8
        uint:7 servermsec;
        // offset 0x5c8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5d0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5e0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5f0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5f8, size 0x10
        uint:9 autodestroytime;
        // offset 0x608, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x610, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x618, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x620, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x628, size 0x8
        uint:6 prematchperiod;
        // offset 0x630, size 0x8
        uint:6 teamkillscore;
        // offset 0x638, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x640, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x648, size 0x20
        int deployablebarrierhealth;
        // offset 0x668, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x670, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x678, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x680, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x688, size 0x8
        uint:7 playernumlives;
        // offset 0x690, size 0x8
        uint:2 infectionmode;
        // offset 0x698, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6a0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6a8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6b0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6b8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6c0, size 0x8
        uint:6 reboottime;
        // offset 0x6c8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6d0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6d8, size 0x8
        uint:4 pickuptime;
        // offset 0x6e0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x700, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x720, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x728, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x730, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x738, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x740, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x748, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x758, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x760, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x768, size 0x8
        uint:7 startplayers;
        // offset 0x770, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x778, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x780, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x788, size 0x8
        uint:5 totalkillsmax;
        // offset 0x790, size 0x8
        uint:4 roundswitch;
        // offset 0x798, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7a0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7a8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7b0, size 0x8
        uint:5 weaponcount;
        // offset 0x7b8, size 0x8
        uint:7 weapontimer;
        // offset 0x7c0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7d0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7d8, size 0x8
        uint:7 drafttime;
        // offset 0x7e0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7e8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7f0, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x800, size 0x8
        uint:4 throwscore;
        // offset 0x808, size 0x8
        uint:4 deposittime;
        // offset 0x810, size 0x10
        fixed<10,2> extratime;
        // offset 0x820, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x828, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x830, size 0x8
        uint:7 teamcount;
        // offset 0x838, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x858, size 0x8
        uint:4 roundlimit;
        // offset 0x860, size 0x8
        uint:2 charactercustomization;
        // offset 0x868, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x870, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x878, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x880, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x890, size 0x1
        bool delayplayer;
        // offset 0x891, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x892, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x893, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x894, size 0x1
        bool draftenabled;
        // offset 0x895, size 0x1
        bool droppedtagrespawn;
        // offset 0x896, size 0x1
        bool voipkillershearvictim;
        // offset 0x897, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x898, size 0x1
        bool presetclassesperteam;
        // offset 0x899, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x89a, size 0x1
        bool hardcoremode;
        // offset 0x89b, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x89c, size 0x1
        bool useitemspawns;
        // offset 0x89d, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x89e, size 0x1
        bool silentplant;
        // offset 0x89f, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8a0, size 0x1
        bool drafteveryround;
        // offset 0x8a1, size 0x1
        bool timepauseswheninzone;
        // offset 0x8a2, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8a3, size 0x1
        bool scoreperplayer;
        // offset 0x8a4, size 0x1
        bool ekiaresetondeath;
        // offset 0x8a5, size 0x1
        bool kothmode;
        // offset 0x8a6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8a7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8a8, size 0x1
        bool decayprogress;
        // offset 0x8a9, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8aa, size 0x1
        bool cumulativeroundscores;
        // offset 0x8ab, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8ac, size 0x1
        bool usespawngroups;
        // offset 0x8ad, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8ae, size 0x1
        bool allowbattlechatter;
        // offset 0x8af, size 0x1
        bool fowrevealenabled;
        // offset 0x8b0, size 0x1
        bool disablecontracts;
        // offset 0x8b1, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8b2, size 0x1
        bool allowannouncer;
        // offset 0x8b3, size 0x1
        bool disallowaimslowdown;
        // offset 0x8b4, size 0x1
        bool vehiclesenabled;
        // offset 0x8b5, size 0x1
        bool decaycapturedzones;
        // offset 0x8b6, size 0x1
        bool neutralzone;
        // offset 0x8b7, size 0x1
        bool boastallowcam;
        // offset 0x8b8, size 0x1
        bool onlyheadshots;
        // offset 0x8b9, size 0x1
        bool flagcapturecondition;
        // offset 0x8ba, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8bb, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8bc, size 0x1
        bool vehiclestimed;
        // offset 0x8bd, size 0x1
        bool pregamedraftenabled;
        // offset 0x8be, size 0x1
        bool fogofwarminimap;
        // offset 0x8bf, size 0x1
        bool teamkillpointloss;
        // offset 0x8c0, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8c1, size 0x1
        bool perksenabled;
        // offset 0x8c2, size 0x1
        bool allowmapscripting;
        // offset 0x8c3, size 0x1
        bool robotshield;
        // offset 0x8c4, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8c5, size 0x1
        bool allowkillcam;
        // offset 0x8c6, size 0x1
        bool disableattachments;
        // offset 0x8c7, size 0x1
        bool disablecompass;
        // offset 0x8c8, size 0x1
        bool disableweapondrop;
        // offset 0x8c9, size 0x1
        bool escalationenabled;
        // offset 0x8ca, size 0x1
        bool disablecac;
        // offset 0x8cb, size 0x1
        bool disableclassselection;
        // offset 0x8cc, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8cd, size 0x1
        bool autoteambalance;
        // offset 0x8ce, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8cf, size 0x1
        bool allowplayofthematch;
        // offset 0x8d0, size 0x1
        bool allowprone;
        // offset 0x8d1, size 0x1
        bool scoreresetondeath;
        // offset 0x8d2, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8d3, size 0x1
        bool playerforcerespawn;
        // offset 0x8d4, size 0x1
        bool multibomb;
        // offset 0x8d5, size 0x1
        bool deathcircle;
        // offset 0x8d6, size 0x1
        bool boastenabled;
        // offset 0x8d7, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8d8, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8d9, size 0x1
        bool deathpointloss;
        // offset 0x8da, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8db, size 0x1
        bool rebootplayers;
        // offset 0x8dc, size 0x1
        bool oldschoolmode;
        // offset 0x8dd, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8de, size 0x1
        bool allowfinalkillcam;
        // offset 0x8df, size 0x1
        bool allowspectating;
        // offset 0x8e0, size 0x1
        bool usabledynents;
        // offset 0x8e1, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x8e2, size 0x1
        bool spawnselectenabled;
        // offset 0x8e3, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8e4, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8e5, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8e6, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8e7, size 0x1
        bool disallowprone;
        // offset 0x8e8, size 0x1
        bool moveplayers;
        // offset 0x8e9, size 0x1
        bool disabletacinsert;
        // offset 0x8ea, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8eb, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8ec, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8ed, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8ee, size 0x1
        bool use_doors;
        // offset 0x8ef, size 0x1
        bool pvponly;
        // offset 0x8f0, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8f1, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8f2, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8f3, size 0x1
        bool allowingameteamchange;
        // offset 0x8f4, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8f5, size 0x1
        bool deathzones;
        // offset 0x8f6, size 0x1
        bool classicmode;
        // offset 0x8f7, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8f8, size 0x1
        bool capdecay;
        // offset 0x8f9, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8fa, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8fb, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8fc, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x8fd, size 0x3
        uint:1 __pad[3];
    };

    // idx 0 members 1 size 0x900
    // offset 0x0, size 0x900
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_252e218fd9d0b6c3"

version 30 {
    // idx 1 members 280 size 0x900
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf0, size 0x8
        uint:7 maxplayers;
        // offset 0xf8, size 0x20
        int forwardspawnhealth;
        // offset 0x118, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x120, size 0x8
        uint:3 ballcount;
        // offset 0x128, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x138, size 0x8
        uint:3 gunselection;
        // offset 0x140, size 0x8
        uint:5 prematchrequirement;
        // offset 0x148, size 0x8
        uint:3 spectatetype;
        // offset 0x150, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x158, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x160, size 0x8
        uint:5 roundwinlimit;
        // offset 0x168, size 0x10
        uint:10 antiboostdistance;
        // offset 0x178, size 0x10
        uint:15 roundscorelimit;
        // offset 0x188, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x198, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1a0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1a8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1b0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1b8, size 0x8
        uint:5 maxallocation;
        // offset 0x1c0, size 0x8
        uint:4 carryscore;
        // offset 0x1c8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1d0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1d8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1e0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1e8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1f0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1f8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x200, size 0x8
        uint:4 setbacks;
        // offset 0x208, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x228, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x238, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x248, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x258, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x268, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x278, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x288, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x290, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x298, size 0x10
        uint:15 scorelimit;
        // offset 0x2a8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2b0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2b8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2c0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2c8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2d8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2e0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2e8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2f0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x480, size 0x8
        uint:3 objectivepingtime;
        // offset 0x488, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x490, size 0x8
        uint:8 carrierarmor;
        // offset 0x498, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4a0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4a8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4b8, size 0x8
        uint:5 boottime;
        // offset 0x4c0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4c8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4d0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4d8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4e0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4e8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4f0, size 0x10
        uint:10 inactivitykick;
        // offset 0x500, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x508, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x540, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x550, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x560, size 0x10
        fixed<10,2> destroytime;
        // offset 0x570, size 0x8
        uint:7 flagrespawntime;
        // offset 0x578, size 0x8
        uint:2 shutdowndamage;
        // offset 0x580, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x588, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x590, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x598, size 0x10
        uint:11 objectivehealth;
        // offset 0x5a8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5b0, size 0x8
        uint:2 robotspeed;
        // offset 0x5b8, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5c0, size 0x8
        uint:7 servermsec;
        // offset 0x5c8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5d0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5e0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5f0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5f8, size 0x10
        uint:9 autodestroytime;
        // offset 0x608, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x610, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x618, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x620, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x628, size 0x8
        uint:6 prematchperiod;
        // offset 0x630, size 0x8
        uint:6 teamkillscore;
        // offset 0x638, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x640, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x648, size 0x20
        int deployablebarrierhealth;
        // offset 0x668, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x670, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x678, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x680, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x688, size 0x8
        uint:7 playernumlives;
        // offset 0x690, size 0x8
        uint:2 infectionmode;
        // offset 0x698, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6a0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6a8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6b0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6b8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6c0, size 0x8
        uint:6 reboottime;
        // offset 0x6c8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6d0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6d8, size 0x8
        uint:4 pickuptime;
        // offset 0x6e0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x700, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x720, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x728, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x730, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x738, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x740, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x748, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x758, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x760, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x768, size 0x8
        uint:7 startplayers;
        // offset 0x770, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x778, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x780, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x788, size 0x8
        uint:5 totalkillsmax;
        // offset 0x790, size 0x8
        uint:4 roundswitch;
        // offset 0x798, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7a0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7a8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7b0, size 0x8
        uint:5 weaponcount;
        // offset 0x7b8, size 0x8
        uint:7 weapontimer;
        // offset 0x7c0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7d0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7d8, size 0x8
        uint:7 drafttime;
        // offset 0x7e0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7e8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7f0, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x800, size 0x8
        uint:4 throwscore;
        // offset 0x808, size 0x8
        uint:4 deposittime;
        // offset 0x810, size 0x10
        fixed<10,2> extratime;
        // offset 0x820, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x828, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x830, size 0x8
        uint:7 teamcount;
        // offset 0x838, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x858, size 0x8
        uint:4 roundlimit;
        // offset 0x860, size 0x8
        uint:2 charactercustomization;
        // offset 0x868, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x870, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x878, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x880, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x890, size 0x1
        bool delayplayer;
        // offset 0x891, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x892, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x893, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x894, size 0x1
        bool draftenabled;
        // offset 0x895, size 0x1
        bool droppedtagrespawn;
        // offset 0x896, size 0x1
        bool voipkillershearvictim;
        // offset 0x897, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x898, size 0x1
        bool presetclassesperteam;
        // offset 0x899, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x89a, size 0x1
        bool hardcoremode;
        // offset 0x89b, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x89c, size 0x1
        bool useitemspawns;
        // offset 0x89d, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x89e, size 0x1
        bool silentplant;
        // offset 0x89f, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8a0, size 0x1
        bool drafteveryround;
        // offset 0x8a1, size 0x1
        bool timepauseswheninzone;
        // offset 0x8a2, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8a3, size 0x1
        bool scoreperplayer;
        // offset 0x8a4, size 0x1
        bool ekiaresetondeath;
        // offset 0x8a5, size 0x1
        bool kothmode;
        // offset 0x8a6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8a7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8a8, size 0x1
        bool decayprogress;
        // offset 0x8a9, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8aa, size 0x1
        bool cumulativeroundscores;
        // offset 0x8ab, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8ac, size 0x1
        bool usespawngroups;
        // offset 0x8ad, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8ae, size 0x1
        bool allowbattlechatter;
        // offset 0x8af, size 0x1
        bool fowrevealenabled;
        // offset 0x8b0, size 0x1
        bool disablecontracts;
        // offset 0x8b1, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8b2, size 0x1
        bool allowannouncer;
        // offset 0x8b3, size 0x1
        bool disallowaimslowdown;
        // offset 0x8b4, size 0x1
        bool vehiclesenabled;
        // offset 0x8b5, size 0x1
        bool decaycapturedzones;
        // offset 0x8b6, size 0x1
        bool neutralzone;
        // offset 0x8b7, size 0x1
        bool onlyheadshots;
        // offset 0x8b8, size 0x1
        bool flagcapturecondition;
        // offset 0x8b9, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8ba, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8bb, size 0x1
        bool vehiclestimed;
        // offset 0x8bc, size 0x1
        bool pregamedraftenabled;
        // offset 0x8bd, size 0x1
        bool fogofwarminimap;
        // offset 0x8be, size 0x1
        bool teamkillpointloss;
        // offset 0x8bf, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8c0, size 0x1
        bool perksenabled;
        // offset 0x8c1, size 0x1
        bool allowmapscripting;
        // offset 0x8c2, size 0x1
        bool robotshield;
        // offset 0x8c3, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8c4, size 0x1
        bool allowkillcam;
        // offset 0x8c5, size 0x1
        bool disableattachments;
        // offset 0x8c6, size 0x1
        bool disablecompass;
        // offset 0x8c7, size 0x1
        bool disableweapondrop;
        // offset 0x8c8, size 0x1
        bool escalationenabled;
        // offset 0x8c9, size 0x1
        bool disablecac;
        // offset 0x8ca, size 0x1
        bool disableclassselection;
        // offset 0x8cb, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8cc, size 0x1
        bool autoteambalance;
        // offset 0x8cd, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8ce, size 0x1
        bool allowplayofthematch;
        // offset 0x8cf, size 0x1
        bool allowprone;
        // offset 0x8d0, size 0x1
        bool scoreresetondeath;
        // offset 0x8d1, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8d2, size 0x1
        bool playerforcerespawn;
        // offset 0x8d3, size 0x1
        bool multibomb;
        // offset 0x8d4, size 0x1
        bool deathcircle;
        // offset 0x8d5, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8d6, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8d7, size 0x1
        bool deathpointloss;
        // offset 0x8d8, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8d9, size 0x1
        bool rebootplayers;
        // offset 0x8da, size 0x1
        bool oldschoolmode;
        // offset 0x8db, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8dc, size 0x1
        bool allowfinalkillcam;
        // offset 0x8dd, size 0x1
        bool allowspectating;
        // offset 0x8de, size 0x1
        bool usabledynents;
        // offset 0x8df, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0x8e0, size 0x1
        bool spawnselectenabled;
        // offset 0x8e1, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8e2, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8e3, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8e4, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8e5, size 0x1
        bool disallowprone;
        // offset 0x8e6, size 0x1
        bool moveplayers;
        // offset 0x8e7, size 0x1
        bool disabletacinsert;
        // offset 0x8e8, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8e9, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8ea, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8eb, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8ec, size 0x1
        bool use_doors;
        // offset 0x8ed, size 0x1
        bool pvponly;
        // offset 0x8ee, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8ef, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8f0, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8f1, size 0x1
        bool allowingameteamchange;
        // offset 0x8f2, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8f3, size 0x1
        bool deathzones;
        // offset 0x8f4, size 0x1
        bool classicmode;
        // offset 0x8f5, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8f6, size 0x1
        bool capdecay;
        // offset 0x8f7, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8f8, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8f9, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8fa, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x8fb, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 1 size 0x900
    // offset 0x0, size 0x900
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_c7b7bfd4c83ff904"

version 29 {
    // idx 1 members 279 size 0x900
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x58, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x78, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x88, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x90, size 0x8
        uint:6 maxteamplayers;
        // offset 0x98, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xb0, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb8, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xc0, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc8, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xd0, size 0x8
        uint:6 preroundperiod;
        // offset 0xd8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xe0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xf0, size 0x8
        uint:7 maxplayers;
        // offset 0xf8, size 0x20
        int forwardspawnhealth;
        // offset 0x118, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x120, size 0x8
        uint:3 ballcount;
        // offset 0x128, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x138, size 0x8
        uint:3 gunselection;
        // offset 0x140, size 0x8
        uint:5 prematchrequirement;
        // offset 0x148, size 0x8
        uint:3 spectatetype;
        // offset 0x150, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x158, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x160, size 0x8
        uint:5 roundwinlimit;
        // offset 0x168, size 0x10
        uint:10 antiboostdistance;
        // offset 0x178, size 0x10
        uint:15 roundscorelimit;
        // offset 0x188, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x198, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x1a0, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x1a8, size 0x8
        fixed<8,2> defusetime;
        // offset 0x1b0, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1b8, size 0x8
        uint:5 maxallocation;
        // offset 0x1c0, size 0x8
        uint:4 carryscore;
        // offset 0x1c8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1d0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1d8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1e0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1e8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1f0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1f8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x200, size 0x8
        uint:4 setbacks;
        // offset 0x208, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x228, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x238, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x248, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x258, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x268, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x278, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x288, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x290, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x298, size 0x10
        uint:15 scorelimit;
        // offset 0x2a8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x2b0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2b8, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2c0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2c8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2d8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2e0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2e8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2f0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x480, size 0x8
        uint:3 objectivepingtime;
        // offset 0x488, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x490, size 0x8
        uint:8 carrierarmor;
        // offset 0x498, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x4a0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x4a8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4b8, size 0x8
        uint:5 boottime;
        // offset 0x4c0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4c8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4d0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4d8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4e0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4e8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4f0, size 0x10
        uint:10 inactivitykick;
        // offset 0x500, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x508, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x540, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x550, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x560, size 0x10
        fixed<10,2> destroytime;
        // offset 0x570, size 0x8
        uint:7 flagrespawntime;
        // offset 0x578, size 0x8
        uint:2 shutdowndamage;
        // offset 0x580, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x588, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x590, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x598, size 0x10
        uint:11 objectivehealth;
        // offset 0x5a8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x5b0, size 0x8
        uint:2 robotspeed;
        // offset 0x5b8, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5c0, size 0x8
        uint:7 servermsec;
        // offset 0x5c8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5d0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5e0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5f0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5f8, size 0x10
        uint:9 autodestroytime;
        // offset 0x608, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x610, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x618, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x620, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x628, size 0x8
        uint:6 prematchperiod;
        // offset 0x630, size 0x8
        uint:6 teamkillscore;
        // offset 0x638, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x640, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x648, size 0x20
        int deployablebarrierhealth;
        // offset 0x668, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x670, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x678, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x680, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x688, size 0x8
        uint:7 playernumlives;
        // offset 0x690, size 0x8
        uint:2 infectionmode;
        // offset 0x698, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x6a0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x6a8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x6b0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6b8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6c0, size 0x8
        uint:6 reboottime;
        // offset 0x6c8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6d0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6d8, size 0x8
        uint:4 pickuptime;
        // offset 0x6e0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x700, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x720, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x728, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x730, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x738, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x740, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x748, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x758, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x760, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x768, size 0x8
        uint:7 startplayers;
        // offset 0x770, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x778, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x780, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x788, size 0x8
        uint:5 totalkillsmax;
        // offset 0x790, size 0x8
        uint:4 roundswitch;
        // offset 0x798, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x7a0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x7a8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x7b0, size 0x8
        uint:5 weaponcount;
        // offset 0x7b8, size 0x8
        uint:7 weapontimer;
        // offset 0x7c0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7d0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7d8, size 0x8
        uint:7 drafttime;
        // offset 0x7e0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7e8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7f0, size 0x10
        fixed<10,4> killcamtime;
        // offset 0x800, size 0x8
        uint:4 throwscore;
        // offset 0x808, size 0x8
        uint:4 deposittime;
        // offset 0x810, size 0x10
        fixed<10,2> extratime;
        // offset 0x820, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x828, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x830, size 0x8
        uint:7 teamcount;
        // offset 0x838, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x858, size 0x8
        uint:4 roundlimit;
        // offset 0x860, size 0x8
        uint:2 charactercustomization;
        // offset 0x868, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x870, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x878, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x880, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x890, size 0x1
        bool delayplayer;
        // offset 0x891, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x892, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x893, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x894, size 0x1
        bool draftenabled;
        // offset 0x895, size 0x1
        bool droppedtagrespawn;
        // offset 0x896, size 0x1
        bool voipkillershearvictim;
        // offset 0x897, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x898, size 0x1
        bool presetclassesperteam;
        // offset 0x899, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x89a, size 0x1
        bool hardcoremode;
        // offset 0x89b, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x89c, size 0x1
        bool useitemspawns;
        // offset 0x89d, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x89e, size 0x1
        bool silentplant;
        // offset 0x89f, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x8a0, size 0x1
        bool drafteveryround;
        // offset 0x8a1, size 0x1
        bool timepauseswheninzone;
        // offset 0x8a2, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x8a3, size 0x1
        bool scoreperplayer;
        // offset 0x8a4, size 0x1
        bool ekiaresetondeath;
        // offset 0x8a5, size 0x1
        bool kothmode;
        // offset 0x8a6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x8a7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x8a8, size 0x1
        bool decayprogress;
        // offset 0x8a9, size 0x1
        bool playerqueuedrespawn;
        // offset 0x8aa, size 0x1
        bool cumulativeroundscores;
        // offset 0x8ab, size 0x1
        bool voipdeadhearkiller;
        // offset 0x8ac, size 0x1
        bool usespawngroups;
        // offset 0x8ad, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x8ae, size 0x1
        bool allowbattlechatter;
        // offset 0x8af, size 0x1
        bool fowrevealenabled;
        // offset 0x8b0, size 0x1
        bool disablecontracts;
        // offset 0x8b1, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x8b2, size 0x1
        bool allowannouncer;
        // offset 0x8b3, size 0x1
        bool disallowaimslowdown;
        // offset 0x8b4, size 0x1
        bool vehiclesenabled;
        // offset 0x8b5, size 0x1
        bool decaycapturedzones;
        // offset 0x8b6, size 0x1
        bool neutralzone;
        // offset 0x8b7, size 0x1
        bool onlyheadshots;
        // offset 0x8b8, size 0x1
        bool flagcapturecondition;
        // offset 0x8b9, size 0x1
        bool flagcanbeneutralized;
        // offset 0x8ba, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x8bb, size 0x1
        bool vehiclestimed;
        // offset 0x8bc, size 0x1
        bool pregamedraftenabled;
        // offset 0x8bd, size 0x1
        bool fogofwarminimap;
        // offset 0x8be, size 0x1
        bool teamkillpointloss;
        // offset 0x8bf, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x8c0, size 0x1
        bool perksenabled;
        // offset 0x8c1, size 0x1
        bool allowmapscripting;
        // offset 0x8c2, size 0x1
        bool robotshield;
        // offset 0x8c3, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x8c4, size 0x1
        bool allowkillcam;
        // offset 0x8c5, size 0x1
        bool disableattachments;
        // offset 0x8c6, size 0x1
        bool disablecompass;
        // offset 0x8c7, size 0x1
        bool disableweapondrop;
        // offset 0x8c8, size 0x1
        bool escalationenabled;
        // offset 0x8c9, size 0x1
        bool disablecac;
        // offset 0x8ca, size 0x1
        bool disableclassselection;
        // offset 0x8cb, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8cc, size 0x1
        bool autoteambalance;
        // offset 0x8cd, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8ce, size 0x1
        bool allowplayofthematch;
        // offset 0x8cf, size 0x1
        bool allowprone;
        // offset 0x8d0, size 0x1
        bool scoreresetondeath;
        // offset 0x8d1, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8d2, size 0x1
        bool playerforcerespawn;
        // offset 0x8d3, size 0x1
        bool multibomb;
        // offset 0x8d4, size 0x1
        bool deathcircle;
        // offset 0x8d5, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8d6, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8d7, size 0x1
        bool deathpointloss;
        // offset 0x8d8, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8d9, size 0x1
        bool rebootplayers;
        // offset 0x8da, size 0x1
        bool oldschoolmode;
        // offset 0x8db, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8dc, size 0x1
        bool allowfinalkillcam;
        // offset 0x8dd, size 0x1
        bool allowspectating;
        // offset 0x8de, size 0x1
        bool usabledynents;
        // offset 0x8df, size 0x1
        bool spawnselectenabled;
        // offset 0x8e0, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8e1, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8e2, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8e3, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8e4, size 0x1
        bool disallowprone;
        // offset 0x8e5, size 0x1
        bool moveplayers;
        // offset 0x8e6, size 0x1
        bool disabletacinsert;
        // offset 0x8e7, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8e8, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8e9, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8ea, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8eb, size 0x1
        bool use_doors;
        // offset 0x8ec, size 0x1
        bool pvponly;
        // offset 0x8ed, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8ee, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8ef, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8f0, size 0x1
        bool allowingameteamchange;
        // offset 0x8f1, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8f2, size 0x1
        bool deathzones;
        // offset 0x8f3, size 0x1
        bool classicmode;
        // offset 0x8f4, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8f5, size 0x1
        bool capdecay;
        // offset 0x8f6, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8f7, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8f8, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8f9, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x8fa, size 0x6
        uint:1 __pad[6];
    };

    // idx 0 members 1 size 0x900
    // offset 0x0, size 0x900
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_94b05b9f4d6b8e48"

version 28 {
    // idx 1 members 276 size 0x8d8
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x70, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x80, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x88, size 0x8
        uint:6 maxteamplayers;
        // offset 0x90, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xa8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xb8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xc8, size 0x8
        uint:6 preroundperiod;
        // offset 0xd0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xd8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe0, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xe8, size 0x8
        uint:7 maxplayers;
        // offset 0xf0, size 0x20
        int forwardspawnhealth;
        // offset 0x110, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x118, size 0x8
        uint:3 ballcount;
        // offset 0x120, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x130, size 0x8
        uint:3 gunselection;
        // offset 0x138, size 0x8
        uint:5 prematchrequirement;
        // offset 0x140, size 0x8
        uint:3 spectatetype;
        // offset 0x148, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x150, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x158, size 0x8
        uint:5 roundwinlimit;
        // offset 0x160, size 0x10
        uint:10 antiboostdistance;
        // offset 0x170, size 0x10
        uint:15 roundscorelimit;
        // offset 0x180, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x188, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x190, size 0x8
        fixed<8,2> defusetime;
        // offset 0x198, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1a0, size 0x8
        uint:5 maxallocation;
        // offset 0x1a8, size 0x8
        uint:4 carryscore;
        // offset 0x1b0, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1b8, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1c0, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1c8, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1d0, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1d8, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1e0, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x1e8, size 0x8
        uint:4 setbacks;
        // offset 0x1f0, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x210, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x220, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x230, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x240, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x250, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x260, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x270, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x278, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x280, size 0x10
        uint:15 scorelimit;
        // offset 0x290, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x298, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2a0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2a8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2b0, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2c0, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2c8, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2d0, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2d8, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x468, size 0x8
        uint:3 objectivepingtime;
        // offset 0x470, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x478, size 0x8
        uint:8 carrierarmor;
        // offset 0x480, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x488, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x490, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4a0, size 0x8
        uint:5 boottime;
        // offset 0x4a8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4b0, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4b8, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4c0, size 0x8
        uint:7 teamnumlives;
        // offset 0x4c8, size 0x8
        fixed<8,2> planttime;
        // offset 0x4d0, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4d8, size 0x10
        uint:10 inactivitykick;
        // offset 0x4e8, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x4f0, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x4f8, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x508, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x518, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x528, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x538, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x548, size 0x10
        fixed<10,2> destroytime;
        // offset 0x558, size 0x8
        uint:7 flagrespawntime;
        // offset 0x560, size 0x8
        uint:2 shutdowndamage;
        // offset 0x568, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x570, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x578, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x580, size 0x10
        uint:11 objectivehealth;
        // offset 0x590, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x598, size 0x8
        uint:2 robotspeed;
        // offset 0x5a0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5a8, size 0x8
        uint:7 servermsec;
        // offset 0x5b0, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5b8, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5c8, size 0x10
        uint:10 leaderbonus;
        // offset 0x5d8, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5e0, size 0x10
        uint:9 autodestroytime;
        // offset 0x5f0, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x5f8, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x600, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x608, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x610, size 0x8
        uint:6 prematchperiod;
        // offset 0x618, size 0x8
        uint:6 teamkillscore;
        // offset 0x620, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x628, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x630, size 0x20
        int deployablebarrierhealth;
        // offset 0x650, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x658, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x660, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x668, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x670, size 0x8
        uint:7 playernumlives;
        // offset 0x678, size 0x8
        uint:2 infectionmode;
        // offset 0x680, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x688, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x690, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x698, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6a0, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6a8, size 0x8
        uint:6 reboottime;
        // offset 0x6b0, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6b8, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6c0, size 0x8
        uint:4 pickuptime;
        // offset 0x6c8, size 0x20
        int hash_64727525f5957d06;
        // offset 0x6e8, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x708, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x710, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x718, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x720, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x728, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x730, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x740, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x748, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x750, size 0x8
        uint:7 startplayers;
        // offset 0x758, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x760, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x768, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x770, size 0x8
        uint:5 totalkillsmax;
        // offset 0x778, size 0x8
        uint:4 roundswitch;
        // offset 0x780, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x788, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x790, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x798, size 0x8
        uint:5 weaponcount;
        // offset 0x7a0, size 0x8
        uint:7 weapontimer;
        // offset 0x7a8, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7b8, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7c0, size 0x8
        uint:7 drafttime;
        // offset 0x7c8, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7d0, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7d8, size 0x8
        uint:4 throwscore;
        // offset 0x7e0, size 0x8
        uint:4 deposittime;
        // offset 0x7e8, size 0x10
        fixed<10,2> extratime;
        // offset 0x7f8, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x800, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x808, size 0x8
        uint:7 teamcount;
        // offset 0x810, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x830, size 0x8
        uint:4 roundlimit;
        // offset 0x838, size 0x8
        uint:2 charactercustomization;
        // offset 0x840, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x848, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x850, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x858, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x868, size 0x1
        bool delayplayer;
        // offset 0x869, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x86a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x86b, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x86c, size 0x1
        bool draftenabled;
        // offset 0x86d, size 0x1
        bool droppedtagrespawn;
        // offset 0x86e, size 0x1
        bool voipkillershearvictim;
        // offset 0x86f, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x870, size 0x1
        bool presetclassesperteam;
        // offset 0x871, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x872, size 0x1
        bool hardcoremode;
        // offset 0x873, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x874, size 0x1
        bool useitemspawns;
        // offset 0x875, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x876, size 0x1
        bool silentplant;
        // offset 0x877, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x878, size 0x1
        bool drafteveryround;
        // offset 0x879, size 0x1
        bool timepauseswheninzone;
        // offset 0x87a, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x87b, size 0x1
        bool scoreperplayer;
        // offset 0x87c, size 0x1
        bool ekiaresetondeath;
        // offset 0x87d, size 0x1
        bool kothmode;
        // offset 0x87e, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x87f, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x880, size 0x1
        bool decayprogress;
        // offset 0x881, size 0x1
        bool playerqueuedrespawn;
        // offset 0x882, size 0x1
        bool cumulativeroundscores;
        // offset 0x883, size 0x1
        bool voipdeadhearkiller;
        // offset 0x884, size 0x1
        bool usespawngroups;
        // offset 0x885, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x886, size 0x1
        bool allowbattlechatter;
        // offset 0x887, size 0x1
        bool fowrevealenabled;
        // offset 0x888, size 0x1
        bool disablecontracts;
        // offset 0x889, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x88a, size 0x1
        bool allowannouncer;
        // offset 0x88b, size 0x1
        bool disallowaimslowdown;
        // offset 0x88c, size 0x1
        bool vehiclesenabled;
        // offset 0x88d, size 0x1
        bool decaycapturedzones;
        // offset 0x88e, size 0x1
        bool neutralzone;
        // offset 0x88f, size 0x1
        bool onlyheadshots;
        // offset 0x890, size 0x1
        bool flagcapturecondition;
        // offset 0x891, size 0x1
        bool flagcanbeneutralized;
        // offset 0x892, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x893, size 0x1
        bool vehiclestimed;
        // offset 0x894, size 0x1
        bool pregamedraftenabled;
        // offset 0x895, size 0x1
        bool fogofwarminimap;
        // offset 0x896, size 0x1
        bool teamkillpointloss;
        // offset 0x897, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x898, size 0x1
        bool perksenabled;
        // offset 0x899, size 0x1
        bool allowmapscripting;
        // offset 0x89a, size 0x1
        bool robotshield;
        // offset 0x89b, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x89c, size 0x1
        bool allowkillcam;
        // offset 0x89d, size 0x1
        bool disableattachments;
        // offset 0x89e, size 0x1
        bool disablecompass;
        // offset 0x89f, size 0x1
        bool disableweapondrop;
        // offset 0x8a0, size 0x1
        bool escalationenabled;
        // offset 0x8a1, size 0x1
        bool disablecac;
        // offset 0x8a2, size 0x1
        bool disableclassselection;
        // offset 0x8a3, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8a4, size 0x1
        bool autoteambalance;
        // offset 0x8a5, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8a6, size 0x1
        bool allowplayofthematch;
        // offset 0x8a7, size 0x1
        bool allowprone;
        // offset 0x8a8, size 0x1
        bool scoreresetondeath;
        // offset 0x8a9, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8aa, size 0x1
        bool playerforcerespawn;
        // offset 0x8ab, size 0x1
        bool multibomb;
        // offset 0x8ac, size 0x1
        bool deathcircle;
        // offset 0x8ad, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8ae, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8af, size 0x1
        bool deathpointloss;
        // offset 0x8b0, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8b1, size 0x1
        bool rebootplayers;
        // offset 0x8b2, size 0x1
        bool oldschoolmode;
        // offset 0x8b3, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8b4, size 0x1
        bool allowfinalkillcam;
        // offset 0x8b5, size 0x1
        bool allowspectating;
        // offset 0x8b6, size 0x1
        bool usabledynents;
        // offset 0x8b7, size 0x1
        bool spawnselectenabled;
        // offset 0x8b8, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8b9, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8ba, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8bb, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8bc, size 0x1
        bool disallowprone;
        // offset 0x8bd, size 0x1
        bool moveplayers;
        // offset 0x8be, size 0x1
        bool disabletacinsert;
        // offset 0x8bf, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8c0, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8c1, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8c2, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8c3, size 0x1
        bool use_doors;
        // offset 0x8c4, size 0x1
        bool pvponly;
        // offset 0x8c5, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8c6, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8c7, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8c8, size 0x1
        bool allowingameteamchange;
        // offset 0x8c9, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8ca, size 0x1
        bool deathzones;
        // offset 0x8cb, size 0x1
        bool classicmode;
        // offset 0x8cc, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8cd, size 0x1
        bool capdecay;
        // offset 0x8ce, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8cf, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8d0, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8d1, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0x8d2, size 0x6
        uint:1 __pad[6];
    };

    // idx 0 members 1 size 0x8d8
    // offset 0x0, size 0x8d8
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_32875e2cb720f079"

version 27 {
    // idx 1 members 275 size 0x8d8
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x70, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x80, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x88, size 0x8
        uint:6 maxteamplayers;
        // offset 0x90, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xa8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xb8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc0, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0xc8, size 0x8
        uint:6 preroundperiod;
        // offset 0xd0, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xd8, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xe0, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xe8, size 0x8
        uint:7 maxplayers;
        // offset 0xf0, size 0x20
        int forwardspawnhealth;
        // offset 0x110, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x118, size 0x8
        uint:3 ballcount;
        // offset 0x120, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x130, size 0x8
        uint:3 gunselection;
        // offset 0x138, size 0x8
        uint:5 prematchrequirement;
        // offset 0x140, size 0x8
        uint:3 spectatetype;
        // offset 0x148, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x150, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x158, size 0x8
        uint:5 roundwinlimit;
        // offset 0x160, size 0x10
        uint:10 antiboostdistance;
        // offset 0x170, size 0x10
        uint:15 roundscorelimit;
        // offset 0x180, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x188, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x190, size 0x8
        fixed<8,2> defusetime;
        // offset 0x198, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x1a0, size 0x8
        uint:5 maxallocation;
        // offset 0x1a8, size 0x8
        uint:4 carryscore;
        // offset 0x1b0, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1b8, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1c0, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1c8, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1d0, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1d8, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1e0, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x1e8, size 0x8
        uint:4 setbacks;
        // offset 0x1f0, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x210, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x220, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x230, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x240, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x250, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x260, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x270, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x278, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x280, size 0x10
        uint:15 scorelimit;
        // offset 0x290, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x298, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x2a0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2a8, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2b0, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2c0, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2c8, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2d0, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2d8, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x468, size 0x8
        uint:3 objectivepingtime;
        // offset 0x470, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x478, size 0x8
        uint:8 carrierarmor;
        // offset 0x480, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x488, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x490, size 0x10
        uint:9 carriermovespeed;
        // offset 0x4a0, size 0x8
        uint:5 boottime;
        // offset 0x4a8, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4b0, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4b8, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4c0, size 0x8
        uint:7 teamnumlives;
        // offset 0x4c8, size 0x8
        fixed<8,2> planttime;
        // offset 0x4d0, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4d8, size 0x10
        uint:10 inactivitykick;
        // offset 0x4e8, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x4f0, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x4f8, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x508, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x518, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x528, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x538, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x548, size 0x10
        fixed<10,2> destroytime;
        // offset 0x558, size 0x8
        uint:7 flagrespawntime;
        // offset 0x560, size 0x8
        uint:2 shutdowndamage;
        // offset 0x568, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x570, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x578, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x580, size 0x10
        uint:11 objectivehealth;
        // offset 0x590, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x598, size 0x8
        uint:2 robotspeed;
        // offset 0x5a0, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5a8, size 0x8
        uint:7 servermsec;
        // offset 0x5b0, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5b8, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5c8, size 0x10
        uint:10 leaderbonus;
        // offset 0x5d8, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5e0, size 0x10
        uint:9 autodestroytime;
        // offset 0x5f0, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x5f8, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x600, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x608, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x610, size 0x8
        uint:6 prematchperiod;
        // offset 0x618, size 0x8
        uint:6 teamkillscore;
        // offset 0x620, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x628, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x630, size 0x20
        int deployablebarrierhealth;
        // offset 0x650, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x658, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x660, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x668, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x670, size 0x8
        uint:7 playernumlives;
        // offset 0x678, size 0x8
        uint:2 infectionmode;
        // offset 0x680, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x688, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x690, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x698, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x6a0, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6a8, size 0x8
        uint:6 reboottime;
        // offset 0x6b0, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6b8, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6c0, size 0x8
        uint:4 pickuptime;
        // offset 0x6c8, size 0x20
        int hash_64727525f5957d06;
        // offset 0x6e8, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x708, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x710, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x718, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x720, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x728, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x730, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x740, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x748, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x750, size 0x8
        uint:7 startplayers;
        // offset 0x758, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x760, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x768, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x770, size 0x8
        uint:5 totalkillsmax;
        // offset 0x778, size 0x8
        uint:4 roundswitch;
        // offset 0x780, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x788, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x790, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x798, size 0x8
        uint:5 weaponcount;
        // offset 0x7a0, size 0x8
        uint:7 weapontimer;
        // offset 0x7a8, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7b8, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7c0, size 0x8
        uint:7 drafttime;
        // offset 0x7c8, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7d0, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7d8, size 0x8
        uint:4 throwscore;
        // offset 0x7e0, size 0x8
        uint:4 deposittime;
        // offset 0x7e8, size 0x10
        fixed<10,2> extratime;
        // offset 0x7f8, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x800, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x808, size 0x8
        uint:7 teamcount;
        // offset 0x810, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x830, size 0x8
        uint:4 roundlimit;
        // offset 0x838, size 0x8
        uint:2 charactercustomization;
        // offset 0x840, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x848, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x850, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x858, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x868, size 0x1
        bool delayplayer;
        // offset 0x869, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x86a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x86b, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x86c, size 0x1
        bool draftenabled;
        // offset 0x86d, size 0x1
        bool droppedtagrespawn;
        // offset 0x86e, size 0x1
        bool voipkillershearvictim;
        // offset 0x86f, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x870, size 0x1
        bool presetclassesperteam;
        // offset 0x871, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x872, size 0x1
        bool hardcoremode;
        // offset 0x873, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x874, size 0x1
        bool useitemspawns;
        // offset 0x875, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x876, size 0x1
        bool silentplant;
        // offset 0x877, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x878, size 0x1
        bool drafteveryround;
        // offset 0x879, size 0x1
        bool timepauseswheninzone;
        // offset 0x87a, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x87b, size 0x1
        bool scoreperplayer;
        // offset 0x87c, size 0x1
        bool ekiaresetondeath;
        // offset 0x87d, size 0x1
        bool kothmode;
        // offset 0x87e, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x87f, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x880, size 0x1
        bool decayprogress;
        // offset 0x881, size 0x1
        bool playerqueuedrespawn;
        // offset 0x882, size 0x1
        bool cumulativeroundscores;
        // offset 0x883, size 0x1
        bool voipdeadhearkiller;
        // offset 0x884, size 0x1
        bool usespawngroups;
        // offset 0x885, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x886, size 0x1
        bool allowbattlechatter;
        // offset 0x887, size 0x1
        bool fowrevealenabled;
        // offset 0x888, size 0x1
        bool disablecontracts;
        // offset 0x889, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x88a, size 0x1
        bool allowannouncer;
        // offset 0x88b, size 0x1
        bool disallowaimslowdown;
        // offset 0x88c, size 0x1
        bool vehiclesenabled;
        // offset 0x88d, size 0x1
        bool decaycapturedzones;
        // offset 0x88e, size 0x1
        bool neutralzone;
        // offset 0x88f, size 0x1
        bool onlyheadshots;
        // offset 0x890, size 0x1
        bool flagcapturecondition;
        // offset 0x891, size 0x1
        bool flagcanbeneutralized;
        // offset 0x892, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x893, size 0x1
        bool vehiclestimed;
        // offset 0x894, size 0x1
        bool pregamedraftenabled;
        // offset 0x895, size 0x1
        bool fogofwarminimap;
        // offset 0x896, size 0x1
        bool teamkillpointloss;
        // offset 0x897, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x898, size 0x1
        bool perksenabled;
        // offset 0x899, size 0x1
        bool allowmapscripting;
        // offset 0x89a, size 0x1
        bool robotshield;
        // offset 0x89b, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x89c, size 0x1
        bool allowkillcam;
        // offset 0x89d, size 0x1
        bool disableattachments;
        // offset 0x89e, size 0x1
        bool disablecompass;
        // offset 0x89f, size 0x1
        bool disableweapondrop;
        // offset 0x8a0, size 0x1
        bool escalationenabled;
        // offset 0x8a1, size 0x1
        bool disablecac;
        // offset 0x8a2, size 0x1
        bool disableclassselection;
        // offset 0x8a3, size 0x1
        bool hash_48670d9509071424;
        // offset 0x8a4, size 0x1
        bool autoteambalance;
        // offset 0x8a5, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x8a6, size 0x1
        bool allowplayofthematch;
        // offset 0x8a7, size 0x1
        bool allowprone;
        // offset 0x8a8, size 0x1
        bool scoreresetondeath;
        // offset 0x8a9, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8aa, size 0x1
        bool playerforcerespawn;
        // offset 0x8ab, size 0x1
        bool multibomb;
        // offset 0x8ac, size 0x1
        bool deathcircle;
        // offset 0x8ad, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8ae, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8af, size 0x1
        bool deathpointloss;
        // offset 0x8b0, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8b1, size 0x1
        bool rebootplayers;
        // offset 0x8b2, size 0x1
        bool oldschoolmode;
        // offset 0x8b3, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8b4, size 0x1
        bool allowfinalkillcam;
        // offset 0x8b5, size 0x1
        bool allowspectating;
        // offset 0x8b6, size 0x1
        bool usabledynents;
        // offset 0x8b7, size 0x1
        bool spawnselectenabled;
        // offset 0x8b8, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8b9, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8ba, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8bb, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8bc, size 0x1
        bool disallowprone;
        // offset 0x8bd, size 0x1
        bool moveplayers;
        // offset 0x8be, size 0x1
        bool disabletacinsert;
        // offset 0x8bf, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8c0, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8c1, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8c2, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8c3, size 0x1
        bool use_doors;
        // offset 0x8c4, size 0x1
        bool pvponly;
        // offset 0x8c5, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8c6, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8c7, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8c8, size 0x1
        bool allowingameteamchange;
        // offset 0x8c9, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8ca, size 0x1
        bool deathzones;
        // offset 0x8cb, size 0x1
        bool classicmode;
        // offset 0x8cc, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8cd, size 0x1
        bool capdecay;
        // offset 0x8ce, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8cf, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8d0, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8d1, size 0x7
        uint:1 __pad[7];
    };

    // idx 0 members 1 size 0x8d8
    // offset 0x0, size 0x8d8
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_27cf5ec7f7089336"

version 26 {
    // idx 1 members 272 size 0x8c8
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x70, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x80, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x88, size 0x8
        uint:6 maxteamplayers;
        // offset 0x90, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xa8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xb8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc0, size 0x8
        uint:6 preroundperiod;
        // offset 0xc8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xd0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xd8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xe0, size 0x8
        uint:7 maxplayers;
        // offset 0xe8, size 0x20
        int forwardspawnhealth;
        // offset 0x108, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x110, size 0x8
        uint:3 ballcount;
        // offset 0x118, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x128, size 0x8
        uint:3 gunselection;
        // offset 0x130, size 0x8
        uint:5 prematchrequirement;
        // offset 0x138, size 0x8
        uint:3 spectatetype;
        // offset 0x140, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x148, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x150, size 0x8
        uint:5 roundwinlimit;
        // offset 0x158, size 0x10
        uint:10 antiboostdistance;
        // offset 0x168, size 0x10
        uint:15 roundscorelimit;
        // offset 0x178, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x180, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x188, size 0x8
        fixed<8,2> defusetime;
        // offset 0x190, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x198, size 0x8
        uint:5 maxallocation;
        // offset 0x1a0, size 0x8
        uint:4 carryscore;
        // offset 0x1a8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1b0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1b8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1c0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1c8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1d0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1d8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x1e0, size 0x8
        uint:4 setbacks;
        // offset 0x1e8, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x208, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x218, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x228, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x238, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x248, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x258, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x268, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x270, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x278, size 0x10
        uint:15 scorelimit;
        // offset 0x288, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x290, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x298, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2a0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2a8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2b8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2c0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2c8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2d0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x460, size 0x8
        uint:3 objectivepingtime;
        // offset 0x468, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x470, size 0x8
        uint:8 carrierarmor;
        // offset 0x478, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x480, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x488, size 0x10
        uint:9 carriermovespeed;
        // offset 0x498, size 0x8
        uint:5 boottime;
        // offset 0x4a0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4a8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4b0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4b8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4c0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4c8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4d0, size 0x10
        uint:10 inactivitykick;
        // offset 0x4e0, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x4e8, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x4f0, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x500, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x540, size 0x10
        fixed<10,2> destroytime;
        // offset 0x550, size 0x8
        uint:7 flagrespawntime;
        // offset 0x558, size 0x8
        uint:2 shutdowndamage;
        // offset 0x560, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x568, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x570, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x578, size 0x10
        uint:11 objectivehealth;
        // offset 0x588, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x590, size 0x8
        uint:2 robotspeed;
        // offset 0x598, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5a0, size 0x8
        uint:7 servermsec;
        // offset 0x5a8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5b0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5c0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5d0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5d8, size 0x10
        uint:9 autodestroytime;
        // offset 0x5e8, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x5f0, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x5f8, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x600, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x608, size 0x8
        uint:6 prematchperiod;
        // offset 0x610, size 0x8
        uint:6 teamkillscore;
        // offset 0x618, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x620, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x628, size 0x20
        int deployablebarrierhealth;
        // offset 0x648, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x650, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x658, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x660, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x668, size 0x8
        uint:7 playernumlives;
        // offset 0x670, size 0x8
        uint:2 infectionmode;
        // offset 0x678, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x680, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x688, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x690, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x698, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6a0, size 0x8
        uint:6 reboottime;
        // offset 0x6a8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6b0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6b8, size 0x8
        uint:4 pickuptime;
        // offset 0x6c0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x6e0, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x700, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x708, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x710, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x718, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x720, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x728, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x738, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x740, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x748, size 0x8
        uint:7 startplayers;
        // offset 0x750, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x758, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x760, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x768, size 0x8
        uint:5 totalkillsmax;
        // offset 0x770, size 0x8
        uint:4 roundswitch;
        // offset 0x778, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x780, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x788, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x790, size 0x8
        uint:5 weaponcount;
        // offset 0x798, size 0x8
        uint:7 weapontimer;
        // offset 0x7a0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7b0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7b8, size 0x8
        uint:7 drafttime;
        // offset 0x7c0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7c8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7d0, size 0x8
        uint:4 throwscore;
        // offset 0x7d8, size 0x8
        uint:4 deposittime;
        // offset 0x7e0, size 0x10
        fixed<10,2> extratime;
        // offset 0x7f0, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x7f8, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x800, size 0x8
        uint:7 teamcount;
        // offset 0x808, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x828, size 0x8
        uint:4 roundlimit;
        // offset 0x830, size 0x8
        uint:2 charactercustomization;
        // offset 0x838, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x840, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x848, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x850, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x860, size 0x1
        bool delayplayer;
        // offset 0x861, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x862, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x863, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x864, size 0x1
        bool draftenabled;
        // offset 0x865, size 0x1
        bool droppedtagrespawn;
        // offset 0x866, size 0x1
        bool voipkillershearvictim;
        // offset 0x867, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x868, size 0x1
        bool presetclassesperteam;
        // offset 0x869, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x86a, size 0x1
        bool hardcoremode;
        // offset 0x86b, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x86c, size 0x1
        bool useitemspawns;
        // offset 0x86d, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x86e, size 0x1
        bool silentplant;
        // offset 0x86f, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x870, size 0x1
        bool drafteveryround;
        // offset 0x871, size 0x1
        bool timepauseswheninzone;
        // offset 0x872, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x873, size 0x1
        bool scoreperplayer;
        // offset 0x874, size 0x1
        bool kothmode;
        // offset 0x875, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x876, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x877, size 0x1
        bool decayprogress;
        // offset 0x878, size 0x1
        bool playerqueuedrespawn;
        // offset 0x879, size 0x1
        bool cumulativeroundscores;
        // offset 0x87a, size 0x1
        bool voipdeadhearkiller;
        // offset 0x87b, size 0x1
        bool usespawngroups;
        // offset 0x87c, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x87d, size 0x1
        bool allowbattlechatter;
        // offset 0x87e, size 0x1
        bool fowrevealenabled;
        // offset 0x87f, size 0x1
        bool disablecontracts;
        // offset 0x880, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x881, size 0x1
        bool allowannouncer;
        // offset 0x882, size 0x1
        bool disallowaimslowdown;
        // offset 0x883, size 0x1
        bool vehiclesenabled;
        // offset 0x884, size 0x1
        bool decaycapturedzones;
        // offset 0x885, size 0x1
        bool neutralzone;
        // offset 0x886, size 0x1
        bool onlyheadshots;
        // offset 0x887, size 0x1
        bool flagcapturecondition;
        // offset 0x888, size 0x1
        bool flagcanbeneutralized;
        // offset 0x889, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x88a, size 0x1
        bool vehiclestimed;
        // offset 0x88b, size 0x1
        bool pregamedraftenabled;
        // offset 0x88c, size 0x1
        bool fogofwarminimap;
        // offset 0x88d, size 0x1
        bool teamkillpointloss;
        // offset 0x88e, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x88f, size 0x1
        bool perksenabled;
        // offset 0x890, size 0x1
        bool allowmapscripting;
        // offset 0x891, size 0x1
        bool robotshield;
        // offset 0x892, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x893, size 0x1
        bool allowkillcam;
        // offset 0x894, size 0x1
        bool disableattachments;
        // offset 0x895, size 0x1
        bool disablecompass;
        // offset 0x896, size 0x1
        bool disableweapondrop;
        // offset 0x897, size 0x1
        bool escalationenabled;
        // offset 0x898, size 0x1
        bool disablecac;
        // offset 0x899, size 0x1
        bool disableclassselection;
        // offset 0x89a, size 0x1
        bool hash_48670d9509071424;
        // offset 0x89b, size 0x1
        bool autoteambalance;
        // offset 0x89c, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x89d, size 0x1
        bool allowplayofthematch;
        // offset 0x89e, size 0x1
        bool allowprone;
        // offset 0x89f, size 0x1
        bool scoreresetondeath;
        // offset 0x8a0, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8a1, size 0x1
        bool playerforcerespawn;
        // offset 0x8a2, size 0x1
        bool multibomb;
        // offset 0x8a3, size 0x1
        bool deathcircle;
        // offset 0x8a4, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8a5, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8a6, size 0x1
        bool deathpointloss;
        // offset 0x8a7, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8a8, size 0x1
        bool rebootplayers;
        // offset 0x8a9, size 0x1
        bool oldschoolmode;
        // offset 0x8aa, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8ab, size 0x1
        bool allowfinalkillcam;
        // offset 0x8ac, size 0x1
        bool allowspectating;
        // offset 0x8ad, size 0x1
        bool usabledynents;
        // offset 0x8ae, size 0x1
        bool spawnselectenabled;
        // offset 0x8af, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8b0, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8b1, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8b2, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8b3, size 0x1
        bool disallowprone;
        // offset 0x8b4, size 0x1
        bool moveplayers;
        // offset 0x8b5, size 0x1
        bool disabletacinsert;
        // offset 0x8b6, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8b7, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0x8b8, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8b9, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8ba, size 0x1
        bool use_doors;
        // offset 0x8bb, size 0x1
        bool pvponly;
        // offset 0x8bc, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8bd, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8be, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8bf, size 0x1
        bool allowingameteamchange;
        // offset 0x8c0, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8c1, size 0x1
        bool deathzones;
        // offset 0x8c2, size 0x1
        bool classicmode;
        // offset 0x8c3, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8c4, size 0x1
        bool capdecay;
        // offset 0x8c5, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8c6, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8c7, size 0x1
        bool hash_5f76e2d55ad861ed;
    };

    // idx 0 members 1 size 0x8c8
    // offset 0x0, size 0x8c8
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_e1d9684c82e26659"

version 25 {
    // idx 1 members 272 size 0x8c8
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x70, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x80, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x88, size 0x8
        uint:6 maxteamplayers;
        // offset 0x90, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xa8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xb8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc0, size 0x8
        uint:6 preroundperiod;
        // offset 0xc8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xd0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xd8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xe0, size 0x8
        uint:7 maxplayers;
        // offset 0xe8, size 0x20
        int forwardspawnhealth;
        // offset 0x108, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x110, size 0x8
        uint:3 ballcount;
        // offset 0x118, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x128, size 0x8
        uint:3 gunselection;
        // offset 0x130, size 0x8
        uint:5 prematchrequirement;
        // offset 0x138, size 0x8
        uint:3 spectatetype;
        // offset 0x140, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x148, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x150, size 0x8
        uint:5 roundwinlimit;
        // offset 0x158, size 0x10
        uint:10 antiboostdistance;
        // offset 0x168, size 0x10
        uint:15 roundscorelimit;
        // offset 0x178, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x180, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x188, size 0x8
        fixed<8,2> defusetime;
        // offset 0x190, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x198, size 0x8
        uint:5 maxallocation;
        // offset 0x1a0, size 0x8
        uint:4 carryscore;
        // offset 0x1a8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1b0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1b8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1c0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1c8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1d0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1d8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x1e0, size 0x8
        uint:4 setbacks;
        // offset 0x1e8, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x208, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x218, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x228, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x238, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x248, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x258, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x268, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x270, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x278, size 0x10
        uint:15 scorelimit;
        // offset 0x288, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x290, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x298, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2a0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2a8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2b8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2c0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2c8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2d0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x460, size 0x8
        uint:3 objectivepingtime;
        // offset 0x468, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x470, size 0x8
        uint:8 carrierarmor;
        // offset 0x478, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x480, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x488, size 0x10
        uint:9 carriermovespeed;
        // offset 0x498, size 0x8
        uint:5 boottime;
        // offset 0x4a0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4a8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4b0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4b8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4c0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4c8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4d0, size 0x10
        uint:10 inactivitykick;
        // offset 0x4e0, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x4e8, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x4f0, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x500, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x540, size 0x10
        fixed<10,2> destroytime;
        // offset 0x550, size 0x8
        uint:7 flagrespawntime;
        // offset 0x558, size 0x8
        uint:2 shutdowndamage;
        // offset 0x560, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x568, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x570, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x578, size 0x10
        uint:11 objectivehealth;
        // offset 0x588, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x590, size 0x8
        uint:2 robotspeed;
        // offset 0x598, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5a0, size 0x8
        uint:7 servermsec;
        // offset 0x5a8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5b0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5c0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5d0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5d8, size 0x10
        uint:9 autodestroytime;
        // offset 0x5e8, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x5f0, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x5f8, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x600, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x608, size 0x8
        uint:6 prematchperiod;
        // offset 0x610, size 0x8
        uint:6 teamkillscore;
        // offset 0x618, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x620, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x628, size 0x20
        int deployablebarrierhealth;
        // offset 0x648, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x650, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x658, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x660, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x668, size 0x8
        uint:7 playernumlives;
        // offset 0x670, size 0x8
        uint:2 infectionmode;
        // offset 0x678, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x680, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x688, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x690, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x698, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6a0, size 0x8
        uint:6 reboottime;
        // offset 0x6a8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6b0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6b8, size 0x8
        uint:4 pickuptime;
        // offset 0x6c0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x6e0, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x700, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x708, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x710, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x718, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x720, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x728, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x738, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x740, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x748, size 0x8
        uint:7 startplayers;
        // offset 0x750, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x758, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x760, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x768, size 0x8
        uint:5 totalkillsmax;
        // offset 0x770, size 0x8
        uint:4 roundswitch;
        // offset 0x778, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x780, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x788, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x790, size 0x8
        uint:5 weaponcount;
        // offset 0x798, size 0x8
        uint:7 weapontimer;
        // offset 0x7a0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7b0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7b8, size 0x8
        uint:7 drafttime;
        // offset 0x7c0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7c8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7d0, size 0x8
        uint:4 throwscore;
        // offset 0x7d8, size 0x8
        uint:4 deposittime;
        // offset 0x7e0, size 0x10
        fixed<10,2> extratime;
        // offset 0x7f0, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x7f8, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x800, size 0x8
        uint:7 teamcount;
        // offset 0x808, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x828, size 0x8
        uint:4 roundlimit;
        // offset 0x830, size 0x8
        uint:2 charactercustomization;
        // offset 0x838, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x840, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x848, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x850, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x860, size 0x1
        bool delayplayer;
        // offset 0x861, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x862, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x863, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x864, size 0x1
        bool draftenabled;
        // offset 0x865, size 0x1
        bool droppedtagrespawn;
        // offset 0x866, size 0x1
        bool voipkillershearvictim;
        // offset 0x867, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x868, size 0x1
        bool presetclassesperteam;
        // offset 0x869, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x86a, size 0x1
        bool hardcoremode;
        // offset 0x86b, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x86c, size 0x1
        bool useitemspawns;
        // offset 0x86d, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x86e, size 0x1
        bool silentplant;
        // offset 0x86f, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x870, size 0x1
        bool drafteveryround;
        // offset 0x871, size 0x1
        bool timepauseswheninzone;
        // offset 0x872, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x873, size 0x1
        bool scoreperplayer;
        // offset 0x874, size 0x1
        bool kothmode;
        // offset 0x875, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x876, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x877, size 0x1
        bool decayprogress;
        // offset 0x878, size 0x1
        bool playerqueuedrespawn;
        // offset 0x879, size 0x1
        bool cumulativeroundscores;
        // offset 0x87a, size 0x1
        bool voipdeadhearkiller;
        // offset 0x87b, size 0x1
        bool usespawngroups;
        // offset 0x87c, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x87d, size 0x1
        bool allowbattlechatter;
        // offset 0x87e, size 0x1
        bool fowrevealenabled;
        // offset 0x87f, size 0x1
        bool disablecontracts;
        // offset 0x880, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x881, size 0x1
        bool allowannouncer;
        // offset 0x882, size 0x1
        bool disallowaimslowdown;
        // offset 0x883, size 0x1
        bool vehiclesenabled;
        // offset 0x884, size 0x1
        bool decaycapturedzones;
        // offset 0x885, size 0x1
        bool neutralzone;
        // offset 0x886, size 0x1
        bool onlyheadshots;
        // offset 0x887, size 0x1
        bool flagcapturecondition;
        // offset 0x888, size 0x1
        bool flagcanbeneutralized;
        // offset 0x889, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x88a, size 0x1
        bool vehiclestimed;
        // offset 0x88b, size 0x1
        bool pregamedraftenabled;
        // offset 0x88c, size 0x1
        bool fogofwarminimap;
        // offset 0x88d, size 0x1
        bool teamkillpointloss;
        // offset 0x88e, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x88f, size 0x1
        bool perksenabled;
        // offset 0x890, size 0x1
        bool allowmapscripting;
        // offset 0x891, size 0x1
        bool robotshield;
        // offset 0x892, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x893, size 0x1
        bool allowkillcam;
        // offset 0x894, size 0x1
        bool disableattachments;
        // offset 0x895, size 0x1
        bool disablecompass;
        // offset 0x896, size 0x1
        bool disableweapondrop;
        // offset 0x897, size 0x1
        bool escalationenabled;
        // offset 0x898, size 0x1
        bool disablecac;
        // offset 0x899, size 0x1
        bool disableclassselection;
        // offset 0x89a, size 0x1
        bool hash_48670d9509071424;
        // offset 0x89b, size 0x1
        bool autoteambalance;
        // offset 0x89c, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x89d, size 0x1
        bool allowplayofthematch;
        // offset 0x89e, size 0x1
        bool allowprone;
        // offset 0x89f, size 0x1
        bool scoreresetondeath;
        // offset 0x8a0, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8a1, size 0x1
        bool playerforcerespawn;
        // offset 0x8a2, size 0x1
        bool multibomb;
        // offset 0x8a3, size 0x1
        bool deathcircle;
        // offset 0x8a4, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8a5, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0x8a6, size 0x1
        bool deathpointloss;
        // offset 0x8a7, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8a8, size 0x1
        bool rebootplayers;
        // offset 0x8a9, size 0x1
        bool oldschoolmode;
        // offset 0x8aa, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8ab, size 0x1
        bool allowfinalkillcam;
        // offset 0x8ac, size 0x1
        bool allowspectating;
        // offset 0x8ad, size 0x1
        bool usabledynents;
        // offset 0x8ae, size 0x1
        bool spawnselectenabled;
        // offset 0x8af, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8b0, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8b1, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8b2, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8b3, size 0x1
        bool disallowprone;
        // offset 0x8b4, size 0x1
        bool moveplayers;
        // offset 0x8b5, size 0x1
        bool disabletacinsert;
        // offset 0x8b6, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8b7, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8b8, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8b9, size 0x1
        bool use_doors;
        // offset 0x8ba, size 0x1
        bool pvponly;
        // offset 0x8bb, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8bc, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8bd, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8be, size 0x1
        bool allowingameteamchange;
        // offset 0x8bf, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8c0, size 0x1
        bool deathzones;
        // offset 0x8c1, size 0x1
        bool classicmode;
        // offset 0x8c2, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8c3, size 0x1
        bool capdecay;
        // offset 0x8c4, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8c5, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8c6, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8c7, size 0x1
        uint:1 __pad[1];
    };

    // idx 0 members 1 size 0x8c8
    // offset 0x0, size 0x8c8
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_b6a48d0ff2d98f17"

version 24 {
    // idx 1 members 271 size 0x8c8
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x70, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x80, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x88, size 0x8
        uint:6 maxteamplayers;
        // offset 0x90, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xa8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xb8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc0, size 0x8
        uint:6 preroundperiod;
        // offset 0xc8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xd0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xd8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xe0, size 0x8
        uint:7 maxplayers;
        // offset 0xe8, size 0x20
        int forwardspawnhealth;
        // offset 0x108, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x110, size 0x8
        uint:3 ballcount;
        // offset 0x118, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x128, size 0x8
        uint:3 gunselection;
        // offset 0x130, size 0x8
        uint:5 prematchrequirement;
        // offset 0x138, size 0x8
        uint:3 spectatetype;
        // offset 0x140, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x148, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x150, size 0x8
        uint:5 roundwinlimit;
        // offset 0x158, size 0x10
        uint:10 antiboostdistance;
        // offset 0x168, size 0x10
        uint:15 roundscorelimit;
        // offset 0x178, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x180, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x188, size 0x8
        fixed<8,2> defusetime;
        // offset 0x190, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x198, size 0x8
        uint:5 maxallocation;
        // offset 0x1a0, size 0x8
        uint:4 carryscore;
        // offset 0x1a8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1b0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1b8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1c0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1c8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1d0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1d8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x1e0, size 0x8
        uint:4 setbacks;
        // offset 0x1e8, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x208, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x218, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x228, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x238, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x248, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x258, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x268, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x270, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x278, size 0x10
        uint:15 scorelimit;
        // offset 0x288, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x290, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x298, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2a0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2a8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2b8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2c0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2c8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2d0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x460, size 0x8
        uint:3 objectivepingtime;
        // offset 0x468, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x470, size 0x8
        uint:8 carrierarmor;
        // offset 0x478, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x480, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x488, size 0x10
        uint:9 carriermovespeed;
        // offset 0x498, size 0x8
        uint:5 boottime;
        // offset 0x4a0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4a8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4b0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4b8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4c0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4c8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4d0, size 0x10
        uint:10 inactivitykick;
        // offset 0x4e0, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x4e8, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x4f0, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x500, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x540, size 0x10
        fixed<10,2> destroytime;
        // offset 0x550, size 0x8
        uint:7 flagrespawntime;
        // offset 0x558, size 0x8
        uint:2 shutdowndamage;
        // offset 0x560, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x568, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x570, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x578, size 0x10
        uint:11 objectivehealth;
        // offset 0x588, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x590, size 0x8
        uint:2 robotspeed;
        // offset 0x598, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5a0, size 0x8
        uint:7 servermsec;
        // offset 0x5a8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5b0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5c0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5d0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5d8, size 0x10
        uint:9 autodestroytime;
        // offset 0x5e8, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x5f0, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x5f8, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x600, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x608, size 0x8
        uint:6 prematchperiod;
        // offset 0x610, size 0x8
        uint:6 teamkillscore;
        // offset 0x618, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x620, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x628, size 0x20
        int deployablebarrierhealth;
        // offset 0x648, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x650, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x658, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x660, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x668, size 0x8
        uint:7 playernumlives;
        // offset 0x670, size 0x8
        uint:2 infectionmode;
        // offset 0x678, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x680, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x688, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x690, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x698, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6a0, size 0x8
        uint:6 reboottime;
        // offset 0x6a8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6b0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6b8, size 0x8
        uint:4 pickuptime;
        // offset 0x6c0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x6e0, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x700, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x708, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x710, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x718, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x720, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x728, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x738, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x740, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x748, size 0x8
        uint:7 startplayers;
        // offset 0x750, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x758, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x760, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x768, size 0x8
        uint:5 totalkillsmax;
        // offset 0x770, size 0x8
        uint:4 roundswitch;
        // offset 0x778, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x780, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x788, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x790, size 0x8
        uint:5 weaponcount;
        // offset 0x798, size 0x8
        uint:7 weapontimer;
        // offset 0x7a0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7b0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7b8, size 0x8
        uint:7 drafttime;
        // offset 0x7c0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7c8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7d0, size 0x8
        uint:4 throwscore;
        // offset 0x7d8, size 0x8
        uint:4 deposittime;
        // offset 0x7e0, size 0x10
        fixed<10,2> extratime;
        // offset 0x7f0, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x7f8, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0x800, size 0x8
        uint:7 teamcount;
        // offset 0x808, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x828, size 0x8
        uint:4 roundlimit;
        // offset 0x830, size 0x8
        uint:2 charactercustomization;
        // offset 0x838, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x840, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x848, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x850, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x860, size 0x1
        bool delayplayer;
        // offset 0x861, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x862, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x863, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x864, size 0x1
        bool draftenabled;
        // offset 0x865, size 0x1
        bool droppedtagrespawn;
        // offset 0x866, size 0x1
        bool voipkillershearvictim;
        // offset 0x867, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x868, size 0x1
        bool presetclassesperteam;
        // offset 0x869, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x86a, size 0x1
        bool hardcoremode;
        // offset 0x86b, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x86c, size 0x1
        bool useitemspawns;
        // offset 0x86d, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x86e, size 0x1
        bool silentplant;
        // offset 0x86f, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x870, size 0x1
        bool drafteveryround;
        // offset 0x871, size 0x1
        bool timepauseswheninzone;
        // offset 0x872, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x873, size 0x1
        bool scoreperplayer;
        // offset 0x874, size 0x1
        bool kothmode;
        // offset 0x875, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x876, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x877, size 0x1
        bool decayprogress;
        // offset 0x878, size 0x1
        bool playerqueuedrespawn;
        // offset 0x879, size 0x1
        bool cumulativeroundscores;
        // offset 0x87a, size 0x1
        bool voipdeadhearkiller;
        // offset 0x87b, size 0x1
        bool usespawngroups;
        // offset 0x87c, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x87d, size 0x1
        bool allowbattlechatter;
        // offset 0x87e, size 0x1
        bool fowrevealenabled;
        // offset 0x87f, size 0x1
        bool disablecontracts;
        // offset 0x880, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x881, size 0x1
        bool allowannouncer;
        // offset 0x882, size 0x1
        bool disallowaimslowdown;
        // offset 0x883, size 0x1
        bool vehiclesenabled;
        // offset 0x884, size 0x1
        bool decaycapturedzones;
        // offset 0x885, size 0x1
        bool neutralzone;
        // offset 0x886, size 0x1
        bool onlyheadshots;
        // offset 0x887, size 0x1
        bool flagcapturecondition;
        // offset 0x888, size 0x1
        bool flagcanbeneutralized;
        // offset 0x889, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x88a, size 0x1
        bool vehiclestimed;
        // offset 0x88b, size 0x1
        bool pregamedraftenabled;
        // offset 0x88c, size 0x1
        bool fogofwarminimap;
        // offset 0x88d, size 0x1
        bool teamkillpointloss;
        // offset 0x88e, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x88f, size 0x1
        bool perksenabled;
        // offset 0x890, size 0x1
        bool allowmapscripting;
        // offset 0x891, size 0x1
        bool robotshield;
        // offset 0x892, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x893, size 0x1
        bool allowkillcam;
        // offset 0x894, size 0x1
        bool disableattachments;
        // offset 0x895, size 0x1
        bool disablecompass;
        // offset 0x896, size 0x1
        bool disableweapondrop;
        // offset 0x897, size 0x1
        bool escalationenabled;
        // offset 0x898, size 0x1
        bool disablecac;
        // offset 0x899, size 0x1
        bool disableclassselection;
        // offset 0x89a, size 0x1
        bool hash_48670d9509071424;
        // offset 0x89b, size 0x1
        bool autoteambalance;
        // offset 0x89c, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x89d, size 0x1
        bool allowplayofthematch;
        // offset 0x89e, size 0x1
        bool allowprone;
        // offset 0x89f, size 0x1
        bool scoreresetondeath;
        // offset 0x8a0, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x8a1, size 0x1
        bool playerforcerespawn;
        // offset 0x8a2, size 0x1
        bool multibomb;
        // offset 0x8a3, size 0x1
        bool deathcircle;
        // offset 0x8a4, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x8a5, size 0x1
        bool deathpointloss;
        // offset 0x8a6, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x8a7, size 0x1
        bool rebootplayers;
        // offset 0x8a8, size 0x1
        bool oldschoolmode;
        // offset 0x8a9, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8aa, size 0x1
        bool allowfinalkillcam;
        // offset 0x8ab, size 0x1
        bool allowspectating;
        // offset 0x8ac, size 0x1
        bool usabledynents;
        // offset 0x8ad, size 0x1
        bool spawnselectenabled;
        // offset 0x8ae, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8af, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8b0, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8b1, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8b2, size 0x1
        bool disallowprone;
        // offset 0x8b3, size 0x1
        bool moveplayers;
        // offset 0x8b4, size 0x1
        bool disabletacinsert;
        // offset 0x8b5, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8b6, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8b7, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8b8, size 0x1
        bool use_doors;
        // offset 0x8b9, size 0x1
        bool pvponly;
        // offset 0x8ba, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8bb, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8bc, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8bd, size 0x1
        bool allowingameteamchange;
        // offset 0x8be, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8bf, size 0x1
        bool deathzones;
        // offset 0x8c0, size 0x1
        bool classicmode;
        // offset 0x8c1, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8c2, size 0x1
        bool capdecay;
        // offset 0x8c3, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8c4, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8c5, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8c6, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x8c8
    // offset 0x0, size 0x8c8
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_160f4ffdc20581bc"

version 23 {
    // idx 1 members 270 size 0x8c0
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x70, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x80, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x88, size 0x8
        uint:6 maxteamplayers;
        // offset 0x90, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xa8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xb8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc0, size 0x8
        uint:6 preroundperiod;
        // offset 0xc8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xd0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xd8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xe0, size 0x8
        uint:7 maxplayers;
        // offset 0xe8, size 0x20
        int forwardspawnhealth;
        // offset 0x108, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x110, size 0x8
        uint:3 ballcount;
        // offset 0x118, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x128, size 0x8
        uint:3 gunselection;
        // offset 0x130, size 0x8
        uint:5 prematchrequirement;
        // offset 0x138, size 0x8
        uint:3 spectatetype;
        // offset 0x140, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x148, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x150, size 0x8
        uint:5 roundwinlimit;
        // offset 0x158, size 0x10
        uint:10 antiboostdistance;
        // offset 0x168, size 0x10
        uint:15 roundscorelimit;
        // offset 0x178, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x180, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x188, size 0x8
        fixed<8,2> defusetime;
        // offset 0x190, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x198, size 0x8
        uint:5 maxallocation;
        // offset 0x1a0, size 0x8
        uint:4 carryscore;
        // offset 0x1a8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1b0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1b8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1c0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1c8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1d0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1d8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x1e0, size 0x8
        uint:4 setbacks;
        // offset 0x1e8, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x208, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x218, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x228, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x238, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x248, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x258, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x268, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x270, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x278, size 0x10
        uint:15 scorelimit;
        // offset 0x288, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x290, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x298, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2a0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2a8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2b8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2c0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2c8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2d0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x460, size 0x8
        uint:3 objectivepingtime;
        // offset 0x468, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x470, size 0x8
        uint:8 carrierarmor;
        // offset 0x478, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x480, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x488, size 0x10
        uint:9 carriermovespeed;
        // offset 0x498, size 0x8
        uint:5 boottime;
        // offset 0x4a0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4a8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4b0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4b8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4c0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4c8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4d0, size 0x10
        uint:10 inactivitykick;
        // offset 0x4e0, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x4e8, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x4f0, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x500, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x540, size 0x10
        fixed<10,2> destroytime;
        // offset 0x550, size 0x8
        uint:7 flagrespawntime;
        // offset 0x558, size 0x8
        uint:2 shutdowndamage;
        // offset 0x560, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x568, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x570, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x578, size 0x10
        uint:11 objectivehealth;
        // offset 0x588, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x590, size 0x8
        uint:2 robotspeed;
        // offset 0x598, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5a0, size 0x8
        uint:7 servermsec;
        // offset 0x5a8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5b0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5c0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5d0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5d8, size 0x10
        uint:9 autodestroytime;
        // offset 0x5e8, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x5f0, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x5f8, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x600, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x608, size 0x8
        uint:6 prematchperiod;
        // offset 0x610, size 0x8
        uint:6 teamkillscore;
        // offset 0x618, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x620, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x628, size 0x20
        int deployablebarrierhealth;
        // offset 0x648, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x650, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x658, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x660, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x668, size 0x8
        uint:7 playernumlives;
        // offset 0x670, size 0x8
        uint:2 infectionmode;
        // offset 0x678, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x680, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x688, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x690, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x698, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6a0, size 0x8
        uint:6 reboottime;
        // offset 0x6a8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6b0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6b8, size 0x8
        uint:4 pickuptime;
        // offset 0x6c0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x6e0, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x700, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x708, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x710, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x718, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x720, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x728, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x738, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x740, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x748, size 0x8
        uint:7 startplayers;
        // offset 0x750, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x758, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x760, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x768, size 0x8
        uint:5 totalkillsmax;
        // offset 0x770, size 0x8
        uint:4 roundswitch;
        // offset 0x778, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x780, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x788, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x790, size 0x8
        uint:5 weaponcount;
        // offset 0x798, size 0x8
        uint:7 weapontimer;
        // offset 0x7a0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7b0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7b8, size 0x8
        uint:7 drafttime;
        // offset 0x7c0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7c8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7d0, size 0x8
        uint:4 throwscore;
        // offset 0x7d8, size 0x8
        uint:4 deposittime;
        // offset 0x7e0, size 0x10
        fixed<10,2> extratime;
        // offset 0x7f0, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0x7f8, size 0x8
        uint:7 teamcount;
        // offset 0x800, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x820, size 0x8
        uint:4 roundlimit;
        // offset 0x828, size 0x8
        uint:2 charactercustomization;
        // offset 0x830, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x838, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0x840, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x848, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x858, size 0x1
        bool delayplayer;
        // offset 0x859, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x85a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x85b, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x85c, size 0x1
        bool draftenabled;
        // offset 0x85d, size 0x1
        bool droppedtagrespawn;
        // offset 0x85e, size 0x1
        bool voipkillershearvictim;
        // offset 0x85f, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x860, size 0x1
        bool presetclassesperteam;
        // offset 0x861, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x862, size 0x1
        bool hardcoremode;
        // offset 0x863, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x864, size 0x1
        bool useitemspawns;
        // offset 0x865, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x866, size 0x1
        bool silentplant;
        // offset 0x867, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x868, size 0x1
        bool drafteveryround;
        // offset 0x869, size 0x1
        bool timepauseswheninzone;
        // offset 0x86a, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x86b, size 0x1
        bool scoreperplayer;
        // offset 0x86c, size 0x1
        bool kothmode;
        // offset 0x86d, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x86e, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x86f, size 0x1
        bool decayprogress;
        // offset 0x870, size 0x1
        bool playerqueuedrespawn;
        // offset 0x871, size 0x1
        bool cumulativeroundscores;
        // offset 0x872, size 0x1
        bool voipdeadhearkiller;
        // offset 0x873, size 0x1
        bool usespawngroups;
        // offset 0x874, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x875, size 0x1
        bool allowbattlechatter;
        // offset 0x876, size 0x1
        bool fowrevealenabled;
        // offset 0x877, size 0x1
        bool disablecontracts;
        // offset 0x878, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x879, size 0x1
        bool allowannouncer;
        // offset 0x87a, size 0x1
        bool disallowaimslowdown;
        // offset 0x87b, size 0x1
        bool vehiclesenabled;
        // offset 0x87c, size 0x1
        bool decaycapturedzones;
        // offset 0x87d, size 0x1
        bool neutralzone;
        // offset 0x87e, size 0x1
        bool onlyheadshots;
        // offset 0x87f, size 0x1
        bool flagcapturecondition;
        // offset 0x880, size 0x1
        bool flagcanbeneutralized;
        // offset 0x881, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x882, size 0x1
        bool vehiclestimed;
        // offset 0x883, size 0x1
        bool pregamedraftenabled;
        // offset 0x884, size 0x1
        bool fogofwarminimap;
        // offset 0x885, size 0x1
        bool teamkillpointloss;
        // offset 0x886, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x887, size 0x1
        bool perksenabled;
        // offset 0x888, size 0x1
        bool allowmapscripting;
        // offset 0x889, size 0x1
        bool robotshield;
        // offset 0x88a, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x88b, size 0x1
        bool allowkillcam;
        // offset 0x88c, size 0x1
        bool disableattachments;
        // offset 0x88d, size 0x1
        bool disablecompass;
        // offset 0x88e, size 0x1
        bool disableweapondrop;
        // offset 0x88f, size 0x1
        bool escalationenabled;
        // offset 0x890, size 0x1
        bool disablecac;
        // offset 0x891, size 0x1
        bool disableclassselection;
        // offset 0x892, size 0x1
        bool hash_48670d9509071424;
        // offset 0x893, size 0x1
        bool autoteambalance;
        // offset 0x894, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x895, size 0x1
        bool allowplayofthematch;
        // offset 0x896, size 0x1
        bool allowprone;
        // offset 0x897, size 0x1
        bool scoreresetondeath;
        // offset 0x898, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x899, size 0x1
        bool playerforcerespawn;
        // offset 0x89a, size 0x1
        bool multibomb;
        // offset 0x89b, size 0x1
        bool deathcircle;
        // offset 0x89c, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x89d, size 0x1
        bool deathpointloss;
        // offset 0x89e, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x89f, size 0x1
        bool rebootplayers;
        // offset 0x8a0, size 0x1
        bool oldschoolmode;
        // offset 0x8a1, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x8a2, size 0x1
        bool allowfinalkillcam;
        // offset 0x8a3, size 0x1
        bool allowspectating;
        // offset 0x8a4, size 0x1
        bool usabledynents;
        // offset 0x8a5, size 0x1
        bool spawnselectenabled;
        // offset 0x8a6, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x8a7, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x8a8, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x8a9, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x8aa, size 0x1
        bool disallowprone;
        // offset 0x8ab, size 0x1
        bool moveplayers;
        // offset 0x8ac, size 0x1
        bool disabletacinsert;
        // offset 0x8ad, size 0x1
        bool voipdeadhearallliving;
        // offset 0x8ae, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x8af, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8b0, size 0x1
        bool use_doors;
        // offset 0x8b1, size 0x1
        bool pvponly;
        // offset 0x8b2, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8b3, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8b4, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8b5, size 0x1
        bool allowingameteamchange;
        // offset 0x8b6, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8b7, size 0x1
        bool deathzones;
        // offset 0x8b8, size 0x1
        bool classicmode;
        // offset 0x8b9, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8ba, size 0x1
        bool capdecay;
        // offset 0x8bb, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8bc, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8bd, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8be, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x8c0
    // offset 0x0, size 0x8c0
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_4b1e12e079e4ef59"

version 22 {
    // idx 1 members 268 size 0x8b0
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x70, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x80, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x88, size 0x8
        uint:6 maxteamplayers;
        // offset 0x90, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xa8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xb8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc0, size 0x8
        uint:6 preroundperiod;
        // offset 0xc8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xd0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xd8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xe0, size 0x8
        uint:7 maxplayers;
        // offset 0xe8, size 0x20
        int forwardspawnhealth;
        // offset 0x108, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x110, size 0x8
        uint:3 ballcount;
        // offset 0x118, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x128, size 0x8
        uint:3 gunselection;
        // offset 0x130, size 0x8
        uint:5 prematchrequirement;
        // offset 0x138, size 0x8
        uint:3 spectatetype;
        // offset 0x140, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x148, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x150, size 0x8
        uint:5 roundwinlimit;
        // offset 0x158, size 0x10
        uint:10 antiboostdistance;
        // offset 0x168, size 0x10
        uint:15 roundscorelimit;
        // offset 0x178, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x180, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x188, size 0x8
        fixed<8,2> defusetime;
        // offset 0x190, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x198, size 0x8
        uint:5 maxallocation;
        // offset 0x1a0, size 0x8
        uint:4 carryscore;
        // offset 0x1a8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1b0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1b8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1c0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1c8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1d0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1d8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x1e0, size 0x8
        uint:4 setbacks;
        // offset 0x1e8, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x208, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x218, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x228, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x238, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x248, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x258, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x268, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x270, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x278, size 0x10
        uint:15 scorelimit;
        // offset 0x288, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x290, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x298, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2a0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2a8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2b8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2c0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2c8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2d0, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x460, size 0x8
        uint:3 objectivepingtime;
        // offset 0x468, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x470, size 0x8
        uint:8 carrierarmor;
        // offset 0x478, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x480, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x488, size 0x10
        uint:9 carriermovespeed;
        // offset 0x498, size 0x8
        uint:5 boottime;
        // offset 0x4a0, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x4a8, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x4b0, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x4b8, size 0x8
        uint:7 teamnumlives;
        // offset 0x4c0, size 0x8
        fixed<8,2> planttime;
        // offset 0x4c8, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x4d0, size 0x10
        uint:10 inactivitykick;
        // offset 0x4e0, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x4e8, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x4f0, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x500, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x510, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x520, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x530, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x540, size 0x10
        fixed<10,2> destroytime;
        // offset 0x550, size 0x8
        uint:7 flagrespawntime;
        // offset 0x558, size 0x8
        uint:2 shutdowndamage;
        // offset 0x560, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x568, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x570, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x578, size 0x10
        uint:11 objectivehealth;
        // offset 0x588, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x590, size 0x8
        uint:2 robotspeed;
        // offset 0x598, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x5a0, size 0x8
        uint:7 servermsec;
        // offset 0x5a8, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x5b0, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x5c0, size 0x10
        uint:10 leaderbonus;
        // offset 0x5d0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x5d8, size 0x10
        uint:9 autodestroytime;
        // offset 0x5e8, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x5f0, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x5f8, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x600, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x608, size 0x8
        uint:6 prematchperiod;
        // offset 0x610, size 0x8
        uint:6 teamkillscore;
        // offset 0x618, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x620, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x628, size 0x20
        int deployablebarrierhealth;
        // offset 0x648, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x650, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x658, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x660, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x668, size 0x8
        uint:7 playernumlives;
        // offset 0x670, size 0x8
        uint:2 infectionmode;
        // offset 0x678, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x680, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x688, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x690, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x698, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x6a0, size 0x8
        uint:6 reboottime;
        // offset 0x6a8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x6b0, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x6b8, size 0x8
        uint:4 pickuptime;
        // offset 0x6c0, size 0x20
        int hash_64727525f5957d06;
        // offset 0x6e0, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x700, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x708, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x710, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x718, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x720, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x728, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x738, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x740, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x748, size 0x8
        uint:7 startplayers;
        // offset 0x750, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x758, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x760, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x768, size 0x8
        uint:5 totalkillsmax;
        // offset 0x770, size 0x8
        uint:4 roundswitch;
        // offset 0x778, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x780, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x788, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x790, size 0x8
        uint:5 weaponcount;
        // offset 0x798, size 0x8
        uint:7 weapontimer;
        // offset 0x7a0, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x7b0, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x7b8, size 0x8
        uint:7 drafttime;
        // offset 0x7c0, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x7c8, size 0x8
        uint:7 objectivespawntime;
        // offset 0x7d0, size 0x8
        uint:4 throwscore;
        // offset 0x7d8, size 0x8
        uint:4 deposittime;
        // offset 0x7e0, size 0x10
        fixed<10,2> extratime;
        // offset 0x7f0, size 0x8
        uint:7 teamcount;
        // offset 0x7f8, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x818, size 0x8
        uint:4 roundlimit;
        // offset 0x820, size 0x8
        uint:2 charactercustomization;
        // offset 0x828, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x830, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x838, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x848, size 0x1
        bool delayplayer;
        // offset 0x849, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x84a, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x84b, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x84c, size 0x1
        bool draftenabled;
        // offset 0x84d, size 0x1
        bool droppedtagrespawn;
        // offset 0x84e, size 0x1
        bool voipkillershearvictim;
        // offset 0x84f, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x850, size 0x1
        bool presetclassesperteam;
        // offset 0x851, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x852, size 0x1
        bool hardcoremode;
        // offset 0x853, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x854, size 0x1
        bool useitemspawns;
        // offset 0x855, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x856, size 0x1
        bool silentplant;
        // offset 0x857, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x858, size 0x1
        bool drafteveryround;
        // offset 0x859, size 0x1
        bool timepauseswheninzone;
        // offset 0x85a, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x85b, size 0x1
        bool scoreperplayer;
        // offset 0x85c, size 0x1
        bool kothmode;
        // offset 0x85d, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x85e, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x85f, size 0x1
        bool decayprogress;
        // offset 0x860, size 0x1
        bool playerqueuedrespawn;
        // offset 0x861, size 0x1
        bool cumulativeroundscores;
        // offset 0x862, size 0x1
        bool voipdeadhearkiller;
        // offset 0x863, size 0x1
        bool usespawngroups;
        // offset 0x864, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x865, size 0x1
        bool allowbattlechatter;
        // offset 0x866, size 0x1
        bool fowrevealenabled;
        // offset 0x867, size 0x1
        bool disablecontracts;
        // offset 0x868, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x869, size 0x1
        bool allowannouncer;
        // offset 0x86a, size 0x1
        bool disallowaimslowdown;
        // offset 0x86b, size 0x1
        bool vehiclesenabled;
        // offset 0x86c, size 0x1
        bool decaycapturedzones;
        // offset 0x86d, size 0x1
        bool neutralzone;
        // offset 0x86e, size 0x1
        bool onlyheadshots;
        // offset 0x86f, size 0x1
        bool flagcapturecondition;
        // offset 0x870, size 0x1
        bool flagcanbeneutralized;
        // offset 0x871, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x872, size 0x1
        bool vehiclestimed;
        // offset 0x873, size 0x1
        bool pregamedraftenabled;
        // offset 0x874, size 0x1
        bool fogofwarminimap;
        // offset 0x875, size 0x1
        bool teamkillpointloss;
        // offset 0x876, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x877, size 0x1
        bool perksenabled;
        // offset 0x878, size 0x1
        bool allowmapscripting;
        // offset 0x879, size 0x1
        bool robotshield;
        // offset 0x87a, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x87b, size 0x1
        bool allowkillcam;
        // offset 0x87c, size 0x1
        bool disableattachments;
        // offset 0x87d, size 0x1
        bool disablecompass;
        // offset 0x87e, size 0x1
        bool disableweapondrop;
        // offset 0x87f, size 0x1
        bool escalationenabled;
        // offset 0x880, size 0x1
        bool disablecac;
        // offset 0x881, size 0x1
        bool disableclassselection;
        // offset 0x882, size 0x1
        bool hash_48670d9509071424;
        // offset 0x883, size 0x1
        bool autoteambalance;
        // offset 0x884, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x885, size 0x1
        bool allowplayofthematch;
        // offset 0x886, size 0x1
        bool allowprone;
        // offset 0x887, size 0x1
        bool scoreresetondeath;
        // offset 0x888, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x889, size 0x1
        bool playerforcerespawn;
        // offset 0x88a, size 0x1
        bool multibomb;
        // offset 0x88b, size 0x1
        bool deathcircle;
        // offset 0x88c, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x88d, size 0x1
        bool deathpointloss;
        // offset 0x88e, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x88f, size 0x1
        bool rebootplayers;
        // offset 0x890, size 0x1
        bool oldschoolmode;
        // offset 0x891, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x892, size 0x1
        bool allowfinalkillcam;
        // offset 0x893, size 0x1
        bool allowspectating;
        // offset 0x894, size 0x1
        bool usabledynents;
        // offset 0x895, size 0x1
        bool spawnselectenabled;
        // offset 0x896, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x897, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x898, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x899, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x89a, size 0x1
        bool disallowprone;
        // offset 0x89b, size 0x1
        bool moveplayers;
        // offset 0x89c, size 0x1
        bool disabletacinsert;
        // offset 0x89d, size 0x1
        bool voipdeadhearallliving;
        // offset 0x89e, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x89f, size 0x1
        bool flagcapturerateincrease;
        // offset 0x8a0, size 0x1
        bool use_doors;
        // offset 0x8a1, size 0x1
        bool pvponly;
        // offset 0x8a2, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x8a3, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x8a4, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x8a5, size 0x1
        bool allowingameteamchange;
        // offset 0x8a6, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x8a7, size 0x1
        bool deathzones;
        // offset 0x8a8, size 0x1
        bool classicmode;
        // offset 0x8a9, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x8aa, size 0x1
        bool capdecay;
        // offset 0x8ab, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x8ac, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x8ad, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x8ae, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x8b0
    // offset 0x0, size 0x8b0
    gametypesettings gametypesettings;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_gametype_settings.ddl
// metatable "hash_f8658556f200f9d2"

version 21 {
    // idx 1 members 268 size 0x810
    struct gametypesettings {
        // offset 0x0, size 0x8
        fixed<8,2> timelimit;
        // offset 0x8, size 0x8
        uint:4 playerkillsmax;
        // offset 0x10, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x18, size 0x8
        uint:2 forceradar;
        // offset 0x20, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x28, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x30, size 0x10
        fixed<10,2> capturetime;
        // offset 0x40, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x48, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x50, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x70, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0x80, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0x88, size 0x8
        uint:6 maxteamplayers;
        // offset 0x90, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xa0, size 0x8
        uint:4 draftrequiredclients;
        // offset 0xa8, size 0x8
        uint:2 friendlyfiretype;
        // offset 0xb0, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0xb8, size 0x8
        uint:5 pointspermeleekill;
        // offset 0xc0, size 0x8
        uint:6 preroundperiod;
        // offset 0xc8, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0xd0, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0xd8, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0xe0, size 0x8
        uint:7 maxplayers;
        // offset 0xe8, size 0x20
        int forwardspawnhealth;
        // offset 0x108, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x110, size 0x8
        uint:3 ballcount;
        // offset 0x118, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x128, size 0x8
        uint:3 gunselection;
        // offset 0x130, size 0x8
        uint:5 prematchrequirement;
        // offset 0x138, size 0x8
        uint:3 spectatetype;
        // offset 0x140, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x148, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x150, size 0x8
        uint:5 roundwinlimit;
        // offset 0x158, size 0x10
        uint:10 antiboostdistance;
        // offset 0x168, size 0x10
        uint:15 roundscorelimit;
        // offset 0x178, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x180, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x188, size 0x8
        fixed<8,2> defusetime;
        // offset 0x190, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x198, size 0x8
        uint:5 maxallocation;
        // offset 0x1a0, size 0x8
        uint:4 carryscore;
        // offset 0x1a8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x1b0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x1b8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x1c0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x1c8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x1d0, size 0x8
        uint:7 idleflagresettime;
        // offset 0x1d8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x1e0, size 0x8
        uint:4 setbacks;
        // offset 0x1e8, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x208, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x218, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x228, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x238, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x248, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x258, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x268, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x270, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x278, size 0x10
        uint:15 scorelimit;
        // offset 0x288, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x290, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x298, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x2a0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x2a8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x2b8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x2c0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x2c8, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x2d0, size 0xf0
        uint:5 maxuniquerolesperteam[30];
        // offset 0x3c0, size 0x8
        uint:3 objectivepingtime;
        // offset 0x3c8, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x3d0, size 0x8
        uint:8 carrierarmor;
        // offset 0x3d8, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x3e0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x3e8, size 0x10
        uint:9 carriermovespeed;
        // offset 0x3f8, size 0x8
        uint:5 boottime;
        // offset 0x400, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x408, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x410, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x418, size 0x8
        uint:7 teamnumlives;
        // offset 0x420, size 0x8
        fixed<8,2> planttime;
        // offset 0x428, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x430, size 0x10
        uint:10 inactivitykick;
        // offset 0x440, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x448, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x450, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x460, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x470, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x480, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x490, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x4a0, size 0x10
        fixed<10,2> destroytime;
        // offset 0x4b0, size 0x8
        uint:7 flagrespawntime;
        // offset 0x4b8, size 0x8
        uint:2 shutdowndamage;
        // offset 0x4c0, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x4c8, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x4d0, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x4d8, size 0x10
        uint:11 objectivehealth;
        // offset 0x4e8, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x4f0, size 0x8
        uint:2 robotspeed;
        // offset 0x4f8, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x500, size 0x8
        uint:7 servermsec;
        // offset 0x508, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x510, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x520, size 0x10
        uint:10 leaderbonus;
        // offset 0x530, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x538, size 0x10
        uint:9 autodestroytime;
        // offset 0x548, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x550, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x558, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x560, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x568, size 0x8
        uint:6 prematchperiod;
        // offset 0x570, size 0x8
        uint:6 teamkillscore;
        // offset 0x578, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x580, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x588, size 0x20
        int deployablebarrierhealth;
        // offset 0x5a8, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x5b0, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x5b8, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x5c0, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x5c8, size 0x8
        uint:7 playernumlives;
        // offset 0x5d0, size 0x8
        uint:2 infectionmode;
        // offset 0x5d8, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x5e0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x5e8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x5f0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x5f8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x600, size 0x8
        uint:6 reboottime;
        // offset 0x608, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x610, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x618, size 0x8
        uint:4 pickuptime;
        // offset 0x620, size 0x20
        int hash_64727525f5957d06;
        // offset 0x640, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x660, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x668, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x670, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x678, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x680, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x688, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x698, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x6a0, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x6a8, size 0x8
        uint:7 startplayers;
        // offset 0x6b0, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0x6b8, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0x6c0, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0x6c8, size 0x8
        uint:5 totalkillsmax;
        // offset 0x6d0, size 0x8
        uint:4 roundswitch;
        // offset 0x6d8, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0x6e0, size 0x8
        uint:4 teamkillpenalty;
        // offset 0x6e8, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0x6f0, size 0x8
        uint:5 weaponcount;
        // offset 0x6f8, size 0x8
        uint:7 weapontimer;
        // offset 0x700, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0x710, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0x718, size 0x8
        uint:7 drafttime;
        // offset 0x720, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0x728, size 0x8
        uint:7 objectivespawntime;
        // offset 0x730, size 0x8
        uint:4 throwscore;
        // offset 0x738, size 0x8
        uint:4 deposittime;
        // offset 0x740, size 0x10
        fixed<10,2> extratime;
        // offset 0x750, size 0x8
        uint:7 teamcount;
        // offset 0x758, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0x778, size 0x8
        uint:4 roundlimit;
        // offset 0x780, size 0x8
        uint:2 charactercustomization;
        // offset 0x788, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0x790, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0x798, size 0x10
        fixed<10,2> bombtimer;
        // offset 0x7a8, size 0x1
        bool delayplayer;
        // offset 0x7a9, size 0x1
        bool voipdeadchatwithdead;
        // offset 0x7aa, size 0x1
        bool voipdeadchatwithteam;
        // offset 0x7ab, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0x7ac, size 0x1
        bool draftenabled;
        // offset 0x7ad, size 0x1
        bool droppedtagrespawn;
        // offset 0x7ae, size 0x1
        bool voipkillershearvictim;
        // offset 0x7af, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0x7b0, size 0x1
        bool presetclassesperteam;
        // offset 0x7b1, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0x7b2, size 0x1
        bool hardcoremode;
        // offset 0x7b3, size 0x1
        bool hash_495b64bd935bf7b;
        // offset 0x7b4, size 0x1
        bool useitemspawns;
        // offset 0x7b5, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0x7b6, size 0x1
        bool silentplant;
        // offset 0x7b7, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0x7b8, size 0x1
        bool drafteveryround;
        // offset 0x7b9, size 0x1
        bool timepauseswheninzone;
        // offset 0x7ba, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0x7bb, size 0x1
        bool scoreperplayer;
        // offset 0x7bc, size 0x1
        bool kothmode;
        // offset 0x7bd, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0x7be, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0x7bf, size 0x1
        bool decayprogress;
        // offset 0x7c0, size 0x1
        bool playerqueuedrespawn;
        // offset 0x7c1, size 0x1
        bool cumulativeroundscores;
        // offset 0x7c2, size 0x1
        bool voipdeadhearkiller;
        // offset 0x7c3, size 0x1
        bool usespawngroups;
        // offset 0x7c4, size 0x1
        bool disablethirdpersonspectating;
        // offset 0x7c5, size 0x1
        bool allowbattlechatter;
        // offset 0x7c6, size 0x1
        bool fowrevealenabled;
        // offset 0x7c7, size 0x1
        bool disablecontracts;
        // offset 0x7c8, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0x7c9, size 0x1
        bool allowannouncer;
        // offset 0x7ca, size 0x1
        bool disallowaimslowdown;
        // offset 0x7cb, size 0x1
        bool vehiclesenabled;
        // offset 0x7cc, size 0x1
        bool decaycapturedzones;
        // offset 0x7cd, size 0x1
        bool neutralzone;
        // offset 0x7ce, size 0x1
        bool onlyheadshots;
        // offset 0x7cf, size 0x1
        bool flagcapturecondition;
        // offset 0x7d0, size 0x1
        bool flagcanbeneutralized;
        // offset 0x7d1, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0x7d2, size 0x1
        bool vehiclestimed;
        // offset 0x7d3, size 0x1
        bool pregamedraftenabled;
        // offset 0x7d4, size 0x1
        bool fogofwarminimap;
        // offset 0x7d5, size 0x1
        bool teamkillpointloss;
        // offset 0x7d6, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0x7d7, size 0x1
        bool perksenabled;
        // offset 0x7d8, size 0x1
        bool allowmapscripting;
        // offset 0x7d9, size 0x1
        bool robotshield;
        // offset 0x7da, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0x7db, size 0x1
        bool allowkillcam;
        // offset 0x7dc, size 0x1
        bool disableattachments;
        // offset 0x7dd, size 0x1
        bool disablecompass;
        // offset 0x7de, size 0x1
        bool disableweapondrop;
        // offset 0x7df, size 0x1
        bool escalationenabled;
        // offset 0x7e0, size 0x1
        bool disablecac;
        // offset 0x7e1, size 0x1
        bool disableclassselection;
        // offset 0x7e2, size 0x1
        bool hash_48670d9509071424;
        // offset 0x7e3, size 0x1
        bool autoteambalance;
        // offset 0x7e4, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0x7e5, size 0x1
        bool allowplayofthematch;
        // offset 0x7e6, size 0x1
        bool allowprone;
        // offset 0x7e7, size 0x1
        bool scoreresetondeath;
        // offset 0x7e8, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0x7e9, size 0x1
        bool playerforcerespawn;
        // offset 0x7ea, size 0x1
        bool multibomb;
        // offset 0x7eb, size 0x1
        bool deathcircle;
        // offset 0x7ec, size 0x1
        bool hash_72a2919d2ac65850;
        // offset 0x7ed, size 0x1
        bool deathpointloss;
        // offset 0x7ee, size 0x1
        bool hash_1260b639348098e3;
        // offset 0x7ef, size 0x1
        bool rebootplayers;
        // offset 0x7f0, size 0x1
        bool oldschoolmode;
        // offset 0x7f1, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0x7f2, size 0x1
        bool allowfinalkillcam;
        // offset 0x7f3, size 0x1
        bool allowspectating;
        // offset 0x7f4, size 0x1
        bool usabledynents;
        // offset 0x7f5, size 0x1
        bool spawnselectenabled;
        // offset 0x7f6, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0x7f7, size 0x1
        bool pregameitemvoteenabled;
        // offset 0x7f8, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0x7f9, size 0x1
        bool hash_7f273e367f26254;
        // offset 0x7fa, size 0x1
        bool disallowprone;
        // offset 0x7fb, size 0x1
        bool moveplayers;
        // offset 0x7fc, size 0x1
        bool disabletacinsert;
        // offset 0x7fd, size 0x1
        bool voipdeadhearallliving;
        // offset 0x7fe, size 0x1
        bool killstreaksgivegamescore;
        // offset 0x7ff, size 0x1
        bool flagcapturerateincrease;
        // offset 0x800, size 0x1
        bool use_doors;
        // offset 0x801, size 0x1
        bool pvponly;
        // offset 0x802, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0x803, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0x804, size 0x1
        bool forwardspawntakesdamage;
        // offset 0x805, size 0x1
        bool allowingameteamchange;
        // offset 0x806, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0x807, size 0x1
        bool deathzones;
        // offset 0x808, size 0x1
        bool classicmode;
        // offset 0x809, size 0x1
        bool voipdeadhearteamliving;
        // offset 0x80a, size 0x1
        bool capdecay;
        // offset 0x80b, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0x80c, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0x80d, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0x80e, size 0x2
        uint:1 __pad[2];
    };

    // idx 0 members 1 size 0x810
    // offset 0x0, size 0x810
    gametypesettings gametypesettings;
}

