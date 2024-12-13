// hash_b8d2d9b2c5e6bc5
// metatable "hash_e7b8f2d26d55949a"

version 13 {
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

    // idx 0 members 36 size 0x1d60
    // offset 0x0, size 0x20
    int death;
    // offset 0x20, size 0x20
    int downs;
    // offset 0x40, size 0xc0
    match_header match;
    // offset 0x100, size 0x8
    byte roundnumber;
    // offset 0x108, size 0x20
    float hash_1ba4099d8a3703bf;
    // offset 0x128, size 0x20
    float victimx;
    // offset 0x148, size 0x20
    float victimy;
    // offset 0x168, size 0x20
    float victimz;
    // offset 0x188, size 0x20
    int hash_7784f69a7e55c413;
    // offset 0x1a8, size 0x20
    int hash_4ef1f8ab05b78716;
    // offset 0x1c8, size 0x1f8
    telemetry_header telemetry;
    // offset 0x3c0, size 0x180
    string(48) attackername;
    // offset 0x540, size 0x200
    string(64) attackertype;
    // offset 0x740, size 0x20
    float hash_398bbe7d23bcf3e0;
    // offset 0x760, size 0x20
    int victimid;
    // offset 0x780, size 0x180
    string(48) victimname;
    // offset 0x900, size 0x200
    string(64) victimtype;
    // offset 0xb00, size 0x200
    string(64) hash_2ce4c96c3885dfc0;
    // offset 0xd00, size 0x200
    string(64) hash_37d6ea7634d791c8;
    // offset 0xf00, size 0x400
    string(128) hash_61881c780627994;
    // offset 0x1300, size 0x20
    int hash_ffaf801a3faf28d;
    // offset 0x1320, size 0x40
    xhash attackerweapon;
    // offset 0x1360, size 0x20
    float hash_4c541ec98f6eba67;
    // offset 0x1380, size 0x400
    string(128) hash_dfcd811ffe0e8c3;
    // offset 0x1780, size 0x200
    string(64) damagelocation;
    // offset 0x1980, size 0x20
    int attackerid;
    // offset 0x19a0, size 0x20
    float hash_17853fb07037fe5c;
    // offset 0x19c0, size 0x200
    string(64) damagetype;
    // offset 0x1bc0, size 0x20
    int gametime;
    // offset 0x1be0, size 0xc0
    client_header client;
    // offset 0x1ca0, size 0x20
    int damage;
    // offset 0x1cc0, size 0x20
    int downed;
    // offset 0x1ce0, size 0x20
    float attackerx;
    // offset 0x1d00, size 0x20
    float attackery;
    // offset 0x1d20, size 0x20
    float attackerz;
    // offset 0x1d40, size 0x20
    int hash_399761c967ceaa26;
}

