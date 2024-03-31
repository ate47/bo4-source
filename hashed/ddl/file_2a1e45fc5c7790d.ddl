begin "hash_2a1e45fc5c7790d";
version 9;
metatable "hash_c62df902ecb6a331";

struct root {
    int32 posx;
    int32 posy;
    int32 posz;
    match_header match;
    float score;
    telemetry_header telemetry;
    int32 hash_666d0cfcf9ae78ae;
    int32 hash_25d3bd75c4d8cf82;
    int32 spawnpointid;
    client_header client;
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


