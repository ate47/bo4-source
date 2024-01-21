begin "hash_78215c802e31884f";
version 2;
metatable "hash_6efa6e0e4d624443";

struct root {
    telemetry_header telemetry;
    hash_6b847dfe653f9716 hash_1fa61848c108ccd[8];
    hash_2f7ae21344d86dba hash_277e88224edc9564[8];
    client_header client;
    hash_6a65101a136eab93 header;
    hash_4faa964964a05e35 hash_78a43a2161d0c844;
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

struct hash_6b847dfe653f9716 {
    uint32 hash_49e2a983d2171292;
    uint32 hash_5327ec0dac3839c4;
    char hostname[32];
};

struct hash_2f7ae21344d86dba {
    uint32 hash_585f73b9a8dbaec2;
    uint16 hash_1a03a43c6642e4d6;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};

struct hash_6a65101a136eab93 {
    uint64 hash_6bdd7ebe59310aa2;
    uint64 lobby_id;
    uint32 title_id;
    uint64 hash_426fb7404d1fbf32;
    uint64 user_id;
};

struct hash_4faa964964a05e35 {
    int32 hash_6000a3f7b99ebc4b;
    uint32 hash_fc6534eb8b0b9e5;
    int8 result;
    uint32 duration_ms;
};


