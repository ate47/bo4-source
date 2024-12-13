// hash_d3529ef5be3d336
// metatable "hash_cdd37c9d3f4c874d"

version 20 {
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

    // idx 3 members 11 size 0x1e0
    struct hash_14a1982625e12d94 {
        // offset 0x0, size 0x20
        uint count;
        // offset 0x20, size 0x40
        xhash event;
        // offset 0x60, size 0x20
        uint hash_68b893b417cabcd1;
        // offset 0x80, size 0x40
        xhash channel;
        // offset 0xc0, size 0x20
        float hash_2ca14d840c70e2ed;
        // offset 0xe0, size 0x20
        uint hash_533194284a1f0466;
        // offset 0x100, size 0x40
        xhash endpoint;
        // offset 0x140, size 0x20
        float hash_3f2c69f19f5de63;
        // offset 0x160, size 0x20
        uint hash_395e5afdcea60aec;
        // offset 0x180, size 0x20
        float hash_472094a294ebb9e2;
        // offset 0x1a0, size 0x40
        xhash serializer;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 3 size 0xf2b8
    // offset 0x0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x1f8, size 0xc0
    client_header client;
    // offset 0x2b8, size 0xf000
    hash_14a1982625e12d94 metric[128];
}

