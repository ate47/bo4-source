begin "hash_1cfc8921f244c443";
version 2;
metatable "hash_55206b2249e41a2d";

struct root {
    match_header match;
    hash_248cc7ab37aad9a3 hash_586dadcb63626c10;
    telemetry_header telemetry;
    client_header client;
};

enum hash_248cc7ab37aad9a3 {
    "hash_265a30f801d0bd33" = 0x0,
    "hash_36c757668a739d2f" = 0x1,
    "hash_441668dbf822275c" = 0x2,
    "hash_4cf1c2e85045e60b" = 0x3,
    "hash_585e49bf5fef2363" = 0x4,
    "hash_6a4c3145f885c926" = 0x5,
    "hash_7bd23157f0e07563" = 0x6
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


