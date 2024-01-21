begin "hash_2544260de95f9661";
version 1;
metatable "hash_b8afe48abf7f7b5";

struct root {
    uint32 hash_3c4fdf4f4943a710;
    telemetry_header telemetry;
    uint32 hash_1cf0a057afbdbb2e;
    uint32 hash_4a86a549996e6296;
    uint32 hash_a0037751903d258;
    int32 hash_2f919e9869a7fb6a;
    client_header client;
    int32 hash_20e103c8d596edb6;
    uint32 client_wins;
    uint64 client_xuid;
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


