begin "hash_2fd401e13f84dbe0";
version 9;
metatable "hash_c48b34ae2565a930";

struct root {
    string pool;
    match_header match;
    string stack;
    telemetry_header telemetry;
    int32 hash_717606193abf3b46;
    short hash_44b60fa51ab054e6;
    int32 hash_5d9319d04e791326;
    int32 hash_656da5f7514baf39;
    string hash_48aa6d0eef0bd470;
    client_header client;
    int32 hash_63dcf3f7c968b4e0;
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
};

struct telemetry_header {
    int32 changelist_number;
    uint16 source_version;
    double action_type;
    hash_54196e9e9860f0be platform;
    string build_version;
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


