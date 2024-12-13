// hash_2394aaf2c4f503d4
// metatable "hash_c09b7359460ecdf1"

version 24 {
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

    // idx 3 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 3
    enum hash_6cf1cc22ebab862c {
        hash_18695b82948876e3, // 0x0,
        hash_31a0fc57a92be3ec, // 0x1,
        hash_50894d28d26042e8, // 0x2
    };

    // idx 0 members 14 size 0x9e0
    // offset 0x0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x1f8, size 0x20
    int hash_75cf5e6bfea03713;
    // offset 0x218, size 0x8
    hash_6cf1cc22ebab862c install_type;
    // offset 0x220, size 0xc0
    client_header client;
    // offset 0x2e0, size 0x6d8
    hash_6580ccf5f8a0ef6 region;
    // offset 0x9b8, size 0x20
    int bandwidth_up;
    // offset 0x9d8, size 0x1
    bool hash_27f986f9f86c15ef;
    // offset 0x9d9, size 0x1
    bool hash_6e58cdc751af2093;
    // offset 0x9da, size 0x1
    bool hash_6abdb11dfb3344ac;
    // offset 0x9db, size 0x1
    bool is_hdr;
    // offset 0x9dc, size 0x1
    bool is_igr;
    // offset 0x9dd, size 0x1
    bool hash_a5ceb4ab2cb3bba;
    // offset 0x9de, size 0x1
    bool hash_6f05745100a036a1;
    // offset 0x9df, size 0x1
    bool hash_7060c9664d2c5213;
}

