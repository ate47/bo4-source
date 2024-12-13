// hash_6dd8ee6abb6a953f
// metatable "hash_108ba60e5549579f"

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

    // idx 0 members 38 size 0x1d60
    // offset 0x0, size 0x20
    int death;
    // offset 0x20, size 0x20
    int downs;
    // offset 0x40, size 0xc0
    match_header match;
    // offset 0x100, size 0x20
    float hash_1ba4099d8a3703bf;
    // offset 0x120, size 0x20
    float victimx;
    // offset 0x140, size 0x20
    float victimy;
    // offset 0x160, size 0x20
    float victimz;
    // offset 0x180, size 0x20
    int hash_7784f69a7e55c413;
    // offset 0x1a0, size 0x20
    int hash_4ef1f8ab05b78716;
    // offset 0x1c0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x3b8, size 0x180
    string(48) attackername;
    // offset 0x538, size 0x200
    string(64) attackertype;
    // offset 0x738, size 0x20
    float hash_398bbe7d23bcf3e0;
    // offset 0x758, size 0x20
    int victimid;
    // offset 0x778, size 0x180
    string(48) victimname;
    // offset 0x8f8, size 0x200
    string(64) victimtype;
    // offset 0xaf8, size 0x200
    string(64) hash_2ce4c96c3885dfc0;
    // offset 0xcf8, size 0x200
    string(64) hash_37d6ea7634d791c8;
    // offset 0xef8, size 0x400
    string(128) hash_61881c780627994;
    // offset 0x12f8, size 0x20
    int hash_ffaf801a3faf28d;
    // offset 0x1318, size 0x40
    xhash attackerweapon;
    // offset 0x1358, size 0x20
    float hash_4c541ec98f6eba67;
    // offset 0x1378, size 0x400
    string(128) hash_dfcd811ffe0e8c3;
    // offset 0x1778, size 0x200
    string(64) damagelocation;
    // offset 0x1978, size 0x20
    int attackerid;
    // offset 0x1998, size 0x20
    float hash_17853fb07037fe5c;
    // offset 0x19b8, size 0x200
    string(64) damagetype;
    // offset 0x1bb8, size 0x20
    int gametime;
    // offset 0x1bd8, size 0x20
    int attack;
    // offset 0x1bf8, size 0xc0
    client_header client;
    // offset 0x1cb8, size 0x20
    int damage;
    // offset 0x1cd8, size 0x20
    float attackerx;
    // offset 0x1cf8, size 0x20
    float attackery;
    // offset 0x1d18, size 0x20
    float attackerz;
    // offset 0x1d38, size 0x20
    int hash_399761c967ceaa26;
    // offset 0x1d58, size 0x1
    bool victimlaststand;
    // offset 0x1d59, size 0x1
    bool hash_475fb439e2915b56;
    // offset 0x1d5a, size 0x6
    uint:1 __pad[6];
}

