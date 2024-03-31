begin "hash_22fe2d7b302dc280";
version 10;
metatable "hash_7533912bc67a6b07";

struct root {
    float kd;
    float hash_49ebf2675743e7eb;
    float hash_49ebf1675743e638;
    int32 rank;
    int32 kills;
    match_header match;
    int32 score;
    int32 hash_56832bbcf195a9d3;
    char hash_3b10bf5cc604677d[128];
    telemetry_header telemetry;
    int32 grenadesused;
    int32 bestkillstreak;
    char collectibles[64];
    float hash_5d9b05c61b08296c;
    int32 hash_31fc0b4df25cc50d;
    int32 hash_5563ef374a80dc1d;
    hash primaryloadoutweapon;
    int32 playertime;
    float accuracy;
    int32 spawnid;
    int32 hash_5c5a773574a98026;
    int32 gametime;
    client_header client;
    int32 deaths;
    int32 incaps;
    hash currentweapon;
    int32 rankxp;
    float hash_475d9beecef8b15f;
    int32 wallrun_time;
    int32 assists;
    int32 totalshots;
    int32 hash_5e8a9a502b3f3df8;
    float hash_491587fc34c54122;
    int32 sprint_time;
    int32 shotshit;
    char username[48];
    int32 headshots;
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


