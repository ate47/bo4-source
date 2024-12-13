// hash_5fd33dc7c38d2243
// metatable "hash_9797769106386acb"

version 4 {
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

    // idx 0 members 16 size 0x560
    // offset 0x0, size 0x100
    string(32) sku;
    // offset 0x100, size 0x8
    int:8 slot;
    // offset 0x108, size 0x20
    uint hash_15c56d778df1bb04;
    // offset 0x128, size 0x20
    uint casecount;
    // offset 0x148, size 0x1f8
    telemetry_header telemetry;
    // offset 0x340, size 0x20
    int timeremaining;
    // offset 0x360, size 0x40
    xhash itemname;
    // offset 0x3a0, size 0x20
    int rotationtime;
    // offset 0x3c0, size 0x8
    int:8 tierboost;
    // offset 0x3c8, size 0x8
    byte stacktotal;
    // offset 0x3d0, size 0x8
    byte stackposition;
    // offset 0x3d8, size 0x80
    string(16) action;
    // offset 0x458, size 0xc0
    client_header client;
    // offset 0x518, size 0x20
    uint cpcost;
    // offset 0x538, size 0x8
    int:8 season;
    // offset 0x540, size 0x20
    uint codpoints;
}

