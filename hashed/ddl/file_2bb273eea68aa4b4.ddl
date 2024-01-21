begin "hash_2bb273eea68aa4b4";
version 8;
metatable "hash_c2fe987cf0be14c";

struct root {
    float m_mousesensitivity;
    telemetry_header telemetry;
    int8 cg_fov_default;
    client_header client;
    short weapon_cycle_delay;
    bit healthbar_show_ally;
    bit display_crosshair;
    bit tripwire_alternate;
    bit trophysystem_toggle;
    bit radiation_inversecam;
    bit cursor_immediate_lock_inventory;
    bit ui_play_intro_movies;
    bit healthbar_show_enemy;
    bit hitmarkers_damage_type;
    bit chat_profanity_filter;
    bit show_global_chat;
    bit smartcover_toggle;
    bit supplypod_toggle;
    bit sensordart_toggle;
    bit vehicle_alternate_control_water;
    bit cursor_immediate_lock_map;
    bit spawnbeacon_toggle;
    bit radiation_toggle;
    bit smokescreen_toggle;
    bit show_team_chat;
    bit combataxe_toggle;
    bit cymbal_monkey_toggle;
    bit seeker_mine_toggle;
    bit windows_key_disable;
    bit hitmarkers_enable;
    bit grapple_autohold;
    bit concertina_toggle;
    bit altads_toggle;
    bit molotov_toggle;
    bit vehicle_alternate_control;
    bit claymore_toggle;
    bit weapon_cycle_disable_wrap;
    bit health_regen_toggle;
    bit out_of_ammo_auto_weapon_change;
    bit fraggrenade_toggle;
    bit semtex_toggle;
    bit slowgrenade_toggle;
    bit hash_47195f6ac6b6fe6f;
    bit swatgrenade_toggle;
    bit hash_13f420e6664a4f4b;
    bit show_real_names;
    bit zm_cartoonmode;
    padbit __pad[6];
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


