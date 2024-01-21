begin "hash_4f52e5fcab1efaef";
version 14;
metatable "hash_f2dab06b1f830d44";

struct root {
    double team;
    match_header match;
    fixedpoint grenadeawareness;
    telemetry_header telemetry;
    string alertlevel;
    fixedpoint accuracy;
    int32 gametime;
    double archetype;
    fixedpoint engagemaxfalloffdist;
    string airank;
    string aitype;
    client_header client;
    fixedpoint engagemaxdist;
    int32 health;
    fixedpoint originx;
    fixedpoint originy;
    fixedpoint originz;
    int32 hash_16f7e8c8e28206d7;
    fixedpoint engagemindist;
    double weapon;
    fixedpoint engageminfalloffdist;
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


