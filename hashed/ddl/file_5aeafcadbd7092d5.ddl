// hash_5aeafcadbd7092d5
// metatable "hash_e149b3729d15cff0"

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

    // idx 0 members 23 size 0xa78
    // offset 0x0, size 0x20
    int hits;
    // offset 0x20, size 0x100
    string(32) eventtype;
    // offset 0x120, size 0x20
    int downs;
    // offset 0x140, size 0x20
    int kills;
    // offset 0x160, size 0xc0
    match_header match;
    // offset 0x220, size 0x20
    int score;
    // offset 0x240, size 0x1f8
    telemetry_header telemetry;
    // offset 0x438, size 0x20
    int revives;
    // offset 0x458, size 0x180
    string(48) hash_31b0eec8407015dc;
    // offset 0x5d8, size 0x100
    string(32) difficulty;
    // offset 0x6d8, size 0x20
    int spawnid;
    // offset 0x6f8, size 0x20
    int suicides;
    // offset 0x718, size 0x20
    int gametime;
    // offset 0x738, size 0xc0
    client_header client;
    // offset 0x7f8, size 0x20
    int deaths;
    // offset 0x818, size 0x20
    float playerx;
    // offset 0x838, size 0x20
    float playery;
    // offset 0x858, size 0x20
    float playerz;
    // offset 0x878, size 0x20
    int shotshit;
    // offset 0x898, size 0x180
    string(48) username;
    // offset 0xa18, size 0x20
    int headshots;
    // offset 0xa38, size 0x20
    int deathcount;
    // offset 0xa58, size 0x20
    int shotsmissed;
}

