begin "hash_6fb377912699fcc3";
version 8;
metatable "hash_5cc056c5769358fe";

struct root {
    float head_offset;
    uint64 enemy;
    match_header match;
    float hash_1f6cb274898a232a;
    float origin_offset;
    float hash_6ca68a826d8d5015;
    float distance;
    char weapon_attachments[128];
    uint64 attacker;
    float time_offset;
    telemetry_header telemetry;
    int32 hash_62d1da867bb2ff57;
    float yaw_offset;
    float hash_150b59790cfad3fa;
    client_header client;
    float hash_6273201c1ac36522;
    hash weapon;
    float hash_aae124f4ed1846e;
    float foot_offset;
    bit hash_798dacddc7e656b3;
    bit hash_4aac85027c3a650c;
    bit hash_2b9d070619bac7c1;
    bit hash_79ec1ef18401690b;
    bit hash_2a1e95e3a58c334c;
    bit validated;
    bit processed;
    bit hash_1b75b5c1eae66aa5;
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
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


