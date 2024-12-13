// hash_696369b6894e209c
// metatable "hash_5f1dacbb9f3f3015"

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

    // idx 0 members 11 size 0x468
    // offset 0x0, size 0x10
    short yaw;
    // offset 0x10, size 0xc0
    match_header match;
    // offset 0xd0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2c8, size 0x20
    int spawnpointid;
    // offset 0x2e8, size 0xc0
    client_header client;
    // offset 0x3a8, size 0x20
    float hash_12d684491db40139;
    // offset 0x3c8, size 0x20
    float hash_66e41e72ea58b526;
    // offset 0x3e8, size 0x20
    int originx;
    // offset 0x408, size 0x20
    int originy;
    // offset 0x428, size 0x20
    int originz;
    // offset 0x448, size 0x20
    float hash_6a5e5d302acd530e;
}

