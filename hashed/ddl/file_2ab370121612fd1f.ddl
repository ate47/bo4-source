begin "hash_2ab370121612fd1f";
version 1;
metatable "hash_1a5edba5a0e768f3";

struct root {
    int32 slot;
    int32 controller;
    telemetry_header telemetry;
    client_header client;
    int32 result;
    string filename;
    int32 filetype;
    int32 attempt;
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


