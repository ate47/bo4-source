// gamedata/ddl/generated/zm_match_record.ddl
// metatable "hash_c7b0a4556161506f"

version 223 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9508
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x10
        int:12 weaponindex;
        // offset 0x94e8, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:12 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2310
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1a40
        hash_768aeb6b928320d outfit_breadcrumbs[35];
        // offset 0x1a50, size 0x8c0
        hash_32aeae7311d2cd9b hash_e5c77948998e49[35];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:11 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x401c0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x3d5c0
        character characters[28];
        // offset 0x3d650, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x3e050, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x3e058, size 0x1860
        zmloadout customclass[10];
        // offset 0x3f8b8, size 0x500
        string(16) customclassname[10];
        // offset 0x3fdb8, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x401b8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x401b9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x401ba, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x401bb, size 0x5
        uint:1 __pad[5];
    };

    // idx 21 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 22 members 3 size 0xc0
    struct client_header {
        // offset 0x0, size 0x40
        uint64 hash_4016bed15f9183f7;
        // offset 0x40, size 0x40
        uint64 uno_id;
        // offset 0x80, size 0x40
        uint64 user_id;
    };

    // idx 23 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 24 members 551 size 0xca0
    struct gametypesettings {
        // offset 0x0, size 0x8
        uint:2 zmpowerdoorstate;
        // offset 0x8, size 0x8
        fixed<8,2> timelimit;
        // offset 0x10, size 0x8
        uint:4 playerkillsmax;
        // offset 0x18, size 0x8
        uint:5 teamscoreperdeath;
        // offset 0x20, size 0x8
        uint:2 forceradar;
        // offset 0x28, size 0x8
        uint:5 teamscoreperkill;
        // offset 0x30, size 0x8
        fixed<8,2> playersprinttime;
        // offset 0x38, size 0x10
        fixed<10,2> capturetime;
        // offset 0x48, size 0x8
        uint:5 gameadvertisementruleroundswon;
        // offset 0x50, size 0x8
        uint:7 zmmysteryboxlimit;
        // offset 0x58, size 0x8
        uint:8 maxplayerdefensive;
        // offset 0x60, size 0x8
        uint:2 zmmysteryboxstate;
        // offset 0x68, size 0x8
        fixed<8,7> hash_35e9fc8eee6881e0;
        // offset 0x70, size 0x8
        uint:8 hash_613785a993624133;
        // offset 0x78, size 0x20
        int deployablebarrierdestroytime;
        // offset 0x98, size 0x10
        uint:16 hash_6024ee628431415;
        // offset 0xa8, size 0x20
        uint zmpapenabled;
        // offset 0xc8, size 0x8
        uint:5 pointsperweaponkill;
        // offset 0xd0, size 0x8
        uint:6 maxteamplayers;
        // offset 0xd8, size 0x8
        uint:2 zmenhancedstate;
        // offset 0xe0, size 0x8
        uint:2 zmrandomwallbuys;
        // offset 0xe8, size 0x10
        fixed<10,2> hash_1ca4d65346568642;
        // offset 0xf8, size 0x8
        uint:4 draftrequiredclients;
        // offset 0x100, size 0x8
        uint:2 friendlyfiretype;
        // offset 0x108, size 0x8
        uint:2 zmdoorstate;
        // offset 0x110, size 0x10
        uint:16 zmkillcap;
        // offset 0x120, size 0x8
        uint:7 hash_16184f2fd4014b39;
        // offset 0x128, size 0x8
        uint:5 pointspermeleekill;
        // offset 0x130, size 0x8
        uint:5 hash_32da91b78e54e7b5;
        // offset 0x138, size 0x8
        uint:6 preroundperiod;
        // offset 0x140, size 0x8
        fixed<8,6> scoreheropowertimefactor;
        // offset 0x148, size 0x8
        uint:5 hash_62a4fd40810cb61;
        // offset 0x150, size 0x8
        uint:7 zmpointlossonteammatedeath;
        // offset 0x158, size 0x8
        fixed<6,2> laststandrevivetime;
        // offset 0x160, size 0x8
        uint:4 teamkillpunishcount;
        // offset 0x168, size 0x8
        uint:7 maxplayers;
        // offset 0x170, size 0x20
        int forwardspawnhealth;
        // offset 0x190, size 0x8
        uint:6 spawnteamkilledpenalty;
        // offset 0x198, size 0x8
        uint:3 ballcount;
        // offset 0x1a0, size 0x8
        uint:6 hash_6ae29c8144cb7659;
        // offset 0x1a8, size 0x10
        uint:10 hash_3c82ffb472a21cac;
        // offset 0x1b8, size 0x8
        uint:3 gunselection;
        // offset 0x1c0, size 0x8
        fixed<5,2> hash_1614b9cbe0df6f75;
        // offset 0x1c8, size 0x8
        uint:7 maxbots;
        // offset 0x1d0, size 0x8
        uint:2 zmheavydamagemult;
        // offset 0x1d8, size 0x8
        uint:2 hash_23d7891cf2b9471c;
        // offset 0x1e0, size 0x8
        uint:5 prematchrequirement;
        // offset 0x1e8, size 0x8
        uint:3 spectatetype;
        // offset 0x1f0, size 0x8
        fixed<6,2> hash_57fe6337297bcce9;
        // offset 0x1f8, size 0x8
        fixed<8,7> hash_1df445b9d1af641f;
        // offset 0x200, size 0x8
        uint:2 randomobjectivelocations;
        // offset 0x208, size 0x8
        uint:5 roundwinlimit;
        // offset 0x210, size 0x8
        uint:5 hash_ecf2124e9108fc4;
        // offset 0x218, size 0x10
        uint:10 antiboostdistance;
        // offset 0x228, size 0x8
        uint:2 zmzombieminspeed;
        // offset 0x230, size 0x10
        uint:15 roundscorelimit;
        // offset 0x240, size 0x8
        uint:2 zmpopcorndamagemult;
        // offset 0x248, size 0x8
        uint:2 zmhealthregendelay;
        // offset 0x250, size 0x10
        fixed<10,4> hash_154db5a1b2e9d757;
        // offset 0x260, size 0x8
        fixed<8,4> bulletdamagescalar;
        // offset 0x268, size 0x8
        uint:2 zmrunnerstate;
        // offset 0x270, size 0x8
        uint:7 ticketslostontimeamount;
        // offset 0x278, size 0x8
        fixed<8,2> defusetime;
        // offset 0x280, size 0x8
        uint:2 platoonassignment;
        // offset 0x288, size 0x8
        fixed<8,4> teamkillreducedpenalty;
        // offset 0x290, size 0x8
        uint:5 maxallocation;
        // offset 0x298, size 0x8
        uint:2 zmzombiespread;
        // offset 0x2a0, size 0x8
        uint:4 carryscore;
        // offset 0x2a8, size 0x8
        uint:4 hash_6e49ce7bbe6d3f1f;
        // offset 0x2b0, size 0x8
        fixed<8,2> killeventscoremultiplier;
        // offset 0x2b8, size 0x8
        uint:6 ticketslostontimeinterval;
        // offset 0x2c0, size 0x8
        fixed<8,2> roundstartexplosivedelay;
        // offset 0x2c8, size 0x8
        uint:2 cleandepositrotation;
        // offset 0x2d0, size 0x8
        uint:2 zmcrawlerdamagemult;
        // offset 0x2d8, size 0x8
        uint:7 idleflagresettime;
        // offset 0x2e0, size 0x8
        uint:2 zmhealthonkill;
        // offset 0x2e8, size 0x8
        fixed<8,6> scoreheropowergainfactor;
        // offset 0x2f0, size 0x8
        uint:4 setbacks;
        // offset 0x2f8, size 0x20
        int hash_6b808ab4016cb1e1;
        // offset 0x318, size 0x8
        uint:2 zmzombiehealthmult;
        // offset 0x320, size 0x10
        uint:10 hash_70e1efac5fcdfa4f;
        // offset 0x330, size 0x10
        uint:10 hash_70e1eeac5fcdf89c;
        // offset 0x340, size 0x10
        uint:10 hash_70e1f1ac5fcdfdb5;
        // offset 0x350, size 0x10
        uint:10 hash_70e1f0ac5fcdfc02;
        // offset 0x360, size 0x10
        uint:10 hash_70e1ebac5fcdf383;
        // offset 0x370, size 0x10
        fixed<12,4> trm_maxheight;
        // offset 0x380, size 0x8
        uint:7 hash_2b88c6ac064e9c59;
        // offset 0x388, size 0x8
        uint:4 maxplayofthematchevents;
        // offset 0x390, size 0x8
        uint:2 zmequipmentchargerate;
        // offset 0x398, size 0x10
        uint:15 scorelimit;
        // offset 0x3a8, size 0x8
        fixed<8,2> cratecapturetime;
        // offset 0x3b0, size 0x8
        uint:5 hash_4a6ef8940f4cbb83;
        // offset 0x3b8, size 0x8
        uint:2 zmpowerupfrequency;
        // offset 0x3c0, size 0x8
        uint:3 killpointsinenemyprotectedzone;
        // offset 0x3c8, size 0x8
        uint:2 zmminibossspawnfreq;
        // offset 0x3d0, size 0x8
        uint:5 hash_6e2b8452b08a545c;
        // offset 0x3d8, size 0x10
        uint:10 playermaxhealth;
        // offset 0x3e8, size 0x8
        uint:7 hash_1833c853bfe78ffc;
        // offset 0x3f0, size 0x8
        uint:5 hash_66a7d866327081eb;
        // offset 0x3f8, size 0x8
        uint:2 zmshielddurability;
        // offset 0x400, size 0x8
        uint:2 zmenhancedhealthmult;
        // offset 0x408, size 0x10
        uint:14 zmpointslossvalue;
        // offset 0x418, size 0x8
        uint:5 pointsforsurvivalbonus;
        // offset 0x420, size 0x8
        uint:2 zmspecweaponchargerate;
        // offset 0x428, size 0x190
        uint:5 maxuniquerolesperteam[50];
        // offset 0x5b8, size 0x8
        uint:6 hash_7adb62a64c6d963;
        // offset 0x5c0, size 0x8
        uint:3 objectivepingtime;
        // offset 0x5c8, size 0x8
        uint:5 teamkillspawndelay;
        // offset 0x5d0, size 0x8
        uint:8 carrierarmor;
        // offset 0x5d8, size 0x8
        uint:7 ticketslostondeath;
        // offset 0x5e0, size 0x8
        uint:2 hash_47d4aa0161d78e15;
        // offset 0x5e8, size 0x8
        uint:2 zmcrawlerstate;
        // offset 0x5f0, size 0x10
        uint:9 carriermovespeed;
        // offset 0x600, size 0x8
        uint:5 boottime;
        // offset 0x608, size 0x8
        uint:2 zmenhancedspawnfreq;
        // offset 0x610, size 0x8
        fixed<8,2> hash_314c2f7312bde4af;
        // offset 0x618, size 0x8
        uint:6 hash_5d5f4ee35c9977c7;
        // offset 0x620, size 0x8
        uint:2 roundstartfriendlyfiretype;
        // offset 0x628, size 0x8
        uint:7 hash_49f4e3b6cf493d7e;
        // offset 0x630, size 0x8
        uint:7 hash_26b08269156ca0e5;
        // offset 0x638, size 0x8
        uint:7 teamnumlives;
        // offset 0x640, size 0x8
        fixed<8,2> planttime;
        // offset 0x648, size 0x8
        uint:6 spawnprotectiontime;
        // offset 0x650, size 0x8
        uint:2 zmlaststandduration;
        // offset 0x658, size 0x10
        uint:10 inactivitykick;
        // offset 0x668, size 0x8
        uint:5 pointspersecondarykill;
        // offset 0x670, size 0x10
        uint:10 zmpointsstarting;
        // offset 0x680, size 0x8
        fixed<8,2> playerhealthregentime;
        // offset 0x688, size 0x8
        uint:2 zmpopcornspawnfreq;
        // offset 0x690, size 0x10
        uint:10 hash_12ce5d40d1f9fb7f;
        // offset 0x6a0, size 0x10
        uint:10 hash_12ce5c40d1f9f9cc;
        // offset 0x6b0, size 0x10
        uint:10 hash_12ce5f40d1f9fee5;
        // offset 0x6c0, size 0x10
        uint:10 hash_12ce5e40d1f9fd32;
        // offset 0x6d0, size 0x10
        uint:10 hash_12ce5940d1f9f4b3;
        // offset 0x6e0, size 0x8
        uint:4 zmmysteryboxlimitmove;
        // offset 0x6e8, size 0x10
        fixed<10,2> destroytime;
        // offset 0x6f8, size 0x8
        uint:7 flagrespawntime;
        // offset 0x700, size 0x8
        uint:2 shutdowndamage;
        // offset 0x708, size 0x8
        fixed<8,2> gameadvertisementruletimeleft;
        // offset 0x710, size 0x8
        uint:7 zmpointlossondeath;
        // offset 0x718, size 0x8
        uint:8 hash_6a48bbfb703d5c9c;
        // offset 0x720, size 0x8
        uint:4 hash_239b391c77ebf8c1;
        // offset 0x728, size 0x8
        uint:5 zmpowerupslimitround;
        // offset 0x730, size 0x10
        uint:11 objectivehealth;
        // offset 0x740, size 0x8
        uint:6 spawnsuicidepenalty;
        // offset 0x748, size 0x8
        uint:7 zmroundcap;
        // offset 0x750, size 0x8
        uint:2 hash_37698d5973834ce8;
        // offset 0x758, size 0x8
        uint:2 robotspeed;
        // offset 0x760, size 0x8
        uint:3 hash_467be34402dad274;
        // offset 0x768, size 0x8
        uint:3 hash_68e3f54e05f57d85;
        // offset 0x770, size 0x8
        uint:2 zmperkdecay;
        // offset 0x778, size 0x8
        uint:7 servermsec;
        // offset 0x780, size 0x8
        uint:6 hash_410c5c7c1e60b534;
        // offset 0x788, size 0x8
        uint:4 hash_552338718ec6d2df;
        // offset 0x790, size 0x10
        fixed<9,3> maxplayereventsperminute;
        // offset 0x7a0, size 0x10
        uint:10 leaderbonus;
        // offset 0x7b0, size 0x8
        uint:5 hash_5c918cbf75e16116;
        // offset 0x7b8, size 0x8
        uint:3 hash_51e989796c38cd87;
        // offset 0x7c0, size 0x8
        uint:2 enemycarriervisible;
        // offset 0x7c8, size 0x8
        uint:2 zmminibosshealthmult;
        // offset 0x7d0, size 0x10
        uint:9 autodestroytime;
        // offset 0x7e0, size 0x8
        uint:5 teamscoreperkillconfirmed;
        // offset 0x7e8, size 0x8
        uint:5 hash_4e4352bd1aaeedfe;
        // offset 0x7f0, size 0x8
        fixed<8,2> waverespawndelay;
        // offset 0x7f8, size 0x8
        uint:2 zmpowerstate;
        // offset 0x800, size 0x8
        uint:6 startround;
        // offset 0x808, size 0x8
        uint:5 hash_567db38226658dbf;
        // offset 0x810, size 0x8
        uint:6 prematchperiod;
        // offset 0x818, size 0x8
        uint:6 teamkillscore;
        // offset 0x820, size 0x8
        uint:5 hash_102aeddad113f70c;
        // offset 0x828, size 0x8
        uint:4 zmmysteryboxlimitround;
        // offset 0x830, size 0x8
        uint:4 hash_4635a26c94b56725;
        // offset 0x838, size 0x8
        uint:3 platooncount;
        // offset 0x840, size 0x8
        uint:3 zmhealthregenrate;
        // offset 0x848, size 0x8
        uint:2 zmzombiemaxspeed;
        // offset 0x850, size 0x20
        int deployablebarrierhealth;
        // offset 0x870, size 0x8
        uint:5 pointsperprimarykill;
        // offset 0x878, size 0x8
        uint:5 teamscoreperheadshot;
        // offset 0x880, size 0x8
        uint:7 hash_1908ad844e6c3e37;
        // offset 0x888, size 0x8
        uint:4 pregameitemmaxvotes;
        // offset 0x890, size 0x8
        uint:7 playernumlives;
        // offset 0x898, size 0x8
        uint:2 infectionmode;
        // offset 0x8a0, size 0x8
        uint:5 gameadvertisementruleround;
        // offset 0x8a8, size 0x8
        uint:2 zmzombiedamagemult;
        // offset 0x8b0, size 0x8
        fixed<7,1> incrementalspawndelay;
        // offset 0x8b8, size 0x8
        uint:5 maxsuicidesbeforekick;
        // offset 0x8c0, size 0x8
        uint:7 gameadvertisementrulescorepercent;
        // offset 0x8c8, size 0x8
        uint:2 zmpopcornstate;
        // offset 0x8d0, size 0x8
        uint:2 zmwalkerstate;
        // offset 0x8d8, size 0x8
        fixed<8,6> hash_47e9736d437be7c8;
        // offset 0x8e0, size 0x8
        uint:6 reboottime;
        // offset 0x8e8, size 0x8
        uint:5 teamscorepercleandeposit;
        // offset 0x8f0, size 0x8
        uint:2 zmpointslosstype;
        // offset 0x8f8, size 0x8
        uint:3 zmhealthstartingbars;
        // offset 0x900, size 0x8
        uint:7 zmselfreviveamount;
        // offset 0x908, size 0x8
        uint:8 hash_2849b6cf7317ab1b;
        // offset 0x910, size 0x8
        uint:2 zmelixirscooldown;
        // offset 0x918, size 0x8
        uint:2 zmheavyspawnfreq;
        // offset 0x920, size 0x8
        uint:4 pickuptime;
        // offset 0x928, size 0x10
        fixed<14,7> hash_451245a24412d90f;
        // offset 0x938, size 0x20
        int hash_64727525f5957d06;
        // offset 0x958, size 0x8
        uint:7 zmpointslosspercent;
        // offset 0x960, size 0x20
        int hash_1f3285ddee84620c;
        // offset 0x980, size 0x8
        uint:5 hash_3767386c050fa0eb;
        // offset 0x988, size 0x8
        uint:2 hash_f370576ccd22b54;
        // offset 0x990, size 0x8
        fixed<8,2> playerrespawndelay;
        // offset 0x998, size 0x8
        fixed<8,2> spawntraptriggertime;
        // offset 0x9a0, size 0x8
        uint:8 maxplayeroffensive;
        // offset 0x9a8, size 0x8
        uint:2 zmenhanceddamagemult;
        // offset 0x9b0, size 0x8
        uint:2 allowhitmarkers;
        // offset 0x9b8, size 0x10
        fixed<9,3> maxobjectiveeventsperminute;
        // offset 0x9c8, size 0x8
        uint:2 zmheavystate;
        // offset 0x9d0, size 0x8
        uint:5 pointsperprimarygrenadekill;
        // offset 0x9d8, size 0x8
        uint:2 zmheavyhealthmult;
        // offset 0x9e0, size 0x8
        uint:2 hash_6d8c09b7927b8d9b;
        // offset 0x9e8, size 0x8
        uint:7 bonuslivesforcapturingzone;
        // offset 0x9f0, size 0x8
        uint:7 startplayers;
        // offset 0x9f8, size 0x8
        uint:3 hash_7d590533364efa87;
        // offset 0xa00, size 0x8
        uint:8 hash_252e760b41f3d94a;
        // offset 0xa08, size 0x8
        fixed<8,2> roundstartkillstreakdelay;
        // offset 0xa10, size 0x8
        uint:5 totalkillsmax;
        // offset 0xa18, size 0x8
        uint:4 roundswitch;
        // offset 0xa20, size 0x8
        uint:2 zmminibossstate;
        // offset 0xa28, size 0x8
        uint:2 zmpopcornhealthmult;
        // offset 0xa30, size 0x8
        uint:2 zmhealthdrain;
        // offset 0xa38, size 0x8
        fixed<8,2> playerobjectiveheldrespawndelay;
        // offset 0xa40, size 0x8
        uint:7 zmpointlossondown;
        // offset 0xa48, size 0x8
        uint:4 teamkillpenalty;
        // offset 0xa50, size 0x8
        fixed<8,2> hash_18bdaa4b00863e9d;
        // offset 0xa58, size 0x8
        uint:5 weaponcount;
        // offset 0xa60, size 0x8
        uint:7 weapontimer;
        // offset 0xa68, size 0x10
        fixed<10,2> overtimetimelimit;
        // offset 0xa78, size 0x8
        uint:7 cleandepositonlinetime;
        // offset 0xa80, size 0x8
        uint:7 drafttime;
        // offset 0xa88, size 0x8
        uint:8 hash_ed89addfaaafe48;
        // offset 0xa90, size 0x8
        uint:7 objectivespawntime;
        // offset 0xa98, size 0x10
        fixed<10,4> killcamtime;
        // offset 0xaa8, size 0x8
        uint:4 throwscore;
        // offset 0xab0, size 0x8
        uint:4 deposittime;
        // offset 0xab8, size 0x10
        fixed<10,2> extratime;
        // offset 0xac8, size 0x8
        fixed<8,7> hash_6269eb986d22cd37;
        // offset 0xad0, size 0x8
        uint:2 zmcrawlerhealthmult;
        // offset 0xad8, size 0x8
        uint:3 zmfriendlyfiretype;
        // offset 0xae0, size 0x8
        fixed<8,6> scoreequipmentpowertimefactor;
        // offset 0xae8, size 0x8
        uint:2 zmdifficulty;
        // offset 0xaf0, size 0x8
        uint:7 teamcount;
        // offset 0xaf8, size 0x20
        int hash_7f38d88521da4c79;
        // offset 0xb18, size 0x8
        uint:4 roundlimit;
        // offset 0xb20, size 0x8
        uint:4 zmtrialsvariant;
        // offset 0xb28, size 0x10
        uint:9 zmtimecap;
        // offset 0xb38, size 0x8
        uint:2 charactercustomization;
        // offset 0xb40, size 0x8
        uint:4 hash_437a986f8d24d7eb;
        // offset 0xb48, size 0x8
        uint:2 zmminibossdamagemult;
        // offset 0xb50, size 0x8
        fixed<8,7> hash_6e2abf2cc40e03f1;
        // offset 0xb58, size 0x8
        uint:5 teamscoreperkilldenied;
        // offset 0xb60, size 0x10
        fixed<10,2> bombtimer;
        // offset 0xb70, size 0x8
        uint:7 zmlimiteddownsamount;
        // offset 0xb78, size 0x1
        bool zmtalismansenabled;
        // offset 0xb79, size 0x1
        bool delayplayer;
        // offset 0xb7a, size 0x1
        bool zmelixirreigndrops;
        // offset 0xb7b, size 0x1
        bool zmstartingweaponenabled;
        // offset 0xb7c, size 0x1
        bool voipdeadchatwithdead;
        // offset 0xb7d, size 0x1
        bool voipdeadchatwithteam;
        // offset 0xb7e, size 0x1
        bool hash_729930c3c52653c3;
        // offset 0xb7f, size 0x1
        bool magic;
        // offset 0xb80, size 0x1
        bool useembleminsteadoffactionicon;
        // offset 0xb81, size 0x1
        bool zmelixirblooddebt;
        // offset 0xb82, size 0x1
        bool draftenabled;
        // offset 0xb83, size 0x1
        bool zmtalismanperkpermanent1;
        // offset 0xb84, size 0x1
        bool zmtalismanperkpermanent2;
        // offset 0xb85, size 0x1
        bool zmtalismanperkpermanent3;
        // offset 0xb86, size 0x1
        bool zmtalismanperkpermanent4;
        // offset 0xb87, size 0x1
        bool hash_23fe21eb92ffbc2c;
        // offset 0xb88, size 0x1
        bool zmtalismanspecialstartlvl2;
        // offset 0xb89, size 0x1
        bool zmtalismanspecialstartlvl3;
        // offset 0xb8a, size 0x1
        bool zmperksdeathdash;
        // offset 0xb8b, size 0x1
        bool zmperksspeed;
        // offset 0xb8c, size 0x1
        bool droppedtagrespawn;
        // offset 0xb8d, size 0x1
        bool zmtalismanextrasemtex;
        // offset 0xb8e, size 0x1
        bool zmtalismanboxguaranteelmg;
        // offset 0xb8f, size 0x1
        bool zmelixirundeadmanwalking;
        // offset 0xb90, size 0x1
        bool voipkillershearvictim;
        // offset 0xb91, size 0x1
        bool hash_7c0dcff6ffb1e348;
        // offset 0xb92, size 0x1
        bool zmelixirwallpower;
        // offset 0xb93, size 0x1
        bool deathcirclerespawn;
        // offset 0xb94, size 0x1
        bool zmelixirfreefire;
        // offset 0xb95, size 0x1
        bool allowdogs;
        // offset 0xb96, size 0x1
        bool presetclassesperteam;
        // offset 0xb97, size 0x1
        bool zmelixirpowervacuum;
        // offset 0xb98, size 0x1
        bool zmelixirsenabled;
        // offset 0xb99, size 0x1
        bool zmpowerupfiresale;
        // offset 0xb9a, size 0x1
        bool zmperksetherealrazor;
        // offset 0xb9b, size 0x1
        bool zmelixirctrlz;
        // offset 0xb9c, size 0x1
        bool zmperksquickrevive;
        // offset 0xb9d, size 0x1
        bool zmelixirsepic;
        // offset 0xb9e, size 0x1
        bool zmelixirsrare;
        // offset 0xb9f, size 0x1
        bool hash_5c57222bb95a06cb;
        // offset 0xba0, size 0x1
        bool zmelixirdangerclosest;
        // offset 0xba1, size 0x1
        bool zmtrapsenabled;
        // offset 0xba2, size 0x1
        bool hash_751384283abde22c;
        // offset 0xba3, size 0x1
        bool zmelixirshoppingfree;
        // offset 0xba4, size 0x1
        bool zmtalismanpermanentheroweaparmor;
        // offset 0xba5, size 0x1
        bool hardcoremode;
        // offset 0xba6, size 0x1
        bool useitemspawns;
        // offset 0xba7, size 0x1
        bool hash_77b7734750cd75e9;
        // offset 0xba8, size 0x1
        bool silentplant;
        // offset 0xba9, size 0x1
        bool hash_5711f3e42924a635;
        // offset 0xbaa, size 0x1
        bool drafteveryround;
        // offset 0xbab, size 0x1
        bool timepauseswheninzone;
        // offset 0xbac, size 0x1
        bool zmperksjuggernaut;
        // offset 0xbad, size 0x1
        bool hash_549abfbb3665d526;
        // offset 0xbae, size 0x1
        bool scoreperplayer;
        // offset 0xbaf, size 0x1
        bool ekiaresetondeath;
        // offset 0xbb0, size 0x1
        bool kothmode;
        // offset 0xbb1, size 0x1
        bool zmperkswidowswail;
        // offset 0xbb2, size 0x1
        bool zmperksdeathperception;
        // offset 0xbb3, size 0x1
        bool zmweaponsar;
        // offset 0xbb4, size 0x1
        bool zmweaponstr;
        // offset 0xbb5, size 0x1
        bool zmtalismanperkmodsingle;
        // offset 0xbb6, size 0x1
        bool hash_62665aebde32c8ae;
        // offset 0xbb7, size 0x1
        bool hash_18c053cae82c1167;
        // offset 0xbb8, size 0x1
        bool hash_6cf5f53d1fbb1066;
        // offset 0xbb9, size 0x1
        bool zmelixirheadscan;
        // offset 0xbba, size 0x1
        bool zmelixirlicensedcontractor;
        // offset 0xbbb, size 0x1
        bool hash_429b520a87274afb;
        // offset 0xbbc, size 0x1
        bool zmelixirextracredit;
        // offset 0xbbd, size 0x1
        bool decayprogress;
        // offset 0xbbe, size 0x1
        bool zmperkszombshell;
        // offset 0xbbf, size 0x1
        bool playerqueuedrespawn;
        // offset 0xbc0, size 0x1
        bool cumulativeroundscores;
        // offset 0xbc1, size 0x1
        bool voipdeadhearkiller;
        // offset 0xbc2, size 0x1
        bool zmspecweaponisenabled;
        // offset 0xbc3, size 0x1
        bool skiplaststand;
        // offset 0xbc4, size 0x1
        bool zmperkselectricburst;
        // offset 0xbc5, size 0x1
        bool zmelixirquacknarok;
        // offset 0xbc6, size 0x1
        bool hash_1f3825ba2a669400;
        // offset 0xbc7, size 0x1
        bool usespawngroups;
        // offset 0xbc8, size 0x1
        bool disablethirdpersonspectating;
        // offset 0xbc9, size 0x1
        bool zmwallbuysenabled;
        // offset 0xbca, size 0x1
        bool zmelixirsodafountain;
        // offset 0xbcb, size 0x1
        bool zmendonquest;
        // offset 0xbcc, size 0x1
        bool zmelixirdeadofnuclearwinter;
        // offset 0xbcd, size 0x1
        bool zmtalismanscommon;
        // offset 0xbce, size 0x1
        bool zmelixiranywherebuthere;
        // offset 0xbcf, size 0x1
        bool zmelixircrawlspace;
        // offset 0xbd0, size 0x1
        bool allowlaststandforactiveclients;
        // offset 0xbd1, size 0x1
        bool allowbattlechatter;
        // offset 0xbd2, size 0x1
        bool fowrevealenabled;
        // offset 0xbd3, size 0x1
        bool zmpowerupsactive;
        // offset 0xbd4, size 0x1
        bool zmelixirburnedout;
        // offset 0xbd5, size 0x1
        bool zmtalismansultra;
        // offset 0xbd6, size 0x1
        bool zmtalismanspecialxprate;
        // offset 0xbd7, size 0x1
        bool hash_678c1d3307b1d73a;
        // offset 0xbd8, size 0x1
        bool headshotsonly;
        // offset 0xbd9, size 0x1
        bool disablecontracts;
        // offset 0xbda, size 0x1
        bool hash_75d44b1542e3edf9;
        // offset 0xbdb, size 0x1
        bool zmtalismanimpatient;
        // offset 0xbdc, size 0x1
        bool zmelixirinplainsight;
        // offset 0xbdd, size 0x1
        bool allowannouncer;
        // offset 0xbde, size 0x1
        bool zmbarricadestate;
        // offset 0xbdf, size 0x1
        bool disallowaimslowdown;
        // offset 0xbe0, size 0x1
        bool zmtalismanstartweaponar;
        // offset 0xbe1, size 0x1
        bool zmelixirslegendary;
        // offset 0xbe2, size 0x1
        bool zmelixirswordflay;
        // offset 0xbe3, size 0x1
        bool zmpowerupchaospoints;
        // offset 0xbe4, size 0x1
        bool zmelixirpopshocks;
        // offset 0xbe5, size 0x1
        bool zmelixirpointdrops;
        // offset 0xbe6, size 0x1
        bool zmcraftingkeyline;
        // offset 0xbe7, size 0x1
        bool zmpowerupinstakill;
        // offset 0xbe8, size 0x1
        bool vehiclesenabled;
        // offset 0xbe9, size 0x1
        bool decaycapturedzones;
        // offset 0xbea, size 0x1
        bool zmelixirkilljoy;
        // offset 0xbeb, size 0x1
        bool zmtalismanextrafrag;
        // offset 0xbec, size 0x1
        bool zmpowerupcarpenter;
        // offset 0xbed, size 0x1
        bool zmelixirscommon;
        // offset 0xbee, size 0x1
        bool zmelixirsecretshopper;
        // offset 0xbef, size 0x1
        bool zmelixirjointheparty;
        // offset 0xbf0, size 0x1
        bool neutralzone;
        // offset 0xbf1, size 0x1
        bool boastallowcam;
        // offset 0xbf2, size 0x1
        bool onlyheadshots;
        // offset 0xbf3, size 0x1
        bool flagcapturecondition;
        // offset 0xbf4, size 0x1
        bool zmelixirsdurables;
        // offset 0xbf5, size 0x1
        bool zmshieldisenabled;
        // offset 0xbf6, size 0x1
        bool zmelixirimmolationliquidation;
        // offset 0xbf7, size 0x1
        bool hash_5566698b97a6282e;
        // offset 0xbf8, size 0x1
        bool zmelixirphoenixup;
        // offset 0xbf9, size 0x1
        bool flagcanbeneutralized;
        // offset 0xbfa, size 0x1
        bool zmelixiraftertaste;
        // offset 0xbfb, size 0x1
        bool zmcrawleraggro;
        // offset 0xbfc, size 0x1
        bool zmperkscooldown;
        // offset 0xbfd, size 0x1
        bool hash_6881c7cab0dcef39;
        // offset 0xbfe, size 0x1
        bool vehiclestimed;
        // offset 0xbff, size 0x1
        bool pregamedraftenabled;
        // offset 0xc00, size 0x1
        bool zmheadshotsonly;
        // offset 0xc01, size 0x1
        bool fogofwarminimap;
        // offset 0xc02, size 0x1
        bool zmspecialroundsenabled;
        // offset 0xc03, size 0x1
        bool zmelixirperkup;
        // offset 0xc04, size 0x1
        bool teamkillpointloss;
        // offset 0xc05, size 0x1
        bool zmelixirboardgames;
        // offset 0xc06, size 0x1
        bool zmelixirperkaholic;
        // offset 0xc07, size 0x1
        bool zmperksactive;
        // offset 0xc08, size 0x1
        bool hash_29f3630e8e542a0a;
        // offset 0xc09, size 0x1
        bool zmelixirsuitup;
        // offset 0xc0a, size 0x1
        bool zmequipmentisenabled;
        // offset 0xc0b, size 0x1
        bool zmsuperpapenabled;
        // offset 0xc0c, size 0x1
        bool zmweaponsknife;
        // offset 0xc0d, size 0x1
        bool zmweaponsmelee;
        // offset 0xc0e, size 0x1
        bool zmelixirconflagrationliquidation;
        // offset 0xc0f, size 0x1
        bool perksenabled;
        // offset 0xc10, size 0x1
        bool zmperkswolfprotector;
        // offset 0xc11, size 0x1
        bool hash_33bc6781006ae83d;
        // offset 0xc12, size 0x1
        bool zmelixirwalltowall;
        // offset 0xc13, size 0x1
        bool hash_1e45aded9d98eb83;
        // offset 0xc14, size 0x1
        bool zmpowerupspecialweapon;
        // offset 0xc15, size 0x1
        bool allowmapscripting;
        // offset 0xc16, size 0x1
        bool robotshield;
        // offset 0xc17, size 0x1
        bool zmretainweapons;
        // offset 0xc18, size 0x1
        bool hash_62e3e33ec68db92f;
        // offset 0xc19, size 0x1
        bool zmpowerupdouble;
        // offset 0xc1a, size 0x1
        bool allowkillcam;
        // offset 0xc1b, size 0x1
        bool disableattachments;
        // offset 0xc1c, size 0x1
        bool disablecompass;
        // offset 0xc1d, size 0x1
        bool disableweapondrop;
        // offset 0xc1e, size 0x1
        bool zmpointsfixed;
        // offset 0xc1f, size 0x1
        bool zmtalismancoagulant;
        // offset 0xc20, size 0x1
        bool zmperkssecretsauce;
        // offset 0xc21, size 0x1
        bool zmelixirphantomreload;
        // offset 0xc22, size 0x1
        bool zmperksphdslider;
        // offset 0xc23, size 0x1
        bool zmelixircacheback;
        // offset 0xc24, size 0x1
        bool zmweaponspistol;
        // offset 0xc25, size 0x1
        bool escalationenabled;
        // offset 0xc26, size 0x1
        bool disablecac;
        // offset 0xc27, size 0x1
        bool disableclassselection;
        // offset 0xc28, size 0x1
        bool hash_48670d9509071424;
        // offset 0xc29, size 0x1
        bool autoteambalance;
        // offset 0xc2a, size 0x1
        bool zmweaponssniper;
        // offset 0xc2b, size 0x1
        bool zmelixirpowerkeg;
        // offset 0xc2c, size 0x1
        bool hash_4bdd1bd86b610871;
        // offset 0xc2d, size 0x1
        bool zmwonderweaponisenabled;
        // offset 0xc2e, size 0x1
        bool zmelixirnowyouseeme;
        // offset 0xc2f, size 0x1
        bool zmpowerupmaxammo;
        // offset 0xc30, size 0x1
        bool zmpowerupnuke;
        // offset 0xc31, size 0x1
        bool zmelixirnewtoniannegation;
        // offset 0xc32, size 0x1
        bool zmelixirrefreshmint;
        // offset 0xc33, size 0x1
        bool zmelixirbulletboost;
        // offset 0xc34, size 0x1
        bool zmtalismanslegendary;
        // offset 0xc35, size 0x1
        bool zmtalismanshieldprice;
        // offset 0xc36, size 0x1
        bool zmperksstonecold;
        // offset 0xc37, size 0x1
        bool hash_7c0acf14fb1f4080;
        // offset 0xc38, size 0x1
        bool zmtalismanshielddurabilityrare;
        // offset 0xc39, size 0x1
        bool zmelixirstockoption;
        // offset 0xc3a, size 0x1
        bool allowplayofthematch;
        // offset 0xc3b, size 0x1
        bool zmtalismanextraselfrevive;
        // offset 0xc3c, size 0x1
        bool zmelixirheaddrama;
        // offset 0xc3d, size 0x1
        bool allowprone;
        // offset 0xc3e, size 0x1
        bool zmtalismanextramolotov;
        // offset 0xc3f, size 0x1
        bool scoreresetondeath;
        // offset 0xc40, size 0x1
        bool zmtalismansindividual;
        // offset 0xc41, size 0x1
        bool zmelixirtalkinboutregeneration;
        // offset 0xc42, size 0x1
        bool hash_452a45e599d3a575;
        // offset 0xc43, size 0x1
        bool playerforcerespawn;
        // offset 0xc44, size 0x1
        bool zmperksdeadshot;
        // offset 0xc45, size 0x1
        bool multibomb;
        // offset 0xc46, size 0x1
        bool zmtalismanboxguaranteeboxonly;
        // offset 0xc47, size 0x1
        bool zmtalismanperkstart1;
        // offset 0xc48, size 0x1
        bool zmtalismanperkstart2;
        // offset 0xc49, size 0x1
        bool zmtalismanperkstart3;
        // offset 0xc4a, size 0x1
        bool zmtalismanperkstart4;
        // offset 0xc4b, size 0x1
        bool zmtalismanperkreducecost1;
        // offset 0xc4c, size 0x1
        bool zmtalismanperkreducecost2;
        // offset 0xc4d, size 0x1
        bool zmtalismanperkreducecost3;
        // offset 0xc4e, size 0x1
        bool zmtalismanperkreducecost4;
        // offset 0xc4f, size 0x1
        bool hash_104f124f56f0f20a;
        // offset 0xc50, size 0x1
        bool zmperksmulekick;
        // offset 0xc51, size 0x1
        bool zmelixirwhoskeepingscore;
        // offset 0xc52, size 0x1
        bool deathcircle;
        // offset 0xc53, size 0x1
        bool boastenabled;
        // offset 0xc54, size 0x1
        bool zmtalismanshielddurabilitylegendary;
        // offset 0xc55, size 0x1
        bool zmperksdyingwish;
        // offset 0xc56, size 0x1
        bool zmperksvictorious;
        // offset 0xc57, size 0x1
        bool hash_69f74281cacb8a0f;
        // offset 0xc58, size 0x1
        bool deathpointloss;
        // offset 0xc59, size 0x1
        bool hash_1260b639348098e3;
        // offset 0xc5a, size 0x1
        bool rebootplayers;
        // offset 0xc5b, size 0x1
        bool oldschoolmode;
        // offset 0xc5c, size 0x1
        bool hash_4238acad9fa0f317;
        // offset 0xc5d, size 0x1
        bool zmtalismanextraclaymore;
        // offset 0xc5e, size 0x1
        bool allowfinalkillcam;
        // offset 0xc5f, size 0x1
        bool zmtalismanstartweaponlmg;
        // offset 0xc60, size 0x1
        bool zmtalismanstartweaponsmg;
        // offset 0xc61, size 0x1
        bool allowspectating;
        // offset 0xc62, size 0x1
        bool zmpowerupsislimitedround;
        // offset 0xc63, size 0x1
        bool usabledynents;
        // offset 0xc64, size 0x1
        bool zmtalismansepic;
        // offset 0xc65, size 0x1
        bool zmtalismansrare;
        // offset 0xc66, size 0x1
        bool hash_3c5363541b97ca3e;
        // offset 0xc67, size 0x1
        bool zmheavyaggro;
        // offset 0xc68, size 0x1
        bool zmweaponsshotgun;
        // offset 0xc69, size 0x1
        bool hash_11e1a0adebdab01a;
        // offset 0xc6a, size 0x1
        bool zmperksbandolier;
        // offset 0xc6b, size 0x1
        bool zmweaponslmg;
        // offset 0xc6c, size 0x1
        bool zmweaponssmg;
        // offset 0xc6d, size 0x1
        bool zmtalismanreducepapcost;
        // offset 0xc6e, size 0x1
        bool zmelixirneardeathexperience;
        // offset 0xc6f, size 0x1
        bool zmelixirnowherebutthere;
        // offset 0xc70, size 0x1
        bool spawnselectenabled;
        // offset 0xc71, size 0x1
        bool zmminibossaggro;
        // offset 0xc72, size 0x1
        bool hash_5d65c0983698a539;
        // offset 0xc73, size 0x1
        bool zmelixirtemporalgift;
        // offset 0xc74, size 0x1
        bool loadoutkillstreaksenabled;
        // offset 0xc75, size 0x1
        bool zmelixirantientrapment;
        // offset 0xc76, size 0x1
        bool zmpowerupfreeperk;
        // offset 0xc77, size 0x1
        bool hash_12f776f6bc579bb4;
        // offset 0xc78, size 0x1
        bool zmelixiralchemicalantithesis;
        // offset 0xc79, size 0x1
        bool pregameitemvoteenabled;
        // offset 0xc7a, size 0x1
        bool hash_5684ea266d45be15;
        // offset 0xc7b, size 0x1
        bool hash_7f273e367f26254;
        // offset 0xc7c, size 0x1
        bool zmperksstaminup;
        // offset 0xc7d, size 0x1
        bool zmelixirdividendyield;
        // offset 0xc7e, size 0x1
        bool disallowprone;
        // offset 0xc7f, size 0x1
        bool hash_61695e52556ff2d1;
        // offset 0xc80, size 0x1
        bool moveplayers;
        // offset 0xc81, size 0x1
        bool disabletacinsert;
        // offset 0xc82, size 0x1
        bool voipdeadhearallliving;
        // offset 0xc83, size 0x1
        bool hash_4ca06c610b5d53bd;
        // offset 0xc84, size 0x1
        bool zmelixirsindividual;
        // offset 0xc85, size 0x1
        bool killstreaksgivegamescore;
        // offset 0xc86, size 0x1
        bool zmpowerupsharing;
        // offset 0xc87, size 0x1
        bool zmtalismanextraminiturret;
        // offset 0xc88, size 0x1
        bool zmelixirshieldsup;
        // offset 0xc89, size 0x1
        bool flagcapturerateincrease;
        // offset 0xc8a, size 0x1
        bool use_doors;
        // offset 0xc8b, size 0x1
        bool zmelixirarsenalaccelerator;
        // offset 0xc8c, size 0x1
        bool forwardspawnteamspecificspawns;
        // offset 0xc8d, size 0x1
        bool hash_50b56d2635cbb74b;
        // offset 0xc8e, size 0x1
        bool forwardspawntakesdamage;
        // offset 0xc8f, size 0x1
        bool allowingameteamchange;
        // offset 0xc90, size 0x1
        bool hash_297b69789a6283b4;
        // offset 0xc91, size 0x1
        bool deathzones;
        // offset 0xc92, size 0x1
        bool classicmode;
        // offset 0xc93, size 0x1
        bool voipdeadhearteamliving;
        // offset 0xc94, size 0x1
        bool capdecay;
        // offset 0xc95, size 0x1
        bool voipeveryonehearseveryone;
        // offset 0xc96, size 0x1
        bool hash_4f4a73f236278ba8;
        // offset 0xc97, size 0x1
        bool hash_5f76e2d55ad861ed;
        // offset 0xc98, size 0x1
        bool zmshowtimer;
        // offset 0xc99, size 0x1
        bool zmelixirequipmint;
        // offset 0xc9a, size 0x1
        bool zmelixiralwaysdoneswiftly;
        // offset 0xc9b, size 0x1
        bool laststandfinishing;
        // offset 0xc9c, size 0x1
        bool hash_201c1769d32b30d3;
        // offset 0xc9d, size 0x3
        uint:1 __pad[3];
    };

    // idx 25 members 3 size 0x30
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
    };

    // idx 26 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 27 members 3 size 0x38
    struct hash_77427c7b6edfc9f {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
    };

    // idx 28 members 3 size 0x48
    struct hash_18a8724145eb9652 {
        // offset 0x0, size 0x20
        uint challengevalue;
        // offset 0x20, size 0x20
        uint statvalue;
        // offset 0x40, size 0x8
        uint:4 challengetier;
    };

    // idx 29 members 3 size 0x18
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
    };

    // idx 30 members 3 size 0x28
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
    };

    // idx 31 members 480 size 0x5490
    struct globalstats {
        // offset 0x0, size 0x30
        hash_6c116eea1f7184ec doors_purchased;
        // offset 0x30, size 0x30
        hash_6c116eea1f7184ec hits;
        // offset 0x60, size 0x30
        hash_6c116eea1f7184ec rank;
        // offset 0x90, size 0x30
        hash_6c116eea1f7184ec ties;
        // offset 0xc0, size 0x30
        hash_6c116eea1f7184ec hash_57a704e24a1baad4;
        // offset 0xf0, size 0x30
        hash_6c116eea1f7184ec hash_ad3a508a80a0e6e;
        // offset 0x120, size 0x30
        hash_6c116eea1f7184ec player_kills;
        // offset 0x150, size 0x30
        hash_6c116eea1f7184ec wraith_fire_kills;
        // offset 0x180, size 0x30
        hash_6c116eea1f7184ec downs;
        // offset 0x1b0, size 0x30
        hash_6c116eea1f7184ec drops;
        // offset 0x1e0, size 0x30
        hash_6c116eea1f7184ec bgbs_chewed;
        // offset 0x210, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_instakill;
        // offset 0x240, size 0x30
        hash_6c116eea1f7184ec kills;
        // offset 0x270, size 0x58
        intstat maxxp;
        // offset 0x2c8, size 0x58
        intstat minxp;
        // offset 0x320, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_kill_trap;
        // offset 0x350, size 0x30
        hash_6c116eea1f7184ec score;
        // offset 0x380, size 0x30
        hash_6c116eea1f7184ec wallbuy_weapons_purchased;
        // offset 0x3b0, size 0x18
        hash_25508de9fa29a5d5 hash_62b2fe2395dd516d;
        // offset 0x3c8, size 0x30
        hash_6c116eea1f7184ec timestamplastday1;
        // offset 0x3f8, size 0x30
        hash_6c116eea1f7184ec timestamplastday2;
        // offset 0x428, size 0x30
        hash_6c116eea1f7184ec timestamplastday3;
        // offset 0x458, size 0x30
        hash_6c116eea1f7184ec timestamplastday4;
        // offset 0x488, size 0x30
        hash_6c116eea1f7184ec timestamplastday5;
        // offset 0x4b8, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_kill_packapunch;
        // offset 0x4e8, size 0x30
        hash_6c116eea1f7184ec hash_5fb724d439b8956;
        // offset 0x518, size 0x18
        hash_25508de9fa29a5d5 hash_40d7609d9e5bdb5;
        // offset 0x530, size 0x18
        hash_25508de9fa29a5d5 hash_1e31fd681b6d19f;
        // offset 0x548, size 0x30
        hash_6c116eea1f7184ec hash_799aecaf1ec45db1;
        // offset 0x578, size 0x30
        hash_6c116eea1f7184ec shotgun_kills;
        // offset 0x5a8, size 0x30
        hash_6c116eea1f7184ec hash_f0062be10452ec0;
        // offset 0x5d8, size 0x30
        hash_6c116eea1f7184ec hash_36f86bbf6612a04d;
        // offset 0x608, size 0x18
        hash_25508de9fa29a5d5 hash_7af46cc50d39f583;
        // offset 0x620, size 0x18
        hash_25508de9fa29a5d5 hash_430f303e03007f59;
        // offset 0x638, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_tactical_rifle;
        // offset 0x668, size 0x30
        hash_6c116eea1f7184ec survivalist_survive_rounds;
        // offset 0x698, size 0x28
        hash_2b6b162a9af31225 hash_4a81e4e6a345bab;
        // offset 0x6c0, size 0x30
        hash_6c116eea1f7184ec killed_by_brutus;
        // offset 0x6f0, size 0x28
        hash_2b6b162a9af31225 hash_453343ee0cbedda8;
        // offset 0x718, size 0x30
        hash_6c116eea1f7184ec zm_daily_purchase_fire_sale_magic_box;
        // offset 0x748, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills;
        // offset 0x778, size 0x30
        hash_6c116eea1f7184ec catalyst_plasmas_killed;
        // offset 0x7a8, size 0x30
        hash_6c116eea1f7184ec hash_258c10d310bf4203;
        // offset 0x7d8, size 0x30
        hash_6c116eea1f7184ec catalyst_transformation_denials;
        // offset 0x808, size 0x30
        hash_6c116eea1f7184ec hash_339d53ba205eaeb1;
        // offset 0x838, size 0x30
        hash_6c116eea1f7184ec time_played_total;
        // offset 0x868, size 0x30
        hash_6c116eea1f7184ec gladiators_killed;
        // offset 0x898, size 0x30
        hash_6c116eea1f7184ec power_turnedoff;
        // offset 0x8c8, size 0x30
        hash_6c116eea1f7184ec hash_733e96c5baacb1da;
        // offset 0x8f8, size 0x18
        hash_25508de9fa29a5d5 hash_517bf5c8991ad97a;
        // offset 0x910, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_explosive;
        // offset 0x940, size 0x18
        hash_25508de9fa29a5d5 hash_59c247870ba8f396;
        // offset 0x958, size 0x28
        hash_2b6b162a9af31225 hash_fbfa7a068b0166;
        // offset 0x980, size 0x30
        hash_6c116eea1f7184ec hash_394c19e7ac92098c;
        // offset 0x9b0, size 0x30
        hash_6c116eea1f7184ec killed_by_crimson_nosferatu;
        // offset 0x9e0, size 0x30
        hash_6c116eea1f7184ec nova_crawlers_killed;
        // offset 0xa10, size 0x30
        hash_6c116eea1f7184ec hash_1f8e699fb25ee0a9;
        // offset 0xa40, size 0x30
        hash_6c116eea1f7184ec weighted_rounds_played;
        // offset 0xa70, size 0x30
        hash_6c116eea1f7184ec challenges;
        // offset 0xaa0, size 0x30
        hash_6c116eea1f7184ec perk_deadshot_kills;
        // offset 0xad0, size 0x30
        hash_6c116eea1f7184ec hash_4aa750e907d2acba;
        // offset 0xb00, size 0x30
        hash_6c116eea1f7184ec teamkills_nostats;
        // offset 0xb30, size 0x18
        hash_25508de9fa29a5d5 hash_7b25ab6b37350720;
        // offset 0xb48, size 0x30
        hash_6c116eea1f7184ec hash_63de9d1da77a2087;
        // offset 0xb78, size 0x30
        hash_6c116eea1f7184ec hash_452e07bec3b77c8e;
        // offset 0xba8, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_shotgun;
        // offset 0xbd8, size 0x28
        hash_2b6b162a9af31225 hash_577fe62725619fdc;
        // offset 0xc00, size 0x18
        hash_25508de9fa29a5d5 hash_25205539b20f4f65;
        // offset 0xc18, size 0x30
        hash_6c116eea1f7184ec hash_1f20f53b7084fdcb;
        // offset 0xc48, size 0x30
        hash_6c116eea1f7184ec total_points;
        // offset 0xc78, size 0x30
        hash_6c116eea1f7184ec zdog_rounds_finished;
        // offset 0xca8, size 0x30
        hash_6c116eea1f7184ec hash_65472fa120ebce1c;
        // offset 0xcd8, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_smg;
        // offset 0xd08, size 0x30
        hash_6c116eea1f7184ec killed_by_gladiator;
        // offset 0xd38, size 0x30
        hash_6c116eea1f7184ec survivalist_powerup;
        // offset 0xd68, size 0x30
        hash_6c116eea1f7184ec killed_by_nosferatu;
        // offset 0xd98, size 0x30
        hash_6c116eea1f7184ec hash_29263107e5304d26;
        // offset 0xdc8, size 0x30
        hash_6c116eea1f7184ec hash_35018eb03fb43999;
        // offset 0xdf8, size 0x30
        hash_6c116eea1f7184ec killed_by_stoker;
        // offset 0xe28, size 0x30
        hash_6c116eea1f7184ec planted_buildables_pickedup;
        // offset 0xe58, size 0x30
        hash_6c116eea1f7184ec darkops_zod_ee;
        // offset 0xe88, size 0x30
        hash_6c116eea1f7184ec upgraded_ammo_purchased;
        // offset 0xeb8, size 0x30
        hash_6c116eea1f7184ec lifetime_buyin;
        // offset 0xee8, size 0x30
        hash_6c116eea1f7184ec hash_24c321e8e1e698ee;
        // offset 0xf18, size 0x30
        hash_6c116eea1f7184ec total_games_played;
        // offset 0xf48, size 0x18
        hash_25508de9fa29a5d5 hash_114a149b2164ee22;
        // offset 0xf60, size 0x30
        hash_6c116eea1f7184ec zm_daily_spend_25k;
        // offset 0xf90, size 0x30
        hash_6c116eea1f7184ec zm_daily_spend_50k;
        // offset 0xfc0, size 0x18
        hash_25508de9fa29a5d5 weapons_mastery_tactical;
        // offset 0xfd8, size 0x30
        hash_6c116eea1f7184ec hash_3a43a56f5f2aeacc;
        // offset 0x1008, size 0x30
        hash_6c116eea1f7184ec killed_by_catalyst_plasma;
        // offset 0x1038, size 0x30
        hash_6c116eea1f7184ec hash_5b4c8093f020f163;
        // offset 0x1068, size 0x30
        hash_6c116eea1f7184ec hash_63e3f06d30760b7e;
        // offset 0x1098, size 0x30
        hash_6c116eea1f7184ec hash_4a826147d0fdd8b;
        // offset 0x10c8, size 0x30
        hash_6c116eea1f7184ec bouncingbetty_pickedup;
        // offset 0x10f8, size 0x18
        hash_25508de9fa29a5d5 weapons_mastery_sniper;
        // offset 0x1110, size 0x30
        hash_6c116eea1f7184ec ammo_purchased;
        // offset 0x1140, size 0x30
        hash_6c116eea1f7184ec hash_2c88c6128e0be61;
        // offset 0x1170, size 0x30
        hash_6c116eea1f7184ec hash_405387fd6efe78b3;
        // offset 0x11a0, size 0x58
        intstat paragon_maxxp;
        // offset 0x11f8, size 0x58
        intstat paragon_minxp;
        // offset 0x1250, size 0x30
        hash_6c116eea1f7184ec killed_by_zdog;
        // offset 0x1280, size 0x30
        hash_6c116eea1f7184ec hash_3b730e19ee963ab6;
        // offset 0x12b0, size 0x30
        hash_6c116eea1f7184ec towers_acid_trap_built_danu;
        // offset 0x12e0, size 0x30
        hash_6c116eea1f7184ec towers_acid_trap_built_odin;
        // offset 0x1310, size 0x30
        hash_6c116eea1f7184ec towers_acid_trap_built_zeus;
        // offset 0x1340, size 0x30
        hash_6c116eea1f7184ec perk_stronghold_headshots;
        // offset 0x1370, size 0x30
        hash_6c116eea1f7184ec grabbed_from_magicbox;
        // offset 0x13a0, size 0x28
        hash_2b6b162a9af31225 hash_370591287cb428d2;
        // offset 0x13c8, size 0x30
        hash_6c116eea1f7184ec hash_702d98df99af63d5;
        // offset 0x13f8, size 0x30
        hash_6c116eea1f7184ec fire_sale_pickedup;
        // offset 0x1428, size 0x30
        hash_6c116eea1f7184ec hash_4402d97ccdae530f;
        // offset 0x1458, size 0x28
        hash_2b6b162a9af31225 hash_6a7969094ca32774;
        // offset 0x1480, size 0x30
        hash_6c116eea1f7184ec hash_70d008641f35a1f0;
        // offset 0x14b0, size 0x18
        hash_25508de9fa29a5d5 special_crossbow_for_diamond;
        // offset 0x14c8, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_gladiator;
        // offset 0x14f8, size 0x30
        hash_6c116eea1f7184ec paragon_rank;
        // offset 0x1528, size 0x30
        hash_6c116eea1f7184ec hash_6aedbad63da100db;
        // offset 0x1558, size 0x30
        hash_6c116eea1f7184ec hash_6d5340d9e43ed73d;
        // offset 0x1588, size 0x30
        hash_6c116eea1f7184ec hash_63dfdbf360bad3a8;
        // offset 0x15b8, size 0x30
        hash_6c116eea1f7184ec pap_weapon_not_grabbed;
        // offset 0x15e8, size 0x30
        hash_6c116eea1f7184ec gum_gobbler_wall_power;
        // offset 0x1618, size 0x18
        hash_25508de9fa29a5d5 hash_1a2c053c80edcc95;
        // offset 0x1630, size 0x30
        hash_6c116eea1f7184ec nosferatus_killed;
        // offset 0x1660, size 0x30
        hash_6c116eea1f7184ec revives;
        // offset 0x1690, size 0x30
        hash_6c116eea1f7184ec hash_7283f3e1d914d95b;
        // offset 0x16c0, size 0x18
        hash_25508de9fa29a5d5 hash_72a5c6867f90767d;
        // offset 0x16d8, size 0x30
        hash_6c116eea1f7184ec hash_2d77264f82d15ce9;
        // offset 0x1708, size 0x30
        hash_6c116eea1f7184ec currencyspent;
        // offset 0x1738, size 0x28
        hash_2b6b162a9af31225 hash_8a87d7e3ebe607d;
        // offset 0x1760, size 0x48
        hash_18a8724145eb9652 hash_47685630580f6b5f;
        // offset 0x17a8, size 0x30
        hash_6c116eea1f7184ec shields_built;
        // offset 0x17d8, size 0x30
        hash_6c116eea1f7184ec hash_5f9b7801af13f397;
        // offset 0x1808, size 0x30
        hash_6c116eea1f7184ec zm_daily_rebuild_windows;
        // offset 0x1838, size 0x30
        hash_6c116eea1f7184ec bouncingbetty_devil_planted;
        // offset 0x1868, size 0x30
        hash_6c116eea1f7184ec special_weapon_used;
        // offset 0x1898, size 0x30
        hash_6c116eea1f7184ec hash_1c45a8ee71e29e37;
        // offset 0x18c8, size 0x30
        hash_6c116eea1f7184ec sentry_kills;
        // offset 0x18f8, size 0x30
        hash_6c116eea1f7184ec hash_200feebda8bd7fdc;
        // offset 0x1928, size 0x18
        hash_25508de9fa29a5d5 hash_2e6acfd71294b7b2;
        // offset 0x1940, size 0x18
        hash_25508de9fa29a5d5 hash_496b7df7d20acf3f;
        // offset 0x1958, size 0x30
        hash_6c116eea1f7184ec double_pap_kills;
        // offset 0x1988, size 0x30
        hash_6c116eea1f7184ec hash_69c883351adc20ae;
        // offset 0x19b8, size 0x30
        hash_6c116eea1f7184ec shield_charge_pickedup;
        // offset 0x19e8, size 0x30
        hash_6c116eea1f7184ec tr_kills;
        // offset 0x1a18, size 0x18
        hash_25508de9fa29a5d5 hash_42acd971be8883ca;
        // offset 0x1a30, size 0x30
        hash_6c116eea1f7184ec pap_activation;
        // offset 0x1a60, size 0x30
        hash_6c116eea1f7184ec prison_brutus_killed;
        // offset 0x1a90, size 0x30
        hash_6c116eea1f7184ec hash_1bcba17070395533;
        // offset 0x1ac0, size 0x30
        hash_6c116eea1f7184ec catalyst_waters_killed;
        // offset 0x1af0, size 0x30
        hash_6c116eea1f7184ec hash_794996196e74a949;
        // offset 0x1b20, size 0x30
        hash_6c116eea1f7184ec hash_733f619bc1c13bdd;
        // offset 0x1b50, size 0x18
        hash_25508de9fa29a5d5 hash_4ef27120f6db2c08;
        // offset 0x1b68, size 0x30
        hash_6c116eea1f7184ec lifetime_earnings;
        // offset 0x1b98, size 0x30
        hash_6c116eea1f7184ec gum_gobbler_powerups;
        // offset 0x1bc8, size 0x30
        hash_6c116eea1f7184ec cheat_total;
        // offset 0x1bf8, size 0x30
        hash_6c116eea1f7184ec towers_acid_trap_built_ra;
        // offset 0x1c28, size 0x38
        hash_77427c7b6edfc9f points_spent;
        // offset 0x1c60, size 0x30
        hash_6c116eea1f7184ec cheat_out_of_playable;
        // offset 0x1c90, size 0x30
        hash_6c116eea1f7184ec wonder_weapon_kills;
        // offset 0x1cc0, size 0x30
        hash_6c116eea1f7184ec claymores_pickedup;
        // offset 0x1cf0, size 0x18
        hash_25508de9fa29a5d5 hash_2cdc2e63d373fa5;
        // offset 0x1d08, size 0x30
        hash_6c116eea1f7184ec prison_ee_spoon_acquired;
        // offset 0x1d38, size 0x30
        hash_6c116eea1f7184ec wlratio;
        // offset 0x1d68, size 0x30
        hash_6c116eea1f7184ec cheat_too_friendly;
        // offset 0x1d98, size 0x30
        hash_6c116eea1f7184ec claymore_kills;
        // offset 0x1dc8, size 0x28
        hash_2b6b162a9af31225 hash_4875a86cf7ec6745;
        // offset 0x1df0, size 0x30
        hash_6c116eea1f7184ec hash_7ac3980eb0c9f12d;
        // offset 0x1e20, size 0x30
        hash_6c116eea1f7184ec total_rounds_survived;
        // offset 0x1e50, size 0x30
        hash_6c116eea1f7184ec grabbed_from_perk_random;
        // offset 0x1e80, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_mastery;
        // offset 0x1eb0, size 0x30
        hash_6c116eea1f7184ec sacrifices;
        // offset 0x1ee0, size 0x30
        hash_6c116eea1f7184ec pistol_kills;
        // offset 0x1f10, size 0x18
        hash_25508de9fa29a5d5 hash_1142e61cc04c2fe0;
        // offset 0x1f28, size 0x30
        hash_6c116eea1f7184ec hash_69f53cb2579fba3e;
        // offset 0x1f58, size 0x30
        hash_6c116eea1f7184ec hash_5a65e8030a21c479;
        // offset 0x1f88, size 0x30
        hash_6c116eea1f7184ec hash_2d90c6cd4a46b575;
        // offset 0x1fb8, size 0x30
        hash_6c116eea1f7184ec hash_5913a206f4ee760c;
        // offset 0x1fe8, size 0x30
        hash_6c116eea1f7184ec perks_drank;
        // offset 0x2018, size 0x30
        hash_6c116eea1f7184ec gametypeban;
        // offset 0x2048, size 0x30
        hash_6c116eea1f7184ec grenade_kills;
        // offset 0x2078, size 0x30
        hash_6c116eea1f7184ec hash_7f6ac9c9bb5c39e5;
        // offset 0x20a8, size 0x30
        hash_6c116eea1f7184ec laststatsbackup;
        // offset 0x20d8, size 0x30
        hash_6c116eea1f7184ec bouncingbetty_holly_pickedup;
        // offset 0x2108, size 0x30
        hash_6c116eea1f7184ec hash_4bb632268a7ca18c;
        // offset 0x2138, size 0x30
        hash_6c116eea1f7184ec zspiders_killed;
        // offset 0x2168, size 0x30
        hash_6c116eea1f7184ec power_turnedon;
        // offset 0x2198, size 0x30
        hash_6c116eea1f7184ec ballistic_knives_pickedup;
        // offset 0x21c8, size 0x30
        hash_6c116eea1f7184ec killed_by_catalyst_water;
        // offset 0x21f8, size 0x30
        hash_6c116eea1f7184ec hash_5c5cab0cce302a01;
        // offset 0x2228, size 0x28
        hash_2b6b162a9af31225 hash_126352a9fac39755;
        // offset 0x2250, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_catalyst;
        // offset 0x2280, size 0x30
        hash_6c116eea1f7184ec hash_112c92d966d3f90b;
        // offset 0x22b0, size 0x30
        hash_6c116eea1f7184ec survivalist_board;
        // offset 0x22e0, size 0x30
        hash_6c116eea1f7184ec hash_50bf31e073d80214;
        // offset 0x2310, size 0x30
        hash_6c116eea1f7184ec hash_40d2ff74fd37a2ab;
        // offset 0x2340, size 0x30
        hash_6c116eea1f7184ec hash_5582b2cbefa813;
        // offset 0x2370, size 0x30
        hash_6c116eea1f7184ec pap_weapon_packed;
        // offset 0x23a0, size 0x30
        hash_6c116eea1f7184ec rounds_no_downs;
        // offset 0x23d0, size 0x30
        hash_6c116eea1f7184ec zm_daily_challenge_start_time;
        // offset 0x2400, size 0x28
        hash_2b6b162a9af31225 hash_3e083f22bda48c75;
        // offset 0x2428, size 0x28
        hash_2b6b162a9af31225 hash_47d0077c9de2f754;
        // offset 0x2450, size 0x30
        hash_6c116eea1f7184ec acid_bomb_kills;
        // offset 0x2480, size 0x30
        hash_6c116eea1f7184ec hash_2d2527906ee644b3;
        // offset 0x24b0, size 0x30
        hash_6c116eea1f7184ec zdog_rounds_lost;
        // offset 0x24e0, size 0x18
        hash_25508de9fa29a5d5 hash_299fa8ecbb5da105;
        // offset 0x24f8, size 0x30
        hash_6c116eea1f7184ec hash_2f238d964d0b6267;
        // offset 0x2528, size 0x18
        hash_25508de9fa29a5d5 secondary_mastery;
        // offset 0x2540, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_kill_explosives;
        // offset 0x2570, size 0x30
        hash_6c116eea1f7184ec zraps_killed;
        // offset 0x25a0, size 0x30
        hash_6c116eea1f7184ec hash_5d098efca02f7c99;
        // offset 0x25d0, size 0x30
        hash_6c116eea1f7184ec survivalist_buy_door;
        // offset 0x2600, size 0x30
        hash_6c116eea1f7184ec survivalist_buy_perk;
        // offset 0x2630, size 0x30
        hash_6c116eea1f7184ec zdogs_killed;
        // offset 0x2660, size 0x30
        hash_6c116eea1f7184ec hash_31c3f50baa002a76;
        // offset 0x2690, size 0x30
        hash_6c116eea1f7184ec failed_revives;
        // offset 0x26c0, size 0x18
        hash_25508de9fa29a5d5 hash_2fa95a1e2e9331fd;
        // offset 0x26d8, size 0x30
        hash_6c116eea1f7184ec survivalist_mastery;
        // offset 0x2708, size 0x30
        hash_6c116eea1f7184ec hash_3499a1ccc18c05aa;
        // offset 0x2738, size 0x30
        hash_6c116eea1f7184ec hash_3ebae93ea866519c;
        // offset 0x2768, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_frostbite;
        // offset 0x2798, size 0x30
        hash_6c116eea1f7184ec zm_daily_challenge_ingame_time;
        // offset 0x27c8, size 0x18
        hash_25508de9fa29a5d5 hash_367ce404273b24f;
        // offset 0x27e0, size 0x30
        hash_6c116eea1f7184ec hash_29e6ec48e9101f71;
        // offset 0x2810, size 0x30
        hash_6c116eea1f7184ec cur_win_streak;
        // offset 0x2840, size 0x30
        hash_6c116eea1f7184ec perk_electric_cherry_kills;
        // offset 0x2870, size 0x28
        hash_2b6b162a9af31225 hash_55a9d01ff8e56605;
        // offset 0x2898, size 0x30
        hash_6c116eea1f7184ec nuke_pickedup;
        // offset 0x28c8, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_kill_headshot;
        // offset 0x28f8, size 0x30
        hash_6c116eea1f7184ec hash_47646e52fcbb190e;
        // offset 0x2928, size 0x30
        hash_6c116eea1f7184ec hash_3621f03d7659cd81;
        // offset 0x2958, size 0x30
        hash_6c116eea1f7184ec failed_sacrifices;
        // offset 0x2988, size 0x30
        hash_6c116eea1f7184ec gum_gobbler_phoenix_up;
        // offset 0x29b8, size 0x30
        hash_6c116eea1f7184ec hash_730e40ef22de352;
        // offset 0x29e8, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_kill_crawler;
        // offset 0x2a18, size 0x30
        hash_6c116eea1f7184ec paragon_icon_id;
        // offset 0x2a48, size 0x30
        hash_6c116eea1f7184ec zthrashers_killed;
        // offset 0x2a78, size 0x30
        hash_6c116eea1f7184ec combined_rank;
        // offset 0x2aa8, size 0x18
        hash_25508de9fa29a5d5 weapons_mastery;
        // offset 0x2ac0, size 0x30
        hash_6c116eea1f7184ec double_points_pickedup;
        // offset 0x2af0, size 0x30
        hash_6c116eea1f7184ec accuracy;
        // offset 0x2b20, size 0x28
        hash_2b6b162a9af31225 hash_60c9ebb1a81af3d;
        // offset 0x2b48, size 0x30
        hash_6c116eea1f7184ec hash_6d551a71b5461906;
        // offset 0x2b78, size 0x30
        hash_6c116eea1f7184ec hash_2126e77556d8e66b;
        // offset 0x2ba8, size 0x18
        hash_25508de9fa29a5d5 special_crossbow_gold;
        // offset 0x2bc0, size 0x30
        hash_6c116eea1f7184ec hash_653fe75f9cf9752a;
        // offset 0x2bf0, size 0x30
        hash_6c116eea1f7184ec pack_a_punch_pickedup;
        // offset 0x2c20, size 0x28
        hash_2b6b162a9af31225 hash_42069dbf612bfcf4;
        // offset 0x2c48, size 0x30
        hash_6c116eea1f7184ec perks_full;
        // offset 0x2c78, size 0x30
        hash_6c116eea1f7184ec hash_108042c8bd6693fb;
        // offset 0x2ca8, size 0x30
        hash_6c116eea1f7184ec stokers_killed;
        // offset 0x2cd8, size 0x30
        hash_6c116eea1f7184ec hash_987ee09c426334;
        // offset 0x2d08, size 0x30
        hash_6c116eea1f7184ec zm_daily_purchase_magic_box;
        // offset 0x2d38, size 0x18
        hash_25508de9fa29a5d5 hash_335ad5d90b73c973;
        // offset 0x2d50, size 0x30
        hash_6c116eea1f7184ec hash_188b35d19b03d60f;
        // offset 0x2d80, size 0x28
        hash_2b6b162a9af31225 hash_187d12f2253c1058;
        // offset 0x2da8, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_headshots_in_row;
        // offset 0x2dd8, size 0x30
        hash_6c116eea1f7184ec suicides;
        // offset 0x2e08, size 0x18
        hash_25508de9fa29a5d5 secondary_mastery_pistol;
        // offset 0x2e20, size 0x30
        hash_6c116eea1f7184ec hash_6dd1118d38426588;
        // offset 0x2e50, size 0x18
        hash_25508de9fa29a5d5 hash_159fd29d46091f2c;
        // offset 0x2e68, size 0x30
        hash_6c116eea1f7184ec hash_19d6a97f1553f96f;
        // offset 0x2e98, size 0x28
        hash_2b6b162a9af31225 hash_761a5ef7ab6e507f;
        // offset 0x2ec0, size 0x30
        hash_6c116eea1f7184ec buildables_built;
        // offset 0x2ef0, size 0x30
        hash_6c116eea1f7184ec tigers_killed;
        // offset 0x2f20, size 0x30
        hash_6c116eea1f7184ec catalysts_killed;
        // offset 0x2f50, size 0x30
        hash_6c116eea1f7184ec hash_4d3e2513e68c6848;
        // offset 0x2f80, size 0x30
        hash_6c116eea1f7184ec ar_kills;
        // offset 0x2fb0, size 0x30
        hash_6c116eea1f7184ec zm_is_daily_challenge_active;
        // offset 0x2fe0, size 0x30
        hash_6c116eea1f7184ec ww_grenade_pickedup;
        // offset 0x3010, size 0x30
        hash_6c116eea1f7184ec hash_17647a679184947d;
        // offset 0x3040, size 0x30
        hash_6c116eea1f7184ec hash_79ba5b62b95a7eb6;
        // offset 0x3070, size 0x30
        hash_6c116eea1f7184ec zm_current_daily_challenge;
        // offset 0x30a0, size 0x30
        hash_6c116eea1f7184ec heavy_kills;
        // offset 0x30d0, size 0x30
        hash_6c116eea1f7184ec extra_lives_pickedup;
        // offset 0x3100, size 0x30
        hash_6c116eea1f7184ec shields_purchased;
        // offset 0x3130, size 0x30
        hash_6c116eea1f7184ec hash_385398b8acbf8b4a;
        // offset 0x3160, size 0x18
        hash_25508de9fa29a5d5 ar_peacekeeper_gold;
        // offset 0x3178, size 0x28
        hash_2b6b162a9af31225 hash_3d392c6f96aa2ac1;
        // offset 0x31a0, size 0x30
        hash_6c116eea1f7184ec hash_7de12be102824219;
        // offset 0x31d0, size 0x30
        hash_6c116eea1f7184ec prison_acid_trap_used;
        // offset 0x3200, size 0x18
        hash_25508de9fa29a5d5 hash_74ae17ad1b32b3ba;
        // offset 0x3218, size 0x30
        hash_6c116eea1f7184ec hash_455678c15cd3bb55;
        // offset 0x3248, size 0x30
        hash_6c116eea1f7184ec badhostcount;
        // offset 0x3278, size 0x18
        hash_25508de9fa29a5d5 hash_2c05c0d9d29dfc93;
        // offset 0x3290, size 0x30
        hash_6c116eea1f7184ec zm_daily_earn_5k_with_2x;
        // offset 0x32c0, size 0x30
        hash_6c116eea1f7184ec survivalist_revive;
        // offset 0x32f0, size 0x30
        hash_6c116eea1f7184ec talisman_used;
        // offset 0x3320, size 0x18
        hash_25508de9fa29a5d5 smg_mp40_gold;
        // offset 0x3338, size 0x30
        hash_6c116eea1f7184ec blightfathers_killed;
        // offset 0x3368, size 0x38
        hash_77427c7b6edfc9f darkops_kills;
        // offset 0x33a0, size 0x30
        hash_6c116eea1f7184ec cheat_too_many_weapons;
        // offset 0x33d0, size 0x30
        hash_6c116eea1f7184ec hash_23d2d5674d304c2d;
        // offset 0x3400, size 0x30
        hash_6c116eea1f7184ec aat_catalyst_kills;
        // offset 0x3430, size 0x30
        hash_6c116eea1f7184ec hash_72a217263c8a78f;
        // offset 0x3460, size 0x58
        intstat paragon_rankxp;
        // offset 0x34b8, size 0x30
        hash_6c116eea1f7184ec hash_16aa183f2c51f999;
        // offset 0x34e8, size 0x30
        hash_6c116eea1f7184ec survivalist_buy_wallbuy;
        // offset 0x3518, size 0x30
        hash_6c116eea1f7184ec frag_kills;
        // offset 0x3548, size 0x18
        hash_25508de9fa29a5d5 smg_mp40_for_diamond;
        // offset 0x3560, size 0x30
        hash_6c116eea1f7184ec hash_60b6e9332c734ad8;
        // offset 0x3590, size 0x30
        hash_6c116eea1f7184ec hash_41d41d501c70fb30;
        // offset 0x35c0, size 0x30
        hash_6c116eea1f7184ec catalyst_corrosives_killed;
        // offset 0x35f0, size 0x30
        hash_6c116eea1f7184ec zsentinel_killed;
        // offset 0x3620, size 0x30
        hash_6c116eea1f7184ec gum_gobbler_burned_out;
        // offset 0x3650, size 0x28
        hash_2b6b162a9af31225 hash_724186dbdcf5604b;
        // offset 0x3678, size 0x30
        hash_6c116eea1f7184ec boards;
        // offset 0x36a8, size 0x30
        hash_6c116eea1f7184ec hash_50d31f5c1693d096;
        // offset 0x36d8, size 0x30
        hash_6c116eea1f7184ec hash_1b192689f4c8c402;
        // offset 0x3708, size 0x30
        hash_6c116eea1f7184ec gum_gobbler_anywhere_but_here;
        // offset 0x3738, size 0x30
        hash_6c116eea1f7184ec killed_by_tiger;
        // offset 0x3768, size 0x30
        hash_6c116eea1f7184ec mini_boss_kills;
        // offset 0x3798, size 0x30
        hash_6c116eea1f7184ec survivalist_buy_magic_box;
        // offset 0x37c8, size 0x30
        hash_6c116eea1f7184ec deaths;
        // offset 0x37f8, size 0x30
        hash_6c116eea1f7184ec hash_461f4cde5d994295;
        // offset 0x3828, size 0x18
        hash_25508de9fa29a5d5 hash_6dcabfb7d8122d8a;
        // offset 0x3840, size 0x30
        hash_6c116eea1f7184ec bouncingbetty_devil_pickedup;
        // offset 0x3870, size 0x30
        hash_6c116eea1f7184ec perk_mule_kick_kills;
        // offset 0x38a0, size 0x30
        hash_6c116eea1f7184ec sniper_kills;
        // offset 0x38d0, size 0x30
        hash_6c116eea1f7184ec highest_round_reached;
        // offset 0x3900, size 0x30
        hash_6c116eea1f7184ec distance_traveled;
        // offset 0x3930, size 0x30
        hash_6c116eea1f7184ec insta_kill_pickedup;
        // offset 0x3960, size 0x30
        hash_6c116eea1f7184ec fast_travels;
        // offset 0x3990, size 0x30
        hash_6c116eea1f7184ec hash_d0eb45f997dadf0;
        // offset 0x39c0, size 0x28
        hash_2b6b162a9af31225 hash_63eaeba20510d879;
        // offset 0x39e8, size 0x18
        hash_25508de9fa29a5d5 hash_1de982bb9af8c4bc;
        // offset 0x3a00, size 0x18
        hash_25508de9fa29a5d5 weapons_mastery_lmg;
        // offset 0x3a18, size 0x18
        hash_25508de9fa29a5d5 weapons_mastery_smg;
        // offset 0x3a30, size 0x30
        hash_6c116eea1f7184ec crimson_nosferatus_killed;
        // offset 0x3a60, size 0x30
        hash_6c116eea1f7184ec pap_weapon_double_packed;
        // offset 0x3a90, size 0x18
        hash_25508de9fa29a5d5 weapons_mastery_assault;
        // offset 0x3aa8, size 0x30
        hash_6c116eea1f7184ec lmg_kills;
        // offset 0x3ad8, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_brain_decay;
        // offset 0x3b08, size 0x30
        hash_6c116eea1f7184ec rounds_no_damage;
        // offset 0x3b38, size 0x30
        hash_6c116eea1f7184ec minigun_pickedup;
        // offset 0x3b68, size 0x30
        hash_6c116eea1f7184ec hash_133575f669ffc55c;
        // offset 0x3b98, size 0x58
        intstat lastxp;
        // offset 0x3bf0, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_mg;
        // offset 0x3c20, size 0x30
        hash_6c116eea1f7184ec killed_by_nova_crawler;
        // offset 0x3c50, size 0x30
        hash_6c116eea1f7184ec hash_758b3285de8999f;
        // offset 0x3c80, size 0x30
        hash_6c116eea1f7184ec zmarcade_key_pickedup;
        // offset 0x3cb0, size 0x30
        hash_6c116eea1f7184ec hash_24ccc77cf1df2b49;
        // offset 0x3ce0, size 0x30
        hash_6c116eea1f7184ec misses;
        // offset 0x3d10, size 0x30
        hash_6c116eea1f7184ec hash_70871175c2650a70;
        // offset 0x3d40, size 0x30
        hash_6c116eea1f7184ec zm_daily_challenge_games_played;
        // offset 0x3d70, size 0x30
        hash_6c116eea1f7184ec hash_35c05a1d6c5fb3e1;
        // offset 0x3da0, size 0x30
        hash_6c116eea1f7184ec werewolves_killed;
        // offset 0x3dd0, size 0x30
        hash_6c116eea1f7184ec plevel;
        // offset 0x3e00, size 0x30
        hash_6c116eea1f7184ec claymores_planted;
        // offset 0x3e30, size 0x30
        hash_6c116eea1f7184ec hash_6b67d5b1604e1d1c;
        // offset 0x3e60, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_kill_melee;
        // offset 0x3e90, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_blightfather;
        // offset 0x3ec0, size 0x30
        hash_6c116eea1f7184ec zm_daily_drink_perks;
        // offset 0x3ef0, size 0x30
        hash_6c116eea1f7184ec smg_kills;
        // offset 0x3f20, size 0x30
        hash_6c116eea1f7184ec bats_killed;
        // offset 0x3f50, size 0x30
        hash_6c116eea1f7184ec hash_328d6e683a2addc2;
        // offset 0x3f80, size 0x30
        hash_6c116eea1f7184ec zm_daily_purchase_perks;
        // offset 0x3fb0, size 0x30
        hash_6c116eea1f7184ec shield_kills;
        // offset 0x3fe0, size 0x28
        hash_2b6b162a9af31225 hash_7abb8b097502f705;
        // offset 0x4008, size 0x30
        hash_6c116eea1f7184ec hash_34f185c936027147;
        // offset 0x4038, size 0x58
        intstat rankxp;
        // offset 0x4090, size 0x18
        hash_25508de9fa29a5d5 hash_3fa60224fea08f53;
        // offset 0x40a8, size 0x18
        hash_25508de9fa29a5d5 ar_peacekeeper_for_diamond;
        // offset 0x40c0, size 0x30
        hash_6c116eea1f7184ec rounds;
        // offset 0x40f0, size 0x30
        hash_6c116eea1f7184ec use_magicbox;
        // offset 0x4120, size 0x30
        hash_6c116eea1f7184ec brutuses_killed;
        // offset 0x4150, size 0x18
        hash_25508de9fa29a5d5 hash_1618546aad5f38af;
        // offset 0x4168, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_explosion_multikill;
        // offset 0x4198, size 0x30
        hash_6c116eea1f7184ec zraz_killed;
        // offset 0x41c8, size 0x28
        hash_2b6b162a9af31225 hash_4b99dab1df6f7c26;
        // offset 0x41f0, size 0x30
        hash_6c116eea1f7184ec perk_slider_kills;
        // offset 0x4220, size 0x30
        hash_6c116eea1f7184ec hash_2d17e37ec186e78a;
        // offset 0x4250, size 0x30
        hash_6c116eea1f7184ec killed_by_blightfather;
        // offset 0x4280, size 0x18
        hash_25508de9fa29a5d5 hash_685060487df5e226;
        // offset 0x4298, size 0x30
        hash_6c116eea1f7184ec dung_pickedup;
        // offset 0x42c8, size 0x30
        hash_6c116eea1f7184ec hash_7a406e363a7db141;
        // offset 0x42f8, size 0x30
        hash_6c116eea1f7184ec carpenter_pickedup;
        // offset 0x4328, size 0x30
        hash_6c116eea1f7184ec kdratio;
        // offset 0x4358, size 0x18
        hash_25508de9fa29a5d5 hash_611902725bf24955;
        // offset 0x4370, size 0x30
        hash_6c116eea1f7184ec codpoints;
        // offset 0x43a0, size 0x30
        hash_6c116eea1f7184ec hero_weapon_power_pickedup;
        // offset 0x43d0, size 0x30
        hash_6c116eea1f7184ec maxed_special_weapon_kills;
        // offset 0x4400, size 0x30
        hash_6c116eea1f7184ec timewhennexthost;
        // offset 0x4430, size 0x30
        hash_6c116eea1f7184ec killed_by_catalyst_corrosive;
        // offset 0x4460, size 0x30
        hash_6c116eea1f7184ec prison_tomahawk_acquired;
        // offset 0x4490, size 0x30
        hash_6c116eea1f7184ec hash_e58ba79c8a9b24;
        // offset 0x44c0, size 0x30
        hash_6c116eea1f7184ec hash_c59a95e3be43538;
        // offset 0x44f0, size 0x18
        hash_25508de9fa29a5d5 hash_58137b440d749bf1;
        // offset 0x4508, size 0x30
        hash_6c116eea1f7184ec hash_3b4358ad4b022950;
        // offset 0x4538, size 0x18
        hash_25508de9fa29a5d5 hash_2b4c258f868cbe38;
        // offset 0x4550, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_bowie;
        // offset 0x4580, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_heavy;
        // offset 0x45b0, size 0x30
        hash_6c116eea1f7184ec assists;
        // offset 0x45e0, size 0x30
        hash_6c116eea1f7184ec melee_kills;
        // offset 0x4610, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_melee;
        // offset 0x4640, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_nuked;
        // offset 0x4670, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_rifle;
        // offset 0x46a0, size 0x18
        hash_25508de9fa29a5d5 hash_791f8416bde65df1;
        // offset 0x46b8, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_tiger;
        // offset 0x46e8, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_traps;
        // offset 0x4718, size 0x18
        hash_25508de9fa29a5d5 hash_2b97c2a087bfa40d;
        // offset 0x4730, size 0x30
        hash_6c116eea1f7184ec hash_3e5b9b81d573d194;
        // offset 0x4760, size 0x30
        hash_6c116eea1f7184ec prison_fan_trap_used;
        // offset 0x4790, size 0x30
        hash_6c116eea1f7184ec hash_1f1b8254f54f2598;
        // offset 0x47c0, size 0x30
        hash_6c116eea1f7184ec hash_35ab7dfe675d26e9;
        // offset 0x47f0, size 0x30
        hash_6c116eea1f7184ec hash_4b011cd0269a8502;
        // offset 0x4820, size 0x30
        hash_6c116eea1f7184ec hash_27399de28b76c5c6;
        // offset 0x4850, size 0x30
        hash_6c116eea1f7184ec scepter_revives;
        // offset 0x4880, size 0x30
        hash_6c116eea1f7184ec kills_equipment;
        // offset 0x48b0, size 0x30
        hash_6c116eea1f7184ec hash_3e1a66815798ba48;
        // offset 0x48e0, size 0x30
        hash_6c116eea1f7184ec zwasp_killed;
        // offset 0x4910, size 0x30
        hash_6c116eea1f7184ec use_perk_random;
        // offset 0x4940, size 0x30
        hash_6c116eea1f7184ec hash_2eed193144ed0fee;
        // offset 0x4970, size 0x30
        hash_6c116eea1f7184ec bouncingbetty_holly_planted;
        // offset 0x49a0, size 0x30
        hash_6c116eea1f7184ec killed_by_werewolf;
        // offset 0x49d0, size 0x30
        hash_6c116eea1f7184ec hash_18cc2a45d11a4e80;
        // offset 0x4a00, size 0x30
        hash_6c116eea1f7184ec hash_65a6063dd5dc5425;
        // offset 0x4a30, size 0x30
        hash_6c116eea1f7184ec weighted_downs;
        // offset 0x4a60, size 0x18
        hash_25508de9fa29a5d5 hash_38b6f2ae0bee048f;
        // offset 0x4a78, size 0x18
        hash_25508de9fa29a5d5 hash_2945ea3049954763;
        // offset 0x4a90, size 0x30
        hash_6c116eea1f7184ec hash_29bf8d4ddf84dd24;
        // offset 0x4ac0, size 0x30
        hash_6c116eea1f7184ec hash_7ea82afc1c790346;
        // offset 0x4af0, size 0x18
        hash_25508de9fa29a5d5 hash_4b541bb81f48fcf0;
        // offset 0x4b08, size 0x30
        hash_6c116eea1f7184ec zm_daily_round_10;
        // offset 0x4b38, size 0x30
        hash_6c116eea1f7184ec zm_daily_round_15;
        // offset 0x4b68, size 0x30
        hash_6c116eea1f7184ec zm_daily_round_20;
        // offset 0x4b98, size 0x30
        hash_6c116eea1f7184ec zm_daily_round_25;
        // offset 0x4bc8, size 0x30
        hash_6c116eea1f7184ec zm_daily_round_30;
        // offset 0x4bf8, size 0x30
        hash_6c116eea1f7184ec full_ammo_pickedup;
        // offset 0x4c28, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_crawler;
        // offset 0x4c58, size 0x28
        hash_2b6b162a9af31225 hash_99ba99f674f9d66;
        // offset 0x4c80, size 0x30
        hash_6c116eea1f7184ec hash_2a72be53205a8db3;
        // offset 0x4cb0, size 0x30
        hash_6c116eea1f7184ec bonus_points_team_pickedup;
        // offset 0x4ce0, size 0x30
        hash_6c116eea1f7184ec total_downs;
        // offset 0x4d10, size 0x30
        hash_6c116eea1f7184ec total_shots;
        // offset 0x4d40, size 0x28
        hash_2b6b162a9af31225 hash_41dbde77a9bbd206;
        // offset 0x4d68, size 0x30
        hash_6c116eea1f7184ec hash_291e79475ac19854;
        // offset 0x4d98, size 0x28
        hash_2b6b162a9af31225 hash_42eeb786529ab781;
        // offset 0x4dc0, size 0x30
        hash_6c116eea1f7184ec hash_2dd24a7c45283d98;
        // offset 0x4df0, size 0x30
        hash_6c116eea1f7184ec island_seed_pickedup;
        // offset 0x4e20, size 0x28
        hash_2b6b162a9af31225 hash_7306afe514a8738d;
        // offset 0x4e48, size 0x30
        hash_6c116eea1f7184ec bouncingbetty_planted;
        // offset 0x4e78, size 0x18
        hash_25508de9fa29a5d5 hash_4582cf1eda8b8959;
        // offset 0x4e90, size 0x30
        hash_6c116eea1f7184ec special_weapon_levels;
        // offset 0x4ec0, size 0x30
        hash_6c116eea1f7184ec killed_by_catalyst_electric;
        // offset 0x4ef0, size 0x30
        hash_6c116eea1f7184ec player_returns;
        // offset 0x4f20, size 0x28
        hash_2b6b162a9af31225 hash_69968eeceaa2059a;
        // offset 0x4f48, size 0x30
        hash_6c116eea1f7184ec hash_44077c71bca8da4c;
        // offset 0x4f78, size 0x30
        hash_6c116eea1f7184ec leaderboardfailures;
        // offset 0x4fa8, size 0x30
        hash_6c116eea1f7184ec killed_by_catalyst;
        // offset 0x4fd8, size 0x30
        hash_6c116eea1f7184ec nowhere_but_there_revives;
        // offset 0x5008, size 0x30
        hash_6c116eea1f7184ec prison_spinning_trap_used;
        // offset 0x5038, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_packed;
        // offset 0x5068, size 0x30
        hash_6c116eea1f7184ec hash_43bd32b7705f38fd;
        // offset 0x5098, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_pistol;
        // offset 0x50c8, size 0x30
        hash_6c116eea1f7184ec headshots;
        // offset 0x50f8, size 0x28
        hash_2b6b162a9af31225 hash_5cf945d7954a39e0;
        // offset 0x5120, size 0x30
        hash_6c116eea1f7184ec teamkills;
        // offset 0x5150, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_kill_o_watt;
        // offset 0x5180, size 0x30
        hash_6c116eea1f7184ec hash_3fa2584a22ebf623;
        // offset 0x51b0, size 0x30
        hash_6c116eea1f7184ec use_pap;
        // offset 0x51e0, size 0x30
        hash_6c116eea1f7184ec gum_gobbler_consume;
        // offset 0x5210, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_headshots;
        // offset 0x5240, size 0x30
        hash_6c116eea1f7184ec zm_daily_kills_sniper;
        // offset 0x5270, size 0x28
        hash_2b6b162a9af31225 hash_3ddb9f36bb12df84;
        // offset 0x5298, size 0x30
        hash_6c116eea1f7184ec hash_2eb016a9af7e8a3;
        // offset 0x52c8, size 0x30
        hash_6c116eea1f7184ec bowie_kills;
        // offset 0x52f8, size 0x30
        hash_6c116eea1f7184ec hash_67970ded10f84169;
        // offset 0x5328, size 0x30
        hash_6c116eea1f7184ec pap_weapon_grabbed;
        // offset 0x5358, size 0x18
        hash_25508de9fa29a5d5 hash_32ab694ade75156d;
        // offset 0x5370, size 0x30
        hash_6c116eea1f7184ec hash_57535c6fade520d3;
        // offset 0x53a0, size 0x30
        hash_6c116eea1f7184ec zombie_hunter_plasmatic_burst;
        // offset 0x53d0, size 0x28
        hash_2b6b162a9af31225 hash_60d94e10cacba8cb;
        // offset 0x53f8, size 0x30
        hash_6c116eea1f7184ec catalyst_electrics_killed;
        // offset 0x5428, size 0x30
        hash_6c116eea1f7184ec sessionbans;
        // offset 0x5458, size 0x30
        hash_6c116eea1f7184ec mappackmask;
        // offset 0x5488, size 0x1
        bool hash_516183f89adeace1;
        // offset 0x5489, size 0x1
        bool hash_4ff2cd40a877db2f;
        // offset 0x548a, size 0x1
        bool hash_41e6d91af864e15a;
        // offset 0x548b, size 0x5
        uint:1 __pad[5];
    };

    // idx 32 members 121 size 0x528
    struct hash_6cef3682083171db {
        // offset 0x0, size 0x8
        byte doors_purchased;
        // offset 0x8, size 0x10
        short hits;
        // offset 0x18, size 0x40
        uint64 xuid;
        // offset 0x58, size 0x8
        byte downs;
        // offset 0x60, size 0x8
        int:7 drops;
        // offset 0x68, size 0x8
        uint:8 bgbs_chewed;
        // offset 0x70, size 0x8
        byte kills;
        // offset 0x78, size 0x20
        uint score;
        // offset 0x98, size 0x8
        int:7 wallbuy_weapons_purchased;
        // offset 0xa0, size 0x8
        int:6 specialty_deadshot_drank;
        // offset 0xa8, size 0x20
        int startingzone;
        // offset 0xc8, size 0x8
        int:6 killed_by_brutus;
        // offset 0xd0, size 0x8
        int:8 catalyst_plasmas_killed;
        // offset 0xd8, size 0x20
        int time_played_total;
        // offset 0xf8, size 0x8
        int:8 gladiators_killed;
        // offset 0x100, size 0x8
        int:5 power_turnedoff;
        // offset 0x108, size 0x8
        int:6 killed_by_crimson_nosferatu;
        // offset 0x110, size 0x8
        int:8 nova_crawlers_killed;
        // offset 0x118, size 0x20
        int endingzone;
        // offset 0x138, size 0x8
        byte gumballoffered;
        // offset 0x140, size 0x8
        int:4 hash_61ab9b1fe717c788;
        // offset 0x148, size 0x8
        int:6 specialty_fastreload_drank;
        // offset 0x150, size 0x8
        int:3 hash_6f146f46a0a2a22d;
        // offset 0x158, size 0x8
        int:6 killed_by_gladiator;
        // offset 0x160, size 0x8
        int:6 killed_by_nosferatu;
        // offset 0x168, size 0x8
        int:6 killed_by_stoker;
        // offset 0x170, size 0x8
        int:8 planted_buildables_pickedup;
        // offset 0x178, size 0x8
        int:8 upgraded_ammo_purchased;
        // offset 0x180, size 0x8
        int:6 hash_2cbf90cf690a2bf5;
        // offset 0x188, size 0x10
        short windowsboarded;
        // offset 0x198, size 0x8
        int:6 killed_by_catalyst_plasma;
        // offset 0x1a0, size 0x8
        int:8 ammo_purchased;
        // offset 0x1a8, size 0x8
        int:6 killed_by_zdog;
        // offset 0x1b0, size 0x8
        int:6 grabbed_from_magicbox;
        // offset 0x1b8, size 0x8
        int:6 hash_1730001079b9bb8b;
        // offset 0x1c0, size 0x8
        int:6 pap_weapon_not_grabbed;
        // offset 0x1c8, size 0x20
        uint scoreearned;
        // offset 0x1e8, size 0x8
        int:8 nosferatus_killed;
        // offset 0x1f0, size 0x8
        byte revives;
        // offset 0x1f8, size 0x8
        byte special_weapon_used;
        // offset 0x200, size 0x8
        int:8 catalyst_waters_killed;
        // offset 0x208, size 0x8
        byte wonder_weapon_kills;
        // offset 0x210, size 0x8
        int:7 claymores_pickedup;
        // offset 0x218, size 0x20
        uint scorespent;
        // offset 0x238, size 0x8
        int:8 sacrifices;
        // offset 0x240, size 0x8
        int:8 hash_1fe46d3f08c0f775;
        // offset 0x248, size 0x8
        byte perks_drank;
        // offset 0x250, size 0x8
        byte grenade_kills;
        // offset 0x258, size 0x8
        int:5 power_turnedon;
        // offset 0x260, size 0x8
        int:7 ballistic_knives_pickedup;
        // offset 0x268, size 0x8
        int:6 killed_by_catalyst_water;
        // offset 0x270, size 0x8
        int:6 pap_weapon_packed;
        // offset 0x278, size 0x8
        int:8 zdogs_killed;
        // offset 0x280, size 0x8
        int:8 failed_revives;
        // offset 0x288, size 0x8
        int:5 hash_34b5c3e59fa8806;
        // offset 0x290, size 0x8
        int:4 nuke_pickedup;
        // offset 0x298, size 0x8
        int:8 failed_sacrifices;
        // offset 0x2a0, size 0x8
        int:4 double_points_pickedup;
        // offset 0x2a8, size 0x8
        int:6 specialty_death_dash_drank;
        // offset 0x2b0, size 0x8
        int:4 hash_34a94a124319e4d8;
        // offset 0x2b8, size 0x8
        int:8 stokers_killed;
        // offset 0x2c0, size 0x10
        short hits_taken;
        // offset 0x2d0, size 0x8
        byte suicides;
        // offset 0x2d8, size 0x8
        int:7 buildables_built;
        // offset 0x2e0, size 0x10
        short gumballmachinetimedeciseconds;
        // offset 0x2f0, size 0x8
        int:8 tigers_killed;
        // offset 0x2f8, size 0x8
        int:8 catalysts_killed;
        // offset 0x300, size 0x8
        int:6 specialty_quickrevive_drank;
        // offset 0x308, size 0x8
        int:8 shields_purchased;
        // offset 0x310, size 0x8
        int:8 hash_20b9fe0537e68b52;
        // offset 0x318, size 0x8
        int:6 hash_537fbb0922d067e4;
        // offset 0x320, size 0x8
        int:6 specialty_etherealrazor_drank;
        // offset 0x328, size 0x8
        int:6 specialty_additionalprimaryweapon_drank;
        // offset 0x330, size 0x8
        int:8 blightfathers_killed;
        // offset 0x338, size 0x8
        int:6 specialty_wolf_protector_drank;
        // offset 0x340, size 0x8
        int:8 catalyst_corrosives_killed;
        // offset 0x348, size 0x10
        short boards;
        // offset 0x358, size 0x8
        int:6 killed_by_tiger;
        // offset 0x360, size 0x8
        byte deaths;
        // offset 0x368, size 0x20
        uint distance_traveled;
        // offset 0x388, size 0x8
        int:4 insta_kill_pickedup;
        // offset 0x390, size 0x8
        int:8 crimson_nosferatus_killed;
        // offset 0x398, size 0x8
        int:6 hash_3e81af6f59379d91;
        // offset 0x3a0, size 0x8
        byte gumballholding;
        // offset 0x3a8, size 0x8
        int:6 specialty_armorvest_drank;
        // offset 0x3b0, size 0x8
        int:6 killed_by_nova_crawler;
        // offset 0x3b8, size 0x10
        short misses;
        // offset 0x3c8, size 0x8
        int:8 werewolves_killed;
        // offset 0x3d0, size 0x8
        int:7 claymores_planted;
        // offset 0x3d8, size 0x8
        int:8 bats_killed;
        // offset 0x3e0, size 0x8
        int:6 use_magicbox;
        // offset 0x3e8, size 0x8
        int:8 brutuses_killed;
        // offset 0x3f0, size 0x8
        int:6 killed_by_blightfather;
        // offset 0x3f8, size 0x8
        int:4 carpenter_pickedup;
        // offset 0x400, size 0x8
        int:6 hash_62802f6702919d2a;
        // offset 0x408, size 0x8
        int:6 killed_by_catalyst_corrosive;
        // offset 0x410, size 0x8
        byte melee_kills;
        // offset 0x418, size 0x8
        byte hash_6a1827943bd32f02;
        // offset 0x420, size 0x8
        byte hash_6a1828943bd330b5;
        // offset 0x428, size 0x8
        byte hash_6a1825943bd32b9c;
        // offset 0x430, size 0x8
        int:4 meat_stink_pickedup;
        // offset 0x438, size 0x8
        int:6 killed_by_werewolf;
        // offset 0x440, size 0x20
        int gumballmachinex;
        // offset 0x460, size 0x20
        int gumballmachiney;
        // offset 0x480, size 0x20
        int gumballmachinez;
        // offset 0x4a0, size 0x8
        int:4 full_ammo_pickedup;
        // offset 0x4a8, size 0x8
        int:6 hash_7f79e7bd2aeb30df;
        // offset 0x4b0, size 0x10
        short total_shots;
        // offset 0x4c0, size 0x8
        int:6 killed_by_catalyst_electric;
        // offset 0x4c8, size 0x8
        int:6 killed_by_catalyst;
        // offset 0x4d0, size 0x8
        byte headshots;
        // offset 0x4d8, size 0x8
        byte hash_1625854dcdcd498b;
        // offset 0x4e0, size 0x8
        byte hash_1625844dcdcd47d8;
        // offset 0x4e8, size 0x8
        byte hash_1625874dcdcd4cf1;
        // offset 0x4f0, size 0x8
        int:6 use_pap;
        // offset 0x4f8, size 0x20
        uint hash_413781c59b1b3913;
        // offset 0x518, size 0x8
        int:8 catalyst_electrics_killed;
        // offset 0x520, size 0x1
        bool gumballtaken;
        // offset 0x521, size 0x1
        bool ghostball;
        // offset 0x522, size 0x1
        bool gumballfiresale;
        // offset 0x523, size 0x5
        uint:1 __pad[5];
    };

    // idx 33 members 4 size 0x33e0
    struct hash_799ba263ba2ce91e {
        // offset 0x0, size 0x10
        short numplayers;
        // offset 0x10, size 0x3390
        hash_6cef3682083171db player[10];
        // offset 0x33a0, size 0x20
        int roundstart;
        // offset 0x33c0, size 0x20
        int roundend;
    };

    // idx 34 members 8 size 0x80
    struct hash_48cae9b9fcff7a5e {
        // offset 0x0, size 0x10
        short hits;
        // offset 0x10, size 0x10
        uint:10 index;
        // offset 0x20, size 0x20
        uint kills;
        // offset 0x40, size 0x10
        short shots;
        // offset 0x50, size 0x8
        byte deathsduringuse;
        // offset 0x58, size 0x8
        uint:8 hash_36f7fa2d825ec851;
        // offset 0x60, size 0x10
        short timeused;
        // offset 0x70, size 0x10
        short headshots;
    };

    // idx 35 members 1 size 0x5490
    struct hash_19b7fd3ee0d97cf {
        // offset 0x0, size 0x5490
        globalstats global_stats;
    };

    // idx 36 members 7 size 0xf0
    struct hash_70eb821ca470e26b {
        // offset 0x0, size 0x60
        int event_pos[3];
        // offset 0x60, size 0x10
        uint:16 player_index;
        // offset 0x70, size 0x10
        short event_type;
        // offset 0x80, size 0x20
        int optional1;
        // offset 0xa0, size 0x20
        int optional2;
        // offset 0xc0, size 0x20
        uint time_ms;
        // offset 0xe0, size 0x10
        uint:16 round_num;
    };

    // idx 37 members 5 size 0x2278
    struct hash_256aa27edf73c4fc {
        // offset 0x0, size 0x8
        byte loadoutversion;
        // offset 0x8, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x10, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0xa10, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0xa18, size 0x1860
        zmloadout customclass[10];
    };

    // idx 38 members 118 size 0x132c0
    struct player {
        // offset 0x0, size 0x20
        uint ip;
        // offset 0x20, size 0x6d8
        hash_6580ccf5f8a0ef6 dml;
        // offset 0x6f8, size 0x40
        uint64 dwid;
        // offset 0x738, size 0x8
        byte team;
        // offset 0x740, size 0x20
        int downs;
        // offset 0x760, size 0x100
        uint:16 hash_28e223b2b55169af[16];
        // offset 0x860, size 0x20
        uint boas_killed_by_catalyst_plasma;
        // offset 0x880, size 0x20
        uint boas_brutuses_killed;
        // offset 0x8a0, size 0x20
        uint hash_70237ccc7f5ac2e0;
        // offset 0x8c0, size 0x20
        uint boas_catalyst_corrosives_killed;
        // offset 0x8e0, size 0x20
        uint boas_boards;
        // offset 0x900, size 0x20
        uint boas_deaths;
        // offset 0x920, size 0x20
        uint hash_4fa2bc4e529eb995;
        // offset 0x940, size 0x20
        float skill_variance_start;
        // offset 0x960, size 0x10
        short currentdown;
        // offset 0x970, size 0x20
        uint boas_zdogs_killed;
        // offset 0x990, size 0x20
        uint boas_gladiators_killed;
        // offset 0x9b0, size 0x20
        uint boas_scoreearned;
        // offset 0x9d0, size 0xa920
        hash_19b7fd3ee0d97cf hash_548473ff98b537de[2];
        // offset 0xb2f0, size 0x20
        uint hash_3e428c87cd41cb83;
        // offset 0xb310, size 0x20
        float skill_rating_start;
        // offset 0xb330, size 0x20
        uint boas_use_pap;
        // offset 0xb350, size 0x20
        uint boas_nova_crawlers_killed;
        // offset 0xb370, size 0x20
        uint hash_25f563f42b385422;
        // offset 0xb390, size 0x20
        uint utc_connect_time_s;
        // offset 0xb3b0, size 0x20
        uint boas_killed_by_catalyst_water;
        // offset 0xb3d0, size 0x20
        uint connectivitybits;
        // offset 0xb3f0, size 0xc0
        string(24) hash_ce47f1f62861550;
        // offset 0xb4b0, size 0x20
        uint boas_doors_purchased;
        // offset 0xb4d0, size 0x20
        uint boas_headshots;
        // offset 0xb4f0, size 0x20
        uint hash_24f66fb1b7349954;
        // offset 0xb510, size 0x20
        uint start_xp;
        // offset 0xb530, size 0x20
        uint boas_killed_by_catalyst_electric;
        // offset 0xb550, size 0x20
        uint boas_nosferatus_killed;
        // offset 0xb570, size 0x20
        uint boas_killed_by_nova_crawler;
        // offset 0xb590, size 0x20
        uint hash_333f9fb8d403bc06;
        // offset 0xb5b0, size 0x4600
        hash_48cae9b9fcff7a5e itembuffer[140];
        // offset 0xfbb0, size 0x20
        uint boas_killed_by_blightfather;
        // offset 0xfbd0, size 0x20
        uint boas_suicides;
        // offset 0xfbf0, size 0x20
        uint boas_killed_by_gladiator;
        // offset 0xfc10, size 0x20
        uint boas_killed_by_nosferatu;
        // offset 0xfc30, size 0x20
        uint boas_distancesprinted;
        // offset 0xfc50, size 0x20
        uint boas_windowsboarded;
        // offset 0xfc70, size 0x8
        byte end_rank;
        // offset 0xfc78, size 0x78
        string(15) boas_gametype;
        // offset 0xfcf0, size 0x20
        uint boas_ammo_purchased;
        // offset 0xfd10, size 0x20
        uint boas_killed_by_zdog;
        // offset 0xfd30, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0xfd38, size 0x20
        uint boas_tigers_killed;
        // offset 0xfd58, size 0x10
        short hash_ec4aea1a8bbd82;
        // offset 0xfd68, size 0x20
        uint boas_revives;
        // offset 0xfd88, size 0x40
        uint64 macaddress;
        // offset 0xfdc8, size 0x20
        uint boas_killed_by_brutus;
        // offset 0xfde8, size 0x20
        uint boas_use_magicbox;
        // offset 0xfe08, size 0x20
        int highest_multiplier;
        // offset 0xfe28, size 0x20
        uint boas_killed_by_crimson_nosferatu;
        // offset 0xfe48, size 0x20
        uint boas_special_weapon_used;
        // offset 0xfe68, size 0x20
        uint boas_gamelength;
        // offset 0xfe88, size 0x100
        string(32) consoleid64;
        // offset 0xff88, size 0x20
        uint boas_wonder_weapon_kills;
        // offset 0xffa8, size 0x20
        uint boas_crimson_nosferatus_killed;
        // offset 0xffc8, size 0x20
        uint boas_downs;
        // offset 0xffe8, size 0x20
        uint boas_drops;
        // offset 0x10008, size 0x20
        uint boas_kills;
        // offset 0x10028, size 0x20
        uint boas_score;
        // offset 0x10048, size 0x20
        uint boas_power_turnedon;
        // offset 0x10068, size 0x20
        uint boas_killed_by_stoker;
        // offset 0x10088, size 0x20
        uint boas_killed_by_catalyst_corrosive;
        // offset 0x100a8, size 0x20
        uint hash_383d2cb19f142aa4;
        // offset 0x100c8, size 0x20
        uint boas_hits;
        // offset 0x100e8, size 0x8
        byte hash_2b2e4e83da414b1e;
        // offset 0x100f0, size 0x20
        uint boas_failed_revives;
        // offset 0x10110, size 0x40
        xhash disconnect_reason;
        // offset 0x10150, size 0x20
        uint boas_shields_purchased;
        // offset 0x10170, size 0x20
        uint boas_bats_killed;
        // offset 0x10190, size 0x20
        float skill_rating;
        // offset 0x101b0, size 0x20
        uint hash_1e346898f291a01b;
        // offset 0x101d0, size 0xc0
        client_header client;
        // offset 0x10290, size 0x20
        uint hash_5a8ecc228e978012;
        // offset 0x102b0, size 0x20
        uint end_xp;
        // offset 0x102d0, size 0x8
        uint:7 tier_boost;
        // offset 0x102d8, size 0x8
        byte prestige;
        // offset 0x102e0, size 0x20
        uint boas_catalyst_plasmas_killed;
        // offset 0x10300, size 0x20
        uint boas_melee_kills;
        // offset 0x10320, size 0x20
        uint boas_blightfathers_killed;
        // offset 0x10340, size 0x20
        uint boas_stokers_killed;
        // offset 0x10360, size 0x20
        uint boas_numzombierounds;
        // offset 0x10380, size 0x20
        uint boas_killed_by_werewolf;
        // offset 0x103a0, size 0x20
        uint hash_1e9c704afc774d03;
        // offset 0x103c0, size 0x20
        uint boas_scorespent;
        // offset 0x103e0, size 0x20
        uint total_xp;
        // offset 0x10400, size 0x20
        uint boas_total_shots;
        // offset 0x10420, size 0x20
        int upload;
        // offset 0x10440, size 0x20
        uint boas_pap_weapon_not_grabbed;
        // offset 0x10460, size 0x20
        uint hash_29a4b66bd89e48fa;
        // offset 0x10480, size 0x20
        uint boas_killed_by_catalyst;
        // offset 0x104a0, size 0x20
        uint boas_werewolves_killed;
        // offset 0x104c0, size 0x20
        uint boas_catalyst_electrics_killed;
        // offset 0x104e0, size 0x20
        uint connectedbits;
        // offset 0x10500, size 0x20
        uint utc_disconnect_time_s;
        // offset 0x10520, size 0x20
        uint boas_catalyst_waters_killed;
        // offset 0x10540, size 0x20
        uint boas_wallbuy_weapons_purchased;
        // offset 0x10560, size 0x40
        uint64 connection_id;
        // offset 0x105a0, size 0x2278
        hash_256aa27edf73c4fc cacloadouts;
        // offset 0x12818, size 0x9c0
        uint:16 hash_4bb657eb94ad1948[156];
        // offset 0x131d8, size 0x20
        float skill_variance;
        // offset 0x131f8, size 0x20
        uint boas_bgbs_chewed;
        // offset 0x13218, size 0x20
        uint hash_6997820d1006e9e1;
        // offset 0x13238, size 0x20
        uint boas_killed_by_tiger;
        // offset 0x13258, size 0x20
        uint boas_hits_taken;
        // offset 0x13278, size 0x20
        uint boas_grabbed_from_magicbox;
        // offset 0x13298, size 0x20
        uint boas_catalysts_killed;
        // offset 0x132b8, size 0x1
        bool hash_5c3a460a4b80bb21;
        // offset 0x132b9, size 0x1
        bool present_at_end;
        // offset 0x132ba, size 0x1
        bool boas_no_talisman;
        // offset 0x132bb, size 0x1
        bool is_bot;
        // offset 0x132bc, size 0x1
        bool playingonwifi;
        // offset 0x132bd, size 0x3
        uint:1 __pad[3];
    };

    // idx 39 members 12 size 0x1b0
    struct hash_2a7de7adde57550b {
        // offset 0x0, size 0x8
        byte player_index;
        // offset 0x8, size 0x20
        int hash_6e5b19c572681334;
        // offset 0x28, size 0x20
        int time_played_total;
        // offset 0x48, size 0x40
        uint64 reviver_xuid;
        // offset 0x88, size 0x10
        short hash_67e7ffe4f1c4eb88;
        // offset 0x98, size 0x20
        int downzoneindex;
        // offset 0xb8, size 0x60
        int hash_6301246c408b7b44[3];
        // offset 0x118, size 0x10
        short hash_3cad3313268b9d31;
        // offset 0x128, size 0x20
        int hash_7c5a630513a7bfd5;
        // offset 0x148, size 0x60
        int spawn_pos[3];
        // offset 0x1a8, size 0x1
        bool died;
        // offset 0x1a9, size 0x7
        uint:1 __pad[7];
    };

    // idx 40 members 15 size 0x4a8
    struct hash_5117bce61a2e0fe3 {
        // offset 0x0, size 0x8
        byte hostmigrationcount;
        // offset 0x8, size 0x78
        string(15) gametypegroup;
        // offset 0x80, size 0x50
        string(10) maplocation;
        // offset 0xd0, size 0x10
        short hash_46963b574671801d;
        // offset 0xe0, size 0x20
        uint difficulty;
        // offset 0x100, size 0x200
        string(64) localtimestring;
        // offset 0x300, size 0x40
        uint64 matchhashlow;
        // offset 0x340, size 0x10
        short numzombierounds;
        // offset 0x350, size 0x10
        short mapeventscount;
        // offset 0x360, size 0x40
        uint64 demofileid;
        // offset 0x3a0, size 0x78
        string(15) gametype;
        // offset 0x418, size 0x40
        uint64 matchhashhigh;
        // offset 0x458, size 0x20
        uint utcoffsetfromserver;
        // offset 0x478, size 0x20
        int networkprotocolversion;
        // offset 0x498, size 0x10
        short roundend;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 4 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 48 size 0x272938
    // offset 0x0, size 0x100
    string(32) map;
    // offset 0x100, size 0x20
    int loadoutversion;
    // offset 0x120, size 0x20
    uint hash_375e93395e4f1f12;
    // offset 0x140, size 0x8
    byte player_count;
    // offset 0x148, size 0x20
    uint hash_7888f9b0e8c46d42;
    // offset 0x168, size 0x20
    int hash_20e770cec441c9f2;
    // offset 0x188, size 0x20
    int hash_20e46acec43f89e9;
    // offset 0x1a8, size 0x40
    uint64 match_id;
    // offset 0x1e8, size 0x20
    int server_frame_msec;
    // offset 0x208, size 0x20
    uint hash_209155237819d179;
    // offset 0x228, size 0x20
    int gamelength;
    // offset 0x248, size 0x57e40
    hash_70eb821ca470e26b mapevents[1500];
    // offset 0x58088, size 0x1f8
    telemetry_header telemetry;
    // offset 0x58280, size 0x15180
    hash_2a7de7adde57550b downbuffer[200];
    // offset 0x6d400, size 0x100
    string(32) hash_4e397fa6657da523;
    // offset 0x6d500, size 0x20
    int hash_2678ed840a344d55;
    // offset 0x6d520, size 0x8
    byte hash_115ec7b8fbf85bae;
    // offset 0x6d528, size 0x40
    xhash game_type;
    // offset 0x6d568, size 0x100
    string(32) hash_4270d43d00e554ea;
    // offset 0x6d668, size 0x40
    uint64 host_id;
    // offset 0x6d6a8, size 0x20
    uint hash_7baa59adf52de2d1;
    // offset 0x6d6c8, size 0x60
    int compass_map_upper_left[3];
    // offset 0x6d728, size 0x8
    byte hash_53437329fef70258;
    // offset 0x6d730, size 0x20
    int playlist_id;
    // offset 0x6d750, size 0x20
    uint hash_d2c3c4dbbb08a57;
    // offset 0x6d770, size 0x8
    byte hash_63f745385e07b822;
    // offset 0x6d778, size 0x20
    uint hash_589dfa1826b4eeac;
    // offset 0x6d798, size 0x8
    byte hash_2e9e7ae5d3016cb;
    // offset 0x6d7a0, size 0xca0
    gametypesettings gametypesettings;
    // offset 0x6e440, size 0x4a8
    hash_5117bce61a2e0fe3 header;
    // offset 0x6e8e8, size 0x40
    xhash test_name;
    // offset 0x6e928, size 0x20
    int team_score;
    // offset 0x6e948, size 0x20
    uint breadcrumbs_total;
    // offset 0x6e968, size 0x144380
    hash_799ba263ba2ce91e rounds[100];
    // offset 0x1b2ce8, size 0x8
    byte player_count_left;
    // offset 0x1b2cf0, size 0x60
    int compass_map_lower_right[3];
    // offset 0x1b2d50, size 0x20
    int fastest_time_to_complete_round_30;
    // offset 0x1b2d70, size 0xbfb80
    player players[10];
    // offset 0x2728f0, size 0x20
    uint duration_ms;
    // offset 0x272910, size 0x20
    int ffotd_version;
    // offset 0x272930, size 0x1
    bool hash_706dd6b881aa67f4;
    // offset 0x272931, size 0x1
    bool hash_74d0769494af24a9;
    // offset 0x272932, size 0x1
    bool loadoutinitialized;
    // offset 0x272933, size 0x1
    bool main_quest_completed;
    // offset 0x272934, size 0x1
    bool hash_671d5b300061b30f;
    // offset 0x272935, size 0x1
    bool is_dedicated;
    // offset 0x272936, size 0x1
    bool hash_9bb341c4fe5412b;
    // offset 0x272937, size 0x1
    uint:1 __pad[1];
}

