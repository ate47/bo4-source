// hash_3bc1c459decf4e99
// metatable "hash_c9441f66dcfb81c"

version 18 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 3 size 0xc0
    struct client_header {
        // offset 0x0, size 0x40
        uint64 hash_4016bed15f9183f7;
        // offset 0x40, size 0x40
        uint64 uno_id;
        // offset 0x80, size 0x40
        uint64 user_id;
    };

    // idx 3 members 4 size 0x460
    struct hash_6f622749aa2bbcbe {
        // offset 0x0, size 0x20
        uint vram;
        // offset 0x20, size 0x20
        uint device_id;
        // offset 0x40, size 0x400
        string(128) description;
        // offset 0x440, size 0x20
        uint vendor_id;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 58 size 0x5790
    // offset 0x0, size 0x20
    uint vram;
    // offset 0x20, size 0x400
    string(128) hash_589ec9042dd9446e;
    // offset 0x420, size 0x10
    uint:16 scene_width;
    // offset 0x430, size 0x10
    uint:16 dxver;
    // offset 0x440, size 0x2300
    hash_6f622749aa2bbcbe hash_45c4c0c903afe1d3[8];
    // offset 0x2740, size 0x20
    int hash_575babb760c1609f;
    // offset 0x2760, size 0x200
    string(64) hash_50df550fdeb21d69;
    // offset 0x2960, size 0x10
    uint:16 hash_79719197fcd5039f;
    // offset 0x2970, size 0x20
    int hash_4a2353ab17a0b583;
    // offset 0x2990, size 0x20
    int hash_4a2659ab17a2f58c;
    // offset 0x29b0, size 0x20
    int hash_674b4bab754b1e14;
    // offset 0x29d0, size 0x20
    int hash_674f51ab754f111d;
    // offset 0x29f0, size 0x10
    uint:16 hash_2bcdf372470d05f9;
    // offset 0x2a00, size 0x1000
    string(512) os_version;
    // offset 0x3a00, size 0x20
    int hash_5396540bb72f02c9;
    // offset 0x3a20, size 0x20
    int hash_53a7520bb73d7296;
    // offset 0x3a40, size 0x1f8
    telemetry_header telemetry;
    // offset 0x3c38, size 0x200
    string(64) hash_766b023cc3930121;
    // offset 0x3e38, size 0x400
    string(128) hash_2277d86d308b47d;
    // offset 0x4238, size 0x8
    byte hash_53a792e4d6795b08;
    // offset 0x4240, size 0x80
    string(16) hash_53f3cf8d6b5d6f98;
    // offset 0x42c0, size 0x8
    byte hash_76254b39c666fad6;
    // offset 0x42c8, size 0x20
    uint hash_6a0c81df1fd299d0;
    // offset 0x42e8, size 0x10
    uint:16 hash_16763e9f1eeee675;
    // offset 0x42f8, size 0x20
    uint hash_3811bc485fc9bc1d;
    // offset 0x4318, size 0x200
    string(64) hash_4605d0cc4d9e3750;
    // offset 0x4518, size 0x400
    string(128) hash_7d22e6b66b02ad27;
    // offset 0x4918, size 0x8
    byte hash_673fd948a5a9378d;
    // offset 0x4920, size 0x10
    uint:16 hash_5377a87f623af6b7;
    // offset 0x4930, size 0x10
    uint:16 hash_3aca7e641540dbd9;
    // offset 0x4940, size 0x40
    uint64 hash_42c8ba9f799f6132;
    // offset 0x4980, size 0x20
    int language;
    // offset 0x49a0, size 0x10
    uint:16 display_width;
    // offset 0x49b0, size 0xc0
    client_header client;
    // offset 0x4a70, size 0x20
    uint hash_78cb8b567c4d2cea;
    // offset 0x4a90, size 0x20
    float hash_50721d3ddc064237;
    // offset 0x4ab0, size 0x8
    byte hash_2d73b88a401c9b9e;
    // offset 0x4ab8, size 0x20
    uint hash_7573068d7b84d80a;
    // offset 0x4ad8, size 0x20
    uint hash_39f8059a58f3215;
    // offset 0x4af8, size 0x10
    uint:16 hash_434b7866cb18cbb6;
    // offset 0x4b08, size 0x20
    uint sysmem;
    // offset 0x4b28, size 0x400
    string(128) winver;
    // offset 0x4f28, size 0x400
    string(128) hash_381564915200bec1;
    // offset 0x5328, size 0x20
    uint hash_677e1a171188e031;
    // offset 0x5348, size 0x400
    string(128) hash_bf62b1b1fc4261;
    // offset 0x5748, size 0x10
    uint:16 hash_56f1c71f4a8c729d;
    // offset 0x5758, size 0x20
    float refresh_rate;
    // offset 0x5778, size 0x8
    int:8 hash_30bdfaf4ba9b4387;
    // offset 0x5780, size 0x1
    bool hash_4741579e93e4fff2;
    // offset 0x5781, size 0x1
    bool hash_5509126391fabbea;
    // offset 0x5782, size 0x1
    bool hash_2b948819b7fded62;
    // offset 0x5783, size 0x1
    bool hash_6e966e869ea972fb;
    // offset 0x5784, size 0x1
    bool hash_fdc5b9653d078ee;
    // offset 0x5785, size 0x1
    bool hash_6f954264048addf8;
    // offset 0x5786, size 0x1
    bool hash_b5093b3a47a3ef0;
    // offset 0x5787, size 0x1
    bool hash_85c7bd324ffbc53;
    // offset 0x5788, size 0x1
    bool hash_4015c9179aa19318;
    // offset 0x5789, size 0x7
    uint:1 __pad[7];
}

