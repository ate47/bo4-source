// hash_1a38f5a491194406
// metatable "hash_930b830a775663cb"

version 9 {
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

    // idx 0 members 20 size 0xc18
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2b8, size 0x200
    string(64) enemyweapon;
    // offset 0x4b8, size 0x20
    int enemyentitynum;
    // offset 0x4d8, size 0x20
    int hash_666d0cfcf9ae78ae;
    // offset 0x4f8, size 0x180
    string(48) playername;
    // offset 0x678, size 0x20
    int gametime;
    // offset 0x698, size 0x20
    int spawnpointid;
    // offset 0x6b8, size 0xc0
    client_header client;
    // offset 0x778, size 0x20
    int originx;
    // offset 0x798, size 0x20
    int originy;
    // offset 0x7b8, size 0x20
    int originz;
    // offset 0x7d8, size 0x20
    int spawnpointidshift;
    // offset 0x7f8, size 0x180
    string(48) enemyname;
    // offset 0x978, size 0x200
    string(64) reason;
    // offset 0xb78, size 0x20
    int elapsedtime;
    // offset 0xb98, size 0x20
    int hash_5baa54667bbc1690;
    // offset 0xbb8, size 0x20
    int hash_5baa55667bbc1843;
    // offset 0xbd8, size 0x20
    int hash_5baa56667bbc19f6;
    // offset 0xbf8, size 0x20
    int playerentitynum;
}

