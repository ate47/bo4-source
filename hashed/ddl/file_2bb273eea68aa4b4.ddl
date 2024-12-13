// hash_2bb273eea68aa4b4
// metatable "hash_c2fe987cf0be14c"

version 8 {
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

    // idx 0 members 48 size 0x320
    // offset 0x0, size 0x20
    float m_mousesensitivity;
    // offset 0x20, size 0x1f8
    telemetry_header telemetry;
    // offset 0x218, size 0x8
    int:8 cg_fov_default;
    // offset 0x220, size 0xc0
    client_header client;
    // offset 0x2e0, size 0x10
    short weapon_cycle_delay;
    // offset 0x2f0, size 0x1
    bool healthbar_show_ally;
    // offset 0x2f1, size 0x1
    bool display_crosshair;
    // offset 0x2f2, size 0x1
    bool tripwire_alternate;
    // offset 0x2f3, size 0x1
    bool trophysystem_toggle;
    // offset 0x2f4, size 0x1
    bool radiation_inversecam;
    // offset 0x2f5, size 0x1
    bool cursor_immediate_lock_inventory;
    // offset 0x2f6, size 0x1
    bool ui_play_intro_movies;
    // offset 0x2f7, size 0x1
    bool healthbar_show_enemy;
    // offset 0x2f8, size 0x1
    bool hitmarkers_damage_type;
    // offset 0x2f9, size 0x1
    bool chat_profanity_filter;
    // offset 0x2fa, size 0x1
    bool show_global_chat;
    // offset 0x2fb, size 0x1
    bool smartcover_toggle;
    // offset 0x2fc, size 0x1
    bool supplypod_toggle;
    // offset 0x2fd, size 0x1
    bool sensordart_toggle;
    // offset 0x2fe, size 0x1
    bool vehicle_alternate_control_water;
    // offset 0x2ff, size 0x1
    bool cursor_immediate_lock_map;
    // offset 0x300, size 0x1
    bool spawnbeacon_toggle;
    // offset 0x301, size 0x1
    bool radiation_toggle;
    // offset 0x302, size 0x1
    bool smokescreen_toggle;
    // offset 0x303, size 0x1
    bool show_team_chat;
    // offset 0x304, size 0x1
    bool combataxe_toggle;
    // offset 0x305, size 0x1
    bool cymbal_monkey_toggle;
    // offset 0x306, size 0x1
    bool seeker_mine_toggle;
    // offset 0x307, size 0x1
    bool windows_key_disable;
    // offset 0x308, size 0x1
    bool hitmarkers_enable;
    // offset 0x309, size 0x1
    bool grapple_autohold;
    // offset 0x30a, size 0x1
    bool concertina_toggle;
    // offset 0x30b, size 0x1
    bool altads_toggle;
    // offset 0x30c, size 0x1
    bool molotov_toggle;
    // offset 0x30d, size 0x1
    bool vehicle_alternate_control;
    // offset 0x30e, size 0x1
    bool claymore_toggle;
    // offset 0x30f, size 0x1
    bool weapon_cycle_disable_wrap;
    // offset 0x310, size 0x1
    bool health_regen_toggle;
    // offset 0x311, size 0x1
    bool out_of_ammo_auto_weapon_change;
    // offset 0x312, size 0x1
    bool fraggrenade_toggle;
    // offset 0x313, size 0x1
    bool semtex_toggle;
    // offset 0x314, size 0x1
    bool slowgrenade_toggle;
    // offset 0x315, size 0x1
    bool hash_47195f6ac6b6fe6f;
    // offset 0x316, size 0x1
    bool swatgrenade_toggle;
    // offset 0x317, size 0x1
    bool hash_13f420e6664a4f4b;
    // offset 0x318, size 0x1
    bool show_real_names;
    // offset 0x319, size 0x1
    bool zm_cartoonmode;
    // offset 0x31a, size 0x6
    uint:1 __pad[6];
}

