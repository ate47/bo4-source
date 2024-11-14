#using scripts\zm\weapons\zm_weap_crossbow;
#using scripts\zm_common\zm_zonemgr;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_challenges;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;

#namespace zm_towers_achievements;

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x7939a4f2, Offset: 0x248
// Size: 0x1a4
function init() {
    level flag::init(#"hash_6efaa75e1959aa0f");
    callback::on_connect(&function_131495a5);
    callback::on_connect(&function_6fdb733f);
    callback::on_ai_killed(&function_7b7ba154);
    callback::on_ai_killed(&function_3cbde7f5);
    callback::on_ai_killed(&function_b43c1bad);
    level.gib_on_damage = &function_cda4b8ba;
    level thread function_a87d82d1();
    level thread function_cbdb5e70();
    level flag::wait_till("all_players_spawned");
    array::thread_all(level.players, &function_131495a5);
    array::thread_all(level.players, &function_6fdb733f);
    array::thread_all(level.players, &function_45057dc4);
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x20bd41e4, Offset: 0x3f8
// Size: 0x7c
function function_45057dc4() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"challenges_complete");
    self zm_utility::giveachievement_wrapper("zm_towers_challenges");
    /#
        self debug_notification("<dev string:x38>");
    #/
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x9ca42380, Offset: 0x480
// Size: 0xe4
function function_131495a5() {
    self notify("558820cf64d9ca3f");
    self endon("558820cf64d9ca3f");
    level endon(#"end_game");
    self endon(#"disconnect");
    while (true) {
        s_waitresult = self waittill(#"weapon_change");
        w_weapon = s_waitresult.weapon;
        if (zm_weap_crossbow::is_crossbow_upgraded(w_weapon)) {
            break;
        }
    }
    self zm_utility::giveachievement_wrapper("zm_towers_get_ww");
    /#
        self debug_notification("<dev string:x42>");
    #/
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 1, eflags: 0x1 linked
// Checksum 0xe5bf8a9, Offset: 0x570
// Size: 0x174
function function_7b7ba154(s_params) {
    e_attacker = s_params.eattacker;
    if (!isdefined(e_attacker)) {
        return;
    }
    e_activator = e_attacker.activated_by_player;
    if (!isplayer(e_activator)) {
        return;
    }
    if (!isdefined(e_attacker._trap_type)) {
        return;
    }
    if (e_attacker._trap_type != "hellpool") {
        return;
    }
    switch (e_attacker.script_string) {
    case #"hash_7ebf57684b9746dc":
        var_378e29b9 = "towers_acid_trap_built_ra";
        break;
    case #"hash_7eae57684b88d3a9":
        var_378e29b9 = "towers_acid_trap_built_danu";
        break;
    case #"hash_7ebf49684b972f12":
        var_378e29b9 = "towers_acid_trap_built_odin";
        break;
    case #"hash_7eae45684b88b513":
        var_378e29b9 = "towers_acid_trap_built_zeus";
        break;
    default:
        return;
    }
    e_activator zm_stats::increment_client_stat(var_378e29b9, 1);
    e_activator thread function_9bb7596b();
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x811762db, Offset: 0x6f0
// Size: 0xec
function function_9bb7596b() {
    b_ra = self zm_stats::get_client_stat("towers_acid_trap_built_ra");
    b_danu = self zm_stats::get_client_stat("towers_acid_trap_built_danu");
    b_odin = self zm_stats::get_client_stat("towers_acid_trap_built_odin");
    b_zeus = self zm_stats::get_client_stat("towers_acid_trap_built_zeus");
    if (b_ra && b_danu && b_odin && b_zeus) {
        self zm_utility::giveachievement_wrapper("zm_towers_trap_build");
    }
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 1, eflags: 0x1 linked
// Checksum 0x77f9e2e8, Offset: 0x7e8
// Size: 0x154
function function_3cbde7f5(s_params) {
    e_player = s_params.eattacker;
    if (!isplayer(e_player)) {
        return;
    }
    e_projectile = function_5180cfce(s_params);
    if (!isdefined(e_projectile)) {
        return;
    }
    if (!isdefined(e_projectile.var_1c5254ca)) {
        e_projectile.var_1c5254ca = 0;
    }
    e_projectile.var_1c5254ca++;
    if (e_projectile.var_1c5254ca >= 9 && !e_player flag::exists(#"hash_599401a7cc5b8a84")) {
        e_player flag::init(#"hash_599401a7cc5b8a84");
        e_player flag::set(#"hash_599401a7cc5b8a84");
        e_player zm_utility::giveachievement_wrapper("zm_towers_ww_kills");
        /#
            e_player debug_notification("<dev string:x56>");
        #/
    }
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 1, eflags: 0x1 linked
// Checksum 0x95c781ab, Offset: 0x948
// Size: 0xe0
function function_5180cfce(s_params) {
    e_projectile = s_params.einflictor;
    w_weapon = s_params.weapon;
    if (!isdefined(w_weapon) || !zm_weap_crossbow::is_crossbow(w_weapon) || zm_weap_crossbow::is_crossbow_charged(w_weapon)) {
        return undefined;
    }
    if (!isdefined(e_projectile)) {
        return undefined;
    }
    var_73e48d1a = e_projectile.weapon;
    if (!isdefined(var_73e48d1a) || !zm_weap_crossbow::is_crossbow(var_73e48d1a) || zm_weap_crossbow::is_crossbow_charged(var_73e48d1a)) {
        return undefined;
    }
    return e_projectile;
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 1, eflags: 0x1 linked
// Checksum 0x95705af6, Offset: 0xa30
// Size: 0x13c
function function_b43c1bad(s_params) {
    if (self.archetype !== #"tiger") {
        return;
    }
    waitframe(1);
    var_328cd9eb = self.var_39ebb8cc;
    if (!isdefined(var_328cd9eb) || var_328cd9eb.archetype !== #"tiger") {
        return;
    }
    e_player = var_328cd9eb.var_443d78cc;
    if (isplayer(e_player) && !e_player flag::exists(#"hash_4969e1eae9bf556f")) {
        e_player flag::init(#"hash_4969e1eae9bf556f");
        e_player flag::set(#"hash_4969e1eae9bf556f");
        e_player zm_utility::giveachievement_wrapper("zm_towers_kitty_kitty");
        /#
            e_player debug_notification("<dev string:x6c>");
        #/
    }
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 1, eflags: 0x1 linked
// Checksum 0x549b488b, Offset: 0xb78
// Size: 0x13c
function function_cda4b8ba(e_attacker) {
    if (!isplayer(e_attacker) || e_attacker zm_zonemgr::get_player_zone() !== "zone_body_pit") {
        return;
    }
    if (!isdefined(e_attacker.var_b26f3221)) {
        e_attacker.var_b26f3221 = 0;
    }
    e_attacker.var_b26f3221++;
    if (e_attacker.var_b26f3221 >= 13 && !e_attacker flag::exists(#"hash_2086e93d2f58efce")) {
        e_attacker flag::init(#"hash_2086e93d2f58efce");
        e_attacker flag::set(#"hash_2086e93d2f58efce");
        e_attacker zm_utility::giveachievement_wrapper("zm_towers_dismember");
        /#
            e_attacker debug_notification("<dev string:x80>");
        #/
    }
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x499f37da, Offset: 0xcc0
// Size: 0xac
function function_a24ba4fc() {
    zm_utility::giveachievement_wrapper("zm_towers_boss_kill", 1);
    /#
        self debug_notification("<dev string:x95>");
    #/
    self zm_challenges::function_9a9ab6f6(#"hash_6d5340d9e43ed73d");
    if (isdefined(level.var_2d744147) && level.var_2d744147 <= 5940000) {
        self zm_challenges::function_979f4cc0(#"hash_69f53cb2579fba3e");
    }
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0xf237f5e3, Offset: 0xd78
// Size: 0x74
function function_a87d82d1() {
    level endon(#"end_game");
    level waittill(#"door_opened");
    level flag::set(#"hash_6efaa75e1959aa0f");
    callback::remove_on_connect(&function_6fdb733f);
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x8e90193c, Offset: 0xdf8
// Size: 0x124
function function_6fdb733f() {
    self notify("72218f31e92393e3");
    self endon("72218f31e92393e3");
    level endon(#"door_opened", #"end_game", #"hash_6efaa75e1959aa0f");
    self endon(#"death");
    if (level.round_number > 1 || level flag::get(#"hash_6efaa75e1959aa0f")) {
        return;
    }
    while (true) {
        level waittill(#"end_of_round");
        if (level.round_number >= 20) {
            break;
        }
    }
    self zm_utility::giveachievement_wrapper("zm_towers_arena_survive");
    /#
        self debug_notification("<dev string:xa9>");
    #/
}

// Namespace zm_towers_achievements/zm_towers_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x41a4cb89, Offset: 0xf28
// Size: 0x1a8
function function_cbdb5e70() {
    level endon(#"end_game");
    if (zm_custom::function_901b751c(#"zmpapenabled") == 2) {
        return;
    }
    if (!level flag::exists(#"hash_76692d6669cb0500")) {
        level flag::init(#"hash_76692d6669cb0500");
    }
    level waittill(#"start_of_round");
    a_e_players = level.players;
    level flag::wait_till_timeout(300, #"hash_76692d6669cb0500");
    if (level flag::get(#"hash_76692d6669cb0500")) {
        foreach (e_player in a_e_players) {
            if (isdefined(e_player)) {
                e_player zm_utility::giveachievement_wrapper("zm_towers_fast_pap");
                /#
                    e_player debug_notification("<dev string:xc0>");
                #/
            }
        }
    }
}

/#

    // Namespace zm_towers_achievements/zm_towers_achievements
    // Params 1, eflags: 0x4
    // Checksum 0xc5c61dd6, Offset: 0x10d8
    // Size: 0x74
    function private debug_notification(var_378e29b9) {
        if (!isdefined(var_378e29b9)) {
            var_378e29b9 = "<dev string:xd5>";
        }
        self endon(#"death");
        str_name = self.name;
        if (!isdefined(str_name)) {
            return;
        }
        iprintln(str_name + "<dev string:xd8>" + var_378e29b9);
    }

#/
