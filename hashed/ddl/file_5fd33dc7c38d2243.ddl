begin "hash_5fd33dc7c38d2243";
version 4;
metatable "hash_9797769106386acb";

struct root {
    string sku;
    int8 slot;
    uint32 hash_15c56d778df1bb04;
    uint32 casecount;
    telemetry_header telemetry;
    int32 timeremaining;
    double itemname;
    int32 rotationtime;
    int8 hash_2082f5f2f5fb1340;
    byte stacktotal;
    byte stackposition;
    string action;
    client_header client;
    uint32 cpcost;
    int8 season;
    uint32 codpoints;
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


