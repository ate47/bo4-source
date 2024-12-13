// hash_f0755b53aaf452c
// metatable "hash_88571f7a2e27aa7d"

version 12 {
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

    // idx 0 members 21 size 0xb88
    // offset 0x0, size 0x200
    string(64) eventname;
    // offset 0x200, size 0x20
    int kills;
    // offset 0x220, size 0xc0
    match_header match;
    // offset 0x2e0, size 0x8
    byte roundnumber;
    // offset 0x2e8, size 0x200
    string(64) zone_name;
    // offset 0x4e8, size 0x1f8
    telemetry_header telemetry;
    // offset 0x6e0, size 0x20
    int currentscore;
    // offset 0x700, size 0x20
    int spawnid;
    // offset 0x720, size 0x20
    int gametime;
    // offset 0x740, size 0xc0
    client_header client;
    // offset 0x800, size 0x20
    int health;
    // offset 0x820, size 0x20
    float originx;
    // offset 0x840, size 0x20
    float originy;
    // offset 0x860, size 0x20
    float originz;
    // offset 0x880, size 0x40
    xhash currentweapon;
    // offset 0x8c0, size 0x20
    int totalscore;
    // offset 0x8e0, size 0x100
    string(32) sessionstate;
    // offset 0x9e0, size 0x20
    int beastlives;
    // offset 0xa00, size 0x180
    string(48) username;
    // offset 0xb80, size 0x1
    bool beastmodeon;
    // offset 0xb81, size 0x7
    uint:1 __pad[7];
}

