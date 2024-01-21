begin "hash_54561ea133bcfcb9";
version 2;
metatable "hash_b0f88f08fad4d2fd";

struct root {
    telemetry_header telemetry;
    hash_614dd0ece0bfbd27 hash_4323e09d2452778a;
    hash_e34a94c0792bab1 hash_20b0f8c6f632e6ff;
    hash_4110ed2df03bbae hash_157a5bbb9becf257;
    client_header client;
    hash_c5a2a1d52b4736a hash_51c7d25da657076a[8];
    hash_6a65101a136eab93 header;
    hash_fb47795e5d8f8d hash_56264bcd868c21cc[16];
};

struct hash_6a65101a136eab93 {
    uint64 hash_6bdd7ebe59310aa2;
    uint64 lobby_id;
    uint32 title_id;
    uint64 hash_426fb7404d1fbf32;
    uint64 user_id;
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

struct hash_614dd0ece0bfbd27 {
    uint32 hash_5fcf5a02824b74de;
    byte result;
    uint32 duration_ms;
};

struct hash_e34a94c0792bab1 {
    byte nat_type;
    int32 hash_78725a00fca985de;
    uint32 hash_7eeb3b0b30e2921a;
    uint16 hash_4b5ffc955581a19e;
};

struct hash_4110ed2df03bbae {
    uint32 hash_68d55c52aa13f7b4;
    uint32 hash_70259f4fbb3f7a05;
    uint16 hash_52521ecd1275d391;
    uint32 hash_5424ed280cfa4b36;
    fixedpoint hash_3155d04edc797a1a;
    uint32 data_size;
    uint32 bandwidth_up;
    uint32 hash_7663f2e4bf3b7a23;
    fixedpoint latency;
    bit hash_10843082d188230c;
    padbit __pad[7];
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};

struct hash_c5a2a1d52b4736a {
    uint32 hash_585f73b9a8dbaec2;
    uint16 hash_1a03a43c6642e4d6;
};

struct hash_fb47795e5d8f8d {
    fixedpoint hash_e60a2bc44d9370a;
};

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
};


