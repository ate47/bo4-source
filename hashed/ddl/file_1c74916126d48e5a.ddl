begin "hash_1c74916126d48e5a";
version 12;
metatable "hash_2d7f7180db28e3cc";

struct root {
    hash_33486934ef3da1df hash_608be004464944c0;
    telemetry_header telemetry;
    client_header client;
    hash_66d752d9db62566a hash_5792a9834bd40278[50];
};

struct hash_33486934ef3da1df {
    uint32 hash_1f5a457ca2df8efc;
    uint32 hash_412519a915c261ba;
    bit hash_58ac2791f8b98dea;
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

struct hash_66d752d9db62566a {
    int32 hash_150666bd04ec9147;
    char filename[64];
    uint32 filesize;
};


