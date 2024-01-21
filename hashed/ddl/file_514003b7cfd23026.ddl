begin "hash_514003b7cfd23026";
version 8;
metatable "hash_36434d6229b4e5e3";

struct root {
    uint64 xuid;
    int32 challenge_id;
    int32 hash_4ff2b4a787a7f3ed;
    int32 hash_7dfe5ad092df68ee;
    telemetry_header telemetry;
    int32 start_time;
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

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


