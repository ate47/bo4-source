begin "hash_3105a5c2306d3c70";
version 10;
metatable "hash_278602425467221a";

struct root {
    match_header match;
    telemetry_header telemetry;
    hash_24109931428cbd8 zmequipmentuses;
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

struct hash_24109931428cbd8 {
    hash weaponname;
    int32 spawnid;
    int32 gametime;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


