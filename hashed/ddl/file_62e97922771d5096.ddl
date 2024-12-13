// hash_62e97922771d5096
// metatable "hash_60517b85035d7891"

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

    // idx 4 members 1 size 0x40
    struct hash_2e8844abee67a26f {
        // offset 0x0, size 0x40
        uint64 xuid;
    };

    // idx 5 members 2 size 0x60
    struct hash_79a5e2d9e3912c45 {
        // offset 0x0, size 0x40
        uint64 hash_46838162d06a1e0d;
        // offset 0x40, size 0x20
        int hash_22bebb24c7131b96;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 5 size 0x658
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x280
    hash_2e8844abee67a26f party_members[10];
    // offset 0x340, size 0x60
    hash_79a5e2d9e3912c45 hash_244cfe1af6487d5a;
    // offset 0x3a0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x598, size 0xc0
    client_header client;
}

