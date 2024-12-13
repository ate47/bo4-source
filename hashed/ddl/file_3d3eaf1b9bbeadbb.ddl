// hash_3d3eaf1b9bbeadbb
// metatable "hash_cf53ff34d81c9f2a"

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

    // idx 4 members 18 size 0x3d0
    struct hash_5e61b013683f3eba {
        // offset 0x0, size 0x40
        uint64 hash_4c352a5202cdd23f;
        // offset 0x40, size 0x40
        uint64 hash_248adccf3c622adc;
        // offset 0x80, size 0x40
        uint64 hash_46838162d06a1e0d;
        // offset 0xc0, size 0x20
        int reason_left;
        // offset 0xe0, size 0x40
        uint64 hash_391c576ac028696a;
        // offset 0x120, size 0x40
        uint64 hash_522c2d85063ec515;
        // offset 0x160, size 0x40
        uint64 hash_2b4a32e71c22452;
        // offset 0x1a0, size 0x40
        uint64 hash_300f7cbb339f0026;
        // offset 0x1e0, size 0x20
        int playlist_id;
        // offset 0x200, size 0x40
        uint64 hash_56a1b6d783aa7a25;
        // offset 0x240, size 0x20
        int playlist_version;
        // offset 0x260, size 0x20
        int ffotd_version;
        // offset 0x280, size 0x40
        uint64 hash_5adcb2e00ec9eab1;
        // offset 0x2c0, size 0x100
        string(32) hash_5e523aef49ce7554;
        // offset 0x3c0, size 0x8
        int:8 hash_22bebb24c7131b96;
        // offset 0x3c8, size 0x1
        bool hash_329a52ffc78a973;
        // offset 0x3c9, size 0x1
        bool is_dedi;
        // offset 0x3ca, size 0x6
        uint:1 __pad[6];
    };

    // idx 5 members 3 size 0xc0
    struct hash_3754ae573cf9924d {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x40
        uint64 hash_1d1bf732b0333b59;
        // offset 0x80, size 0x40
        uint64 hash_70f1765710df7771;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 6 size 0xfc8
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x780
    hash_3754ae573cf9924d party_members[10];
    // offset 0x840, size 0x1f8
    telemetry_header telemetry;
    // offset 0xa38, size 0x3d0
    hash_5e61b013683f3eba hash_326402d544e6c4a7;
    // offset 0xe08, size 0xc0
    client_header client;
    // offset 0xec8, size 0x100
    string(32) hash_7bf9daccc9b256dd;
}

