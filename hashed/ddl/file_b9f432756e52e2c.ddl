begin "hash_b9f432756e52e2c";
version 10;
metatable "hash_90575a412d9f6417";

struct root {
    match_header match;
    int32 matchtime;
    telemetry_header telemetry;
    int32 timeremaining;
    string wintype;
    uint16 hash_6ca7fa26481a6ce0;
    uint16 hash_612709a5581ab87b;
    int32 gametime;
    fixedpoint hash_4a6fc9a9acbef0b4;
    client_header client;
    bit firstblood;
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


