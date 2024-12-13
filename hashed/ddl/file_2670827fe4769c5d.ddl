// hash_2670827fe4769c5d
// metatable "hash_64dbba3a488762bd"

version 6 {
    // idx 1 members 3 size 0xc0
    struct match_header {
        // offset 0x0, size 0x40
        uint64 match_id;
        // offset 0x40, size 0x40
        uint64 hash_c05315ddb26eb93;
        // offset 0x80, size 0x40
        uint64 lobby_id;
    };

    // idx 0 members 5
    enum hash_61d8fb71b3cca1df {
        mode_invalid, // 0x0,
        mode_campaign, // 0x1,
        mode_multiplayer, // 0x2,
        mode_warzone, // 0x3,
        mode_zombies, // 0x4
    };

    // idx 0 members 14 size 0x1e8
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x20
    int pos_x;
    // offset 0xe0, size 0x20
    int pos_y;
    // offset 0x100, size 0x20
    int pos_z;
    // offset 0x120, size 0x20
    uint hash_5d4c0dad617ca23;
    // offset 0x140, size 0x20
    uint time_ms;
    // offset 0x160, size 0x8
    byte motion_state;
    // offset 0x168, size 0x10
    short life_index;
    // offset 0x178, size 0x10
    short angle_x;
    // offset 0x188, size 0x10
    short angle_y;
    // offset 0x198, size 0x8
    hash_61d8fb71b3cca1df session_mode;
    // offset 0x1a0, size 0x40
    uint64 user_id;
    // offset 0x1e0, size 0x1
    bool is_ads;
    // offset 0x1e1, size 0x7
    uint:1 __pad[7];
}

