begin "hash_29277c23d2092c39";
version 14;
metatable "hash_58e0c8e2e63f0564";

struct root {
    double team;
    double type;
    double playerspecialist;
    int32 delta;
    match_header match;
    telemetry_header telemetry;
    int32 spawnid;
    string gamemode;
    int32 gametime;
    client_header client;
    string player;
    int32 deltamomentum;
    bit isusingheropower;
    bit isscoreevent;
    padbit __pad[6];
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


