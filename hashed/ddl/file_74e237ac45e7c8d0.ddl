begin "hash_74e237ac45e7c8d0";
version 2;
metatable "hash_6817a655cdd07fa1";

struct root {
    int32 id;
    char vm[32];
    char error[4096];
    match_header match;
    telemetry_header telemetry;
    int32 changelist;
    client_header client;
    hash_61d8fb71b3cca1df session_mode;
};

enum hash_61d8fb71b3cca1df {
    "mode_invalid" = 0x0,
    "mode_campaign" = 0x1,
    "mode_multiplayer" = 0x2,
    "mode_warzone" = 0x3,
    "mode_zombies" = 0x4
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
};

struct telemetry_header {
    int32 changelist_number;
    uint16 source_version;
    hash action_type;
    hash_54196e9e9860f0be platform;
    char build_version[32];
    uint32 title_id;
    uint32 hash_56a1b6d783aa7a25;
    uint64 hash_f2ad74d8edb8204;
};

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


