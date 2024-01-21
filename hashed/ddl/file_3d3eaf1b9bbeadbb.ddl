begin "hash_3d3eaf1b9bbeadbb";
version 12;
metatable "hash_cf53ff34d81c9f2a";

struct root {
    match_header match;
    hash_3754ae573cf9924d party_members[10];
    telemetry_header telemetry;
    hash_5e61b013683f3eba hash_326402d544e6c4a7;
    client_header client;
    char hash_7bf9daccc9b256dd[32];
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
};

struct hash_3754ae573cf9924d {
    uint64 xuid;
    uint64 hash_1d1bf732b0333b59;
    uint64 hash_70f1765710df7771;
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

struct hash_5e61b013683f3eba {
    uint64 hash_4c352a5202cdd23f;
    uint64 hash_248adccf3c622adc;
    uint64 hash_46838162d06a1e0d;
    int32 reason_left;
    uint64 hash_391c576ac028696a;
    uint64 hash_522c2d85063ec515;
    uint64 hash_2b4a32e71c22452;
    uint64 hash_300f7cbb339f0026;
    int32 playlist_id;
    uint64 hash_56a1b6d783aa7a25;
    int32 playlist_version;
    int32 ffotd_version;
    uint64 hash_5adcb2e00ec9eab1;
    char hash_5e523aef49ce7554[32];
    int8 hash_22bebb24c7131b96;
    bit hash_329a52ffc78a973;
    bit is_dedi;
    padbit __pad[6];
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


