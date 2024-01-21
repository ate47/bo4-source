begin "hash_2d1e3b2219d30f6b";
version 10;
metatable "hash_fda9bcd69ef71db7";

struct root {
    char label[16];
    match_header match;
    byte round;
    telemetry_header telemetry;
    float hash_3aa6594a2fe3f262;
    uint32 hash_6634e2218515500f;
    client_header client;
    bit gametime;
    bit hash_25e051da1b8b457d;
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


