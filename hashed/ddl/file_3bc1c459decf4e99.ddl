begin "hash_3bc1c459decf4e99";
version 18;
metatable "hash_c9441f66dcfb81c";

struct root {
    uint32 vram;
    char hash_589ec9042dd9446e[128];
    uint16 scene_width;
    uint16 dxver;
    hash_6f622749aa2bbcbe hash_45c4c0c903afe1d3[8];
    int32 hash_575babb760c1609f;
    char hash_50df550fdeb21d69[64];
    uint16 hash_79719197fcd5039f;
    int32 hash_4a2353ab17a0b583;
    int32 hash_4a2659ab17a2f58c;
    int32 hash_674b4bab754b1e14;
    int32 hash_674f51ab754f111d;
    uint16 hash_2bcdf372470d05f9;
    char os_version[512];
    int32 hash_5396540bb72f02c9;
    int32 hash_53a7520bb73d7296;
    telemetry_header telemetry;
    char hash_766b023cc3930121[64];
    char hash_2277d86d308b47d[128];
    byte hash_53a792e4d6795b08;
    char hash_53f3cf8d6b5d6f98[16];
    byte hash_76254b39c666fad6;
    uint32 hash_6a0c81df1fd299d0;
    uint16 hash_16763e9f1eeee675;
    uint32 hash_3811bc485fc9bc1d;
    char hash_4605d0cc4d9e3750[64];
    char hash_7d22e6b66b02ad27[128];
    byte hash_673fd948a5a9378d;
    uint16 hash_5377a87f623af6b7;
    uint16 hash_3aca7e641540dbd9;
    uint64 hash_42c8ba9f799f6132;
    int32 language;
    uint16 display_width;
    client_header client;
    uint32 hash_78cb8b567c4d2cea;
    float hash_50721d3ddc064237;
    byte hash_2d73b88a401c9b9e;
    uint32 hash_7573068d7b84d80a;
    uint32 hash_39f8059a58f3215;
    uint16 hash_434b7866cb18cbb6;
    uint32 hash_18573ac79710b5f3;
    char winver[128];
    char hash_381564915200bec1[128];
    uint32 hash_677e1a171188e031;
    char hash_bf62b1b1fc4261[128];
    uint16 hash_56f1c71f4a8c729d;
    float refresh_rate;
    int8 hash_30bdfaf4ba9b4387;
    bit hash_4741579e93e4fff2;
    bit hash_5509126391fabbea;
    bit hash_2b948819b7fded62;
    bit hash_6e966e869ea972fb;
    bit hash_fdc5b9653d078ee;
    bit hash_6f954264048addf8;
    bit hash_b5093b3a47a3ef0;
    bit hash_85c7bd324ffbc53;
    bit hash_4015c9179aa19318;
    padbit __pad[7];
};

struct hash_6f622749aa2bbcbe {
    uint32 vram;
    uint32 device_id;
    char description[128];
    uint32 hash_5e7e1e051052d469;
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


