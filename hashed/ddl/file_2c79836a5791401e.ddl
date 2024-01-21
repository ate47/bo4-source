begin "hash_2c79836a5791401e";
version 9;
metatable "hash_df85581d86d0a3a7";

struct root {
    uint32 hash_67599f190572ca79;
    fixedpoint lat;
    string city;
    fixedpoint long;
    telemetry_header telemetry;
    string country;
    string timezone;
    client_header client;
    string region;
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


