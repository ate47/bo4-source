begin "hash_410a4e25a5c411fb";
version 6;
metatable "hash_33a2006d08c2a364";

struct root {
    uint16 end_health;
    match_header match;
    uint16 passenger_kills;
    hash vehicle;
    uint64 player_xuid;
    uint16 hash_576e854d5397d59e;
    uint16 hash_27d7493da1ae3b08;
    telemetry_header telemetry;
    uint16 vehicle_kills;
    uint32 end_time;
    float hash_6373313e132d49b8;
    float hash_6373323e132d4b6b;
    uint16 hash_1f6f99c615ebe865;
    uint16 hash_7410c2f4f7747523;
    uint16 hash_4b78f4ca0c0dd281;
    uint32 start_time;
    byte hash_b165f7ced53ebf6;
    float hash_4b57cd6a0164c365;
    float hash_4b57cc6a0164c1b2;
    uint16 hash_493b0b37aa073d11;
    uint16 hash_4c4e7e6968f548cd;
    uint32 hash_2da568278a84a90d;
    client_header client;
    uint16 hash_2ade526a94b004f;
    uint16 start_health;
    uint64 first_player;
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


