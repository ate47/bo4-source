// hash_2544260de95f9661
// metatable "hash_b8afe48abf7f7b5"

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

    // idx 0 members 10 size 0x3d8
    // offset 0x0, size 0x20
    uint hash_3c4fdf4f4943a710;
    // offset 0x20, size 0x1f8
    telemetry_header telemetry;
    // offset 0x218, size 0x20
    uint hash_1cf0a057afbdbb2e;
    // offset 0x238, size 0x20
    uint hash_4a86a549996e6296;
    // offset 0x258, size 0x20
    uint hash_a0037751903d258;
    // offset 0x278, size 0x20
    int hash_2f919e9869a7fb6a;
    // offset 0x298, size 0xc0
    client_header client;
    // offset 0x358, size 0x20
    int hash_20e103c8d596edb6;
    // offset 0x378, size 0x20
    uint client_wins;
    // offset 0x398, size 0x40
    uint64 client_xuid;
}

