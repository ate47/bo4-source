// hash_410a4e25a5c411fb
// metatable "hash_33a2006d08c2a364"

version 6 {
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

    // idx 0 members 26 size 0x5e0
    // offset 0x0, size 0x10
    uint:16 end_health;
    // offset 0x10, size 0xc0
    match_header match;
    // offset 0xd0, size 0x10
    uint:16 passenger_kills;
    // offset 0xe0, size 0x40
    xhash vehicle;
    // offset 0x120, size 0x40
    uint64 player_xuid;
    // offset 0x160, size 0x10
    uint:16 hash_576e854d5397d59e;
    // offset 0x170, size 0x10
    uint:16 hash_27d7493da1ae3b08;
    // offset 0x180, size 0x1f8
    telemetry_header telemetry;
    // offset 0x378, size 0x10
    uint:16 vehicle_kills;
    // offset 0x388, size 0x20
    uint end_time;
    // offset 0x3a8, size 0x20
    float hash_6373313e132d49b8;
    // offset 0x3c8, size 0x20
    float hash_6373323e132d4b6b;
    // offset 0x3e8, size 0x10
    uint:16 hash_1f6f99c615ebe865;
    // offset 0x3f8, size 0x10
    uint:16 hash_7410c2f4f7747523;
    // offset 0x408, size 0x10
    uint:16 hash_4b78f4ca0c0dd281;
    // offset 0x418, size 0x20
    uint start_time;
    // offset 0x438, size 0x8
    byte hash_b165f7ced53ebf6;
    // offset 0x440, size 0x20
    float hash_4b57cd6a0164c365;
    // offset 0x460, size 0x20
    float hash_4b57cc6a0164c1b2;
    // offset 0x480, size 0x10
    uint:16 hash_493b0b37aa073d11;
    // offset 0x490, size 0x10
    uint:16 hash_4c4e7e6968f548cd;
    // offset 0x4a0, size 0x20
    uint hash_2da568278a84a90d;
    // offset 0x4c0, size 0xc0
    client_header client;
    // offset 0x580, size 0x10
    uint:16 hash_2ade526a94b004f;
    // offset 0x590, size 0x10
    uint:16 start_health;
    // offset 0x5a0, size 0x40
    uint64 first_player;
}

