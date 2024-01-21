begin "hash_696d88f16966a19d";
version 11;
metatable "hash_e4b86c41b3db0844";

struct root {
    double melee_weapon;
    match_header match;
    telemetry_header telemetry;
    fixedpoint accuracy;
    int32 gametime;
    double archetype;
    string airank;
    string aitype;
    client_header client;
    int32 health;
    fixedpoint originx;
    fixedpoint originy;
    fixedpoint originz;
    int32 hash_16f7e8c8e28206d7;
    double weapon;
    byte roundnum;
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


