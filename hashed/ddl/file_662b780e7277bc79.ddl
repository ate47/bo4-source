begin "hash_662b780e7277bc79";
version 2;
metatable "hash_8db412dab501cfad";

struct root {
    hash_33bf07591958a6f1 hash_2b1372bddf3a584c;
    telemetry_header telemetry;
    client_header client;
    hash_6a65101a136eab93 header;
};

struct hash_33bf07591958a6f1 {
    int32 hash_1264c84bbee08f80;
    uint32 hash_4926ebe3920f1011;
    byte hash_a0f382d7c109dd4;
    uint32 hash_266b42dab96feeb0;
    uint32 hash_3b6396c9a7bb3501;
    uint16 hash_21b204228b9c30ad;
    byte last_state;
    uint32 hash_49b55debef4aed9b;
    byte hash_20d721b4939feee8;
    uint32 hash_ebf5cf2789352f3;
    uint32 hash_1d3d37b4bfd07e57;
    uint32 hash_57645f4f490fadfb;
    int32 hash_25dca3aaf0f14efe;
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

struct hash_6a65101a136eab93 {
    uint64 hash_6bdd7ebe59310aa2;
    uint64 lobby_id;
    uint32 title_id;
    uint64 hash_426fb7404d1fbf32;
    uint64 user_id;
};


