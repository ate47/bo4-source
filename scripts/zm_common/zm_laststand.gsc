// Atian COD Tools GSC decompiler test
#using script_30a4b3e6d6d5e540;
#using script_48f7c4ab73137f8;
#using script_243ea03c7a285692;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\trials\zm_trial_disable_perks.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_laststand;

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2
// Checksum 0xecef637c, Offset: 0x458
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_laststand", &__init__, undefined, undefined);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x8b4f0760, Offset: 0x4a0
// Size: 0x292
function __init__() {
    level flag::init("solo_revive");
    level.revive_hud = revive_hud::register("revive_hud");
    level.var_ff482f76 = zm_laststand_client::register("zm_laststand_client");
    level.var_1c957023 = self_revive_visuals::register("self_revive_visuals");
    callback::on_connect(&on_player_connect);
    callback::on_spawned(&on_spawned);
    callback::on_disconnect(&function_4d3cb10);
    clientfield::register("clientuimodel", "ZMInventoryPersonal.self_revive_count", 1, 7, "int");
    clientfield::register("allplayers", "zm_last_stand_postfx", 1, 1, "int");
    level.laststand_update_clientfields = [];
    for (i = 0; i < 4; i++) {
        level.laststand_update_clientfields[i] = "laststand_update" + i;
        clientfield::register("world", level.laststand_update_clientfields[i], 1, 5, "float");
        clientfield::register("clientuimodel", "WorldSpaceIndicators.bleedOutModel" + i + ".hide", 1, 1, "int");
    }
    level.weaponsuicide = getweapon(#"death_self");
    if (!isdefined(getdvar(#"revive_trigger_radius"))) {
        setdvar(#"revive_trigger_radius", 75);
    }
    if (!isdefined(level.var_3ea7f9f4)) {
        level.var_3ea7f9f4 = 1;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x2b0e2645, Offset: 0x740
// Size: 0x34
function on_player_connect() {
    self thread function_b7c101fa();
    self thread function_6155752d();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x9e4e66b4, Offset: 0x780
// Size: 0xe
function on_spawned() {
    self.var_39c78617 = undefined;
}

// Namespace zm_laststand/zm_laststand
// Params 9, eflags: 0x1 linked
// Checksum 0xdefc4625, Offset: 0x798
// Size: 0x1f4
function player_last_stand_stats(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isdefined(attacker) && isplayer(attacker) && attacker != self) {
        if ("zcleansed" == level.gametype) {
            demo::kill_bookmark(attacker, self, einflictor);
            potm::kill_bookmark(attacker, self, einflictor);
        }
        if ("zcleansed" == level.gametype) {
            if (!(isdefined(attacker.is_zombie) && attacker.is_zombie)) {
                attacker.kills++;
            } else {
                attacker.downs++;
            }
        } else {
            attacker.kills++;
        }
    }
    self increment_downed_stat();
    if (level flag::get("solo_game") && self function_618fd37e() == 0 && getnumconnectedplayers() < 2) {
        self zm_stats::increment_client_stat("deaths");
        self zm_stats::increment_player_stat("deaths");
        self zm_stats::function_8f10788e("boas_deaths");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x97ddb328, Offset: 0x998
// Size: 0x16c
function increment_downed_stat() {
    if ("zcleansed" != level.gametype) {
        self.downs++;
    }
    self zm_stats::increment_global_stat("TOTAL_DOWNS");
    self zm_stats::increment_map_stat("TOTAL_DOWNS");
    self zm_stats::function_f1a1191d("TOTAL_DOWNS");
    self zm_stats::function_2726a7c2("TOTAL_DOWNS");
    self zm_stats::increment_client_stat("downs");
    self zm_stats::function_8f10788e("boas_downs");
    self add_weighted_down();
    self zm_stats::increment_player_stat("downs");
    zonename = self zm_utility::get_current_zone();
    if (!isdefined(zonename)) {
        zonename = "";
    }
    self recordplayerdownzombies(zonename);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x5e1fd1fd, Offset: 0xb10
// Size: 0xa6
function registerfxanim_warehouse_explo(pause_enabled) {
    for (slot = 0; slot < 3; slot++) {
        if (!isdefined(self._gadgets_player[slot])) {
            continue;
        }
        if (isdefined(level.var_a53a05b5) && level.var_a53a05b5 == slot) {
            self zm_hero_weapon::function_76505465(slot, pause_enabled);
        } else {
            self function_19ed70ca(slot, pause_enabled);
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 9, eflags: 0x1 linked
// Checksum 0x7ca0b8d7, Offset: 0xbc0
// Size: 0x894
function playerlaststand(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    self notify(#"entering_last_stand");
    self disableweaponcycling();
    self registerfxanim_warehouse_explo(1);
    if (self laststand::player_is_in_laststand()) {
        return;
    }
    if (isdefined(self.in_zombify_call) && self.in_zombify_call) {
        return;
    }
    self thread player_last_stand_stats(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
    if (smeansofdeath == "MOD_SUICIDE" || self === attacker) {
        self zm_stats::increment_client_stat("suicides");
        self zm_stats::increment_player_stat("suicides");
        self zm_stats::function_8f10788e("boas_suicides");
    }
    self allowjump(0);
    currweapon = self getcurrentweapon();
    self stats::function_e24eec31(currweapon, #"deathsduringuse", 1);
    if (self function_618fd37e() > 0 && !(isdefined(level.var_28bbd30a) && level.var_28bbd30a)) {
        if (isdefined(level.var_af29d768)) {
            self [[ level.var_af29d768 ]]();
        } else if (level.players.size == 1 || isdefined(self.var_20f86af4) && self.var_20f86af4) {
            self thread wait_and_revive();
        } else {
            self thread function_3699b145();
        }
    }
    self zm_utility::clear_is_drinking();
    self zm_score::player_downed_penalty();
    self disableoffhandweapons();
    if (self isusingoffhand()) {
        self forceoffhandend();
    }
    if (smeansofdeath != "MOD_SUICIDE" && smeansofdeath != "MOD_FALLING") {
        if (!(isdefined(self.intermission) && self.intermission) && !function_70fcc093()) {
            self util::delay(0.5, "death", &zm_audio::create_and_play_dialog, #"revive", #"down");
        } else {
            self thread zm_audio::create_and_play_dialog(#"general", #"exert_death");
        }
    }
    if (isdefined(level._zombie_minigun_powerup_last_stand_func)) {
        self thread [[ level._zombie_minigun_powerup_last_stand_func ]]();
    }
    if (isdefined(level._zombie_tesla_powerup_last_stand_func)) {
        self thread [[ level._zombie_tesla_powerup_last_stand_func ]]();
    }
    if (self hasperk(#"specialty_electriccherry")) {
        if (isdefined(level.custom_laststand_func)) {
            self thread [[ level.custom_laststand_func ]]();
        }
    }
    if (isdefined(self.intermission) && self.intermission) {
        wait(0.5);
        self stopsounds();
        level waittill(#"forever");
    }
    self clientfield::set("zm_last_stand_postfx", 1);
    self.health = 1;
    self.laststand = 1;
    self val::set(#"laststand", "ignoreme");
    callback::callback(#"on_player_laststand");
    if (!(isdefined(self.no_revive_trigger) && self.no_revive_trigger) || !(isdefined(self.var_39c78617) && self.var_39c78617)) {
        self revive_trigger_spawn();
    }
    if (isdefined(self.is_zombie) && self.is_zombie) {
        self takeallweapons();
        if (isdefined(attacker) && isplayer(attacker) && attacker != self) {
            attacker notify(#"killed_a_zombie_player", einflictor);
        }
    } else {
        self laststand_disable_player_weapons();
        self laststand_give_pistol();
    }
    if (isdefined(self.var_c4890291)) {
        self.var_c4890291 = [];
    }
    if (!isdefined(self.n_downs)) {
        self.n_downs = 0;
    }
    self.n_downs = self.n_downs + 1;
    bleedout_time = getdvarfloat(#"hash_1116ba0f929df636", isdefined(self.var_b92e42da) ? self.var_b92e42da : getdvarfloat(#"player_laststandbleedouttime", 0));
    if (zm_custom::function_901b751c(#"zmlimiteddownsamount") && self.n_downs > zm_custom::function_901b751c(#"zmlimiteddownsamount")) {
        bleedout_time = 0;
    }
    if (isdefined(self.n_bleedout_time_multiplier)) {
        bleedout_time = bleedout_time * self.n_bleedout_time_multiplier;
    }
    if (isdefined(self.var_5c4f1263)) {
        bleedout_time = bleedout_time * self.var_5c4f1263;
    }
    self thread laststand_bleedout(bleedout_time);
    demo::bookmark(#"player_downed", gettime(), self);
    potm::bookmark(#"player_downed", gettime(), self);
    self notify(#"player_downed");
    self thread refire_player_downed();
    self thread laststand::function_d4c9e1b5();
    self thread auto_revive_on_notify();
    if (self function_1a2fa922()) {
        self playsound(#"hash_19b37c3454f86a4a");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x7bf5430b, Offset: 0x1460
// Size: 0x11a
function function_70fcc093() {
    if (isdefined(level.var_e1d82d33)) {
        foreach (player in util::get_active_players(self.team)) {
            if (isplayer(player) && player != self) {
                s_path = generatenavmeshpath(self.origin, player.origin);
                if (isdefined(s_path)) {
                    if (isdefined(s_path.pathdistance)) {
                        if (s_path.pathdistance < level.var_e1d82d33) {
                            return 1;
                        }
                    }
                } else {
                    return 1;
                }
                waitframe(1);
            }
        }
    }
    return 0;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x1dccbadc, Offset: 0x1588
// Size: 0x7c
function auto_revive_on_notify() {
    self endon(#"death", #"player_revived");
    s_result = undefined;
    s_result = self waittill(#"auto_revive", #"remote_revive");
    self thread auto_revive(s_result.reviver);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x4458a8c3, Offset: 0x1610
// Size: 0x9a
function function_1a2fa922() {
    if (level.players.size > 1) {
        foreach (e_player in level.players) {
            if (zm_utility::is_player_valid(e_player)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x6b4d7042, Offset: 0x16b8
// Size: 0x34c
function wait_and_revive() {
    self endoncallback(&function_e0f05bad, #"player_revived", #"death");
    level flag::set("wait_and_revive");
    level.wait_and_revive = 1;
    if (isdefined(self.waiting_to_revive) && self.waiting_to_revive) {
        return;
    }
    self.waiting_to_revive = 1;
    if (isdefined(level.exit_level_func)) {
        self thread [[ level.exit_level_func ]]();
    } else if (getplayers().size == 1) {
        player = getplayers()[0];
        level.move_away_points = positionquery_source_navigation(player.origin, 480, 960, 120, 20);
        if (!isdefined(level.move_away_points)) {
            level.move_away_points = positionquery_source_navigation(player.last_valid_position, 480, 960, 120, 20);
        }
    }
    var_3269dfa3 = (isdefined(self.var_b92e42da) ? self.var_b92e42da : getdvarfloat(#"player_laststandbleedouttime", 0)) * 0.25;
    var_3269dfa3 = getdvarfloat(#"hash_1d447d6b4492bf4f", var_3269dfa3);
    self thread laststand::revive_hud_show_n_fade(#"zombie/reviving_solo", var_3269dfa3);
    var_c564fe97 = undefined;
    var_c564fe97 = level waittilltimeout(var_3269dfa3, #"end_of_round");
    if (var_c564fe97._notify === "end_of_round") {
        self thread laststand::revive_hud_show_n_fade(#"zombie/reviving_solo", 1);
    }
    while (self.var_16735873 === 1) {
        wait(0.1);
    }
    if (isdefined(level.a_revive_success_perk_func)) {
        foreach (func in level.a_revive_success_perk_func) {
            self [[ func ]]();
        }
    }
    self thread function_e0f05bad();
    self thread auto_revive(self, 1, 1);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x8f3f8c70, Offset: 0x1a10
// Size: 0x4e
function function_e0f05bad(var_c34665fc) {
    level flag::clear("wait_and_revive");
    level.wait_and_revive = 0;
    if (isdefined(self)) {
        self.waiting_to_revive = 0;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x8963728d, Offset: 0x1a68
// Size: 0x4e
function refire_player_downed() {
    self endon(#"player_revived", #"death");
    wait(1);
    if (self.num_perks) {
        self notify(#"player_downed");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x736dfaca, Offset: 0x1ac0
// Size: 0x216
function laststand_disable_player_weapons() {
    self disableweaponcycling();
    var_df4942c2 = self getweaponslist(1);
    self.lastactiveweapon = self getcurrentweapon();
    self.laststandpistol = function_549df594();
    foreach (weapon in var_df4942c2) {
        if (weapon == self.laststandpistol) {
            function_f351748e(weapon);
        }
        if (weapon == level.weaponrevivetool || weapon === self.weaponrevivetool) {
            self zm_stats::increment_client_stat("failed_sacrifices");
            self zm_stats::increment_player_stat("failed_sacrifices");
        } else if (weapon.isperkbottle) {
            self takeweapon(weapon);
            self.lastactiveweapon = level.weaponnone;
            continue;
        } else if (isdefined(zm_utility::get_gamemode_var("item_meat_weapon")) && weapon == zm_utility::get_gamemode_var("item_meat_weapon")) {
            self takeweapon(weapon);
            self.lastactiveweapon = level.weaponnone;
            continue;
        }
    }
    self notify(#"weapons_taken_for_last_stand");
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xe74b6b16, Offset: 0x1ce0
// Size: 0x24a
function laststand_enable_player_weapons(b_bled_out) {
    self endon(#"death");
    if (isdefined(self.laststandpistol)) {
        if (isdefined(self.var_1d2409c1)) {
            function_a9cb028f();
            self.var_1d2409c1 = undefined;
        } else {
            self takeweapon(self.laststandpistol);
        }
    }
    if (!(isdefined(b_bled_out) && b_bled_out)) {
        self enableweaponcycling();
        self enableoffhandweapons();
        self registerfxanim_warehouse_explo(0);
        if (self.lastactiveweapon != level.weaponnone && self hasweapon(self.lastactiveweapon, 1) && !zm_loadout::is_placeable_mine(self.lastactiveweapon) && !zm_equipment::is_equipment(self.lastactiveweapon) && !zm_loadout::is_hero_weapon(self.lastactiveweapon) && !self.lastactiveweapon.isriotshield) {
            self switchtoweapon(self.lastactiveweapon);
        } else if (self getweaponslistprimaries().size) {
            self switchtoweapon();
        } else {
            zm_weapons::give_fallback_weapon();
        }
        do {
            waitframe(1);
        } while(self isswitchingweapons());
    }
    self.laststandpistol = undefined;
    self notify(#"hash_9b426cce825928d");
    if (isdefined(b_bled_out) && b_bled_out) {
        waitframe(1);
        self.s_loadout = zm_weapons::player_get_loadout();
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xa30eb6a6, Offset: 0x1f38
// Size: 0x18
function laststand_has_players_weapons_returned() {
    if (isdefined(self.laststandpistol)) {
        return 0;
    }
    return 1;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x361fa8f3, Offset: 0x1f58
// Size: 0x34
function function_cbfcda16() {
    if (level.players.size > 1) {
        return level.default_laststandpistol;
    } else {
        return level.default_solo_laststandpistol;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xcb6d26fd, Offset: 0x1f98
// Size: 0x29a
function function_5ff83684() {
    level.pistol_values = [];
    level.pistol_values[level.pistol_values.size] = level.default_laststandpistol;
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_standard_t8");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_burst_t8");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_revolver_t8");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_fullauto_t8");
    level.pistol_value_solo_replace_below = level.pistol_values.size - 1;
    level.pistol_values[level.pistol_values.size] = level.default_solo_laststandpistol;
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_standard_t8_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_burst_t8_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_revolver_t8_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_fullauto_t8_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"ray_gun");
    level.pistol_values[level.pistol_values.size] = getweapon(#"ray_gun_upgraded");
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x0
// Checksum 0x1e67f601, Offset: 0x2240
// Size: 0xb2
function function_aac4b2c9(weapon) {
    /#
        assert(weapon.weapclass === "<unknown string>" || weapon.weapclass === "<unknown string>" || weapon.weapclass === "<unknown string>", "<unknown string>");
    #/
    level flagsys::wait_till(#"load_main_complete");
    level.pistol_values[level.pistol_values.size] = weapon;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xbcecd754, Offset: 0x2300
// Size: 0x1b6
function function_6155752d() {
    self endon(#"disconnect");
    self.var_d84718d1 = [];
LOC_00000028:
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"weapon_change_complete");
        if (isinarray(self.var_d84718d1, s_result.weapon) || laststand::player_is_in_laststand()) {
            continue;
        }
        switch (s_result.weapon.weapclass) {
        case #"pistol spread":
        case #"pistolspread":
        case #"pistol":
            if (isdefined(level.var_d3cfc0c0) && level.var_d3cfc0c0 && zm_weapons::is_weapon_upgraded(s_result.weapon)) {
                continue;
            } else {
                if (!isdefined(self.var_d84718d1)) {
                    self.var_d84718d1 = [];
                } else if (!isarray(self.var_d84718d1)) {
                    self.var_d84718d1 = array(self.var_d84718d1);
                }
                self.var_d84718d1[self.var_d84718d1.size] = s_result.weapon;
            }
            continue;
        default:
            continue;
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x81364a26, Offset: 0x24c0
// Size: 0x11c
function function_25a89622() {
    if (self zm_loadout::has_powerup_weapon()) {
        self.lastactiveweapon = level.weaponnone;
    }
    if (isdefined(self.w_min_last_stand_pistol_override)) {
        self function_f161bb2d();
    }
    if (!self hasweapon(self.laststandpistol, 1)) {
        self zm_weapons::give_build_kit_weapon(self.laststandpistol);
    }
    if (isdefined(self.var_1d2409c1)) {
        self setweaponammoclip(self.laststandpistol, self.laststandpistol.clipsize);
    }
    self setweaponammostock(self.laststandpistol, self.laststandpistol.clipsize * 2);
    self switchtoweapon(self.laststandpistol);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xe30455df, Offset: 0x25e8
// Size: 0xe2
function function_f161bb2d() {
    for (i = 0; i < level.pistol_values.size; i++) {
        if (level.pistol_values[i] == self.w_min_last_stand_pistol_override) {
            n_min_last_stand_pistol_value = i;
            break;
        }
    }
    for (k = 0; k < level.pistol_values.size; k++) {
        if (level.pistol_values[k] == self.laststandpistol) {
            n_default_last_stand_pistol_value = k;
            break;
        }
    }
    if (n_min_last_stand_pistol_value > n_default_last_stand_pistol_value) {
        self.hadpistol = 0;
        self.laststandpistol = self.w_min_last_stand_pistol_override;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xfcfb375a, Offset: 0x26d8
// Size: 0x19a
function function_549df594() {
    var_2a32d68 = self.var_d84718d1;
    if (!isdefined(var_2a32d68)) {
        var_2a32d68 = [];
    } else if (!isarray(var_2a32d68)) {
        var_2a32d68 = array(var_2a32d68);
    }
    if (!isinarray(var_2a32d68, function_cbfcda16())) {
        var_2a32d68[var_2a32d68.size] = function_cbfcda16();
    }
    var_d3702e29 = 0;
    foreach (var_21ae1e3c in var_2a32d68) {
        for (j = 0; j < level.pistol_values.size; j++) {
            if (level.pistol_values[j] == var_21ae1e3c.rootweapon) {
                if (j > var_d3702e29) {
                    var_d3702e29 = j;
                }
                break;
            }
        }
    }
    w_pistol = level.pistol_values[var_d3702e29];
    return self getbuildkitweapon(w_pistol);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x4cb6e50a, Offset: 0x2880
// Size: 0xc2
function function_f351748e(weapon) {
    var_1d2409c1 = spawnstruct();
    var_1d2409c1.n_clip = self getweaponammoclip(weapon);
    var_1d2409c1.var_d54402a8 = 0;
    if (weapon.dualwieldweapon != level.weaponnone) {
        var_1d2409c1.var_d54402a8 = self getweaponammoclip(weapon.dualwieldweapon);
    }
    var_1d2409c1.n_stock = self getweaponammostock(weapon);
    self.var_1d2409c1 = var_1d2409c1;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xe5e74d8a, Offset: 0x2950
// Size: 0xcc
function function_a9cb028f() {
    var_1d2409c1 = self.var_1d2409c1;
    weapon = self.laststandpistol;
    if (self hasweapon(weapon, 1)) {
        self setweaponammoclip(weapon, var_1d2409c1.n_clip);
        if (weapon.dualwieldweapon != level.weaponnone) {
            self setweaponammoclip(weapon.dualwieldweapon, var_1d2409c1.var_d54402a8);
        }
        self setweaponammostock(weapon, var_1d2409c1.n_stock);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x1 linked
// Checksum 0x34396ac5, Offset: 0x2a28
// Size: 0xbc
function laststand_clean_up_on_disconnect(e_revivee, w_reviver, w_revive_tool) {
    self endon(#"do_revive_ended_normally", #"death");
    revivetrigger = e_revivee.revivetrigger;
    e_revivee waittill(#"disconnect");
    if (isdefined(revivetrigger)) {
        revivetrigger delete();
    }
    if (isdefined(w_reviver) && isdefined(w_revive_tool)) {
        self revive_give_back_weapons(w_reviver, w_revive_tool);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xef01fa91, Offset: 0x2af0
// Size: 0x9a
function laststand_clean_up_reviving_any(e_revivee) {
    self endon(#"do_revive_ended_normally", #"disconnect");
    e_revivee waittill(#"disconnect", #"zombified", #"stop_revive_trigger");
    if (!isdefined(self.is_reviving_any)) {
        self.is_reviving_any = 0;
    }
    self.is_reviving_any--;
    if (self.is_reviving_any < 0) {
        self.is_reviving_any = 0;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x5e19dc0e, Offset: 0x2b98
// Size: 0x7c
function laststand_give_pistol() {
    /#
        assert(isdefined(self.laststandpistol));
    #/
    /#
        assert(self.laststandpistol != level.weaponnone);
    #/
    function_25a89622();
    self thread wait_switch_weapon(1, self.laststandpistol);
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x1 linked
// Checksum 0x3bddb90c, Offset: 0x2c20
// Size: 0x64
function wait_switch_weapon(n_delay, w_weapon) {
    self endon(#"player_revived", #"zombified", #"disconnect");
    wait(n_delay);
    self switchtoweapon(w_weapon);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xc2f84ba9, Offset: 0x2c90
// Size: 0x444
function laststand_bleedout(delay) {
    self endon(#"player_revived", #"zombified", #"disconnect", #"instakill_player");
    level endon(#"end_game", #"round_reset");
    if (level flag::get("round_reset")) {
        return;
    }
    self thread zm_perks::function_b4c0e0ee(delay);
    if (isdefined(level.var_5b7d2700) && level.var_5b7d2700) {
        return;
    }
    if (isdefined(self.is_zombie) && self.is_zombie || isdefined(self.var_39c78617) && self.var_39c78617) {
        self notify(#"bled_out");
        globallogic_player::function_b2873ebe();
        level notify(#"player_bled_out", {#player:self});
        self callback::callback(#"on_player_bleedout");
        util::wait_network_frame();
        self bleed_out();
        return;
    }
    self clientfield::set("zmbLastStand", 1);
    self.bleedout_time = delay;
    n_default_bleedout_time = getdvarfloat(#"player_laststandbleedouttime", 0);
    level.var_ff482f76 zm_laststand_client::open(self, 0);
    level.var_ff482f76 zm_laststand_client::set_num_downs(self, self.n_downs);
    level.var_ff482f76 zm_laststand_client::set_revive_progress(self, 0);
    while (self.bleedout_time > 0) {
        self.bleedout_time = self.bleedout_time - 1;
        level clientfield::set("laststand_update" + self getentitynumber(), self.bleedout_time / delay);
        level.var_ff482f76 zm_laststand_client::set_bleedout_progress(self, self.bleedout_time / delay);
        wait(1);
    }
    while (self.var_16735873 === 1) {
        wait(0.1);
    }
    while (isdefined(self.revivetrigger) && isdefined(self.revivetrigger.beingrevived) && self.revivetrigger.beingrevived) {
        wait(0.1);
    }
    self notify(#"bled_out");
    globallogic_player::function_b2873ebe();
    level notify(#"player_bled_out", {#player:self});
    self callback::callback(#"on_player_bleedout");
    self.var_ea7ea155 = 1;
    util::wait_network_frame();
    level.var_ff482f76 zm_laststand_client::close(self);
    level.var_1c957023 self_revive_visuals::close(self);
    self bleed_out();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x52156c50, Offset: 0x30e0
// Size: 0x28c
function bleed_out() {
    self endon(#"disconnect");
    self notify(#"stop_revive_trigger");
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
        self.revivetrigger = undefined;
    }
    self laststand_enable_player_weapons(1);
    self.laststand = undefined;
    self clientfield::set("zmbLastStand", 0);
    self zm_stats::increment_client_stat("deaths");
    self zm_stats::increment_player_stat("deaths");
    self zm_stats::function_8f10788e("boas_deaths");
    self recordplayerdeathzombies();
    self.last_bleed_out_time = gettime();
    self zm_equipment::take();
    demo::bookmark(#"zm_player_bledout", gettime(), self, undefined, 1);
    potm::bookmark(#"zm_player_bledout", gettime(), self, undefined, 1);
    level notify(#"bleed_out", {#character_index:self.characterindex});
    self undolaststand();
    self clientfield::set("zm_last_stand_postfx", 0);
    zm_player::function_8ef51109(self, 1);
    self.var_ea7ea155 = undefined;
    self suicide();
    if (isdefined(level.is_zombie_level) && level.is_zombie_level) {
        self thread [[ level.player_becomes_zombie ]]();
        self.statusicon = "hud_status_dead";
    } else {
        self val::reset(#"laststand", "ignoreme");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xd01ff41b, Offset: 0x3378
// Size: 0x90
function can_suicide() {
    if (!isalive(self)) {
        return 0;
    }
    if (!self laststand::player_is_in_laststand()) {
        return 0;
    }
    if (!isdefined(self.suicideprompt)) {
        return 0;
    }
    if (isdefined(self.is_zombie) && self.is_zombie) {
        return 0;
    }
    if (isdefined(level.intermission) && level.intermission) {
        return 0;
    }
    return 1;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x0
// Checksum 0x496e8bf1, Offset: 0x3410
// Size: 0x3c
function is_suiciding(revivee) {
    return self usebuttonpressed() && can_suicide();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xd9405d9a, Offset: 0x3458
// Size: 0x268
function function_4d3cb10() {
    level notify(#"hash_ec82a2f41cadbea");
    level endon(#"hash_ec82a2f41cadbea");
    var_9156a121 = 0;
    var_972a361b = 0;
    waitframe(1);
    a_e_players = getplayers();
    if (a_e_players.size == 1) {
        var_9156a121 = 1;
        if (!level flag::get("solo_game")) {
            var_972a361b = 1;
            level flag::set("solo_game");
        }
    } else if (level flag::get("solo_game")) {
        var_972a361b = 1;
        level flag::clear("solo_game");
    }
    if (var_972a361b && !zm_utility::is_standard() && !zm_utility::is_trials()) {
        foreach (e_player in a_e_players) {
            if (isdefined(e_player.var_240cf7be) && e_player.var_240cf7be) {
                if (var_9156a121) {
                    e_player function_3d685b5f(int(max(0, e_player.var_d66589da - e_player.var_308dc243)));
                } else {
                    e_player function_3d685b5f(int(max(0, e_player.var_5d4c5daf - e_player.var_308dc243)));
                }
            }
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x6e3d5d34, Offset: 0x36c8
// Size: 0x88
function function_3d685b5f(self_revive_count) {
    self_revive_count = int(max(self_revive_count, 0));
    self.var_72249004 = self_revive_count;
    self clientfield::set_player_uimodel("ZMInventoryPersonal.self_revive_count", self_revive_count);
    if (isdefined(level.var_c1fe3c83)) {
        self [[ level.var_c1fe3c83 ]]();
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x751c7673, Offset: 0x3758
// Size: 0xa
function function_618fd37e() {
    return self.var_72249004;
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x1 linked
// Checksum 0x8996fc42, Offset: 0x3770
// Size: 0x9c
function function_3a00302e(n_count = 1, var_d47c52b4 = 1) {
    if (var_d47c52b4) {
        self.var_d66589da = self.var_d66589da + n_count;
        self.var_5d4c5daf = self.var_5d4c5daf + n_count;
    }
    self function_3d685b5f(self function_618fd37e() + n_count);
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x1 linked
// Checksum 0xa31b9415, Offset: 0x3818
// Size: 0x84
function function_409dc98e(n_count = 1, b_revived = 1) {
    if (b_revived) {
        self.var_308dc243 = self.var_308dc243 + n_count;
    }
    self function_3d685b5f(self function_618fd37e() - n_count);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x26722328, Offset: 0x38a8
// Size: 0x1cc
function function_b7c101fa() {
    self endon(#"disconnect");
    self.var_72249004 = 0;
    self.var_308dc243 = 0;
    self.var_d66589da = int(zombie_utility::function_d2dfacfd(#"hash_67ae1b8cbb7c985"));
    self.var_5d4c5daf = int(zombie_utility::function_d2dfacfd(#"hash_3098c53bba6402d3"));
    level thread function_4d3cb10();
    self waittill(#"spawned");
    level flag::wait_till("start_zombie_round_logic");
    if (getplayers().size == 1) {
        self_revive_count = self.var_d66589da;
        self.var_240cf7be = 1;
    } else {
        self_revive_count = self.var_5d4c5daf;
    }
    var_48f2f554 = zm_custom::function_901b751c(#"zmselfreviveamount");
    if (var_48f2f554) {
        self.var_d66589da = int(var_48f2f554);
        self.var_5d4c5daf = int(var_48f2f554);
        self function_3d685b5f(var_48f2f554);
    } else {
        self function_3d685b5f(self_revive_count);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x2b79172e, Offset: 0x3a80
// Size: 0x44
function function_3699b145() {
    level.var_1c957023 self_revive_visuals::open(self, 0);
    self.var_c2bb0cce = 1;
    self thread function_76043ec3();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x89ac0d1, Offset: 0x3ad0
// Size: 0x1f0
function function_76043ec3() {
    self endon(#"disconnect", #"zombified", #"player_revived", #"bled_out");
    level endon(#"end_game");
    while (self usebuttonpressed()) {
        wait(1);
    }
    if (!isdefined(self.var_c2bb0cce)) {
        return;
    }
    self.var_c6a6f334 = 0;
    while (1) {
        wait(0.1);
        if (!isdefined(self.var_c2bb0cce)) {
            continue;
        }
        if (!self function_550c4ac4()) {
            continue;
        }
        n_duration = revive_get_revive_time(self);
        self_revive_success = function_73d6c609(n_duration);
        if (self_revive_success) {
            if (isdefined(level.a_revive_success_perk_func)) {
                foreach (func in level.a_revive_success_perk_func) {
                    self [[ func ]]();
                }
            }
            if (isdefined(self.var_ff5f8752)) {
                self thread zm_audio::create_and_play_dialog(#"revive", self.var_ff5f8752);
            }
            self thread auto_revive(self, 1, 1);
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x4edc6df5, Offset: 0x3cc8
// Size: 0x34
function function_550c4ac4() {
    return self usebuttonpressed() && function_30b9cdd5();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x3c9284d, Offset: 0x3d08
// Size: 0x94
function function_30b9cdd5() {
    if (!isalive(self)) {
        return 0;
    }
    if (isdefined(self.var_c6a6f334) && self.var_c6a6f334) {
        return 0;
    }
    if (!isdefined(self.var_c2bb0cce)) {
        return 0;
    }
    if (isdefined(self.is_zombie) && self.is_zombie) {
        return 0;
    }
    if (isdefined(level.intermission) && level.intermission) {
        return 0;
    }
    return 1;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x2a5d92f4, Offset: 0x3da8
// Size: 0x154
function function_73d6c609(n_duration) {
    self endoncallback(&function_a7f11faa, #"player_revived", #"zombified", #"bled_out", #"disconnect");
    level endon(#"end_game");
    var_722c6f25 = 0;
    b_success = 0;
    while (1) {
        while (self function_550c4ac4()) {
            waitframe(1);
            var_722c6f25 = var_722c6f25 + 0.05;
            level.var_1c957023 self_revive_visuals::set_revive_progress(self, var_722c6f25 / n_duration);
            if (var_722c6f25 >= n_duration) {
                b_success = 1;
                break;
            }
        }
        level.var_1c957023 self_revive_visuals::set_revive_progress(self, 0);
        var_722c6f25 = 0;
        if (isdefined(b_success) && b_success) {
            return b_success;
        }
        waitframe(1);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xc98d8f06, Offset: 0x3f08
// Size: 0x3c
function function_a7f11faa(var_c34665fc) {
    if (var_c34665fc != "disconnect") {
        level.var_1c957023 self_revive_visuals::set_revive_progress(self, 0);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xfce38594, Offset: 0x3f50
// Size: 0x17c
function revive_trigger_spawn() {
    if (isdefined(level.var_28bbd30a) && level.var_28bbd30a) {
        return;
    }
    radius = getdvarint(#"revive_trigger_radius", 75);
    self.revivetrigger = spawn("trigger_radius", (0, 0, 0), 0, radius, radius);
    self.revivetrigger sethintstring("");
    self.revivetrigger setcursorhint("HINT_NOICON");
    self.revivetrigger setmovingplatformenabled(1);
    self.revivetrigger enablelinkto();
    self.revivetrigger.origin = self.origin;
    self.revivetrigger linkto(self);
    self.revivetrigger setinvisibletoplayer(self);
    self.revivetrigger.beingrevived = 0;
    self.revivetrigger.createtime = gettime();
    self thread revive_trigger_think();
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xec7d2f7c, Offset: 0x40d8
// Size: 0x66c
function revive_trigger_think(t_secondary) {
    self endon(#"disconnect", #"zombified", #"stop_revive_trigger", #"death");
    level endon(#"end_game");
    while (1) {
        wait(0.1);
        if (isdefined(t_secondary)) {
            t_revive = t_secondary;
        } else {
            t_revive = self.revivetrigger;
        }
        t_revive sethintstring("");
        foreach (e_player in getplayers()) {
            n_depth = 0;
            n_depth = self depthinwater();
            if (isdefined(t_secondary)) {
                if (e_player can_revive(self, 1, 1) && e_player istouching(t_revive) || n_depth > 20) {
                    t_revive setrevivehintstring(#"hash_12272c5573321d90", self.team);
                    break;
                }
            } else if (e_player can_revive_via_override(self) || e_player can_revive(self) || n_depth > 20) {
                t_revive setrevivehintstring(#"hash_12272c5573321d90", self.team);
                break;
            }
        }
        foreach (e_reviver in getplayers()) {
            if (!isdefined(e_reviver) || self == e_reviver && !isdefined(self.var_6d772cb) || !e_reviver is_reviving(self, t_secondary)) {
                continue;
            }
            if (isdefined(level.var_3ea7f9f4) && level.var_3ea7f9f4 && e_reviver zm_loadout::has_hero_weapon()) {
                w_reviver = undefined;
                w_revive_tool = undefined;
            } else if (!isdefined(self.var_6d772cb) && (!isdefined(e_reviver.s_revive_override_used) || e_reviver.s_revive_override_used.b_use_revive_tool)) {
                w_revive_tool = level.weaponrevivetool;
                if (isdefined(e_reviver.weaponrevivetool)) {
                    w_revive_tool = e_reviver.weaponrevivetool;
                }
                w_reviver = e_reviver getcurrentweapon();
                /#
                    assert(isdefined(w_reviver));
                #/
                if (w_reviver == w_revive_tool) {
                    continue;
                }
                e_reviver giveweapon(w_revive_tool);
                e_reviver switchtoweapon(w_revive_tool);
                e_reviver setweaponammostock(w_revive_tool, 1);
                e_reviver disableweaponcycling();
                e_reviver disableoffhandweapons();
                e_reviver disableweaponswitchhero();
                e_reviver thread revive_give_back_weapons_when_done(w_reviver, w_revive_tool, self);
            } else {
                w_reviver = undefined;
                w_revive_tool = undefined;
            }
            if (isdefined(self.revivevox) && !(isdefined(self.var_54cb40e6) && self.var_54cb40e6)) {
                e_reviver thread zm_audio::create_and_play_dialog(#"revive", self.revivevox);
            }
            b_revive_successful = e_reviver revive_do_revive(self, w_reviver, w_revive_tool, t_secondary);
            if (isdefined(e_reviver)) {
                e_reviver notify(#"revive_done");
            }
            if (b_revive_successful) {
                if (isdefined(level.a_revive_success_perk_func)) {
                    foreach (func in level.a_revive_success_perk_func) {
                        self [[ func ]]();
                    }
                }
                level.var_ff482f76 zm_laststand_client::close(self);
                level.var_1c957023 self_revive_visuals::close(self);
                self thread revive_success(e_reviver);
                self notify(#"stop_revive_trigger");
                return;
            } else if (isdefined(e_reviver)) {
                e_reviver zm_vo::vo_stop();
            }
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xc815ef99, Offset: 0x4750
// Size: 0x13c
function function_8fd9d8b9(e_reviver) {
    self endon(#"death");
    zm_vo::vo_stop();
    if (e_reviver === self && isdefined(self.var_ff5f8752)) {
        self.last_vo_played_time = 0;
        zm_audio::create_and_play_dialog(#"revive", self.var_ff5f8752);
    }
    self notify(#"hash_1fe68a6b935c321d", {#reviver:e_reviver});
    if (!isdefined(self.var_6d772cb) && !(isdefined(self.var_54cb40e6) && self.var_54cb40e6)) {
        if (isplayer(e_reviver) && isdefined(e_reviver.var_c107ed3)) {
            self thread zm_audio::create_and_play_dialog(#"revive", e_reviver.var_c107ed3, undefined, 1);
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x1 linked
// Checksum 0x6b100b9, Offset: 0x4898
// Size: 0x8c
function revive_give_back_weapons_wait(e_reviver, e_revivee) {
    e_revivee endon(#"disconnect", #"zombified", #"stop_revive_trigger", #"death");
    level endon(#"end_game");
    e_reviver waittill(#"revive_done");
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x1 linked
// Checksum 0xf3bf5c8e, Offset: 0x4930
// Size: 0x5c
function revive_give_back_weapons_when_done(w_reviver, w_revive_tool, e_revivee) {
    self endon(#"death");
    revive_give_back_weapons_wait(self, e_revivee);
    self revive_give_back_weapons(w_reviver, w_revive_tool);
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x1 linked
// Checksum 0xa12d99a2, Offset: 0x4998
// Size: 0x14c
function revive_give_back_weapons(w_reviver, w_revive_tool) {
    self takeweapon(w_revive_tool);
    self enableoffhandweapons();
    if (!(isdefined(self.var_b6840ea0) && self.var_b6840ea0)) {
        self enableweaponswitchhero();
    }
    if (self laststand::player_is_in_laststand()) {
        return;
    }
    self enableweaponcycling();
    if (w_reviver != level.weaponnone && !zm_loadout::is_placeable_mine(w_reviver) && !zm_equipment::is_equipment(w_reviver) && !w_reviver.isflourishweapon && self hasweapon(w_reviver)) {
        self zm_weapons::switch_back_primary_weapon(w_reviver, 0, 1);
    } else {
        self zm_weapons::switch_back_primary_weapon();
    }
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x1 linked
// Checksum 0x8679469d, Offset: 0x4af0
// Size: 0x326
function can_revive(e_revivee, ignore_sight_checks = 0, ignore_touch_checks = 0) {
    if (!isdefined(e_revivee.revivetrigger)) {
        return 0;
    }
    if (!isalive(self)) {
        return 0;
    }
    if (self laststand::player_is_in_laststand()) {
        return 0;
    }
    if (self.team != e_revivee.team) {
        return 0;
    }
    if (isdefined(self.is_zombie) && self.is_zombie) {
        return 0;
    }
    if (self zm_loadout::has_powerup_weapon()) {
        return 0;
    }
    if (!(isdefined(level.var_3ea7f9f4) && level.var_3ea7f9f4) && self zm_loadout::has_hero_weapon()) {
        return 0;
    }
    if (isdefined(level.can_revive_use_depthinwater_test) && level.can_revive_use_depthinwater_test && e_revivee depthinwater() > 10) {
        return 1;
    }
    if (isdefined(level.can_revive) && ![[ level.can_revive ]](e_revivee)) {
        return 0;
    }
    if (isdefined(level.var_1461fd14) && ![[ level.var_1461fd14 ]](e_revivee)) {
        return 0;
    }
    if (!ignore_sight_checks && isdefined(level.revive_trigger_should_ignore_sight_checks)) {
        ignore_sight_checks = [[ level.revive_trigger_should_ignore_sight_checks ]](self);
        if (ignore_sight_checks && isdefined(e_revivee.revivetrigger.beingrevived) && e_revivee.revivetrigger.beingrevived) {
            ignore_touch_checks = 1;
        }
    }
    if (!ignore_touch_checks) {
        if (!self istouching(e_revivee.revivetrigger)) {
            return 0;
        }
    }
    if (!ignore_sight_checks) {
        if (!self laststand::is_facing(e_revivee)) {
            return 0;
        }
        if (!sighttracepassed(self.origin + vectorscale((0, 0, 1), 50), e_revivee.origin + vectorscale((0, 0, 1), 30), 0, undefined)) {
            return 0;
        }
        if (!bullettracepassed(self.origin + vectorscale((0, 0, 1), 50), e_revivee.origin + vectorscale((0, 0, 1), 30), 0, undefined)) {
            return 0;
        }
    }
    return 1;
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x1 linked
// Checksum 0x6b5a51c9, Offset: 0x4e20
// Size: 0xbc
function is_reviving(e_revivee, t_secondary) {
    if (self is_reviving_via_override(e_revivee)) {
        return 1;
    }
    if (isdefined(t_secondary)) {
        return (self usebuttonpressed() && self can_revive(e_revivee, 1, 1) && self istouching(t_secondary));
    }
    return self usebuttonpressed() && can_revive(e_revivee);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x662f498f, Offset: 0x4ee8
// Size: 0x18
function is_reviving_any() {
    return isdefined(self.is_reviving_any) && self.is_reviving_any;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xddadf04a, Offset: 0x4f08
// Size: 0x6e
function revive_get_revive_time(e_revivee) {
    revivetime = 3;
    if (self hasperk(#"specialty_quickrevive")) {
        revivetime = 2;
    }
    if (isdefined(self.get_revive_time)) {
        revivetime = self [[ self.get_revive_time ]](e_revivee);
    }
    return revivetime;
}

// Namespace zm_laststand/zm_laststand
// Params 4, eflags: 0x1 linked
// Checksum 0x26698a35, Offset: 0x4f80
// Size: 0x470
function revive_do_revive(e_revivee, w_reviver, w_revive_tool, t_secondary) {
    /#
        assert(self is_reviving(e_revivee, t_secondary));
    #/
    revivetime = self revive_get_revive_time(e_revivee);
    if (!isdefined(e_revivee.var_6fc48a11)) {
        e_revivee.var_6fc48a11 = 0;
    }
    revived = 0;
    e_revivee notify(#"player_being_revived");
    e_revivee.revivetrigger.beingrevived = 1;
    e_revivee thread laststand::revive_hud_show_n_fade(#"hash_12e2c5e29f8ce6ad", 3, self);
    e_revivee.revivetrigger sethintstring("");
    if (isplayer(e_revivee)) {
        e_revivee startrevive(self);
        e_revivee.var_c6a6f334 = 1;
    }
    self thread laststand_clean_up_on_disconnect(e_revivee, w_reviver, w_revive_tool);
    if (!isdefined(self.is_reviving_any)) {
        self.is_reviving_any = 0;
    }
    self.is_reviving_any++;
    self thread laststand_clean_up_reviving_any(e_revivee);
    if (!isdefined(self.revive_progress)) {
        self.revive_progress = 0;
    }
    self.revive_progress = self.revive_progress + 1;
    self thread check_for_failed_revive(e_revivee);
    while (isdefined(self) && self is_reviving(e_revivee, t_secondary)) {
        waitframe(1);
        e_revivee.var_6fc48a11 = e_revivee.var_6fc48a11 + 0.05;
        level.var_ff482f76 zm_laststand_client::set_revive_progress(e_revivee, e_revivee.var_6fc48a11 / revivetime);
        if (isdefined(e_revivee.revivetrigger.auto_revive) && e_revivee.revivetrigger.auto_revive) {
            break;
        }
        if (e_revivee.var_6fc48a11 >= revivetime) {
            e_revivee.laststand = undefined;
            revived = 1;
            break;
        }
    }
    if (!(isdefined(e_revivee.revivetrigger.auto_revive) && e_revivee.revivetrigger.auto_revive) && !revived) {
        if (isplayer(e_revivee)) {
            e_revivee stoprevive(self);
        }
    }
    e_revivee.revivetrigger sethintstring(#"hash_12272c5573321d90");
    e_revivee.revivetrigger.beingrevived = 0;
    if (isdefined(self)) {
        self notify(#"do_revive_ended_normally");
        if (!isdefined(self.is_reviving_any)) {
            self.is_reviving_any = 0;
        }
        self.is_reviving_any--;
        if (self.is_reviving_any < 0) {
            self.is_reviving_any = 0;
        }
        self.revive_progress = 0;
    }
    e_revivee.var_c6a6f334 = 0;
    if (!revived) {
        e_revivee thread checkforbleedout(self);
        e_revivee thread function_2cc9a315(revivetime);
        e_revivee thread function_7165ead0();
    } else {
        e_revivee.var_6fc48a11 = 0;
        level.var_ff482f76 zm_laststand_client::set_revive_progress(e_revivee, 0);
    }
    return revived;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x36bfb27b, Offset: 0x53f8
// Size: 0xd6
function function_2cc9a315(revivetime) {
    self endon(#"player_being_revived", #"player_revived", #"disconnect", #"bled_out");
    while (!(isdefined(self.var_c6a6f334) && self.var_c6a6f334) && isdefined(self.var_6fc48a11) && self.var_6fc48a11 >= 0) {
        self.var_6fc48a11 = self.var_6fc48a11 - 0.05;
        level.var_ff482f76 zm_laststand_client::set_revive_progress(self, self.var_6fc48a11 / revivetime);
        waitframe(1);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x555906f4, Offset: 0x54d8
// Size: 0x62
function function_7165ead0() {
    self endon(#"player_being_revived", #"player_revived", #"disconnect");
    self waittill(#"bled_out");
    if (isdefined(self.var_6fc48a11)) {
        self.var_6fc48a11 = 0;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x39c91efd, Offset: 0x5548
// Size: 0x68
function checkforbleedout(player) {
    if (isdefined(player) && zm_utility::is_classic()) {
        if (!isdefined(player.failed_revives)) {
            player.failed_revives = 0;
        }
        player.failed_revives++;
        player notify(#"player_failed_revive");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x1 linked
// Checksum 0x1ecae93d, Offset: 0x55b8
// Size: 0x174
function auto_revive(reviver, b_track_stats = 1, var_c0ab6a65) {
    level endon(#"end_game");
    self endoncallback(&function_48ce762a, #"disconnect");
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger.auto_revive = 1;
        if (self.revivetrigger.beingrevived) {
            while (1) {
                if (!isdefined(self.revivetrigger) || !self.revivetrigger.beingrevived) {
                    break;
                }
                util::wait_network_frame();
            }
        }
        if (isdefined(self.revivetrigger)) {
            self.revivetrigger.auto_trigger = 0;
        }
    }
    level.var_ff482f76 zm_laststand_client::close(self);
    level.var_1c957023 self_revive_visuals::close(self);
    self notify(#"stop_revive_trigger");
    self thread revive_success(reviver, b_track_stats, var_c0ab6a65);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x57511d46, Offset: 0x5738
// Size: 0x34
function function_48ce762a(param) {
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
    }
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x1 linked
// Checksum 0xdc6a8a12, Offset: 0x5778
// Size: 0x134
function revive_success(reviver, b_track_stats = 1, var_c0ab6a65) {
    level endon(#"end_game");
    if (!isplayer(self)) {
        self notify(#"player_revived", {#reviver:reviver});
        return;
    }
    self thread function_8fd9d8b9(reviver);
    if (isplayer(reviver) && isdefined(b_track_stats) && b_track_stats) {
        reviver xp_revive_once_per_round(self);
        if (!(isdefined(level.isresetting_grief) && level.isresetting_grief)) {
            reviver thread check_for_sacrifice();
        }
    }
    self revive_internal(reviver, b_track_stats, var_c0ab6a65);
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x5 linked
// Checksum 0xc46682be, Offset: 0x58b8
// Size: 0x4f0
function private revive_internal(reviver, b_track_stats, var_c0ab6a65 = 0) {
    self reviveplayer();
    self zm_utility::set_max_health();
    self clientfield::set("zmbLastStand", 0);
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
        self.revivetrigger = undefined;
    }
    self clientfield::set("zm_last_stand_postfx", 0);
    self val::set("zm_laststand", "allowdeath", 0);
    self util::delay(2, "death", &val::reset, "zm_laststand", "allowdeath");
    self util::delay(2, "death", &val::reset, "laststand", "ignoreme");
    self.laststand = undefined;
    if (var_c0ab6a65) {
        self function_409dc98e();
    }
    self allowjump(1);
    if (isplayer(reviver)) {
        reviver notify(#"player_did_a_revive", {#revived_player:self});
        if (!(isdefined(level.isresetting_grief) && level.isresetting_grief) && isdefined(b_track_stats) && b_track_stats && reviver != self) {
            reviver.revives++;
            reviver zm_stats::increment_client_stat("revives");
            reviver zm_stats::increment_player_stat("revives");
            reviver zm_stats::function_f1a1191d("revives");
            reviver zm_stats::function_3468f864("revives");
            reviver zm_stats::function_7bc347f6("revives");
            reviver zm_stats::function_8f10788e("boas_revives");
            self recordplayerrevivezombies(reviver);
            demo::bookmark(#"zm_player_revived", gettime(), reviver, self);
            potm::bookmark(#"zm_player_revived", gettime(), reviver, self);
        }
    }
    self notify(#"player_revived", {#var_a4916eac:self.var_84280a99, #reviver:reviver});
    s_params = spawnstruct();
    s_params.e_revivee = self;
    s_params.e_reviver = reviver;
    s_params.var_84280a99 = self.var_84280a99;
    self callback::callback(#"on_player_revived", s_params);
    waitframe(1);
    if (isdefined(self)) {
        self thread laststand_enable_player_weapons();
    }
    if (getplayers().size == 1) {
        ais = getactorarray();
        foreach (ai in ais) {
            zm_utility::get_closest_valid_player(ai.origin, undefined, 1);
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x658f918e, Offset: 0x5db0
// Size: 0xb2
function xp_revive_once_per_round(player_being_revived) {
    if (!isdefined(self.number_revives_per_round)) {
        self.number_revives_per_round = [];
    }
    if (!isdefined(self.number_revives_per_round[player_being_revived.characterindex])) {
        self.number_revives_per_round[player_being_revived.characterindex] = 0;
    }
    if (self != player_being_revived && self.number_revives_per_round[player_being_revived.characterindex] == 0) {
        scoreevents::processscoreevent("revive_an_ally", self);
    }
    self.number_revives_per_round[player_being_revived.characterindex]++;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x0
// Checksum 0x7020d18e, Offset: 0x5e70
// Size: 0x8c
function revive_force_revive(reviver) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isplayer(self));
    #/
    /#
        assert(self laststand::player_is_in_laststand());
    #/
    self thread revive_success(reviver);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x0
// Checksum 0xeaeec347, Offset: 0x5f08
// Size: 0x260
function revive_hud_think() {
    level endon(#"last_player_died");
    while (1) {
        wait(0.1);
        if (!laststand::player_any_player_in_laststand()) {
            continue;
        }
        players = getplayers();
        playertorevive = undefined;
        for (i = 0; i < players.size; i++) {
            if (!isdefined(players[i].revivetrigger) || !isdefined(players[i].revivetrigger.createtime)) {
                continue;
            }
            if (!isdefined(playertorevive) || playertorevive.revivetrigger.createtime > players[i].revivetrigger.createtime) {
                playertorevive = players[i];
            }
        }
        if (isdefined(playertorevive)) {
            for (i = 0; i < players.size; i++) {
                if (players[i] laststand::player_is_in_laststand()) {
                    continue;
                }
                if (util::get_game_type() == "vs") {
                    jumpiffalse(players[i].team != playertorevive.team) LOC_0000019e;
                } else if (zm_utility::is_encounter()) {
                    if (players[i].sessionteam != playertorevive.sessionteam) {
                        continue;
                    }
                    jumpiffalse(isdefined(level.hide_revive_message) && level.hide_revive_message) LOC_000001fe;
                } else {
                LOC_000001fe:
                    players[i] thread laststand::revive_hud_show_n_fade(#"hash_453f3038b87fbc77", 3, playertorevive);
                }
            }
            playertorevive.revivetrigger.createtime = undefined;
            wait(3.5);
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xa2a1467e, Offset: 0x6170
// Size: 0x9c
function check_for_sacrifice() {
    self endon(#"death", #"sacrifice_denied");
    self util::delay_notify("sacrifice_denied", 1);
    self waittill(#"player_downed");
    self zm_stats::increment_client_stat("sacrifices");
    self zm_stats::increment_player_stat("sacrifices");
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x45d129ff, Offset: 0x6218
// Size: 0xdc
function check_for_failed_revive(e_revivee) {
    self notify(#"checking_for_failed_revive");
    self endon(#"disconnect", #"checking_for_failed_revive");
    e_revivee endon(#"disconnect", #"player_revived");
    e_revivee waittill(#"bled_out");
    self zm_stats::increment_client_stat("failed_revives");
    self zm_stats::increment_player_stat("failed_revives");
    self zm_stats::function_8f10788e("boas_failed_revives");
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xd8051bff, Offset: 0x6300
// Size: 0xcc
function add_weighted_down() {
    if (!level.curr_gametype_affects_rank) {
        return;
    }
    weighted_down = 1000;
    if (level.round_number > 0) {
        weighted_down = int(1000 / ceil(level.round_number / 5));
    }
    if (!level.onlinegame || isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats) {
        return;
    }
    self stats::function_dad108fa(#"weighted_downs", weighted_down);
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x1 linked
// Checksum 0x5b3d450e, Offset: 0x63d8
// Size: 0xda
function register_revive_override(func_is_reviving, func_can_revive = undefined, b_use_revive_tool = 0) {
    if (!isdefined(self.a_s_revive_overrides)) {
        self.a_s_revive_overrides = [];
    }
    s_revive_override = spawnstruct();
    s_revive_override.func_is_reviving = func_is_reviving;
    if (isdefined(func_can_revive)) {
        s_revive_override.func_can_revive = func_can_revive;
    } else {
        s_revive_override.func_can_revive = func_is_reviving;
    }
    s_revive_override.b_use_revive_tool = b_use_revive_tool;
    self.a_s_revive_overrides[self.a_s_revive_overrides.size] = s_revive_override;
    return s_revive_override;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xf34844cc, Offset: 0x64c0
// Size: 0x3c
function deregister_revive_override(s_revive_override) {
    if (isdefined(self) && isdefined(self.a_s_revive_overrides)) {
        arrayremovevalue(self.a_s_revive_overrides, s_revive_override);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xb163233b, Offset: 0x6508
// Size: 0x74
function can_revive_via_override(e_revivee) {
    if (isdefined(self) && isdefined(self.a_s_revive_overrides)) {
        for (i = 0; i < self.a_s_revive_overrides.size; i++) {
            if (self [[ self.a_s_revive_overrides[i].func_can_revive ]](e_revivee)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0xdd0bfd7a, Offset: 0x6588
// Size: 0xc8
function is_reviving_via_override(e_revivee) {
    if (isdefined(self) && isdefined(self.a_s_revive_overrides)) {
        if (isdefined(e_revivee.var_84280a99) && e_revivee.var_84280a99 !== self) {
            return 0;
        }
        for (i = 0; i < self.a_s_revive_overrides.size; i++) {
            if (self [[ self.a_s_revive_overrides[i].func_is_reviving ]](e_revivee)) {
                self.s_revive_override_used = self.a_s_revive_overrides[i];
                return 1;
            }
        }
    }
    if (isdefined(self)) {
        self.s_revive_override_used = undefined;
    }
    return 0;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x3871d187, Offset: 0x6658
// Size: 0xc4
function instakill_player() {
    self.var_39c78617 = 1;
    self notify(#"instakill_player");
    if (self laststand::player_is_in_laststand()) {
        level.var_ff482f76 zm_laststand_client::close(self);
        level.var_1c957023 self_revive_visuals::close(self);
        waitframe(4);
        bleed_out();
    } else {
        self dodamage(self.maxhealth + 666, self.origin);
    }
}

