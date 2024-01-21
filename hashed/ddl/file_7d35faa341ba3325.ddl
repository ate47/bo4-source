begin "hash_7d35faa341ba3325";
version 10;
metatable "hash_d35ca335f5c56f89";

struct root {
    fixedpoint x;
    fixedpoint y;
    fixedpoint z;
    match_header match;
    telemetry_header telemetry;
    int32 hash_666d0cfcf9ae78ae;
    client_header client;
    string reason;
    bit hash_35eda16df3c4d65d;
    padbit __pad[7];
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


