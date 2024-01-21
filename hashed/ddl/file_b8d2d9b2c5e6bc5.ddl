begin "hash_b8d2d9b2c5e6bc5";
version 13;
metatable "hash_e7b8f2d26d55949a";

struct root {
    int32 death;
    int32 downs;
    match_header match;
    byte roundnumber;
    fixedpoint hash_1ba4099d8a3703bf;
    fixedpoint victimx;
    fixedpoint victimy;
    fixedpoint victimz;
    int32 hash_7784f69a7e55c413;
    int32 hash_4ef1f8ab05b78716;
    telemetry_header telemetry;
    string attackername;
    string attackertype;
    fixedpoint hash_398bbe7d23bcf3e0;
    int32 hash_4d0e25950f418f70;
    string victimname;
    string victimtype;
    string hash_2ce4c96c3885dfc0;
    string hash_37d6ea7634d791c8;
    string hash_61881c780627994;
    int32 hash_ffaf801a3faf28d;
    double attackerweapon;
    fixedpoint hash_4c541ec98f6eba67;
    string hash_dfcd811ffe0e8c3;
    string damagelocation;
    int32 attackerid;
    fixedpoint hash_17853fb07037fe5c;
    string damagetype;
    int32 gametime;
    client_header client;
    int32 damage;
    int32 downed;
    fixedpoint attackerx;
    fixedpoint attackery;
    fixedpoint attackerz;
    int32 hash_399761c967ceaa26;
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


