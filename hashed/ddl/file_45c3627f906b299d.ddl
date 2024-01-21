begin "hash_45c3627f906b299d";
version 1;
metatable "hash_a234babe5aa2f686";

struct root {
    match_header match;
    int32 hash_615bd5fc3b89f61d;
    telemetry_header telemetry;
    int32 hash_38677b67d4221a8;
    int32 hash_73b532ab11525ffe;
    int32 duration;
    client_header client;
    hash content_targeted;
    bit hack_success;
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


