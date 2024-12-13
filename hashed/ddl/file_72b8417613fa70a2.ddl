// hash_72b8417613fa70a2
// metatable "hash_a632a545122a0861"

version 1 {
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

    // idx 4 members 1 size 0x80
    struct hash_50c145a54b47885b {
        // offset 0x0, size 0x80
        string(16) hash_7b5a4ea140ea26ea;
    };

    // idx 5 members 4 size 0x80
    struct hash_30f7ad403990942a {
        // offset 0x0, size 0x20
        int index;
        // offset 0x20, size 0x20
        float origin_x;
        // offset 0x40, size 0x20
        float origin_y;
        // offset 0x60, size 0x20
        uint radius;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 5 size 0x35f8
    // offset 0x0, size 0x80
    hash_50c145a54b47885b info;
    // offset 0x80, size 0xc0
    match_header match;
    // offset 0x140, size 0x1f8
    telemetry_header telemetry;
    // offset 0x338, size 0x3200
    hash_30f7ad403990942a circles[100];
    // offset 0x3538, size 0xc0
    client_header client;
}

