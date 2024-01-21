begin "hash_d15b76314c8f52f";
version 1;
metatable "hash_8d121a7d1753ebce";

struct root {
    int32 hash_1a553941a735de81;
    int32 controller;
    telemetry_header telemetry;
    int32 lobby_type;
    short max_clients;
    client_header client;
    int32 hash_5862d3f1b0f11978;
    bit hash_4b3088c31338f710;
    bit hash_46b8ae8b89bf06c2;
    padbit __pad[6];
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

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


