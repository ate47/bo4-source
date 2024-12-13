// hash_1c74916126d48e5a
// metatable "hash_2d7f7180db28e3cc"

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

    // idx 3 members 3 size 0x240
    struct hash_66d752d9db62566a {
        // offset 0x0, size 0x20
        int hash_150666bd04ec9147;
        // offset 0x20, size 0x200
        string(64) filename;
        // offset 0x220, size 0x20
        uint filesize;
    };

    // idx 4 members 4 size 0x48
    struct hash_33486934ef3da1df {
        // offset 0x0, size 0x20
        uint hash_1f5a457ca2df8efc;
        // offset 0x20, size 0x20
        uint hash_412519a915c261ba;
        // offset 0x40, size 0x1
        bool hash_58ac2791f8b98dea;
        // offset 0x41, size 0x7
        uint:1 __pad[7];
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 4 size 0x7380
    // offset 0x0, size 0x48
    hash_33486934ef3da1df hash_608be004464944c0;
    // offset 0x48, size 0x1f8
    telemetry_header telemetry;
    // offset 0x240, size 0xc0
    client_header client;
    // offset 0x300, size 0x7080
    hash_66d752d9db62566a hash_5792a9834bd40278[50];
}

