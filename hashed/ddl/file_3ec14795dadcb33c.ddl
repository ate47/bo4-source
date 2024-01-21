begin "hash_3ec14795dadcb33c";
version 23;
metatable "hash_75d98561f6fafb34";

struct root {
    match_header match;
    telemetry_header telemetry;
    hash_5824d549adab1dc4 hash_71960e91f80c3365;
    hash_3821d9754f594c79 hash_78a6c018d9f82184;
    hash_3a5bf7d0d7976271 end_match_zm;
    client_header client;
    hash_42e8915aaacaff63 hash_43cb38816354c3aa;
    hash_3506e586ba0277fb hash_11fcb8f188ed5050;
    hash_2a75a26c051b3f31 hash_4682ee0eb5071d2;
    hash_13d3693b7f1216f8 hash_209c80d657442a83;
};

struct match_header {
    uint64 match_id;
    uint64 hash_c05315ddb26eb93;
    uint64 lobby_id;
};

struct hash_3821d9754f594c79 {
    hash specialist_showcase;
    hash hash_47b601fcc6a5c1f6;
    hash specialist_head;
    hash specialist_legs;
    hash specialist_torso;
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

struct hash_5824d549adab1dc4 {
    hash starting_team;
    int32 esports_flag;
    char hash_236307b2e3de4586[32];
    char player_xuid[32];
    hash game_type;
    char player_ip[128];
    char game_map[32];
    hash ending_team;
    hash_61d8fb71b3cca1df session_mode;
    int32 dlc_owned;
    bit private_match;
    bit ranked_play_flag;
    bit season_pass_owned;
    padbit __pad[5];
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};

struct hash_3a5bf7d0d7976271 {
    int32 doors;
    int32 downs;
    int32 money;
    int32 zombie_waves;
    int32 revives;
};

struct hash_42e8915aaacaff63 {
    int32 total_deaths;
    char best_kills[32];
    char best_score[32];
    int32 total_xp;
    int32 total_wins;
    int32 total_kills;
    char best_kd[32];
};

struct hash_3506e586ba0277fb {
    int32 special_contract_completed;
    int32 daily_contract_target;
    int32 daily_contract_completed;
    int32 daily_contract_id;
    int32 weeklyb_contract_current;
    int32 weeklyb_contract_completed;
    int32 special_contract_curent;
    int32 daily_contract_current;
    int32 weeklyb_contract_id;
    int32 weeklya_contract_completed;
    int32 weeklya_contract_target;
    int32 special_contract_target;
    int32 weeklya_contract_id;
    int32 weeklya_contract_current;
    int32 special_contract_id;
    int32 weeklyb_contract_target;
};

struct hash_2a75a26c051b3f31 {
    int32 match_longshots;
    int32 match_xp;
    int32 prestige_max;
    int32 match_deaths;
    int32 match_carries;
    int32 match_plants;
    hash match_result;
    int32 match_streak;
    int32 match_throws;
    int32 match_duration;
    int32 match_hits;
    int32 match_returns;
    int32 match_kills;
    int32 match_score;
    int32 match_shots;
    int32 match_defends;
    int32 match_defuses;
    int32 level_max;
    int32 specialist_kills;
    int32 match_objtime;
    int32 match_captures;
    int32 match_headshots;
};

struct hash_13d3693b7f1216f8 {
    char loadout_scorestreaks[64];
    char loadout_perks[1024];
    char loadout_primary_attachments[32];
    char player_gender[32];
    hash specialist_used;
    hash loadout_primary_weapon;
    hash loadout_tactical;
    hash loadout_lethal;
    char loadout_secondary_attachments[32];
    hash loadout_secondary_weapon;
};

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
};

enum hash_61d8fb71b3cca1df {
    "mode_invalid" = 0x0,
    "mode_campaign" = 0x1,
    "mode_multiplayer" = 0x2,
    "mode_warzone" = 0x3,
    "mode_zombies" = 0x4
};


