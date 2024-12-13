// hash_73d6d3eeee4c8de4
// metatable "hash_f9be7b1ed11e7312"

version 3 {
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

    // idx 0 members 7 size 0x8378
    // offset 0x0, size 0x40
    xhash leaving;
    // offset 0x40, size 0x40
    xhash loading;
    // offset 0x80, size 0x1f8
    telemetry_header telemetry;
    // offset 0x278, size 0x8000
    string(4096) assets;
    // offset 0x8278, size 0xc0
    client_header client;
    // offset 0x8338, size 0x20
    int loaded;
    // offset 0x8358, size 0x20
    int needed;
}

