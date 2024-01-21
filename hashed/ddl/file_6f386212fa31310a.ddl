begin "hash_6f386212fa31310a";
version 14;
metatable "hash_a41f60f37193184a";

struct root {
    char note[256];
    int32 tris;
    int32 hash_140eebac2db85c70;
    match_header match;
    int32 pitch;
    int32 pos_x;
    int32 pos_y;
    int32 pos_z;
    int32 prims;
    int32 r_add;
    int32 res_x;
    int32 res_y;
    int32 hash_44c564263d01daef;
    int32 hash_3eb9b2bad5a4824e;
    int32 hash_3d77cd928bcbf989;
    int32 hash_6d4ff87574778d15;
    int32 hash_4f1a9574545864a7;
    int32 hash_39386dbff2e0a33e;
    int32 hash_4c6268a110003ace;
    int32 hash_71f07d4c116bd6b8;
    int32 hash_343d1f95fb411155;
    int32 hash_1b4c57d449e4521f;
    int32 gbuffer_decal_us;
    int32 hash_3ab6d1745e2b7e90;
    telemetry_header telemetry;
    int32 hash_3877ff2ec0c3726a;
    int32 heading;
    int32 hash_48015bf58d08e2f8;
    int32 num_players;
    int32 spot_prims;
    int32 hash_40138199e1f36fb3;
    int32 gbuffer_us;
    int32 hash_3ce5cfa8c7fb3c2b;
    int32 omni_vis;
    int32 hash_2b26423944fd8c18;
    int32 sonar_us;
    int32 hash_6ace4575d3599cbf;
    int32 r_sceneents;
    int32 oit_apply_us;
    int32 hash_37c8818eff41553d;
    int32 gbuffer_ent_us;
    int32 hash_4d1666c58d7cded2;
    int32 hash_3e4ef5c97a00536;
    int32 hash_2fe48e82bcbfe70a;
    int32 postfx_us;
    int32 sun_prims;
    int32 hash_46fac4fb33c48479;
    int32 hash_7aba43e3e27f0c31;
    int32 hash_643bdb1bb050ea50;
    int32 hash_3dde17604d35e8f6;
    int32 hash_316878e795d258e6;
    int32 volume_us;
    int32 gbuffer_decal_tris;
    int32 r_add_spot;
    int32 oit_prims;
    int32 oit_tris;
    int32 spot_us;
    int32 gbuffer_ent_tris;
    int32 hash_2225500989344102;
    int32 hash_1ce4da326bbab5e8;
    int32 gbuffer_prims;
    int32 spot_vis;
    int32 hash_68ffafe7e480d3ae;
    int32 sun_tris;
    int32 hash_543c86390c71d4e5;
    int32 r_draw_lit;
    int32 frame_us;
    int32 hash_6c98e0d8c2869ef1;
    int32 hash_58797c0cf11d0fe0;
    int32 gbuffer_ent_prims;
    int32 prepass_prims;
    int32 hash_4350a21ab86316a0;
    client_header client;
    int32 hash_6c151dd059c63f48;
    int32 omni_us;
    int32 prepass_us;
    int32 gpu_us;
    int32 hash_6fd93d17cdb0ae1d;
    int32 emissive_us;
    int32 hash_17123c8692c7160f;
    int32 hash_5010b6ad6d989cb0;
    int32 r_draw_depth;
    int32 hash_28d2a05d88a0d700;
    int32 lit_us;
    int32 umbra_time;
    int32 umbra_work;
    int32 hash_53ce5582cb1ef0d9;
    int32 hash_128197788f1faf30;
    int32 sss_blur_us;
    int32 hash_58213d392b486455;
    int32 spot_tris;
    int32 hash_633a5d0864db2db;
    int32 sun_us;
    int32 hash_6f0f73b0e722f7f0;
    int32 prepass_tris;
    int32 fx_prims;
    int32 gbuffer_tris;
    int32 hash_18f81647069f3ecc;
    int32 hash_6a9405795c69d6cb;
    int32 fx_draw;
    int32 fx_tris;
    int32 hash_7ed0f0a69ff8404d;
    int32 light_cull_us;
    int32 hash_411d2563b3718ec7;
    int32 compute_sprites;
    int32 oit_draw_us;
    int32 gbuffer_decal_prims;
    int32 deferred_us;
    int32 lights_vis;
    int32 hash_7b7cd1e6d2f4ffbb;
    int32 hash_3a5c956b32dddbc2;
    int32 hash_63a28cae4ed60f27;
    bit hash_6f63d386e78df2d9;
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


