// hash_54a92d00c424ecd7
// metatable "hash_bf2409ffa78211fe"

version 5 {
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

    // idx 0 members 9 size 0x498
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x40
    xhash dropped_item;
    // offset 0x100, size 0x40
    uint64 player_xuid;
    // offset 0x140, size 0x20
    int hash_68d91dfcdbefec92;
    // offset 0x160, size 0x1f8
    telemetry_header telemetry;
    // offset 0x358, size 0x20
    int hash_1c152c8ca72a09ff;
    // offset 0x378, size 0x20
    int game_time;
    // offset 0x398, size 0x40
    xhash hash_9f47aa57c2ba8ec;
    // offset 0x3d8, size 0xc0
    client_header client;
}

