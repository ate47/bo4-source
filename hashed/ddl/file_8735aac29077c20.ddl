begin "hash_8735aac29077c20";
version 10;
metatable "hash_80c8b820f23df8a1";

struct root {
    match_header match;
    telemetry_header telemetry;
    hash_3b1f2a75446de239 loadouts;
    client_header client;
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

struct hash_3b1f2a75446de239 {
    int32 primarygrenadecount;
    double tacticalgear;
    string primarygrenade;
    double killstreak1;
    double killstreak2;
    double killstreak3;
    double killstreak4;
    double secondaryattachment1;
    double secondaryattachment2;
    double secondaryattachment3;
    double secondaryattachment4;
    double secondaryattachment5;
    double primaryreticle;
    int32 spawnid;
    double wildcard0;
    double wildcard1;
    double hash_58c97dd32ef2d7a7;
    string talisman1;
    int32 gametime;
    int32 specialistindex;
    double hash_e88f8f1dc4ab5c1;
    double talent1;
    double talent2;
    double talent3;
    double talent4;
    double talent5;
    double talent6;
    double hash_e88f9f1dc4ab774;
    double hash_e88f0f1dc4aa829;
    double hash_e88eff1dc4aa676;
    string specialgrenade;
    int32 specialgrenadecount;
    string specialty1;
    string specialty2;
    string specialty3;
    string specialty4;
    string specialty5;
    string specialty6;
    string secondarycamo;
    string secondaryname;
    string primarycamo;
    string primaryname;
    double secondary;
    double hash_7af4c73d11d6e762;
    double primary;
    double secondaryreticle;
    double primaryattachment1;
    double primaryattachment2;
    double primaryattachment3;
    double primaryattachment4;
    double primaryattachment5;
    double primaryattachment6;
    double primaryattachment7;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


