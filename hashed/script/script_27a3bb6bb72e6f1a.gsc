// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_towers_util.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_edfc2a97;

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x2
// Checksum 0xe3f8c41, Offset: 0x1e0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_2b52a9f53a5e4b45", &__init__, &__main__, undefined);
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0xb8c61137, Offset: 0x230
// Size: 0x24
function __init__() {
    callback::on_finalize_initialization(&init);
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x260
// Size: 0x4
function __main__() {
    
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0x7f80db00, Offset: 0x270
// Size: 0x54
function init() {
    level flag::init(#"hash_1dedcdbd1e528077");
    level flag::wait_till("all_players_spawned");
    function_611fe553();
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0x5197a0f4, Offset: 0x2d0
// Size: 0x2ac
function function_611fe553() {
    level.var_e7d39108 = 4;
    level.var_16c6de62 = 4;
    level.var_9930160c = 7;
    level.var_1171b93e = getentarray("mdl_fire_column", "targetname");
    level.var_abf198ff = array();
    level.var_abf198ff[0] = struct::get("fire_trap_01", "targetname");
    level.var_abf198ff[1] = struct::get("fire_trap_02", "targetname");
    level.var_abf198ff[2] = struct::get("fire_trap_03", "targetname");
    level.var_abf198ff[3] = struct::get("fire_trap_04", "targetname");
    level.var_abf198ff[4] = struct::get("fire_trap_05", "targetname");
    level.var_abf198ff[5] = struct::get("fire_trap_06", "targetname");
    level.var_abf198ff[6] = struct::get("fire_trap_07", "targetname");
    level.var_abf198ff[7] = struct::get("fire_trap_08", "targetname");
    foreach (trap in level.var_abf198ff) {
        trap function_ddab1a20();
    }
    level thread function_25a55bd2();
    level flag::set(#"hash_1dedcdbd1e528077");
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0xe4999060, Offset: 0x588
// Size: 0x220
function function_25a55bd2() {
    level endoncallback(&function_faf783b2, #"game_ended");
    if (zm_utility::is_standard()) {
        level waittill(#"hash_2ff6268271a25ffa");
        var_d18535e8 = level.round_number;
    } else {
        var_d18535e8 = 4;
    }
    while (1) {
        level waittill(#"start_of_round");
        /#
            if (level.round_number % 2 == 1 && level.round_number > 4 && level.round_number - var_d18535e8 >= 1) {
                var_d18535e8 = level.round_number + 1;
            } else if (level.round_number % 2 == 0 && level.round_number > 4 && level.round_number - var_d18535e8 >= 2) {
                var_d18535e8 = level.round_number;
            }
        #/
        if (var_d18535e8 <= level.round_number || isdefined(level.var_2d307e50) && level.var_2d307e50) {
            var_d18535e8 = level.round_number + 2;
            function_593774d0();
            level thread function_a5ed4dd9(level.var_e7d39108, level.var_16c6de62, level.var_9930160c);
            level waittill(#"end_of_round", #"kill_round");
            level thread function_faf783b2();
        }
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0xd33c201f, Offset: 0x7b0
// Size: 0x1b6
function function_593774d0() {
    if (isdefined(level.var_a92623b1)) {
        level.var_e7d39108 = level.var_a92623b1.var_e7d39108;
        level.var_16c6de62 = level.var_a92623b1.var_16c6de62;
        level.var_9930160c = level.var_a92623b1.var_9930160c;
        level.var_a92623b1 = undefined;
    }
    if (level.var_e7d39108 < 8) {
        level.var_e7d39108 = level.var_e7d39108 + 0.25;
    }
    if (level.var_16c6de62 > 4) {
        level.var_16c6de62 = level.var_16c6de62 - 0.25;
    }
    if (level.var_9930160c > 4) {
        level.var_16c6de62 = level.var_16c6de62 - 0.25;
    }
    if (isdefined(level.var_2d307e50) && level.var_2d307e50) {
        level.var_a92623b1 = spawnstruct();
        level.var_a92623b1.var_e7d39108 = level.var_e7d39108;
        level.var_a92623b1.var_16c6de62 = level.var_16c6de62;
        level.var_a92623b1.var_9930160c = level.var_9930160c;
        level.var_e7d39108 = 24;
        level.var_16c6de62 = 1.33333;
        level.var_9930160c = 1.33333;
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 3, eflags: 0x1 linked
// Checksum 0xb36d5687, Offset: 0x970
// Size: 0x86a
function function_a5ed4dd9(var_6c367c57, var_e7c0257b, var_4eec77ed) {
    var_93a7b94d = randomintrangeinclusive(1, 7);
    switch (var_93a7b94d) {
    case 1:
        level.var_abf198ff[0] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[1] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[4] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[5] function_b736b1a2(5, 2, 2);
        break;
    case 2:
        level.var_abf198ff[2] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[3] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[6] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[7] function_b736b1a2(5, 2, 2);
        break;
    case 3:
        level.var_abf198ff[1] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[2] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[5] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[6] function_b736b1a2(5, 2, 2);
        break;
    case 4:
        level.var_abf198ff[0] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[3] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[4] function_b736b1a2(5, 2, 2);
        level.var_abf198ff[7] function_b736b1a2(5, 2, 2);
        break;
    case 5:
        level.var_abf198ff[0] function_b736b1a2(3, 2, 2);
        level.var_abf198ff[1] function_b736b1a2(3, 2, 2);
        level.var_abf198ff[2] function_b736b1a2(3, 2, 2);
        level.var_abf198ff[3] function_b736b1a2(3, 2, 2);
        level.var_abf198ff[4] function_b736b1a2(3, 2, 2);
        level.var_abf198ff[5] function_b736b1a2(3, 2, 2);
        level.var_abf198ff[6] function_b736b1a2(3, 2, 2);
        level.var_abf198ff[7] function_b736b1a2(3, 2, 2);
        break;
    case 6:
        level.var_abf198ff[0] function_b736b1a2(10, 10, 10);
        level.var_abf198ff[2] function_b736b1a2(10, 10, 10);
        level.var_abf198ff[4] function_b736b1a2(10, 10, 10);
        level.var_abf198ff[6] function_b736b1a2(10, 10, 10);
        wait(10);
        level.var_abf198ff[1] function_b736b1a2(10, 10, 10);
        level.var_abf198ff[3] function_b736b1a2(10, 10, 10);
        level.var_abf198ff[5] function_b736b1a2(10, 10, 10);
        level.var_abf198ff[7] function_b736b1a2(10, 10, 10);
        break;
    case 7:
        level.var_abf198ff[0] function_b736b1a2(3, 1, 3);
        level.var_abf198ff[4] function_b736b1a2(3, 1, 3);
        wait(1);
        level.var_abf198ff[1] function_b736b1a2(3, 1, 3);
        level.var_abf198ff[5] function_b736b1a2(3, 1, 3);
        wait(1);
        level.var_abf198ff[2] function_b736b1a2(3, 1, 3);
        level.var_abf198ff[6] function_b736b1a2(3, 1, 3);
        wait(1);
        level.var_abf198ff[3] function_b736b1a2(3, 1, 3);
        level.var_abf198ff[7] function_b736b1a2(3, 1, 3);
        wait(1);
        break;
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 1, eflags: 0x1 linked
// Checksum 0x1c54d04a, Offset: 0x11e8
// Size: 0x88
function function_faf783b2(_hash) {
    foreach (trap in level.var_abf198ff) {
        trap thread function_47b3d2e2();
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0x7ee600f6, Offset: 0x1278
// Size: 0xc2
function function_ddab1a20() {
    self flag::init("activated");
    self.var_1171b93e = [];
    foreach (var_9f02e39c in level.var_1171b93e) {
        if (var_9f02e39c.script_string === self.script_string) {
            self.var_1171b93e[self.var_1171b93e.size] = var_9f02e39c;
        }
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 3, eflags: 0x1 linked
// Checksum 0x99b21072, Offset: 0x1348
// Size: 0x110
function function_b736b1a2(var_6c367c57 = 2, var_e7c0257b = 2, var_d6e7acb1 = 2) {
    if (!self flag::get("activated")) {
        self flag::set("activated");
        foreach (var_9f02e39c in self.var_1171b93e) {
            var_9f02e39c thread fire_column_activate(var_6c367c57, var_e7c0257b, self);
        }
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0x6493ad, Offset: 0x1460
// Size: 0x152
function function_47b3d2e2() {
    if (self flag::get("activated")) {
        self flag::clear("activated");
        foreach (var_9f02e39c in self.var_1171b93e) {
            var_9f02e39c thread function_c36eee2();
        }
        self thread scene::play("shot 2");
        foreach (e_player in level.players) {
            e_player.var_ae0241fd = [];
            e_player.var_52f07157 = 0;
        }
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 3, eflags: 0x1 linked
// Checksum 0x96b49b28, Offset: 0x15c0
// Size: 0x108
function fire_column_activate(var_6c367c57 = 2, var_e7c0257b = 2, var_5330caa5) {
    self endon(#"deactivate");
    self thread function_97d7f14c();
    while (1) {
        var_5330caa5 thread scene::play("shot 1");
        wait(0.6);
        self.var_94de9684 = 1;
        self thread function_62725b64();
        wait(var_6c367c57);
        self notify(#"hash_1cfd2a665a996180");
        var_5330caa5 thread scene::play("shot 2");
        wait(0.3);
        self.var_94de9684 = 0;
        wait(var_e7c0257b);
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0xb6c6b739, Offset: 0x16d0
// Size: 0x2ae
function function_62725b64() {
    level endon(#"end_game", #"end_of_round", #"hash_7ace11fa7fe1a6ce");
    self endon(#"death", #"deactivate", #"hash_1cfd2a665a996180");
    if (!level flag::exists(#"hash_7ace11fa7fe1a6ce")) {
        level flag::init(#"hash_7ace11fa7fe1a6ce");
    }
    if (level flag::get(#"hash_7ace11fa7fe1a6ce")) {
        return;
    }
    while (1) {
        foreach (e_player in util::get_active_players()) {
            if (!isdefined(e_player)) {
                continue;
            }
            str_zone = e_player zm_zonemgr::get_player_zone();
            b_valid = zm_utility::is_player_valid(e_player, 0, 0);
            b_in_zone = isinarray(level.var_d4061661, str_zone) || isinarray(level.var_cb45e05, str_zone);
            var_5168e40f = e_player zm_utility::is_player_looking_at(self.origin);
            if (b_valid && b_in_zone && var_5168e40f) {
                b_said = e_player zm_audio::create_and_play_dialog(#"flame_hazard", #"react");
                if (isdefined(b_said) && b_said) {
                    level flag::set(#"hash_7ace11fa7fe1a6ce");
                    break;
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0x99f922, Offset: 0x1988
// Size: 0x22
function function_c36eee2() {
    self notify(#"deactivate");
    self.var_94de9684 = 0;
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0xf4f655ba, Offset: 0x19b8
// Size: 0x78
function function_97d7f14c() {
    self endon(#"deactivate");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"trigger");
        if (isdefined(s_notify.activator)) {
            self thread function_a29b80e8(s_notify.activator);
        }
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 1, eflags: 0x1 linked
// Checksum 0xe36070c1, Offset: 0x1a38
// Size: 0x322
function function_a29b80e8(e_victim) {
    self endon(#"deactivate");
    w_fire = getweapon(#"incendiary_fire");
    if (isalive(e_victim) && !(isdefined(e_victim.var_52f07157) && e_victim.var_52f07157) && isdefined(self.var_94de9684) && self.var_94de9684) {
        e_victim.var_52f07157 = 1;
        if (isplayer(e_victim)) {
            if (!e_victim laststand::player_is_in_laststand()) {
                if (!isdefined(e_victim.var_ae0241fd)) {
                    e_victim.var_ae0241fd = [];
                }
                if (!isinarray(e_victim.var_ae0241fd, self)) {
                    if (zm_utility::is_ee_enabled() && e_victim flag::get(#"hash_6757075afacfc1b4")) {
                        if (!isdefined(e_victim.var_ae0241fd)) {
                            e_victim.var_ae0241fd = [];
                        } else if (!isarray(e_victim.var_ae0241fd)) {
                            e_victim.var_ae0241fd = array(e_victim.var_ae0241fd);
                        }
                        e_victim.var_ae0241fd[e_victim.var_ae0241fd.size] = self;
                    }
                    params = getstatuseffect(#"hash_4b174f501c358c4c");
                    if (zm_utility::is_standard()) {
                        params.dotdamage = int(params.dotdamage / 2);
                    }
                    e_victim status_effect::status_effect_apply(params, w_fire, self, 0, undefined, undefined, self.origin);
                    e_victim notify(#"hazard_hit");
                }
            }
            function_6f5e73b5(e_victim);
        } else if (isactor(e_victim)) {
            e_victim thread function_ccfc8bde();
            switch (e_victim.archetype) {
            case #"zombie":
                break;
            case #"gladiator":
                break;
            }
        }
    }
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 1, eflags: 0x1 linked
// Checksum 0x960b30eb, Offset: 0x1d68
// Size: 0x36
function function_6f5e73b5(e_victim) {
    e_victim endon(#"death");
    wait(1);
    e_victim.var_52f07157 = 0;
}

// Namespace namespace_edfc2a97/namespace_47bbdf99
// Params 0, eflags: 0x1 linked
// Checksum 0xa482e93e, Offset: 0x1da8
// Size: 0x26c
function function_ccfc8bde() {
    level endon(#"end_game");
    self endon(#"death");
    if (!level flag::exists(#"hash_30c5aa0859123bf6")) {
        level flag::init(#"hash_30c5aa0859123bf6");
    }
    if (level flag::get(#"hash_30c5aa0859123bf6")) {
        return;
    }
    v_origin = self.origin;
    a_e_players = util::get_active_players();
    a_e_players = arraysortclosest(a_e_players, v_origin, undefined, 0, 512);
    foreach (e_player in a_e_players) {
        str_zone = e_player zm_zonemgr::get_player_zone();
        if (zm_utility::is_player_valid(e_player, 0, 0) && (isinarray(level.var_d4061661, str_zone) || isinarray(level.var_cb45e05, str_zone)) && e_player zm_utility::is_player_looking_at(v_origin)) {
            b_said = e_player zm_audio::create_and_play_dialog(#"flame_hazard", #"unharmed");
            if (isdefined(b_said) && b_said) {
                level flag::set(#"hash_30c5aa0859123bf6");
                break;
            }
        }
    }
}

