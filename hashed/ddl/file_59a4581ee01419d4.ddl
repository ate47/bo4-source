begin "hash_59a4581ee01419d4";
version 1;
metatable "hash_3e7fc54750eb41";

struct root {
    int32 hash_5a5f320a7654324c;
    telemetry_header telemetry;
    int32 hash_47b625c48c3b5fcc;
    char build_machine[128];
    client_header client;
    int32 hash_1514ae50c5450622;
    int32 playlist_version;
    char build_name[128];
    char build_time[128];
    char build_type[128];
    int32 ffotd_version;
    int32 hash_4445fa044e754c98;
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


