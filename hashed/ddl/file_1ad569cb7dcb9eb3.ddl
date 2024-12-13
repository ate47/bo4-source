// hash_1ad569cb7dcb9eb3
// metatable "hash_b036f7ef8ff27154"

version 11 {
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

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 22
    enum hash_65b32ffa6d513dbe {
        hash_6f32b1262776b10, // 0x0,
        hash_19d5c091b104e4be, // 0x1,
        hash_1bdc4d0f55ee106a, // 0x2,
        key_up, // 0x3,
        hash_25dfa2f5d94ed64a, // 0x4,
        hash_318d23de232f5427, // 0x5,
        hash_3ac4b2f6efdec79a, // 0x6,
        key_left, // 0x7,
        hash_3d8221d41c253f48, // 0x8,
        hash_3e7571571a1459a6, // 0x9,
        key_down, // 0xa,
        hash_47a1ed234565a94d, // 0xb,
        hash_4896cc7be5555712, // 0xc,
        key_back, // 0xd,
        hash_535d8cdc1865d92f, // 0xe,
        hash_571641deca204458, // 0xf,
        hash_571642deca20460b, // 0x10,
        hash_571643deca2047be, // 0x11,
        key_right, // 0x12,
        hash_64542839fe491d2e, // 0x13,
        key_start, // 0x14,
        hash_6b2290ec67e5dd5b, // 0x15
    };

    // idx 0 members 7 size 0x540
    // offset 0x0, size 0x200
    string(64) screen_id;
    // offset 0x200, size 0x1f8
    telemetry_header telemetry;
    // offset 0x3f8, size 0x20
    int hash_7357215dfa16830d;
    // offset 0x418, size 0x20
    uint screen_duration;
    // offset 0x438, size 0x8
    hash_65b32ffa6d513dbe hash_3a6f594b9f4471d1;
    // offset 0x440, size 0xc0
    client_header client;
    // offset 0x500, size 0x40
    uint64 hash_13a1a70556201a2d;
}

