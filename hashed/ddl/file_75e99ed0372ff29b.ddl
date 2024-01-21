begin "hash_75e99ed0372ff29b";
version 4;
metatable "hash_f83a8258dbee2cf0";

struct root {
    uint64 xuid;
    uint64 match_id;
    telemetry_header telemetry;
    char message[256];
    char offense[32];
    uint64 object_id;
    client_header client;
    char filename[64];
    int32 penalty;
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


