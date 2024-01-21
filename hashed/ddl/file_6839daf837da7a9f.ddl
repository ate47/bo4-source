begin "hash_6839daf837da7a9f";
version 16;
metatable "hash_ac6bf0fe3fa0c45f";

struct root {
    telemetry_header telemetry;
    hash_718ac4f1b61972b0 experiments[32];
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

struct hash_718ac4f1b61972b0 {
    uint64 hash_433bf14ac8ee287;
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


