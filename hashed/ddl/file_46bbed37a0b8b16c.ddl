// hash_46bbed37a0b8b16c
// metatable "hash_2f0c0bb5672abd3f"

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

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 23 size 0xce8
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x8
    byte roundnumber;
    // offset 0xc8, size 0x20
    int playerhealth;
    // offset 0xe8, size 0x20
    int playertotalscore;
    // offset 0x108, size 0x200
    string(64) zone_name;
    // offset 0x308, size 0x20
    int playerkills;
    // offset 0x328, size 0x1f8
    telemetry_header telemetry;
    // offset 0x520, size 0x40
    xhash itemname;
    // offset 0x560, size 0x400
    string(128) itemtype;
    // offset 0x960, size 0x20
    float selleroriginx;
    // offset 0x980, size 0x20
    float selleroriginy;
    // offset 0x9a0, size 0x20
    float selleroriginz;
    // offset 0x9c0, size 0x20
    int purchasecost;
    // offset 0x9e0, size 0x20
    int gametime;
    // offset 0xa00, size 0x20
    int playercurrentscore;
    // offset 0xa20, size 0xc0
    client_header client;
    // offset 0xae0, size 0x20
    int playerspawnid;
    // offset 0xb00, size 0x180
    string(48) username;
    // offset 0xc80, size 0x20
    float playeroriginx;
    // offset 0xca0, size 0x20
    float playeroriginy;
    // offset 0xcc0, size 0x20
    float playeroriginz;
    // offset 0xce0, size 0x1
    bool isupgraded;
    // offset 0xce1, size 0x7
    uint:1 __pad[7];
}

