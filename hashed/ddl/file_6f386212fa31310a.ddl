// hash_6f386212fa31310a
// metatable "hash_a41f60f37193184a"

version 14 {
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

    // idx 3 members 3 size 0xc0
    struct match_header {
        // offset 0x0, size 0x40
        uint64 match_id;
        // offset 0x40, size 0x40
        uint64 hash_c05315ddb26eb93;
        // offset 0x80, size 0x40
        uint64 lobby_id;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 114 size 0x1900
    // offset 0x0, size 0x800
    string(256) note;
    // offset 0x800, size 0x20
    int tris;
    // offset 0x820, size 0x20
    int hash_140eebac2db85c70;
    // offset 0x840, size 0xc0
    match_header match;
    // offset 0x900, size 0x20
    int pitch;
    // offset 0x920, size 0x20
    int pos_x;
    // offset 0x940, size 0x20
    int pos_y;
    // offset 0x960, size 0x20
    int pos_z;
    // offset 0x980, size 0x20
    int prims;
    // offset 0x9a0, size 0x20
    int r_add;
    // offset 0x9c0, size 0x20
    int res_x;
    // offset 0x9e0, size 0x20
    int res_y;
    // offset 0xa00, size 0x20
    int hash_44c564263d01daef;
    // offset 0xa20, size 0x20
    int hash_3eb9b2bad5a4824e;
    // offset 0xa40, size 0x20
    int hash_3d77cd928bcbf989;
    // offset 0xa60, size 0x20
    int hash_6d4ff87574778d15;
    // offset 0xa80, size 0x20
    int hash_4f1a9574545864a7;
    // offset 0xaa0, size 0x20
    int hash_39386dbff2e0a33e;
    // offset 0xac0, size 0x20
    int hash_4c6268a110003ace;
    // offset 0xae0, size 0x20
    int hash_71f07d4c116bd6b8;
    // offset 0xb00, size 0x20
    int hash_343d1f95fb411155;
    // offset 0xb20, size 0x20
    int hash_1b4c57d449e4521f;
    // offset 0xb40, size 0x20
    int gbuffer_decal_us;
    // offset 0xb60, size 0x20
    int hash_3ab6d1745e2b7e90;
    // offset 0xb80, size 0x1f8
    telemetry_header telemetry;
    // offset 0xd78, size 0x20
    int hash_3877ff2ec0c3726a;
    // offset 0xd98, size 0x20
    int heading;
    // offset 0xdb8, size 0x20
    int hash_48015bf58d08e2f8;
    // offset 0xdd8, size 0x20
    int num_players;
    // offset 0xdf8, size 0x20
    int spot_prims;
    // offset 0xe18, size 0x20
    int hash_40138199e1f36fb3;
    // offset 0xe38, size 0x20
    int gbuffer_us;
    // offset 0xe58, size 0x20
    int hash_3ce5cfa8c7fb3c2b;
    // offset 0xe78, size 0x20
    int omni_vis;
    // offset 0xe98, size 0x20
    int hash_2b26423944fd8c18;
    // offset 0xeb8, size 0x20
    int sonar_us;
    // offset 0xed8, size 0x20
    int hash_6ace4575d3599cbf;
    // offset 0xef8, size 0x20
    int r_sceneents;
    // offset 0xf18, size 0x20
    int oit_apply_us;
    // offset 0xf38, size 0x20
    int hash_37c8818eff41553d;
    // offset 0xf58, size 0x20
    int gbuffer_ent_us;
    // offset 0xf78, size 0x20
    int hash_4d1666c58d7cded2;
    // offset 0xf98, size 0x20
    int hash_3e4ef5c97a00536;
    // offset 0xfb8, size 0x20
    int hash_2fe48e82bcbfe70a;
    // offset 0xfd8, size 0x20
    int postfx_us;
    // offset 0xff8, size 0x20
    int sun_prims;
    // offset 0x1018, size 0x20
    int hash_46fac4fb33c48479;
    // offset 0x1038, size 0x20
    int hash_7aba43e3e27f0c31;
    // offset 0x1058, size 0x20
    int hash_643bdb1bb050ea50;
    // offset 0x1078, size 0x20
    int hash_3dde17604d35e8f6;
    // offset 0x1098, size 0x20
    int hash_316878e795d258e6;
    // offset 0x10b8, size 0x20
    int volume_us;
    // offset 0x10d8, size 0x20
    int gbuffer_decal_tris;
    // offset 0x10f8, size 0x20
    int r_add_spot;
    // offset 0x1118, size 0x20
    int oit_prims;
    // offset 0x1138, size 0x20
    int oit_tris;
    // offset 0x1158, size 0x20
    int spot_us;
    // offset 0x1178, size 0x20
    int gbuffer_ent_tris;
    // offset 0x1198, size 0x20
    int hash_2225500989344102;
    // offset 0x11b8, size 0x20
    int hash_1ce4da326bbab5e8;
    // offset 0x11d8, size 0x20
    int gbuffer_prims;
    // offset 0x11f8, size 0x20
    int spot_vis;
    // offset 0x1218, size 0x20
    int hash_68ffafe7e480d3ae;
    // offset 0x1238, size 0x20
    int sun_tris;
    // offset 0x1258, size 0x20
    int hash_543c86390c71d4e5;
    // offset 0x1278, size 0x20
    int r_draw_lit;
    // offset 0x1298, size 0x20
    int frame_us;
    // offset 0x12b8, size 0x20
    int hash_6c98e0d8c2869ef1;
    // offset 0x12d8, size 0x20
    int hash_58797c0cf11d0fe0;
    // offset 0x12f8, size 0x20
    int gbuffer_ent_prims;
    // offset 0x1318, size 0x20
    int prepass_prims;
    // offset 0x1338, size 0x20
    int hash_4350a21ab86316a0;
    // offset 0x1358, size 0xc0
    client_header client;
    // offset 0x1418, size 0x20
    int hash_6c151dd059c63f48;
    // offset 0x1438, size 0x20
    int omni_us;
    // offset 0x1458, size 0x20
    int prepass_us;
    // offset 0x1478, size 0x20
    int gpu_us;
    // offset 0x1498, size 0x20
    int hash_6fd93d17cdb0ae1d;
    // offset 0x14b8, size 0x20
    int emissive_us;
    // offset 0x14d8, size 0x20
    int hash_17123c8692c7160f;
    // offset 0x14f8, size 0x20
    int hash_5010b6ad6d989cb0;
    // offset 0x1518, size 0x20
    int r_draw_depth;
    // offset 0x1538, size 0x20
    int hash_28d2a05d88a0d700;
    // offset 0x1558, size 0x20
    int lit_us;
    // offset 0x1578, size 0x20
    int umbra_time;
    // offset 0x1598, size 0x20
    int umbra_work;
    // offset 0x15b8, size 0x20
    int hash_53ce5582cb1ef0d9;
    // offset 0x15d8, size 0x20
    int hash_128197788f1faf30;
    // offset 0x15f8, size 0x20
    int sss_blur_us;
    // offset 0x1618, size 0x20
    int r_dpvs;
    // offset 0x1638, size 0x20
    int spot_tris;
    // offset 0x1658, size 0x20
    int hash_633a5d0864db2db;
    // offset 0x1678, size 0x20
    int sun_us;
    // offset 0x1698, size 0x20
    int hash_6f0f73b0e722f7f0;
    // offset 0x16b8, size 0x20
    int prepass_tris;
    // offset 0x16d8, size 0x20
    int fx_prims;
    // offset 0x16f8, size 0x20
    int gbuffer_tris;
    // offset 0x1718, size 0x20
    int hash_18f81647069f3ecc;
    // offset 0x1738, size 0x20
    int hash_6a9405795c69d6cb;
    // offset 0x1758, size 0x20
    int fx_draw;
    // offset 0x1778, size 0x20
    int fx_tris;
    // offset 0x1798, size 0x20
    int hash_7ed0f0a69ff8404d;
    // offset 0x17b8, size 0x20
    int light_cull_us;
    // offset 0x17d8, size 0x20
    int hash_411d2563b3718ec7;
    // offset 0x17f8, size 0x20
    int compute_sprites;
    // offset 0x1818, size 0x20
    int oit_draw_us;
    // offset 0x1838, size 0x20
    int gbuffer_decal_prims;
    // offset 0x1858, size 0x20
    int deferred_us;
    // offset 0x1878, size 0x20
    int lights_vis;
    // offset 0x1898, size 0x20
    int hash_7b7cd1e6d2f4ffbb;
    // offset 0x18b8, size 0x20
    int hash_3a5c956b32dddbc2;
    // offset 0x18d8, size 0x20
    int hash_63a28cae4ed60f27;
    // offset 0x18f8, size 0x1
    bool hash_6f63d386e78df2d9;
    // offset 0x18f9, size 0x7
    uint:1 __pad[7];
}

