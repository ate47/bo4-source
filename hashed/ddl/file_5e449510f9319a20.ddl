// hash_5e449510f9319a20
// metatable "hash_4de223927eba96ed"

version 5 {
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

    // idx 4 members 1 size 0x10
    struct hash_46f2ea4cc6f0ef92 {
        // offset 0x0, size 0x10
        uint:16 value;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 13 size 0xf08
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x20
    int hash_b3b9df7f8e46110;
    // offset 0xe0, size 0x1f0
    hash_46f2ea4cc6f0ef92 hash_7e1386e214ff2fac[31];
    // offset 0x2d0, size 0x190
    hash_46f2ea4cc6f0ef92 hash_62ffdd1b4c308ec8[25];
    // offset 0x460, size 0x20
    uint hash_1db36ca43f8ad917;
    // offset 0x480, size 0x1f8
    telemetry_header telemetry;
    // offset 0x678, size 0x60
    hash_46f2ea4cc6f0ef92 hash_df9a6e6386059d2[6];
    // offset 0x6d8, size 0x1f0
    hash_46f2ea4cc6f0ef92 hash_860e7d3dbf29ba1[31];
    // offset 0x8c8, size 0x2a0
    hash_46f2ea4cc6f0ef92 hash_489b624635fc1faf[42];
    // offset 0xb68, size 0x20
    int hash_4b969717ded32c59;
    // offset 0xb88, size 0x2a0
    hash_46f2ea4cc6f0ef92 hash_5f9e5fe5b8245404[42];
    // offset 0xe28, size 0xc0
    client_header client;
    // offset 0xee8, size 0x20
    uint hash_3fb1cd058b597d26;
}

