// hash_a285c93abbf5d9
// metatable "hash_864648d7bb66235f"

version 3 {
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

    // idx 3 members 18 size 0xe98
    struct hash_2f1c32e28bcd6a46 {
        // offset 0x0, size 0x40
        uint64 hash_7a4b7f92d7e1dc7b;
        // offset 0x40, size 0x40
        uint64 hash_68c4483fed6cf75e;
        // offset 0x80, size 0x40
        uint64 hash_740d73d751cf7979;
        // offset 0xc0, size 0x40
        uint64 hash_4c2f2b7a55fd35a8;
        // offset 0x100, size 0x8
        byte hash_49bf5522e36c4ff6;
        // offset 0x108, size 0x400
        string(128) process_name;
        // offset 0x508, size 0x40
        uint64 hash_2b50577fe93b2256;
        // offset 0x548, size 0x20
        int hash_669ca7a9de06f403;
        // offset 0x568, size 0x8
        byte hash_43081cc1b79588f9;
        // offset 0x570, size 0x20
        int hash_4e650e9c822cb0ce;
        // offset 0x590, size 0x40
        uint64 hash_438c4b6c6afd6185;
        // offset 0x5d0, size 0x20
        int hash_7d8e410d4a2c6050;
        // offset 0x5f0, size 0x40
        uint64 hash_fe1bb65e8de4d51;
        // offset 0x630, size 0x20
        int hash_2459c7bb3080c37f;
        // offset 0x650, size 0x800
        string(256) extra_msg;
        // offset 0xe50, size 0x40
        uint64 hash_7e014c3bec12cc14;
        // offset 0xe90, size 0x1
        bool hash_5b950829c03b3406;
        // offset 0xe91, size 0x7
        uint:1 __pad[7];
    };

    // idx 4 members 5 size 0x428
    struct hash_163fd421f805deef {
        // offset 0x0, size 0x20
        uint action_id;
        // offset 0x20, size 0x200
        string(64) next_name;
        // offset 0x220, size 0x200
        string(64) action_name;
        // offset 0x420, size 0x1
        bool hash_273dfb188de1a27d;
        // offset 0x421, size 0x7
        uint:1 __pad[7];
    };

    // idx 5 members 2 size 0x80
    struct hash_26f770aa73f71026 {
        // offset 0x0, size 0x40
        uint64 hash_79cac019c120269b;
        // offset 0x40, size 0x40
        uint64 hash_7faaf5ed10257a8a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 5 size 0xbc90
    // offset 0x0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x1f8, size 0xe98
    hash_2f1c32e28bcd6a46 content;
    // offset 0x1090, size 0x500
    hash_26f770aa73f71026 lobby_members[10];
    // offset 0x1590, size 0xc0
    client_header client;
    // offset 0x1650, size 0xa640
    hash_163fd421f805deef actions[40];
}

