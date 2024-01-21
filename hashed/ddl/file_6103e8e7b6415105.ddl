begin "hash_6103e8e7b6415105";
version 3;
metatable "hash_a6ba453623ce6b6b";

struct root {
    uint64 xuid;
    match_header match;
    telemetry_header telemetry;
    int32 game_time;
    int8 character_index;
    int32 hash_546150e2d2471daa;
    client_header client;
    bit hash_3733003f88306c26;
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


