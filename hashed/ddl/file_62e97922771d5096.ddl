begin "hash_62e97922771d5096";
version 5;
metatable "hash_60517b85035d7891";

struct root {
    match_header match;
    hash_2e8844abee67a26f party_members[10];
    hash_79a5e2d9e3912c45 hash_244cfe1af6487d5a;
    telemetry_header telemetry;
    client_header client;
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
};

struct hash_2e8844abee67a26f {
    uint64 xuid;
};

struct hash_79a5e2d9e3912c45 {
    uint64 hash_46838162d06a1e0d;
    int32 hash_22bebb24c7131b96;
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


