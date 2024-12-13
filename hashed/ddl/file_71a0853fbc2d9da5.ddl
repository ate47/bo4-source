// hash_71a0853fbc2d9da5
// metatable "hash_18c9fd6de544422"

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

    // idx 0 members 22 size 0x848
    // offset 0x0, size 0x40
    xhash name;
    // offset 0x40, size 0x20
    int time;
    // offset 0x60, size 0xc0
    match_header match;
    // offset 0x120, size 0x8
    byte round;
    // offset 0x128, size 0x10
    short mainclientnum;
    // offset 0x138, size 0x1f8
    telemetry_header telemetry;
    // offset 0x330, size 0x20
    int inflictorentnum;
    // offset 0x350, size 0x10
    short otherclientnum;
    // offset 0x360, size 0x40
    xhash event_info;
    // offset 0x3a0, size 0x20
    int infoindex;
    // offset 0x3c0, size 0x20
    int inflictorenttype;
    // offset 0x3e0, size 0x20
    int info_id;
    // offset 0x400, size 0x20
    float scoremultiplier;
    // offset 0x420, size 0x20
    int tableindex;
    // offset 0x440, size 0x20
    float scoreaddition;
    // offset 0x460, size 0xc0
    client_header client;
    // offset 0x520, size 0x20
    int scoreeventpriority;
    // offset 0x540, size 0x180
    string(48) hash_72fd8192928b978d;
    // offset 0x6c0, size 0x180
    string(48) hash_4ecd2e74910a3344;
    // offset 0x840, size 0x1
    bool isfirstperson;
    // offset 0x841, size 0x1
    bool overrideentitycamera;
    // offset 0x842, size 0x6
    uint:1 __pad[6];
}

