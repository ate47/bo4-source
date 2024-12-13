// hash_532122ee85f6e062
// metatable "hash_b45b379ca9eb64b6"

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

    // idx 0 members 38 size 0x948
    // offset 0x0, size 0x180
    string(48) name;
    // offset 0x180, size 0x40
    uint64 xuid;
    // offset 0x1c0, size 0xc0
    match_header match;
    // offset 0x280, size 0x20
    int hash_7d7fed9075e687a;
    // offset 0x2a0, size 0x20
    int hash_7d7ffd9075e6a2d;
    // offset 0x2c0, size 0x20
    int hash_7d7fcd9075e6514;
    // offset 0x2e0, size 0x20
    int hash_7d7fdd9075e66c7;
    // offset 0x300, size 0x20
    int hash_7d7fad9075e61ae;
    // offset 0x320, size 0x20
    int hash_7d7fbd9075e6361;
    // offset 0x340, size 0x20
    int hash_7d7f8d9075e5e48;
    // offset 0x360, size 0x20
    int hash_21ea032a486734ae;
    // offset 0x380, size 0x20
    int hash_21ea022a486732fb;
    // offset 0x3a0, size 0x20
    int hash_21ea012a48673148;
    // offset 0x3c0, size 0x20
    int hash_21ea082a48673d2d;
    // offset 0x3e0, size 0x20
    int hash_21ea072a48673b7a;
    // offset 0x400, size 0x20
    int hash_21ea062a486739c7;
    // offset 0x420, size 0x20
    int hash_21ea052a48673814;
    // offset 0x440, size 0x20
    int hash_21e9fc2a486728c9;
    // offset 0x460, size 0x20
    int hash_21e9fb2a48672716;
    // offset 0x480, size 0x20
    int hash_5804f40d89d0cb3f;
    // offset 0x4a0, size 0x20
    int hash_5804f50d89d0ccf2;
    // offset 0x4c0, size 0x20
    int hash_5804f60d89d0cea5;
    // offset 0x4e0, size 0x20
    int hash_5804ef0d89d0c2c0;
    // offset 0x500, size 0x20
    int hash_5804f00d89d0c473;
    // offset 0x520, size 0x20
    int hash_5804f10d89d0c626;
    // offset 0x540, size 0x20
    int hash_5804f20d89d0c7d9;
    // offset 0x560, size 0x20
    int hash_5804fb0d89d0d724;
    // offset 0x580, size 0x20
    int hash_5804fc0d89d0d8d7;
    // offset 0x5a0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x798, size 0x10
    short clientnum;
    // offset 0x7a8, size 0xc0
    client_header client;
    // offset 0x868, size 0x20
    int hash_6135c2012dc90a7d;
    // offset 0x888, size 0x20
    int hash_6135c1012dc908ca;
    // offset 0x8a8, size 0x20
    int hash_6135c0012dc90717;
    // offset 0x8c8, size 0x20
    int hash_6135bf012dc90564;
    // offset 0x8e8, size 0x20
    int hash_6135be012dc903b1;
    // offset 0x908, size 0x20
    int hash_6135bd012dc901fe;
    // offset 0x928, size 0x20
    int hash_6135bc012dc9004b;
}

