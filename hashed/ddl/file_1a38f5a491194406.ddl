begin "hash_1a38f5a491194406";
version 9;
metatable "hash_930b830a775663cb";

struct root {
    match_header match;
    telemetry_header telemetry;
    char enemyweapon[64];
    int32 enemyentitynum;
    int32 hash_666d0cfcf9ae78ae;
    char playername[48];
    int32 gametime;
    int32 spawnpointid;
    client_header client;
    int32 originx;
    int32 originy;
    int32 originz;
    int32 spawnpointidshift;
    char enemyname[48];
    char reason[64];
    int32 elapsedtime;
    int32 hash_5baa54667bbc1690;
    int32 hash_5baa55667bbc1843;
    int32 hash_5baa56667bbc19f6;
    int32 playerentitynum;
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


