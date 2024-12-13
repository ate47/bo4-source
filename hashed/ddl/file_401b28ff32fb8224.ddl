// hash_401b28ff32fb8224
// metatable "hash_5e3c37763cfc61ea"

version 2 {
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

    // idx 3 members 7 size 0xa8
    struct hash_6ff4b416acbedfc8 {
        // offset 0x0, size 0x20
        uint retries;
        // offset 0x20, size 0x20
        uint hash_7eeb3b0b30e2921a;
        // offset 0x40, size 0x10
        uint:16 hash_4b5ffc955581a19e;
        // offset 0x50, size 0x8
        byte result;
        // offset 0x58, size 0x20
        uint hash_3795c515da21f010;
        // offset 0x78, size 0x10
        uint:16 hash_61f7e598d316c750;
        // offset 0x88, size 0x20
        uint duration_ms;
    };

    // idx 4 members 1 size 0x20
    struct hash_6538fe05961782a3 {
        // offset 0x0, size 0x20
        uint hash_7bd602a5f16fdf88;
    };

    // idx 5 members 5 size 0x120
    struct hash_6a65101a136eab93 {
        // offset 0x0, size 0x40
        uint64 hash_6bdd7ebe59310aa2;
        // offset 0x40, size 0x40
        uint64 lobby_id;
        // offset 0x80, size 0x20
        uint title_id;
        // offset 0xa0, size 0x40
        uint64 hash_426fb7404d1fbf32;
        // offset 0xe0, size 0x40
        uint64 user_id;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 5 size 0x5c0
    // offset 0x0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x1f8, size 0x140
    hash_6538fe05961782a3 hash_7c2a2b8cc4afe569[10];
    // offset 0x338, size 0xc0
    client_header client;
    // offset 0x3f8, size 0x120
    hash_6a65101a136eab93 header;
    // offset 0x518, size 0xa8
    hash_6ff4b416acbedfc8 hash_294b5b1dc0642b63;
}

