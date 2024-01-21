begin "hash_532122ee85f6e062";
version 9;
metatable "hash_b45b379ca9eb64b6";

struct root {
    char name[48];
    uint64 xuid;
    match_header match;
    int32 hash_7d7fed9075e687a;
    int32 hash_7d7ffd9075e6a2d;
    int32 hash_7d7fcd9075e6514;
    int32 hash_7d7fdd9075e66c7;
    int32 hash_7d7fad9075e61ae;
    int32 hash_7d7fbd9075e6361;
    int32 hash_7d7f8d9075e5e48;
    int32 hash_21ea032a486734ae;
    int32 hash_21ea022a486732fb;
    int32 hash_21ea012a48673148;
    int32 hash_21ea082a48673d2d;
    int32 hash_21ea072a48673b7a;
    int32 hash_21ea062a486739c7;
    int32 hash_21ea052a48673814;
    int32 hash_21e9fc2a486728c9;
    int32 hash_21e9fb2a48672716;
    int32 hash_5804f40d89d0cb3f;
    int32 hash_5804f50d89d0ccf2;
    int32 hash_5804f60d89d0cea5;
    int32 hash_5804ef0d89d0c2c0;
    int32 hash_5804f00d89d0c473;
    int32 hash_5804f10d89d0c626;
    int32 hash_5804f20d89d0c7d9;
    int32 hash_5804fb0d89d0d724;
    int32 hash_5804fc0d89d0d8d7;
    telemetry_header telemetry;
    short clientnum;
    client_header client;
    int32 hash_6135c2012dc90a7d;
    int32 hash_6135c1012dc908ca;
    int32 hash_6135c0012dc90717;
    int32 hash_6135bf012dc90564;
    int32 hash_6135be012dc903b1;
    int32 hash_6135bd012dc901fe;
    int32 hash_6135bc012dc9004b;
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


