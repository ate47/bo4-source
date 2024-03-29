begin "hash_28ea368e119ae00e";
version 2;
metatable "hash_9039e41efc2c30de";

struct root {
    match_header match;
    telemetry_header telemetry;
    hash_46af543d8064bf16 entries[100];
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

struct hash_46af543d8064bf16 {
    hash type;
    float pos_x;
    float pos_y;
    float pos_z;
    byte state;
    byte hash_4cc74f774380b24c;
    bit used;
    bit hash_26e73fc143c6226c;
    padbit __pad[6];
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


