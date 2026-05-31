// gamedata/ddl/generated/dlog_event_performance.ddl
// metatable "hash_aee255c2d3ad3ff0"

version 21 {
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
        uint64 game_session_id;
    };

    // idx 2 members 3 size 0xc0
    struct client_header {
        // offset 0x0, size 0x40
        uint64 user_session_id;
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

    // idx 4 members 3 size 0x60
    struct hash_5e4dc4e07696d328 {
        // offset 0x0, size 0x20
        int x;
        // offset 0x20, size 0x20
        int y;
        // offset 0x40, size 0x20
        int z;
    };

    // idx 5 members 4 size 0x80
    struct hash_4bc2231ce039ad50 {
        // offset 0x0, size 0x20
        int avg;
        // offset 0x20, size 0x20
        int max;
        // offset 0x40, size 0x20
        int min;
        // offset 0x60, size 0x20
        int std;
    };

    // idx 6 members 3 size 0x60
    struct hash_3ea575a2be6523f8 {
        // offset 0x0, size 0x20
        float mesh;
        // offset 0x20, size 0x20
        float image;
        // offset 0x40, size 0x20
        float generic;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 33 size 0xbc0
    // offset 0x0, size 0x80
    hash_4bc2231ce039ad50 ui;
    // offset 0x80, size 0x20
    uint player_count;
    // offset 0xa0, size 0x80
    hash_4bc2231ce039ad50 frame;
    // offset 0x120, size 0xc0
    match_header match;
    // offset 0x1e0, size 0x20
    float streamer_image_quality;
    // offset 0x200, size 0x1f8
    telemetry_header telemetry;
    // offset 0x3f8, size 0x60
    hash_3ea575a2be6523f8 stream_weapons;
    // offset 0x458, size 0x80
    hash_4bc2231ce039ad50 clientdraw;
    // offset 0x4d8, size 0x60
    hash_3ea575a2be6523f8 stream_anim;
    // offset 0x538, size 0x60
    hash_3ea575a2be6523f8 stream_none;
    // offset 0x598, size 0x20
    float hash_320012f3ddbd42e1;
    // offset 0x5b8, size 0x20
    float hash_694ebf1c86e2b370;
    // offset 0x5d8, size 0x20
    float streamer_forced;
    // offset 0x5f8, size 0x20
    int hash_41c61675e9a0b2d1;
    // offset 0x618, size 0x20
    float hash_b8a5310b16895f8;
    // offset 0x638, size 0x20
    int streamer_reads;
    // offset 0x658, size 0x20
    float streamer_waste;
    // offset 0x678, size 0x60
    hash_3ea575a2be6523f8 stream_terrain;
    // offset 0x6d8, size 0x60
    hash_5e4dc4e07696d328 camera;
    // offset 0x738, size 0xc0
    client_header client;
    // offset 0x7f8, size 0x60
    hash_3ea575a2be6523f8 stream_env;
    // offset 0x858, size 0x80
    hash_4bc2231ce039ad50 gpuframe;
    // offset 0x8d8, size 0x60
    hash_3ea575a2be6523f8 stream_audio;
    // offset 0x938, size 0x60
    hash_3ea575a2be6523f8 stream_light;
    // offset 0x998, size 0x60
    hash_3ea575a2be6523f8 stream_characters;
    // offset 0x9f8, size 0x60
    hash_3ea575a2be6523f8 stream_vehicles;
    // offset 0xa58, size 0x80
    hash_4bc2231ce039ad50 clientupdate;
    // offset 0xad8, size 0x20
    int hash_6535fe3e4fdf1dab;
    // offset 0xaf8, size 0x60
    hash_3ea575a2be6523f8 stream_fx;
    // offset 0xb58, size 0x60
    hash_3ea575a2be6523f8 stream_ui;
    // offset 0xbb8, size 0x1
    bool is_alive;
    // offset 0xbb9, size 0x1
    bool in_vehicle;
    // offset 0xbba, size 0x6
    uint:1 __pad[6];
}

