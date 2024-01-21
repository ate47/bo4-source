begin "hash_77b094cffd177ffb";
version 10;
metatable "hash_1a160c6161b1b7e6";

struct root {
    match_header match;
    telemetry_header telemetry;
    client_header client;
    hash_3b1f2a75446de239 cploadouts;
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

struct hash_3b1f2a75446de239 {
    int32 primarygrenadecount;
    hash tacticalgear;
    char primarygrenade[64];
    hash killstreak1;
    hash killstreak2;
    hash killstreak3;
    hash killstreak4;
    hash secondaryattachment1;
    hash secondaryattachment2;
    hash secondaryattachment3;
    hash secondaryattachment4;
    hash secondaryattachment5;
    hash primaryreticle;
    int32 spawnid;
    hash wildcard0;
    hash wildcard1;
    hash hash_58c97dd32ef2d7a7;
    char talisman1[64];
    int32 gametime;
    int32 specialistindex;
    hash hash_e88f8f1dc4ab5c1;
    hash talent1;
    hash talent2;
    hash talent3;
    hash talent4;
    hash talent5;
    hash talent6;
    hash hash_e88f9f1dc4ab774;
    hash hash_e88f0f1dc4aa829;
    hash hash_e88eff1dc4aa676;
    char specialgrenade[64];
    int32 specialgrenadecount;
    char specialty1[64];
    char specialty2[64];
    char specialty3[64];
    char specialty4[64];
    char specialty5[64];
    char specialty6[64];
    char secondarycamo[64];
    char secondaryname[64];
    char primarycamo[64];
    char primaryname[128];
    hash secondary;
    hash hash_7af4c73d11d6e762;
    hash primary;
    hash secondaryreticle;
    hash primaryattachment1;
    hash primaryattachment2;
    hash primaryattachment3;
    hash primaryattachment4;
    hash primaryattachment5;
    hash primaryattachment6;
    hash primaryattachment7;
};


