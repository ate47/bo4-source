// hash_41a1311d056f4804
// metatable "hash_821c1437738de93b"

version 17 {
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

    // idx 0 members 15 size 0xc68
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x8
    byte round;
    // offset 0xc8, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2c0, size 0x20
    int infoindex;
    // offset 0x2e0, size 0x10
    uint:16 occurrencecount;
    // offset 0x2f0, size 0x20
    int info_id;
    // offset 0x310, size 0x20
    int starttime;
    // offset 0x330, size 0x20
    int duration;
    // offset 0x350, size 0x10
    short clientnum;
    // offset 0x360, size 0x20
    int endtime;
    // offset 0x380, size 0xc0
    client_header client;
    // offset 0x440, size 0x800
    string(256) killcamparams;
    // offset 0xc40, size 0x20
    int priority;
    // offset 0xc60, size 0x1
    bool isfirstperson;
    // offset 0xc61, size 0x7
    uint:1 __pad[7];
}

