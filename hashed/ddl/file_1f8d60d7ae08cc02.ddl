begin "hash_1f8d60d7ae08cc02";
version 2;
metatable "hash_7210860d8d39a0e0";

struct root {
    match_header match;
    uint64 player_xuid;
    telemetry_header telemetry;
    byte hash_1173e4be95b4f8af;
    uint32 end_time;
    uint32 start_time;
    client_header client;
    uint16 damage;
    uint16 hash_49e1674a9d40893a;
    bit death;
    bit bleed_out;
    bit hash_54a1c9c5f993e32f;
    padbit __pad[5];
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


