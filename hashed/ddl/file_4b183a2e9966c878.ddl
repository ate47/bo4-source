begin "hash_4b183a2e9966c878";
version 2;
metatable "hash_d2de2434185074f8";

struct root {
    int32 party_size;
    telemetry_header telemetry;
    int32 hash_2dc6184a8ee2b80b;
    int32 hash_1e6cbdb3e41597ac;
    string join_state;
    int32 hash_607616ff980b70cb;
    hash_405641015bd81f7d nat_type;
    client_header client;
    uint64 host_xuid;
    hash_444b6eb55bc9535 join_type;
    string hash_5aad3c28269ed622;
    int32 hash_1a1a1855f4dcf27c;
    bit hash_5a10df4d02164354;
    padbit __pad[7];
};

enum hash_444b6eb55bc9535 {
    "join_type_friend" = 0x0,
    "join_type_playlist" = 0x1,
    "join_type_normal" = 0x2,
    "join_type_invite" = 0x3,
    "join_type_groups" = 0x4,
    "join_type_party" = 0x5
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

enum hash_405641015bd81f7d {
    "xonline_nat_unknown" = 0x0,
    "xonline_nat_open" = 0x1,
    "xonline_nat_strict" = 0x2,
    "xonline_nat_moderate" = 0x3
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


