begin "hash_4db59bc94ebca093";
version 1;
metatable "hash_edbc4cda4d6aac40";

struct root {
    telemetry_header telemetry;
    char entrypoint[16];
    client_header client;
    int8 season;
    bit shop;
    bit contraband;
    bit inventory;
    bit reserves;
    padbit __pad[4];
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


