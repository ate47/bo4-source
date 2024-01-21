begin "hash_1b4c40399e97b8ad";
version 21;
metatable "hash_aee255c2d3ad3ff0";

struct root {
    hash_4bc2231ce039ad50 ui;
    uint32 player_count;
    hash_4bc2231ce039ad50 frame;
    match_header match;
    fixedpoint hash_5cf4c0068a2adb7e;
    telemetry_header telemetry;
    hash_3ea575a2be6523f8 stream_weapons;
    hash_4bc2231ce039ad50 hash_26305944fdfcc648;
    hash_3ea575a2be6523f8 hash_607533ecc8220817;
    hash_3ea575a2be6523f8 hash_5a1df273e5117ae4;
    fixedpoint hash_320012f3ddbd42e1;
    fixedpoint hash_694ebf1c86e2b370;
    fixedpoint hash_26a1c4d27438e76;
    int32 hash_41c61675e9a0b2d1;
    fixedpoint hash_b8a5310b16895f8;
    int32 hash_7efd3977838c2844;
    fixedpoint hash_786854d23639d4ff;
    hash_3ea575a2be6523f8 stream_terrain;
    hash_5e4dc4e07696d328 camera;
    client_header client;
    hash_3ea575a2be6523f8 hash_16d0c24c643fe661;
    hash_4bc2231ce039ad50 gpuframe;
    hash_3ea575a2be6523f8 hash_706875ff12b295b8;
    hash_3ea575a2be6523f8 hash_4eede5ccff6cdeb2;
    hash_3ea575a2be6523f8 hash_38670452ab856e5e;
    hash_3ea575a2be6523f8 stream_vehicles;
    hash_4bc2231ce039ad50 clientupdate;
    int32 hash_6535fe3e4fdf1dab;
    hash_3ea575a2be6523f8 hash_79d557e80bf7a8a0;
    hash_3ea575a2be6523f8 stream_ui;
    bit is_alive;
    bit in_vehicle;
    padbit __pad[6];
};

struct hash_4bc2231ce039ad50 {
    int32 avg;
    int32 max;
    int32 min;
    int32 std;
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

struct hash_3ea575a2be6523f8 {
    fixedpoint mesh;
    fixedpoint image;
    fixedpoint generic;
};

struct hash_5e4dc4e07696d328 {
    int32 x;
    int32 y;
    int32 z;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


