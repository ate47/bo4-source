begin "hash_5eaff5160535a257";
version 10;
metatable "hash_132da978281e107b";

struct root {
    match_header match;
    telemetry_header telemetry;
    hash_3ad855a8b01f1a72 hash_637a0a0969aaeb3b;
    hash_38be2d6023bb72b1 lobby_members[50];
    client_header client;
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
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

struct hash_3ad855a8b01f1a72 {
    uint64 hash_529f1b2656189232;
    string hash_3bca0a9c8f341c79;
    uint64 hash_238a1943270a668e;
    uint64 hash_274f4160f246b900;
    hash_745a9340fca86465 hash_3d6dceb705c92439;
    string hash_296aeed34055c468;
    uint64 hash_204f262b1f3b8ccf;
    uint64 hash_522c2d85063ec515;
    uint64 hash_300f7cbb339f0026;
    uint64 lobby_id;
    uint64 hash_573a96edffbd3a8e;
    string hash_7a177695ffbdbbbf;
    int32 playlist_id;
    uint64 hash_56a1b6d783aa7a25;
    int32 playlist_version;
    uint64 hash_4f2f10801676ac78;
    uint32 hash_623fd292cbf4dd16;
    int32 ffotd_version;
    int32 hash_72623ba80a26ad5a;
    string hash_5e523aef49ce7554;
    bit is_dedi;
    padbit __pad[7];
};

enum hash_745a9340fca86465 {
    "hash_2154483008068688" = 0x0,
    "game_start" = 0x1,
    "hash_6a20f1f681a1a426" = 0x2
};

struct hash_38be2d6023bb72b1 {
    uint64 hash_26fcf92f9ee7fc5;
    uint64 hash_4fd83cafec6d041d;
    uint64 user_id;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


