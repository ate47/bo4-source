// hash_578dbeaea88dfab1
// metatable "hash_c06e67528eb3a05"

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

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 24 size 0xa60
    // offset 0x0, size 0x40
    uint64 xuid;
    // offset 0x40, size 0x20
    int skill;
    // offset 0x60, size 0x20
    int hash_671438d91ee14a83;
    // offset 0x80, size 0x1f8
    telemetry_header telemetry;
    // offset 0x278, size 0x40
    uint64 hash_34f06c6eeda8117e;
    // offset 0x2b8, size 0x20
    int hash_3c83aaf4b52386c5;
    // offset 0x2d8, size 0xc0
    client_header client;
    // offset 0x398, size 0x20
    int protocol;
    // offset 0x3b8, size 0x100
    string(32) status;
    // offset 0x4b8, size 0x200
    string(64) hash_70259f4fbb3f7a05;
    // offset 0x6b8, size 0x40
    uint64 host_xuid;
    // offset 0x6f8, size 0x20
    int hash_3155d04edc797a1a;
    // offset 0x718, size 0x180
    string(48) hash_1531894bfd7141d0;
    // offset 0x898, size 0x20
    int largest_party;
    // offset 0x8b8, size 0x20
    int latency;
    // offset 0x8d8, size 0x180
    string(48) hash_df1f57dcd0a3e0a;
    // offset 0xa58, size 0x1
    bool is_mp;
    // offset 0xa59, size 0x1
    bool is_migrating;
    // offset 0xa5a, size 0x1
    bool hash_460665ebc12305d7;
    // offset 0xa5b, size 0x1
    bool hash_756c01933e1c7b2e;
    // offset 0xa5c, size 0x1
    bool valid_result;
    // offset 0xa5d, size 0x1
    bool hash_60ff95c0713324a4;
    // offset 0xa5e, size 0x1
    bool is_dedicated;
    // offset 0xa5f, size 0x1
    uint:1 __pad[1];
}

