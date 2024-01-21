begin "hash_2199a85b78d6235d";
version 32;
metatable "hash_f20a452c6de82783";

struct root {
    fixedpoint fov;
    int32 show_performance_graph;
    int32 backbuffer_count;
    string hash_e5ae34dc2fc2a8e;
    fixedpoint hash_479281cb96c5c29;
    fixedpoint voice_scale;
    int32 hash_535789c84c7b3551;
    int32 ssao_technique;
    fixedpoint volumetric_light_sample_mult;
    fixedpoint mouse_ads_monitor_distance_coefficient;
    int32 dedicated_player_shadow;
    int32 hash_519c9a1c0f342950;
    int32 texture_quality;
    int32 voice_output_volume;
    fixedpoint auto_cull_radius;
    int32 oit_layers;
    telemetry_header telemetry;
    int32 max_fps;
    int32 hdr_display_mode;
    int32 hash_5fe1d750a2b763f5;
    fixedpoint hash_4c21c0b60674426a;
    int32 monitor;
    int32 shadow_viewmodel_self;
    int32 aa_technique;
    int32 hardware_checksum;
    int32 window_height;
    fixedpoint music_scale;
    fixedpoint hash_6223c48b02c476f3;
    fixedpoint hash_c33472150c59327;
    fixedpoint sfx_scale;
    string fullscreen_resolution;
    fixedpoint audio_scale_when_speaking;
    int32 volumetric_light_quality;
    int32 texture_filter;
    int32 last_recommended_driver_nvidia;
    int32 last_driver_amd;
    int32 resolution_percent;
    int32 motion_blur_quality;
    int32 max_fps_menu;
    int32 voice_va_sensitivity;
    fixedpoint hash_636fa57dc7c7380;
    string voice_input_device;
    int32 hash_3c743995018d880;
    int32 display_gamma;
    client_header client;
    fixedpoint mouse_acceleration;
    int32 mesh_quality;
    int32 hash_5099e577769a5d26;
    int32 worker_threads;
    int32 window_x;
    int32 window_y;
    int32 voice_input_volume;
    int32 last_driver_nvidia;
    fixedpoint mouse_sensitivity;
    fixedpoint cinematic_scale;
    int32 motion_blur;
    fixedpoint hash_142c297539db271b;
    fixedpoint master_scale;
    int32 window_width;
    int32 hash_77afa9e0a9f1e113;
    int32 config_version;
    int32 fullscreen_mode;
    fixedpoint video_memory;
    int32 aspect_ratio;
    int32 fullscreen_preferred_mode;
    int32 display_adapter;
    fixedpoint refresh_rate;
    bit oit;
    bit ssr;
    bit mouse_vertical_look;
    bit vsync;
    bit hash_2e3aa1f8f9b20ec3;
    bit play_intro_movies;
    bit automatic_process_priority;
    bit sound_occlusion;
    bit voice_push_to_talk;
    bit window_maximized;
    bit splitscreen_orientation;
    bit disable_dynamic_light_shadows;
    bit mute_music;
    bit mute_voice;
    bit hash_3f8ede290237f45;
    bit relative_ads_fov;
    bit hash_1626188c0e090458;
    bit shadow_filtering;
    bit mute_master;
    bit hash_147e6efaa5286f59;
    bit enable_voice;
    bit smooth_framerate;
    bit vsync_menu;
    bit enable_scale_when_speaking;
    bit disable_dynamic_sun_shadows;
    bit hash_30d8f5939d58ba43;
    bit fx_shadows;
    bit mouse_ads_use_monitor_distance;
    bit subsurface_scattering;
    padbit __pad[3];
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


