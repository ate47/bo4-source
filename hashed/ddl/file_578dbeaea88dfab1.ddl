begin "hash_578dbeaea88dfab1";
version 3;
metatable "hash_c06e67528eb3a05";

struct root {
    uint64 xuid;
    int32 skill;
    int32 hash_671438d91ee14a83;
    telemetry_header telemetry;
    uint64 hash_34f06c6eeda8117e;
    int32 hash_3c83aaf4b52386c5;
    client_header client;
    int32 protocol;
    char status[32];
    char hash_70259f4fbb3f7a05[64];
    uint64 host_xuid;
    int32 hash_3155d04edc797a1a;
    char hash_1531894bfd7141d0[48];
    int32 largest_party;
    int32 latency;
    char hash_df1f57dcd0a3e0a[48];
    bit is_mp;
    bit is_migrating;
    bit hash_460665ebc12305d7;
    bit hash_756c01933e1c7b2e;
    bit valid_result;
    bit hash_60ff95c0713324a4;
    bit is_dedicated;
    padbit __pad[1];
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


