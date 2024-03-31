begin "hash_71a0853fbc2d9da5";
version 17;
metatable "hash_18c9fd6de544422";

struct root {
    hash name;
    int32 time;
    match_header match;
    byte round;
    short mainclientnum;
    telemetry_header telemetry;
    int32 inflictorentnum;
    short otherclientnum;
    hash event_info;
    int32 infoindex;
    int32 inflictorenttype;
    int32 hash_4c1f1e20d78f3db3;
    float scoremultiplier;
    int32 tableindex;
    float scoreaddition;
    client_header client;
    int32 scoreeventpriority;
    char hash_72fd8192928b978d[48];
    char hash_4ecd2e74910a3344[48];
    bit isfirstperson;
    bit overrideentitycamera;
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


