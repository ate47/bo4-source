begin "hash_1eb52f29d51538c4";
version 11;
metatable "hash_86b16471207d3d97";

struct root {
    int32 count;
    match_header match;
    telemetry_header telemetry;
    int32 hash_158f176cc1f5249c;
    int32 hash_410e02df5064f43;
    uint32 uncompressed;
    uint32 data_transfer;
    client_header client;
    int32 client_count;
    int32 period;
    int32 hash_53c7dcda3f87b0b8;
    uint32 compressed;
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


