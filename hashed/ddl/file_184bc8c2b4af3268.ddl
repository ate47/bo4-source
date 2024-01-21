begin "hash_184bc8c2b4af3268";
version 3;
metatable "hash_d042cafe2c8b676f";

struct root {
    telemetry_header telemetry;
    uint64 video_id;
    client_header client;
    char video_author[32];
    int32 video_length;
    bit hash_7ad364242ed0cb7e;
    padbit __pad[7];
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


