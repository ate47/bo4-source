begin "hash_6dd8ee6abb6a953f";
version 13;
metatable "hash_108ba60e5549579f";

struct root {
    int32 death;
    int32 downs;
    match_header match;
    float hash_1ba4099d8a3703bf;
    float victimx;
    float victimy;
    float victimz;
    int32 hash_7784f69a7e55c413;
    int32 hash_4ef1f8ab05b78716;
    telemetry_header telemetry;
    char attackername[48];
    char attackertype[64];
    float hash_398bbe7d23bcf3e0;
    int32 victimid;
    char victimname[48];
    char victimtype[64];
    char hash_2ce4c96c3885dfc0[64];
    char hash_37d6ea7634d791c8[64];
    char hash_61881c780627994[128];
    int32 hash_ffaf801a3faf28d;
    hash attackerweapon;
    float hash_4c541ec98f6eba67;
    char hash_dfcd811ffe0e8c3[128];
    char damagelocation[64];
    int32 attackerid;
    float hash_17853fb07037fe5c;
    char damagetype[64];
    int32 gametime;
    int32 attack;
    client_header client;
    int32 damage;
    float attackerx;
    float attackery;
    float attackerz;
    int32 hash_399761c967ceaa26;
    bit victimlaststand;
    bit hash_475fb439e2915b56;
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


