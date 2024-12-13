// hash_2ec6766c0c27c8c7
// metatable "hash_ffc0d3a697b35fd7"

version 9 {
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

    // idx 0 members 18 size 0x758
    // offset 0x0, size 0xc0
    string(24) mode;
    // offset 0xc0, size 0x20
    int play;
    // offset 0xe0, size 0x20
    int quit;
    // offset 0x100, size 0xc0
    match_header match;
    // offset 0x1c0, size 0x20
    int playw;
    // offset 0x1e0, size 0x20
    int quitw;
    // offset 0x200, size 0x20
    int firsttime;
    // offset 0x220, size 0x20
    int forgiven;
    // offset 0x240, size 0x20
    int finishedw;
    // offset 0x260, size 0x1f8
    telemetry_header telemetry;
    // offset 0x458, size 0x20
    int hash_501d5f909f2be786;
    // offset 0x478, size 0x20
    int hash_7f5b1682501e1b04;
    // offset 0x498, size 0x180
    string(48) playername;
    // offset 0x618, size 0x20
    int timeoutw;
    // offset 0x638, size 0xc0
    client_header client;
    // offset 0x6f8, size 0x20
    int timeout;
    // offset 0x718, size 0x20
    int dashboard;
    // offset 0x738, size 0x20
    int finished;
}

