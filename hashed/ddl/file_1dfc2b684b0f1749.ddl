// hash_1dfc2b684b0f1749
// metatable "hash_f0716b756b554c5c"

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

    // idx 3 members 3 size 0xc0
    struct match_header {
        // offset 0x0, size 0x40
        uint64 match_id;
        // offset 0x40, size 0x40
        uint64 hash_c05315ddb26eb93;
        // offset 0x80, size 0x40
        uint64 lobby_id;
    };

    // idx 4 members 8 size 0x6d8
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

    // idx 1 members 5
    enum hash_61d8fb71b3cca1df {
        mode_invalid, // 0x0,
        mode_campaign, // 0x1,
        mode_multiplayer, // 0x2,
        mode_warzone, // 0x3,
        mode_zombies, // 0x4
    };

    // idx 2 members 4
    enum hash_405641015bd81f7d {
        xonline_nat_unknown, // 0x0,
        xonline_nat_open, // 0x1,
        xonline_nat_strict, // 0x2,
        xonline_nat_moderate, // 0x3
    };

    // idx 3 members 3
    enum hash_6cf1cc22ebab862c {
        hash_18695b82948876e3, // 0x0,
        hash_31a0fc57a92be3ec, // 0x1,
        hash_50894d28d26042e8, // 0x2
    };

    // idx 0 members 21 size 0xcf0
    // offset 0x0, size 0x180
    string(48) map;
    // offset 0x180, size 0xc0
    match_header match;
    // offset 0x240, size 0x1f8
    telemetry_header telemetry;
    // offset 0x438, size 0x40
    xhash playlist_name;
    // offset 0x478, size 0x20
    int lobby_type;
    // offset 0x498, size 0x40
    xhash game_type;
    // offset 0x4d8, size 0x8
    hash_6cf1cc22ebab862c install_type;
    // offset 0x4e0, size 0x8
    hash_405641015bd81f7d nat_type;
    // offset 0x4e8, size 0x20
    int playlist_id;
    // offset 0x508, size 0xc0
    client_header client;
    // offset 0x5c8, size 0x6d8
    hash_6580ccf5f8a0ef6 region;
    // offset 0xca0, size 0x40
    uint64 uno_id;
    // offset 0xce0, size 0x8
    hash_61d8fb71b3cca1df session_mode;
    // offset 0xce8, size 0x1
    bool hash_27f986f9f86c15ef;
    // offset 0xce9, size 0x1
    bool is_guest;
    // offset 0xcea, size 0x1
    bool is_splitscreen;
    // offset 0xceb, size 0x1
    bool new_user;
    // offset 0xcec, size 0x1
    bool hash_6e58cdc751af2093;
    // offset 0xced, size 0x1
    bool is_igr;
    // offset 0xcee, size 0x1
    bool hash_a5ceb4ab2cb3bba;
    // offset 0xcef, size 0x1
    uint:1 __pad[1];
}

