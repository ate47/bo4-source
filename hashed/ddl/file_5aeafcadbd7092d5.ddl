begin "hash_5aeafcadbd7092d5";
version 9;
metatable "hash_e149b3729d15cff0";

struct root {
    int32 hits;
    char eventtype[32];
    int32 downs;
    int32 kills;
    match_header match;
    int32 score;
    telemetry_header telemetry;
    int32 revives;
    char hash_31b0eec8407015dc[48];
    char difficulty[32];
    int32 spawnid;
    int32 suicides;
    int32 gametime;
    client_header client;
    int32 deaths;
    float playerx;
    float playery;
    float playerz;
    int32 shotshit;
    char username[48];
    int32 headshots;
    int32 deathcount;
    int32 shotsmissed;
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


