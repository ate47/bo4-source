begin "hash_5ef6bf9bb6b478bd";
version 1;
metatable "hash_9458e5909d2fce4e";

struct root {
    match_header match;
    telemetry_header telemetry;
    client_header client;
    int32 hash_356799aabf77774;
    hash_29f48f8f9b71357f hash_24f93aa82957b047;
};

enum hash_29f48f8f9b71357f {
    "hash_f72397b7d69ee6d" = 0x0,
    "hash_2439662214197df9" = 0x1,
    "hash_45b93a098b0a80f8" = 0x2,
    "hash_45c1824dca01090f" = 0x3,
    "hash_547b78dcba6ed1d5" = 0x4,
    "hash_55a45a569173088a" = 0x5,
    "hash_615989812612926b" = 0x6,
    "hash_7547bff0822acceb" = 0x7
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


