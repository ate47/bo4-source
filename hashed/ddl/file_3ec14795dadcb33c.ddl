// hash_3ec14795dadcb33c
// metatable "hash_75d98561f6fafb34"

version 23 {
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

    // idx 4 members 14 size 0x810
    struct hash_5824d549adab1dc4 {
        // offset 0x0, size 0x40
        xhash starting_team;
        // offset 0x40, size 0x20
        int esports_flag;
        // offset 0x60, size 0x100
        string(32) hash_236307b2e3de4586;
        // offset 0x160, size 0x100
        string(32) player_xuid;
        // offset 0x260, size 0x40
        xhash game_type;
        // offset 0x2a0, size 0x400
        string(128) player_ip;
        // offset 0x6a0, size 0x100
        string(32) game_map;
        // offset 0x7a0, size 0x40
        xhash ending_team;
        // offset 0x7e0, size 0x8
        hash_61d8fb71b3cca1df session_mode;
        // offset 0x7e8, size 0x20
        int dlc_owned;
        // offset 0x808, size 0x1
        bool private_match;
        // offset 0x809, size 0x1
        bool ranked_play_flag;
        // offset 0x80a, size 0x1
        bool season_pass_owned;
        // offset 0x80b, size 0x5
        uint:1 __pad[5];
    };

    // idx 5 members 22 size 0x2e0
    struct hash_2a75a26c051b3f31 {
        // offset 0x0, size 0x20
        int match_longshots;
        // offset 0x20, size 0x20
        int match_xp;
        // offset 0x40, size 0x20
        int prestige_max;
        // offset 0x60, size 0x20
        int match_deaths;
        // offset 0x80, size 0x20
        int match_carries;
        // offset 0xa0, size 0x20
        int match_plants;
        // offset 0xc0, size 0x40
        xhash match_result;
        // offset 0x100, size 0x20
        int match_streak;
        // offset 0x120, size 0x20
        int match_throws;
        // offset 0x140, size 0x20
        int match_duration;
        // offset 0x160, size 0x20
        int match_hits;
        // offset 0x180, size 0x20
        int match_returns;
        // offset 0x1a0, size 0x20
        int match_kills;
        // offset 0x1c0, size 0x20
        int match_score;
        // offset 0x1e0, size 0x20
        int match_shots;
        // offset 0x200, size 0x20
        int match_defends;
        // offset 0x220, size 0x20
        int match_defuses;
        // offset 0x240, size 0x20
        int level_max;
        // offset 0x260, size 0x20
        int specialist_kills;
        // offset 0x280, size 0x20
        int match_objtime;
        // offset 0x2a0, size 0x20
        int match_captures;
        // offset 0x2c0, size 0x20
        int match_headshots;
    };

    // idx 6 members 10 size 0x2640
    struct hash_13d3693b7f1216f8 {
        // offset 0x0, size 0x200
        string(64) loadout_scorestreaks;
        // offset 0x200, size 0x2000
        string(1024) loadout_perks;
        // offset 0x2200, size 0x100
        string(32) loadout_primary_attachments;
        // offset 0x2300, size 0x100
        string(32) player_gender;
        // offset 0x2400, size 0x40
        xhash specialist_used;
        // offset 0x2440, size 0x40
        xhash loadout_primary_weapon;
        // offset 0x2480, size 0x40
        xhash loadout_tactical;
        // offset 0x24c0, size 0x40
        xhash loadout_lethal;
        // offset 0x2500, size 0x100
        string(32) loadout_secondary_attachments;
        // offset 0x2600, size 0x40
        xhash loadout_secondary_weapon;
    };

    // idx 7 members 7 size 0x380
    struct hash_42e8915aaacaff63 {
        // offset 0x0, size 0x20
        int total_deaths;
        // offset 0x20, size 0x100
        string(32) best_kills;
        // offset 0x120, size 0x100
        string(32) best_score;
        // offset 0x220, size 0x20
        int total_xp;
        // offset 0x240, size 0x20
        int total_wins;
        // offset 0x260, size 0x20
        int total_kills;
        // offset 0x280, size 0x100
        string(32) best_kd;
    };

    // idx 8 members 16 size 0x200
    struct hash_3506e586ba0277fb {
        // offset 0x0, size 0x20
        int special_contract_completed;
        // offset 0x20, size 0x20
        int daily_contract_target;
        // offset 0x40, size 0x20
        int daily_contract_completed;
        // offset 0x60, size 0x20
        int daily_contract_id;
        // offset 0x80, size 0x20
        int weeklyb_contract_current;
        // offset 0xa0, size 0x20
        int weeklyb_contract_completed;
        // offset 0xc0, size 0x20
        int special_contract_curent;
        // offset 0xe0, size 0x20
        int daily_contract_current;
        // offset 0x100, size 0x20
        int weeklyb_contract_id;
        // offset 0x120, size 0x20
        int weeklya_contract_completed;
        // offset 0x140, size 0x20
        int weeklya_contract_target;
        // offset 0x160, size 0x20
        int special_contract_target;
        // offset 0x180, size 0x20
        int weeklya_contract_id;
        // offset 0x1a0, size 0x20
        int weeklya_contract_current;
        // offset 0x1c0, size 0x20
        int special_contract_id;
        // offset 0x1e0, size 0x20
        int weeklyb_contract_target;
    };

    // idx 9 members 5 size 0x140
    struct hash_3821d9754f594c79 {
        // offset 0x0, size 0x40
        xhash specialist_showcase;
        // offset 0x40, size 0x40
        xhash hash_47b601fcc6a5c1f6;
        // offset 0x80, size 0x40
        xhash specialist_head;
        // offset 0xc0, size 0x40
        xhash specialist_legs;
        // offset 0x100, size 0x40
        xhash specialist_torso;
    };

    // idx 10 members 5 size 0xa0
    struct hash_3a5bf7d0d7976271 {
        // offset 0x0, size 0x20
        int doors;
        // offset 0x20, size 0x20
        int downs;
        // offset 0x40, size 0x20
        int money;
        // offset 0x60, size 0x20
        int zombie_waves;
        // offset 0x80, size 0x20
        int revives;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 5
    enum hash_61d8fb71b3cca1df {
        mode_invalid, // 0x0,
        mode_campaign, // 0x1,
        mode_multiplayer, // 0x2,
        mode_warzone, // 0x3,
        mode_zombies, // 0x4
    };

    // idx 0 members 10 size 0x3c08
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2b8, size 0x810
    hash_5824d549adab1dc4 hash_71960e91f80c3365;
    // offset 0xac8, size 0x140
    hash_3821d9754f594c79 hash_78a6c018d9f82184;
    // offset 0xc08, size 0xa0
    hash_3a5bf7d0d7976271 end_match_zm;
    // offset 0xca8, size 0xc0
    client_header client;
    // offset 0xd68, size 0x380
    hash_42e8915aaacaff63 hash_43cb38816354c3aa;
    // offset 0x10e8, size 0x200
    hash_3506e586ba0277fb hash_11fcb8f188ed5050;
    // offset 0x12e8, size 0x2e0
    hash_2a75a26c051b3f31 hash_4682ee0eb5071d2;
    // offset 0x15c8, size 0x2640
    hash_13d3693b7f1216f8 hash_209c80d657442a83;
}

