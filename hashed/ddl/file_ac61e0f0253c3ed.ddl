// hash_ac61e0f0253c3ed
// metatable "hash_2c8fcd9d06c08499"

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

    // idx 0 members 14 size 0x720
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x20
    int version;
    // offset 0xe0, size 0x20
    int hash_7196f8e148297af1;
    // offset 0x100, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2f8, size 0x100
    string(32) mapname;
    // offset 0x3f8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x400, size 0xc0
    string(24) gametype;
    // offset 0x4c0, size 0x20
    int hash_7c1ff8b3178dee8;
    // offset 0x4e0, size 0x20
    int hash_1e200cc69558d210;
    // offset 0x500, size 0x20
    float hash_765ed95f600a8290;
    // offset 0x520, size 0xc0
    client_header client;
    // offset 0x5e0, size 0x20
    int hash_4194f71be4b437a4;
    // offset 0x600, size 0x20
    int hash_6821df3afc5a0212;
    // offset 0x620, size 0x100
    string(32) hostname;
}

