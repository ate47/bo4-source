begin "hash_42b85093739e1566";
version 4;
metatable "hash_181ba7eeeae18303";

struct root {
    byte hash_e9ca0809f0a3ff1;
    uint64 player_count;
    match_header match;
    telemetry_header telemetry;
    byte hash_1315bdfbb7506a0a;
    byte hash_4cc84b671ac33c72;
    client_header client;
    uint32 hash_417e7465d8c60f77;
    byte hash_1743463e65428c8a;
    int32 hash_5288d149bac65a79;
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


