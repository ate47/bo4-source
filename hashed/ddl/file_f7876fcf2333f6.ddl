begin "hash_f7876fcf2333f6";
version 9;
metatable "hash_1c6f62f5cc824950";

struct root {
    match_header match;
    telemetry_header telemetry;
    char notificationtype[32];
    int32 spawnid;
    int32 gametime;
    char spawnidtype[64];
    client_header client;
    float locationx;
    float locationy;
    float locationz;
    char spawntype[64];
    char username[48];
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


