begin "hash_719393cc3a046ee5";
version 1;
metatable "hash_2477c2f963ab2406";

struct root {
    match_header match;
    char menus[2048];
    int32 animations;
    int8 local_players;
    uint32 hash_4f2369bc188f798c;
    telemetry_header telemetry;
    int32 hash_1a282687441a6dc6;
    int32 hash_715a0ce203ebb96c;
    char gametype[8];
    int32 hash_7f4072cde37a7be8;
    client_header client;
    uint32 requested_size;
    int8 session_mode;
    int32 elements;
    bit frontend;
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


