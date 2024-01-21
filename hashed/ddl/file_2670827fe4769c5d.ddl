begin "hash_2670827fe4769c5d";
version 6;
metatable "hash_64dbba3a488762bd";

struct root {
    match_header match;
    int32 pos_x;
    int32 pos_y;
    int32 pos_z;
    uint32 hash_5d4c0dad617ca23;
    uint32 hash_5715e55450648bd5;
    byte motion_state;
    short hash_3702989295e6967c;
    short angle_x;
    short angle_y;
    hash_61d8fb71b3cca1df session_mode;
    uint64 user_id;
    bit is_ads;
    padbit __pad[7];
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


