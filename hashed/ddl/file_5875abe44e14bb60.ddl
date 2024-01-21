begin "hash_5875abe44e14bb60";
version 9;
metatable "hash_39ebeebf6dbfdb17";

struct root {
    match_header match;
    int32 score;
    int32 shape;
    int32 maxcount;
    telemetry_header telemetry;
    int32 evaluation;
    char description[64];
    client_header client;
    float timeout;
    int32 hash_7ba2635f63e1aa23;
    float length;
    int32 falloff;
    float radius;
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


