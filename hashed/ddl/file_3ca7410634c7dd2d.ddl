begin "hash_3ca7410634c7dd2d";
version 10;
metatable "hash_4000370c542db93f";

struct root {
    int32 hash_77a6c7a5044549d3;
    int32 count;
    match_header match;
    telemetry_header telemetry;
    int32 maxdata;
    int32 hash_1946e5ecc3720231;
    int32 hash_22adbf5291b6f3ff;
    int32 hash_2b96b7ac2b44ab0c;
    int32 hash_f4959b13031538b;
    int32 hash_321b73ec8694423f;
    hash arrayname;
    client_header client;
    bit zombies;
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


