begin "hash_2ec6766c0c27c8c7";
version 9;
metatable "hash_ffc0d3a697b35fd7";

struct root {
    char mode[24];
    int32 play;
    int32 quit;
    match_header match;
    int32 playw;
    int32 quitw;
    int32 firsttime;
    int32 forgiven;
    int32 finishedw;
    telemetry_header telemetry;
    int32 hash_501d5f909f2be786;
    int32 hash_7f5b1682501e1b04;
    char playername[48];
    int32 timeoutw;
    client_header client;
    int32 timeout;
    int32 dashboard;
    int32 finished;
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


