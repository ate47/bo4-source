begin "hash_792f836d17ef9f8";
version 10;
metatable "hash_9443554a4ca8c831";

struct root {
    string name;
    match_header match;
    int32 lifemomentum;
    telemetry_header telemetry;
    int32 lifetime;
    int32 spawnid;
    int32 gametime;
    client_header client;
    int32 specialist;
    int32 lifescore;
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
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


