begin "hash_5259f894d90583d0";
version 8;
metatable "hash_b9991243d705d13a";

struct root {
    match_header match;
    telemetry_header telemetry;
    string attackertype;
    string objectname;
    string explosiontype;
    string attackerusername;
    int32 attackerid;
    int32 gametime;
    client_header client;
    fixedpoint locationx;
    fixedpoint locationy;
    fixedpoint locationz;
    fixedpoint radius;
    fixedpoint attackerx;
    fixedpoint attackery;
    fixedpoint attackerz;
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


