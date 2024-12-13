// hash_1ec3596da2a73cad
// metatable "hash_b4b239261bab48d8"

version 10 {
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

    // idx 0 members 16 size 0x518
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x20
    float quatw;
    // offset 0xe0, size 0x20
    float quatx;
    // offset 0x100, size 0x20
    float quaty;
    // offset 0x120, size 0x20
    float quatz;
    // offset 0x140, size 0x1f8
    telemetry_header telemetry;
    // offset 0x338, size 0x20
    int hash_25d3bd75c4d8cf82;
    // offset 0x358, size 0xc0
    client_header client;
    // offset 0x418, size 0x20
    int hash_7ba2635f63e1aa23;
    // offset 0x438, size 0x20
    int originx;
    // offset 0x458, size 0x20
    int originy;
    // offset 0x478, size 0x20
    int originz;
    // offset 0x498, size 0x20
    float length;
    // offset 0x4b8, size 0x20
    int entitynum;
    // offset 0x4d8, size 0x20
    int hash_770767308e1117c4;
    // offset 0x4f8, size 0x20
    int hash_770768308e111977;
}

