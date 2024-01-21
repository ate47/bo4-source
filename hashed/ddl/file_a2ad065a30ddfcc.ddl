begin "hash_a2ad065a30ddfcc";
version 11;
metatable "hash_4ab7dbcd946df28e";

struct root {
    fixedpoint yaw;
    int32 team;
    match_header match;
    telemetry_header telemetry;
    int32 hash_666d0cfcf9ae78ae;
    short clientnum;
    client_header client;
    int32 originx;
    int32 originy;
    int32 originz;
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


