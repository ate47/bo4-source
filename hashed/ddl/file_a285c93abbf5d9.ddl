begin "hash_a285c93abbf5d9";
version 3;
metatable "hash_864648d7bb66235f";

struct root {
    telemetry_header telemetry;
    hash_2f1c32e28bcd6a46 content;
    hash_26f770aa73f71026 lobby_members[10];
    client_header client;
    hash_163fd421f805deef actions[40];
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

struct hash_2f1c32e28bcd6a46 {
    uint64 hash_7a4b7f92d7e1dc7b;
    uint64 hash_68c4483fed6cf75e;
    uint64 hash_740d73d751cf7979;
    uint64 hash_4c2f2b7a55fd35a8;
    byte hash_49bf5522e36c4ff6;
    string process_name;
    uint64 hash_2b50577fe93b2256;
    int32 hash_669ca7a9de06f403;
    byte hash_43081cc1b79588f9;
    int32 hash_4e650e9c822cb0ce;
    uint64 hash_438c4b6c6afd6185;
    int32 hash_7d8e410d4a2c6050;
    uint64 hash_fe1bb65e8de4d51;
    int32 hash_2459c7bb3080c37f;
    string extra_msg;
    uint64 hash_7e014c3bec12cc14;
    bit hash_5b950829c03b3406;
    padbit __pad[7];
};

struct hash_26f770aa73f71026 {
    uint64 hash_79cac019c120269b;
    uint64 hash_7faaf5ed10257a8a;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};

struct hash_163fd421f805deef {
    uint32 action_id;
    string next_name;
    string action_name;
    bit hash_273dfb188de1a27d;
    padbit __pad[7];
};


