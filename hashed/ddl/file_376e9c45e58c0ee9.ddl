begin "hash_376e9c45e58c0ee9";
version 1;
metatable "hash_a9f65d9174cb6ac1";

struct root {
    uint16 ekia;
    uint32 score;
    uint64 match_id;
    telemetry_header telemetry;
    client_header client;
    uint16 deaths;
    uint32 damage_dealt;
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


