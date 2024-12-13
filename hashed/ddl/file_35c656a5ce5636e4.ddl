// hash_35c656a5ce5636e4
// metatable "hash_6c06ad1fc8cf8d4d"

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

    // idx 0 members 12 size 0x3e8
    // offset 0x0, size 0x20
    int hash_384cc37d1b735f65;
    // offset 0x20, size 0x40
    uint64 match_id;
    // offset 0x60, size 0x1f8
    telemetry_header telemetry;
    // offset 0x258, size 0x20
    int num_players;
    // offset 0x278, size 0x20
    int max_clients;
    // offset 0x298, size 0x40
    uint64 hash_c05315ddb26eb93;
    // offset 0x2d8, size 0x20
    int duration;
    // offset 0x2f8, size 0xc0
    client_header client;
    // offset 0x3b8, size 0x20
    int hash_1f3fa98aade046aa;
    // offset 0x3d8, size 0x8
    hash_61d8fb71b3cca1df session_mode;
    // offset 0x3e0, size 0x1
    bool overflowed;
    // offset 0x3e1, size 0x7
    uint:1 __pad[7];
}

