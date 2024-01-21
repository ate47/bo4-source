begin "hash_2f381b540d0d842e";
version 13;
metatable "hash_f9a9b579543779ca";

struct root {
    char name[48];
    match_header match;
    int32 score;
    float skill;
    int32 time_played;
    telemetry_header telemetry;
    float hash_bcaf6f75977e7fd;
    short clientnum;
    float hash_643bb973cf7657ad;
    client_header client;
    float variance;
    float hash_7f882efce9a0e3db;
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


