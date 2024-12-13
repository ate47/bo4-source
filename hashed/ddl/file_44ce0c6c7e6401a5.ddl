// hash_44ce0c6c7e6401a5
// metatable "hash_5e046af1d52ba5f4"

version 14 {
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

    // idx 0 members 13 size 0x6a0
    // offset 0x0, size 0x40
    xhash team;
    // offset 0x40, size 0x40
    uint64 xuid;
    // offset 0x80, size 0xc0
    match_header match;
    // offset 0x140, size 0x20
    int score;
    // offset 0x160, size 0x1f8
    telemetry_header telemetry;
    // offset 0x358, size 0x20
    int playtime;
    // offset 0x378, size 0x200
    string(64) endreason;
    // offset 0x578, size 0xc0
    client_header client;
    // offset 0x638, size 0x20
    int specialist;
    // offset 0x658, size 0x20
    int momentum;
    // offset 0x678, size 0x20
    int sessionrank;
    // offset 0x698, size 0x1
    bool gameover;
    // offset 0x699, size 0x7
    uint:1 __pad[7];
}

