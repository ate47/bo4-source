// hash_29277c23d2092c39
// metatable "hash_58e0c8e2e63f0564"

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

    // idx 0 members 15 size 0x700
    // offset 0x0, size 0x40
    xhash team;
    // offset 0x40, size 0x40
    xhash type;
    // offset 0x80, size 0x40
    xhash playerspecialist;
    // offset 0xc0, size 0x20
    int delta;
    // offset 0xe0, size 0xc0
    match_header match;
    // offset 0x1a0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x398, size 0x20
    int spawnid;
    // offset 0x3b8, size 0xc0
    string(24) gamemode;
    // offset 0x478, size 0x20
    int gametime;
    // offset 0x498, size 0xc0
    client_header client;
    // offset 0x558, size 0x180
    string(48) player;
    // offset 0x6d8, size 0x20
    int deltamomentum;
    // offset 0x6f8, size 0x1
    bool isusingheropower;
    // offset 0x6f9, size 0x1
    bool isscoreevent;
    // offset 0x6fa, size 0x6
    uint:1 __pad[6];
}

