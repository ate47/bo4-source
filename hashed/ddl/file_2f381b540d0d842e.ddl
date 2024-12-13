// hash_2f381b540d0d842e
// metatable "hash_f9a9b579543779ca"

version 13 {
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

    // idx 0 members 12 size 0x5e8
    // offset 0x0, size 0x180
    string(48) name;
    // offset 0x180, size 0xc0
    match_header match;
    // offset 0x240, size 0x20
    int score;
    // offset 0x260, size 0x20
    float skill;
    // offset 0x280, size 0x20
    int time_played;
    // offset 0x2a0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x498, size 0x20
    float hash_bcaf6f75977e7fd;
    // offset 0x4b8, size 0x10
    short clientnum;
    // offset 0x4c8, size 0x20
    float hash_643bb973cf7657ad;
    // offset 0x4e8, size 0xc0
    client_header client;
    // offset 0x5a8, size 0x20
    float variance;
    // offset 0x5c8, size 0x20
    float hash_7f882efce9a0e3db;
}

