// hash_5eaff5160535a257
// metatable "hash_132da978281e107b"

version 10 {
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

    // idx 4 members 22 size 0xa10
    struct hash_3ad855a8b01f1a72 {
        // offset 0x0, size 0x40
        uint64 hash_529f1b2656189232;
        // offset 0x40, size 0x180
        string(48) hash_3bca0a9c8f341c79;
        // offset 0x1c0, size 0x40
        uint64 hash_238a1943270a668e;
        // offset 0x200, size 0x40
        uint64 hash_274f4160f246b900;
        // offset 0x240, size 0x8
        hash_745a9340fca86465 hash_3d6dceb705c92439;
        // offset 0x248, size 0x180
        string(48) hash_296aeed34055c468;
        // offset 0x3c8, size 0x40
        uint64 hash_204f262b1f3b8ccf;
        // offset 0x408, size 0x40
        uint64 hash_522c2d85063ec515;
        // offset 0x448, size 0x40
        uint64 hash_300f7cbb339f0026;
        // offset 0x488, size 0x40
        uint64 lobby_id;
        // offset 0x4c8, size 0x40
        uint64 hash_573a96edffbd3a8e;
        // offset 0x508, size 0x2e0
        string(92) hash_7a177695ffbdbbbf;
        // offset 0x7e8, size 0x20
        int playlist_id;
        // offset 0x808, size 0x40
        uint64 hash_56a1b6d783aa7a25;
        // offset 0x848, size 0x20
        int playlist_version;
        // offset 0x868, size 0x40
        uint64 hash_4f2f10801676ac78;
        // offset 0x8a8, size 0x20
        uint hash_623fd292cbf4dd16;
        // offset 0x8c8, size 0x20
        int ffotd_version;
        // offset 0x8e8, size 0x20
        int hash_72623ba80a26ad5a;
        // offset 0x908, size 0x100
        string(32) hash_5e523aef49ce7554;
        // offset 0xa08, size 0x1
        bool is_dedi;
        // offset 0xa09, size 0x7
        uint:1 __pad[7];
    };

    // idx 5 members 3 size 0xc0
    struct hash_38be2d6023bb72b1 {
        // offset 0x0, size 0x40
        uint64 hash_26fcf92f9ee7fc5;
        // offset 0x40, size 0x40
        uint64 hash_4fd83cafec6d041d;
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

    // idx 1 members 3
    enum hash_745a9340fca86465 {
        hash_2154483008068688, // 0x0,
        game_start, // 0x1,
        hash_6a20f1f681a1a426, // 0x2
    };

    // idx 0 members 5 size 0x3308
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2b8, size 0xa10
    hash_3ad855a8b01f1a72 hash_637a0a0969aaeb3b;
    // offset 0xcc8, size 0x2580
    hash_38be2d6023bb72b1 lobby_members[50];
    // offset 0x3248, size 0xc0
    client_header client;
}

