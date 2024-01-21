begin "hash_1ec3596da2a73cad";
version 10;
metatable "hash_b4b239261bab48d8";

struct root {
    match_header match;
    float quatw;
    float quatx;
    float quaty;
    float quatz;
    telemetry_header telemetry;
    int32 hash_25d3bd75c4d8cf82;
    client_header client;
    int32 hash_7ba2635f63e1aa23;
    int32 originx;
    int32 originy;
    int32 originz;
    float length;
    int32 entitynum;
    int32 hash_770767308e1117c4;
    int32 hash_770768308e111977;
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
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


