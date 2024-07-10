begin "hash_10d8671cb4c8d542";
version 9;
metatable "hash_41e4dc91c18b4b41";

struct root {
    char bbid[8];
    uint64 xuid;
    match_header match;
    char platform_type[32];
    hash playlistname;
    byte controller;
    telemetry_header telemetry;
    char mapname[48];
    char cmdline[4096];
    hash game_type;
    int32 buildversion;
    char platform[16];
    int32 playlist;
    char clientplatform[32];
    int32 changelist;
    char buildmachine[64];
    uint64 dwconnectionid;
    char buildconfig[64];
    char buildname[64];
    uint64 hash_5556d5bd3d3acbdf;
    client_header client;
    hash_61d8fb71b3cca1df session_mode;
    uint32 sessionindex;
    char buildtimestamp[64];
    uint64 hash_3e742dae20399313;
    char hostname[64];
    char username[48];
    bit hash_27f986f9f86c15ef;
    bit isdedicated;
    bit hash_2a6477485c88d7e9;
    bit isranked;
    bit isserver;
    bit isguest;
    bit is_hdr;
    bit hash_326518fcfc54ec7c;
};

enum hash_61d8fb71b3cca1df {
    "mode_invalid" = 0x0,
    "mode_campaign" = 0x1,
    "mode_multiplayer" = 0x2,
    "mode_warzone" = 0x3,
    "mode_zombies" = 0x4
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


