begin "hash_2394aaf2c4f503d4";
version 24;
metatable "hash_c09b7359460ecdf1";

struct root {
    telemetry_header telemetry;
    int32 hash_75cf5e6bfea03713;
    hash_6cf1cc22ebab862c install_type;
    client_header client;
    hash_6580ccf5f8a0ef6 region;
    int32 bandwidth_up;
    bit hash_27f986f9f86c15ef;
    bit hash_6e58cdc751af2093;
    bit hash_6abdb11dfb3344ac;
    bit is_hdr;
    bit is_igr;
    bit hash_a5ceb4ab2cb3bba;
    bit hash_6f05745100a036a1;
    bit hash_7060c9664d2c5213;
};

enum hash_6cf1cc22ebab862c {
    "hash_18695b82948876e3" = 0x0,
    "hash_31a0fc57a92be3ec" = 0x1,
    "hash_50894d28d26042e8" = 0x2
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

struct hash_6580ccf5f8a0ef6 {
    uint32 hash_67599f190572ca79;
    char city[128];
    float longitude;
    char country[2];
    char timezone[8];
    char language[5];
    float latitude;
    char region[64];
};


