begin "hash_6f304abdc9a173cc";
version 11;
metatable "hash_6c1ee65a47f719f4";

struct root {
    uint32 slots_used;
    telemetry_header telemetry;
    char operation[16];
    char hash_65c19815194e5a8e[48];
    char assets_used[48];
    uint32 duration;
    client_header client;
    int32 weapon_id;
    uint32 total_slots;
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


