begin "hash_5a5b0569a2b85dda";
version 3;
metatable "hash_84ab01c5bced8c5a";

struct root {
    telemetry_header telemetry;
    char interaction_type[16];
    char language[24];
    client_header client;
    uint64 hash_13a1a70556201a2d;
    char hash_43c83260dd96c90c[32];
    byte hash_31a5d51248a1d2c;
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


