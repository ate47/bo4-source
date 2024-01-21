begin "hash_2b41534c36d68503";
version 5;
metatable "hash_466f3dffc01cfda";

struct root {
    string hash_e37a9bd0a563f60;
    telemetry_header telemetry;
    string hash_1d210b6104a343a1;
    client_header client;
    bit hash_134729ff9a8823cc;
    padbit __pad[7];
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


