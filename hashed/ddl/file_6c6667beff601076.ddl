begin "hash_6c6667beff601076";
version 2;
metatable "hash_8589ccf257a9d60d";

struct root {
    uint64 uid;
    int32 kills;
    match_header match;
    int32 score;
    telemetry_header telemetry;
    int32 hash_6f155c5c7cca606d;
    int32 hash_42b20df98ca70b5d;
    string gamertag;
    double gametype;
    client_header client;
    int32 deaths;
    int32 assists;
    int32 headshots;
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


