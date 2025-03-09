// hash_24f702681f26b16e
// metatable "hash_d529e975af4df1df"

version 125 {
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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x43288
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x3d5c0
        character characters[28];
        // offset 0x41980, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x421f0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x42d80, size 0x500
        string(16) customclassname[10];
        // offset 0x43280, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x43281, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x43282, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x43283, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x27060
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x25410
        character characters[17];
        // offset 0x25498, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x26818, size 0x800
        string(16) customclassname[16];
        // offset 0x27018, size 0x10
        uint:10 killstreak1;
        // offset 0x27028, size 0x10
        uint:10 killstreak2;
        // offset 0x27038, size 0x10
        uint:10 killstreak3;
        // offset 0x27048, size 0x10
        uint:10 killstreak4;
        // offset 0x27058, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x27059, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2705a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2705b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0xa3d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8c40
        character characters[4];
        // offset 0x8cc8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x9bc8, size 0x800
        string(16) customclassname[16];
        // offset 0xa3c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xa3c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0xa3ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0xa3cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 8 size 0x1f8
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

    // idx 27 members 3 size 0xc0
    struct client_header {
        // offset 0x0, size 0x40
        uint64 hash_4016bed15f9183f7;
        // offset 0x40, size 0x40
        uint64 uno_id;
        // offset 0x80, size 0x40
        uint64 user_id;
    };

    // idx 28 members 8 size 0x6d8
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

    // idx 29 members 5 size 0xb0
    struct killstreakevent {
        // offset 0x0, size 0x60
        int event_pos[3];
        // offset 0x60, size 0x20
        uint hash_41037faade6d9357;
        // offset 0x80, size 0x8
        byte player_index;
        // offset 0x88, size 0x8
        byte event_type;
        // offset 0x90, size 0x20
        uint time_ms;
    };

    // idx 30 members 4 size 0x40
    struct hash_70fd30917359da6c {
        // offset 0x0, size 0x8
        byte player_index;
        // offset 0x8, size 0x10
        short kills_total;
        // offset 0x18, size 0x8
        byte event_type;
        // offset 0x20, size 0x20
        uint time_ms;
    };

    // idx 31 members 6 size 0x88
    struct hash_2c63a98fdae81bb5 {
        // offset 0x0, size 0x20
        int hash_375e93395e4f1f12;
        // offset 0x20, size 0x20
        int hash_209155237819d179;
        // offset 0x40, size 0x20
        uint start_time_ms;
        // offset 0x60, size 0x20
        uint end_time_ms;
        // offset 0x80, size 0x1
        bool hash_1f2c1112324566e5;
        // offset 0x81, size 0x7
        uint:1 __pad[7];
    };

    // idx 32 members 21 size 0x520
    struct hash_5117bce61a2e0fe3 {
        // offset 0x0, size 0x20
        uint hash_4f4661f71ba9b642;
        // offset 0x20, size 0x20
        uint hash_5d03a11cca20029d;
        // offset 0x40, size 0x20
        uint hash_388c001cb4f44253;
        // offset 0x60, size 0x20
        uint hash_38a7161cb50b2f6d;
        // offset 0x80, size 0x40
        uint64 gamelobbyid;
        // offset 0xc0, size 0x8
        byte hostmigrationcount;
        // offset 0xc8, size 0x20
        uint hash_178ca468b39c2feb;
        // offset 0xe8, size 0x200
        string(64) localtimestring;
        // offset 0x2e8, size 0x40
        uint64 matchhashlow;
        // offset 0x328, size 0x100
        string(32) consoleid64;
        // offset 0x428, size 0x40
        uint64 demofileid;
        // offset 0x468, size 0x40
        uint64 matchhashhigh;
        // offset 0x4a8, size 0x20
        uint hash_374014802bf0424a;
        // offset 0x4c8, size 0x10
        short hash_1e270dd38289b20c;
        // offset 0x4d8, size 0x20
        int lootxptocryptokeyratio;
        // offset 0x4f8, size 0x20
        uint utcoffsetfromserver;
        // offset 0x518, size 0x1
        bool presetclassesperteam;
        // offset 0x519, size 0x1
        bool oldschool;
        // offset 0x51a, size 0x1
        bool disablecac;
        // offset 0x51b, size 0x1
        bool disableclassselection;
        // offset 0x51c, size 0x4
        uint:1 __pad[4];
    };

    // idx 33 members 153 size 0x2d90
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
        float averagespeedduringmatch;
        // offset 0x760, size 0x10
        short kills;
        // offset 0x770, size 0x20
        uint score;
        // offset 0x790, size 0x40
        uint64 ucdid;
        // offset 0x7d0, size 0x100
        uint:16 hash_28e223b2b55169af[16];
        // offset 0x8d0, size 0x20
        int end_losses;
        // offset 0x8f0, size 0x10
        short killsdenied;
        // offset 0x900, size 0x20
        float totalkilldistances;
        // offset 0x920, size 0x20
        int end_misses;
        // offset 0x940, size 0x20
        uint match_xp;
        // offset 0x960, size 0x98
        byte hitlocations[19];
        // offset 0x9f8, size 0x20
        float numkilldistanceentries;
        // offset 0xa18, size 0x10
        uint:16 challenges;
        // offset 0xa28, size 0x20
        float skill_variance_start;
        // offset 0xa48, size 0x20
        int loottimeplayed;
        // offset 0xa68, size 0x10
        uint:16 challengescompletedcount;
        // offset 0xa78, size 0x20
        int end_prestige;
        // offset 0xa98, size 0x20
        float boostingscore;
        // offset 0xab8, size 0x20
        uint hash_3e428c87cd41cb83;
        // offset 0xad8, size 0x20
        float skill_rating_start;
        // offset 0xaf8, size 0x8
        byte hash_709c4368e326c4f6;
        // offset 0xb00, size 0x8
        byte position;
        // offset 0xb08, size 0x20
        int start_prestige;
        // offset 0xb28, size 0x20
        int controllerparticipationchecksskipped;
        // offset 0xb48, size 0x20
        uint hash_630fffa7f053a2b7;
        // offset 0xb68, size 0x20
        uint hash_3498c2a577aa328e;
        // offset 0xb88, size 0x20
        uint utc_connect_time_s;
        // offset 0xba8, size 0x20
        uint connectivitybits;
        // offset 0xbc8, size 0xc0
        string(24) hash_ce47f1f62861550;
        // offset 0xc88, size 0x20
        uint lootxpearned;
        // offset 0xca8, size 0x20
        int controllerparticipationendgameresult;
        // offset 0xcc8, size 0x20
        float percentageoftimemoving;
        // offset 0xce8, size 0x20
        uint pointstowin;
        // offset 0xd08, size 0x8
        byte party_id;
        // offset 0xd10, size 0x20
        int controllerparticipationconsecutivefailuremax;
        // offset 0xd30, size 0x20
        int start_games_played;
        // offset 0xd50, size 0x8
        byte hash_73577b207cfb7411;
        // offset 0xd58, size 0x60
        int hash_1657e02fb5073e4a[3];
        // offset 0xdb8, size 0x8
        uint:8 playerquitteamscore;
        // offset 0xdc0, size 0x20
        float totaldistancetravelled;
        // offset 0xde0, size 0x998
        byte score_events[scoreevents_e];
        // offset 0x1778, size 0x40
        uint64 hash_35e13b49beac01b0;
        // offset 0x17b8, size 0x20
        uint start_xp;
        // offset 0x17d8, size 0x20
        int objectivetime;
        // offset 0x17f8, size 0x10
        short killsconfirmed;
        // offset 0x1808, size 0x8
        uint:8 playerquitopposingteamscore;
        // offset 0x1810, size 0x10
        short player_placement;
        // offset 0x1820, size 0x10
        short highestkillstreak;
        // offset 0x1830, size 0x20
        int controllerparticipation;
        // offset 0x1850, size 0x10
        short cryptokeysbeforematch;
        // offset 0x1860, size 0x20
        float timeplayedalive;
        // offset 0x1880, size 0x10
        short num_lives;
        // offset 0x1890, size 0x20
        float timeplayedmoving;
        // offset 0x18b0, size 0x20
        float numspeedswhenmovingentries;
        // offset 0x18d0, size 0x20
        int code_client_num;
        // offset 0x18f0, size 0x20
        int end_hits;
        // offset 0x1910, size 0x8
        byte end_rank;
        // offset 0x1918, size 0x20
        int end_wins;
        // offset 0x1938, size 0x30
        short hash_68e4530b257fb42f[3];
        // offset 0x1968, size 0x20
        int end_games_played;
        // offset 0x1988, size 0x40
        uint64 lobby_id;
        // offset 0x19c8, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x19d0, size 0x20
        int end_kills;
        // offset 0x19f0, size 0x20
        int end_score;
        // offset 0x1a10, size 0x10
        short hash_ec4aea1a8bbd82;
        // offset 0x1a20, size 0x30
        short hash_2044e5ddbbd19a8e[3];
        // offset 0x1a50, size 0x20
        float hash_14813a3c1b267555;
        // offset 0x1a70, size 0x20
        uint hash_3e8d4387ea9e7f42;
        // offset 0x1a90, size 0x8
        byte hash_51db55fc1339e092;
        // offset 0x1a98, size 0x8
        uint:8 playerquitroundnumber;
        // offset 0x1aa0, size 0x100
        string(32) consoleid64;
        // offset 0x1ba0, size 0x10
        short hash_49ea128912ee851d;
        // offset 0x1bb0, size 0x8
        byte suicides;
        // offset 0x1bb8, size 0x20
        int end_total_time_played_s;
        // offset 0x1bd8, size 0x8
        byte totalkillcamsskipped;
        // offset 0x1be0, size 0x8
        byte numdogscalled;
        // offset 0x1be8, size 0x20
        int controllerparticipationchecks;
        // offset 0x1c08, size 0x10
        short hash_6c4bd48708d6ca7d;
        // offset 0x1c18, size 0x20
        int start_hits;
        // offset 0x1c38, size 0x8
        byte hash_2b2e4e83da414b1e;
        // offset 0x1c40, size 0x20
        int start_wins;
        // offset 0x1c60, size 0x40
        xhash disconnect_reason;
        // offset 0x1ca0, size 0x20
        int start_kills;
        // offset 0x1cc0, size 0x20
        int start_score;
        // offset 0x1ce0, size 0x20
        uint hash_154d42f200303577;
        // offset 0x1d00, size 0x10
        uint:9 lootxpbeforematch;
        // offset 0x1d10, size 0x20
        float skill_rating;
        // offset 0x1d30, size 0x8
        byte jointype;
        // offset 0x1d38, size 0xc0
        client_header client;
        // offset 0x1df8, size 0x10
        short deaths;
        // offset 0x1e08, size 0x20
        uint end_xp;
        // offset 0x1e28, size 0x8
        uint:7 tier_boost;
        // offset 0x1e30, size 0x8
        byte prestige;
        // offset 0x1e38, size 0x20
        int participation;
        // offset 0x1e58, size 0x8
        byte weaponpickupscount;
        // offset 0x1e60, size 0x18
        byte dailychallenges[3];
        // offset 0x1e78, size 0x30
        short hash_73dcab1bc83f37e2[3];
        // offset 0x1ea8, size 0x20
        int hash_5efee4632dc32539;
        // offset 0x1ec8, size 0x8
        byte hash_6860858624175f84;
        // offset 0x1ed0, size 0x8
        byte hash_62898b408adf277d;
        // offset 0x1ed8, size 0x20
        int hash_16618233fdac5c29;
        // offset 0x1ef8, size 0x20
        uint total_xp;
        // offset 0x1f18, size 0x10
        short upload;
        // offset 0x1f28, size 0x8
        byte numuavcalled;
        // offset 0x1f30, size 0x8
        uint:3 onboardingstate;
        // offset 0x1f38, size 0x10
        short team_placement;
        // offset 0x1f48, size 0x20
        uint hash_4325caae17068c55;
        // offset 0x1f68, size 0x8
        byte assists;
        // offset 0x1f70, size 0x20
        int playerxpmultiplier;
        // offset 0x1f90, size 0x20
        float averagekilldistance;
        // offset 0x1fb0, size 0x20
        uint connectedbits;
        // offset 0x1fd0, size 0x20
        uint utc_disconnect_time_s;
        // offset 0x1ff0, size 0x8
        byte numdogskills;
        // offset 0x1ff8, size 0x30
        short hash_e4d259ef22b4635[3];
        // offset 0x2028, size 0x20
        int controllerparticipationconsecutivesuccessmax;
        // offset 0x2048, size 0x20
        int end_unlock_points;
        // offset 0x2068, size 0x20
        int hash_70fe9df744d614f3;
        // offset 0x2088, size 0x20
        int escorttime;
        // offset 0x20a8, size 0x40
        uint64 connection_id;
        // offset 0x20e8, size 0x20
        int hash_679439e9a51687ef;
        // offset 0x2108, size 0x8
        byte platoon;
        // offset 0x2110, size 0x20
        uint score_xp;
        // offset 0x2130, size 0x20
        int start_total_time_played_s;
        // offset 0x2150, size 0x20
        int hash_136288c07ffd7b0c;
        // offset 0x2170, size 0x20
        float totalspeedswhenmoving;
        // offset 0x2190, size 0x20
        int start_deaths;
        // offset 0x21b0, size 0x9c0
        uint:16 hash_4bb657eb94ad1948[156];
        // offset 0x2b70, size 0x20
        float skill_variance;
        // offset 0x2b90, size 0x20
        int controllerparticipationinactivitywarnings;
        // offset 0x2bb0, size 0x98
        byte criticalhitlocations[19];
        // offset 0x2c48, size 0x20
        uint damage_dealt;
        // offset 0x2c68, size 0x20
        int weaponxpmultiplier;
        // offset 0x2c88, size 0x10
        short headshots;
        // offset 0x2c98, size 0x20
        int hash_1469faf3180d8b7a;
        // offset 0x2cb8, size 0x20
        int start_losses;
        // offset 0x2cd8, size 0x8
        byte teamkills;
        // offset 0x2ce0, size 0x20
        int start_misses;
        // offset 0x2d00, size 0x60
        int hash_7d9d379ecba10793[3];
        // offset 0x2d60, size 0x20
        int end_deaths;
        // offset 0x2d80, size 0x1
        bool hash_418487ab0985610b;
        // offset 0x2d81, size 0x1
        bool hash_5c3a460a4b80bb21;
        // offset 0x2d82, size 0x1
        bool hash_38793b233cd7e431;
        // offset 0x2d83, size 0x1
        bool hash_12fac6a33938170e;
        // offset 0x2d84, size 0x1
        bool present_at_end;
        // offset 0x2d85, size 0x1
        bool hash_63b95d780b2bd355;
        // offset 0x2d86, size 0x1
        bool is_bot;
        // offset 0x2d87, size 0x1
        bool playingonwifi;
        // offset 0x2d88, size 0x1
        bool controllerparticipationsuccessafterinactivitywarning;
        // offset 0x2d89, size 0x7
        uint:1 __pad[7];
    };

    // idx 34 members 72 size 0x940
    struct life {
        // offset 0x0, size 0x20
        float longest_hit_distance;
        // offset 0x20, size 0x8
        byte player_index;
        // offset 0x28, size 0x20
        uint score;
        // offset 0x48, size 0x20
        uint hash_6e5b19c572681334;
        // offset 0x68, size 0x8
        byte killer_index;
        // offset 0x70, size 0x8
        uint:8 victimdecisecondssincelastboostjump;
        // offset 0x78, size 0x30
        int:16 attacker_angles[3];
        // offset 0xa8, size 0x8
        uint:8 hash_5fd40d280de4f20a;
        // offset 0xb0, size 0x8
        uint:8 killerdecisecondssincelastkneeslide;
        // offset 0xb8, size 0x8
        uint:8 hash_66088b270a9d0d5f;
        // offset 0xc0, size 0x8
        byte attacker_index;
        // offset 0xc8, size 0x20
        uint hash_7567115bc2aa4bf;
        // offset 0xe8, size 0x60
        int attacker_pos[3];
        // offset 0x148, size 0x8
        byte hash_67e7ffe4f1c4eb88;
        // offset 0x150, size 0x10
        uint:16 victimtimespentswimmingdeciseconds;
        // offset 0x160, size 0x20
        uint xp_earned;
        // offset 0x180, size 0x10
        uint:16 victimtimespentwallrunningdeciseconds;
        // offset 0x190, size 0x60
        int victim_pos[3];
        // offset 0x1f0, size 0x10
        uint:10 attackerdelta;
        // offset 0x200, size 0x20
        uint score_earned;
        // offset 0x220, size 0x8
        uint:8 victimdecisecondssincelastwallrun;
        // offset 0x228, size 0x20
        uint hash_7c5a630513a7bfd5;
        // offset 0x248, size 0x20
        float hash_202011f4c98c00b1;
        // offset 0x268, size 0x10
        uint:10 hash_6677b86a4c2c0d54;
        // offset 0x278, size 0x40
        xhash character_decal_lootid;
        // offset 0x2b8, size 0x10
        uint:10 hash_3976a49a3ab81759;
        // offset 0x2c8, size 0x8
        byte hash_5281edda9cfbd66a;
        // offset 0x2d0, size 0x8
        uint:8 killerdecisecondssincelastboostjump;
        // offset 0x2d8, size 0x240
        xhash hash_20d6751cb2f9ca09[9];
        // offset 0x518, size 0x40
        xhash hash_4f557c87c0538129;
        // offset 0x558, size 0x40
        xhash character_outfit_lootid;
        // offset 0x598, size 0x8
        byte hash_56e7eb0d1597ec79;
        // offset 0x5a0, size 0x40
        xhash hash_63862160f8335af2;
        // offset 0x5e0, size 0x10
        uint:10 hash_9071b1ce927d040;
        // offset 0x5f0, size 0x8
        uint:8 victimdecisecondssincelastswim;
        // offset 0x5f8, size 0x10
        uint:10 victimdelta;
        // offset 0x608, size 0x10
        short means_of_death;
        // offset 0x618, size 0x30
        int:16 victim_angles[3];
        // offset 0x648, size 0x8
        byte multikill;
        // offset 0x650, size 0x10
        short hash_3ca62fd7f5d50ede;
        // offset 0x660, size 0x60
        int hash_9677cf4f08d8697[3];
        // offset 0x6c0, size 0x8
        uint:8 killerdecisecondssincelastwallrun;
        // offset 0x6c8, size 0x10
        short hash_1783a3513be4bd7c;
        // offset 0x6d8, size 0x40
        xhash specialist;
        // offset 0x718, size 0x30
        int:16 hash_648ba56f725b9077[3];
        // offset 0x748, size 0x20
        uint hash_3faf0f7b322f3cfc;
        // offset 0x768, size 0x8
        uint:8 vicitmdecisecondssincelastkneeslide;
        // offset 0x770, size 0x20
        float dotofdeath;
        // offset 0x790, size 0x40
        string(8) character_gender;
        // offset 0x7d0, size 0x8
        uint:8 killerdecisecondssincelastswim;
        // offset 0x7d8, size 0x8
        uint:8 victimnumberofkneeslides;
        // offset 0x7e0, size 0x8
        byte assists;
        // offset 0x7e8, size 0x20
        uint hash_cc61feedcebaa4d;
        // offset 0x808, size 0x8
        uint:5 character_outfit;
        // offset 0x810, size 0x40
        xhash hash_4b4bd85ab964d386;
        // offset 0x850, size 0x60
        int spawn_pos[3];
        // offset 0x8b0, size 0x40
        xhash character_warpaint_lootid;
        // offset 0x8f0, size 0x8
        uint:5 character_warpaint_outfit;
        // offset 0x8f8, size 0x8
        uint:8 victimnumberofboostjumps;
        // offset 0x900, size 0x20
        uint hash_1167938b851224e;
        // offset 0x920, size 0x1
        bool died;
        // offset 0x921, size 0x1
        bool hash_7e25889643b8fe1b;
        // offset 0x922, size 0x1
        bool killersweaponaltmode;
        // offset 0x923, size 0x1
        bool hash_244864600cc60ac8;
        // offset 0x924, size 0x1
        bool hash_35ccbe74e6d95ab5;
        // offset 0x925, size 0x1
        bool hash_37c081085bfecffa;
        // offset 0x926, size 0x1
        bool hash_61cc3ce6a5e5b529;
        // offset 0x927, size 0x1
        bool hash_37fd9537b3e20888;
        // offset 0x928, size 0x1
        bool hash_2f090963f5d45718;
        // offset 0x929, size 0x1
        bool hash_47ca5f583ae26a22;
        // offset 0x92a, size 0x11
        bool hash_1a3b58ae3753c6f8[events];
        // offset 0x93b, size 0x5
        uint:1 __pad[5];
    };

    // idx 35 members 4 size 0xd0
    struct hash_6455b0739942db12 {
        // offset 0x0, size 0x40
        xhash item;
        // offset 0x40, size 0x60
        int event_pos[3];
        // offset 0xa0, size 0x20
        uint time_ms;
        // offset 0xc0, size 0x10
        uint:9 life_index;
    };

    // idx 36 members 4 size 0xd0
    struct hash_4cc3ca9227e9ee6e {
        // offset 0x0, size 0x40
        xhash item;
        // offset 0x40, size 0x60
        int event_pos[3];
        // offset 0xa0, size 0x20
        uint time_ms;
        // offset 0xc0, size 0x10
        uint:9 life_index;
    };

    // idx 37 members 8 size 0xe8
    struct hash_40387f9bff6d9d3c {
        // offset 0x0, size 0x8
        uint:4 hits;
        // offset 0x8, size 0x40
        xhash item;
        // offset 0x48, size 0x60
        int event_pos[3];
        // offset 0xa8, size 0x8
        uint:4 shots;
        // offset 0xb0, size 0x20
        uint time_ms;
        // offset 0xd0, size 0x10
        uint:9 life_index;
        // offset 0xe0, size 0x1
        bool expirationthroughdeath;
        // offset 0xe1, size 0x7
        uint:1 __pad[7];
    };

    // idx 38 members 3 size 0x28
    struct hash_5efdb8ef8b6af1cb {
        // offset 0x0, size 0x10
        uint:9 victimlifeindex;
        // offset 0x10, size 0x8
        uint:8 killstreakindex;
        // offset 0x18, size 0x10
        uint:9 killerlifeindex;
    };

    // idx 39 members 6 size 0x260
    struct hash_c464eb471b1c18a {
        // offset 0x0, size 0x40
        xhash hash_62e7261a9dd66829;
        // offset 0x40, size 0x8
        byte playerindex;
        // offset 0x48, size 0x200
        string(64) challengestring;
        // offset 0x248, size 0x8
        uint:8 itemindex;
        // offset 0x250, size 0x8
        uint:8 statsmilestonescsvnum;
        // offset 0x258, size 0x8
        uint:8 challengetier;
    };

    // idx 40 members 6 size 0x100
    struct deathcircle {
        // offset 0x0, size 0x20
        float wait_sec;
        // offset 0x20, size 0x20
        float scale_sec;
        // offset 0x40, size 0x20
        float damage_interval;
        // offset 0x60, size 0x20
        int damage;
        // offset 0x80, size 0x60
        int origin[3];
        // offset 0xe0, size 0x20
        int radius;
    };

    // idx 41 members 3 size 0x88
    struct hash_298025d6535ffa40 {
        // offset 0x0, size 0x40
        xhash zone_name;
        // offset 0x40, size 0x40
        xhash item_name;
        // offset 0x80, size 0x8
        uint:5 item_count;
    };

    // idx 42 members 14 size 0x100
    struct aizone {
        // offset 0x0, size 0x40
        xhash name;
        // offset 0x40, size 0x8
        uint:4 death_circle;
        // offset 0x48, size 0x8
        uint:3 zone_hellhounds;
        // offset 0x50, size 0x8
        uint:3 hash_46c66659061c4df6;
        // offset 0x58, size 0x8
        uint:4 hash_468f7191e8118876;
        // offset 0x60, size 0x8
        uint:5 hash_3bd0e72c0da688b8;
        // offset 0x68, size 0x8
        uint:2 hash_78530caab146b8b2;
        // offset 0x70, size 0x8
        uint:2 hash_7c33a0c7c454cdeb;
        // offset 0x78, size 0x60
        int origin[3];
        // offset 0xd8, size 0x8
        uint:3 zone_activated;
        // offset 0xe0, size 0x8
        uint:5 hash_2778c481a1f0f691;
        // offset 0xe8, size 0x8
        uint:3 zone_brutus;
        // offset 0xf0, size 0x8
        uint:4 hash_2f54ea56d60207e4;
        // offset 0xf8, size 0x8
        uint:3 zone_blightfather;
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

    // idx 5 members 24
    enum meansofdeath {
        mod_explosive, // 0x0,
        mod_telefrag, // 0x1,
        mod_grenade, // 0x2,
        mod_unknown, // 0x3,
        mod_post_game, // 0x4,
        mod_burned, // 0x5,
        mod_melee_weapon_butt, // 0x6,
        mod_rifle_bullet, // 0x7,
        mod_crush, // 0x8,
        mod_projectile, // 0x9,
        mod_electrocuted, // 0xa,
        mod_hit_by_object, // 0xb,
        mod_head_shot, // 0xc,
        mod_grenade_splash, // 0xd,
        mod_melee_assassinate, // 0xe,
        mod_pistol_bullet, // 0xf,
        mod_projectile_splash, // 0x10,
        mod_impact, // 0x11,
        mod_drown, // 0x12,
        mod_melee, // 0x13,
        mod_trigger_hurt, // 0x14,
        mod_suicide, // 0x15,
        mod_gas, // 0x16,
        mod_falling, // 0x17
    };

    // idx 6 members 17
    enum events {
        buzzkill, // 0x0,
        assaulting, // 0x1,
        firstblood, // 0x2,
        defusing, // 0x3,
        longshot, // 0x4,
        carrying, // 0x5,
        assistedsuicide, // 0x6,
        killstreak, // 0x7,
        execution, // 0x8,
        defending, // 0x9,
        planting, // 0xa,
        defender, // 0xb,
        posthumous, // 0xc,
        comeback, // 0xd,
        revenge, // 0xe,
        avenger, // 0xf,
        headshot, // 0x10
    };

    // idx 7 members 307
    enum scoreevents_e {
        counter_uav_assist, // 0x0,
        assist_flash, // 0x1,
        optic_camo_kill, // 0x2,
        defused_bomb_last_man_alive, // 0x3,
        retrieve_own_tags, // 0x4,
        hash_313dc1283175a02, // 0x5,
        gelgun_multikill_2, // 0x6,
        annihilator_multikill_2, // 0x7,
        hacked_uav, // 0x8,
        hash_446d4826a38438c, // 0x9,
        uninterrupted_obit_feed_kills, // 0xa,
        flamethrower_multikill_2, // 0xb,
        hacked_counteruav, // 0xc,
        hacked_satellite, // 0xd,
        assist_emp, // 0xe,
        hq_destroyed, // 0xf,
        hover_rcxd_kill, // 0x10,
        disarm_hacked_care_package, // 0x11,
        hash_6c13d938ab90061, // 0x12,
        suicide, // 0x13,
        kill_enemy_after_death, // 0x14,
        hash_95270c3a7b3f486, // 0x15,
        share_care_package, // 0x16,
        killed_bowlauncher_enemy, // 0x17,
        kill_enemy_who_is_speedbursting, // 0x18,
        kill_enemy_with_more_ammo_oic, // 0x19,
        annihilator_kill, // 0x1a,
        hash_c103a57bdbf94dd, // 0x1b,
        kill_enemy_while_stunned, // 0x1c,
        hash_ccaa673a5d7041b, // 0x1d,
        hash_cea2cf8570190db, // 0x1e,
        capture_enemy_crate, // 0x1f,
        escort_robot_disable, // 0x20,
        koth_secure, // 0x21,
        hash_e04f3035798378d, // 0x22,
        heatwave_kill, // 0x23,
        end_enemy_psychosis, // 0x24,
        hash_1071cf93d87489fb, // 0x25,
        team_kill, // 0x26,
        hash_112fadad4b5d840a, // 0x27,
        flag_grab, // 0x28,
        hash_113928d60e53dfe1, // 0x29,
        kill_underwater_enemy_explosive, // 0x2a,
        gelgun_multikill, // 0x2b,
        first_kill, // 0x2c,
        hpm_suppress, // 0x2d,
        quickly_secure_point, // 0x2e,
        hacked_killstreak_protection, // 0x2f,
        hash_156609c5b075a8ae, // 0x30,
        destroyed_trophy_system, // 0x31,
        hash_170fea11fe7de6e7, // 0x32,
        dom_point_secured, // 0x33,
        hash_17edb6b68a001f59, // 0x34,
        armblades_kill, // 0x35,
        flag_carrier_kill_return_close, // 0x36,
        kill_enemy_with_their_weapon, // 0x37,
        raps_kill, // 0x38,
        hash_1acd9e99eabf5080, // 0x39,
        completed_match, // 0x3a,
        killed_dog, // 0x3b,
        downed_player, // 0x3c,
        killstreak_8, // 0x3d,
        killstreak_9, // 0x3e,
        killstreak_2, // 0x3f,
        killstreak_3, // 0x40,
        killstreak_4, // 0x41,
        killstreak_5, // 0x42,
        killstreak_6, // 0x43,
        killstreak_7, // 0x44,
        hash_1ecdac7d70cffddf, // 0x45,
        kill_enemy_grenade_throwback, // 0x46,
        hash_1f70f320390df72c, // 0x47,
        won_match, // 0x48,
        kill_enemies_one_bullet, // 0x49,
        kill_enemy_while_flashbanged, // 0x4a,
        kill_enemy_that_used_resurrect, // 0x4b,
        hash_2326e0e41c5e790f, // 0x4c,
        hash_233f7edfe0b05dbe, // 0x4d,
        kill_enemy_one_bullet, // 0x4e,
        hash_23a674d2ecf323fe, // 0x4f,
        killed_enemy_while_carrying_flag, // 0x50,
        killed_minigun_enemy, // 0x51,
        hash_26185ebdf182fe1d, // 0x52,
        hash_26d28bf9e79156e0, // 0x53,
        hash_26d2c4a807a3e16b, // 0x54,
        hash_27dad6d784f5e83e, // 0x55,
        assisted_suicide, // 0x56,
        melee_leader_gun, // 0x57,
        mothership_assist_kill, // 0x58,
        kill_enemy_that_is_using_optic_camo, // 0x59,
        lightninggun_multikill, // 0x5a,
        kill_sd, // 0x5b,
        sentinel_kill, // 0x5c,
        kill_enemy_with_hacked_care_package, // 0x5d,
        destroyed_remote_missile, // 0x5e,
        flag_capture, // 0x5f,
        killstreak_more_than_30, // 0x60,
        hash_2fefd31ae2a021e0, // 0x61,
        kill_enemy_while_sliding, // 0x62,
        kill_enemy_that_is_wallrunning, // 0x63,
        defused_bomb, // 0x64,
        kill_enemy_while_capping_dom, // 0x65,
        killed_armblades_enemy, // 0x66,
        gelgun_kill, // 0x67,
        electrified, // 0x68,
        kill_denied, // 0x69,
        kill_enemy_injuring_teammate, // 0x6a,
        aircraft_flare_assist, // 0x6b,
        hash_3292cdf061996209, // 0x6c,
        bomb_detonated, // 0x6d,
        hash_332eb22437d12ae6, // 0x6e,
        hash_335e75276452517a, // 0x6f,
        hash_3368e127645b5d83, // 0x70,
        hash_336f70276460bc2e, // 0x71,
        kill_enemy_who_has_high_score, // 0x72,
        hash_33f3e57b5a556807, // 0x73,
        assist_25, // 0x74,
        assist_75, // 0x75,
        assist_50, // 0x76,
        longshot_kill, // 0x77,
        hash_3602655194af1e28, // 0x78,
        revenge_kill, // 0x79,
        destroyed_tac_insert, // 0x7a,
        hash_3799ece9776712f5, // 0x7b,
        dart_kill, // 0x7c,
        dom_point_neutral_secured, // 0x7d,
        kill_enemy_who_is_using_focus, // 0x7e,
        hash_3a1fa22fa29528e7, // 0x7f,
        flamethrower_multikill, // 0x80,
        killed_attacker, // 0x81,
        hash_3a5eaaf8d03d8f10, // 0x82,
        hash_3b82ba992d5ae488, // 0x83,
        kill_enemy_who_has_powerarmor, // 0x84,
        kill_enemy_when_injured, // 0x85,
        killed_bomb_planter, // 0x86,
        assist_concussion, // 0x87,
        kill_in_3_seconds_gun, // 0x88,
        minigun_multikill_2, // 0x89,
        destroyed_claymore, // 0x8a,
        backstabber_kill, // 0x8b,
        kill_enemy_while_in_air, // 0x8c,
        hash_423dabc44273f6cb, // 0x8d,
        hash_423dacc44273f87e, // 0x8e,
        hash_423dadc44273fa31, // 0x8f,
        sentry_gun_kill, // 0x90,
        killed_dog_assist, // 0x91,
        hash_4394cdd031e4272c, // 0x92,
        combat_robot_kill, // 0x93,
        destroyed_combat_robot, // 0x94,
        hash_46b6299d2fce3776, // 0x95,
        destroyed_bouncingbetty, // 0x96,
        hash_488af6388b81ad58, // 0x97,
        kill_enemy_with_care_package_crush, // 0x98,
        escort_robot_disable_assist_50, // 0x99,
        escort_robot_disable_assist_25, // 0x9a,
        hash_495df1bd31bf7bba, // 0x9b,
        hash_497ea90172a82b12, // 0x9c,
        escort_robot_escort_goal, // 0x9d,
        shield_blocked_damage, // 0x9e,
        hash_4bcb83b1a39c5c8e, // 0x9f,
        rescue_flag_carrier, // 0xa0,
        killed_gelgun_enemy, // 0xa1,
        emp_assist, // 0xa2,
        hash_4d69456db152f5a5, // 0xa3,
        destroyed_shield, // 0xa4,
        bowlauncher_multikill, // 0xa5,
        hash_51c71d7db0e27c9d, // 0xa6,
        trophy_defense, // 0xa7,
        flamethrower_kill, // 0xa8,
        multikill_more_than_8, // 0xa9,
        shield_blocked_damage_reduced, // 0xaa,
        hash_52abffb28461993b, // 0xab,
        hacked_dart, // 0xac,
        hash_532ef081664c1d6d, // 0xad,
        stop_enemy_killstreak, // 0xae,
        optic_camo_capture_objective, // 0xaf,
        minigun_kill, // 0xb0,
        hash_54305d3c97781673, // 0xb1,
        escort_robot_escort, // 0xb2,
        hardpoint_kill, // 0xb3,
        hash_55ac6aa1f99f2fa1, // 0xb4,
        escort_robot_disable_near_goal, // 0xb5,
        armblades_multikill, // 0xb6,
        hash_56581115240dd9db, // 0xb7,
        hash_5721da03722c632b, // 0xb8,
        hash_582dfe7a00b5db59, // 0xb9,
        destroyed_helicopter_giunit_drop, // 0xba,
        hacked_mothership, // 0xbb,
        kill_enemy_that_heatwaved_you, // 0xbc,
        kill_enemy_while_using_psychosis, // 0xbd,
        hash_5a40685d5a3dac3c, // 0xbe,
        hash_5aa91fb1d4010928, // 0xbf,
        hash_5b5829eb65f58fea, // 0xc0,
        hash_5be2722d390b060b, // 0xc1,
        resurrect_kill, // 0xc2,
        reboot_robot, // 0xc3,
        destroyed_helicopter_agr_drop, // 0xc4,
        focus_earn_scorestreak, // 0xc5,
        kill_enemy_who_killed_teammate, // 0xc6,
        clear_2_attackers, // 0xc7,
        hash_5d6aa79e0e308ca2, // 0xc8,
        hash_5d6f7fc5ce73166e, // 0xc9,
        kill_enemy_while_both_in_air, // 0xca,
        hash_5e417d3ad081d60e, // 0xcb,
        killed_flamethrower_enemy, // 0xcc,
        armblades_multikill_2, // 0xcd,
        hacked_autoturret, // 0xce,
        killed_bomb_defuser, // 0xcf,
        kill_confirmed, // 0xd0,
        humiliation_gun, // 0xd1,
        bowlauncher_multikill_2, // 0xd2,
        shield_assist, // 0xd3,
        killed_defender, // 0xd4,
        hash_658ad0ee7468d1e9, // 0xd5,
        hash_6637cc9a0ee9c570, // 0xd6,
        hash_665ed726363e8b77, // 0xd7,
        hacked_rcbomb, // 0xd8,
        hash_679b0b2d035a256e, // 0xd9,
        assist_proximity, // 0xda,
        hash_68634aca4e3c1ae6, // 0xdb,
        bowlauncher_kill, // 0xdc,
        hash_6a0d078cab2c142e, // 0xdd,
        c4_multikill, // 0xde,
        knife_with_ammo_oic, // 0xdf,
        speed_burst_kill, // 0xe0,
        hatchet_kill, // 0xe1,
        focus_earn_multiscorestreak, // 0xe2,
        microwave_turret_assist, // 0xe3,
        hash_6dcbcbcbe69d31fb, // 0xe4,
        teammate_kill_confirmed, // 0xe5,
        kill, // 0xe6,
        hash_7044f404f9735b47, // 0xe7,
        hash_71b3df7fa2af0a16, // 0xe8,
        hash_71babcd3787132f6, // 0xe9,
        hash_71ed5667d93ff41d, // 0xea,
        vision_pulse_kill, // 0xeb,
        comeback_from_deathstreak, // 0xec,
        hash_722402e7712a3370, // 0xed,
        survivor, // 0xee,
        microwave_turret_kill, // 0xef,
        kill_confirmed_multi, // 0xf0,
        defend_flag_carrier, // 0xf1,
        bounce_hatchet_kill, // 0xf2,
        death, // 0xf3,
        destroyed_plane_mortar, // 0xf4,
        hash_749ea84d7c098477, // 0xf5,
        hash_74c93d98bfd57cf1, // 0xf6,
        hash_74d4d90db8e3856b, // 0xf7,
        kill_enemy_with_gunbutt, // 0xf8,
        hash_7633b9087328afdd, // 0xf9,
        kill_flag_carrier, // 0xfa,
        destroyed_dart, // 0xfb,
        minigun_multikill, // 0xfc,
        hacked, // 0xfd,
        multikill_8, // 0xfe,
        multikill_3, // 0xff,
        multikill_2, // 0x100,
        multikill_7, // 0x101,
        multikill_6, // 0x102,
        multikill_5, // 0x103,
        multikill_4, // 0x104,
        elimination_and_last_player_alive, // 0x105,
        planted_bomb, // 0x106,
        kill_gun, // 0x107,
        hash_7970558375b871cb, // 0x108,
        kill_enemy_with_fists, // 0x109,
        final_kill_elimination, // 0x10a,
        kill_enemy_while_wallrunning, // 0x10b,
        hash_7a530d311f541318, // 0x10c,
        hash_7ad353dbba2f7dd9, // 0x10d,
        hash_7b1786a1004b465e, // 0x10e,
        hash_7bd61d3cda0a6fec, // 0x10f,
        headshot, // 0x110,
        hash_7c832209b65d0c28, // 0x111,
        melee_kill, // 0x112,
        hash_7d115f1d9abd3979, // 0x113,
        kill_enemy_that_is_in_air, // 0x114,
        traversal_kill, // 0x115,
        hash_7e54290bb0149959, // 0x116,
        escort_robot_reboot, // 0x117,
        killstreak_19, // 0x118,
        killstreak_18, // 0x119,
        killstreak_13, // 0x11a,
        killstreak_12, // 0x11b,
        killstreak_11, // 0x11c,
        killstreak_10, // 0x11d,
        killstreak_17, // 0x11e,
        killstreak_16, // 0x11f,
        killstreak_15, // 0x120,
        killstreak_14, // 0x121,
        killstreak_28, // 0x122,
        killstreak_29, // 0x123,
        killstreak_26, // 0x124,
        killstreak_27, // 0x125,
        killstreak_24, // 0x126,
        killstreak_25, // 0x127,
        killstreak_22, // 0x128,
        killstreak_23, // 0x129,
        killstreak_20, // 0x12a,
        killstreak_21, // 0x12b,
        killstreak_30, // 0x12c,
        flag_return, // 0x12d,
        power_armor_kill, // 0x12e,
        uav_assist, // 0x12f,
        hash_7f93049491be6104, // 0x130,
        hash_7fc37e28bad8da01, // 0x131,
        hash_7fcdd1e43d78a610, // 0x132
    };

    // idx 0 members 65 size 0x2a0f40
    // offset 0x0, size 0x100
    string(32) map;
    // offset 0x100, size 0x20
    int loadoutversion;
    // offset 0x120, size 0x20
    uint hash_375e93395e4f1f12;
    // offset 0x140, size 0xf00
    deathcircle death_circle[15];
    // offset 0x1040, size 0x8
    byte player_count;
    // offset 0x1048, size 0x20
    uint hash_7888f9b0e8c46d42;
    // offset 0x1068, size 0x11b480
    life lives[490];
    // offset 0x11c4e8, size 0x1388
    hash_5efdb8ef8b6af1cb nondamageassists[125];
    // offset 0x11d870, size 0x40
    uint64 match_id;
    // offset 0x11d8b0, size 0x20
    int server_frame_msec;
    // offset 0x11d8d0, size 0x20
    uint hash_209155237819d179;
    // offset 0x11d8f0, size 0x8
    byte hash_5be2776e72fe7105;
    // offset 0x11d8f8, size 0x20
    int item_spawn_seed;
    // offset 0x11d918, size 0x1f8
    telemetry_header telemetry;
    // offset 0x11db10, size 0x40
    xhash playlist_name;
    // offset 0x11db50, size 0x100
    string(32) hash_4e397fa6657da523;
    // offset 0x11dc50, size 0x20
    int hash_2678ed840a344d55;
    // offset 0x11dc70, size 0x20
    int hash_6ed65ba529599bb5;
    // offset 0x11dc90, size 0x8
    byte player_count_end;
    // offset 0x11dc98, size 0x40
    xhash game_type;
    // offset 0x11dcd8, size 0x8
    byte hash_481ee9109f272237;
    // offset 0x11dce0, size 0x100
    string(32) hash_4270d43d00e554ea;
    // offset 0x11dde0, size 0x40
    uint64 host_id;
    // offset 0x11de20, size 0x20
    uint hash_7baa59adf52de2d1;
    // offset 0x11de40, size 0x60
    int compass_map_upper_left[3];
    // offset 0x11dea0, size 0xed80
    hash_c464eb471b1c18a challengescompleted[100];
    // offset 0x12cc20, size 0x55f0
    killstreakevent killstreaks[125];
    // offset 0x132210, size 0xaa0
    hash_298025d6535ffa40 hash_7357a4f64d8993b7[20];
    // offset 0x132cb0, size 0x8
    byte hash_7f29e138a8813e47;
    // offset 0x132cb8, size 0x10
    short numnondamageassists;
    // offset 0x132cc8, size 0x8
    byte bot_count;
    // offset 0x132cd0, size 0x10
    uint:16 hash_7701efac52d36b8d;
    // offset 0x132ce0, size 0x1f40
    hash_70fd30917359da6c hash_74f514e2df10ccfe[125];
    // offset 0x134c20, size 0x8
    byte hash_53437329fef70258;
    // offset 0x134c28, size 0x20
    int playlist_id;
    // offset 0x134c48, size 0x20
    uint utc_end_time_s;
    // offset 0x134c68, size 0x8
    byte hash_63f745385e07b822;
    // offset 0x134c70, size 0x20
    uint utc_start_time_s;
    // offset 0x134c90, size 0x8
    byte player_count_start;
    // offset 0x134c98, size 0x520
    hash_5117bce61a2e0fe3 header;
    // offset 0x1351b8, size 0xa00
    aizone ai_zones[10];
    // offset 0x135bb8, size 0x40
    xhash test_name;
    // offset 0x135bf8, size 0x10
    short team_count;
    // offset 0x135c08, size 0x20
    uint breadcrumbs_total;
    // offset 0x135c28, size 0x20
    int playlist_version;
    // offset 0x135c48, size 0xcc0
    hash_2c63a98fdae81bb5 rounds[24];
    // offset 0x136908, size 0x10
    uint:10 life_count;
    // offset 0x136918, size 0x8
    byte player_count_left;
    // offset 0x136920, size 0x60
    int compass_map_lower_right[3];
    // offset 0x136980, size 0x10
    short victor;
    // offset 0x136990, size 0x10
    uint:16 numchallengescompleted;
    // offset 0x1369a0, size 0x8
    byte heatmapdatagenerated;
    // offset 0x1369a8, size 0x169a70
    player players[127];
    // offset 0x2a0418, size 0x20
    uint duration_ms;
    // offset 0x2a0438, size 0x20
    int ffotd_version;
    // offset 0x2a0458, size 0xaa0
    hash_298025d6535ffa40 hash_5ca6052f03257d05[20];
    // offset 0x2a0ef8, size 0x20
    int hash_7b16fbbf75fe39b3;
    // offset 0x2a0f18, size 0x20
    int hash_5288d149bac65a79;
    // offset 0x2a0f38, size 0x1
    bool hash_706dd6b881aa67f4;
    // offset 0x2a0f39, size 0x1
    bool hash_74d0769494af24a9;
    // offset 0x2a0f3a, size 0x1
    bool is_draw;
    // offset 0x2a0f3b, size 0x1
    bool is_private_match;
    // offset 0x2a0f3c, size 0x1
    bool is_dedicated;
    // offset 0x2a0f3d, size 0x1
    bool hash_9bb341c4fe5412b;
    // offset 0x2a0f3e, size 0x2
    uint:1 __pad[2];
}

