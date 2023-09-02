// Atian COD Tools GSC decompiler test
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\table_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_daily_challenges;

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x2
// Checksum 0x7bd1559d, Offset: 0x178
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_daily_challenges", &__init__, &__main__, undefined);
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0xbc173f4d, Offset: 0x1c8
// Size: 0x84
function __init__() {
    callback::on_connect(&on_connect);
    callback::on_spawned(&on_spawned);
    callback::on_challenge_complete(&on_challenge_complete);
    zm_spawner::register_zombie_death_event_callback(&death_check_for_challenge_updates);
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x4d5f6b08, Offset: 0x258
// Size: 0x34
function __main__() {
    level thread spent_points_tracking();
    level thread earned_points_tracking();
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0xc416f30f, Offset: 0x298
// Size: 0xa2
function on_connect() {
    self thread round_tracking();
    self thread perk_purchase_tracking();
    self thread perk_drink_tracking();
    self.a_daily_challenges = [];
    self.a_daily_challenges[0] = 0;
    self.a_daily_challenges[1] = 0;
    self.a_daily_challenges[2] = 0;
    self.a_daily_challenges[3] = 0;
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x21ec46f5, Offset: 0x348
// Size: 0x1c
function on_spawned() {
    self thread challenge_ingame_time_tracking();
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0xc8e6aeae, Offset: 0x370
// Size: 0x266
function round_tracking() {
    self endon(#"disconnect");
    while (1) {
        level waittill(#"end_of_round");
        self.a_daily_challenges[3]++;
        self zm_stats::increment_challenge_stat(#"hash_4d3e2513e68c6848", undefined, 1);
        /#
            debug_print("<unknown string>");
        #/
        switch (self.a_daily_challenges[3]) {
        case 10:
            self zm_stats::increment_challenge_stat(#"zm_daily_round_10", undefined, 1);
            /#
                debug_print("<unknown string>");
            #/
            break;
        case 15:
            self zm_stats::increment_challenge_stat(#"zm_daily_round_15", undefined, 1);
            /#
                debug_print("<unknown string>");
            #/
            break;
        case 20:
            self zm_stats::increment_challenge_stat(#"zm_daily_round_20", undefined, 1);
            /#
                debug_print("<unknown string>");
            #/
            break;
        case 25:
            self zm_stats::increment_challenge_stat(#"zm_daily_round_25", undefined, 1);
            /#
                debug_print("<unknown string>");
            #/
            break;
        case 30:
            self zm_stats::increment_challenge_stat(#"zm_daily_round_30", undefined, 1);
            /#
                debug_print("<unknown string>");
            #/
            break;
        }
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 1, eflags: 0x1 linked
// Checksum 0xad0cc568, Offset: 0x5e0
// Size: 0xbb4
function death_check_for_challenge_updates(e_attacker) {
    if (!isdefined(e_attacker)) {
        return;
    }
    if (isdefined(e_attacker._trap_type)) {
        if (isdefined(e_attacker.activated_by_player)) {
            e_attacker.activated_by_player zm_stats::increment_challenge_stat(#"zm_daily_kills_traps");
            /#
                debug_print("<unknown string>");
            #/
        }
    }
    if (!isplayer(e_attacker)) {
        return;
    }
    e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills");
    /#
        debug_print("<unknown string>");
    #/
    if (isvehicle(self)) {
        str_damagemod = self.str_damagemod;
        w_damage = self.w_damage;
    } else {
        str_damagemod = self.damagemod;
        w_damage = self.damageweapon;
    }
    if (w_damage.inventorytype == "dwlefthand") {
        w_damage = w_damage.dualwieldweapon;
    }
    w_damage = zm_weapons::get_nonalternate_weapon(w_damage);
    if (isdefined(self.var_6f84b820)) {
        switch (self.var_6f84b820) {
        case #"heavy":
            e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_heavy");
            /#
                debug_print("<unknown string>");
            #/
            break;
        case #"miniboss":
            e_attacker zm_stats::increment_challenge_stat(#"hash_258c10d310bf4203");
            /#
                debug_print("<unknown string>");
            #/
            break;
        }
    }
    switch (self.archetype) {
    case #"blight_father":
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_blightfather");
        /#
            debug_print("<unknown string>");
        #/
        break;
    case #"catalyst":
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_catalyst");
        /#
            debug_print("<unknown string>");
        #/
        if (isdefined(self.var_69a981e6) && self.var_69a981e6) {
            /#
                e_attacker debug_print("<unknown string>");
            #/
            e_attacker zm_stats::increment_challenge_stat(#"catalyst_transformation_denials");
        }
        break;
    case #"gladiator":
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_gladiator");
        /#
            debug_print("<unknown string>");
        #/
        break;
    case #"stoker":
        e_attacker zm_stats::increment_challenge_stat(#"hash_2eb016a9af7e8a3");
        /#
            debug_print("<unknown string>");
        #/
        break;
    case #"tiger":
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_tiger");
        /#
            debug_print("<unknown string>");
        #/
        break;
    }
    if (isdefined(self.missinglegs) && self.missinglegs) {
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_crawler");
        /#
            debug_print("<unknown string>");
        #/
    }
    if (self zm_utility::is_headshot(w_damage, self.damagelocation, str_damagemod)) {
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_headshots");
        /#
            debug_print("<unknown string>");
        #/
        if (isdefined(e_attacker.a_daily_challenges) && isint(e_attacker.a_daily_challenges[0])) {
            e_attacker.a_daily_challenges[0]++;
            if (e_attacker.a_daily_challenges[0] == 20) {
                e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_headshots_in_row");
                /#
                    debug_print("<unknown string>");
                #/
            }
        }
    } else {
        e_attacker.a_daily_challenges[0] = 0;
    }
    if (isplayer(e_attacker) && e_attacker zm_powerups::is_insta_kill_active()) {
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_instakill");
        /#
            debug_print("<unknown string>");
        #/
    }
    if (zm_loadout::is_lethal_grenade(w_damage)) {
        e_attacker zm_stats::increment_challenge_stat(#"hash_5f9b7801af13f397");
        /#
            debug_print("<unknown string>");
        #/
    }
    if (e_attacker zm_pap_util::function_b81da3fd(w_damage)) {
        e_attacker zm_stats::increment_challenge_stat(#"hash_799aecaf1ec45db1");
        /#
            debug_print("<unknown string>");
        #/
        w_stat = zm_weapons::get_base_weapon(w_damage);
    } else if (zm_weapons::is_weapon_upgraded(w_damage)) {
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_packed");
        /#
            debug_print("<unknown string>");
        #/
        w_stat = zm_weapons::get_base_weapon(w_damage);
    } else {
        w_stat = zm_weapons::function_386dacbc(w_damage);
    }
    if (zm_loadout::is_hero_weapon(w_damage)) {
        e_attacker zm_stats::increment_challenge_stat(#"hash_730e40ef22de352");
        /#
            debug_print("<unknown string>");
        #/
    }
    if (isdefined(level.zombie_weapons[w_stat])) {
        switch (level.zombie_weapons[w_stat].weapon_classname) {
        case #"ar":
            e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_rifle");
            /#
                debug_print("<unknown string>");
            #/
            break;
        case #"lmg":
            e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_mg");
            /#
                debug_print("<unknown string>");
            #/
            break;
        case #"pistol":
            e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_pistol");
            /#
                debug_print("<unknown string>");
            #/
            break;
        case #"shotgun":
            e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_shotgun");
            /#
                debug_print("<unknown string>");
            #/
            break;
        case #"smg":
            e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_smg");
            /#
                debug_print("<unknown string>");
            #/
            break;
        case #"sniper":
            e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_sniper");
            /#
                debug_print("<unknown string>");
            #/
            break;
        case #"tr":
            e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_tactical_rifle");
            /#
                debug_print("<unknown string>");
            #/
            break;
        }
    }
    switch (str_damagemod) {
    case #"mod_explosive":
    case #"mod_grenade":
    case #"mod_projectile":
    case #"mod_grenade_splash":
    case #"mod_projectile_splash":
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_explosive");
        /#
            debug_print("<unknown string>");
        #/
        break;
    }
    if (w_damage.statname === #"bowie_knife") {
        e_attacker zm_stats::increment_challenge_stat(#"zm_daily_kills_bowie");
        /#
            debug_print("<unknown string>");
        #/
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x70815af5, Offset: 0x11a0
// Size: 0x108
function spent_points_tracking() {
    level endon(#"end_game");
    while (1) {
        result = undefined;
        result = level waittill(#"spent_points");
        player = result.player;
        n_points = result.points;
        player.a_daily_challenges[1] = player.a_daily_challenges[1] + n_points;
        player zm_stats::increment_challenge_stat(#"zm_daily_spend_25k", n_points);
        player zm_stats::increment_challenge_stat(#"zm_daily_spend_50k", n_points);
        /#
            debug_print("<unknown string>");
        #/
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0xc2802a59, Offset: 0x12b0
// Size: 0x1b0
function earned_points_tracking() {
    level endon(#"end_game");
    while (1) {
        result = undefined;
        result = level waittill(#"earned_points");
        player = result.player;
        if (!isdefined(player)) {
            continue;
        }
        n_points = result.points;
        if (zm_utility::is_standard()) {
            player zm_stats::increment_challenge_stat(#"hash_7ea82afc1c790346", n_points);
        } else {
            player zm_stats::increment_challenge_stat(#"hash_67970ded10f84169", n_points, 1);
        }
        /#
            debug_print("<unknown string>");
        #/
        n_multiplier = zm_score::get_points_multiplier(player);
        if (n_multiplier == 2) {
            player.a_daily_challenges[2] = player.a_daily_challenges[2] + n_points;
            player zm_stats::increment_challenge_stat(#"zm_daily_earn_5k_with_2x", n_points, 1);
            /#
                debug_print("<unknown string>");
            #/
        }
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0xa6fd299d, Offset: 0x1468
// Size: 0x80
function challenge_ingame_time_tracking() {
    self endon(#"disconnect");
    self notify(#"stop_challenge_ingame_time_tracking");
    self endon(#"stop_challenge_ingame_time_tracking");
    level flag::wait_till("start_zombie_round_logic");
    for (;;) {
        wait(1);
        zm_stats::increment_client_stat("ZM_DAILY_CHALLENGE_INGAME_TIME");
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 1, eflags: 0x1 linked
// Checksum 0x22b3fe00, Offset: 0x14f0
// Size: 0xf8
function increment_windows_repaired(s_barrier) {
    if (!isdefined(self.n_dc_barriers_rebuilt)) {
        self.n_dc_barriers_rebuilt = 0;
    }
    if (!(isdefined(self.b_dc_rebuild_timer_active) && self.b_dc_rebuild_timer_active)) {
        self thread rebuild_timer();
        self.a_s_barriers_rebuilt = [];
    }
    if (!isinarray(self.a_s_barriers_rebuilt, s_barrier)) {
        if (!isdefined(self.a_s_barriers_rebuilt)) {
            self.a_s_barriers_rebuilt = [];
        } else if (!isarray(self.a_s_barriers_rebuilt)) {
            self.a_s_barriers_rebuilt = array(self.a_s_barriers_rebuilt);
        }
        self.a_s_barriers_rebuilt[self.a_s_barriers_rebuilt.size] = s_barrier;
        self.n_dc_barriers_rebuilt++;
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x5 linked
// Checksum 0xecb689e2, Offset: 0x15f0
// Size: 0x9a
function private rebuild_timer() {
    self endon(#"disconnect");
    self.b_dc_rebuild_timer_active = 1;
    wait(45);
    if (self.n_dc_barriers_rebuilt >= 5) {
        self zm_stats::increment_challenge_stat(#"zm_daily_rebuild_windows");
        /#
            debug_print("<unknown string>");
        #/
    }
    self.n_dc_barriers_rebuilt = 0;
    self.a_s_barriers_rebuilt = [];
    self.b_dc_rebuild_timer_active = undefined;
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0xf9d4d0de, Offset: 0x1698
// Size: 0x104
function increment_magic_box() {
    if (isdefined(zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on")) && zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on")) {
        self zm_stats::increment_challenge_stat(#"zm_daily_purchase_fire_sale_magic_box");
        /#
            debug_print("<unknown string>");
        #/
    }
    self zm_stats::increment_challenge_stat(#"zm_daily_purchase_magic_box", undefined, 1);
    self zm_stats::increment_challenge_stat(#"hash_702d98df99af63d5", undefined, 1);
    /#
        debug_print("<unknown string>");
    #/
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0xdf478b6c, Offset: 0x17a8
// Size: 0xc0
function increment_nuked_zombie() {
    foreach (player in level.players) {
        if (player.sessionstate != "spectator") {
            player zm_stats::increment_challenge_stat(#"zm_daily_kills_nuked");
            /#
                debug_print("<unknown string>");
            #/
        }
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x362aaa03, Offset: 0x1870
// Size: 0x90
function perk_purchase_tracking() {
    self endon(#"disconnect");
    while (1) {
        str_perk = undefined;
        self waittill(#"perk_purchased", str_perk);
        self zm_stats::increment_challenge_stat(#"zm_daily_purchase_perks");
        /#
            debug_print("<unknown string>");
        #/
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x509c4117, Offset: 0x1908
// Size: 0x78
function perk_drink_tracking() {
    self endon(#"disconnect");
    while (1) {
        self waittill(#"perk_bought");
        self zm_stats::increment_challenge_stat(#"zm_daily_drink_perks");
        /#
            debug_print("<unknown string>");
        #/
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 1, eflags: 0x0
// Checksum 0xc6e8662, Offset: 0x1988
// Size: 0x4c
function debug_print(str_line) {
    if (getdvarint(#"zombie_debug", 0) > 0) {
        /#
            println(str_line);
        #/
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 1, eflags: 0x1 linked
// Checksum 0x943740d7, Offset: 0x19e0
// Size: 0x17c
function on_challenge_complete(params) {
    n_challenge_index = params.challenge_index;
    if (is_daily_challenge(n_challenge_index)) {
        if (isdefined(self)) {
            uploadstats(self);
        }
        a_challenges = table::load(#"gamedata/stats/zm/statsmilestones4.csv", "a0");
        str_current_challenge = a_challenges[n_challenge_index][#"e4"];
        n_players = level.players.size;
        n_time_played = game.timepassed / 1000;
        n_challenge_start_time = self zm_stats::get_global_stat("zm_daily_challenge_start_time");
        n_challenge_time_ingame = self globallogic_score::getpersstat(#"zm_daily_challenge_ingame_time");
        n_challenge_games_played = self zm_stats::get_global_stat("zm_daily_challenge_games_played");
        /#
            debug_print("<unknown string>" + n_challenge_index);
        #/
    }
}

// Namespace zm_daily_challenges/zm_daily_challenges
// Params 1, eflags: 0x1 linked
// Checksum 0xaabe5dcf, Offset: 0x1b68
// Size: 0x52
function is_daily_challenge(n_challenge_index) {
    n_row = tablelookuprownum(#"gamedata/stats/zm/statsmilestones4.csv", 0, n_challenge_index);
    if (n_row > -1) {
        return 1;
    }
    return 0;
}

