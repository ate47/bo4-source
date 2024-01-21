begin "hash_7bfb536ff8a8e33b";
version 12;
metatable "hash_1e402560842c53fa";

struct root {
    uint64 match_id;
    uint32 version;
    telemetry_header telemetry;
    string survey_order;
    hash_6e584a2182d558dd answer_id;
    string survey_id;
    client_header client;
    bit hash_1ad6ca05018e4411;
    padbit __pad[7];
};

enum hash_6e584a2182d558dd {
    "hash_48c11f5af9af3a1" = 0x0,
    "no" = 0x1,
    "yes" = 0x2,
    "hash_7f10c379eec64c4a" = 0x3
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


