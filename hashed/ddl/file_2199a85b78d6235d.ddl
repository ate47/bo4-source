// hash_2199a85b78d6235d
// metatable "hash_f20a452c6de82783"

version 32 {
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

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 97 size 0x1118
    // offset 0x0, size 0x20
    float fov;
    // offset 0x20, size 0x20
    int show_performance_graph;
    // offset 0x40, size 0x20
    int backbuffer_count;
    // offset 0x60, size 0x200
    string(64) hash_e5ae34dc2fc2a8e;
    // offset 0x260, size 0x20
    float hash_479281cb96c5c29;
    // offset 0x280, size 0x20
    float voice_scale;
    // offset 0x2a0, size 0x20
    int hash_535789c84c7b3551;
    // offset 0x2c0, size 0x20
    int ssao_technique;
    // offset 0x2e0, size 0x20
    float volumetric_light_sample_mult;
    // offset 0x300, size 0x20
    float mouse_ads_monitor_distance_coefficient;
    // offset 0x320, size 0x20
    int dedicated_player_shadow;
    // offset 0x340, size 0x20
    int hash_519c9a1c0f342950;
    // offset 0x360, size 0x20
    int texture_quality;
    // offset 0x380, size 0x20
    int voice_output_volume;
    // offset 0x3a0, size 0x20
    float auto_cull_radius;
    // offset 0x3c0, size 0x20
    int oit_layers;
    // offset 0x3e0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x5d8, size 0x20
    int max_fps;
    // offset 0x5f8, size 0x20
    int hdr_display_mode;
    // offset 0x618, size 0x20
    int hash_5fe1d750a2b763f5;
    // offset 0x638, size 0x20
    float hash_4c21c0b60674426a;
    // offset 0x658, size 0x20
    int monitor;
    // offset 0x678, size 0x20
    int shadow_viewmodel_self;
    // offset 0x698, size 0x20
    int aa_technique;
    // offset 0x6b8, size 0x20
    int hardware_checksum;
    // offset 0x6d8, size 0x20
    int window_height;
    // offset 0x6f8, size 0x20
    float music_scale;
    // offset 0x718, size 0x20
    float mouse_filter;
    // offset 0x738, size 0x20
    float hash_c33472150c59327;
    // offset 0x758, size 0x20
    float sfx_scale;
    // offset 0x778, size 0x80
    string(16) fullscreen_resolution;
    // offset 0x7f8, size 0x20
    float audio_scale_when_speaking;
    // offset 0x818, size 0x20
    int volumetric_light_quality;
    // offset 0x838, size 0x20
    int texture_filter;
    // offset 0x858, size 0x20
    int last_recommended_driver_nvidia;
    // offset 0x878, size 0x20
    int last_driver_amd;
    // offset 0x898, size 0x20
    int resolution_percent;
    // offset 0x8b8, size 0x20
    int motion_blur_quality;
    // offset 0x8d8, size 0x20
    int max_fps_menu;
    // offset 0x8f8, size 0x20
    int voice_va_sensitivity;
    // offset 0x918, size 0x20
    float hash_636fa57dc7c7380;
    // offset 0x938, size 0x400
    string(128) voice_input_device;
    // offset 0xd38, size 0x20
    int shader_warming;
    // offset 0xd58, size 0x20
    int display_gamma;
    // offset 0xd78, size 0xc0
    client_header client;
    // offset 0xe38, size 0x20
    float mouse_acceleration;
    // offset 0xe58, size 0x20
    int mesh_quality;
    // offset 0xe78, size 0x20
    int hash_5099e577769a5d26;
    // offset 0xe98, size 0x20
    int worker_threads;
    // offset 0xeb8, size 0x20
    int window_x;
    // offset 0xed8, size 0x20
    int window_y;
    // offset 0xef8, size 0x20
    int voice_input_volume;
    // offset 0xf18, size 0x20
    int last_driver_nvidia;
    // offset 0xf38, size 0x20
    float mouse_sensitivity;
    // offset 0xf58, size 0x20
    float cinematic_scale;
    // offset 0xf78, size 0x20
    int motion_blur;
    // offset 0xf98, size 0x20
    float hash_142c297539db271b;
    // offset 0xfb8, size 0x20
    float master_scale;
    // offset 0xfd8, size 0x20
    int window_width;
    // offset 0xff8, size 0x20
    int hash_77afa9e0a9f1e113;
    // offset 0x1018, size 0x20
    int config_version;
    // offset 0x1038, size 0x20
    int fullscreen_mode;
    // offset 0x1058, size 0x20
    float video_memory;
    // offset 0x1078, size 0x20
    int aspect_ratio;
    // offset 0x1098, size 0x20
    int fullscreen_preferred_mode;
    // offset 0x10b8, size 0x20
    int display_adapter;
    // offset 0x10d8, size 0x20
    float refresh_rate;
    // offset 0x10f8, size 0x1
    bool oit;
    // offset 0x10f9, size 0x1
    bool ssr;
    // offset 0x10fa, size 0x1
    bool mouse_vertical_look;
    // offset 0x10fb, size 0x1
    bool vsync;
    // offset 0x10fc, size 0x1
    bool hash_2e3aa1f8f9b20ec3;
    // offset 0x10fd, size 0x1
    bool play_intro_movies;
    // offset 0x10fe, size 0x1
    bool automatic_process_priority;
    // offset 0x10ff, size 0x1
    bool sound_occlusion;
    // offset 0x1100, size 0x1
    bool voice_push_to_talk;
    // offset 0x1101, size 0x1
    bool window_maximized;
    // offset 0x1102, size 0x1
    bool splitscreen_orientation;
    // offset 0x1103, size 0x1
    bool disable_dynamic_light_shadows;
    // offset 0x1104, size 0x1
    bool mute_music;
    // offset 0x1105, size 0x1
    bool mute_voice;
    // offset 0x1106, size 0x1
    bool hash_3f8ede290237f45;
    // offset 0x1107, size 0x1
    bool relative_ads_fov;
    // offset 0x1108, size 0x1
    bool hash_1626188c0e090458;
    // offset 0x1109, size 0x1
    bool shadow_filtering;
    // offset 0x110a, size 0x1
    bool mute_master;
    // offset 0x110b, size 0x1
    bool hash_147e6efaa5286f59;
    // offset 0x110c, size 0x1
    bool enable_voice;
    // offset 0x110d, size 0x1
    bool smooth_framerate;
    // offset 0x110e, size 0x1
    bool vsync_menu;
    // offset 0x110f, size 0x1
    bool enable_scale_when_speaking;
    // offset 0x1110, size 0x1
    bool disable_dynamic_sun_shadows;
    // offset 0x1111, size 0x1
    bool hash_30d8f5939d58ba43;
    // offset 0x1112, size 0x1
    bool fx_shadows;
    // offset 0x1113, size 0x1
    bool mouse_ads_use_monitor_distance;
    // offset 0x1114, size 0x1
    bool subsurface_scattering;
    // offset 0x1115, size 0x3
    uint:1 __pad[3];
}

