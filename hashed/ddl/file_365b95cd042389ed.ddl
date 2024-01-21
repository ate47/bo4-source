begin "hash_365b95cd042389ed";
version 10;
metatable "hash_a6c4d2b2f42611e2";

struct root {
    char eventname[48];
    match_header match;
    byte roundnumber;
    telemetry_header telemetry;
    float powerupx;
    float powerupy;
    float powerupz;
    char powerupname[48];
    char playername[48];
    int32 gametime;
    client_header client;
    int32 playerspawnid;
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


