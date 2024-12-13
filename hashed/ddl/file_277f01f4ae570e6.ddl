// hash_277f01f4ae570e6
// metatable "hash_a023609668dc1c47"

version 2 {
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

    // idx 3 members 22 size 0x220
    struct hash_4aabf3d6d297186e {
        // offset 0x0, size 0x20
        uint hash_3e3d1b120db91cc8;
        // offset 0x20, size 0x20
        uint hash_325802219f696907;
        // offset 0x40, size 0x20
        uint hash_4545326e89cd38d8;
        // offset 0x60, size 0x10
        uint:16 hash_6282c2f132172388;
        // offset 0x70, size 0x20
        uint hash_2a6fcae39ad43a1;
        // offset 0x90, size 0x10
        uint:16 hash_310fe31f4220a4bd;
        // offset 0xa0, size 0x20
        uint hash_7090a8e65737cfe;
        // offset 0xc0, size 0x20
        float send_timeout;
        // offset 0xe0, size 0x20
        uint hash_4ed5f043bba32d74;
        // offset 0x100, size 0x10
        uint:16 hash_23798c701bcdea4;
        // offset 0x110, size 0x20
        uint hash_1f423da65e71efd6;
        // offset 0x130, size 0x10
        uint:16 hash_5e07862919680c4a;
        // offset 0x140, size 0x8
        byte nat_type;
        // offset 0x148, size 0x20
        uint hash_5aa5063252bd0e0c;
        // offset 0x168, size 0x10
        uint:16 hash_14f1eb54888a48c;
        // offset 0x178, size 0x20
        uint hash_3b7201e7c31f08d9;
        // offset 0x198, size 0x10
        uint:16 hash_7b159647cb4c325;
        // offset 0x1a8, size 0x8
        byte result;
        // offset 0x1b0, size 0x20
        uint hash_5bb9a16052a3577f;
        // offset 0x1d0, size 0x10
        uint:16 hash_1a0878dd9531a4a7;
        // offset 0x1e0, size 0x20
        uint duration_ms;
        // offset 0x200, size 0x20
        uint hash_62762c09afec9add;
    };

    // idx 4 members 6 size 0x60
    struct hash_a2a2c8805cc0914 {
        // offset 0x0, size 0x8
        byte packet_type;
        // offset 0x8, size 0x20
        uint hash_63d6798714c8e5f6;
        // offset 0x28, size 0x10
        uint:16 hash_2602c209d2a3de6a;
        // offset 0x38, size 0x20
        uint hash_32e3f837e2ac1c9b;
        // offset 0x58, size 0x1
        bool send_success;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 5 members 5 size 0x120
    struct hash_6a65101a136eab93 {
        // offset 0x0, size 0x40
        uint64 hash_6bdd7ebe59310aa2;
        // offset 0x40, size 0x40
        uint64 lobby_id;
        // offset 0x80, size 0x20
        uint title_id;
        // offset 0xa0, size 0x40
        uint64 hash_426fb7404d1fbf32;
        // offset 0xe0, size 0x40
        uint64 user_id;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 5 size 0xbf8
    // offset 0x0, size 0x220
    hash_4aabf3d6d297186e hash_7f8edb1cd5a272d3;
    // offset 0x220, size 0x1f8
    telemetry_header telemetry;
    // offset 0x418, size 0x600
    hash_a2a2c8805cc0914 hash_5e4bfcda8096b6e1[16];
    // offset 0xa18, size 0xc0
    client_header client;
    // offset 0xad8, size 0x120
    hash_6a65101a136eab93 header;
}

