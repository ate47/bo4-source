begin "hash_1fcc3a4ddd38d2e9";
version 14;
metatable "hash_adbff85b401b4868";

struct root {
    match_header match;
    float victimx;
    float victimy;
    float victimz;
    telemetry_header telemetry;
    hash victimweapon;
    int32 attackerspawnid;
    hash attackerweapon;
    hash attackerspecialist;
    char damagelocation[32];
    hash victimspecialist;
    char damagetype[32];
    int32 gametime;
    client_header client;
    int32 damage;
    char killstreak[32];
    float attackerx;
    float attackery;
    float attackerz;
    int32 victimspawnid;
    bit death;
    bit isusingheropower;
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


