begin "hash_46bbed37a0b8b16c";
version 12;
metatable "hash_2f0c0bb5672abd3f";

struct root {
    match_header match;
    byte roundnumber;
    int32 playerhealth;
    int32 playertotalscore;
    char zone_name[64];
    int32 playerkills;
    telemetry_header telemetry;
    hash itemname;
    char itemtype[128];
    float selleroriginx;
    float selleroriginy;
    float selleroriginz;
    int32 purchasecost;
    int32 gametime;
    int32 playercurrentscore;
    client_header client;
    int32 playerspawnid;
    char username[48];
    float playeroriginx;
    float playeroriginy;
    float playeroriginz;
    bit isupgraded;
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


