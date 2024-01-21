begin "hash_3166b4b2fedff56";
version 12;
metatable "hash_bf5046bc2f779590";

struct root {
    int8 type;
    int32 space_used;
    telemetry_header telemetry;
    short hash_59430b98f2ee31ec;
    short blocks_used;
    short files_used;
    client_header client;
    short hash_191e77512f35fa05;
    int32 max_space;
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


