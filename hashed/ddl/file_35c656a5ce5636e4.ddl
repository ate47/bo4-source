begin "hash_35c656a5ce5636e4";
version 5;
metatable "hash_6c06ad1fc8cf8d4d";

struct root {
    int32 hash_384cc37d1b735f65;
    uint64 match_id;
    telemetry_header telemetry;
    int32 num_players;
    int32 max_clients;
    uint64 hash_c05315ddb26eb93;
    int32 duration;
    client_header client;
    int32 hash_1f3fa98aade046aa;
    hash_61d8fb71b3cca1df session_mode;
    bit overflowed;
    padbit __pad[7];
};

enum hash_61d8fb71b3cca1df {
    "mode_invalid" = 0x0,
    "mode_campaign" = 0x1,
    "mode_multiplayer" = 0x2,
    "mode_warzone" = 0x3,
    "mode_zombies" = 0x4
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


