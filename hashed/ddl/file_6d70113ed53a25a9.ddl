// hash_6d70113ed53a25a9
// metatable "hash_59e070c81225284d"

version 2 {
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

    // idx 0 members 20 size 0x640
    // offset 0x0, size 0x10
    uint:16 hits;
    // offset 0x10, size 0x20
    float longest_hit_distance;
    // offset 0x30, size 0x10
    uint:16 kills;
    // offset 0x40, size 0xc0
    match_header match;
    // offset 0x100, size 0x10
    uint:16 shots;
    // offset 0x110, size 0x1f8
    telemetry_header telemetry;
    // offset 0x308, size 0x20
    uint time_used_s;
    // offset 0x328, size 0x40
    xhash reticle;
    // offset 0x368, size 0xc0
    client_header client;
    // offset 0x428, size 0x40
    xhash weapon;
    // offset 0x468, size 0x40
    xhash attachment1;
    // offset 0x4a8, size 0x40
    xhash attachment2;
    // offset 0x4e8, size 0x40
    xhash attachment3;
    // offset 0x528, size 0x40
    xhash attachment4;
    // offset 0x568, size 0x40
    xhash attachment5;
    // offset 0x5a8, size 0x40
    xhash attachment6;
    // offset 0x5e8, size 0x40
    xhash attachment7;
    // offset 0x628, size 0x10
    uint:16 headshots;
    // offset 0x638, size 0x1
    bool died;
    // offset 0x639, size 0x7
    uint:1 __pad[7];
}

