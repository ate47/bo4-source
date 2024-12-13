// hash_7bfb536ff8a8e33b
// metatable "hash_1e402560842c53fa"

version 12 {
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

    // idx 1 members 4
    enum hash_6e584a2182d558dd {
        hash_48c11f5af9af3a1, // 0x0,
        no, // 0x1,
        yes, // 0x2,
        hash_7f10c379eec64c4a, // 0x3
    };

    // idx 0 members 9 size 0x5a8
    // offset 0x0, size 0x40
    uint64 match_id;
    // offset 0x40, size 0x20
    uint version;
    // offset 0x60, size 0x1f8
    telemetry_header telemetry;
    // offset 0x258, size 0x100
    string(32) survey_order;
    // offset 0x358, size 0x8
    hash_6e584a2182d558dd answer_id;
    // offset 0x360, size 0x180
    string(48) survey_id;
    // offset 0x4e0, size 0xc0
    client_header client;
    // offset 0x5a0, size 0x1
    bool quitter;
    // offset 0x5a1, size 0x7
    uint:1 __pad[7];
}

