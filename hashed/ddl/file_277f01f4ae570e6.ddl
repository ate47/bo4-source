begin "hash_277f01f4ae570e6";
version 2;
metatable "hash_a023609668dc1c47";

struct root {
    hash_4aabf3d6d297186e hash_7f8edb1cd5a272d3;
    telemetry_header telemetry;
    hash_a2a2c8805cc0914 hash_5e4bfcda8096b6e1[16];
    client_header client;
    hash_6a65101a136eab93 header;
};

struct hash_4aabf3d6d297186e {
    uint32 hash_3e3d1b120db91cc8;
    uint32 hash_325802219f696907;
    uint32 hash_4545326e89cd38d8;
    uint16 hash_6282c2f132172388;
    uint32 hash_2a6fcae39ad43a1;
    uint16 hash_310fe31f4220a4bd;
    uint32 hash_7090a8e65737cfe;
    fixedpoint send_timeout;
    uint32 hash_4ed5f043bba32d74;
    uint16 hash_23798c701bcdea4;
    uint32 hash_1f423da65e71efd6;
    uint16 hash_5e07862919680c4a;
    byte nat_type;
    uint32 hash_5aa5063252bd0e0c;
    uint16 hash_14f1eb54888a48c;
    uint32 hash_3b7201e7c31f08d9;
    uint16 hash_7b159647cb4c325;
    byte result;
    uint32 hash_5bb9a16052a3577f;
    uint16 hash_1a0878dd9531a4a7;
    uint32 duration_ms;
    uint32 hash_62762c09afec9add;
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

struct hash_a2a2c8805cc0914 {
    byte packet_type;
    uint32 hash_63d6798714c8e5f6;
    uint16 hash_2602c209d2a3de6a;
    uint32 hash_32e3f837e2ac1c9b;
    bit send_success;
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


