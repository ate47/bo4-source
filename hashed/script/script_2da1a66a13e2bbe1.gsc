// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_white_util.gsc;
#using scripts\zm\zm_white_portals.gsc;
#using scripts\zm\zm_white_insanity_mode.gsc;
#using script_48dd035d23bf8844;
#using scripts\zm\zm_white.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm\powerup\zm_powerup_hero_weapon_power.gsc;
#using scripts\zm_common\bgbs\zm_bgb_newtonian_negation.gsc;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_fddd83bd;

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x817a1df2, Offset: 0x3e8
// Size: 0x14
function init() {
    init_clientfields();
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xc11ce543, Offset: 0x408
// Size: 0x44
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"hash_7876f33937c8a764", 20000, 1, "int");
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x2142e624, Offset: 0x458
// Size: 0x174
function fall() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    n_end_time = gettime() + 300000;
    while (gettime() < n_end_time) {
        wait(randomfloatrange(2, 4));
        zombies = getaiarray();
        foreach (zombie in zombies) {
            if (math::cointoss(33)) {
                zombie zombie_utility::setup_zombie_knockdown(zombie.var_93a62fe);
            }
        }
    }
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x47cb1d1c, Offset: 0x5d8
// Size: 0x94
function grav() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    zm_bgb_newtonian_negation::function_8622e664(1);
    wait(60);
    zm_bgb_newtonian_negation::function_8622e664(0);
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x9eb7130f, Offset: 0x678
// Size: 0x754
function guns() {
    self endon(#"fake_death");
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    if (isdefined(level.pack_a_punch) && level flag::get("pap_power_ready")) {
        /#
            iprintlnbold("<unknown string>");
        #/
        level.pack_a_punch.trigger_stubs[0].pap_machine flag::wait_till("pap_waiting_for_user");
    }
    level flag::clear("pap_power_ready");
    level exploder::stop_exploder("fxexp_script_pap_lgt");
    /#
        iprintlnbold("<unknown string>");
    #/
    level.var_7629d4e2 = 1;
    a_e_players = getplayers();
    foreach (e_player in a_e_players) {
        e_player.var_679c4d4e = e_player zm_weapons::player_get_loadout();
        var_dac0c546 = e_player getweaponslist();
        e_player switchtoweaponimmediate(var_dac0c546[0], 1);
        e_player disableweaponcycling();
        e_player perks::perk_setperk("specialty_ammodrainsfromstockfirst");
        e_player thread function_9992bb68();
        e_player thread function_ad15a8b3();
    }
    wait(2);
    level thread function_e5e4c0f9();
    while (level.var_7629d4e2) {
        a_e_players = getplayers();
        foreach (e_player in a_e_players) {
            /#
                iprintlnbold("<unknown string>");
            #/
            if (isdefined(e_player.var_3be6d813) && e_player.var_3be6d813 || e_player laststand::player_is_in_laststand() || e_player.sessionstate == "spectator" || e_player.var_479965f7 === 1 || e_player.var_d6229296 === 1 || e_player zm_laststand::is_reviving_any() || self.reviving_a_player === 1) {
                continue;
            }
            var_4cd7f83c = e_player getweaponslistprimaries();
            for (i = 0; i < var_4cd7f83c.size; i++) {
                var_4cd7f83c[i] = zm_weapons::get_base_weapon(var_4cd7f83c[i]);
            }
            w_current = e_player getcurrentweapon();
            is_weapon_upgraded = e_player zm_weapons::is_weapon_upgraded(w_current);
            var_fe8af21d = e_player zm_pap_util::function_83c29ddb(w_current);
            e_player takeweapon(w_current);
            var_fb1db24c = zm_weapons::get_guns();
            do {
                w_random = array::random(var_fb1db24c);
            } while (w_random == level.weaponnone || isdefined(array::find(var_4cd7f83c, w_random)));
            if (is_weapon_upgraded) {
                w_random = zm_white_insanity_mode::get_upgrade(w_random);
            }
            if (var_fe8af21d > 0) {
                if (isdefined(level.aat_in_use) && level.aat_in_use && zm_weapons::weapon_supports_aat(w_random)) {
                    e_player thread aat::acquire(w_random);
                    e_player zm_pap_util::repack_weapon(w_random, var_fe8af21d);
                }
            }
            w_random = e_player zm_weapons::give_build_kit_weapon(w_random);
            e_player shoulddoinitialweaponraise(w_random, 0);
            e_player switchtoweaponimmediate(w_random);
        }
        wait(10);
    }
    waitframe(1);
    a_e_players = getplayers();
    foreach (e_player in a_e_players) {
        e_player thread function_a9e83aa6();
        e_player enableweaponcycling();
        e_player perks::perk_unsetperk("specialty_ammodrainsfromstockfirst");
    }
    if (zm_white::function_b6f53cd2()) {
        level flag::set("pap_power_ready");
        level exploder::exploder("fxexp_script_pap_lgt");
    }
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x6b4b26c0, Offset: 0xdd8
// Size: 0x40
function function_e5e4c0f9() {
    level.var_7629d4e2 = 1;
    wait(301);
    level.var_7629d4e2 = 0;
    level notify(#"hash_29abc4b1d80a664c");
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xd5e7d607, Offset: 0xe20
// Size: 0x66
function function_9992bb68() {
    self endon(#"death");
    level endon(#"end_game", #"hash_29abc4b1d80a664c");
    while (level.var_7629d4e2) {
        self disableweaponcycling();
        waitframe(1);
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x85fcc15c, Offset: 0xe90
// Size: 0xe2
function function_ad15a8b3() {
    self endon(#"death");
    level endon(#"end_game", #"hash_29abc4b1d80a664c");
    while (level.var_7629d4e2) {
        while (!isdefined(self.var_11b895b8)) {
            wait(0.1);
        }
        while (isdefined(self.var_11b895b8)) {
            wait(0.1);
        }
        self.var_3be6d813 = 1;
        wait(3);
        var_dac0c546 = self getweaponslist();
        self switchtoweaponimmediate(var_dac0c546[0], 1);
        wait(2);
        self.var_3be6d813 = 0;
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x1b2ca7db, Offset: 0xf80
// Size: 0x66
function function_a9e83aa6() {
    self endon(#"death");
    while (self.var_479965f7 === 1) {
        wait(1);
    }
    self zm_weapons::player_give_loadout(self.var_679c4d4e, 1, 1);
    self.var_679c4d4e = undefined;
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xc4576c21, Offset: 0xff0
// Size: 0x218
function time() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    a_e_players = getplayers();
    a_e_zombies = getaiteamarray(level.zombie_team);
    foreach (e_zombie in a_e_zombies) {
        e_zombie namespace_9ff9f642::freeze();
        e_zombie.var_e8920729 = 1;
        e_zombie clientfield::set("winters_wail_freeze", 1);
    }
    wait(30);
    /#
        iprintlnbold("<unknown string>");
    #/
    foreach (e_zombie in a_e_zombies) {
        if (!isdefined(e_zombie) || !isalive(e_zombie)) {
            continue;
        }
        e_zombie namespace_9ff9f642::unfreeze();
        e_zombie.var_e8920729 = 0;
        e_zombie clientfield::set("winters_wail_freeze", 0);
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x4a123102, Offset: 0x1210
// Size: 0x9a
function brew() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    level.var_1f3f3e7b = &function_28e2ddd5;
    level.var_1b64d570 = 0;
    level waittill(#"end_of_round");
    level.var_1f3f3e7b = undefined;
    level.var_1b64d570 = undefined;
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x9beb511c, Offset: 0x12b8
// Size: 0x9a
function cola() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    level.var_1f3f3e7b = &function_28e2ddd5;
    level.var_1b64d570 = 1;
    level waittill(#"end_of_round");
    level.var_1f3f3e7b = undefined;
    level.var_1b64d570 = undefined;
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x7e6561bf, Offset: 0x1360
// Size: 0x9a
function soda() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    level.var_1f3f3e7b = &function_28e2ddd5;
    level.var_1b64d570 = 2;
    level waittill(#"end_of_round");
    level.var_1f3f3e7b = undefined;
    level.var_1b64d570 = undefined;
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 2, eflags: 0x1 linked
// Checksum 0xccbd3fba, Offset: 0x1408
// Size: 0x92
function function_28e2ddd5(n_perk_cost, var_c6ce6ade) {
    /#
        assert(isdefined(level.var_1b64d570), "<unknown string>");
    #/
    if (var_c6ce6ade == level.var_1b64d570) {
        n_perk_cost = n_perk_cost * 0.5;
    }
    return int(max(n_perk_cost, 0));
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xaf38d5ac, Offset: 0x14a8
// Size: 0x1c8
function noob() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    level thread function_a3bdad03();
    while (isdefined(level.var_debefb5b) && level.var_debefb5b) {
        a_e_zombies = getaiarray();
        foreach (e_zombie in a_e_zombies) {
            if (!isdefined(e_zombie.zombie_move_speed_override)) {
                e_zombie zombie_utility::set_zombie_run_cycle_override_value("walk");
            }
        }
        wait(1);
    }
    /#
        iprintlnbold("<unknown string>");
    #/
    a_e_zombies = getaiarray();
    foreach (e_zombie in a_e_zombies) {
        e_zombie zombie_utility::set_zombie_run_cycle_restore_from_override();
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xed1ca552, Offset: 0x1678
// Size: 0x2e
function function_a3bdad03() {
    level.var_debefb5b = 1;
    wait(301);
    level.var_debefb5b = 0;
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x897c23c6, Offset: 0x16b0
// Size: 0xe0
function bank() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    wait(2);
    a_e_players = getplayers();
    foreach (e_player in a_e_players) {
        e_player zm_score::add_to_player_score(1000);
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xda0a39e0, Offset: 0x1798
// Size: 0x460
function door() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    a_e_zombie_doors = getentarray("zombie_door", "targetname");
    a_e_zombie_debris = getentarray("zombie_debris", "targetname");
    a_script_flags = [];
    foreach (var_6620353d in a_e_zombie_doors) {
        if (isdefined(var_6620353d.script_noteworthy) && var_6620353d.script_noteworthy == "electric_door") {
            continue;
        }
        if (!isdefined(a_script_flags)) {
            a_script_flags = [];
        } else if (!isarray(a_script_flags)) {
            a_script_flags = array(a_script_flags);
        }
        if (!isinarray(a_script_flags, var_6620353d.script_flag)) {
            a_script_flags[a_script_flags.size] = var_6620353d.script_flag;
        }
    }
    foreach (var_dc373a8d in a_e_zombie_debris) {
        if (!isdefined(a_script_flags)) {
            a_script_flags = [];
        } else if (!isarray(a_script_flags)) {
            a_script_flags = array(a_script_flags);
        }
        if (!isinarray(a_script_flags, var_dc373a8d.script_flag)) {
            a_script_flags[a_script_flags.size] = var_dc373a8d.script_flag;
        }
    }
    var_5768ad3b = [];
    foreach (script_flag in a_script_flags) {
        if (!level flag::get(script_flag)) {
            if (!isdefined(var_5768ad3b)) {
                var_5768ad3b = [];
            } else if (!isarray(var_5768ad3b)) {
                var_5768ad3b = array(var_5768ad3b);
            }
            if (!isinarray(var_5768ad3b, script_flag)) {
                var_5768ad3b[var_5768ad3b.size] = script_flag;
            }
        }
    }
    if (var_5768ad3b.size > 0) {
        var_67a0af61 = array::random(var_5768ad3b);
        var_5ae32412 = getentarray(var_67a0af61, "script_flag");
        foreach (var_93a940cc in var_5ae32412) {
            var_93a940cc.zombie_cost = 0;
            var_93a940cc zm_utility::set_hint_string(var_93a940cc, "default_buy_door", var_93a940cc.zombie_cost);
        }
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x16726a4b, Offset: 0x1c00
// Size: 0x128
function warp() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    wait(1);
    a_e_players = getplayers();
    foreach (e_player in a_e_players) {
        if (isalive(e_player) && !e_player laststand::player_is_in_laststand() && e_player.sessionstate != "spectator") {
            e_player thread warp_player();
        }
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x31e6099f, Offset: 0x1d30
// Size: 0x1fc
function warp_player() {
    self clientfield::increment_to_player("teleporter_depart", 1);
    playfx(level._effect[#"portal_origin"], self.origin, (1, 0, 0), (0, 0, 1));
    playsoundatposition(#"evt_teleporter_out", self.origin);
    s_destination = self zm_bgb_anywhere_but_here::function_91a62549();
    self zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, s_destination, undefined, "warp");
    self clientfield::increment_to_player("teleporter_transition", 1);
    self thread zm_white_portals::function_c234a5ce();
    self clientfield::increment_to_player("teleporter_arrive", 1);
    playfx(level._effect[#"portal_dest"], self.origin, (1, 0, 0), (0, 0, 1));
    playsoundatposition(#"evt_teleporter_go", self.origin);
    self playsoundtoplayer(#"hash_39876bf613387fef", self);
    wait(0.5);
    self.teleporting = 0;
    util::setclientsysstate("levelNotify", "cool_fx", self);
    util::setclientsysstate("levelNotify", "ae1", self);
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x31f9237f, Offset: 0x1f38
// Size: 0x270
function shed() {
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    if (flag::get(#"magic_door_power_up_grabbed")) {
        level flag::clear("magic_door_power_up_grabbed");
        level flag::clear("population_count_step_complete");
        level thread namespace_456de992::perks_behind_door();
        if (!level flag::get(#"wisp_path_completed")) {
            level thread zm_white_insanity_mode::function_4bcfb4d9();
        }
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    a_e_zombie_doors = getentarray("zombie_door", "targetname");
    foreach (var_6620353d in a_e_zombie_doors) {
        if (isdefined(var_6620353d.script_flag) && var_6620353d.script_flag == "yellow_backyard_to_ammo_door") {
            if (!(isdefined(var_6620353d.has_been_opened) && var_6620353d.has_been_opened)) {
                a_e_players = getplayers();
                var_6620353d notify(#"trigger", {#is_forced:1, #activator:a_e_players[0]});
                /#
                    iprintlnbold("<unknown string>");
                #/
                return;
            }
            /#
                iprintlnbold("<unknown string>");
            #/
        }
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x4176a981, Offset: 0x21b0
// Size: 0x94
function nuke() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    var_68b709a = struct::get("computer_system_powerup_drop");
    if (isdefined(var_68b709a)) {
        zm_powerups::specific_powerup_drop("nuke", var_68b709a.origin);
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x33343ba1, Offset: 0x2250
// Size: 0xb8
function hero() {
    /#
        iprintlnbold("<unknown string>");
    #/
    a_e_players = getplayers();
    foreach (e_player in a_e_players) {
        e_player zm_powerup_hero_weapon_power::hero_weapon_power(e_player);
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xd892b1d4, Offset: 0x2310
// Size: 0xac
function puke() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    callback::on_ai_damage(&function_80d5023d);
    wait(300);
    callback::remove_on_ai_damage(&function_80d5023d);
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 1, eflags: 0x1 linked
// Checksum 0x1ee5b8c9, Offset: 0x23c8
// Size: 0x24
function function_80d5023d(params) {
    self thread function_82457e35(params);
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 1, eflags: 0x1 linked
// Checksum 0x24175417, Offset: 0x23f8
// Size: 0x22c
function function_82457e35(params) {
    var_62e3519c = params.smeansofdeath === "MOD_MELEE" || params.smeansofdeath === "MOD_MELEE_WEAPON_BUTT" || params.smeansofdeath === "MOD_MELEE_ASSASSINATE";
    if (isalive(self) && self.archetype === #"zombie" && var_62e3519c) {
        v_origin = self gettagorigin("tag_eye");
        v_angles = self gettagangles("tag_eye");
        var_4095cc33 = anglestoup(v_angles);
        v_down = v_origin + var_4095cc33 * -4;
        mdl_fx = util::spawn_model("tag_origin", v_origin, v_angles);
        mdl_fx linkto(self, "tag_eye", v_down - v_origin, (60, 0, 90));
        mdl_fx clientfield::set("" + #"hash_7876f33937c8a764", 1);
        while (isdefined(self) && self ai::is_stunned()) {
            waitframe(1);
        }
        wait(randomfloatrange(1, 2));
        mdl_fx delete();
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x4f380e40, Offset: 0x2630
// Size: 0xcc
function club() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    exploder::exploder("fxexp_disco_lgt");
    playsoundatposition(#"hash_c8d3a1557c42ab7", (1, 1145, -350));
    wait(253);
    exploder::stop_exploder("fxexp_disco_lgt");
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x865e1995, Offset: 0x2708
// Size: 0xbc
function duck() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    callback::on_ai_damage(&function_369efa3e);
    wait(300);
    callback::remove_callback(#"on_ai_damage", &function_369efa3e);
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 1, eflags: 0x1 linked
// Checksum 0xe54ae5cc, Offset: 0x27d0
// Size: 0x114
function function_369efa3e(params) {
    var_62e3519c = params.smeansofdeath === "MOD_MELEE" || params.smeansofdeath === "MOD_MELEE_WEAPON_BUTT" || params.smeansofdeath === "MOD_MELEE_ASSASSINATE";
    if (isalive(self) && (self.archetype === #"zombie" || self.archetype === #"zombie_dog" || self.archetype === #"nova_crawler") && var_62e3519c) {
        if (zm_audio::sndisnetworksafe()) {
            self playsoundontag(#"zmb_vocals_zombie_death_quack", "j_head");
        }
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x4813c15c, Offset: 0x28f0
// Size: 0x7c
function song() {
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    wait(1);
    if (level.musicsystem.currentplaytype < 4) {
        level thread zm_audio::sndmusicsystem_stopandflush();
        waitframe(1);
        level thread zm_audio::sndmusicsystem_playstate("ee_song_main");
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x8d687ba1, Offset: 0x2978
// Size: 0x22c
function quiz() {
    level endon(#"hash_1a91b42d31e0b28d");
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_73fd31eafa77ad51", 0, 1);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_23131f0d452094c1", 0, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_23131f0d452094c1", 1, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_12cb80d7a172a4b", 0, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_12cb80d7a172a4b", 1, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_6b80107bf5762401", 0, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_6b80107bf5762401", 1, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_25e8d751b537b7b7", 0, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_25e8d751b537b7b7", 1, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_5890d651d18916db", 0, 0);
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_5890d651d18916db", 1, 0);
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xc25d481f, Offset: 0x2bb0
// Size: 0x34
function ugly() {
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_508205d179ebb89a", 0, 1);
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x68768225, Offset: 0x2bf0
// Size: 0x1d0
function joke() {
    if (!isdefined(level.var_9551e688)) {
        level.var_9551e688 = 0;
    }
    switch (level.var_9551e688) {
    case 0:
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_1382b96530ccddd7", 0, 1);
        break;
    case 1:
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_477362650641d121", 0, 1);
        break;
    case 2:
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_5c9c346d2be844fb", 0, 1);
        break;
    case 3:
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_1e85c53e64df168d", 0, 1);
        break;
    case 4:
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_6870bc3e45a45ebd", 0, 1);
        break;
    case 5:
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_72711a651e8449f3", 0, 1);
        break;
    }
    level.var_9551e688++;
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x3cf4e61e, Offset: 0x2dc8
// Size: 0x34
function yawn() {
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_29c0b280a4237f3c", 0, 1);
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xf414242b, Offset: 0x2e08
// Size: 0x34
function vent() {
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_411bf7894ec932a2", 0, 1);
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x77c0d811, Offset: 0x2e48
// Size: 0x34
function love() {
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_2f3d1518125f702f", 0, 1);
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x50def1bc, Offset: 0x2e88
// Size: 0x34
function life() {
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_344c94a20b946893", 0, 1);
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0xbd7ed719, Offset: 0x2ec8
// Size: 0x136
function boom() {
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    s_spawn_loc = struct::get("computer_system_powerup_drop");
    s_keypad = struct::get("keypad");
    e_player = level.var_f13364b4.var_12633dc5;
    if (isdefined(s_spawn_loc) && isdefined(s_keypad) && isdefined(e_player)) {
        v_spawn = s_keypad.origin + anglestoforward(s_keypad.angles) * 4;
        v_velocity = vectorscale((0, 0, 1), 200);
        var_b5b97738 = e_player magicgrenadeplayer(getweapon(#"eq_frag_grenade"), v_spawn, v_velocity);
    }
}

// Namespace namespace_fddd83bd/namespace_fddd83bd
// Params 0, eflags: 0x1 linked
// Checksum 0x22a5a789, Offset: 0x3008
// Size: 0x74
function pack() {
    level thread zm_white_util::function_ec34b5ee(#"hash_2c4fa652fb89d231");
    var_68b709a = struct::get("computer_system_powerup_drop");
    if (isdefined(var_68b709a)) {
        zm_powerups::specific_powerup_drop("bonfire_sale", var_68b709a.origin);
    }
}

