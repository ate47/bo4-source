// hash_10d8671cb4c8d542
// metatable "hash_41e4dc91c18b4b41"

version 9 {
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

    // idx 1 members 5
    enum hash_61d8fb71b3cca1df {
        mode_invalid, // 0x0,
        mode_campaign, // 0x1,
        mode_multiplayer, // 0x2,
        mode_warzone, // 0x3,
        mode_zombies, // 0x4
    };

    // idx 0 members 35 size 0x9550
    // offset 0x0, size 0x40
    string(8) bbid;
    // offset 0x40, size 0x40
    uint64 xuid;
    // offset 0x80, size 0xc0
    match_header match;
    // offset 0x140, size 0x100
    string(32) platform_type;
    // offset 0x240, size 0x40
    xhash playlistname;
    // offset 0x280, size 0x8
    byte controller;
    // offset 0x288, size 0x1f8
    telemetry_header telemetry;
    // offset 0x480, size 0x180
    string(48) mapname;
    // offset 0x600, size 0x8000
    string(4096) cmdline;
    // offset 0x8600, size 0x40
    xhash game_type;
    // offset 0x8640, size 0x20
    int buildversion;
    // offset 0x8660, size 0x80
    string(16) platform;
    // offset 0x86e0, size 0x20
    int playlist;
    // offset 0x8700, size 0x100
    string(32) clientplatform;
    // offset 0x8800, size 0x20
    int changelist;
    // offset 0x8820, size 0x200
    string(64) buildmachine;
    // offset 0x8a20, size 0x40
    uint64 dwconnectionid;
    // offset 0x8a60, size 0x200
    string(64) buildconfig;
    // offset 0x8c60, size 0x200
    string(64) buildname;
    // offset 0x8e60, size 0x40
    uint64 hash_5556d5bd3d3acbdf;
    // offset 0x8ea0, size 0xc0
    client_header client;
    // offset 0x8f60, size 0x8
    hash_61d8fb71b3cca1df session_mode;
    // offset 0x8f68, size 0x20
    uint sessionindex;
    // offset 0x8f88, size 0x200
    string(64) buildtimestamp;
    // offset 0x9188, size 0x40
    uint64 hash_3e742dae20399313;
    // offset 0x91c8, size 0x200
    string(64) hostname;
    // offset 0x93c8, size 0x180
    string(48) username;
    // offset 0x9548, size 0x1
    bool hash_27f986f9f86c15ef;
    // offset 0x9549, size 0x1
    bool isdedicated;
    // offset 0x954a, size 0x1
    bool hash_2a6477485c88d7e9;
    // offset 0x954b, size 0x1
    bool isranked;
    // offset 0x954c, size 0x1
    bool isserver;
    // offset 0x954d, size 0x1
    bool isguest;
    // offset 0x954e, size 0x1
    bool is_hdr;
    // offset 0x954f, size 0x1
    bool hash_326518fcfc54ec7c;
}

