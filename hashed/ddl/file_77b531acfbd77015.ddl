begin "hash_77b531acfbd77015";
version 16;
metatable "hash_92776066f0257f0e";

struct root {
    hash_2b62ba8b8dc70ad4 test;
    telemetry_header telemetry;
    client_header client;
};

struct hash_2b62ba8b8dc70ad4 {
    float float;
    short int16;
    int32 int32;
    byte uint8;
    char string[8];
    uint32 uint32;
    uint64 uint64;
    bit bool;
    padbit __pad[7];
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


