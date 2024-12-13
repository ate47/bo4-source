// hash_5ef6bf9bb6b478bd
// metatable "hash_9458e5909d2fce4e"

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

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 8
    enum hash_29f48f8f9b71357f {
        hash_f72397b7d69ee6d, // 0x0,
        hash_2439662214197df9, // 0x1,
        hash_45b93a098b0a80f8, // 0x2,
        hash_45c1824dca01090f, // 0x3,
        hash_547b78dcba6ed1d5, // 0x4,
        hash_55a45a569173088a, // 0x5,
        hash_615989812612926b, // 0x6,
        hash_7547bff0822acceb, // 0x7
    };

    // idx 0 members 5 size 0x3a0
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2b8, size 0xc0
    client_header client;
    // offset 0x378, size 0x20
    int hash_356799aabf77774;
    // offset 0x398, size 0x8
    hash_29f48f8f9b71357f hash_24f93aa82957b047;
}

