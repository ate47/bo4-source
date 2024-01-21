begin "hash_72b8417613fa70a2";
version 1;
metatable "hash_a632a545122a0861";

struct root {
    hash_50c145a54b47885b info;
    match_header match;
    telemetry_header telemetry;
    hash_30f7ad403990942a circles[100];
    client_header client;
};

struct hash_50c145a54b47885b {
    char hash_7b5a4ea140ea26ea[16];
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

struct hash_30f7ad403990942a {
    int32 index;
    float origin_x;
    float origin_y;
    uint32 radius;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


