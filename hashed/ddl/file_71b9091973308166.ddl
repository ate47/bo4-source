begin "hash_71b9091973308166";
version 10;
metatable "hash_b50561ee11e06077";

struct root {
    string note;
    string hash_66171d46b926a0f4;
    match_header match;
    int32 nodes;
    telemetry_header telemetry;
    int32 run_time;
    int32 hash_500de1697bd9326b;
    fixedpoint hash_7283f55e08b37f54;
    fixedpoint hash_7283f65e08b38107;
    int32 hash_578a31eeeebf8e86;
    int32 hash_578a32eeeebf9039;
    int32 samples;
    int32 partition;
    int32 hash_686b40e2c86148a;
    int32 hash_686b50e2c86163d;
    int32 hash_2b363900460040f3;
    client_header client;
    string hash_171f242bdfe3c7d5;
    string username;
    string hash_6afd5eba293e8da6;
    bit hash_277af36f6bbf409a;
    padbit __pad[7];
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

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


