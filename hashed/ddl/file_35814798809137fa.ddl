begin "hash_35814798809137fa";
version 14;
metatable "hash_25a84c54fa367c30";

struct root {
    match_header match;
    float x_pos;
    float y_pos;
    float z_pos;
    int32 total_spawns;
    telemetry_header telemetry;
    int32 hash_2cc900b0bc4d19a2;
    char hash_546cb9d1bff52769[32];
    int32 hash_35111fd969edd4ce;
    int32 beacon_id;
    int32 gametime;
    client_header client;
    bit hash_61f0f358f0c8f424;
    bit hash_1a7441b0974c55df;
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


