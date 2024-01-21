begin "hash_401b28ff32fb8224";
version 2;
metatable "hash_5e3c37763cfc61ea";

struct root {
    telemetry_header telemetry;
    hash_6538fe05961782a3 hash_7c2a2b8cc4afe569[10];
    client_header client;
    hash_6a65101a136eab93 header;
    hash_6ff4b416acbedfc8 hash_294b5b1dc0642b63;
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

struct hash_6538fe05961782a3 {
    uint32 hash_7bd602a5f16fdf88;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};

struct hash_6a65101a136eab93 {
    uint64 hash_6bdd7ebe59310aa2;
    uint64 lobby_id;
    uint32 title_id;
    uint64 hash_426fb7404d1fbf32;
    uint64 user_id;
};

struct hash_6ff4b416acbedfc8 {
    uint32 retries;
    uint32 hash_7eeb3b0b30e2921a;
    uint16 hash_4b5ffc955581a19e;
    byte result;
    uint32 hash_3795c515da21f010;
    uint16 hash_61f7e598d316c750;
    uint32 duration_ms;
};


