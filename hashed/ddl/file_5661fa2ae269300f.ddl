begin "hash_5661fa2ae269300f";
version 9;
metatable "hash_43666ca8154e52da";

struct root {
    uint64 uid;
    int32 time;
    match_header match;
    int32 packetsize;
    int32 maxclients;
    int32 numclients;
    telemetry_header telemetry;
    char playername[48];
    client_header client;
    uint64 fileid;
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


