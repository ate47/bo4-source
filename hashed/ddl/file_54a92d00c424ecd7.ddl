begin "hash_54a92d00c424ecd7";
version 5;
metatable "hash_bf2409ffa78211fe";

struct root {
    match_header match;
    double dropped_item;
    uint64 player_xuid;
    int32 hash_68d91dfcdbefec92;
    telemetry_header telemetry;
    int32 hash_1c152c8ca72a09ff;
    int32 game_time;
    double hash_9f47aa57c2ba8ec;
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


