begin "hash_41a1311d056f4804";
version 17;
metatable "hash_821c1437738de93b";

struct root {
    match_header match;
    byte round;
    telemetry_header telemetry;
    int32 infoindex;
    uint16 occurrencecount;
    int32 hash_4c1f1e20d78f3db3;
    int32 starttime;
    int32 duration;
    short clientnum;
    int32 endtime;
    client_header client;
    string killcamparams;
    int32 priority;
    bit isfirstperson;
    padbit __pad[7];
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


