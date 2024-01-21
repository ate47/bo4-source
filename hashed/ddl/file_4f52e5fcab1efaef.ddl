begin "hash_4f52e5fcab1efaef";
version 14;
metatable "hash_f2dab06b1f830d44";

struct root {
    hash team;
    match_header match;
    float grenadeawareness;
    telemetry_header telemetry;
    char alertlevel[32];
    float accuracy;
    int32 gametime;
    hash archetype;
    float engagemaxfalloffdist;
    char airank[64];
    char aitype[64];
    client_header client;
    float engagemaxdist;
    int32 health;
    float originx;
    float originy;
    float originz;
    int32 hash_16f7e8c8e28206d7;
    float engagemindist;
    hash weapon;
    float engageminfalloffdist;
    int32 canflank;
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


