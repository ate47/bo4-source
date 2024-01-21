begin "hash_4a71b0a754cb4cb3";
version 10;
metatable "hash_5ed1c2edbb433bb2";

struct root {
    int32 time;
    match_header match;
    telemetry_header telemetry;
    int32 serverms;
    int32 bytespersecond;
    int32 clienttimediff;
    int32 hash_74c79e4016cb2b3;
    client_header client;
    int32 clientpings;
    bit hash_4ae6291e7e06ff84;
    bit boosting;
    padbit __pad[6];
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


