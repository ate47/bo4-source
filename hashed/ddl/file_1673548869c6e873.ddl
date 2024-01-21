begin "hash_1673548869c6e873";
version 2;
metatable "hash_56f94926fc21f03c";

struct root {
    hash_3463e9551f90555 hash_7c0d8ffa40ab2f1c[4];
    telemetry_header telemetry;
    hash_75410917f1349195 hash_5d48574fc72fa62a;
    client_header client;
    hash_6a65101a136eab93 header;
};

struct hash_3463e9551f90555 {
    uint32 hash_49e2a983d2171292;
    uint16 port;
    char hash_113c5771496a44ed[128];
    uint32 hash_32e3f837e2ac1c9b;
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

struct hash_75410917f1349195 {
    uint32 hash_18cb1067529b24e6;
    uint32 hash_4d8b250da4767eb7;
    byte hash_58d62c257c3f9e9d;
    uint32 hash_7a7ad9d0b762f0d3;
    float hash_20f159c75c2c7f4e;
    uint16 hash_34c5635e8db13ab3;
    byte hash_54d04e9876cf3bb2;
    float hash_20b0abc2a13dc92b;
    float hash_3772e4882104a032;
    byte hash_1050a7ff012698f8;
    uint32 hash_2d44b36998706f7;
    uint16 hash_383e72b38f06fdef;
    uint32 hash_4d8e465f87a92f48;
    byte result;
    uint32 hash_66838b2bb2c0d307;
    uint16 hash_70f2b19ca673843f;
    uint32 duration_ms;
    uint32 hash_1b0d39256f62ffa4;
    bit hash_5bf606466b9e7bbb;
    padbit __pad[7];
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


