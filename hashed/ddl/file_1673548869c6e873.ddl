// hash_1673548869c6e873
// metatable "hash_56f94926fc21f03c"

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

    // idx 3 members 20 size 0x1b8
    struct hash_75410917f1349195 {
        // offset 0x0, size 0x20
        uint hash_18cb1067529b24e6;
        // offset 0x20, size 0x20
        uint hash_4d8b250da4767eb7;
        // offset 0x40, size 0x8
        byte hash_58d62c257c3f9e9d;
        // offset 0x48, size 0x20
        uint hash_7a7ad9d0b762f0d3;
        // offset 0x68, size 0x20
        float hash_20f159c75c2c7f4e;
        // offset 0x88, size 0x10
        uint:16 hash_34c5635e8db13ab3;
        // offset 0x98, size 0x8
        byte hash_54d04e9876cf3bb2;
        // offset 0xa0, size 0x20
        float hash_20b0abc2a13dc92b;
        // offset 0xc0, size 0x20
        float hash_3772e4882104a032;
        // offset 0xe0, size 0x8
        byte hash_1050a7ff012698f8;
        // offset 0xe8, size 0x20
        uint hash_2d44b36998706f7;
        // offset 0x108, size 0x10
        uint:16 hash_383e72b38f06fdef;
        // offset 0x118, size 0x20
        uint hash_4d8e465f87a92f48;
        // offset 0x138, size 0x8
        byte result;
        // offset 0x140, size 0x20
        uint hash_66838b2bb2c0d307;
        // offset 0x160, size 0x10
        uint:16 hash_70f2b19ca673843f;
        // offset 0x170, size 0x20
        uint duration_ms;
        // offset 0x190, size 0x20
        uint hash_1b0d39256f62ffa4;
        // offset 0x1b0, size 0x1
        bool hash_5bf606466b9e7bbb;
        // offset 0x1b1, size 0x7
        uint:1 __pad[7];
    };

    // idx 4 members 4 size 0x450
    struct hash_3463e9551f90555 {
        // offset 0x0, size 0x20
        uint addr;
        // offset 0x20, size 0x10
        uint:16 port;
        // offset 0x30, size 0x400
        string(128) hash_113c5771496a44ed;
        // offset 0x430, size 0x20
        uint hash_32e3f837e2ac1c9b;
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

    // idx 0 members 5 size 0x16d0
    // offset 0x0, size 0x1140
    hash_3463e9551f90555 hash_7c0d8ffa40ab2f1c[4];
    // offset 0x1140, size 0x1f8
    telemetry_header telemetry;
    // offset 0x1338, size 0x1b8
    hash_75410917f1349195 hash_5d48574fc72fa62a;
    // offset 0x14f0, size 0xc0
    client_header client;
    // offset 0x15b0, size 0x120
    hash_6a65101a136eab93 header;
}

