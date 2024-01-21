begin "hash_5660cff340807695";
version 11;
metatable "hash_3661a50a25da6f4";

struct root {
    hash_31f2bd1796b3fc6e errortype;
    telemetry_header telemetry;
    char product_id[64];
    client_header client;
    bit hash_43580e5e98330afd;
    padbit __pad[7];
};

enum hash_31f2bd1796b3fc6e {
    "hash_17610cce3b106970" = 0x0,
    "hash_413d7ab7e61879de" = 0x1,
    "hash_74daaa231463a9d9" = 0x2
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


