begin "hash_1dfc2b684b0f1749";
version 24;
metatable "hash_f0716b756b554c5c";

struct root {
    char map[48];
    match_header match;
    telemetry_header telemetry;
    hash playlist_name;
    int32 lobby_type;
    hash game_type;
    hash_6cf1cc22ebab862c install_type;
    hash_405641015bd81f7d nat_type;
    int32 playlist_id;
    client_header client;
    hash_6580ccf5f8a0ef6 region;
    uint64 uno_id;
    hash_61d8fb71b3cca1df session_mode;
    bit hash_27f986f9f86c15ef;
    bit hash_7212de4bfb6f8ba;
    bit is_splitscreen;
    bit new_user;
    bit hash_6e58cdc751af2093;
    bit hash_2040bac0263bbe0c;
    bit hash_a5ceb4ab2cb3bba;
    padbit __pad[1];
};

enum hash_61d8fb71b3cca1df {
    "mode_invalid" = 0x0,
    "mode_campaign" = 0x1,
    "mode_multiplayer" = 0x2,
    "mode_warzone" = 0x3,
    "mode_zombies" = 0x4
};

enum hash_405641015bd81f7d {
    "xonline_nat_unknown" = 0x0,
    "xonline_nat_open" = 0x1,
    "xonline_nat_strict" = 0x2,
    "xonline_nat_moderate" = 0x3
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

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};

enum hash_6cf1cc22ebab862c {
    "hash_18695b82948876e3" = 0x0,
    "hash_31a0fc57a92be3ec" = 0x1,
    "hash_50894d28d26042e8" = 0x2
};

struct hash_6580ccf5f8a0ef6 {
    uint32 hash_67599f190572ca79;
    char city[128];
    float longitude;
    char country[2];
    char timezone[8];
    char language[5];
    float latitude;
    char region[64];
};

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
};


