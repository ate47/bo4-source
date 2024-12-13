// hash_2b41534c36d68503
// metatable "hash_466f3dffc01cfda"

version 5 {
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

    // idx 0 members 6 size 0x86c0
    // offset 0x0, size 0x400
    string(128) hash_e37a9bd0a563f60;
    // offset 0x400, size 0x1f8
    telemetry_header telemetry;
    // offset 0x5f8, size 0x8000
    string(4096) hash_1d210b6104a343a1;
    // offset 0x85f8, size 0xc0
    client_header client;
    // offset 0x86b8, size 0x1
    bool hash_134729ff9a8823cc;
    // offset 0x86b9, size 0x7
    uint:1 __pad[7];
}

