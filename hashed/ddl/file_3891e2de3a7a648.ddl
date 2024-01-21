begin "hash_3891e2de3a7a648";
version 18;
metatable "hash_83c116cc6e14381c";

struct root {
    int32 party_size;
    telemetry_header telemetry;
    int32 lobby_type;
    hash_444b6eb55bc9535 connect_type;
    char game_variant[8];
    client_header client;
};

enum hash_444b6eb55bc9535 {
    "join_type_friend" = 0x0,
    "join_type_playlist" = 0x1,
    "join_type_normal" = 0x2,
    "join_type_invite" = 0x3,
    "join_type_groups" = 0x4,
    "join_type_party" = 0x5
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


