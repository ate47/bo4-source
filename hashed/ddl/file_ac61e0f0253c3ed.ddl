begin "hash_ac61e0f0253c3ed";
version 9;
metatable "hash_2c8fcd9d06c08499";

struct root {
    match_header match;
    int32 version;
    int32 hash_7196f8e148297af1;
    telemetry_header telemetry;
    char mapname[32];
    hash_54196e9e9860f0be platform;
    char gametype[24];
    int32 hash_7c1ff8b3178dee8;
    int32 hash_1e200cc69558d210;
    float hash_765ed95f600a8290;
    client_header client;
    int32 hash_4194f71be4b437a4;
    int32 hash_6821df3afc5a0212;
    char hostname[32];
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
};

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
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

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


