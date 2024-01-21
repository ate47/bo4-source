begin "hash_4f45c7e44381e8a6";
version 5;
metatable "hash_295fd274f758e3b8";

struct root {
    match_header match;
    telemetry_header telemetry;
    hash_1651fe0cc9edb879 summary;
    hash_5028572d06fcd4ba entries[100];
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

struct hash_1651fe0cc9edb879 {
    int32 seed;
    int32 event_count;
};

struct hash_5028572d06fcd4ba {
    double item;
    double category;
    uint32 count;
    double location;
    double rarity;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


