begin "hash_5e449510f9319a20";
version 5;
metatable "hash_4de223927eba96ed";

struct root {
    match_header match;
    int32 hash_b3b9df7f8e46110;
    hash_46f2ea4cc6f0ef92 hash_7e1386e214ff2fac[31];
    hash_46f2ea4cc6f0ef92 hash_62ffdd1b4c308ec8[25];
    uint32 hash_1db36ca43f8ad917;
    telemetry_header telemetry;
    hash_46f2ea4cc6f0ef92 hash_df9a6e6386059d2[6];
    hash_46f2ea4cc6f0ef92 hash_860e7d3dbf29ba1[31];
    hash_46f2ea4cc6f0ef92 hash_489b624635fc1faf[42];
    int32 hash_4b969717ded32c59;
    hash_46f2ea4cc6f0ef92 hash_5f9e5fe5b8245404[42];
    client_header client;
    uint32 hash_3fb1cd058b597d26;
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
};

struct hash_46f2ea4cc6f0ef92 {
    uint16 value;
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


