begin "hash_6d70113ed53a25a9";
version 2;
metatable "hash_59e070c81225284d";

struct root {
    uint16 hits;
    float longest_hit_distance;
    uint16 kills;
    match_header match;
    uint16 shots;
    telemetry_header telemetry;
    uint32 time_used_s;
    hash reticle;
    client_header client;
    hash weapon;
    hash attachment1;
    hash attachment2;
    hash attachment3;
    hash attachment4;
    hash attachment5;
    hash attachment6;
    hash attachment7;
    uint16 headshots;
    bit died;
    padbit __pad[7];
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


