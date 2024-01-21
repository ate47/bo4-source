begin "hash_1f954cc8c851fd7b";
version 12;
metatable "hash_4721bd2c5ff30348";

struct root {
    int8 cache_type;
    telemetry_header telemetry;
    uint32 hash_d8aa2e4dacb3cc7;
    short blocks_used;
    short hash_4a365bb0b8c5d249;
    short files_used;
    client_header client;
    uint64 hash_3fc45002885726b9;
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


