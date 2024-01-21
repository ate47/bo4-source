begin "hash_27ff4b20260956cf";
version 10;
metatable "hash_d16b58f7bd24e7aa";

struct root {
    string store_gamemode;
    telemetry_header telemetry;
    uint32 store_region;
    string store_source;
    uint32 hash_2b880c16983ce21c;
    string product_id;
    string store_action_source;
    client_header client;
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


