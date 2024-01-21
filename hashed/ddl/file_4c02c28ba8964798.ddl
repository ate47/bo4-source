begin "hash_4c02c28ba8964798";
version 10;
metatable "hash_d81547e29b077c15";

struct root {
    uint32 slots_used;
    string weapon_title;
    telemetry_header telemetry;
    string operation;
    uint32 assets_used;
    uint32 duration;
    client_header client;
    int32 weapon_id;
    uint32 total_slots;
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


