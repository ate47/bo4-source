// hash_78215c802e31884f
// metatable "hash_6efa6e0e4d624443"

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

    // idx 3 members 4 size 0x68
    struct hash_4faa964964a05e35 {
        // offset 0x0, size 0x20
        int hash_6000a3f7b99ebc4b;
        // offset 0x20, size 0x20
        uint hash_fc6534eb8b0b9e5;
        // offset 0x40, size 0x8
        int:8 result;
        // offset 0x48, size 0x20
        uint duration_ms;
    };

    // idx 4 members 2 size 0x30
    struct hash_2f7ae21344d86dba {
        // offset 0x0, size 0x20
        uint hash_585f73b9a8dbaec2;
        // offset 0x20, size 0x10
        uint:16 hash_1a03a43c6642e4d6;
    };

    // idx 5 members 3 size 0x140
    struct hash_6b847dfe653f9716 {
        // offset 0x0, size 0x20
        uint addr;
        // offset 0x20, size 0x20
        uint hash_5327ec0dac3839c4;
        // offset 0x40, size 0x100
        string(32) hostname;
    };

    // idx 6 members 5 size 0x120
    struct hash_6a65101a136eab93 {
        // offset 0x0, size 0x40
        uint64 hash_6bdd7ebe59310aa2;
        // offset 0x40, size 0x40
        uint64 lobby_id;
        // offset 0x80, size 0x20
        uint title_id;
        // offset 0xa0, size 0x40
        uint64 hash_426fb7404d1fbf32;
        // offset 0xe0, size 0x40
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

    // idx 0 members 6 size 0xfc0
    // offset 0x0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x1f8, size 0xa00
    hash_6b847dfe653f9716 hash_1fa61848c108ccd[8];
    // offset 0xbf8, size 0x180
    hash_2f7ae21344d86dba hash_277e88224edc9564[8];
    // offset 0xd78, size 0xc0
    client_header client;
    // offset 0xe38, size 0x120
    hash_6a65101a136eab93 header;
    // offset 0xf58, size 0x68
    hash_4faa964964a05e35 hash_78a43a2161d0c844;
}

