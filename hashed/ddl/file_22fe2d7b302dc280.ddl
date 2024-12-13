// hash_22fe2d7b302dc280
// metatable "hash_7533912bc67a6b07"

version 10 {
    // idx 1 members 8 size 0x1f8
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

    // idx 2 members 3 size 0xc0
    struct client_header {
        // offset 0x0, size 0x40
        uint64 hash_4016bed15f9183f7;
        // offset 0x40, size 0x40
        uint64 uno_id;
        // offset 0x80, size 0x40
        uint64 user_id;
    };

    // idx 3 members 3 size 0xc0
    struct match_header {
        // offset 0x0, size 0x40
        uint64 match_id;
        // offset 0x40, size 0x40
        uint64 hash_c05315ddb26eb93;
        // offset 0x80, size 0x40
        uint64 lobby_id;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 37 size 0xf18
    // offset 0x0, size 0x20
    float kd;
    // offset 0x20, size 0x20
    float hash_49ebf2675743e7eb;
    // offset 0x40, size 0x20
    float hash_49ebf1675743e638;
    // offset 0x60, size 0x20
    int rank;
    // offset 0x80, size 0x20
    int kills;
    // offset 0xa0, size 0xc0
    match_header match;
    // offset 0x160, size 0x20
    int score;
    // offset 0x180, size 0x20
    int hash_56832bbcf195a9d3;
    // offset 0x1a0, size 0x400
    string(128) hash_3b10bf5cc604677d;
    // offset 0x5a0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x798, size 0x20
    int grenadesused;
    // offset 0x7b8, size 0x20
    int bestkillstreak;
    // offset 0x7d8, size 0x200
    string(64) collectibles;
    // offset 0x9d8, size 0x20
    float dj_dist;
    // offset 0x9f8, size 0x20
    int dj_time;
    // offset 0xa18, size 0x20
    int hash_5563ef374a80dc1d;
    // offset 0xa38, size 0x40
    xhash primaryloadoutweapon;
    // offset 0xa78, size 0x20
    int playertime;
    // offset 0xa98, size 0x20
    float accuracy;
    // offset 0xab8, size 0x20
    int spawnid;
    // offset 0xad8, size 0x20
    int hash_5c5a773574a98026;
    // offset 0xaf8, size 0x20
    int gametime;
    // offset 0xb18, size 0xc0
    client_header client;
    // offset 0xbd8, size 0x20
    int deaths;
    // offset 0xbf8, size 0x20
    int incaps;
    // offset 0xc18, size 0x40
    xhash currentweapon;
    // offset 0xc58, size 0x20
    int rankxp;
    // offset 0xc78, size 0x20
    float hash_475d9beecef8b15f;
    // offset 0xc98, size 0x20
    int wallrun_time;
    // offset 0xcb8, size 0x20
    int assists;
    // offset 0xcd8, size 0x20
    int totalshots;
    // offset 0xcf8, size 0x20
    int hash_5e8a9a502b3f3df8;
    // offset 0xd18, size 0x20
    float hash_491587fc34c54122;
    // offset 0xd38, size 0x20
    int sprint_time;
    // offset 0xd58, size 0x20
    int shotshit;
    // offset 0xd78, size 0x180
    string(48) username;
    // offset 0xef8, size 0x20
    int headshots;
}

