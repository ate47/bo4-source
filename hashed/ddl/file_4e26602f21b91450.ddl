begin "hash_4e26602f21b91450";
version 9;
metatable "hash_66749944facb661a";

struct root {
    match_header match;
    hash_3754ae573cf9924d party_members[10];
    telemetry_header telemetry;
    hash_2f2fcb46292be6b searches[10];
    hash_583c45da3d8d77ed hash_48c11ed545fa1e34;
    client_header client;
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

struct hash_2f2fcb46292be6b {
    uint64 hash_4c352a5202cdd23f;
    uint64 hash_46838162d06a1e0d;
    uint64 hash_391c576ac028696a;
    uint64 hash_300f7cbb339f0026;
    int32 playlist_id;
    uint64 hash_5c868775a96e3de0;
    int32 search_outcome;
    int32 playlist_version;
    uint64 hash_efdbe96a9503cf;
    int32 ffotd_version;
    uint64 hash_63088d1189c30c01;
};

struct hash_583c45da3d8d77ed {
    int8 hash_3ea89a34996a2329;
    uint64 hash_248adccf3c622adc;
    uint64 hash_522c2d85063ec515;
    uint64 hash_2b4a32e71c22452;
    uint64 hash_56a1b6d783aa7a25;
    int8 hash_22bebb24c7131b96;
    bit hash_329a52ffc78a973;
    padbit __pad[7];
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


