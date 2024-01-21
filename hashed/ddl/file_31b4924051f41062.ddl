begin "hash_31b4924051f41062";
version 4;
metatable "hash_5623828acafe1cd6";

struct root {
    telemetry_header telemetry;
    hash_7c2d8402b3ebd8a4 hash_75aa4d713e0d9944[32];
    int32 hash_cce80ad06151213;
    client_header client;
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

struct hash_7c2d8402b3ebd8a4 {
    byte hash_1a1ca465c2306f2d;
    int32 hash_58dfcdae075f30f3;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


