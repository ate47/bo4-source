// gamedata/ddl/generated/cp_stats.ddl
// metatable "hash_a05a70f64959e7b7"

version 19 {
    // idx 1 members 2 size 0x30
    struct hash_6b3db80d498eb06 {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
    };

    // idx 2 members 3 size 0x20
    struct hash_5ef0b8418736fce5 {
        // offset 0x0, size 0x18
        uint:24 score;
        // offset 0x18, size 0x1
        bool valid;
        // offset 0x19, size 0x7
        uint:1 __pad[7];
    };

    // idx 3 members 4 size 0x138
    struct hash_3b0f9e0921513e2c {
        // offset 0x0, size 0x98
        byte hitlocations[19];
        // offset 0x98, size 0x98
        byte criticalhitlocations[19];
        // offset 0x130, size 0x1
        bool valid;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 4 members 6 size 0x50
    struct hash_1a52129598e71dab {
        // offset 0x0, size 0x10
        short kills;
        // offset 0x10, size 0x18
        uint:24 score;
        // offset 0x28, size 0x10
        short gametype;
        // offset 0x38, size 0x10
        short deaths;
        // offset 0x48, size 0x1
        bool valid;
        // offset 0x49, size 0x7
        uint:1 __pad[7];
    };

    // idx 5 members 14 size 0x2e8
    struct hash_656bfcb3838e2907 {
        // offset 0x0, size 0x100
        string(32) name;
        // offset 0x100, size 0x100
        string(32) xuid;
        // offset 0x200, size 0x20
        uint curxp;
        // offset 0x220, size 0x10
        short kills;
        // offset 0x230, size 0x20
        uint prvxp;
        // offset 0x250, size 0x10
        short score;
        // offset 0x260, size 0x10
        short revives;
        // offset 0x270, size 0x10
        short currank;
        // offset 0x280, size 0x10
        short deaths;
        // offset 0x290, size 0x30
        short medals[3];
        // offset 0x2c0, size 0x10
        short assists;
        // offset 0x2d0, size 0x10
        short hash_59ef59765ff3f049;
        // offset 0x2e0, size 0x1
        bool isactive;
        // offset 0x2e1, size 0x7
        uint:1 __pad[7];
    };

    // idx 6 members 6 size 0x22e8
    struct hash_6b411bb770fc8f6c {
        // offset 0x0, size 0x22e0
        hash_656bfcb3838e2907 playerstats[12];
        // offset 0x22e0, size 0x1
        bool valid;
        // offset 0x22e1, size 0x1
        bool matchwon;
        // offset 0x22e2, size 0x1
        bool privatematch;
        // offset 0x22e3, size 0x1
        bool viewed;
        // offset 0x22e4, size 0x4
        uint:1 __pad[4];
    };

    // idx 7 members 1 size 0x1
    struct hash_7690a9df20146d8a {
        // offset 0x0, size 0x1
        bool unlocked;
    };

    // idx 8 members 6 size 0x90
    struct hash_2f60329a207db2b8 {
        // offset 0x0, size 0x18
        uint:24 quit;
        // offset 0x18, size 0x18
        uint:24 started;
        // offset 0x30, size 0x18
        uint:24 completed;
        // offset 0x48, size 0x18
        uint:24 timeout;
        // offset 0x60, size 0x18
        uint:24 kicked;
        // offset 0x78, size 0x18
        uint:24 dashboard;
    };

    // idx 9 members 2 size 0x120
    struct hash_b5aec1419b9a02d {
        // offset 0x0, size 0x90
        hash_2f60329a207db2b8 hosted;
        // offset 0x90, size 0x90
        hash_2f60329a207db2b8 played;
    };

    // idx 10 members 11 size 0xb8
    struct hash_5fafb39a86bc6dc7 {
        // offset 0x0, size 0x10
        short kills;
        // offset 0x10, size 0x18
        uint:24 score;
        // offset 0x28, size 0x20
        uint startingtime;
        // offset 0x48, size 0x20
        uint endingtime;
        // offset 0x68, size 0x8
        uint:5 scoreboardposition;
        // offset 0x70, size 0x20
        float teamscoreratio;
        // offset 0x90, size 0x8
        uint:5 gametype;
        // offset 0x98, size 0x10
        short deaths;
        // offset 0xa8, size 0x8
        uint:3 quittype;
        // offset 0xb0, size 0x1
        bool forgiven;
        // offset 0xb1, size 0x7
        uint:1 __pad[7];
    };

    // idx 11 members 3 size 0x1828
    struct hash_503eb0de8f9cf7c2 {
        // offset 0x0, size 0x1700
        hash_5fafb39a86bc6dc7 matchhistory[32];
        // offset 0x1700, size 0x120
        hash_b5aec1419b9a02d modehistory;
        // offset 0x1820, size 0x8
        byte currentmatchhistoryindex;
    };

    // idx 12 members 3 size 0x60
    struct hash_4bb25d7ad41fb449 {
        // offset 0x0, size 0x20
        uint count;
        // offset 0x20, size 0x20
        uint version;
        // offset 0x40, size 0x20
        uint timewhenprobationisdone;
    };

    // idx 13 members 28 size 0x628
    struct hash_2e1d3d3bb036d22c {
        // offset 0x0, size 0x30
        hash_6b3db80d498eb06 ties;
        // offset 0x30, size 0x30
        hash_6b3db80d498eb06 wins;
        // offset 0x60, size 0x30
        hash_6b3db80d498eb06 assists;
        // offset 0x90, size 0x30
        hash_6b3db80d498eb06 crush;
        // offset 0xc0, size 0x30
        hash_6b3db80d498eb06 kills;
        // offset 0xf0, size 0x30
        hash_6b3db80d498eb06 score;
        // offset 0x120, size 0x30
        hash_6b3db80d498eb06 time_played_total;
        // offset 0x150, size 0x30
        hash_6b3db80d498eb06 challenge1;
        // offset 0x180, size 0x30
        hash_6b3db80d498eb06 challenge2;
        // offset 0x1b0, size 0x30
        hash_6b3db80d498eb06 challenge3;
        // offset 0x1e0, size 0x30
        hash_6b3db80d498eb06 challenge4;
        // offset 0x210, size 0x30
        hash_6b3db80d498eb06 challenge5;
        // offset 0x240, size 0x30
        hash_6b3db80d498eb06 challenge6;
        // offset 0x270, size 0x30
        hash_6b3db80d498eb06 challenge7;
        // offset 0x2a0, size 0x30
        hash_6b3db80d498eb06 challenge8;
        // offset 0x2d0, size 0x30
        hash_6b3db80d498eb06 challenge9;
        // offset 0x300, size 0x30
        hash_6b3db80d498eb06 win_streak;
        // offset 0x330, size 0x30
        hash_6b3db80d498eb06 cur_win_streak;
        // offset 0x360, size 0x30
        hash_6b3db80d498eb06 kill_streak;
        // offset 0x390, size 0x30
        hash_6b3db80d498eb06 deaths;
        // offset 0x3c0, size 0x30
        hash_6b3db80d498eb06 wlratio;
        // offset 0x3f0, size 0x8
        int:5 prevscoreindex;
        // offset 0x3f8, size 0x30
        hash_6b3db80d498eb06 losses;
        // offset 0x428, size 0x30
        hash_6b3db80d498eb06 defends;
        // offset 0x458, size 0x30
        hash_6b3db80d498eb06 offends;
        // offset 0x488, size 0x30
        hash_6b3db80d498eb06 challenge10;
        // offset 0x4b8, size 0x140
        hash_5ef0b8418736fce5 prevscores[10];
        // offset 0x5f8, size 0x30
        hash_6b3db80d498eb06 kdratio;
    };

    // idx 14 members 3 size 0x48
    struct hash_63565a3d40f66255 {
        // offset 0x0, size 0x8
        uint:2 state;
        // offset 0x8, size 0x20
        uint value;
        // offset 0x28, size 0x20
        uint highestvalue;
    };

    // idx 15 members 17 size 0x758
    struct hash_2e0567490210dd82 {
        // offset 0x0, size 0x8
        uint:3 hash_bf847c54dac3b;
        // offset 0x8, size 0xc0
        uint higheststats[hash_10edf09b258e1986];
        // offset 0xc8, size 0xc0
        uint currentstats[hash_10edf09b258e1986];
        // offset 0x188, size 0x20
        uint hash_7787ac0184215bc1;
        // offset 0x1a8, size 0x558
        hash_63565a3d40f66255 accolades[19];
        // offset 0x700, size 0x20
        uint hash_3cd96ca92c6f0d4c;
        // offset 0x720, size 0x10
        short hash_1cc8d841efacb52a;
        // offset 0x730, size 0x6
        bool hash_1e0160af4fd80dff[6];
        // offset 0x736, size 0x6
        bool hash_518113a79b08988[6];
        // offset 0x73c, size 0x1
        bool allcollectiblescollected;
        // offset 0x73d, size 0x1
        bool checkpointused;
        // offset 0x73e, size 0xa
        bool collectibles[10];
        // offset 0x748, size 0x1
        bool hash_71b609b078e360c0;
        // offset 0x749, size 0x6
        bool hash_657891d65d881524[6];
        // offset 0x74f, size 0x1
        bool hasbeencompleted;
        // offset 0x750, size 0x6
        bool hash_233621878f97486b[6];
        // offset 0x756, size 0x2
        uint:1 __pad[2];
    };

    // idx 16 members 7 size 0x90
    struct hash_5cb2d75a230a501f {
        // offset 0x0, size 0x8
        uint:5 highestround;
        // offset 0x8, size 0x20
        uint highestscore;
        // offset 0x28, size 0x20
        uint hash_1b146f5d12b2b147;
        // offset 0x48, size 0x20
        uint hash_25ce643c6cf6507e;
        // offset 0x68, size 0x20
        uint hash_52dbe660cac88df9;
        // offset 0x88, size 0x4
        bool ranksachieved[4];
        // offset 0x8c, size 0x4
        uint:1 __pad[4];
    };

    // idx 17 members 15 size 0x1e0
    struct hash_722a4055916df1ff {
        // offset 0x0, size 0x20
        uint hash_2b12202dea292a78;
        // offset 0x20, size 0x20
        uint hash_65157f3e7aec5b46;
        // offset 0x40, size 0x20
        uint hash_256e550d360e7cf6;
        // offset 0x60, size 0x20
        uint hash_34212151b945069b;
        // offset 0x80, size 0x20
        uint numplayers;
        // offset 0xa0, size 0x20
        uint hash_477109e1674d778e;
        // offset 0xc0, size 0x20
        uint hash_6f7512e92e96a86a;
        // offset 0xe0, size 0x20
        uint hash_52086efefda6cd87;
        // offset 0x100, size 0x20
        uint hash_4c59bf00eb8047c0;
        // offset 0x120, size 0x20
        uint hash_4cda3bb269028c08;
        // offset 0x140, size 0x20
        uint hash_c159a616c8e909f;
        // offset 0x160, size 0x20
        uint hash_1b75e7812ae582a0;
        // offset 0x180, size 0x20
        uint hash_6e3edce84270ac4c;
        // offset 0x1a0, size 0x20
        uint hash_3ed0ae0744c78900;
        // offset 0x1c0, size 0x20
        uint hash_24bfa4caccae7ccc;
    };

    // idx 18 members 1 size 0x390
    struct hash_6ef8b9b7a8fd75e1 {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
    };

    // idx 19 members 5 size 0x3a0
    struct hash_48cae9b9fcff7a5e {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
        // offset 0x390, size 0x8
        bool hash_798921f18e351b13[8];
        // offset 0x398, size 0x1
        bool purchased;
        // offset 0x399, size 0x1
        bool markedold;
        // offset 0x39a, size 0x6
        uint:1 __pad[6];
    };

    // idx 20 members 2 size 0x398
    struct hash_67b00e3091cde2fd {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
        // offset 0x390, size 0x8
        bool hash_798921f18e351b13[8];
    };

    // idx 21 members 5 size 0x188
    struct hash_1608f63ae729eda5 {
        // offset 0x0, size 0x18
        uint:24 xp;
        // offset 0x18, size 0x8
        uint:2 plevel;
        // offset 0x20, size 0x38
        bool attachmentmarkedold[hash_12cd35aeeec0ae2d];
        // offset 0x58, size 0x12c
        bool optionmarkedasold[300];
        // offset 0x184, size 0x4
        uint:1 __pad[4];
    };

    // idx 22 members 1 size 0x100
    struct hash_ca5eede65d9c59e {
        // offset 0x0, size 0x100
        uint stats[hash_4a2552dbed57509c];
    };

    // idx 23 members 4 size 0x8
    struct hash_18562676c03c7954 {
        // offset 0x0, size 0x1
        bool purchased;
        // offset 0x1, size 0x1
        bool markedold;
        // offset 0x2, size 0x1
        bool unlocked;
        // offset 0x3, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 1 size 0x1
    struct hash_2d74f509e9d33a86 {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 25 members 5 size 0x3418
    struct hash_790a163d0959fa18 {
        // offset 0x0, size 0x2000
        hash_18562676c03c7954 icons[1024];
        // offset 0x2000, size 0x8
        uint:4 layerspurchased;
        // offset 0x2008, size 0x1400
        hash_18562676c03c7954 backgrounds[640];
        // offset 0x3408, size 0xc
        hash_2d74f509e9d33a86 layers[12];
        // offset 0x3414, size 0x4
        uint:1 __pad[4];
    };

    // idx 26 members 3 size 0x8
    struct hash_118b324c3f145926 {
        // offset 0x0, size 0x1
        bool purchased;
        // offset 0x1, size 0x1
        bool markedold;
        // offset 0x2, size 0x6
        uint:1 __pad[6];
    };

    // idx 27 members 3 size 0xa0
    struct hash_402baff65ae9b838 {
        // offset 0x0, size 0x28
        string(5) clanname;
        // offset 0x28, size 0x8
        byte selectedfeature;
        // offset 0x30, size 0x70
        hash_118b324c3f145926 features[hash_118b444c3f1477bc];
    };

    // idx 28 members 4 size 0x20
    struct hash_25a11738b4152d0e {
        // offset 0x0, size 0x8
        byte a;
        // offset 0x8, size 0x8
        byte b;
        // offset 0x10, size 0x8
        byte c;
        // offset 0x18, size 0x8
        byte d;
    };

    // idx 29 members 6 size 0x1c0
    struct hash_4976dab983b23e8c {
        // offset 0x0, size 0x20
        uint timestamp;
        // offset 0x20, size 0x20
        uint nattype;
        // offset 0x40, size 0x40
        uint64 macaddress;
        // offset 0x80, size 0x100
        string(32) consoleid64;
        // offset 0x180, size 0x20
        hash_25a11738b4152d0e ipexternal;
        // offset 0x1a0, size 0x20
        uint usecount;
    };

    // idx 30 members 4 size 0x10
    struct hash_4f6f299a12577aa4 {
        // offset 0x0, size 0x8
        byte itemunlocked;
        // offset 0x8, size 0x1
        bool tokenspent;
        // offset 0x9, size 0x4
        bool tokentype[prestigetokentype_e];
        // offset 0xd, size 0x3
        uint:1 __pad[3];
    };

    // idx 31 members 2 size 0xa0
    struct dlc_t {
        // offset 0x0, size 0x20
        uint mappacks;
        // offset 0x20, size 0x80
        bool mtx[128];
    };

    // idx 32 members 4 size 0x150
    struct hash_2efa05c484e77181 {
        // offset 0x0, size 0x140
        string(40) mapname;
        // offset 0x140, size 0x8
        uint:4 collectibleindex;
        // offset 0x148, size 0x1
        bool set;
        // offset 0x149, size 0x7
        uint:1 __pad[7];
    };

    // idx 33 members 1 size 0xd20
    struct hash_78a2c506849f9dda {
        // offset 0x0, size 0xd20
        hash_2efa05c484e77181 collectibles[bunkcollectibleslots_e];
    };

    // idx 34 members 1 size 0x280
    struct hash_6962b6aa0c4853f4 {
        // offset 0x0, size 0x280
        float properties[20];
    };

    // idx 0 members 379
    enum hash_44d262eb4cb5ed61 {
        hash_bf36041b40b541, // 0x0,
        hash_103be234630de92, // 0x1,
        kill_with_cooked_grenade, // 0x2,
        minxp, // 0x3,
        misses, // 0x4,
        killsconfirmed, // 0x5,
        hash_21bfdd7a5c4f23c, // 0x6,
        destroy_car, // 0x7,
        medal_bomb_detonated, // 0x8,
        stun_aitank_with_emp_grenade, // 0x9,
        hash_359f05e4bb4fa57, // 0xa,
        films_shoutcasted, // 0xb,
        medal_flag_capture, // 0xc,
        hash_3bba76aa8987218, // 0xd,
        hash_3bef98f1093a802, // 0xe,
        time_played_total, // 0xf,
        hash_495a843c176b50c, // 0x10,
        hash_4b3d34b8f0e5b8f, // 0x11,
        perk_fastweaponswitch_kill_after_swap, // 0x12,
        mappackmask, // 0x13,
        kill_nemesis, // 0x14,
        hash_60f3f9adb22e924, // 0x15,
        hash_66b80bdb17c4a04, // 0x16,
        perk_protection_stun_kills, // 0x17,
        hash_7afff19891fb72e, // 0x18,
        hash_7dc6ebcd202e54f, // 0x19,
        perk_hacker_destroy, // 0x1a,
        hash_85ed95e3662c128, // 0x1b,
        rankxp, // 0x1c,
        hash_976be36aea95e59, // 0x1d,
        lifetime_buyin, // 0x1e,
        hash_9904e795162f703, // 0x1f,
        killsdenied, // 0x20,
        kill_flashed_enemy, // 0x21,
        hash_b38ac686f0e8f63, // 0x22,
        perk_quieter_kills, // 0x23,
        medal_flag_carrier_kill_return_close, // 0x24,
        sessionbans, // 0x25,
        hash_d31df6b18ade168, // 0x26,
        kdratio, // 0x27,
        hash_e2a2b7303f42341, // 0x28,
        returns, // 0x29,
        assist, // 0x2a,
        hash_fdad95a70f179d7, // 0x2b,
        hash_1023368faabde7bb, // 0x2c,
        currencyspent, // 0x2d,
        emblem_version, // 0x2e,
        cp_challenges, // 0x2f,
        highlights_created, // 0x30,
        medal_defused_bomb, // 0x31,
        hash_11d98f202734032b, // 0x32,
        hash_124fa750b68f0d7e, // 0x33,
        medal_completed_match, // 0x34,
        contracts_completed, // 0x35,
        hash_12d8d630663bb4ba, // 0x36,
        hash_13eb46cb3c4c5613, // 0x37,
        hash_13ece4de9e4e2180, // 0x38,
        hash_143a19a14a3654db, // 0x39,
        assist_score_killstreak, // 0x3a,
        get_final_kill, // 0x3b,
        hash_14e63336430e7e93, // 0x3c,
        hash_154b0a4b01b8b616, // 0x3d,
        hash_156adf3fdb4091b7, // 0x3e,
        assist_score_microwave_turret, // 0x3f,
        hash_1715d388ed114bcd, // 0x40,
        hash_171c599dfd8645fb, // 0x41,
        hash_174beaaa686374bd, // 0x42,
        kill_with_resupplied_lethal_grenade, // 0x43,
        medal_kill_enemy_who_killed_teammate, // 0x44,
        hash_180255bc92de9611, // 0x45,
        hash_18343d39cc8c1aee, // 0x46,
        medal_multikill_7, // 0x47,
        medal_multikill_6, // 0x48,
        medal_multikill_5, // 0x49,
        medal_multikill_4, // 0x4a,
        medal_multikill_3, // 0x4b,
        medal_multikill_2, // 0x4c,
        medal_multikill_8, // 0x4d,
        hash_1994a1e6fd4eac28, // 0x4e,
        hash_19b8cdc5c2c0aeaa, // 0x4f,
        suicides, // 0x50,
        timewhennexthost, // 0x51,
        hash_1b0d87a2f1c0272a, // 0x52,
        hash_1b148631540ae995, // 0x53,
        hash_1b2898c0a3f4e7c1, // 0x54,
        hash_1b5a22bbb1c029a2, // 0x55,
        hash_1bb99705ba9a0e6c, // 0x56,
        hash_1bc0e2d787ec3594, // 0x57,
        hash_1be36c00d02a3702, // 0x58,
        hash_1be3ce237f8e1363, // 0x59,
        hash_1cafb2c429e2e97f, // 0x5a,
        streaker, // 0x5b,
        captures, // 0x5c,
        leaderboardfailures, // 0x5d,
        hash_1e2dfda54cd5e4c9, // 0x5e,
        ties, // 0x5f,
        hash_1ebf7dbc9624adec, // 0x60,
        hash_1edccd77f0b71ac2, // 0x61,
        medal_clear_2_attackers, // 0x62,
        capture_objective_in_smoke, // 0x63,
        medal_kill_enemy_while_capping, // 0x64,
        hash_20179a04c1573a20, // 0x65,
        career_score_multiteam, // 0x66,
        cur_win_streak, // 0x67,
        hash_20ce01ed472f2cfa, // 0x68,
        hash_215f2670384d5d7b, // 0x69,
        medal_multikill_more_than_8, // 0x6a,
        destroyed_helicopter_with_bullet, // 0x6b,
        hash_24c25fad1ac01302, // 0x6c,
        killstreak_10_no_weapons_perks, // 0x6d,
        wins, // 0x6e,
        hash_2686fe80d2524e8b, // 0x6f,
        hash_26cbd2aa4d6b9947, // 0x70,
        hash_26d6f92287f0a1e8, // 0x71,
        hash_26e0be3755c42495, // 0x72,
        defuses, // 0x73,
        hash_275f021a92a63aee, // 0x74,
        medal_quickly_secure_point, // 0x75,
        hash_281d1546e5e55ca2, // 0x76,
        longshot_3_onelife, // 0x77,
        hash_2864c17bca6e0048, // 0x78,
        hash_28db499720aedb6e, // 0x79,
        perk_scavenger_kills_after_resupply, // 0x7a,
        hash_2934211bcdcc9e9f, // 0x7b,
        hash_29361ee6a3ecd300, // 0x7c,
        wins_multiteam, // 0x7d,
        medal_longshot_kill, // 0x7e,
        codpoints, // 0x7f,
        hash_2a708c95aef05cb5, // 0x80,
        career_mastery, // 0x81,
        kill_while_damaging_with_microwave_turret, // 0x82,
        destroyed_qrdrone_with_bullet, // 0x83,
        score_hc, // 0x84,
        revives, // 0x85,
        hash_2b75a2161643473b, // 0x86,
        hash_2b75aabcf73dc800, // 0x87,
        medal_killstreak_5, // 0x88,
        hash_2bc315db95982551, // 0x89,
        hash_2bc5c849844383ea, // 0x8a,
        hack_enemy_target, // 0x8b,
        hash_2c5ae152d1f6928b, // 0x8c,
        hash_2d27ed7c35d831b4, // 0x8d,
        medal_kill_enemy_with_their_weapon, // 0x8e,
        medal_kill_flag_carrier, // 0x8f,
        hash_2e5c1654a4fc1b1c, // 0x90,
        career_score, // 0x91,
        laststatsbackup, // 0x92,
        hash_2f9649f2756709d6, // 0x93,
        pickups, // 0x94,
        hash_30298932ae26bbda, // 0x95,
        medal_killed_enemy_while_carrying_flag, // 0x96,
        killed_dog_close_to_teammate, // 0x97,
        hash_308b22e7c87a0709, // 0x98,
        medal_revenge_kill, // 0x99,
        hash_30e4e2bca0a739f1, // 0x9a,
        statresetcount, // 0x9b,
        plevel, // 0x9c,
        hash_32227db686e80e47, // 0x9d,
        perk_noname_kills, // 0x9e,
        kill_enemy_one_bullet_sniper, // 0x9f,
        hash_3349efb239eee96f, // 0xa0,
        medal_kill_enemy_after_death, // 0xa1,
        hash_34783bf7a1179064, // 0xa2,
        match_bonus, // 0xa3,
        medal_backstabber_kill, // 0xa4,
        hash_349aad0f6083abf5, // 0xa5,
        hash_34d9af35f8b02185, // 0xa6,
        hash_34e0fb49ecfca3e4, // 0xa7,
        lifetime_earnings, // 0xa8,
        hash_3553f8161e7781d7, // 0xa9,
        hash_361c89bc5aadcdac, // 0xaa,
        hash_362683bc5ab617ff, // 0xab,
        destroy_turret, // 0xac,
        hash_37e875290614f1e1, // 0xad,
        medal_killed_bomb_planter, // 0xae,
        medal_uninterrupted_obit_feed_kills, // 0xaf,
        hash_39e43b41e43d1803, // 0xb0,
        medal_kill_enemy_with_care_package_crush, // 0xb1,
        medal_kill_enemy_with_hacked_care_package, // 0xb2,
        chickens, // 0xb3,
        version, // 0xb4,
        hash_3bbf88b211193c04, // 0xb5,
        perk_gpsjammer_immune_kills, // 0xb6,
        hash_3c299d0329cb332c, // 0xb7,
        hash_3c4542a7c82860e0, // 0xb8,
        assist_score_cuav, // 0xb9,
        medal_elimination_and_last_player_alive, // 0xba,
        hash_3dd99fa1b0d098d9, // 0xbb,
        hash_3e76cbc8ac01d9d7, // 0xbc,
        hash_3f1cf355fd388770, // 0xbd,
        kill_enemy_through_wall, // 0xbe,
        wlratio, // 0xbf,
        hash_405015b29793595f, // 0xc0,
        hash_40882db8b6a7f07c, // 0xc1,
        hash_40a19266327e603c, // 0xc2,
        teamkills_nostats, // 0xc3,
        score, // 0xc4,
        hash_416018859c2a61e0, // 0xc5,
        hash_417ca489457d2cf4, // 0xc6,
        hash_419d426a0886d25b, // 0xc7,
        medal_bounce_hatchet_kill, // 0xc8,
        hash_41ca7e5eeaa76eeb, // 0xc9,
        kill_every_enemy, // 0xca,
        medal_comeback_from_deathstreak, // 0xcb,
        hash_43261bbcab41f5ea, // 0xcc,
        hash_43bc196ae14ca147, // 0xcd,
        medal_neutral_b_secured, // 0xce,
        defends, // 0xcf,
        kill_enemy_while_crouched, // 0xd0,
        hash_4474df73df91d1a5, // 0xd1,
        statsbackupversion, // 0xd2,
        perk_fastmantle_kills, // 0xd3,
        hash_4563c8418dc6e528, // 0xd4,
        hash_465a039cdd937ec7, // 0xd5,
        hash_4667e99dc6606eae, // 0xd6,
        hash_470c0ed4799f236a, // 0xd7,
        disarm_hacked_carepackage, // 0xd8,
        medal_won_match, // 0xd9,
        hash_473fa810546b3693, // 0xda,
        destroy_explosive_with_trophy, // 0xdb,
        medal_retrieve_own_tags, // 0xdc,
        killstreak_5_picked_up_weapon, // 0xdd,
        hash_490052167ba0e80d, // 0xde,
        hash_4926ee717d694914, // 0xdf,
        long_distance_hatchet_kill, // 0xe0,
        medal_hatchet_kill, // 0xe1,
        hash_4a10990c96559d2f, // 0xe2,
        hash_4a1c48bcaeb7db8b, // 0xe3,
        teamkills, // 0xe4,
        destroy_helicopter, // 0xe5,
        hash_4b6eca29e69997c3, // 0xe6,
        contracts_purchased, // 0xe7,
        destroy_explosive, // 0xe8,
        hash_4cb5d718c79cca63, // 0xe9,
        hash_4e0b68c44638153e, // 0xea,
        hash_4e450148b31156f5, // 0xeb,
        assist_score_emp, // 0xec,
        hash_4ed745a0ed607a71, // 0xed,
        hash_4ee566b815c01f47, // 0xee,
        medal_killed_bomb_defuser, // 0xef,
        hash_4f4597af75828585, // 0xf0,
        hash_4fc11abc691b8a37, // 0xf1,
        hash_50253bf63c3f8b9d, // 0xf2,
        losses, // 0xf3,
        weapons_mastery, // 0xf4,
        medal_kill_enemy_injuring_teammate, // 0xf5,
        hash_51ab6bbcb2afbcf9, // 0xf6,
        hash_520cc126821992fd, // 0xf7,
        destructions, // 0xf8,
        hash_52abffb28461993b, // 0xf9,
        hash_52b4d13e62f857e5, // 0xfa,
        hash_52f5a81d5f96353f, // 0xfb,
        destroy_qrdrone, // 0xfc,
        hash_54faafb480f79981, // 0xfd,
        career_score_hc, // 0xfe,
        hash_55fec19a7934aaad, // 0xff,
        destroy_equipment_with_emp_grenade, // 0x100,
        hash_566873251fdce0c1, // 0x101,
        deaths, // 0x102,
        lastxp, // 0x103,
        challenges, // 0x104,
        hash_57f78bc1a13bd0de, // 0x105,
        medal_kill_enemy_one_bullet, // 0x106,
        medal_killstreak_more_than_30, // 0x107,
        hash_5944fa5ab0189744, // 0x108,
        medal_kill_enemy_when_injured, // 0x109,
        hash_5a716221adc293be, // 0x10a,
        destroy_5_tactical_inserts, // 0x10b,
        maxxp, // 0x10c,
        hash_5afc248bef0531a3, // 0x10d,
        hash_5afdb3c40e9b3c4d, // 0x10e,
        medal_kill_confirmed_multi, // 0x10f,
        assist_score_uav, // 0x110,
        hash_5be3ebfe3f3384cc, // 0x111,
        total_shots, // 0x112,
        hash_5c5cab0cce302a01, // 0x113,
        hash_5cd23704d9c298c1, // 0x114,
        perk_longersprint, // 0x115,
        hash_5d409c26ab2b77d5, // 0x116,
        destroy_aircraft, // 0x117,
        hash_5eed179b63d40718, // 0x118,
        hash_5ff2a0c4a2a3d4a0, // 0x119,
        badhostcount, // 0x11a,
        kill_15_with_blade, // 0x11b,
        kill_shocked_enemy, // 0x11c,
        time_played_other, // 0x11d,
        hash_611f84a4a10d3e3e, // 0x11e,
        hash_620ca70cc9416098, // 0x11f,
        hash_621283451861c9e1, // 0x120,
        hash_63420e05d8642fcd, // 0x121,
        hash_63599ac17b01c38b, // 0x122,
        multikill_3_lmg_or_smg_hip_fire, // 0x123,
        hits_headshot, // 0x124,
        hash_640adebcbd63d90f, // 0x125,
        hash_64c0bac013acc9f6, // 0x126,
        hash_64fdb6c907a131c5, // 0x127,
        hash_657cf19d17d5b366, // 0x128,
        last_escrow, // 0x129,
        medal_first_kill, // 0x12a,
        hash_65f463ce38d57812, // 0x12b,
        field_specialist, // 0x12c,
        hash_6639a2d5dd155965, // 0x12d,
        hash_668c1bd08c419f31, // 0x12e,
        wins_hc, // 0x12f,
        perk_loudenemies_kills, // 0x130,
        multikill_3_remote_missile, // 0x131,
        multikill_3_near_death, // 0x132,
        medal_assisted_suicide, // 0x133,
        gems, // 0x134,
        stats_version, // 0x135,
        destroy_aircraft_with_missile_drone, // 0x136,
        plants, // 0x137,
        secondary_mastery, // 0x138,
        perk_immune_cuav_kills, // 0x139,
        hash_69b5c8e5faf24cdf, // 0x13a,
        hash_69df2755783ea5b9, // 0x13b,
        hash_6a237bc096133b0a, // 0x13c,
        hash_6a4804b6ccfa8228, // 0x13d,
        incaps, // 0x13e,
        activate_cuav_while_enemy_satelite_active, // 0x13f,
        assist_score_satellite, // 0x140,
        hash_6ad99bdc72451712, // 0x141,
        hash_6b1f1900b1afff8b, // 0x142,
        hash_6b5388190c66aa86, // 0x143,
        medal_stop_enemy_killstreak, // 0x144,
        perk_movefaster_kills, // 0x145,
        medal_koth_secure, // 0x146,
        destroy_equipment, // 0x147,
        kill_enemy_while_prone, // 0x148,
        time_played_alive, // 0x149,
        hash_6cda7af101a7813b, // 0x14a,
        rank, // 0x14b,
        hash_6df09ff7e0a31041, // 0x14c,
        hash_6df6b645014f20ba, // 0x14d,
        hash_6edacd218965f8bd, // 0x14e,
        hash_6f14dca5dad9d904, // 0x14f,
        hash_6f1b532646f903fd, // 0x150,
        destroy_aircraft_with_emp, // 0x151,
        perk_nottargetedbyairsupport_destroy_aircraft, // 0x152,
        medal_kill_enemies_one_bullet, // 0x153,
        hits, // 0x154,
        hash_73d187ebf36663a3, // 0x155,
        call_in_3_care_packages, // 0x156,
        headshots, // 0x157,
        penetration_shots, // 0x158,
        multikill_3_with_mgl, // 0x159,
        medal_killstreak_15, // 0x15a,
        medal_killstreak_10, // 0x15b,
        medal_killstreak_20, // 0x15c,
        medal_killstreak_25, // 0x15d,
        medal_killstreak_30, // 0x15e,
        hash_77728de853e5ac67, // 0x15f,
        hash_78245078b8f303d0, // 0x160,
        gametypeban, // 0x161,
        accuracy, // 0x162,
        hash_794996196e74a949, // 0x163,
        score_multiteam, // 0x164,
        multikill_2_zone_attackers, // 0x165,
        defend_teammate_who_captured_package, // 0x166,
        hash_7a6ac3d3a3905c74, // 0x167,
        hash_7aa90c8abdf600e6, // 0x168,
        skulls, // 0x169,
        hash_7bf32e23f3be8ec6, // 0x16a,
        kills, // 0x16b,
        medal_defused_bomb_last_man_alive, // 0x16c,
        perk_bulletflinch_kills, // 0x16d,
        offends, // 0x16e,
        hash_7d320079120592ee, // 0x16f,
        kill_enemy_through_wall_with_fmj, // 0x170,
        assists, // 0x171,
        medal_headshot, // 0x172,
        hash_7ea091987cc17c99, // 0x173,
        hash_7edcc1ac6898f588, // 0x174,
        kill_enemy_one_bullet_shotgun, // 0x175,
        hash_7f2ed78b0d2848f2, // 0x176,
        medal_position_secure, // 0x177,
        hash_7fa27167eb8b2f65, // 0x178,
        hash_7fb734eea073a2c7, // 0x179,
        hash_7fc096557d0251c4, // 0x17a
    };

    // idx 1 members 6
    enum hash_1cbddecc4f162d46 {
        kill_streak, // 0x0,
        highest_accuracy, // 0x1,
        highest_kdratio, // 0x2,
        win_streak, // 0x3,
        death_streak, // 0x4,
        highest_score, // 0x5
    };

    // idx 2 members 2
    enum hash_28f0e9c96e9d895d {
        hash_f08aa26fabae647, // 0x0,
        hash_5740a8698a4d0345, // 0x1
    };

    // idx 3 members 2
    enum hash_6fc913ce2d7e3a05 {
        publicmatch, // 0x0,
        leaguematch, // 0x1
    };

    // idx 4 members 5
    enum hash_5af4108cc28a7f2f {
        dashboard, // 0x0,
        quit, // 0x1,
        kicked, // 0x2,
        finished, // 0x3,
        timeout, // 0x4
    };

    // idx 5 members 12
    enum hash_6501ee9650acd12c {
        coop, // 0x0,
        hash_166b6fdf8bfc14b0, // 0x1,
        cpzm, // 0x2,
        hvt, // 0x3,
        download, // 0x4,
        doa, // 0x5,
        hash_4cb6801fbfb4feba, // 0x6,
        hash_59109354c237d415, // 0x7,
        hash_61b9f30e20aecc3a, // 0x8,
        hash_6dbe071fd1f51551, // 0x9,
        hash_73a25371d607ae0f, // 0xa,
        pvp, // 0xb
    };

    // idx 6 members 10
    enum hash_77d9cc12441881d5 {
        hash_118a6332af43d97c, // 0x0,
        hash_1868403ad767bcd5, // 0x1,
        hash_192de2ac4a272b77, // 0x2,
        hash_1d9ec2a919018090, // 0x3,
        hash_28514534e1fdc6b7, // 0x4,
        hash_2aea61f2cc17fd2b, // 0x5,
        hash_364f981808c6bfc9, // 0x6,
        hash_46386949c31ed6c7, // 0x7,
        hash_551c2ad25d755c39, // 0x8,
        hash_79103217c50277f4, // 0x9
    };

    // idx 7 members 6
    enum hash_10edf09b258e1986 {
        hash_252319e61320ad11, // 0x0,
        revives, // 0x1,
        score, // 0x2,
        incaps, // 0x3,
        kills, // 0x4,
        assists, // 0x5
    };

    // idx 8 members 19
    enum hash_1609003ae729fea3 {
        destroyed, // 0x0,
        combatrecordstat, // 0x1,
        backstabber_kill, // 0x2,
        deathsduringuse, // 0x3,
        deaths, // 0x4,
        challenge6, // 0x5,
        challenge4, // 0x6,
        challenge5, // 0x7,
        challenge2, // 0x8,
        challenge3, // 0x9,
        challenge1, // 0xa,
        challenges, // 0xb,
        timeused, // 0xc,
        hits, // 0xd,
        headshots, // 0xe,
        shots, // 0xf,
        kills, // 0x10,
        used, // 0x11,
        assists, // 0x12
    };

    // idx 9 members 21
    enum hash_5075e11eecf4d03d {
        weapon_flamethrower, // 0x0,
        specialty, // 0x1,
        bonuscard, // 0x2,
        weapon_explosive, // 0x3,
        weapon_special, // 0x4,
        weapon_masterkey, // 0x5,
        miscweapon, // 0x6,
        weapon_pistol, // 0x7,
        killstreak, // 0x8,
        weapon_sniper, // 0x9,
        specialgrenade, // 0xa,
        weapon_grenadelauncher, // 0xb,
        weapon_launcher, // 0xc,
        weapon_grenade, // 0xd,
        hash_5352e5bf9311b021, // 0xe,
        weapon_shotgun, // 0xf,
        weapon_lmg, // 0x10,
        weapon_tactical, // 0x11,
        weapon_smg, // 0x12,
        weapon_cqb, // 0x13,
        weapon_assault, // 0x14
    };

    // idx 10 members 56
    enum hash_12cd35aeeec0ae2d {
        speedreloader, // 0x0,
        dynzoom, // 0x1,
        quickdraw, // 0x2,
        acog, // 0x3,
        pistolscope, // 0x4,
        mms, // 0x5,
        dw, // 0x6,
        gl, // 0x7,
        mk, // 0x8,
        ir, // 0x9,
        is, // 0xa,
        sf, // 0xb,
        rf, // 0xc,
        fastreload, // 0xd,
        extbarrel, // 0xe,
        rangefinder, // 0xf,
        steadyaim, // 0x10,
        stalker, // 0x11,
        barrelchoke, // 0x12,
        hipgrip, // 0x13,
        vzoom, // 0x14,
        supply, // 0x15,
        stalker2, // 0x16,
        extclip2, // 0x17,
        steadyaim2, // 0x18,
        tacknife, // 0x19,
        mixclip, // 0x1a,
        stackfire, // 0x1b,
        killcounter, // 0x1c,
        clantag, // 0x1d,
        damage2, // 0x1e,
        swayreduc, // 0x1f,
        extbarrel2, // 0x20,
        reddot, // 0x21,
        extclip, // 0x22,
        holo, // 0x23,
        elo, // 0x24,
        fastreload2, // 0x25,
        extrapellets, // 0x26,
        holdbreath, // 0x27,
        fmj2, // 0x28,
        quickdraw2, // 0x29,
        fmj, // 0x2a,
        adsreload, // 0x2b,
        suppressed, // 0x2c,
        grip2, // 0x2d,
        custom4, // 0x2e,
        custom5, // 0x2f,
        custom2, // 0x30,
        custom3, // 0x31,
        custom1, // 0x32,
        dualoptic, // 0x33,
        grip, // 0x34,
        reflex, // 0x35,
        uber, // 0x36,
        damage, // 0x37
    };

    // idx 11 members 8
    enum hash_4a2552dbed57509c {
        destroyed, // 0x0,
        backstabber_kill, // 0x1,
        deathsduringuse, // 0x2,
        deaths, // 0x3,
        hits, // 0x4,
        headshots, // 0x5,
        shots, // 0x6,
        kills, // 0x7
    };

    // idx 12 members 14
    enum hash_118b444c3f1477bc {
        yellow, // 0x0,
        red, // 0x1,
        move, // 0x2,
        green, // 0x3,
        left, // 0x4,
        hash_27d748f975c1cca2, // 0x5,
        hash_3abd10cd4bee218d, // 0x6,
        hash_3b1a3eb9e4c6e529, // 0x7,
        blue, // 0x8,
        cycle, // 0x9,
        hash_6c90e772edbc8708, // 0xa,
        cyan, // 0xb,
        hash_71874fda6a03b630, // 0xc,
        right, // 0xd
    };

    // idx 13 members 4
    enum prestigetokentype_e {
        hash_b48a752eef7af35, // 0x0,
        prestige_extra_cac, // 0x1,
        prestige_respec, // 0x2,
        prestige_reset_stats, // 0x3
    };

    // idx 14 members 10
    enum bunkcollectibleslots_e {
        bunk_collectible_medium_1, // 0x0,
        hash_1f95ed7440770262, // 0x1,
        bunk_collectible_medium_2, // 0x2,
        bunk_collectible_large_1, // 0x3,
        bunk_collectible_small_3, // 0x4,
        bunk_collectible_small_2, // 0x5,
        bunk_collectible_small_1, // 0x6,
        bunk_collectible_small_6, // 0x7,
        bunk_collectible_small_5, // 0x8,
        bunk_collectible_small_4, // 0x9
    };

    // idx 15 members 5
    enum hash_8fa49f7da0821e {
        hash_d6a8a92ed62461c, // 0x0,
        hash_211897601e420060, // 0x1,
        hash_3be7fbbad14a09aa, // 0x2,
        face, // 0x3,
        eyes, // 0x4
    };

    // idx 0 members 67 size 0x893f0
    // offset 0x0, size 0xa0
    dlc_t dlc;
    // offset 0xa0, size 0x20
    int unlocktokencount_weapon;
    // offset 0xc0, size 0x20
    uint hash_3ec47111a3993e52;
    // offset 0xe0, size 0x8
    uint:4 lastconsolesave;
    // offset 0xe8, size 0xc80
    hash_6962b6aa0c4853f4 facialfeatureproperties[hash_8fa49f7da0821e];
    // offset 0xd68, size 0x8
    uint:5 selectedcustomclass;
    // offset 0xd70, size 0x140
    hash_5ef0b8418736fce5 recentearnings[10];
    // offset 0xeb0, size 0x20
    uint hashlen;
    // offset 0xed0, size 0x40
    uint64 hash_37aeca4d39214e62;
    // offset 0xf10, size 0x3050
    hash_503eb0de8f9cf7c2 gamehistory[hash_6fc913ce2d7e3a05];
    // offset 0x3f60, size 0xc940
    hash_67b00e3091cde2fd attachments[hash_12cd35aeeec0ae2d];
    // offset 0x108a0, size 0x90
    uint:24 higheststats[hash_1cbddecc4f162d46];
    // offset 0x10930, size 0x13240
    hash_1608f63ae729eda5 weaponstats[200];
    // offset 0x23b70, size 0x320
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    // offset 0x23e90, size 0x20
    int combattrainingwins;
    // offset 0x23eb0, size 0x200
    uint:4 currentweaponlevels[64];
    // offset 0x240b0, size 0x40
    uint64 connectionid;
    // offset 0x240f0, size 0x1e0
    hash_722a4055916df1ff hash_7dd9f1ac62a346d;
    // offset 0x242d0, size 0x20
    int motdversionviewed;
    // offset 0x242f0, size 0xfb00
    hash_ca5eede65d9c59e variantstats[251];
    // offset 0x33df0, size 0x8
    uint:4 currenthitlocationindex;
    // offset 0x33df8, size 0x20
    uint hash_6dcaad4976588a44;
    // offset 0x33e18, size 0xc30
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    // offset 0x34a48, size 0x190
    byte hash_5988aeaa53d6e90c[50];
    // offset 0x34bd8, size 0x260
    uint hash_3de5a4846f45ad78[19];
    // offset 0x34e38, size 0x4970
    hash_2e0567490210dd82 playerstatsbymap[hash_77d9cc12441881d5];
    // offset 0x397a8, size 0x1180
    hash_4976dab983b23e8c consoleinfo[10];
    // offset 0x3a928, size 0xd20
    hash_78a2c506849f9dda bunkcollectibles;
    // offset 0x3b648, size 0x40
    uint64 hash_188ecc3aca50f93d;
    // offset 0x3b688, size 0x40
    uint achievements[hash_28f0e9c96e9d895d];
    // offset 0x3b6c8, size 0x49e0
    hash_2e1d3d3bb036d22c playerstatsbygametype[hash_6501ee9650acd12c];
    // offset 0x400a8, size 0x100
    byte demonwareflags[32];
    // offset 0x401a8, size 0x8
    uint:5 companion;
    // offset 0x401b0, size 0x20
    float skill_rating;
    // offset 0x401d0, size 0x20
    int unlocktokencount_attachment;
    // offset 0x401f0, size 0x20
    uint hash_3313a30250a39ec5;
    // offset 0x40210, size 0x180
    float hash_2363e7e74077b1c0[hash_6501ee9650acd12c];
    // offset 0x40390, size 0x20
    uint uploadbandwidth;
    // offset 0x403b0, size 0x140
    hash_4f6f299a12577aa4 prestigetokens[20];
    // offset 0x404f0, size 0xc0
    hash_4bb25d7ad41fb449 probation[hash_6fc913ce2d7e3a05];
    // offset 0x405b0, size 0x20
    int motdviewtime;
    // offset 0x405d0, size 0x8
    uint:3 faction;
    // offset 0x405d8, size 0x90
    hash_5cb2d75a230a501f trainingsimstats;
    // offset 0x40668, size 0x4ad0
    hash_6ef8b9b7a8fd75e1 groupstats[hash_5075e11eecf4d03d];
    // offset 0x45138, size 0x8
    uint:4 hash_191fbfb9e1a3acf3;
    // offset 0x45140, size 0x20
    float hash_54a74aa3d5f3346d;
    // offset 0x45160, size 0x4710
    hash_6b3db80d498eb06 playerstatslist[hash_44d262eb4cb5ed61];
    // offset 0x49870, size 0xa0
    hash_402baff65ae9b838 clantagstats;
    // offset 0x49910, size 0x20
    float skill_variance;
    // offset 0x49930, size 0x180
    float hash_3a7324ad328f0e2e[hash_6501ee9650acd12c];
    // offset 0x49ab0, size 0x22e8
    hash_6b411bb770fc8f6c afteractionreportstats;
    // offset 0x4bd98, size 0x100
    byte unlocks[32];
    // offset 0x4be98, size 0x40
    uint64 playerxuid;
    // offset 0x4bed8, size 0x3418
    hash_790a163d0959fa18 emblemstats;
    // offset 0x4f2f0, size 0x3a000
    hash_48cae9b9fcff7a5e itemstats[256];
    // offset 0x892f0, size 0x20
    uint highestmapreached;
    // offset 0x89310, size 0x1
    bool hash_3ceb201776787882;
    // offset 0x89311, size 0x1
    hash_7690a9df20146d8a zmcampaigndata;
    // offset 0x89312, size 0x20
    bool musicunlocks[32];
    // offset 0x89332, size 0x40
    bool hash_1576a2fd30a2dfb0[64];
    // offset 0x89372, size 0x1
    bool hash_46e7db8ceaba5b2f;
    // offset 0x89373, size 0x14
    bool hash_711b1260308620e7[20];
    // offset 0x89387, size 0x14
    bool playercpdecorations[20];
    // offset 0x8939b, size 0x1
    bool hash_8cbe2e4ecb4fc43;
    // offset 0x8939c, size 0x1
    bool completedfirsttimeflow;
    // offset 0x8939d, size 0x4d
    bool completedchallengeseen[77];
    // offset 0x893ea, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_stats.ddl
// metatable "hash_afe1d1921c4dede1"

version 18 {
    // idx 1 members 2 size 0x30
    struct hash_6b3db80d498eb06 {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
    };

    // idx 2 members 3 size 0x20
    struct hash_5ef0b8418736fce5 {
        // offset 0x0, size 0x18
        uint:24 score;
        // offset 0x18, size 0x1
        bool valid;
        // offset 0x19, size 0x7
        uint:1 __pad[7];
    };

    // idx 3 members 4 size 0x138
    struct hash_3b0f9e0921513e2c {
        // offset 0x0, size 0x98
        byte hitlocations[19];
        // offset 0x98, size 0x98
        byte criticalhitlocations[19];
        // offset 0x130, size 0x1
        bool valid;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 4 members 6 size 0x50
    struct hash_1a52129598e71dab {
        // offset 0x0, size 0x10
        short kills;
        // offset 0x10, size 0x18
        uint:24 score;
        // offset 0x28, size 0x10
        short gametype;
        // offset 0x38, size 0x10
        short deaths;
        // offset 0x48, size 0x1
        bool valid;
        // offset 0x49, size 0x7
        uint:1 __pad[7];
    };

    // idx 5 members 14 size 0x2e8
    struct hash_656bfcb3838e2907 {
        // offset 0x0, size 0x100
        string(32) name;
        // offset 0x100, size 0x100
        string(32) xuid;
        // offset 0x200, size 0x20
        uint curxp;
        // offset 0x220, size 0x10
        short kills;
        // offset 0x230, size 0x20
        uint prvxp;
        // offset 0x250, size 0x10
        short score;
        // offset 0x260, size 0x10
        short revives;
        // offset 0x270, size 0x10
        short currank;
        // offset 0x280, size 0x10
        short deaths;
        // offset 0x290, size 0x30
        short medals[3];
        // offset 0x2c0, size 0x10
        short assists;
        // offset 0x2d0, size 0x10
        short hash_59ef59765ff3f049;
        // offset 0x2e0, size 0x1
        bool isactive;
        // offset 0x2e1, size 0x7
        uint:1 __pad[7];
    };

    // idx 6 members 6 size 0x22e8
    struct hash_6b411bb770fc8f6c {
        // offset 0x0, size 0x22e0
        hash_656bfcb3838e2907 playerstats[12];
        // offset 0x22e0, size 0x1
        bool valid;
        // offset 0x22e1, size 0x1
        bool matchwon;
        // offset 0x22e2, size 0x1
        bool privatematch;
        // offset 0x22e3, size 0x1
        bool viewed;
        // offset 0x22e4, size 0x4
        uint:1 __pad[4];
    };

    // idx 7 members 1 size 0x1
    struct hash_7690a9df20146d8a {
        // offset 0x0, size 0x1
        bool unlocked;
    };

    // idx 8 members 6 size 0x90
    struct hash_2f60329a207db2b8 {
        // offset 0x0, size 0x18
        uint:24 quit;
        // offset 0x18, size 0x18
        uint:24 started;
        // offset 0x30, size 0x18
        uint:24 completed;
        // offset 0x48, size 0x18
        uint:24 timeout;
        // offset 0x60, size 0x18
        uint:24 kicked;
        // offset 0x78, size 0x18
        uint:24 dashboard;
    };

    // idx 9 members 2 size 0x120
    struct hash_b5aec1419b9a02d {
        // offset 0x0, size 0x90
        hash_2f60329a207db2b8 hosted;
        // offset 0x90, size 0x90
        hash_2f60329a207db2b8 played;
    };

    // idx 10 members 11 size 0xb8
    struct hash_5fafb39a86bc6dc7 {
        // offset 0x0, size 0x10
        short kills;
        // offset 0x10, size 0x18
        uint:24 score;
        // offset 0x28, size 0x20
        uint startingtime;
        // offset 0x48, size 0x20
        uint endingtime;
        // offset 0x68, size 0x8
        uint:5 scoreboardposition;
        // offset 0x70, size 0x20
        float teamscoreratio;
        // offset 0x90, size 0x8
        uint:5 gametype;
        // offset 0x98, size 0x10
        short deaths;
        // offset 0xa8, size 0x8
        uint:3 quittype;
        // offset 0xb0, size 0x1
        bool forgiven;
        // offset 0xb1, size 0x7
        uint:1 __pad[7];
    };

    // idx 11 members 3 size 0x1828
    struct hash_503eb0de8f9cf7c2 {
        // offset 0x0, size 0x1700
        hash_5fafb39a86bc6dc7 matchhistory[32];
        // offset 0x1700, size 0x120
        hash_b5aec1419b9a02d modehistory;
        // offset 0x1820, size 0x8
        byte currentmatchhistoryindex;
    };

    // idx 12 members 3 size 0x60
    struct hash_4bb25d7ad41fb449 {
        // offset 0x0, size 0x20
        uint count;
        // offset 0x20, size 0x20
        uint version;
        // offset 0x40, size 0x20
        uint timewhenprobationisdone;
    };

    // idx 13 members 28 size 0x628
    struct hash_2e1d3d3bb036d22c {
        // offset 0x0, size 0x30
        hash_6b3db80d498eb06 ties;
        // offset 0x30, size 0x30
        hash_6b3db80d498eb06 wins;
        // offset 0x60, size 0x30
        hash_6b3db80d498eb06 assists;
        // offset 0x90, size 0x30
        hash_6b3db80d498eb06 crush;
        // offset 0xc0, size 0x30
        hash_6b3db80d498eb06 kills;
        // offset 0xf0, size 0x30
        hash_6b3db80d498eb06 score;
        // offset 0x120, size 0x30
        hash_6b3db80d498eb06 time_played_total;
        // offset 0x150, size 0x30
        hash_6b3db80d498eb06 challenge1;
        // offset 0x180, size 0x30
        hash_6b3db80d498eb06 challenge2;
        // offset 0x1b0, size 0x30
        hash_6b3db80d498eb06 challenge3;
        // offset 0x1e0, size 0x30
        hash_6b3db80d498eb06 challenge4;
        // offset 0x210, size 0x30
        hash_6b3db80d498eb06 challenge5;
        // offset 0x240, size 0x30
        hash_6b3db80d498eb06 challenge6;
        // offset 0x270, size 0x30
        hash_6b3db80d498eb06 challenge7;
        // offset 0x2a0, size 0x30
        hash_6b3db80d498eb06 challenge8;
        // offset 0x2d0, size 0x30
        hash_6b3db80d498eb06 challenge9;
        // offset 0x300, size 0x30
        hash_6b3db80d498eb06 win_streak;
        // offset 0x330, size 0x30
        hash_6b3db80d498eb06 cur_win_streak;
        // offset 0x360, size 0x30
        hash_6b3db80d498eb06 kill_streak;
        // offset 0x390, size 0x30
        hash_6b3db80d498eb06 deaths;
        // offset 0x3c0, size 0x30
        hash_6b3db80d498eb06 wlratio;
        // offset 0x3f0, size 0x8
        int:5 prevscoreindex;
        // offset 0x3f8, size 0x30
        hash_6b3db80d498eb06 losses;
        // offset 0x428, size 0x30
        hash_6b3db80d498eb06 defends;
        // offset 0x458, size 0x30
        hash_6b3db80d498eb06 offends;
        // offset 0x488, size 0x30
        hash_6b3db80d498eb06 challenge10;
        // offset 0x4b8, size 0x140
        hash_5ef0b8418736fce5 prevscores[10];
        // offset 0x5f8, size 0x30
        hash_6b3db80d498eb06 kdratio;
    };

    // idx 14 members 3 size 0x48
    struct hash_63565a3d40f66255 {
        // offset 0x0, size 0x8
        uint:2 state;
        // offset 0x8, size 0x20
        uint value;
        // offset 0x28, size 0x20
        uint highestvalue;
    };

    // idx 15 members 17 size 0x758
    struct hash_2e0567490210dd82 {
        // offset 0x0, size 0x8
        uint:3 hash_bf847c54dac3b;
        // offset 0x8, size 0xc0
        uint higheststats[hash_10edf09b258e1986];
        // offset 0xc8, size 0xc0
        uint currentstats[hash_10edf09b258e1986];
        // offset 0x188, size 0x20
        uint hash_7787ac0184215bc1;
        // offset 0x1a8, size 0x558
        hash_63565a3d40f66255 accolades[19];
        // offset 0x700, size 0x20
        uint hash_3cd96ca92c6f0d4c;
        // offset 0x720, size 0x10
        short hash_1cc8d841efacb52a;
        // offset 0x730, size 0x6
        bool hash_1e0160af4fd80dff[6];
        // offset 0x736, size 0x6
        bool hash_518113a79b08988[6];
        // offset 0x73c, size 0x1
        bool allcollectiblescollected;
        // offset 0x73d, size 0x1
        bool checkpointused;
        // offset 0x73e, size 0xa
        bool collectibles[10];
        // offset 0x748, size 0x1
        bool hash_71b609b078e360c0;
        // offset 0x749, size 0x6
        bool hash_657891d65d881524[6];
        // offset 0x74f, size 0x1
        bool hasbeencompleted;
        // offset 0x750, size 0x6
        bool hash_233621878f97486b[6];
        // offset 0x756, size 0x2
        uint:1 __pad[2];
    };

    // idx 16 members 7 size 0x90
    struct hash_5cb2d75a230a501f {
        // offset 0x0, size 0x8
        uint:5 highestround;
        // offset 0x8, size 0x20
        uint highestscore;
        // offset 0x28, size 0x20
        uint hash_1b146f5d12b2b147;
        // offset 0x48, size 0x20
        uint hash_25ce643c6cf6507e;
        // offset 0x68, size 0x20
        uint hash_52dbe660cac88df9;
        // offset 0x88, size 0x4
        bool ranksachieved[4];
        // offset 0x8c, size 0x4
        uint:1 __pad[4];
    };

    // idx 17 members 15 size 0x1e0
    struct hash_722a4055916df1ff {
        // offset 0x0, size 0x20
        uint hash_2b12202dea292a78;
        // offset 0x20, size 0x20
        uint hash_65157f3e7aec5b46;
        // offset 0x40, size 0x20
        uint hash_256e550d360e7cf6;
        // offset 0x60, size 0x20
        uint hash_34212151b945069b;
        // offset 0x80, size 0x20
        uint numplayers;
        // offset 0xa0, size 0x20
        uint hash_477109e1674d778e;
        // offset 0xc0, size 0x20
        uint hash_6f7512e92e96a86a;
        // offset 0xe0, size 0x20
        uint hash_52086efefda6cd87;
        // offset 0x100, size 0x20
        uint hash_4c59bf00eb8047c0;
        // offset 0x120, size 0x20
        uint hash_4cda3bb269028c08;
        // offset 0x140, size 0x20
        uint hash_c159a616c8e909f;
        // offset 0x160, size 0x20
        uint hash_1b75e7812ae582a0;
        // offset 0x180, size 0x20
        uint hash_6e3edce84270ac4c;
        // offset 0x1a0, size 0x20
        uint hash_3ed0ae0744c78900;
        // offset 0x1c0, size 0x20
        uint hash_24bfa4caccae7ccc;
    };

    // idx 18 members 1 size 0x390
    struct hash_6ef8b9b7a8fd75e1 {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
    };

    // idx 19 members 5 size 0x3a0
    struct hash_48cae9b9fcff7a5e {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
        // offset 0x390, size 0x8
        bool hash_798921f18e351b13[8];
        // offset 0x398, size 0x1
        bool purchased;
        // offset 0x399, size 0x1
        bool markedold;
        // offset 0x39a, size 0x6
        uint:1 __pad[6];
    };

    // idx 20 members 2 size 0x398
    struct hash_67b00e3091cde2fd {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
        // offset 0x390, size 0x8
        bool hash_798921f18e351b13[8];
    };

    // idx 21 members 5 size 0x188
    struct hash_1608f63ae729eda5 {
        // offset 0x0, size 0x18
        uint:24 xp;
        // offset 0x18, size 0x8
        uint:2 plevel;
        // offset 0x20, size 0x38
        bool attachmentmarkedold[hash_12cd35aeeec0ae2d];
        // offset 0x58, size 0x12c
        bool optionmarkedasold[300];
        // offset 0x184, size 0x4
        uint:1 __pad[4];
    };

    // idx 22 members 1 size 0x100
    struct hash_ca5eede65d9c59e {
        // offset 0x0, size 0x100
        uint stats[hash_4a2552dbed57509c];
    };

    // idx 23 members 4 size 0x8
    struct hash_18562676c03c7954 {
        // offset 0x0, size 0x1
        bool purchased;
        // offset 0x1, size 0x1
        bool markedold;
        // offset 0x2, size 0x1
        bool unlocked;
        // offset 0x3, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 1 size 0x1
    struct hash_2d74f509e9d33a86 {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 25 members 5 size 0x3418
    struct hash_790a163d0959fa18 {
        // offset 0x0, size 0x2000
        hash_18562676c03c7954 icons[1024];
        // offset 0x2000, size 0x8
        uint:4 layerspurchased;
        // offset 0x2008, size 0x1400
        hash_18562676c03c7954 backgrounds[640];
        // offset 0x3408, size 0xc
        hash_2d74f509e9d33a86 layers[12];
        // offset 0x3414, size 0x4
        uint:1 __pad[4];
    };

    // idx 26 members 3 size 0x8
    struct hash_118b324c3f145926 {
        // offset 0x0, size 0x1
        bool purchased;
        // offset 0x1, size 0x1
        bool markedold;
        // offset 0x2, size 0x6
        uint:1 __pad[6];
    };

    // idx 27 members 3 size 0xa0
    struct hash_402baff65ae9b838 {
        // offset 0x0, size 0x28
        string(5) clanname;
        // offset 0x28, size 0x8
        byte selectedfeature;
        // offset 0x30, size 0x70
        hash_118b324c3f145926 features[hash_118b444c3f1477bc];
    };

    // idx 28 members 4 size 0x20
    struct hash_25a11738b4152d0e {
        // offset 0x0, size 0x8
        byte a;
        // offset 0x8, size 0x8
        byte b;
        // offset 0x10, size 0x8
        byte c;
        // offset 0x18, size 0x8
        byte d;
    };

    // idx 29 members 6 size 0x1c0
    struct hash_4976dab983b23e8c {
        // offset 0x0, size 0x20
        uint timestamp;
        // offset 0x20, size 0x20
        uint nattype;
        // offset 0x40, size 0x40
        uint64 macaddress;
        // offset 0x80, size 0x100
        string(32) consoleid64;
        // offset 0x180, size 0x20
        hash_25a11738b4152d0e ipexternal;
        // offset 0x1a0, size 0x20
        uint usecount;
    };

    // idx 30 members 4 size 0x10
    struct hash_4f6f299a12577aa4 {
        // offset 0x0, size 0x8
        byte itemunlocked;
        // offset 0x8, size 0x1
        bool tokenspent;
        // offset 0x9, size 0x4
        bool tokentype[prestigetokentype_e];
        // offset 0xd, size 0x3
        uint:1 __pad[3];
    };

    // idx 31 members 2 size 0xa0
    struct dlc_t {
        // offset 0x0, size 0x20
        uint mappacks;
        // offset 0x20, size 0x80
        bool mtx[128];
    };

    // idx 32 members 4 size 0x150
    struct hash_2efa05c484e77181 {
        // offset 0x0, size 0x140
        string(40) mapname;
        // offset 0x140, size 0x8
        uint:4 collectibleindex;
        // offset 0x148, size 0x1
        bool set;
        // offset 0x149, size 0x7
        uint:1 __pad[7];
    };

    // idx 33 members 1 size 0xd20
    struct hash_78a2c506849f9dda {
        // offset 0x0, size 0xd20
        hash_2efa05c484e77181 collectibles[bunkcollectibleslots_e];
    };

    // idx 34 members 1 size 0x280
    struct hash_6962b6aa0c4853f4 {
        // offset 0x0, size 0x280
        float properties[20];
    };

    // idx 0 members 379
    enum hash_44d262eb4cb5ed61 {
        hash_bf36041b40b541, // 0x0,
        hash_103be234630de92, // 0x1,
        kill_with_cooked_grenade, // 0x2,
        minxp, // 0x3,
        misses, // 0x4,
        killsconfirmed, // 0x5,
        hash_21bfdd7a5c4f23c, // 0x6,
        destroy_car, // 0x7,
        medal_bomb_detonated, // 0x8,
        stun_aitank_with_emp_grenade, // 0x9,
        hash_359f05e4bb4fa57, // 0xa,
        films_shoutcasted, // 0xb,
        medal_flag_capture, // 0xc,
        hash_3bba76aa8987218, // 0xd,
        hash_3bef98f1093a802, // 0xe,
        time_played_total, // 0xf,
        hash_495a843c176b50c, // 0x10,
        hash_4b3d34b8f0e5b8f, // 0x11,
        perk_fastweaponswitch_kill_after_swap, // 0x12,
        mappackmask, // 0x13,
        kill_nemesis, // 0x14,
        hash_60f3f9adb22e924, // 0x15,
        hash_66b80bdb17c4a04, // 0x16,
        perk_protection_stun_kills, // 0x17,
        hash_7afff19891fb72e, // 0x18,
        hash_7dc6ebcd202e54f, // 0x19,
        perk_hacker_destroy, // 0x1a,
        hash_85ed95e3662c128, // 0x1b,
        rankxp, // 0x1c,
        hash_976be36aea95e59, // 0x1d,
        lifetime_buyin, // 0x1e,
        hash_9904e795162f703, // 0x1f,
        killsdenied, // 0x20,
        kill_flashed_enemy, // 0x21,
        hash_b38ac686f0e8f63, // 0x22,
        perk_quieter_kills, // 0x23,
        medal_flag_carrier_kill_return_close, // 0x24,
        sessionbans, // 0x25,
        hash_d31df6b18ade168, // 0x26,
        kdratio, // 0x27,
        hash_e2a2b7303f42341, // 0x28,
        returns, // 0x29,
        assist, // 0x2a,
        hash_fdad95a70f179d7, // 0x2b,
        hash_1023368faabde7bb, // 0x2c,
        currencyspent, // 0x2d,
        emblem_version, // 0x2e,
        cp_challenges, // 0x2f,
        highlights_created, // 0x30,
        medal_defused_bomb, // 0x31,
        hash_11d98f202734032b, // 0x32,
        hash_124fa750b68f0d7e, // 0x33,
        medal_completed_match, // 0x34,
        contracts_completed, // 0x35,
        hash_12d8d630663bb4ba, // 0x36,
        hash_13eb46cb3c4c5613, // 0x37,
        hash_13ece4de9e4e2180, // 0x38,
        hash_143a19a14a3654db, // 0x39,
        assist_score_killstreak, // 0x3a,
        get_final_kill, // 0x3b,
        hash_14e63336430e7e93, // 0x3c,
        hash_154b0a4b01b8b616, // 0x3d,
        hash_156adf3fdb4091b7, // 0x3e,
        assist_score_microwave_turret, // 0x3f,
        hash_1715d388ed114bcd, // 0x40,
        hash_171c599dfd8645fb, // 0x41,
        hash_174beaaa686374bd, // 0x42,
        kill_with_resupplied_lethal_grenade, // 0x43,
        medal_kill_enemy_who_killed_teammate, // 0x44,
        hash_180255bc92de9611, // 0x45,
        hash_18343d39cc8c1aee, // 0x46,
        medal_multikill_7, // 0x47,
        medal_multikill_6, // 0x48,
        medal_multikill_5, // 0x49,
        medal_multikill_4, // 0x4a,
        medal_multikill_3, // 0x4b,
        medal_multikill_2, // 0x4c,
        medal_multikill_8, // 0x4d,
        hash_1994a1e6fd4eac28, // 0x4e,
        hash_19b8cdc5c2c0aeaa, // 0x4f,
        suicides, // 0x50,
        timewhennexthost, // 0x51,
        hash_1b0d87a2f1c0272a, // 0x52,
        hash_1b148631540ae995, // 0x53,
        hash_1b2898c0a3f4e7c1, // 0x54,
        hash_1b5a22bbb1c029a2, // 0x55,
        hash_1bb99705ba9a0e6c, // 0x56,
        hash_1bc0e2d787ec3594, // 0x57,
        hash_1be36c00d02a3702, // 0x58,
        hash_1be3ce237f8e1363, // 0x59,
        hash_1cafb2c429e2e97f, // 0x5a,
        streaker, // 0x5b,
        captures, // 0x5c,
        leaderboardfailures, // 0x5d,
        hash_1e2dfda54cd5e4c9, // 0x5e,
        ties, // 0x5f,
        hash_1ebf7dbc9624adec, // 0x60,
        hash_1edccd77f0b71ac2, // 0x61,
        medal_clear_2_attackers, // 0x62,
        capture_objective_in_smoke, // 0x63,
        medal_kill_enemy_while_capping, // 0x64,
        hash_20179a04c1573a20, // 0x65,
        career_score_multiteam, // 0x66,
        cur_win_streak, // 0x67,
        hash_20ce01ed472f2cfa, // 0x68,
        hash_215f2670384d5d7b, // 0x69,
        medal_multikill_more_than_8, // 0x6a,
        destroyed_helicopter_with_bullet, // 0x6b,
        hash_24c25fad1ac01302, // 0x6c,
        killstreak_10_no_weapons_perks, // 0x6d,
        wins, // 0x6e,
        hash_2686fe80d2524e8b, // 0x6f,
        hash_26cbd2aa4d6b9947, // 0x70,
        hash_26d6f92287f0a1e8, // 0x71,
        hash_26e0be3755c42495, // 0x72,
        defuses, // 0x73,
        hash_275f021a92a63aee, // 0x74,
        medal_quickly_secure_point, // 0x75,
        hash_281d1546e5e55ca2, // 0x76,
        longshot_3_onelife, // 0x77,
        hash_2864c17bca6e0048, // 0x78,
        hash_28db499720aedb6e, // 0x79,
        perk_scavenger_kills_after_resupply, // 0x7a,
        hash_2934211bcdcc9e9f, // 0x7b,
        hash_29361ee6a3ecd300, // 0x7c,
        wins_multiteam, // 0x7d,
        medal_longshot_kill, // 0x7e,
        codpoints, // 0x7f,
        hash_2a708c95aef05cb5, // 0x80,
        career_mastery, // 0x81,
        kill_while_damaging_with_microwave_turret, // 0x82,
        destroyed_qrdrone_with_bullet, // 0x83,
        score_hc, // 0x84,
        revives, // 0x85,
        hash_2b75a2161643473b, // 0x86,
        hash_2b75aabcf73dc800, // 0x87,
        medal_killstreak_5, // 0x88,
        hash_2bc315db95982551, // 0x89,
        hash_2bc5c849844383ea, // 0x8a,
        hack_enemy_target, // 0x8b,
        hash_2c5ae152d1f6928b, // 0x8c,
        hash_2d27ed7c35d831b4, // 0x8d,
        medal_kill_enemy_with_their_weapon, // 0x8e,
        medal_kill_flag_carrier, // 0x8f,
        hash_2e5c1654a4fc1b1c, // 0x90,
        career_score, // 0x91,
        laststatsbackup, // 0x92,
        hash_2f9649f2756709d6, // 0x93,
        pickups, // 0x94,
        hash_30298932ae26bbda, // 0x95,
        medal_killed_enemy_while_carrying_flag, // 0x96,
        killed_dog_close_to_teammate, // 0x97,
        hash_308b22e7c87a0709, // 0x98,
        medal_revenge_kill, // 0x99,
        hash_30e4e2bca0a739f1, // 0x9a,
        statresetcount, // 0x9b,
        plevel, // 0x9c,
        hash_32227db686e80e47, // 0x9d,
        perk_noname_kills, // 0x9e,
        kill_enemy_one_bullet_sniper, // 0x9f,
        hash_3349efb239eee96f, // 0xa0,
        medal_kill_enemy_after_death, // 0xa1,
        hash_34783bf7a1179064, // 0xa2,
        match_bonus, // 0xa3,
        medal_backstabber_kill, // 0xa4,
        hash_349aad0f6083abf5, // 0xa5,
        hash_34d9af35f8b02185, // 0xa6,
        hash_34e0fb49ecfca3e4, // 0xa7,
        lifetime_earnings, // 0xa8,
        hash_3553f8161e7781d7, // 0xa9,
        hash_361c89bc5aadcdac, // 0xaa,
        hash_362683bc5ab617ff, // 0xab,
        destroy_turret, // 0xac,
        hash_37e875290614f1e1, // 0xad,
        medal_killed_bomb_planter, // 0xae,
        medal_uninterrupted_obit_feed_kills, // 0xaf,
        hash_39e43b41e43d1803, // 0xb0,
        medal_kill_enemy_with_care_package_crush, // 0xb1,
        medal_kill_enemy_with_hacked_care_package, // 0xb2,
        chickens, // 0xb3,
        version, // 0xb4,
        hash_3bbf88b211193c04, // 0xb5,
        perk_gpsjammer_immune_kills, // 0xb6,
        hash_3c299d0329cb332c, // 0xb7,
        hash_3c4542a7c82860e0, // 0xb8,
        assist_score_cuav, // 0xb9,
        medal_elimination_and_last_player_alive, // 0xba,
        hash_3dd99fa1b0d098d9, // 0xbb,
        hash_3e76cbc8ac01d9d7, // 0xbc,
        hash_3f1cf355fd388770, // 0xbd,
        kill_enemy_through_wall, // 0xbe,
        wlratio, // 0xbf,
        hash_405015b29793595f, // 0xc0,
        hash_40882db8b6a7f07c, // 0xc1,
        hash_40a19266327e603c, // 0xc2,
        teamkills_nostats, // 0xc3,
        score, // 0xc4,
        hash_416018859c2a61e0, // 0xc5,
        hash_417ca489457d2cf4, // 0xc6,
        hash_419d426a0886d25b, // 0xc7,
        medal_bounce_hatchet_kill, // 0xc8,
        hash_41ca7e5eeaa76eeb, // 0xc9,
        kill_every_enemy, // 0xca,
        medal_comeback_from_deathstreak, // 0xcb,
        hash_43261bbcab41f5ea, // 0xcc,
        hash_43bc196ae14ca147, // 0xcd,
        medal_neutral_b_secured, // 0xce,
        defends, // 0xcf,
        kill_enemy_while_crouched, // 0xd0,
        hash_4474df73df91d1a5, // 0xd1,
        statsbackupversion, // 0xd2,
        perk_fastmantle_kills, // 0xd3,
        hash_4563c8418dc6e528, // 0xd4,
        hash_465a039cdd937ec7, // 0xd5,
        hash_4667e99dc6606eae, // 0xd6,
        hash_470c0ed4799f236a, // 0xd7,
        disarm_hacked_carepackage, // 0xd8,
        medal_won_match, // 0xd9,
        hash_473fa810546b3693, // 0xda,
        destroy_explosive_with_trophy, // 0xdb,
        medal_retrieve_own_tags, // 0xdc,
        killstreak_5_picked_up_weapon, // 0xdd,
        hash_490052167ba0e80d, // 0xde,
        hash_4926ee717d694914, // 0xdf,
        long_distance_hatchet_kill, // 0xe0,
        medal_hatchet_kill, // 0xe1,
        hash_4a10990c96559d2f, // 0xe2,
        hash_4a1c48bcaeb7db8b, // 0xe3,
        teamkills, // 0xe4,
        destroy_helicopter, // 0xe5,
        hash_4b6eca29e69997c3, // 0xe6,
        contracts_purchased, // 0xe7,
        destroy_explosive, // 0xe8,
        hash_4cb5d718c79cca63, // 0xe9,
        hash_4e0b68c44638153e, // 0xea,
        hash_4e450148b31156f5, // 0xeb,
        assist_score_emp, // 0xec,
        hash_4ed745a0ed607a71, // 0xed,
        hash_4ee566b815c01f47, // 0xee,
        medal_killed_bomb_defuser, // 0xef,
        hash_4f4597af75828585, // 0xf0,
        hash_4fc11abc691b8a37, // 0xf1,
        hash_50253bf63c3f8b9d, // 0xf2,
        losses, // 0xf3,
        weapons_mastery, // 0xf4,
        medal_kill_enemy_injuring_teammate, // 0xf5,
        hash_51ab6bbcb2afbcf9, // 0xf6,
        hash_520cc126821992fd, // 0xf7,
        destructions, // 0xf8,
        hash_52abffb28461993b, // 0xf9,
        hash_52b4d13e62f857e5, // 0xfa,
        hash_52f5a81d5f96353f, // 0xfb,
        destroy_qrdrone, // 0xfc,
        hash_54faafb480f79981, // 0xfd,
        career_score_hc, // 0xfe,
        hash_55fec19a7934aaad, // 0xff,
        destroy_equipment_with_emp_grenade, // 0x100,
        hash_566873251fdce0c1, // 0x101,
        deaths, // 0x102,
        lastxp, // 0x103,
        challenges, // 0x104,
        hash_57f78bc1a13bd0de, // 0x105,
        medal_kill_enemy_one_bullet, // 0x106,
        medal_killstreak_more_than_30, // 0x107,
        hash_5944fa5ab0189744, // 0x108,
        medal_kill_enemy_when_injured, // 0x109,
        hash_5a716221adc293be, // 0x10a,
        destroy_5_tactical_inserts, // 0x10b,
        maxxp, // 0x10c,
        hash_5afc248bef0531a3, // 0x10d,
        hash_5afdb3c40e9b3c4d, // 0x10e,
        medal_kill_confirmed_multi, // 0x10f,
        assist_score_uav, // 0x110,
        hash_5be3ebfe3f3384cc, // 0x111,
        total_shots, // 0x112,
        hash_5c5cab0cce302a01, // 0x113,
        hash_5cd23704d9c298c1, // 0x114,
        perk_longersprint, // 0x115,
        hash_5d409c26ab2b77d5, // 0x116,
        destroy_aircraft, // 0x117,
        hash_5eed179b63d40718, // 0x118,
        hash_5ff2a0c4a2a3d4a0, // 0x119,
        badhostcount, // 0x11a,
        kill_15_with_blade, // 0x11b,
        kill_shocked_enemy, // 0x11c,
        time_played_other, // 0x11d,
        hash_611f84a4a10d3e3e, // 0x11e,
        hash_620ca70cc9416098, // 0x11f,
        hash_621283451861c9e1, // 0x120,
        hash_631a17c263ea7faf, // 0x121,
        hash_63420e05d8642fcd, // 0x122,
        hash_63599ac17b01c38b, // 0x123,
        multikill_3_lmg_or_smg_hip_fire, // 0x124,
        hash_640adebcbd63d90f, // 0x125,
        hash_64c0bac013acc9f6, // 0x126,
        hash_64fdb6c907a131c5, // 0x127,
        hash_657cf19d17d5b366, // 0x128,
        last_escrow, // 0x129,
        medal_first_kill, // 0x12a,
        hash_65f463ce38d57812, // 0x12b,
        field_specialist, // 0x12c,
        hash_6639a2d5dd155965, // 0x12d,
        hash_668c1bd08c419f31, // 0x12e,
        wins_hc, // 0x12f,
        perk_loudenemies_kills, // 0x130,
        multikill_3_remote_missile, // 0x131,
        multikill_3_near_death, // 0x132,
        medal_assisted_suicide, // 0x133,
        gems, // 0x134,
        stats_version, // 0x135,
        destroy_aircraft_with_missile_drone, // 0x136,
        plants, // 0x137,
        secondary_mastery, // 0x138,
        perk_immune_cuav_kills, // 0x139,
        hash_69b5c8e5faf24cdf, // 0x13a,
        hash_69df2755783ea5b9, // 0x13b,
        hash_6a237bc096133b0a, // 0x13c,
        hash_6a4804b6ccfa8228, // 0x13d,
        incaps, // 0x13e,
        activate_cuav_while_enemy_satelite_active, // 0x13f,
        assist_score_satellite, // 0x140,
        hash_6ad99bdc72451712, // 0x141,
        hash_6b1f1900b1afff8b, // 0x142,
        hash_6b5388190c66aa86, // 0x143,
        medal_stop_enemy_killstreak, // 0x144,
        perk_movefaster_kills, // 0x145,
        medal_koth_secure, // 0x146,
        destroy_equipment, // 0x147,
        kill_enemy_while_prone, // 0x148,
        time_played_alive, // 0x149,
        hash_6cda7af101a7813b, // 0x14a,
        rank, // 0x14b,
        hash_6df09ff7e0a31041, // 0x14c,
        hash_6df6b645014f20ba, // 0x14d,
        hash_6edacd218965f8bd, // 0x14e,
        hash_6f14dca5dad9d904, // 0x14f,
        hash_6f1b532646f903fd, // 0x150,
        destroy_aircraft_with_emp, // 0x151,
        perk_nottargetedbyairsupport_destroy_aircraft, // 0x152,
        medal_kill_enemies_one_bullet, // 0x153,
        hits, // 0x154,
        hash_73d187ebf36663a3, // 0x155,
        call_in_3_care_packages, // 0x156,
        headshots, // 0x157,
        penetration_shots, // 0x158,
        multikill_3_with_mgl, // 0x159,
        medal_killstreak_15, // 0x15a,
        medal_killstreak_10, // 0x15b,
        medal_killstreak_20, // 0x15c,
        medal_killstreak_25, // 0x15d,
        medal_killstreak_30, // 0x15e,
        hash_77728de853e5ac67, // 0x15f,
        hash_78245078b8f303d0, // 0x160,
        gametypeban, // 0x161,
        accuracy, // 0x162,
        hash_794996196e74a949, // 0x163,
        score_multiteam, // 0x164,
        multikill_2_zone_attackers, // 0x165,
        defend_teammate_who_captured_package, // 0x166,
        hash_7a6ac3d3a3905c74, // 0x167,
        hash_7aa90c8abdf600e6, // 0x168,
        skulls, // 0x169,
        hash_7bf32e23f3be8ec6, // 0x16a,
        kills, // 0x16b,
        medal_defused_bomb_last_man_alive, // 0x16c,
        perk_bulletflinch_kills, // 0x16d,
        offends, // 0x16e,
        hash_7d320079120592ee, // 0x16f,
        kill_enemy_through_wall_with_fmj, // 0x170,
        assists, // 0x171,
        medal_headshot, // 0x172,
        hash_7ea091987cc17c99, // 0x173,
        hash_7edcc1ac6898f588, // 0x174,
        kill_enemy_one_bullet_shotgun, // 0x175,
        hash_7f2ed78b0d2848f2, // 0x176,
        medal_position_secure, // 0x177,
        hash_7fa27167eb8b2f65, // 0x178,
        hash_7fb734eea073a2c7, // 0x179,
        hash_7fc096557d0251c4, // 0x17a
    };

    // idx 1 members 6
    enum hash_1cbddecc4f162d46 {
        kill_streak, // 0x0,
        highest_accuracy, // 0x1,
        highest_kdratio, // 0x2,
        win_streak, // 0x3,
        death_streak, // 0x4,
        highest_score, // 0x5
    };

    // idx 2 members 2
    enum hash_28f0e9c96e9d895d {
        hash_f08aa26fabae647, // 0x0,
        hash_5740a8698a4d0345, // 0x1
    };

    // idx 3 members 2
    enum hash_6fc913ce2d7e3a05 {
        publicmatch, // 0x0,
        leaguematch, // 0x1
    };

    // idx 4 members 5
    enum hash_5af4108cc28a7f2f {
        dashboard, // 0x0,
        quit, // 0x1,
        kicked, // 0x2,
        finished, // 0x3,
        timeout, // 0x4
    };

    // idx 5 members 12
    enum hash_6501ee9650acd12c {
        coop, // 0x0,
        hash_166b6fdf8bfc14b0, // 0x1,
        cpzm, // 0x2,
        hvt, // 0x3,
        download, // 0x4,
        doa, // 0x5,
        hash_4cb6801fbfb4feba, // 0x6,
        hash_59109354c237d415, // 0x7,
        hash_61b9f30e20aecc3a, // 0x8,
        hash_6dbe071fd1f51551, // 0x9,
        hash_73a25371d607ae0f, // 0xa,
        pvp, // 0xb
    };

    // idx 6 members 10
    enum hash_77d9cc12441881d5 {
        hash_118a6332af43d97c, // 0x0,
        hash_1868403ad767bcd5, // 0x1,
        hash_192de2ac4a272b77, // 0x2,
        hash_1d9ec2a919018090, // 0x3,
        hash_28514534e1fdc6b7, // 0x4,
        hash_2aea61f2cc17fd2b, // 0x5,
        hash_364f981808c6bfc9, // 0x6,
        hash_46386949c31ed6c7, // 0x7,
        hash_551c2ad25d755c39, // 0x8,
        hash_79103217c50277f4, // 0x9
    };

    // idx 7 members 6
    enum hash_10edf09b258e1986 {
        hash_252319e61320ad11, // 0x0,
        revives, // 0x1,
        score, // 0x2,
        incaps, // 0x3,
        kills, // 0x4,
        assists, // 0x5
    };

    // idx 8 members 19
    enum hash_1609003ae729fea3 {
        destroyed, // 0x0,
        combatrecordstat, // 0x1,
        backstabber_kill, // 0x2,
        deathsduringuse, // 0x3,
        deaths, // 0x4,
        challenge6, // 0x5,
        challenge4, // 0x6,
        challenge5, // 0x7,
        challenge2, // 0x8,
        challenge3, // 0x9,
        challenge1, // 0xa,
        challenges, // 0xb,
        timeused, // 0xc,
        hits, // 0xd,
        headshots, // 0xe,
        shots, // 0xf,
        kills, // 0x10,
        used, // 0x11,
        assists, // 0x12
    };

    // idx 9 members 21
    enum hash_5075e11eecf4d03d {
        weapon_flamethrower, // 0x0,
        specialty, // 0x1,
        bonuscard, // 0x2,
        weapon_explosive, // 0x3,
        weapon_special, // 0x4,
        weapon_masterkey, // 0x5,
        miscweapon, // 0x6,
        weapon_pistol, // 0x7,
        killstreak, // 0x8,
        weapon_sniper, // 0x9,
        specialgrenade, // 0xa,
        weapon_grenadelauncher, // 0xb,
        weapon_launcher, // 0xc,
        weapon_grenade, // 0xd,
        hash_5352e5bf9311b021, // 0xe,
        weapon_shotgun, // 0xf,
        weapon_lmg, // 0x10,
        weapon_tactical, // 0x11,
        weapon_smg, // 0x12,
        weapon_cqb, // 0x13,
        weapon_assault, // 0x14
    };

    // idx 10 members 56
    enum hash_12cd35aeeec0ae2d {
        speedreloader, // 0x0,
        dynzoom, // 0x1,
        quickdraw, // 0x2,
        acog, // 0x3,
        pistolscope, // 0x4,
        mms, // 0x5,
        dw, // 0x6,
        gl, // 0x7,
        mk, // 0x8,
        ir, // 0x9,
        is, // 0xa,
        sf, // 0xb,
        rf, // 0xc,
        fastreload, // 0xd,
        extbarrel, // 0xe,
        rangefinder, // 0xf,
        steadyaim, // 0x10,
        stalker, // 0x11,
        barrelchoke, // 0x12,
        hipgrip, // 0x13,
        vzoom, // 0x14,
        supply, // 0x15,
        stalker2, // 0x16,
        extclip2, // 0x17,
        steadyaim2, // 0x18,
        tacknife, // 0x19,
        mixclip, // 0x1a,
        stackfire, // 0x1b,
        killcounter, // 0x1c,
        clantag, // 0x1d,
        damage2, // 0x1e,
        swayreduc, // 0x1f,
        extbarrel2, // 0x20,
        reddot, // 0x21,
        extclip, // 0x22,
        holo, // 0x23,
        elo, // 0x24,
        fastreload2, // 0x25,
        extrapellets, // 0x26,
        holdbreath, // 0x27,
        fmj2, // 0x28,
        quickdraw2, // 0x29,
        fmj, // 0x2a,
        adsreload, // 0x2b,
        suppressed, // 0x2c,
        grip2, // 0x2d,
        custom4, // 0x2e,
        custom5, // 0x2f,
        custom2, // 0x30,
        custom3, // 0x31,
        custom1, // 0x32,
        dualoptic, // 0x33,
        grip, // 0x34,
        reflex, // 0x35,
        uber, // 0x36,
        damage, // 0x37
    };

    // idx 11 members 8
    enum hash_4a2552dbed57509c {
        destroyed, // 0x0,
        backstabber_kill, // 0x1,
        deathsduringuse, // 0x2,
        deaths, // 0x3,
        hits, // 0x4,
        headshots, // 0x5,
        shots, // 0x6,
        kills, // 0x7
    };

    // idx 12 members 14
    enum hash_118b444c3f1477bc {
        yellow, // 0x0,
        red, // 0x1,
        move, // 0x2,
        green, // 0x3,
        left, // 0x4,
        hash_27d748f975c1cca2, // 0x5,
        hash_3abd10cd4bee218d, // 0x6,
        hash_3b1a3eb9e4c6e529, // 0x7,
        blue, // 0x8,
        cycle, // 0x9,
        hash_6c90e772edbc8708, // 0xa,
        cyan, // 0xb,
        hash_71874fda6a03b630, // 0xc,
        right, // 0xd
    };

    // idx 13 members 4
    enum prestigetokentype_e {
        hash_b48a752eef7af35, // 0x0,
        prestige_extra_cac, // 0x1,
        prestige_respec, // 0x2,
        prestige_reset_stats, // 0x3
    };

    // idx 14 members 10
    enum bunkcollectibleslots_e {
        bunk_collectible_medium_1, // 0x0,
        hash_1f95ed7440770262, // 0x1,
        bunk_collectible_medium_2, // 0x2,
        bunk_collectible_large_1, // 0x3,
        bunk_collectible_small_3, // 0x4,
        bunk_collectible_small_2, // 0x5,
        bunk_collectible_small_1, // 0x6,
        bunk_collectible_small_6, // 0x7,
        bunk_collectible_small_5, // 0x8,
        bunk_collectible_small_4, // 0x9
    };

    // idx 15 members 5
    enum hash_8fa49f7da0821e {
        hash_d6a8a92ed62461c, // 0x0,
        hash_211897601e420060, // 0x1,
        hash_3be7fbbad14a09aa, // 0x2,
        face, // 0x3,
        eyes, // 0x4
    };

    // idx 0 members 67 size 0x893f0
    // offset 0x0, size 0xa0
    dlc_t dlc;
    // offset 0xa0, size 0x20
    int unlocktokencount_weapon;
    // offset 0xc0, size 0x20
    uint hash_3ec47111a3993e52;
    // offset 0xe0, size 0x8
    uint:4 lastconsolesave;
    // offset 0xe8, size 0xc80
    hash_6962b6aa0c4853f4 facialfeatureproperties[hash_8fa49f7da0821e];
    // offset 0xd68, size 0x8
    uint:5 selectedcustomclass;
    // offset 0xd70, size 0x140
    hash_5ef0b8418736fce5 recentearnings[10];
    // offset 0xeb0, size 0x20
    uint hashlen;
    // offset 0xed0, size 0x40
    uint64 hash_37aeca4d39214e62;
    // offset 0xf10, size 0x3050
    hash_503eb0de8f9cf7c2 gamehistory[hash_6fc913ce2d7e3a05];
    // offset 0x3f60, size 0xc940
    hash_67b00e3091cde2fd attachments[hash_12cd35aeeec0ae2d];
    // offset 0x108a0, size 0x90
    uint:24 higheststats[hash_1cbddecc4f162d46];
    // offset 0x10930, size 0x13240
    hash_1608f63ae729eda5 weaponstats[200];
    // offset 0x23b70, size 0x320
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    // offset 0x23e90, size 0x20
    int combattrainingwins;
    // offset 0x23eb0, size 0x200
    uint:4 currentweaponlevels[64];
    // offset 0x240b0, size 0x40
    uint64 connectionid;
    // offset 0x240f0, size 0x1e0
    hash_722a4055916df1ff hash_7dd9f1ac62a346d;
    // offset 0x242d0, size 0x20
    int motdversionviewed;
    // offset 0x242f0, size 0xfb00
    hash_ca5eede65d9c59e variantstats[251];
    // offset 0x33df0, size 0x8
    uint:4 currenthitlocationindex;
    // offset 0x33df8, size 0x20
    uint hash_6dcaad4976588a44;
    // offset 0x33e18, size 0xc30
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    // offset 0x34a48, size 0x190
    byte hash_5988aeaa53d6e90c[50];
    // offset 0x34bd8, size 0x260
    uint hash_3de5a4846f45ad78[19];
    // offset 0x34e38, size 0x4970
    hash_2e0567490210dd82 playerstatsbymap[hash_77d9cc12441881d5];
    // offset 0x397a8, size 0x1180
    hash_4976dab983b23e8c consoleinfo[10];
    // offset 0x3a928, size 0xd20
    hash_78a2c506849f9dda bunkcollectibles;
    // offset 0x3b648, size 0x40
    uint64 hash_188ecc3aca50f93d;
    // offset 0x3b688, size 0x40
    uint achievements[hash_28f0e9c96e9d895d];
    // offset 0x3b6c8, size 0x49e0
    hash_2e1d3d3bb036d22c playerstatsbygametype[hash_6501ee9650acd12c];
    // offset 0x400a8, size 0x100
    byte demonwareflags[32];
    // offset 0x401a8, size 0x8
    uint:5 companion;
    // offset 0x401b0, size 0x20
    float skill_rating;
    // offset 0x401d0, size 0x20
    int unlocktokencount_attachment;
    // offset 0x401f0, size 0x20
    uint hash_3313a30250a39ec5;
    // offset 0x40210, size 0x180
    float hash_2363e7e74077b1c0[hash_6501ee9650acd12c];
    // offset 0x40390, size 0x20
    uint uploadbandwidth;
    // offset 0x403b0, size 0x140
    hash_4f6f299a12577aa4 prestigetokens[20];
    // offset 0x404f0, size 0xc0
    hash_4bb25d7ad41fb449 probation[hash_6fc913ce2d7e3a05];
    // offset 0x405b0, size 0x20
    int motdviewtime;
    // offset 0x405d0, size 0x8
    uint:3 faction;
    // offset 0x405d8, size 0x90
    hash_5cb2d75a230a501f trainingsimstats;
    // offset 0x40668, size 0x4ad0
    hash_6ef8b9b7a8fd75e1 groupstats[hash_5075e11eecf4d03d];
    // offset 0x45138, size 0x8
    uint:4 hash_191fbfb9e1a3acf3;
    // offset 0x45140, size 0x20
    float hash_54a74aa3d5f3346d;
    // offset 0x45160, size 0x4710
    hash_6b3db80d498eb06 playerstatslist[hash_44d262eb4cb5ed61];
    // offset 0x49870, size 0xa0
    hash_402baff65ae9b838 clantagstats;
    // offset 0x49910, size 0x20
    float skill_variance;
    // offset 0x49930, size 0x180
    float hash_3a7324ad328f0e2e[hash_6501ee9650acd12c];
    // offset 0x49ab0, size 0x22e8
    hash_6b411bb770fc8f6c afteractionreportstats;
    // offset 0x4bd98, size 0x100
    byte unlocks[32];
    // offset 0x4be98, size 0x40
    uint64 playerxuid;
    // offset 0x4bed8, size 0x3418
    hash_790a163d0959fa18 emblemstats;
    // offset 0x4f2f0, size 0x3a000
    hash_48cae9b9fcff7a5e itemstats[256];
    // offset 0x892f0, size 0x20
    uint highestmapreached;
    // offset 0x89310, size 0x1
    bool hash_3ceb201776787882;
    // offset 0x89311, size 0x1
    hash_7690a9df20146d8a zmcampaigndata;
    // offset 0x89312, size 0x20
    bool musicunlocks[32];
    // offset 0x89332, size 0x40
    bool hash_1576a2fd30a2dfb0[64];
    // offset 0x89372, size 0x1
    bool hash_46e7db8ceaba5b2f;
    // offset 0x89373, size 0x14
    bool hash_711b1260308620e7[20];
    // offset 0x89387, size 0x14
    bool playercpdecorations[20];
    // offset 0x8939b, size 0x1
    bool hash_8cbe2e4ecb4fc43;
    // offset 0x8939c, size 0x1
    bool completedfirsttimeflow;
    // offset 0x8939d, size 0x4d
    bool completedchallengeseen[77];
    // offset 0x893ea, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_stats.ddl
// metatable "hash_298315c475e28de2"

version 17 {
    // idx 1 members 2 size 0x30
    struct hash_6b3db80d498eb06 {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
    };

    // idx 2 members 3 size 0x20
    struct hash_5ef0b8418736fce5 {
        // offset 0x0, size 0x18
        uint:24 score;
        // offset 0x18, size 0x1
        bool valid;
        // offset 0x19, size 0x7
        uint:1 __pad[7];
    };

    // idx 3 members 4 size 0x138
    struct hash_3b0f9e0921513e2c {
        // offset 0x0, size 0x98
        byte hitlocations[19];
        // offset 0x98, size 0x98
        byte criticalhitlocations[19];
        // offset 0x130, size 0x1
        bool valid;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 4 members 6 size 0x50
    struct hash_1a52129598e71dab {
        // offset 0x0, size 0x10
        short kills;
        // offset 0x10, size 0x18
        uint:24 score;
        // offset 0x28, size 0x10
        short gametype;
        // offset 0x38, size 0x10
        short deaths;
        // offset 0x48, size 0x1
        bool valid;
        // offset 0x49, size 0x7
        uint:1 __pad[7];
    };

    // idx 5 members 14 size 0x2e8
    struct hash_656bfcb3838e2907 {
        // offset 0x0, size 0x100
        string(32) name;
        // offset 0x100, size 0x100
        string(32) xuid;
        // offset 0x200, size 0x20
        uint curxp;
        // offset 0x220, size 0x10
        short kills;
        // offset 0x230, size 0x20
        uint prvxp;
        // offset 0x250, size 0x10
        short score;
        // offset 0x260, size 0x10
        short revives;
        // offset 0x270, size 0x10
        short currank;
        // offset 0x280, size 0x10
        short deaths;
        // offset 0x290, size 0x30
        short medals[3];
        // offset 0x2c0, size 0x10
        short assists;
        // offset 0x2d0, size 0x10
        short hash_59ef59765ff3f049;
        // offset 0x2e0, size 0x1
        bool isactive;
        // offset 0x2e1, size 0x7
        uint:1 __pad[7];
    };

    // idx 6 members 6 size 0x22e8
    struct hash_6b411bb770fc8f6c {
        // offset 0x0, size 0x22e0
        hash_656bfcb3838e2907 playerstats[12];
        // offset 0x22e0, size 0x1
        bool valid;
        // offset 0x22e1, size 0x1
        bool matchwon;
        // offset 0x22e2, size 0x1
        bool privatematch;
        // offset 0x22e3, size 0x1
        bool viewed;
        // offset 0x22e4, size 0x4
        uint:1 __pad[4];
    };

    // idx 7 members 1 size 0x1
    struct hash_7690a9df20146d8a {
        // offset 0x0, size 0x1
        bool unlocked;
    };

    // idx 8 members 6 size 0x90
    struct hash_2f60329a207db2b8 {
        // offset 0x0, size 0x18
        uint:24 quit;
        // offset 0x18, size 0x18
        uint:24 started;
        // offset 0x30, size 0x18
        uint:24 completed;
        // offset 0x48, size 0x18
        uint:24 timeout;
        // offset 0x60, size 0x18
        uint:24 kicked;
        // offset 0x78, size 0x18
        uint:24 dashboard;
    };

    // idx 9 members 2 size 0x120
    struct hash_b5aec1419b9a02d {
        // offset 0x0, size 0x90
        hash_2f60329a207db2b8 hosted;
        // offset 0x90, size 0x90
        hash_2f60329a207db2b8 played;
    };

    // idx 10 members 11 size 0xb8
    struct hash_5fafb39a86bc6dc7 {
        // offset 0x0, size 0x10
        short kills;
        // offset 0x10, size 0x18
        uint:24 score;
        // offset 0x28, size 0x20
        uint startingtime;
        // offset 0x48, size 0x20
        uint endingtime;
        // offset 0x68, size 0x8
        uint:5 scoreboardposition;
        // offset 0x70, size 0x20
        float teamscoreratio;
        // offset 0x90, size 0x8
        uint:5 gametype;
        // offset 0x98, size 0x10
        short deaths;
        // offset 0xa8, size 0x8
        uint:3 quittype;
        // offset 0xb0, size 0x1
        bool forgiven;
        // offset 0xb1, size 0x7
        uint:1 __pad[7];
    };

    // idx 11 members 3 size 0x1828
    struct hash_503eb0de8f9cf7c2 {
        // offset 0x0, size 0x1700
        hash_5fafb39a86bc6dc7 matchhistory[32];
        // offset 0x1700, size 0x120
        hash_b5aec1419b9a02d modehistory;
        // offset 0x1820, size 0x8
        byte currentmatchhistoryindex;
    };

    // idx 12 members 3 size 0x60
    struct hash_4bb25d7ad41fb449 {
        // offset 0x0, size 0x20
        uint count;
        // offset 0x20, size 0x20
        uint version;
        // offset 0x40, size 0x20
        uint timewhenprobationisdone;
    };

    // idx 13 members 28 size 0x628
    struct hash_2e1d3d3bb036d22c {
        // offset 0x0, size 0x30
        hash_6b3db80d498eb06 ties;
        // offset 0x30, size 0x30
        hash_6b3db80d498eb06 wins;
        // offset 0x60, size 0x30
        hash_6b3db80d498eb06 assists;
        // offset 0x90, size 0x30
        hash_6b3db80d498eb06 crush;
        // offset 0xc0, size 0x30
        hash_6b3db80d498eb06 kills;
        // offset 0xf0, size 0x30
        hash_6b3db80d498eb06 score;
        // offset 0x120, size 0x30
        hash_6b3db80d498eb06 time_played_total;
        // offset 0x150, size 0x30
        hash_6b3db80d498eb06 challenge1;
        // offset 0x180, size 0x30
        hash_6b3db80d498eb06 challenge2;
        // offset 0x1b0, size 0x30
        hash_6b3db80d498eb06 challenge3;
        // offset 0x1e0, size 0x30
        hash_6b3db80d498eb06 challenge4;
        // offset 0x210, size 0x30
        hash_6b3db80d498eb06 challenge5;
        // offset 0x240, size 0x30
        hash_6b3db80d498eb06 challenge6;
        // offset 0x270, size 0x30
        hash_6b3db80d498eb06 challenge7;
        // offset 0x2a0, size 0x30
        hash_6b3db80d498eb06 challenge8;
        // offset 0x2d0, size 0x30
        hash_6b3db80d498eb06 challenge9;
        // offset 0x300, size 0x30
        hash_6b3db80d498eb06 win_streak;
        // offset 0x330, size 0x30
        hash_6b3db80d498eb06 cur_win_streak;
        // offset 0x360, size 0x30
        hash_6b3db80d498eb06 kill_streak;
        // offset 0x390, size 0x30
        hash_6b3db80d498eb06 deaths;
        // offset 0x3c0, size 0x30
        hash_6b3db80d498eb06 wlratio;
        // offset 0x3f0, size 0x8
        int:5 prevscoreindex;
        // offset 0x3f8, size 0x30
        hash_6b3db80d498eb06 losses;
        // offset 0x428, size 0x30
        hash_6b3db80d498eb06 defends;
        // offset 0x458, size 0x30
        hash_6b3db80d498eb06 offends;
        // offset 0x488, size 0x30
        hash_6b3db80d498eb06 challenge10;
        // offset 0x4b8, size 0x140
        hash_5ef0b8418736fce5 prevscores[10];
        // offset 0x5f8, size 0x30
        hash_6b3db80d498eb06 kdratio;
    };

    // idx 14 members 3 size 0x48
    struct hash_63565a3d40f66255 {
        // offset 0x0, size 0x8
        uint:2 state;
        // offset 0x8, size 0x20
        uint value;
        // offset 0x28, size 0x20
        uint highestvalue;
    };

    // idx 15 members 17 size 0x758
    struct hash_2e0567490210dd82 {
        // offset 0x0, size 0x8
        uint:3 hash_bf847c54dac3b;
        // offset 0x8, size 0xc0
        uint higheststats[hash_10edf09b258e1986];
        // offset 0xc8, size 0xc0
        uint currentstats[hash_10edf09b258e1986];
        // offset 0x188, size 0x20
        uint hash_7787ac0184215bc1;
        // offset 0x1a8, size 0x558
        hash_63565a3d40f66255 accolades[19];
        // offset 0x700, size 0x20
        uint hash_3cd96ca92c6f0d4c;
        // offset 0x720, size 0x10
        short hash_1cc8d841efacb52a;
        // offset 0x730, size 0x6
        bool hash_1e0160af4fd80dff[6];
        // offset 0x736, size 0x6
        bool hash_518113a79b08988[6];
        // offset 0x73c, size 0x1
        bool allcollectiblescollected;
        // offset 0x73d, size 0x1
        bool checkpointused;
        // offset 0x73e, size 0xa
        bool collectibles[10];
        // offset 0x748, size 0x1
        bool hash_71b609b078e360c0;
        // offset 0x749, size 0x6
        bool hash_657891d65d881524[6];
        // offset 0x74f, size 0x1
        bool hasbeencompleted;
        // offset 0x750, size 0x6
        bool hash_233621878f97486b[6];
        // offset 0x756, size 0x2
        uint:1 __pad[2];
    };

    // idx 16 members 7 size 0x90
    struct hash_5cb2d75a230a501f {
        // offset 0x0, size 0x8
        uint:5 highestround;
        // offset 0x8, size 0x20
        uint highestscore;
        // offset 0x28, size 0x20
        uint hash_1b146f5d12b2b147;
        // offset 0x48, size 0x20
        uint hash_25ce643c6cf6507e;
        // offset 0x68, size 0x20
        uint hash_52dbe660cac88df9;
        // offset 0x88, size 0x4
        bool ranksachieved[4];
        // offset 0x8c, size 0x4
        uint:1 __pad[4];
    };

    // idx 17 members 15 size 0x1e0
    struct hash_722a4055916df1ff {
        // offset 0x0, size 0x20
        uint hash_2b12202dea292a78;
        // offset 0x20, size 0x20
        uint hash_65157f3e7aec5b46;
        // offset 0x40, size 0x20
        uint hash_256e550d360e7cf6;
        // offset 0x60, size 0x20
        uint hash_34212151b945069b;
        // offset 0x80, size 0x20
        uint numplayers;
        // offset 0xa0, size 0x20
        uint hash_477109e1674d778e;
        // offset 0xc0, size 0x20
        uint hash_6f7512e92e96a86a;
        // offset 0xe0, size 0x20
        uint hash_52086efefda6cd87;
        // offset 0x100, size 0x20
        uint hash_4c59bf00eb8047c0;
        // offset 0x120, size 0x20
        uint hash_4cda3bb269028c08;
        // offset 0x140, size 0x20
        uint hash_c159a616c8e909f;
        // offset 0x160, size 0x20
        uint hash_1b75e7812ae582a0;
        // offset 0x180, size 0x20
        uint hash_6e3edce84270ac4c;
        // offset 0x1a0, size 0x20
        uint hash_3ed0ae0744c78900;
        // offset 0x1c0, size 0x20
        uint hash_24bfa4caccae7ccc;
    };

    // idx 18 members 1 size 0x390
    struct hash_6ef8b9b7a8fd75e1 {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
    };

    // idx 19 members 5 size 0x3a0
    struct hash_48cae9b9fcff7a5e {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
        // offset 0x390, size 0x8
        bool hash_798921f18e351b13[8];
        // offset 0x398, size 0x1
        bool purchased;
        // offset 0x399, size 0x1
        bool markedold;
        // offset 0x39a, size 0x6
        uint:1 __pad[6];
    };

    // idx 20 members 2 size 0x398
    struct hash_67b00e3091cde2fd {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
        // offset 0x390, size 0x8
        bool hash_798921f18e351b13[8];
    };

    // idx 21 members 5 size 0x188
    struct hash_1608f63ae729eda5 {
        // offset 0x0, size 0x18
        uint:24 xp;
        // offset 0x18, size 0x8
        uint:2 plevel;
        // offset 0x20, size 0x38
        bool attachmentmarkedold[hash_12cd35aeeec0ae2d];
        // offset 0x58, size 0x12c
        bool optionmarkedasold[300];
        // offset 0x184, size 0x4
        uint:1 __pad[4];
    };

    // idx 22 members 1 size 0x100
    struct hash_ca5eede65d9c59e {
        // offset 0x0, size 0x100
        uint stats[hash_4a2552dbed57509c];
    };

    // idx 23 members 4 size 0x8
    struct hash_18562676c03c7954 {
        // offset 0x0, size 0x1
        bool purchased;
        // offset 0x1, size 0x1
        bool markedold;
        // offset 0x2, size 0x1
        bool unlocked;
        // offset 0x3, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 1 size 0x1
    struct hash_2d74f509e9d33a86 {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 25 members 5 size 0x3418
    struct hash_790a163d0959fa18 {
        // offset 0x0, size 0x2000
        hash_18562676c03c7954 icons[1024];
        // offset 0x2000, size 0x8
        uint:4 layerspurchased;
        // offset 0x2008, size 0x1400
        hash_18562676c03c7954 backgrounds[640];
        // offset 0x3408, size 0xc
        hash_2d74f509e9d33a86 layers[12];
        // offset 0x3414, size 0x4
        uint:1 __pad[4];
    };

    // idx 26 members 3 size 0x8
    struct hash_118b324c3f145926 {
        // offset 0x0, size 0x1
        bool purchased;
        // offset 0x1, size 0x1
        bool markedold;
        // offset 0x2, size 0x6
        uint:1 __pad[6];
    };

    // idx 27 members 3 size 0xa0
    struct hash_402baff65ae9b838 {
        // offset 0x0, size 0x28
        string(5) clanname;
        // offset 0x28, size 0x8
        byte selectedfeature;
        // offset 0x30, size 0x70
        hash_118b324c3f145926 features[hash_118b444c3f1477bc];
    };

    // idx 28 members 4 size 0x20
    struct hash_25a11738b4152d0e {
        // offset 0x0, size 0x8
        byte a;
        // offset 0x8, size 0x8
        byte b;
        // offset 0x10, size 0x8
        byte c;
        // offset 0x18, size 0x8
        byte d;
    };

    // idx 29 members 6 size 0x1c0
    struct hash_4976dab983b23e8c {
        // offset 0x0, size 0x20
        uint timestamp;
        // offset 0x20, size 0x20
        uint nattype;
        // offset 0x40, size 0x40
        uint64 macaddress;
        // offset 0x80, size 0x100
        string(32) consoleid64;
        // offset 0x180, size 0x20
        hash_25a11738b4152d0e ipexternal;
        // offset 0x1a0, size 0x20
        uint usecount;
    };

    // idx 30 members 4 size 0x10
    struct hash_4f6f299a12577aa4 {
        // offset 0x0, size 0x8
        byte itemunlocked;
        // offset 0x8, size 0x1
        bool tokenspent;
        // offset 0x9, size 0x4
        bool tokentype[prestigetokentype_e];
        // offset 0xd, size 0x3
        uint:1 __pad[3];
    };

    // idx 31 members 2 size 0xa0
    struct dlc_t {
        // offset 0x0, size 0x20
        uint mappacks;
        // offset 0x20, size 0x80
        bool mtx[128];
    };

    // idx 32 members 4 size 0x150
    struct hash_2efa05c484e77181 {
        // offset 0x0, size 0x140
        string(40) mapname;
        // offset 0x140, size 0x8
        uint:4 collectibleindex;
        // offset 0x148, size 0x1
        bool set;
        // offset 0x149, size 0x7
        uint:1 __pad[7];
    };

    // idx 33 members 1 size 0xd20
    struct hash_78a2c506849f9dda {
        // offset 0x0, size 0xd20
        hash_2efa05c484e77181 collectibles[bunkcollectibleslots_e];
    };

    // idx 34 members 1 size 0x280
    struct hash_6962b6aa0c4853f4 {
        // offset 0x0, size 0x280
        float properties[20];
    };

    // idx 0 members 378
    enum hash_44d262eb4cb5ed61 {
        hash_bf36041b40b541, // 0x0,
        hash_103be234630de92, // 0x1,
        kill_with_cooked_grenade, // 0x2,
        minxp, // 0x3,
        misses, // 0x4,
        killsconfirmed, // 0x5,
        hash_21bfdd7a5c4f23c, // 0x6,
        destroy_car, // 0x7,
        medal_bomb_detonated, // 0x8,
        stun_aitank_with_emp_grenade, // 0x9,
        hash_359f05e4bb4fa57, // 0xa,
        films_shoutcasted, // 0xb,
        medal_flag_capture, // 0xc,
        hash_3bba76aa8987218, // 0xd,
        hash_3bef98f1093a802, // 0xe,
        time_played_total, // 0xf,
        hash_495a843c176b50c, // 0x10,
        hash_4b3d34b8f0e5b8f, // 0x11,
        perk_fastweaponswitch_kill_after_swap, // 0x12,
        mappackmask, // 0x13,
        kill_nemesis, // 0x14,
        hash_60f3f9adb22e924, // 0x15,
        hash_66b80bdb17c4a04, // 0x16,
        perk_protection_stun_kills, // 0x17,
        hash_7afff19891fb72e, // 0x18,
        hash_7dc6ebcd202e54f, // 0x19,
        perk_hacker_destroy, // 0x1a,
        hash_85ed95e3662c128, // 0x1b,
        rankxp, // 0x1c,
        hash_976be36aea95e59, // 0x1d,
        lifetime_buyin, // 0x1e,
        hash_9904e795162f703, // 0x1f,
        killsdenied, // 0x20,
        kill_flashed_enemy, // 0x21,
        hash_b38ac686f0e8f63, // 0x22,
        perk_quieter_kills, // 0x23,
        medal_flag_carrier_kill_return_close, // 0x24,
        sessionbans, // 0x25,
        hash_d31df6b18ade168, // 0x26,
        kdratio, // 0x27,
        hash_e2a2b7303f42341, // 0x28,
        returns, // 0x29,
        assist, // 0x2a,
        hash_fdad95a70f179d7, // 0x2b,
        hash_1023368faabde7bb, // 0x2c,
        currencyspent, // 0x2d,
        emblem_version, // 0x2e,
        cp_challenges, // 0x2f,
        highlights_created, // 0x30,
        medal_defused_bomb, // 0x31,
        hash_11d98f202734032b, // 0x32,
        hash_124fa750b68f0d7e, // 0x33,
        medal_completed_match, // 0x34,
        contracts_completed, // 0x35,
        hash_12d8d630663bb4ba, // 0x36,
        hash_13eb46cb3c4c5613, // 0x37,
        hash_13ece4de9e4e2180, // 0x38,
        hash_143a19a14a3654db, // 0x39,
        assist_score_killstreak, // 0x3a,
        get_final_kill, // 0x3b,
        hash_14e63336430e7e93, // 0x3c,
        hash_154b0a4b01b8b616, // 0x3d,
        hash_156adf3fdb4091b7, // 0x3e,
        assist_score_microwave_turret, // 0x3f,
        hash_1715d388ed114bcd, // 0x40,
        hash_171c599dfd8645fb, // 0x41,
        hash_174beaaa686374bd, // 0x42,
        kill_with_resupplied_lethal_grenade, // 0x43,
        medal_kill_enemy_who_killed_teammate, // 0x44,
        hash_180255bc92de9611, // 0x45,
        hash_18343d39cc8c1aee, // 0x46,
        medal_multikill_7, // 0x47,
        medal_multikill_6, // 0x48,
        medal_multikill_5, // 0x49,
        medal_multikill_4, // 0x4a,
        medal_multikill_3, // 0x4b,
        medal_multikill_2, // 0x4c,
        medal_multikill_8, // 0x4d,
        hash_1994a1e6fd4eac28, // 0x4e,
        hash_19b8cdc5c2c0aeaa, // 0x4f,
        suicides, // 0x50,
        timewhennexthost, // 0x51,
        hash_1b0d87a2f1c0272a, // 0x52,
        hash_1b148631540ae995, // 0x53,
        hash_1b2898c0a3f4e7c1, // 0x54,
        hash_1b5a22bbb1c029a2, // 0x55,
        hash_1bb99705ba9a0e6c, // 0x56,
        hash_1bc0e2d787ec3594, // 0x57,
        hash_1be36c00d02a3702, // 0x58,
        hash_1be3ce237f8e1363, // 0x59,
        hash_1cafb2c429e2e97f, // 0x5a,
        streaker, // 0x5b,
        captures, // 0x5c,
        leaderboardfailures, // 0x5d,
        hash_1e2dfda54cd5e4c9, // 0x5e,
        ties, // 0x5f,
        hash_1ebf7dbc9624adec, // 0x60,
        hash_1edccd77f0b71ac2, // 0x61,
        medal_clear_2_attackers, // 0x62,
        capture_objective_in_smoke, // 0x63,
        medal_kill_enemy_while_capping, // 0x64,
        hash_20179a04c1573a20, // 0x65,
        career_score_multiteam, // 0x66,
        cur_win_streak, // 0x67,
        hash_20ce01ed472f2cfa, // 0x68,
        hash_215f2670384d5d7b, // 0x69,
        medal_multikill_more_than_8, // 0x6a,
        destroyed_helicopter_with_bullet, // 0x6b,
        hash_24c25fad1ac01302, // 0x6c,
        killstreak_10_no_weapons_perks, // 0x6d,
        wins, // 0x6e,
        hash_2686fe80d2524e8b, // 0x6f,
        hash_26cbd2aa4d6b9947, // 0x70,
        hash_26d6f92287f0a1e8, // 0x71,
        hash_26e0be3755c42495, // 0x72,
        defuses, // 0x73,
        hash_275f021a92a63aee, // 0x74,
        medal_quickly_secure_point, // 0x75,
        hash_281d1546e5e55ca2, // 0x76,
        longshot_3_onelife, // 0x77,
        hash_2864c17bca6e0048, // 0x78,
        hash_28db499720aedb6e, // 0x79,
        perk_scavenger_kills_after_resupply, // 0x7a,
        hash_2934211bcdcc9e9f, // 0x7b,
        hash_29361ee6a3ecd300, // 0x7c,
        wins_multiteam, // 0x7d,
        medal_longshot_kill, // 0x7e,
        codpoints, // 0x7f,
        hash_2a708c95aef05cb5, // 0x80,
        career_mastery, // 0x81,
        kill_while_damaging_with_microwave_turret, // 0x82,
        destroyed_qrdrone_with_bullet, // 0x83,
        score_hc, // 0x84,
        revives, // 0x85,
        hash_2b75a2161643473b, // 0x86,
        hash_2b75aabcf73dc800, // 0x87,
        medal_killstreak_5, // 0x88,
        hash_2bc315db95982551, // 0x89,
        hash_2bc5c849844383ea, // 0x8a,
        hack_enemy_target, // 0x8b,
        hash_2c5ae152d1f6928b, // 0x8c,
        hash_2d27ed7c35d831b4, // 0x8d,
        medal_kill_enemy_with_their_weapon, // 0x8e,
        medal_kill_flag_carrier, // 0x8f,
        hash_2e5c1654a4fc1b1c, // 0x90,
        career_score, // 0x91,
        laststatsbackup, // 0x92,
        hash_2f9649f2756709d6, // 0x93,
        pickups, // 0x94,
        hash_30298932ae26bbda, // 0x95,
        medal_killed_enemy_while_carrying_flag, // 0x96,
        killed_dog_close_to_teammate, // 0x97,
        hash_308b22e7c87a0709, // 0x98,
        medal_revenge_kill, // 0x99,
        hash_30e4e2bca0a739f1, // 0x9a,
        statresetcount, // 0x9b,
        plevel, // 0x9c,
        hash_32227db686e80e47, // 0x9d,
        perk_noname_kills, // 0x9e,
        kill_enemy_one_bullet_sniper, // 0x9f,
        hash_3349efb239eee96f, // 0xa0,
        medal_kill_enemy_after_death, // 0xa1,
        hash_34783bf7a1179064, // 0xa2,
        match_bonus, // 0xa3,
        medal_backstabber_kill, // 0xa4,
        hash_349aad0f6083abf5, // 0xa5,
        hash_34d9af35f8b02185, // 0xa6,
        hash_34e0fb49ecfca3e4, // 0xa7,
        lifetime_earnings, // 0xa8,
        hash_3553f8161e7781d7, // 0xa9,
        hash_361c89bc5aadcdac, // 0xaa,
        hash_362683bc5ab617ff, // 0xab,
        destroy_turret, // 0xac,
        hash_37e875290614f1e1, // 0xad,
        medal_killed_bomb_planter, // 0xae,
        medal_uninterrupted_obit_feed_kills, // 0xaf,
        hash_39e43b41e43d1803, // 0xb0,
        medal_kill_enemy_with_care_package_crush, // 0xb1,
        medal_kill_enemy_with_hacked_care_package, // 0xb2,
        chickens, // 0xb3,
        version, // 0xb4,
        hash_3bbf88b211193c04, // 0xb5,
        perk_gpsjammer_immune_kills, // 0xb6,
        hash_3c299d0329cb332c, // 0xb7,
        hash_3c4542a7c82860e0, // 0xb8,
        assist_score_cuav, // 0xb9,
        medal_elimination_and_last_player_alive, // 0xba,
        hash_3dd99fa1b0d098d9, // 0xbb,
        hash_3e76cbc8ac01d9d7, // 0xbc,
        hash_3f1cf355fd388770, // 0xbd,
        kill_enemy_through_wall, // 0xbe,
        wlratio, // 0xbf,
        hash_405015b29793595f, // 0xc0,
        hash_40882db8b6a7f07c, // 0xc1,
        hash_40a19266327e603c, // 0xc2,
        teamkills_nostats, // 0xc3,
        score, // 0xc4,
        hash_416018859c2a61e0, // 0xc5,
        hash_417ca489457d2cf4, // 0xc6,
        hash_419d426a0886d25b, // 0xc7,
        medal_bounce_hatchet_kill, // 0xc8,
        hash_41ca7e5eeaa76eeb, // 0xc9,
        kill_every_enemy, // 0xca,
        medal_comeback_from_deathstreak, // 0xcb,
        hash_43261bbcab41f5ea, // 0xcc,
        hash_43bc196ae14ca147, // 0xcd,
        medal_neutral_b_secured, // 0xce,
        defends, // 0xcf,
        kill_enemy_while_crouched, // 0xd0,
        hash_4474df73df91d1a5, // 0xd1,
        statsbackupversion, // 0xd2,
        perk_fastmantle_kills, // 0xd3,
        hash_4563c8418dc6e528, // 0xd4,
        hash_465a039cdd937ec7, // 0xd5,
        hash_4667e99dc6606eae, // 0xd6,
        hash_470c0ed4799f236a, // 0xd7,
        disarm_hacked_carepackage, // 0xd8,
        medal_won_match, // 0xd9,
        hash_473fa810546b3693, // 0xda,
        destroy_explosive_with_trophy, // 0xdb,
        medal_retrieve_own_tags, // 0xdc,
        killstreak_5_picked_up_weapon, // 0xdd,
        hash_490052167ba0e80d, // 0xde,
        hash_4926ee717d694914, // 0xdf,
        long_distance_hatchet_kill, // 0xe0,
        medal_hatchet_kill, // 0xe1,
        hash_4a10990c96559d2f, // 0xe2,
        hash_4a1c48bcaeb7db8b, // 0xe3,
        teamkills, // 0xe4,
        destroy_helicopter, // 0xe5,
        hash_4b6eca29e69997c3, // 0xe6,
        contracts_purchased, // 0xe7,
        destroy_explosive, // 0xe8,
        hash_4cb5d718c79cca63, // 0xe9,
        hash_4e0b68c44638153e, // 0xea,
        hash_4e450148b31156f5, // 0xeb,
        assist_score_emp, // 0xec,
        hash_4ed745a0ed607a71, // 0xed,
        hash_4ee566b815c01f47, // 0xee,
        medal_killed_bomb_defuser, // 0xef,
        hash_4f4597af75828585, // 0xf0,
        hash_4fc11abc691b8a37, // 0xf1,
        hash_50253bf63c3f8b9d, // 0xf2,
        losses, // 0xf3,
        weapons_mastery, // 0xf4,
        medal_kill_enemy_injuring_teammate, // 0xf5,
        hash_51ab6bbcb2afbcf9, // 0xf6,
        hash_520cc126821992fd, // 0xf7,
        destructions, // 0xf8,
        hash_52abffb28461993b, // 0xf9,
        hash_52b4d13e62f857e5, // 0xfa,
        hash_52f5a81d5f96353f, // 0xfb,
        destroy_qrdrone, // 0xfc,
        hash_54faafb480f79981, // 0xfd,
        career_score_hc, // 0xfe,
        hash_55fec19a7934aaad, // 0xff,
        destroy_equipment_with_emp_grenade, // 0x100,
        hash_566873251fdce0c1, // 0x101,
        deaths, // 0x102,
        lastxp, // 0x103,
        challenges, // 0x104,
        hash_57f78bc1a13bd0de, // 0x105,
        medal_kill_enemy_one_bullet, // 0x106,
        medal_killstreak_more_than_30, // 0x107,
        hash_5944fa5ab0189744, // 0x108,
        medal_kill_enemy_when_injured, // 0x109,
        hash_5a716221adc293be, // 0x10a,
        destroy_5_tactical_inserts, // 0x10b,
        maxxp, // 0x10c,
        hash_5afc248bef0531a3, // 0x10d,
        hash_5afdb3c40e9b3c4d, // 0x10e,
        medal_kill_confirmed_multi, // 0x10f,
        assist_score_uav, // 0x110,
        hash_5be3ebfe3f3384cc, // 0x111,
        total_shots, // 0x112,
        hash_5c5cab0cce302a01, // 0x113,
        hash_5cd23704d9c298c1, // 0x114,
        perk_longersprint, // 0x115,
        hash_5d409c26ab2b77d5, // 0x116,
        destroy_aircraft, // 0x117,
        hash_5eed179b63d40718, // 0x118,
        hash_5ff2a0c4a2a3d4a0, // 0x119,
        badhostcount, // 0x11a,
        kill_15_with_blade, // 0x11b,
        kill_shocked_enemy, // 0x11c,
        time_played_other, // 0x11d,
        hash_611f84a4a10d3e3e, // 0x11e,
        hash_620ca70cc9416098, // 0x11f,
        hash_621283451861c9e1, // 0x120,
        hash_63420e05d8642fcd, // 0x121,
        hash_63599ac17b01c38b, // 0x122,
        multikill_3_lmg_or_smg_hip_fire, // 0x123,
        hash_640adebcbd63d90f, // 0x124,
        hash_64c0bac013acc9f6, // 0x125,
        hash_64fdb6c907a131c5, // 0x126,
        hash_657cf19d17d5b366, // 0x127,
        last_escrow, // 0x128,
        medal_first_kill, // 0x129,
        hash_65f463ce38d57812, // 0x12a,
        field_specialist, // 0x12b,
        hash_6639a2d5dd155965, // 0x12c,
        hash_668c1bd08c419f31, // 0x12d,
        wins_hc, // 0x12e,
        perk_loudenemies_kills, // 0x12f,
        multikill_3_remote_missile, // 0x130,
        multikill_3_near_death, // 0x131,
        medal_assisted_suicide, // 0x132,
        gems, // 0x133,
        stats_version, // 0x134,
        destroy_aircraft_with_missile_drone, // 0x135,
        plants, // 0x136,
        secondary_mastery, // 0x137,
        perk_immune_cuav_kills, // 0x138,
        hash_69b5c8e5faf24cdf, // 0x139,
        hash_69df2755783ea5b9, // 0x13a,
        hash_6a237bc096133b0a, // 0x13b,
        hash_6a4804b6ccfa8228, // 0x13c,
        incaps, // 0x13d,
        activate_cuav_while_enemy_satelite_active, // 0x13e,
        assist_score_satellite, // 0x13f,
        hash_6ad99bdc72451712, // 0x140,
        hash_6b1f1900b1afff8b, // 0x141,
        hash_6b5388190c66aa86, // 0x142,
        medal_stop_enemy_killstreak, // 0x143,
        perk_movefaster_kills, // 0x144,
        medal_koth_secure, // 0x145,
        destroy_equipment, // 0x146,
        kill_enemy_while_prone, // 0x147,
        time_played_alive, // 0x148,
        hash_6cda7af101a7813b, // 0x149,
        rank, // 0x14a,
        hash_6df09ff7e0a31041, // 0x14b,
        hash_6df6b645014f20ba, // 0x14c,
        hash_6edacd218965f8bd, // 0x14d,
        hash_6f14dca5dad9d904, // 0x14e,
        hash_6f1b532646f903fd, // 0x14f,
        destroy_aircraft_with_emp, // 0x150,
        perk_nottargetedbyairsupport_destroy_aircraft, // 0x151,
        medal_kill_enemies_one_bullet, // 0x152,
        hits, // 0x153,
        hash_73d187ebf36663a3, // 0x154,
        call_in_3_care_packages, // 0x155,
        headshots, // 0x156,
        penetration_shots, // 0x157,
        multikill_3_with_mgl, // 0x158,
        medal_killstreak_15, // 0x159,
        medal_killstreak_10, // 0x15a,
        medal_killstreak_20, // 0x15b,
        medal_killstreak_25, // 0x15c,
        medal_killstreak_30, // 0x15d,
        hash_77728de853e5ac67, // 0x15e,
        hash_78245078b8f303d0, // 0x15f,
        gametypeban, // 0x160,
        accuracy, // 0x161,
        hash_794996196e74a949, // 0x162,
        score_multiteam, // 0x163,
        multikill_2_zone_attackers, // 0x164,
        defend_teammate_who_captured_package, // 0x165,
        hash_7a6ac3d3a3905c74, // 0x166,
        hash_7aa90c8abdf600e6, // 0x167,
        skulls, // 0x168,
        hash_7bf32e23f3be8ec6, // 0x169,
        kills, // 0x16a,
        medal_defused_bomb_last_man_alive, // 0x16b,
        perk_bulletflinch_kills, // 0x16c,
        offends, // 0x16d,
        hash_7d320079120592ee, // 0x16e,
        kill_enemy_through_wall_with_fmj, // 0x16f,
        assists, // 0x170,
        medal_headshot, // 0x171,
        hash_7ea091987cc17c99, // 0x172,
        hash_7edcc1ac6898f588, // 0x173,
        kill_enemy_one_bullet_shotgun, // 0x174,
        hash_7f2ed78b0d2848f2, // 0x175,
        medal_position_secure, // 0x176,
        hash_7fa27167eb8b2f65, // 0x177,
        hash_7fb734eea073a2c7, // 0x178,
        hash_7fc096557d0251c4, // 0x179
    };

    // idx 1 members 6
    enum hash_1cbddecc4f162d46 {
        kill_streak, // 0x0,
        highest_accuracy, // 0x1,
        highest_kdratio, // 0x2,
        win_streak, // 0x3,
        death_streak, // 0x4,
        highest_score, // 0x5
    };

    // idx 2 members 2
    enum hash_28f0e9c96e9d895d {
        hash_f08aa26fabae647, // 0x0,
        hash_5740a8698a4d0345, // 0x1
    };

    // idx 3 members 2
    enum hash_6fc913ce2d7e3a05 {
        publicmatch, // 0x0,
        leaguematch, // 0x1
    };

    // idx 4 members 5
    enum hash_5af4108cc28a7f2f {
        dashboard, // 0x0,
        quit, // 0x1,
        kicked, // 0x2,
        finished, // 0x3,
        timeout, // 0x4
    };

    // idx 5 members 12
    enum hash_6501ee9650acd12c {
        coop, // 0x0,
        hash_166b6fdf8bfc14b0, // 0x1,
        cpzm, // 0x2,
        hvt, // 0x3,
        download, // 0x4,
        doa, // 0x5,
        hash_4cb6801fbfb4feba, // 0x6,
        hash_59109354c237d415, // 0x7,
        hash_61b9f30e20aecc3a, // 0x8,
        hash_6dbe071fd1f51551, // 0x9,
        hash_73a25371d607ae0f, // 0xa,
        pvp, // 0xb
    };

    // idx 6 members 10
    enum hash_77d9cc12441881d5 {
        hash_118a6332af43d97c, // 0x0,
        hash_1868403ad767bcd5, // 0x1,
        hash_192de2ac4a272b77, // 0x2,
        hash_1d9ec2a919018090, // 0x3,
        hash_28514534e1fdc6b7, // 0x4,
        hash_2aea61f2cc17fd2b, // 0x5,
        hash_364f981808c6bfc9, // 0x6,
        hash_46386949c31ed6c7, // 0x7,
        hash_551c2ad25d755c39, // 0x8,
        hash_79103217c50277f4, // 0x9
    };

    // idx 7 members 6
    enum hash_10edf09b258e1986 {
        hash_252319e61320ad11, // 0x0,
        revives, // 0x1,
        score, // 0x2,
        incaps, // 0x3,
        kills, // 0x4,
        assists, // 0x5
    };

    // idx 8 members 19
    enum hash_1609003ae729fea3 {
        destroyed, // 0x0,
        combatrecordstat, // 0x1,
        backstabber_kill, // 0x2,
        deathsduringuse, // 0x3,
        deaths, // 0x4,
        challenge6, // 0x5,
        challenge4, // 0x6,
        challenge5, // 0x7,
        challenge2, // 0x8,
        challenge3, // 0x9,
        challenge1, // 0xa,
        challenges, // 0xb,
        timeused, // 0xc,
        hits, // 0xd,
        headshots, // 0xe,
        shots, // 0xf,
        kills, // 0x10,
        used, // 0x11,
        assists, // 0x12
    };

    // idx 9 members 21
    enum hash_5075e11eecf4d03d {
        weapon_flamethrower, // 0x0,
        specialty, // 0x1,
        bonuscard, // 0x2,
        weapon_explosive, // 0x3,
        weapon_special, // 0x4,
        weapon_masterkey, // 0x5,
        miscweapon, // 0x6,
        weapon_pistol, // 0x7,
        killstreak, // 0x8,
        weapon_sniper, // 0x9,
        specialgrenade, // 0xa,
        weapon_grenadelauncher, // 0xb,
        weapon_launcher, // 0xc,
        weapon_grenade, // 0xd,
        hash_5352e5bf9311b021, // 0xe,
        weapon_shotgun, // 0xf,
        weapon_lmg, // 0x10,
        weapon_tactical, // 0x11,
        weapon_smg, // 0x12,
        weapon_cqb, // 0x13,
        weapon_assault, // 0x14
    };

    // idx 10 members 56
    enum hash_12cd35aeeec0ae2d {
        speedreloader, // 0x0,
        dynzoom, // 0x1,
        quickdraw, // 0x2,
        acog, // 0x3,
        pistolscope, // 0x4,
        mms, // 0x5,
        dw, // 0x6,
        gl, // 0x7,
        mk, // 0x8,
        ir, // 0x9,
        is, // 0xa,
        sf, // 0xb,
        rf, // 0xc,
        fastreload, // 0xd,
        extbarrel, // 0xe,
        rangefinder, // 0xf,
        steadyaim, // 0x10,
        stalker, // 0x11,
        barrelchoke, // 0x12,
        hipgrip, // 0x13,
        vzoom, // 0x14,
        supply, // 0x15,
        stalker2, // 0x16,
        extclip2, // 0x17,
        steadyaim2, // 0x18,
        tacknife, // 0x19,
        mixclip, // 0x1a,
        stackfire, // 0x1b,
        killcounter, // 0x1c,
        clantag, // 0x1d,
        damage2, // 0x1e,
        swayreduc, // 0x1f,
        extbarrel2, // 0x20,
        reddot, // 0x21,
        extclip, // 0x22,
        holo, // 0x23,
        elo, // 0x24,
        fastreload2, // 0x25,
        extrapellets, // 0x26,
        holdbreath, // 0x27,
        fmj2, // 0x28,
        quickdraw2, // 0x29,
        fmj, // 0x2a,
        adsreload, // 0x2b,
        suppressed, // 0x2c,
        grip2, // 0x2d,
        custom4, // 0x2e,
        custom5, // 0x2f,
        custom2, // 0x30,
        custom3, // 0x31,
        custom1, // 0x32,
        dualoptic, // 0x33,
        grip, // 0x34,
        reflex, // 0x35,
        uber, // 0x36,
        damage, // 0x37
    };

    // idx 11 members 8
    enum hash_4a2552dbed57509c {
        destroyed, // 0x0,
        backstabber_kill, // 0x1,
        deathsduringuse, // 0x2,
        deaths, // 0x3,
        hits, // 0x4,
        headshots, // 0x5,
        shots, // 0x6,
        kills, // 0x7
    };

    // idx 12 members 14
    enum hash_118b444c3f1477bc {
        yellow, // 0x0,
        red, // 0x1,
        move, // 0x2,
        green, // 0x3,
        left, // 0x4,
        hash_27d748f975c1cca2, // 0x5,
        hash_3abd10cd4bee218d, // 0x6,
        hash_3b1a3eb9e4c6e529, // 0x7,
        blue, // 0x8,
        cycle, // 0x9,
        hash_6c90e772edbc8708, // 0xa,
        cyan, // 0xb,
        hash_71874fda6a03b630, // 0xc,
        right, // 0xd
    };

    // idx 13 members 4
    enum prestigetokentype_e {
        hash_b48a752eef7af35, // 0x0,
        prestige_extra_cac, // 0x1,
        prestige_respec, // 0x2,
        prestige_reset_stats, // 0x3
    };

    // idx 14 members 10
    enum bunkcollectibleslots_e {
        bunk_collectible_medium_1, // 0x0,
        hash_1f95ed7440770262, // 0x1,
        bunk_collectible_medium_2, // 0x2,
        bunk_collectible_large_1, // 0x3,
        bunk_collectible_small_3, // 0x4,
        bunk_collectible_small_2, // 0x5,
        bunk_collectible_small_1, // 0x6,
        bunk_collectible_small_6, // 0x7,
        bunk_collectible_small_5, // 0x8,
        bunk_collectible_small_4, // 0x9
    };

    // idx 15 members 5
    enum hash_8fa49f7da0821e {
        hash_d6a8a92ed62461c, // 0x0,
        hash_211897601e420060, // 0x1,
        hash_3be7fbbad14a09aa, // 0x2,
        face, // 0x3,
        eyes, // 0x4
    };

    // idx 0 members 67 size 0x893c0
    // offset 0x0, size 0xa0
    dlc_t dlc;
    // offset 0xa0, size 0x20
    int unlocktokencount_weapon;
    // offset 0xc0, size 0x20
    uint hash_3ec47111a3993e52;
    // offset 0xe0, size 0x8
    uint:4 lastconsolesave;
    // offset 0xe8, size 0xc80
    hash_6962b6aa0c4853f4 facialfeatureproperties[hash_8fa49f7da0821e];
    // offset 0xd68, size 0x8
    uint:5 selectedcustomclass;
    // offset 0xd70, size 0x140
    hash_5ef0b8418736fce5 recentearnings[10];
    // offset 0xeb0, size 0x20
    uint hashlen;
    // offset 0xed0, size 0x40
    uint64 hash_37aeca4d39214e62;
    // offset 0xf10, size 0x3050
    hash_503eb0de8f9cf7c2 gamehistory[hash_6fc913ce2d7e3a05];
    // offset 0x3f60, size 0xc940
    hash_67b00e3091cde2fd attachments[hash_12cd35aeeec0ae2d];
    // offset 0x108a0, size 0x90
    uint:24 higheststats[hash_1cbddecc4f162d46];
    // offset 0x10930, size 0x13240
    hash_1608f63ae729eda5 weaponstats[200];
    // offset 0x23b70, size 0x320
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    // offset 0x23e90, size 0x20
    int combattrainingwins;
    // offset 0x23eb0, size 0x200
    uint:4 currentweaponlevels[64];
    // offset 0x240b0, size 0x40
    uint64 connectionid;
    // offset 0x240f0, size 0x1e0
    hash_722a4055916df1ff hash_7dd9f1ac62a346d;
    // offset 0x242d0, size 0x20
    int motdversionviewed;
    // offset 0x242f0, size 0xfb00
    hash_ca5eede65d9c59e variantstats[251];
    // offset 0x33df0, size 0x8
    uint:4 currenthitlocationindex;
    // offset 0x33df8, size 0x20
    uint hash_6dcaad4976588a44;
    // offset 0x33e18, size 0xc30
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    // offset 0x34a48, size 0x190
    byte hash_5988aeaa53d6e90c[50];
    // offset 0x34bd8, size 0x260
    uint hash_3de5a4846f45ad78[19];
    // offset 0x34e38, size 0x4970
    hash_2e0567490210dd82 playerstatsbymap[hash_77d9cc12441881d5];
    // offset 0x397a8, size 0x1180
    hash_4976dab983b23e8c consoleinfo[10];
    // offset 0x3a928, size 0xd20
    hash_78a2c506849f9dda bunkcollectibles;
    // offset 0x3b648, size 0x40
    uint64 hash_188ecc3aca50f93d;
    // offset 0x3b688, size 0x40
    uint achievements[hash_28f0e9c96e9d895d];
    // offset 0x3b6c8, size 0x49e0
    hash_2e1d3d3bb036d22c playerstatsbygametype[hash_6501ee9650acd12c];
    // offset 0x400a8, size 0x100
    byte demonwareflags[32];
    // offset 0x401a8, size 0x8
    uint:5 companion;
    // offset 0x401b0, size 0x20
    float skill_rating;
    // offset 0x401d0, size 0x20
    int unlocktokencount_attachment;
    // offset 0x401f0, size 0x20
    uint hash_3313a30250a39ec5;
    // offset 0x40210, size 0x180
    float hash_2363e7e74077b1c0[hash_6501ee9650acd12c];
    // offset 0x40390, size 0x20
    uint uploadbandwidth;
    // offset 0x403b0, size 0x140
    hash_4f6f299a12577aa4 prestigetokens[20];
    // offset 0x404f0, size 0xc0
    hash_4bb25d7ad41fb449 probation[hash_6fc913ce2d7e3a05];
    // offset 0x405b0, size 0x20
    int motdviewtime;
    // offset 0x405d0, size 0x8
    uint:3 faction;
    // offset 0x405d8, size 0x90
    hash_5cb2d75a230a501f trainingsimstats;
    // offset 0x40668, size 0x4ad0
    hash_6ef8b9b7a8fd75e1 groupstats[hash_5075e11eecf4d03d];
    // offset 0x45138, size 0x8
    uint:4 hash_191fbfb9e1a3acf3;
    // offset 0x45140, size 0x20
    float hash_54a74aa3d5f3346d;
    // offset 0x45160, size 0x46e0
    hash_6b3db80d498eb06 playerstatslist[hash_44d262eb4cb5ed61];
    // offset 0x49840, size 0xa0
    hash_402baff65ae9b838 clantagstats;
    // offset 0x498e0, size 0x20
    float skill_variance;
    // offset 0x49900, size 0x180
    float hash_3a7324ad328f0e2e[hash_6501ee9650acd12c];
    // offset 0x49a80, size 0x22e8
    hash_6b411bb770fc8f6c afteractionreportstats;
    // offset 0x4bd68, size 0x100
    byte unlocks[32];
    // offset 0x4be68, size 0x40
    uint64 playerxuid;
    // offset 0x4bea8, size 0x3418
    hash_790a163d0959fa18 emblemstats;
    // offset 0x4f2c0, size 0x3a000
    hash_48cae9b9fcff7a5e itemstats[256];
    // offset 0x892c0, size 0x20
    uint highestmapreached;
    // offset 0x892e0, size 0x1
    bool hash_3ceb201776787882;
    // offset 0x892e1, size 0x1
    hash_7690a9df20146d8a zmcampaigndata;
    // offset 0x892e2, size 0x20
    bool musicunlocks[32];
    // offset 0x89302, size 0x40
    bool hash_1576a2fd30a2dfb0[64];
    // offset 0x89342, size 0x1
    bool hash_46e7db8ceaba5b2f;
    // offset 0x89343, size 0x14
    bool hash_711b1260308620e7[20];
    // offset 0x89357, size 0x14
    bool playercpdecorations[20];
    // offset 0x8936b, size 0x1
    bool hash_8cbe2e4ecb4fc43;
    // offset 0x8936c, size 0x1
    bool completedfirsttimeflow;
    // offset 0x8936d, size 0x4d
    bool completedchallengeseen[77];
    // offset 0x893ba, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/cp_stats.ddl
// metatable "hash_15439fd61ac36bd8"

version 16 {
    // idx 1 members 2 size 0x30
    struct hash_6b3db80d498eb06 {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
    };

    // idx 2 members 3 size 0x20
    struct hash_5ef0b8418736fce5 {
        // offset 0x0, size 0x18
        uint:24 score;
        // offset 0x18, size 0x1
        bool valid;
        // offset 0x19, size 0x7
        uint:1 __pad[7];
    };

    // idx 3 members 4 size 0x138
    struct hash_3b0f9e0921513e2c {
        // offset 0x0, size 0x98
        byte hitlocations[19];
        // offset 0x98, size 0x98
        byte criticalhitlocations[19];
        // offset 0x130, size 0x1
        bool valid;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 4 members 6 size 0x50
    struct hash_1a52129598e71dab {
        // offset 0x0, size 0x10
        short kills;
        // offset 0x10, size 0x18
        uint:24 score;
        // offset 0x28, size 0x10
        short gametype;
        // offset 0x38, size 0x10
        short deaths;
        // offset 0x48, size 0x1
        bool valid;
        // offset 0x49, size 0x7
        uint:1 __pad[7];
    };

    // idx 5 members 14 size 0x2e8
    struct hash_656bfcb3838e2907 {
        // offset 0x0, size 0x100
        string(32) name;
        // offset 0x100, size 0x100
        string(32) xuid;
        // offset 0x200, size 0x20
        uint curxp;
        // offset 0x220, size 0x10
        short kills;
        // offset 0x230, size 0x20
        uint prvxp;
        // offset 0x250, size 0x10
        short score;
        // offset 0x260, size 0x10
        short revives;
        // offset 0x270, size 0x10
        short currank;
        // offset 0x280, size 0x10
        short deaths;
        // offset 0x290, size 0x30
        short medals[3];
        // offset 0x2c0, size 0x10
        short assists;
        // offset 0x2d0, size 0x10
        short hash_59ef59765ff3f049;
        // offset 0x2e0, size 0x1
        bool isactive;
        // offset 0x2e1, size 0x7
        uint:1 __pad[7];
    };

    // idx 6 members 6 size 0x22e8
    struct hash_6b411bb770fc8f6c {
        // offset 0x0, size 0x22e0
        hash_656bfcb3838e2907 playerstats[12];
        // offset 0x22e0, size 0x1
        bool valid;
        // offset 0x22e1, size 0x1
        bool matchwon;
        // offset 0x22e2, size 0x1
        bool privatematch;
        // offset 0x22e3, size 0x1
        bool viewed;
        // offset 0x22e4, size 0x4
        uint:1 __pad[4];
    };

    // idx 7 members 1 size 0x1
    struct hash_7690a9df20146d8a {
        // offset 0x0, size 0x1
        bool unlocked;
    };

    // idx 8 members 6 size 0x90
    struct hash_2f60329a207db2b8 {
        // offset 0x0, size 0x18
        uint:24 quit;
        // offset 0x18, size 0x18
        uint:24 started;
        // offset 0x30, size 0x18
        uint:24 completed;
        // offset 0x48, size 0x18
        uint:24 timeout;
        // offset 0x60, size 0x18
        uint:24 kicked;
        // offset 0x78, size 0x18
        uint:24 dashboard;
    };

    // idx 9 members 2 size 0x120
    struct hash_b5aec1419b9a02d {
        // offset 0x0, size 0x90
        hash_2f60329a207db2b8 hosted;
        // offset 0x90, size 0x90
        hash_2f60329a207db2b8 played;
    };

    // idx 10 members 11 size 0xb8
    struct hash_5fafb39a86bc6dc7 {
        // offset 0x0, size 0x10
        short kills;
        // offset 0x10, size 0x18
        uint:24 score;
        // offset 0x28, size 0x20
        uint startingtime;
        // offset 0x48, size 0x20
        uint endingtime;
        // offset 0x68, size 0x8
        uint:5 scoreboardposition;
        // offset 0x70, size 0x20
        float teamscoreratio;
        // offset 0x90, size 0x8
        uint:5 gametype;
        // offset 0x98, size 0x10
        short deaths;
        // offset 0xa8, size 0x8
        uint:3 quittype;
        // offset 0xb0, size 0x1
        bool forgiven;
        // offset 0xb1, size 0x7
        uint:1 __pad[7];
    };

    // idx 11 members 3 size 0x1828
    struct hash_503eb0de8f9cf7c2 {
        // offset 0x0, size 0x1700
        hash_5fafb39a86bc6dc7 matchhistory[32];
        // offset 0x1700, size 0x120
        hash_b5aec1419b9a02d modehistory;
        // offset 0x1820, size 0x8
        byte currentmatchhistoryindex;
    };

    // idx 12 members 3 size 0x60
    struct hash_4bb25d7ad41fb449 {
        // offset 0x0, size 0x20
        uint count;
        // offset 0x20, size 0x20
        uint version;
        // offset 0x40, size 0x20
        uint timewhenprobationisdone;
    };

    // idx 13 members 28 size 0x628
    struct hash_2e1d3d3bb036d22c {
        // offset 0x0, size 0x30
        hash_6b3db80d498eb06 ties;
        // offset 0x30, size 0x30
        hash_6b3db80d498eb06 wins;
        // offset 0x60, size 0x30
        hash_6b3db80d498eb06 assists;
        // offset 0x90, size 0x30
        hash_6b3db80d498eb06 crush;
        // offset 0xc0, size 0x30
        hash_6b3db80d498eb06 kills;
        // offset 0xf0, size 0x30
        hash_6b3db80d498eb06 score;
        // offset 0x120, size 0x30
        hash_6b3db80d498eb06 time_played_total;
        // offset 0x150, size 0x30
        hash_6b3db80d498eb06 challenge1;
        // offset 0x180, size 0x30
        hash_6b3db80d498eb06 challenge2;
        // offset 0x1b0, size 0x30
        hash_6b3db80d498eb06 challenge3;
        // offset 0x1e0, size 0x30
        hash_6b3db80d498eb06 challenge4;
        // offset 0x210, size 0x30
        hash_6b3db80d498eb06 challenge5;
        // offset 0x240, size 0x30
        hash_6b3db80d498eb06 challenge6;
        // offset 0x270, size 0x30
        hash_6b3db80d498eb06 challenge7;
        // offset 0x2a0, size 0x30
        hash_6b3db80d498eb06 challenge8;
        // offset 0x2d0, size 0x30
        hash_6b3db80d498eb06 challenge9;
        // offset 0x300, size 0x30
        hash_6b3db80d498eb06 win_streak;
        // offset 0x330, size 0x30
        hash_6b3db80d498eb06 cur_win_streak;
        // offset 0x360, size 0x30
        hash_6b3db80d498eb06 kill_streak;
        // offset 0x390, size 0x30
        hash_6b3db80d498eb06 deaths;
        // offset 0x3c0, size 0x30
        hash_6b3db80d498eb06 wlratio;
        // offset 0x3f0, size 0x8
        int:5 prevscoreindex;
        // offset 0x3f8, size 0x30
        hash_6b3db80d498eb06 losses;
        // offset 0x428, size 0x30
        hash_6b3db80d498eb06 defends;
        // offset 0x458, size 0x30
        hash_6b3db80d498eb06 offends;
        // offset 0x488, size 0x30
        hash_6b3db80d498eb06 challenge10;
        // offset 0x4b8, size 0x140
        hash_5ef0b8418736fce5 prevscores[10];
        // offset 0x5f8, size 0x30
        hash_6b3db80d498eb06 kdratio;
    };

    // idx 14 members 3 size 0x48
    struct hash_63565a3d40f66255 {
        // offset 0x0, size 0x8
        uint:2 state;
        // offset 0x8, size 0x20
        uint value;
        // offset 0x28, size 0x20
        uint highestvalue;
    };

    // idx 15 members 17 size 0x758
    struct hash_2e0567490210dd82 {
        // offset 0x0, size 0x8
        uint:3 hash_bf847c54dac3b;
        // offset 0x8, size 0xc0
        uint higheststats[hash_10edf09b258e1986];
        // offset 0xc8, size 0xc0
        uint currentstats[hash_10edf09b258e1986];
        // offset 0x188, size 0x20
        uint hash_7787ac0184215bc1;
        // offset 0x1a8, size 0x558
        hash_63565a3d40f66255 accolades[19];
        // offset 0x700, size 0x20
        uint hash_3cd96ca92c6f0d4c;
        // offset 0x720, size 0x10
        short hash_1cc8d841efacb52a;
        // offset 0x730, size 0x6
        bool hash_1e0160af4fd80dff[6];
        // offset 0x736, size 0x6
        bool hash_518113a79b08988[6];
        // offset 0x73c, size 0x1
        bool allcollectiblescollected;
        // offset 0x73d, size 0x1
        bool checkpointused;
        // offset 0x73e, size 0xa
        bool collectibles[10];
        // offset 0x748, size 0x1
        bool hash_71b609b078e360c0;
        // offset 0x749, size 0x6
        bool hash_657891d65d881524[6];
        // offset 0x74f, size 0x1
        bool hasbeencompleted;
        // offset 0x750, size 0x6
        bool hash_233621878f97486b[6];
        // offset 0x756, size 0x2
        uint:1 __pad[2];
    };

    // idx 16 members 7 size 0x90
    struct hash_5cb2d75a230a501f {
        // offset 0x0, size 0x8
        uint:5 highestround;
        // offset 0x8, size 0x20
        uint highestscore;
        // offset 0x28, size 0x20
        uint hash_1b146f5d12b2b147;
        // offset 0x48, size 0x20
        uint hash_25ce643c6cf6507e;
        // offset 0x68, size 0x20
        uint hash_52dbe660cac88df9;
        // offset 0x88, size 0x4
        bool ranksachieved[4];
        // offset 0x8c, size 0x4
        uint:1 __pad[4];
    };

    // idx 17 members 15 size 0x1e0
    struct hash_722a4055916df1ff {
        // offset 0x0, size 0x20
        uint hash_2b12202dea292a78;
        // offset 0x20, size 0x20
        uint hash_65157f3e7aec5b46;
        // offset 0x40, size 0x20
        uint hash_256e550d360e7cf6;
        // offset 0x60, size 0x20
        uint hash_34212151b945069b;
        // offset 0x80, size 0x20
        uint numplayers;
        // offset 0xa0, size 0x20
        uint hash_477109e1674d778e;
        // offset 0xc0, size 0x20
        uint hash_6f7512e92e96a86a;
        // offset 0xe0, size 0x20
        uint hash_52086efefda6cd87;
        // offset 0x100, size 0x20
        uint hash_4c59bf00eb8047c0;
        // offset 0x120, size 0x20
        uint hash_4cda3bb269028c08;
        // offset 0x140, size 0x20
        uint hash_c159a616c8e909f;
        // offset 0x160, size 0x20
        uint hash_1b75e7812ae582a0;
        // offset 0x180, size 0x20
        uint hash_6e3edce84270ac4c;
        // offset 0x1a0, size 0x20
        uint hash_3ed0ae0744c78900;
        // offset 0x1c0, size 0x20
        uint hash_24bfa4caccae7ccc;
    };

    // idx 18 members 1 size 0x390
    struct hash_6ef8b9b7a8fd75e1 {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
    };

    // idx 19 members 5 size 0x3a0
    struct hash_48cae9b9fcff7a5e {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
        // offset 0x390, size 0x8
        bool hash_798921f18e351b13[8];
        // offset 0x398, size 0x1
        bool purchased;
        // offset 0x399, size 0x1
        bool markedold;
        // offset 0x39a, size 0x6
        uint:1 __pad[6];
    };

    // idx 20 members 2 size 0x398
    struct hash_67b00e3091cde2fd {
        // offset 0x0, size 0x390
        hash_6b3db80d498eb06 stats[hash_1609003ae729fea3];
        // offset 0x390, size 0x8
        bool hash_798921f18e351b13[8];
    };

    // idx 21 members 5 size 0x190
    struct hash_1608f63ae729eda5 {
        // offset 0x0, size 0x18
        uint:24 xp;
        // offset 0x18, size 0x8
        uint:2 plevel;
        // offset 0x20, size 0x40
        bool attachmentmarkedold[hash_12cd35aeeec0ae2d];
        // offset 0x60, size 0x12c
        bool optionmarkedasold[300];
        // offset 0x18c, size 0x4
        uint:1 __pad[4];
    };

    // idx 22 members 1 size 0x100
    struct hash_ca5eede65d9c59e {
        // offset 0x0, size 0x100
        uint stats[hash_4a2552dbed57509c];
    };

    // idx 23 members 4 size 0x8
    struct hash_18562676c03c7954 {
        // offset 0x0, size 0x1
        bool purchased;
        // offset 0x1, size 0x1
        bool markedold;
        // offset 0x2, size 0x1
        bool unlocked;
        // offset 0x3, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 1 size 0x1
    struct hash_2d74f509e9d33a86 {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 25 members 5 size 0x3418
    struct hash_790a163d0959fa18 {
        // offset 0x0, size 0x2000
        hash_18562676c03c7954 icons[1024];
        // offset 0x2000, size 0x8
        uint:4 layerspurchased;
        // offset 0x2008, size 0x1400
        hash_18562676c03c7954 backgrounds[640];
        // offset 0x3408, size 0xc
        hash_2d74f509e9d33a86 layers[12];
        // offset 0x3414, size 0x4
        uint:1 __pad[4];
    };

    // idx 26 members 3 size 0x8
    struct hash_118b324c3f145926 {
        // offset 0x0, size 0x1
        bool purchased;
        // offset 0x1, size 0x1
        bool markedold;
        // offset 0x2, size 0x6
        uint:1 __pad[6];
    };

    // idx 27 members 3 size 0xa0
    struct hash_402baff65ae9b838 {
        // offset 0x0, size 0x28
        string(5) clanname;
        // offset 0x28, size 0x8
        byte selectedfeature;
        // offset 0x30, size 0x70
        hash_118b324c3f145926 features[hash_118b444c3f1477bc];
    };

    // idx 28 members 4 size 0x20
    struct hash_25a11738b4152d0e {
        // offset 0x0, size 0x8
        byte a;
        // offset 0x8, size 0x8
        byte b;
        // offset 0x10, size 0x8
        byte c;
        // offset 0x18, size 0x8
        byte d;
    };

    // idx 29 members 6 size 0x1c0
    struct hash_4976dab983b23e8c {
        // offset 0x0, size 0x20
        uint timestamp;
        // offset 0x20, size 0x20
        uint nattype;
        // offset 0x40, size 0x40
        uint64 macaddress;
        // offset 0x80, size 0x100
        string(32) consoleid64;
        // offset 0x180, size 0x20
        hash_25a11738b4152d0e ipexternal;
        // offset 0x1a0, size 0x20
        uint usecount;
    };

    // idx 30 members 4 size 0x10
    struct hash_4f6f299a12577aa4 {
        // offset 0x0, size 0x8
        byte itemunlocked;
        // offset 0x8, size 0x1
        bool tokenspent;
        // offset 0x9, size 0x4
        bool tokentype[prestigetokentype_e];
        // offset 0xd, size 0x3
        uint:1 __pad[3];
    };

    // idx 31 members 2 size 0xa0
    struct dlc_t {
        // offset 0x0, size 0x20
        uint mappacks;
        // offset 0x20, size 0x80
        bool mtx[128];
    };

    // idx 32 members 4 size 0x150
    struct hash_2efa05c484e77181 {
        // offset 0x0, size 0x140
        string(40) mapname;
        // offset 0x140, size 0x8
        uint:4 collectibleindex;
        // offset 0x148, size 0x1
        bool set;
        // offset 0x149, size 0x7
        uint:1 __pad[7];
    };

    // idx 33 members 1 size 0xd20
    struct hash_78a2c506849f9dda {
        // offset 0x0, size 0xd20
        hash_2efa05c484e77181 collectibles[bunkcollectibleslots_e];
    };

    // idx 34 members 1 size 0x280
    struct hash_6962b6aa0c4853f4 {
        // offset 0x0, size 0x280
        float properties[20];
    };

    // idx 0 members 378
    enum hash_44d262eb4cb5ed61 {
        hash_bf36041b40b541, // 0x0,
        hash_103be234630de92, // 0x1,
        kill_with_cooked_grenade, // 0x2,
        minxp, // 0x3,
        misses, // 0x4,
        killsconfirmed, // 0x5,
        hash_21bfdd7a5c4f23c, // 0x6,
        destroy_car, // 0x7,
        medal_bomb_detonated, // 0x8,
        stun_aitank_with_emp_grenade, // 0x9,
        hash_359f05e4bb4fa57, // 0xa,
        films_shoutcasted, // 0xb,
        medal_flag_capture, // 0xc,
        hash_3bba76aa8987218, // 0xd,
        hash_3bef98f1093a802, // 0xe,
        time_played_total, // 0xf,
        hash_495a843c176b50c, // 0x10,
        hash_4b3d34b8f0e5b8f, // 0x11,
        perk_fastweaponswitch_kill_after_swap, // 0x12,
        mappackmask, // 0x13,
        kill_nemesis, // 0x14,
        hash_60f3f9adb22e924, // 0x15,
        hash_66b80bdb17c4a04, // 0x16,
        perk_protection_stun_kills, // 0x17,
        hash_7afff19891fb72e, // 0x18,
        hash_7dc6ebcd202e54f, // 0x19,
        perk_hacker_destroy, // 0x1a,
        hash_85ed95e3662c128, // 0x1b,
        rankxp, // 0x1c,
        hash_976be36aea95e59, // 0x1d,
        lifetime_buyin, // 0x1e,
        hash_9904e795162f703, // 0x1f,
        killsdenied, // 0x20,
        kill_flashed_enemy, // 0x21,
        hash_b38ac686f0e8f63, // 0x22,
        perk_quieter_kills, // 0x23,
        medal_flag_carrier_kill_return_close, // 0x24,
        sessionbans, // 0x25,
        hash_d31df6b18ade168, // 0x26,
        kdratio, // 0x27,
        hash_e2a2b7303f42341, // 0x28,
        returns, // 0x29,
        assist, // 0x2a,
        hash_fdad95a70f179d7, // 0x2b,
        hash_1023368faabde7bb, // 0x2c,
        currencyspent, // 0x2d,
        emblem_version, // 0x2e,
        cp_challenges, // 0x2f,
        highlights_created, // 0x30,
        medal_defused_bomb, // 0x31,
        hash_11d98f202734032b, // 0x32,
        hash_124fa750b68f0d7e, // 0x33,
        medal_completed_match, // 0x34,
        contracts_completed, // 0x35,
        hash_12d8d630663bb4ba, // 0x36,
        hash_13eb46cb3c4c5613, // 0x37,
        hash_13ece4de9e4e2180, // 0x38,
        hash_143a19a14a3654db, // 0x39,
        assist_score_killstreak, // 0x3a,
        get_final_kill, // 0x3b,
        hash_14e63336430e7e93, // 0x3c,
        hash_154b0a4b01b8b616, // 0x3d,
        hash_156adf3fdb4091b7, // 0x3e,
        assist_score_microwave_turret, // 0x3f,
        hash_1715d388ed114bcd, // 0x40,
        hash_171c599dfd8645fb, // 0x41,
        hash_174beaaa686374bd, // 0x42,
        kill_with_resupplied_lethal_grenade, // 0x43,
        medal_kill_enemy_who_killed_teammate, // 0x44,
        hash_180255bc92de9611, // 0x45,
        hash_18343d39cc8c1aee, // 0x46,
        medal_multikill_7, // 0x47,
        medal_multikill_6, // 0x48,
        medal_multikill_5, // 0x49,
        medal_multikill_4, // 0x4a,
        medal_multikill_3, // 0x4b,
        medal_multikill_2, // 0x4c,
        medal_multikill_8, // 0x4d,
        hash_1994a1e6fd4eac28, // 0x4e,
        hash_19b8cdc5c2c0aeaa, // 0x4f,
        suicides, // 0x50,
        timewhennexthost, // 0x51,
        hash_1b0d87a2f1c0272a, // 0x52,
        hash_1b148631540ae995, // 0x53,
        hash_1b2898c0a3f4e7c1, // 0x54,
        hash_1b5a22bbb1c029a2, // 0x55,
        hash_1bb99705ba9a0e6c, // 0x56,
        hash_1bc0e2d787ec3594, // 0x57,
        hash_1be36c00d02a3702, // 0x58,
        hash_1be3ce237f8e1363, // 0x59,
        hash_1cafb2c429e2e97f, // 0x5a,
        streaker, // 0x5b,
        captures, // 0x5c,
        leaderboardfailures, // 0x5d,
        hash_1e2dfda54cd5e4c9, // 0x5e,
        ties, // 0x5f,
        hash_1ebf7dbc9624adec, // 0x60,
        hash_1edccd77f0b71ac2, // 0x61,
        medal_clear_2_attackers, // 0x62,
        capture_objective_in_smoke, // 0x63,
        medal_kill_enemy_while_capping, // 0x64,
        hash_20179a04c1573a20, // 0x65,
        career_score_multiteam, // 0x66,
        cur_win_streak, // 0x67,
        hash_20ce01ed472f2cfa, // 0x68,
        hash_215f2670384d5d7b, // 0x69,
        medal_multikill_more_than_8, // 0x6a,
        destroyed_helicopter_with_bullet, // 0x6b,
        hash_24c25fad1ac01302, // 0x6c,
        killstreak_10_no_weapons_perks, // 0x6d,
        wins, // 0x6e,
        hash_2686fe80d2524e8b, // 0x6f,
        hash_26cbd2aa4d6b9947, // 0x70,
        hash_26d6f92287f0a1e8, // 0x71,
        hash_26e0be3755c42495, // 0x72,
        defuses, // 0x73,
        hash_275f021a92a63aee, // 0x74,
        medal_quickly_secure_point, // 0x75,
        hash_281d1546e5e55ca2, // 0x76,
        longshot_3_onelife, // 0x77,
        hash_2864c17bca6e0048, // 0x78,
        hash_28db499720aedb6e, // 0x79,
        perk_scavenger_kills_after_resupply, // 0x7a,
        hash_2934211bcdcc9e9f, // 0x7b,
        hash_29361ee6a3ecd300, // 0x7c,
        wins_multiteam, // 0x7d,
        medal_longshot_kill, // 0x7e,
        codpoints, // 0x7f,
        hash_2a708c95aef05cb5, // 0x80,
        career_mastery, // 0x81,
        kill_while_damaging_with_microwave_turret, // 0x82,
        destroyed_qrdrone_with_bullet, // 0x83,
        score_hc, // 0x84,
        revives, // 0x85,
        hash_2b75a2161643473b, // 0x86,
        hash_2b75aabcf73dc800, // 0x87,
        medal_killstreak_5, // 0x88,
        hash_2bc315db95982551, // 0x89,
        hash_2bc5c849844383ea, // 0x8a,
        hack_enemy_target, // 0x8b,
        hash_2c5ae152d1f6928b, // 0x8c,
        hash_2d27ed7c35d831b4, // 0x8d,
        medal_kill_enemy_with_their_weapon, // 0x8e,
        medal_kill_flag_carrier, // 0x8f,
        hash_2e5c1654a4fc1b1c, // 0x90,
        career_score, // 0x91,
        laststatsbackup, // 0x92,
        hash_2f9649f2756709d6, // 0x93,
        pickups, // 0x94,
        hash_30298932ae26bbda, // 0x95,
        medal_killed_enemy_while_carrying_flag, // 0x96,
        killed_dog_close_to_teammate, // 0x97,
        hash_308b22e7c87a0709, // 0x98,
        medal_revenge_kill, // 0x99,
        hash_30e4e2bca0a739f1, // 0x9a,
        statresetcount, // 0x9b,
        plevel, // 0x9c,
        hash_32227db686e80e47, // 0x9d,
        perk_noname_kills, // 0x9e,
        kill_enemy_one_bullet_sniper, // 0x9f,
        hash_3349efb239eee96f, // 0xa0,
        medal_kill_enemy_after_death, // 0xa1,
        hash_34783bf7a1179064, // 0xa2,
        match_bonus, // 0xa3,
        medal_backstabber_kill, // 0xa4,
        hash_349aad0f6083abf5, // 0xa5,
        hash_34d9af35f8b02185, // 0xa6,
        hash_34e0fb49ecfca3e4, // 0xa7,
        lifetime_earnings, // 0xa8,
        hash_3553f8161e7781d7, // 0xa9,
        hash_361c89bc5aadcdac, // 0xaa,
        hash_362683bc5ab617ff, // 0xab,
        destroy_turret, // 0xac,
        hash_37e875290614f1e1, // 0xad,
        medal_killed_bomb_planter, // 0xae,
        medal_uninterrupted_obit_feed_kills, // 0xaf,
        hash_39e43b41e43d1803, // 0xb0,
        medal_kill_enemy_with_care_package_crush, // 0xb1,
        medal_kill_enemy_with_hacked_care_package, // 0xb2,
        chickens, // 0xb3,
        version, // 0xb4,
        hash_3bbf88b211193c04, // 0xb5,
        perk_gpsjammer_immune_kills, // 0xb6,
        hash_3c299d0329cb332c, // 0xb7,
        hash_3c4542a7c82860e0, // 0xb8,
        assist_score_cuav, // 0xb9,
        medal_elimination_and_last_player_alive, // 0xba,
        hash_3dd99fa1b0d098d9, // 0xbb,
        hash_3e76cbc8ac01d9d7, // 0xbc,
        hash_3f1cf355fd388770, // 0xbd,
        kill_enemy_through_wall, // 0xbe,
        wlratio, // 0xbf,
        hash_405015b29793595f, // 0xc0,
        hash_40882db8b6a7f07c, // 0xc1,
        hash_40a19266327e603c, // 0xc2,
        teamkills_nostats, // 0xc3,
        score, // 0xc4,
        hash_416018859c2a61e0, // 0xc5,
        hash_417ca489457d2cf4, // 0xc6,
        hash_419d426a0886d25b, // 0xc7,
        medal_bounce_hatchet_kill, // 0xc8,
        hash_41ca7e5eeaa76eeb, // 0xc9,
        kill_every_enemy, // 0xca,
        medal_comeback_from_deathstreak, // 0xcb,
        hash_43261bbcab41f5ea, // 0xcc,
        hash_43bc196ae14ca147, // 0xcd,
        medal_neutral_b_secured, // 0xce,
        defends, // 0xcf,
        kill_enemy_while_crouched, // 0xd0,
        hash_4474df73df91d1a5, // 0xd1,
        statsbackupversion, // 0xd2,
        perk_fastmantle_kills, // 0xd3,
        hash_4563c8418dc6e528, // 0xd4,
        hash_465a039cdd937ec7, // 0xd5,
        hash_4667e99dc6606eae, // 0xd6,
        hash_470c0ed4799f236a, // 0xd7,
        disarm_hacked_carepackage, // 0xd8,
        medal_won_match, // 0xd9,
        hash_473fa810546b3693, // 0xda,
        destroy_explosive_with_trophy, // 0xdb,
        medal_retrieve_own_tags, // 0xdc,
        killstreak_5_picked_up_weapon, // 0xdd,
        hash_490052167ba0e80d, // 0xde,
        hash_4926ee717d694914, // 0xdf,
        long_distance_hatchet_kill, // 0xe0,
        medal_hatchet_kill, // 0xe1,
        hash_4a10990c96559d2f, // 0xe2,
        hash_4a1c48bcaeb7db8b, // 0xe3,
        teamkills, // 0xe4,
        destroy_helicopter, // 0xe5,
        hash_4b6eca29e69997c3, // 0xe6,
        contracts_purchased, // 0xe7,
        destroy_explosive, // 0xe8,
        hash_4cb5d718c79cca63, // 0xe9,
        hash_4e0b68c44638153e, // 0xea,
        hash_4e450148b31156f5, // 0xeb,
        assist_score_emp, // 0xec,
        hash_4ed745a0ed607a71, // 0xed,
        hash_4ee566b815c01f47, // 0xee,
        medal_killed_bomb_defuser, // 0xef,
        hash_4f4597af75828585, // 0xf0,
        hash_4fc11abc691b8a37, // 0xf1,
        hash_50253bf63c3f8b9d, // 0xf2,
        losses, // 0xf3,
        weapons_mastery, // 0xf4,
        medal_kill_enemy_injuring_teammate, // 0xf5,
        hash_51ab6bbcb2afbcf9, // 0xf6,
        hash_520cc126821992fd, // 0xf7,
        destructions, // 0xf8,
        hash_52abffb28461993b, // 0xf9,
        hash_52b4d13e62f857e5, // 0xfa,
        hash_52f5a81d5f96353f, // 0xfb,
        destroy_qrdrone, // 0xfc,
        hash_54faafb480f79981, // 0xfd,
        career_score_hc, // 0xfe,
        hash_55fec19a7934aaad, // 0xff,
        destroy_equipment_with_emp_grenade, // 0x100,
        hash_566873251fdce0c1, // 0x101,
        deaths, // 0x102,
        lastxp, // 0x103,
        challenges, // 0x104,
        hash_57f78bc1a13bd0de, // 0x105,
        medal_kill_enemy_one_bullet, // 0x106,
        medal_killstreak_more_than_30, // 0x107,
        hash_5944fa5ab0189744, // 0x108,
        medal_kill_enemy_when_injured, // 0x109,
        hash_5a716221adc293be, // 0x10a,
        destroy_5_tactical_inserts, // 0x10b,
        maxxp, // 0x10c,
        hash_5afc248bef0531a3, // 0x10d,
        hash_5afdb3c40e9b3c4d, // 0x10e,
        medal_kill_confirmed_multi, // 0x10f,
        assist_score_uav, // 0x110,
        hash_5be3ebfe3f3384cc, // 0x111,
        total_shots, // 0x112,
        hash_5c5cab0cce302a01, // 0x113,
        hash_5cd23704d9c298c1, // 0x114,
        perk_longersprint, // 0x115,
        hash_5d409c26ab2b77d5, // 0x116,
        destroy_aircraft, // 0x117,
        hash_5eed179b63d40718, // 0x118,
        hash_5ff2a0c4a2a3d4a0, // 0x119,
        badhostcount, // 0x11a,
        kill_15_with_blade, // 0x11b,
        kill_shocked_enemy, // 0x11c,
        time_played_other, // 0x11d,
        hash_611f84a4a10d3e3e, // 0x11e,
        hash_620ca70cc9416098, // 0x11f,
        hash_621283451861c9e1, // 0x120,
        hash_63420e05d8642fcd, // 0x121,
        hash_63599ac17b01c38b, // 0x122,
        multikill_3_lmg_or_smg_hip_fire, // 0x123,
        hash_640adebcbd63d90f, // 0x124,
        hash_64c0bac013acc9f6, // 0x125,
        hash_64fdb6c907a131c5, // 0x126,
        hash_657cf19d17d5b366, // 0x127,
        last_escrow, // 0x128,
        medal_first_kill, // 0x129,
        hash_65f463ce38d57812, // 0x12a,
        field_specialist, // 0x12b,
        hash_6639a2d5dd155965, // 0x12c,
        hash_668c1bd08c419f31, // 0x12d,
        wins_hc, // 0x12e,
        perk_loudenemies_kills, // 0x12f,
        multikill_3_remote_missile, // 0x130,
        multikill_3_near_death, // 0x131,
        medal_assisted_suicide, // 0x132,
        gems, // 0x133,
        stats_version, // 0x134,
        destroy_aircraft_with_missile_drone, // 0x135,
        plants, // 0x136,
        secondary_mastery, // 0x137,
        perk_immune_cuav_kills, // 0x138,
        hash_69b5c8e5faf24cdf, // 0x139,
        hash_69df2755783ea5b9, // 0x13a,
        hash_6a237bc096133b0a, // 0x13b,
        hash_6a4804b6ccfa8228, // 0x13c,
        incaps, // 0x13d,
        activate_cuav_while_enemy_satelite_active, // 0x13e,
        assist_score_satellite, // 0x13f,
        hash_6ad99bdc72451712, // 0x140,
        hash_6b1f1900b1afff8b, // 0x141,
        hash_6b5388190c66aa86, // 0x142,
        medal_stop_enemy_killstreak, // 0x143,
        perk_movefaster_kills, // 0x144,
        medal_koth_secure, // 0x145,
        destroy_equipment, // 0x146,
        kill_enemy_while_prone, // 0x147,
        time_played_alive, // 0x148,
        hash_6cda7af101a7813b, // 0x149,
        rank, // 0x14a,
        hash_6df09ff7e0a31041, // 0x14b,
        hash_6df6b645014f20ba, // 0x14c,
        hash_6edacd218965f8bd, // 0x14d,
        hash_6f14dca5dad9d904, // 0x14e,
        hash_6f1b532646f903fd, // 0x14f,
        destroy_aircraft_with_emp, // 0x150,
        perk_nottargetedbyairsupport_destroy_aircraft, // 0x151,
        medal_kill_enemies_one_bullet, // 0x152,
        hits, // 0x153,
        hash_73d187ebf36663a3, // 0x154,
        call_in_3_care_packages, // 0x155,
        headshots, // 0x156,
        penetration_shots, // 0x157,
        multikill_3_with_mgl, // 0x158,
        medal_killstreak_15, // 0x159,
        medal_killstreak_10, // 0x15a,
        medal_killstreak_20, // 0x15b,
        medal_killstreak_25, // 0x15c,
        medal_killstreak_30, // 0x15d,
        hash_77728de853e5ac67, // 0x15e,
        hash_78245078b8f303d0, // 0x15f,
        gametypeban, // 0x160,
        accuracy, // 0x161,
        hash_794996196e74a949, // 0x162,
        score_multiteam, // 0x163,
        multikill_2_zone_attackers, // 0x164,
        defend_teammate_who_captured_package, // 0x165,
        hash_7a6ac3d3a3905c74, // 0x166,
        hash_7aa90c8abdf600e6, // 0x167,
        skulls, // 0x168,
        hash_7bf32e23f3be8ec6, // 0x169,
        kills, // 0x16a,
        medal_defused_bomb_last_man_alive, // 0x16b,
        perk_bulletflinch_kills, // 0x16c,
        offends, // 0x16d,
        hash_7d320079120592ee, // 0x16e,
        kill_enemy_through_wall_with_fmj, // 0x16f,
        assists, // 0x170,
        medal_headshot, // 0x171,
        hash_7ea091987cc17c99, // 0x172,
        hash_7edcc1ac6898f588, // 0x173,
        kill_enemy_one_bullet_shotgun, // 0x174,
        hash_7f2ed78b0d2848f2, // 0x175,
        medal_position_secure, // 0x176,
        hash_7fa27167eb8b2f65, // 0x177,
        hash_7fb734eea073a2c7, // 0x178,
        hash_7fc096557d0251c4, // 0x179
    };

    // idx 1 members 6
    enum hash_1cbddecc4f162d46 {
        kill_streak, // 0x0,
        highest_accuracy, // 0x1,
        highest_kdratio, // 0x2,
        win_streak, // 0x3,
        death_streak, // 0x4,
        highest_score, // 0x5
    };

    // idx 2 members 2
    enum hash_28f0e9c96e9d895d {
        hash_f08aa26fabae647, // 0x0,
        hash_5740a8698a4d0345, // 0x1
    };

    // idx 3 members 2
    enum hash_6fc913ce2d7e3a05 {
        publicmatch, // 0x0,
        leaguematch, // 0x1
    };

    // idx 4 members 5
    enum hash_5af4108cc28a7f2f {
        dashboard, // 0x0,
        quit, // 0x1,
        kicked, // 0x2,
        finished, // 0x3,
        timeout, // 0x4
    };

    // idx 5 members 12
    enum hash_6501ee9650acd12c {
        coop, // 0x0,
        hash_166b6fdf8bfc14b0, // 0x1,
        cpzm, // 0x2,
        hvt, // 0x3,
        download, // 0x4,
        doa, // 0x5,
        hash_4cb6801fbfb4feba, // 0x6,
        hash_59109354c237d415, // 0x7,
        hash_61b9f30e20aecc3a, // 0x8,
        hash_6dbe071fd1f51551, // 0x9,
        hash_73a25371d607ae0f, // 0xa,
        pvp, // 0xb
    };

    // idx 6 members 10
    enum hash_77d9cc12441881d5 {
        hash_118a6332af43d97c, // 0x0,
        hash_1868403ad767bcd5, // 0x1,
        hash_192de2ac4a272b77, // 0x2,
        hash_1d9ec2a919018090, // 0x3,
        hash_28514534e1fdc6b7, // 0x4,
        hash_2aea61f2cc17fd2b, // 0x5,
        hash_364f981808c6bfc9, // 0x6,
        hash_46386949c31ed6c7, // 0x7,
        hash_551c2ad25d755c39, // 0x8,
        hash_79103217c50277f4, // 0x9
    };

    // idx 7 members 6
    enum hash_10edf09b258e1986 {
        hash_252319e61320ad11, // 0x0,
        revives, // 0x1,
        score, // 0x2,
        incaps, // 0x3,
        kills, // 0x4,
        assists, // 0x5
    };

    // idx 8 members 19
    enum hash_1609003ae729fea3 {
        destroyed, // 0x0,
        combatrecordstat, // 0x1,
        backstabber_kill, // 0x2,
        deathsduringuse, // 0x3,
        deaths, // 0x4,
        challenge6, // 0x5,
        challenge4, // 0x6,
        challenge5, // 0x7,
        challenge2, // 0x8,
        challenge3, // 0x9,
        challenge1, // 0xa,
        challenges, // 0xb,
        timeused, // 0xc,
        hits, // 0xd,
        headshots, // 0xe,
        shots, // 0xf,
        kills, // 0x10,
        used, // 0x11,
        assists, // 0x12
    };

    // idx 9 members 21
    enum hash_5075e11eecf4d03d {
        weapon_flamethrower, // 0x0,
        specialty, // 0x1,
        bonuscard, // 0x2,
        weapon_explosive, // 0x3,
        weapon_special, // 0x4,
        weapon_masterkey, // 0x5,
        miscweapon, // 0x6,
        weapon_pistol, // 0x7,
        killstreak, // 0x8,
        weapon_sniper, // 0x9,
        specialgrenade, // 0xa,
        weapon_grenadelauncher, // 0xb,
        weapon_launcher, // 0xc,
        weapon_grenade, // 0xd,
        hash_5352e5bf9311b021, // 0xe,
        weapon_shotgun, // 0xf,
        weapon_lmg, // 0x10,
        weapon_tactical, // 0x11,
        weapon_smg, // 0x12,
        weapon_cqb, // 0x13,
        weapon_assault, // 0x14
    };

    // idx 10 members 64
    enum hash_12cd35aeeec0ae2d {
        speedreloader, // 0x0,
        dynzoom, // 0x1,
        quickdraw, // 0x2,
        acog, // 0x3,
        pistolscope, // 0x4,
        mms, // 0x5,
        dw, // 0x6,
        gl, // 0x7,
        mk, // 0x8,
        ir, // 0x9,
        is, // 0xa,
        sf, // 0xb,
        rf, // 0xc,
        fastreload, // 0xd,
        extbarrel, // 0xe,
        rangefinder, // 0xf,
        steadyaim, // 0x10,
        stalker, // 0x11,
        barrelchoke, // 0x12,
        hipgrip, // 0x13,
        vzoom, // 0x14,
        supply, // 0x15,
        stalker2, // 0x16,
        extclip2, // 0x17,
        hash_19496adf1642b2e0, // 0x18,
        steadyaim2, // 0x19,
        hash_19f95db795729dff, // 0x1a,
        tacknife, // 0x1b,
        hash_1cedcb161a0f9050, // 0x1c,
        mixclip, // 0x1d,
        stackfire, // 0x1e,
        killcounter, // 0x1f,
        clantag, // 0x20,
        damage2, // 0x21,
        swayreduc, // 0x22,
        extbarrel2, // 0x23,
        hash_2e9c1ae290001c77, // 0x24,
        hash_30e2842163afed57, // 0x25,
        reddot, // 0x26,
        extclip, // 0x27,
        holo, // 0x28,
        hash_42a14ec552763dbc, // 0x29,
        elo, // 0x2a,
        fastreload2, // 0x2b,
        extrapellets, // 0x2c,
        holdbreath, // 0x2d,
        fmj2, // 0x2e,
        hash_561b988220ea0f76, // 0x2f,
        quickdraw2, // 0x30,
        hash_59df3d5966c1db75, // 0x31,
        hash_5a7a05163d2daf77, // 0x32,
        hash_5a902d129ff53760, // 0x33,
        fmj, // 0x34,
        hash_5d43c70ab246bed5, // 0x35,
        adsreload, // 0x36,
        suppressed, // 0x37,
        sprintout, // 0x38,
        grip2, // 0x39,
        dualoptic, // 0x3a,
        grip, // 0x3b,
        reflex, // 0x3c,
        hash_7ea53a02579e79d1, // 0x3d,
        uber, // 0x3e,
        damage, // 0x3f
    };

    // idx 11 members 8
    enum hash_4a2552dbed57509c {
        destroyed, // 0x0,
        backstabber_kill, // 0x1,
        deathsduringuse, // 0x2,
        deaths, // 0x3,
        hits, // 0x4,
        headshots, // 0x5,
        shots, // 0x6,
        kills, // 0x7
    };

    // idx 12 members 14
    enum hash_118b444c3f1477bc {
        yellow, // 0x0,
        red, // 0x1,
        move, // 0x2,
        green, // 0x3,
        left, // 0x4,
        hash_27d748f975c1cca2, // 0x5,
        hash_3abd10cd4bee218d, // 0x6,
        hash_3b1a3eb9e4c6e529, // 0x7,
        blue, // 0x8,
        cycle, // 0x9,
        hash_6c90e772edbc8708, // 0xa,
        cyan, // 0xb,
        hash_71874fda6a03b630, // 0xc,
        right, // 0xd
    };

    // idx 13 members 4
    enum prestigetokentype_e {
        hash_b48a752eef7af35, // 0x0,
        prestige_extra_cac, // 0x1,
        prestige_respec, // 0x2,
        prestige_reset_stats, // 0x3
    };

    // idx 14 members 10
    enum bunkcollectibleslots_e {
        bunk_collectible_medium_1, // 0x0,
        hash_1f95ed7440770262, // 0x1,
        bunk_collectible_medium_2, // 0x2,
        bunk_collectible_large_1, // 0x3,
        bunk_collectible_small_3, // 0x4,
        bunk_collectible_small_2, // 0x5,
        bunk_collectible_small_1, // 0x6,
        bunk_collectible_small_6, // 0x7,
        bunk_collectible_small_5, // 0x8,
        bunk_collectible_small_4, // 0x9
    };

    // idx 15 members 5
    enum hash_8fa49f7da0821e {
        hash_d6a8a92ed62461c, // 0x0,
        hash_211897601e420060, // 0x1,
        hash_3be7fbbad14a09aa, // 0x2,
        face, // 0x3,
        eyes, // 0x4
    };

    // idx 0 members 67 size 0x8b6c0
    // offset 0x0, size 0xa0
    dlc_t dlc;
    // offset 0xa0, size 0x20
    int unlocktokencount_weapon;
    // offset 0xc0, size 0x20
    uint hash_3ec47111a3993e52;
    // offset 0xe0, size 0x8
    uint:4 lastconsolesave;
    // offset 0xe8, size 0xc80
    hash_6962b6aa0c4853f4 facialfeatureproperties[hash_8fa49f7da0821e];
    // offset 0xd68, size 0x8
    uint:5 selectedcustomclass;
    // offset 0xd70, size 0x140
    hash_5ef0b8418736fce5 recentearnings[10];
    // offset 0xeb0, size 0x20
    uint hashlen;
    // offset 0xed0, size 0x40
    uint64 hash_37aeca4d39214e62;
    // offset 0xf10, size 0x3050
    hash_503eb0de8f9cf7c2 gamehistory[hash_6fc913ce2d7e3a05];
    // offset 0x3f60, size 0xe600
    hash_67b00e3091cde2fd attachments[hash_12cd35aeeec0ae2d];
    // offset 0x12560, size 0x90
    uint:24 higheststats[hash_1cbddecc4f162d46];
    // offset 0x125f0, size 0x13880
    hash_1608f63ae729eda5 weaponstats[200];
    // offset 0x25e70, size 0x320
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    // offset 0x26190, size 0x20
    int combattrainingwins;
    // offset 0x261b0, size 0x200
    uint:4 currentweaponlevels[64];
    // offset 0x263b0, size 0x40
    uint64 connectionid;
    // offset 0x263f0, size 0x1e0
    hash_722a4055916df1ff hash_7dd9f1ac62a346d;
    // offset 0x265d0, size 0x20
    int motdversionviewed;
    // offset 0x265f0, size 0xfb00
    hash_ca5eede65d9c59e variantstats[251];
    // offset 0x360f0, size 0x8
    uint:4 currenthitlocationindex;
    // offset 0x360f8, size 0x20
    uint hash_6dcaad4976588a44;
    // offset 0x36118, size 0xc30
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    // offset 0x36d48, size 0x190
    byte hash_5988aeaa53d6e90c[50];
    // offset 0x36ed8, size 0x260
    uint hash_3de5a4846f45ad78[19];
    // offset 0x37138, size 0x4970
    hash_2e0567490210dd82 playerstatsbymap[hash_77d9cc12441881d5];
    // offset 0x3baa8, size 0x1180
    hash_4976dab983b23e8c consoleinfo[10];
    // offset 0x3cc28, size 0xd20
    hash_78a2c506849f9dda bunkcollectibles;
    // offset 0x3d948, size 0x40
    uint64 hash_188ecc3aca50f93d;
    // offset 0x3d988, size 0x40
    uint achievements[hash_28f0e9c96e9d895d];
    // offset 0x3d9c8, size 0x49e0
    hash_2e1d3d3bb036d22c playerstatsbygametype[hash_6501ee9650acd12c];
    // offset 0x423a8, size 0x100
    byte demonwareflags[32];
    // offset 0x424a8, size 0x8
    uint:5 companion;
    // offset 0x424b0, size 0x20
    float skill_rating;
    // offset 0x424d0, size 0x20
    int unlocktokencount_attachment;
    // offset 0x424f0, size 0x20
    uint hash_3313a30250a39ec5;
    // offset 0x42510, size 0x180
    float hash_2363e7e74077b1c0[hash_6501ee9650acd12c];
    // offset 0x42690, size 0x20
    uint uploadbandwidth;
    // offset 0x426b0, size 0x140
    hash_4f6f299a12577aa4 prestigetokens[20];
    // offset 0x427f0, size 0xc0
    hash_4bb25d7ad41fb449 probation[hash_6fc913ce2d7e3a05];
    // offset 0x428b0, size 0x20
    int motdviewtime;
    // offset 0x428d0, size 0x8
    uint:3 faction;
    // offset 0x428d8, size 0x90
    hash_5cb2d75a230a501f trainingsimstats;
    // offset 0x42968, size 0x4ad0
    hash_6ef8b9b7a8fd75e1 groupstats[hash_5075e11eecf4d03d];
    // offset 0x47438, size 0x8
    uint:4 hash_191fbfb9e1a3acf3;
    // offset 0x47440, size 0x20
    float hash_54a74aa3d5f3346d;
    // offset 0x47460, size 0x46e0
    hash_6b3db80d498eb06 playerstatslist[hash_44d262eb4cb5ed61];
    // offset 0x4bb40, size 0xa0
    hash_402baff65ae9b838 clantagstats;
    // offset 0x4bbe0, size 0x20
    float skill_variance;
    // offset 0x4bc00, size 0x180
    float hash_3a7324ad328f0e2e[hash_6501ee9650acd12c];
    // offset 0x4bd80, size 0x22e8
    hash_6b411bb770fc8f6c afteractionreportstats;
    // offset 0x4e068, size 0x100
    byte unlocks[32];
    // offset 0x4e168, size 0x40
    uint64 playerxuid;
    // offset 0x4e1a8, size 0x3418
    hash_790a163d0959fa18 emblemstats;
    // offset 0x515c0, size 0x3a000
    hash_48cae9b9fcff7a5e itemstats[256];
    // offset 0x8b5c0, size 0x20
    uint highestmapreached;
    // offset 0x8b5e0, size 0x1
    bool hash_3ceb201776787882;
    // offset 0x8b5e1, size 0x1
    hash_7690a9df20146d8a zmcampaigndata;
    // offset 0x8b5e2, size 0x20
    bool musicunlocks[32];
    // offset 0x8b602, size 0x40
    bool hash_1576a2fd30a2dfb0[64];
    // offset 0x8b642, size 0x1
    bool hash_46e7db8ceaba5b2f;
    // offset 0x8b643, size 0x14
    bool hash_711b1260308620e7[20];
    // offset 0x8b657, size 0x14
    bool playercpdecorations[20];
    // offset 0x8b66b, size 0x1
    bool hash_8cbe2e4ecb4fc43;
    // offset 0x8b66c, size 0x1
    bool completedfirsttimeflow;
    // offset 0x8b66d, size 0x4d
    bool completedchallengeseen[77];
    // offset 0x8b6ba, size 0x6
    uint:1 __pad[6];
}

