begin "hash_d3529ef5be3d336";
version 20;
metatable "hash_cdd37c9d3f4c874d";

struct root {
    telemetry_header telemetry;
    client_header client;
    hash_14a1982625e12d94 metric[128];
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

struct hash_14a1982625e12d94 {
    uint32 count;
    hash event;
    uint32 hash_68b893b417cabcd1;
    hash channel;
    float hash_2ca14d840c70e2ed;
    uint32 hash_533194284a1f0466;
    hash endpoint;
    float hash_3f2c69f19f5de63;
    uint32 hash_395e5afdcea60aec;
    float hash_472094a294ebb9e2;
    hash serializer;
};


