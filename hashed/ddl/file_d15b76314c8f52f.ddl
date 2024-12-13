// hash_d15b76314c8f52f
// metatable "hash_8d121a7d1753ebce"

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

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 10 size 0x350
    // offset 0x0, size 0x20
    int hash_1a553941a735de81;
    // offset 0x20, size 0x20
    int controller;
    // offset 0x40, size 0x1f8
    telemetry_header telemetry;
    // offset 0x238, size 0x20
    int lobby_type;
    // offset 0x258, size 0x10
    short max_clients;
    // offset 0x268, size 0xc0
    client_header client;
    // offset 0x328, size 0x20
    int hash_5862d3f1b0f11978;
    // offset 0x348, size 0x1
    bool hash_4b3088c31338f710;
    // offset 0x349, size 0x1
    bool hash_46b8ae8b89bf06c2;
    // offset 0x34a, size 0x6
    uint:1 __pad[6];
}

