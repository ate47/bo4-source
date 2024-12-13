// hash_7a1852d97b70bc3e
// metatable "hash_932029f6984731b7"

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

    // idx 0 members 12 size 0x478
    // offset 0x0, size 0x20
    float float;
    // offset 0x20, size 0x10
    short int16;
    // offset 0x30, size 0x20
    int int32;
    // offset 0x50, size 0xc0
    match_header match;
    // offset 0x110, size 0x8
    byte uint8;
    // offset 0x118, size 0x1f8
    telemetry_header telemetry;
    // offset 0x310, size 0xc0
    client_header client;
    // offset 0x3d0, size 0x40
    string(8) string;
    // offset 0x410, size 0x20
    uint uint32;
    // offset 0x430, size 0x40
    uint64 uint64;
    // offset 0x470, size 0x1
    bool bool;
    // offset 0x471, size 0x7
    uint:1 __pad[7];
}

