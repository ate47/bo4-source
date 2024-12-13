// hash_77b531acfbd77015
// metatable "hash_92776066f0257f0e"

version 16 {
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

    // idx 3 members 9 size 0x100
    struct hash_2b62ba8b8dc70ad4 {
        // offset 0x0, size 0x20
        float float;
        // offset 0x20, size 0x10
        short int16;
        // offset 0x30, size 0x20
        int int32;
        // offset 0x50, size 0x8
        byte uint8;
        // offset 0x58, size 0x40
        string(8) string;
        // offset 0x98, size 0x20
        uint uint32;
        // offset 0xb8, size 0x40
        uint64 uint64;
        // offset 0xf8, size 0x1
        bool bool;
        // offset 0xf9, size 0x7
        uint:1 __pad[7];
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 3 size 0x3b8
    // offset 0x0, size 0x100
    hash_2b62ba8b8dc70ad4 test;
    // offset 0x100, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2f8, size 0xc0
    client_header client;
}

