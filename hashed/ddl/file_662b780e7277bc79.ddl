// hash_662b780e7277bc79
// metatable "hash_8db412dab501cfad"

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

    // idx 3 members 13 size 0x148
    struct hash_33bf07591958a6f1 {
        // offset 0x0, size 0x20
        int hash_1264c84bbee08f80;
        // offset 0x20, size 0x20
        uint hash_4926ebe3920f1011;
        // offset 0x40, size 0x8
        byte hash_a0f382d7c109dd4;
        // offset 0x48, size 0x20
        uint hash_266b42dab96feeb0;
        // offset 0x68, size 0x20
        uint hash_3b6396c9a7bb3501;
        // offset 0x88, size 0x10
        uint:16 hash_21b204228b9c30ad;
        // offset 0x98, size 0x8
        byte last_state;
        // offset 0xa0, size 0x20
        uint hash_49b55debef4aed9b;
        // offset 0xc0, size 0x8
        byte hash_20d721b4939feee8;
        // offset 0xc8, size 0x20
        uint hash_ebf5cf2789352f3;
        // offset 0xe8, size 0x20
        uint hash_1d3d37b4bfd07e57;
        // offset 0x108, size 0x20
        uint hash_57645f4f490fadfb;
        // offset 0x128, size 0x20
        int hash_25dca3aaf0f14efe;
    };

    // idx 4 members 5 size 0x120
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

    // idx 0 members 4 size 0x520
    // offset 0x0, size 0x148
    hash_33bf07591958a6f1 hash_2b1372bddf3a584c;
    // offset 0x148, size 0x1f8
    telemetry_header telemetry;
    // offset 0x340, size 0xc0
    client_header client;
    // offset 0x400, size 0x120
    hash_6a65101a136eab93 header;
}

