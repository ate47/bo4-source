// hash_4b183a2e9966c878
// metatable "hash_d2de2434185074f8"

version 2 {
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

    // idx 1 members 6
    enum hash_444b6eb55bc9535 {
        join_type_friend, // 0x0,
        join_type_playlist, // 0x1,
        join_type_normal, // 0x2,
        join_type_invite, // 0x3,
        join_type_groups, // 0x4,
        join_type_party, // 0x5
    };

    // idx 2 members 4
    enum hash_405641015bd81f7d {
        xonline_nat_unknown, // 0x0,
        xonline_nat_open, // 0x1,
        xonline_nat_strict, // 0x2,
        xonline_nat_moderate, // 0x3
    };

    // idx 0 members 14 size 0x4b0
    // offset 0x0, size 0x20
    int party_size;
    // offset 0x20, size 0x1f8
    telemetry_header telemetry;
    // offset 0x218, size 0x20
    int hash_2dc6184a8ee2b80b;
    // offset 0x238, size 0x20
    int hash_1e6cbdb3e41597ac;
    // offset 0x258, size 0xc0
    string(24) join_state;
    // offset 0x318, size 0x20
    int hash_607616ff980b70cb;
    // offset 0x338, size 0x8
    hash_405641015bd81f7d nat_type;
    // offset 0x340, size 0xc0
    client_header client;
    // offset 0x400, size 0x40
    uint64 host_xuid;
    // offset 0x440, size 0x8
    hash_444b6eb55bc9535 join_type;
    // offset 0x448, size 0x40
    string(8) hash_5aad3c28269ed622;
    // offset 0x488, size 0x20
    int hash_1a1a1855f4dcf27c;
    // offset 0x4a8, size 0x1
    bool hash_5a10df4d02164354;
    // offset 0x4a9, size 0x7
    uint:1 __pad[7];
}

