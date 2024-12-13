// hash_6fb377912699fcc3
// metatable "hash_5cc056c5769358fe"

version 8 {
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

    // idx 0 members 27 size 0x9c0
    // offset 0x0, size 0x20
    float head_offset;
    // offset 0x20, size 0x40
    uint64 enemy;
    // offset 0x60, size 0xc0
    match_header match;
    // offset 0x120, size 0x20
    float hash_1f6cb274898a232a;
    // offset 0x140, size 0x20
    float origin_offset;
    // offset 0x160, size 0x20
    float hash_6ca68a826d8d5015;
    // offset 0x180, size 0x20
    float distance;
    // offset 0x1a0, size 0x400
    string(128) weapon_attachments;
    // offset 0x5a0, size 0x40
    uint64 attacker;
    // offset 0x5e0, size 0x20
    float time_offset;
    // offset 0x600, size 0x1f8
    telemetry_header telemetry;
    // offset 0x7f8, size 0x20
    int hash_62d1da867bb2ff57;
    // offset 0x818, size 0x20
    float yaw_offset;
    // offset 0x838, size 0x20
    float hash_150b59790cfad3fa;
    // offset 0x858, size 0xc0
    client_header client;
    // offset 0x918, size 0x20
    float hash_6273201c1ac36522;
    // offset 0x938, size 0x40
    xhash weapon;
    // offset 0x978, size 0x20
    float hash_aae124f4ed1846e;
    // offset 0x998, size 0x20
    float foot_offset;
    // offset 0x9b8, size 0x1
    bool hash_798dacddc7e656b3;
    // offset 0x9b9, size 0x1
    bool hash_4aac85027c3a650c;
    // offset 0x9ba, size 0x1
    bool hash_2b9d070619bac7c1;
    // offset 0x9bb, size 0x1
    bool hash_79ec1ef18401690b;
    // offset 0x9bc, size 0x1
    bool hash_2a1e95e3a58c334c;
    // offset 0x9bd, size 0x1
    bool validated;
    // offset 0x9be, size 0x1
    bool processed;
    // offset 0x9bf, size 0x1
    bool hash_1b75b5c1eae66aa5;
}

