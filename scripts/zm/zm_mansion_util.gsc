// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_mansion_jordans.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\systems\gib.gsc;

#namespace mansion_util;

// Namespace mansion_util/zm_mansion_util
// Params 6, eflags: 0x1 linked
// Checksum 0x23d430e9, Offset: 0x370
// Size: 0x1ce
function create_unitrigger(s_loc, func_think, hint_string, b_lookat, n_cost, var_ddbd86e1) {
    s_loc.unitrigger_stub = spawnstruct();
    s_loc.unitrigger_stub.origin = s_loc.origin;
    s_loc.unitrigger_stub.angles = s_loc.angles;
    s_loc.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
    s_loc.unitrigger_stub.cursor_hint = "HINT_NOICON";
    s_loc.unitrigger_stub.require_look_at = 1;
    if (isdefined(b_lookat)) {
        s_loc.unitrigger_stub.require_look_at = b_lookat;
    }
    s_loc.unitrigger_stub.func_think = func_think;
    s_loc.unitrigger_stub.hint_string = hint_string;
    if (isdefined(n_cost) && n_cost > 0) {
        s_loc.unitrigger_stub.n_cost = n_cost;
    }
    s_loc.unitrigger_stub.prompt_and_visibility_func = &function_ab834b07;
    if (!isdefined(var_ddbd86e1)) {
        zm_unitrigger::unitrigger_force_per_player_triggers(s_loc.unitrigger_stub, 1);
    }
    zm_unitrigger::register_static_unitrigger(s_loc.unitrigger_stub, func_think);
    return s_loc.unitrigger_stub;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xb49cfd54, Offset: 0x548
// Size: 0x98
function function_ab834b07(player) {
    self.hint_string = self.stub.hint_string;
    if (isdefined(self.stub.n_cost)) {
        self sethintstring(self.stub.hint_string, self.stub.n_cost);
    } else {
        self sethintstring(self.stub.hint_string);
    }
    return true;
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x0
// Checksum 0x9a83af9e, Offset: 0x5e8
// Size: 0xc4
function zombie_death_gib() {
    gibserverutils::gibhead(self);
    if (math::cointoss()) {
        gibserverutils::gibleftarm(self);
    } else {
        gibserverutils::gibrightarm(self);
    }
    gibserverutils::giblegs(self);
    self dodamage(self.health, self.origin);
    wait(0.1);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 3, eflags: 0x1 linked
// Checksum 0x432a9c3, Offset: 0x6b8
// Size: 0x6a
function function_89e9bca5(var_df1a3385, v_origin, v_angles) {
    w_component = zm_crafting::get_component(var_df1a3385);
    crafting_component = zm_items::spawn_item(w_component, v_origin, v_angles);
    return crafting_component;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x0
// Checksum 0x49b57bf4, Offset: 0x730
// Size: 0xc0
function function_57423f(var_a4107301) {
    var_6fbf9624 = getentarray("use_elec_switch", "targetname");
    foreach (trig_elec_switch in var_6fbf9624) {
        if (trig_elec_switch.script_int === var_a4107301) {
            trig_elec_switch trigger::use();
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x454823b7, Offset: 0x7f8
// Size: 0x6e
function get_player_index(e_player) {
    a_players = getplayers(e_player.team);
    for (i = 0; i < a_players.size; i++) {
        if (e_player == a_players[i]) {
            return i;
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x7581f3f8, Offset: 0x870
// Size: 0x156
function function_5f42b3e2(s_anim) {
    if (self.characterindex == 9) {
        var_3c828299 = "p_zm_seer_stone_s_in_female";
        var_c2852abc = "p_zm_seer_stone_s_loop_female";
        var_39e963ce = "p_zm_seer_stone_s_out_female";
    } else {
        var_3c828299 = "p_zm_seer_stone_s_in_male";
        var_c2852abc = "p_zm_seer_stone_s_loop_male";
        var_39e963ce = "p_zm_seer_stone_s_out_male";
    }
    s_anim scene::play(var_3c828299, self);
    if (isplayer(self)) {
        self notify(#"hash_18259ed594f164dc");
        s_anim thread scene::play(var_c2852abc, self);
        self waittill(#"hash_770bb1239dc37ad0", #"disconnect");
    }
    if (isplayer(self)) {
        s_anim scene::play(var_39e963ce, self);
        self notify(#"hash_18259ed594f164dc");
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xd60416a, Offset: 0x9d0
// Size: 0x3e
function function_58dfa337(n_time) {
    self endon(#"disconnect");
    self.var_d049df11 = 1;
    wait(n_time);
    self.var_d049df11 = 0;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xa2b7ff9, Offset: 0xa18
// Size: 0xf0
function function_a113df82(n_time) {
    a_ai_zombies = getaiteamarray("axis");
    foreach (ai_zombie in a_ai_zombies) {
        if (distance2dsquared(self.origin, ai_zombie.origin) <= 160000) {
            ai_zombie.var_126d7bef = 1;
            ai_zombie.b_ignore_cleanup = 1;
            ai_zombie thread function_ca2d69a(n_time);
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xd31e5b9a, Offset: 0xb10
// Size: 0x36
function function_ca2d69a(n_time) {
    self endon(#"death");
    wait(n_time);
    self.var_126d7bef = undefined;
    self.b_ignore_cleanup = undefined;
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x0
// Checksum 0x9d16f096, Offset: 0xb50
// Size: 0x86
function function_656e5fd1() {
    self endon(#"disconnect", #"hide_equipment_hint_text");
    waitframe(1);
    if (!self gamepadusedlast()) {
        self util::waittill_use_button_held();
    } else {
        self util::waittill_stance_button_held();
    }
    self notify(#"hide_equipment_hint_text");
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x0
// Checksum 0xd2645533, Offset: 0xbe0
// Size: 0x10c
function function_ebad0e52(var_88f1eaa8) {
    self endon(#"disconnect");
    var_88f1eaa8 endon(#"death");
    v_org = var_88f1eaa8.origin;
    while (self.b_gazing) {
        var_88f1eaa8 movey(-600, 3);
        var_88f1eaa8 waittill(#"movedone");
        var_88f1eaa8 hide();
        var_88f1eaa8 moveto(v_org, 0.05);
        var_88f1eaa8 waittill(#"movedone");
        var_88f1eaa8 show();
    }
    var_88f1eaa8 delete();
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0x915eefa0, Offset: 0xcf8
// Size: 0x76
function is_valid() {
    if (self zm_utility::in_revive_trigger()) {
        return false;
    }
    if (self zm_utility::is_drinking()) {
        return false;
    }
    if (isdefined(self.var_564dec14) && self.var_564dec14) {
        return false;
    }
    if (!zm_utility::is_player_valid(self)) {
        return false;
    }
    return true;
}

// Namespace mansion_util/zm_mansion_util
// Params 2, eflags: 0x1 linked
// Checksum 0xee3bbe0e, Offset: 0xd78
// Size: 0xe4
function function_a8176b98(v_pos, n_radius) {
    if (!isdefined(v_pos)) {
        return;
    }
    v_drop_point = zm_utility::function_b0eeaada(v_pos, 1500);
    if (isdefined(v_drop_point) && zm_zonemgr::function_66bf6a43(v_drop_point[#"point"])) {
        return v_drop_point[#"point"];
    }
    if (!isdefined(v_drop_point) && isdefined(n_radius)) {
        var_de3c569e = getclosestpointonnavmesh(v_pos, n_radius, 16);
        if (zm_zonemgr::function_66bf6a43(var_de3c569e)) {
            return var_de3c569e;
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 2, eflags: 0x1 linked
// Checksum 0x9aa5af51, Offset: 0xe68
// Size: 0x37a
function waittill_player_nearby(e_player, var_5a365909 = 0) {
    self endon(#"death", #"destroyed");
    /#
        if (getdvarint(#"hash_716ad286541e0f2d", 0)) {
            return;
        }
    #/
    for (var_9d3d31a = 0; true; var_9d3d31a = 0) {
        if (isdefined(e_player)) {
            if (var_5a365909) {
                if (isdefined(e_player.b_is_designated_target) && e_player.b_is_designated_target && distance2dsquared(self.origin, e_player.origin) <= 150 * 150 && e_player util::is_player_looking_at(self.origin, 0.1, 0, self)) {
                    return;
                }
            } else if (distance2dsquared(self.origin, e_player.origin) <= 150 * 150 && e_player util::is_player_looking_at(self.origin, 0.1, 0, self)) {
                return;
            }
        } else {
            foreach (player in util::get_active_players()) {
                if (!isdefined(self.radius) || isdefined(self.radius) && self.radius < 150) {
                    self.radius = 150;
                }
                if (var_5a365909) {
                    if (isdefined(player.b_is_designated_target) && player.b_is_designated_target && distance2dsquared(self.origin, player.origin) <= self.n_radius * self.n_radius && player util::is_player_looking_at(self.origin, 0.1, 0, self)) {
                        return;
                    }
                    continue;
                }
                if (distance2dsquared(self.origin, player.origin) <= self.n_radius * self.n_radius && player util::is_player_looking_at(self.origin, 0.1, 0, self)) {
                    return;
                }
            }
        }
        wait(0.1);
        var_9d3d31a = var_9d3d31a + 0.1;
        if (var_9d3d31a > 5) {
            level notify(#"hash_5ed8f262549ea460");
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x4ccc9f95, Offset: 0x11f0
// Size: 0x198
function function_6a523c8c(v_wobble = (0, 0, 1)) {
    self endoncallback(&function_43ac0bb7, #"death", #"stop_wobble", #"finish_wobble");
    if (!isdefined(self.v_start_origin)) {
        self.v_start_origin = self.origin;
    }
    if (!isdefined(self.v_start_angles)) {
        self.v_start_angles = self.angles;
    }
    while (true) {
        n_pitch = randomint(4) + 2;
        self moveto(self.origin + v_wobble, 0.35);
        self rotatepitch(n_pitch, 0.35);
        self waittill(#"movedone");
        self moveto(self.origin - v_wobble, 0.1);
        self rotatepitch(n_pitch * -1, 0.35);
        self waittill(#"movedone");
        wait(0.2);
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xa91ef6ee, Offset: 0x1390
// Size: 0x8c
function function_43ac0bb7(str_notify) {
    if (isdefined(self) && str_notify === "stop_wobble") {
        if (isdefined(self.v_start_origin)) {
            self moveto(self.v_start_origin, 0.1);
        }
        if (isdefined(self.v_start_angles)) {
            self rotateto(self.v_start_angles, 0.1);
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x122fbb5b, Offset: 0x1428
// Size: 0xea
function function_da5cd631(v_spin = (0, 0, 180)) {
    self endon(#"death", #"stop_spin");
    self notify(#"finish_wobble");
    for (n_wait = 6; true; n_wait = max(n_wait - 0.25, 0.25)) {
        self rotateto(self.angles + v_spin, n_wait);
        self waittill(#"rotatedone");
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x8104aef0, Offset: 0x1520
// Size: 0x2ac
function function_9e147e0c(s_params) {
    if (self.archetype === #"werewolf" && isplayer(s_params.eattacker)) {
        s_params.eattacker thread function_6e9bca65(s_params.weapon);
        if (s_params.eattacker zm_utility::function_aa45670f(s_params.weapon, 0)) {
            self.var_e0f90289 = 1;
            if (!level flag::get("flag_player_grabbed_werewolf_material")) {
                var_9420259c = self.origin;
                var_9cb648a3 = self.angles;
                if (isdefined(var_9420259c)) {
                    v_drop = function_a8176b98(var_9420259c, 360);
                }
                if (isdefined(v_drop)) {
                    s_loc = spawnstruct();
                    s_loc.origin = groundtrace(v_drop + (0, 0, 32) + (0, 0, 8), v_drop + (0, 0, 32) + (0, 0, -100000), 0, self)[#"position"];
                    v_normal = getnavmeshfacenormal(v_drop, 32);
                    s_loc.angles = function_c1fa62a2(var_9cb648a3, v_normal);
                    wait(0.5);
                    s_loc thread function_e7d4e4f0();
                }
            }
        }
        return;
    }
    if (self.archetype === #"nosferatu" && isplayer(s_params.eattacker) && !(isdefined(level.var_f1028094[#"hash_2464612c580fec24"]) && level.var_f1028094[#"hash_2464612c580fec24"])) {
        s_params.eattacker thread function_9e4c5bfb();
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0x2361f1ba, Offset: 0x17d8
// Size: 0x19a
function function_9e4c5bfb() {
    if (!isdefined(self.var_aed1893c)) {
        self.var_aed1893c = [];
    }
    if ((!(isdefined(self.var_aed1893c[#"hash_2464612c580fec24"]) && self.var_aed1893c[#"hash_2464612c580fec24"]) || math::cointoss(20)) && !(isdefined(level.var_f1028094[#"hash_2464612c580fec24"]) && level.var_f1028094[#"hash_2464612c580fec24"]) && zm_utility::is_player_valid(self)) {
        self.var_aed1893c[#"hash_2464612c580fec24"] = 1;
        level.var_f1028094[#"hash_2464612c580fec24"] = 1;
        self zm_audio::create_and_play_dialog(#"nosferatu", #"kill", undefined, 1);
        wait(randomintrange(30, 3 * 30));
        level.var_f1028094[#"hash_2464612c580fec24"] = 0;
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xd466b615, Offset: 0x1980
// Size: 0x114
function function_6e9bca65(w_weapon) {
    if (self zm_utility::function_aa45670f(w_weapon, 0)) {
        if (!(isdefined(self.var_d8cb9364) && self.var_d8cb9364)) {
            self.var_d8cb9364 = self zm_audio::create_and_play_dialog(#"silver_bullets", #"kill", undefined, 1);
        } else if (math::cointoss(20)) {
            self zm_audio::create_and_play_dialog(#"silver_bullets", #"kill");
        }
        return;
    }
    if (math::cointoss(20)) {
        self zm_audio::create_and_play_dialog(#"werewolf", #"kill");
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0xb3caee1a, Offset: 0x1aa0
// Size: 0x33c
function function_e7d4e4f0() {
    if (!isdefined(level.var_98cb7c84)) {
        level.var_98cb7c84 = [];
    } else if (!isarray(level.var_98cb7c84)) {
        level.var_98cb7c84 = array(level.var_98cb7c84);
    }
    array::remove_undefined(level.var_98cb7c84, 0);
    if (level.var_98cb7c84.size >= 1) {
        return;
    }
    self endoncallback(&function_3cfa50, #"hash_50b4cc0a4e4185b7");
    self util::delay_notify(120, #"hash_50b4cc0a4e4185b7");
    self.mdl_pickup = util::spawn_model("c_t8_zmb_dlc1_werewolf_chaos_drop", self.origin, self.angles);
    if (!isdefined(level.var_98cb7c84)) {
        level.var_98cb7c84 = [];
    } else if (!isarray(level.var_98cb7c84)) {
        level.var_98cb7c84 = array(level.var_98cb7c84);
    }
    level.var_98cb7c84[level.var_98cb7c84.size] = self;
    util::wait_network_frame();
    self.mdl_pickup clientfield::set("" + #"hash_487e544e29aa8e45", 1);
    playsoundatposition(#"zmb_sq_souls_release", self.mdl_pickup.origin);
    self.origin = self.origin + (0, 0, 8);
    e_holder = self zm_unitrigger::function_fac87205(&function_f3d694d6, (64, 64, 100));
    if (!level flag::get("flag_player_grabbed_werewolf_material")) {
        e_holder thread zm_vo::function_a2bd5a0c(#"hash_161206ddd7dcc321", 1);
        level zm_ui_inventory::function_7df6bb60(#"ww_p1_2", 1);
        self.mdl_pickup delete();
        self struct::delete();
        level.var_98cb7c84 = undefined;
        level flag::set("flag_player_grabbed_werewolf_material");
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xd3839a3a, Offset: 0x1de8
// Size: 0x94
function function_3cfa50(s_notify) {
    if (isdefined(self.mdl_pickup)) {
        self.mdl_pickup delete();
    }
    if (isdefined(self.s_unitrigger)) {
        zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    }
    arrayremovevalue(level.var_98cb7c84, self);
    self struct::delete();
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xe08803a2, Offset: 0x1e88
// Size: 0xb0
function function_f3d694d6(player) {
    if (!level flag::get("flag_player_grabbed_werewolf_material")) {
        str_prompt = zm_utility::function_d6046228(#"hash_429528a8bde9599d", #"hash_5af9d3bd478d8243");
        self sethintstringforplayer(player, str_prompt);
    } else {
        self sethintstringforplayer(player, "");
    }
    return true;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x8afb7ed2, Offset: 0x1f40
// Size: 0x72
function function_4aea06b0(b_disable = 1) {
    if (b_disable) {
        level.var_5cfc800b = &function_d1e2d722;
        level.var_d97d59d7 = &return_false;
        return;
    }
    level.var_5cfc800b = undefined;
    level.var_d97d59d7 = undefined;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xe50712d, Offset: 0x1fc0
// Size: 0xe
function return_false(player) {
    return false;
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0xf2daeb49, Offset: 0x1fd8
// Size: 0x6
function function_d1e2d722() {
    return undefined;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xc3e19e02, Offset: 0x1fe8
// Size: 0x4e
function function_7d92a49c(b_disable = 1) {
    if (b_disable) {
        level.custom_spawnplayer = &function_b1fb2b71;
        return;
    }
    level.custom_spawnplayer = undefined;
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0xd8bc9518, Offset: 0x2040
// Size: 0xc4
function function_b1fb2b71() {
    if (isdefined(level.var_923e8cb4)) {
        foreach (s_loc in level.var_923e8cb4) {
            if (s_loc.script_int === self.playernum) {
                self.spectator_respawn = s_loc;
                break;
            }
        }
        if (isdefined(self.spectator_respawn)) {
            self zm_player::spectator_respawn();
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0x5a647dc1, Offset: 0x2110
// Size: 0x44
function function_45ac4bb8() {
    zm_powerups::function_74b8ec6b(#"nuke");
    zm_powerups::function_74b8ec6b(#"insta_kill");
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0xb6055b72, Offset: 0x2160
// Size: 0x44
function function_5904a8e1() {
    zm_powerups::function_41cedb05(#"nuke");
    zm_powerups::function_74b8ec6b(#"insta_kill");
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x2b1dfbe5, Offset: 0x21b0
// Size: 0xb6
function function_98ca58fc(e_trigger) {
    foreach (player in util::get_active_players()) {
        if (player istouching(e_trigger) && !player laststand::player_is_in_laststand()) {
            return true;
        }
    }
    return false;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xa867604b, Offset: 0x2270
// Size: 0x118
function function_91dfc9d4(e_trigger) {
    a_players = [];
    foreach (player in util::get_active_players()) {
        if (player istouching(e_trigger) && !player laststand::player_is_in_laststand()) {
            if (!isdefined(a_players)) {
                a_players = [];
            } else if (!isarray(a_players)) {
                a_players = array(a_players);
            }
            a_players[a_players.size] = player;
        }
    }
    return a_players;
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0x98c12fe0, Offset: 0x2390
// Size: 0xa0
function function_7b248ec9() {
    a_blockers = getentarray("script_blocker", "targetname");
    foreach (e_blocker in a_blockers) {
        e_blocker notsolid();
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 2, eflags: 0x1 linked
// Checksum 0x6d018786, Offset: 0x2438
// Size: 0x298
function function_f1c106b(str_blocker, b_solid) {
    a_blockers = getentarray(str_blocker, "script_blocker");
    if (b_solid) {
        switch (str_blocker) {
        case #"loc4":
            str_spawner = "greenhouse_lab_respawns";
            break;
        case #"loc3":
            str_spawner = "cemetery_respawns";
            break;
        case #"loc2":
            str_spawner = "forest_n_respawns";
            break;
        case #"loc1":
            function_5f310cf9();
            break;
        }
        if (isdefined(str_spawner)) {
            level.var_923e8cb4 = struct::get_array(str_spawner, "targetname");
        }
        level zm_bgb_anywhere_but_here::function_886fce8f(0);
        function_4aea06b0(1);
        function_7d92a49c(1);
        foreach (e_blocker in a_blockers) {
            e_blocker solid();
        }
        return;
    }
    level.var_923e8cb4 = undefined;
    level zm_bgb_anywhere_but_here::function_886fce8f(1);
    function_4aea06b0(0);
    function_7d92a49c(0);
    foreach (e_blocker in a_blockers) {
        e_blocker notsolid();
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0xc6cc90a7, Offset: 0x26d8
// Size: 0x23c
function function_5f310cf9() {
    level.var_923e8cb4 = undefined;
    for (i = 0; i <= 3; i++) {
        switch (i) {
        case 0:
            v_origin = (-5381, 84, -176);
            v_angles = (0, 360, 0);
            break;
        case 1:
            v_origin = (-5386, 7, -176);
            v_angles = (0, 360, 0);
            break;
        case 2:
            v_origin = (-5390, -104, -176);
            v_angles = (0, 360, 0);
            break;
        case 3:
            v_origin = (-5394, -198, -176);
            v_angles = (0, 360, 0);
            break;
        }
        if (isdefined(v_origin) && isdefined(v_angles)) {
            s_respawn = spawnstruct();
            s_respawn.origin = v_origin;
            s_respawn.angles = v_angles;
            s_respawn.targetname = "crypt_respawns";
            s_respawn.script_int = i;
            s_respawn.script_noteworthy = "player_" + i;
            if (!isdefined(level.var_923e8cb4)) {
                level.var_923e8cb4 = [];
            } else if (!isarray(level.var_923e8cb4)) {
                level.var_923e8cb4 = array(level.var_923e8cb4);
            }
            level.var_923e8cb4[level.var_923e8cb4.size] = s_respawn;
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xf76f0904, Offset: 0x2920
// Size: 0x3e
function is_shield(w_current) {
    if (isdefined(w_current) && isdefined(w_current.isriotshield) && w_current.isriotshield) {
        return true;
    }
    return false;
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x1 linked
// Checksum 0xc3a49c16, Offset: 0x2968
// Size: 0x124
function function_f15c4657() {
    self endon(#"death");
    if (!isdefined(level.sam_clue_dig_traversal)) {
        level.sam_clue_dig_traversal = 0;
    }
    level.sam_clue_dig_traversal++;
    str_alias = #"hash_63097ff550404256" + level.sam_clue_dig_traversal + "_pickup";
    if (self zm_characters::is_character(array(#"hash_5ebf024e1559c04a")) && level.sam_clue_dig_traversal == 3) {
        self zm_vo::function_a2bd5a0c(#"hash_4c470787fc7738eb");
        self playsoundtoplayer(#"hash_663346a99e3bdffc", self);
        return;
    }
    self zm_vo::function_a2bd5a0c(str_alias, 0, 1, 9999);
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x33fd0f7b, Offset: 0x2a98
// Size: 0xd6
function _print_player_out(n_range_sq = 9000000) {
    if (!isdefined(self.var_7988eee5) || !isalive(self.var_7988eee5)) {
        e_player = self get_closest_valid_player(n_range_sq);
    } else {
        e_player = self.var_7988eee5;
    }
    if (zm_utility::is_player_valid(e_player)) {
        return {#e_player:e_player, #n_index:e_player zm_characters::function_d35e4c92()};
    }
    return undefined;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0x357e8581, Offset: 0x2b78
// Size: 0x144
function get_closest_valid_player(n_range_sq = 9000000) {
    a_players = util::get_active_players();
    var_df053feb = arraysortclosest(a_players, self.origin);
    foreach (player in var_df053feb) {
        v_player = player getcentroid();
        n_dist = distance2dsquared(self.origin, v_player);
        if (zm_utility::is_player_valid(player) && n_dist < n_range_sq * 4.5) {
            return player;
        }
    }
    return undefined;
}

// Namespace mansion_util/zm_mansion_util
// Params 2, eflags: 0x0
// Checksum 0xbececc6, Offset: 0x2cc8
// Size: 0xc0
function create_hudelem(x, y) {
    /#
        var_aa917a22 = newdebughudelem();
        var_aa917a22.alignx = "<unknown string>";
        var_aa917a22.horzalign = "<unknown string>";
        var_aa917a22.aligny = "<unknown string>";
        var_aa917a22.vertalign = "<unknown string>";
        var_aa917a22.y = y;
        var_aa917a22.x = x;
        var_aa917a22.fontscale = 1.25;
        return var_aa917a22;
    #/
}

// Namespace mansion_util/zm_mansion_util
// Params 4, eflags: 0x1 linked
// Checksum 0xf11f4736, Offset: 0x2d90
// Size: 0x2f0
function function_bb613572(a_s_spawns, a_str_endons, n_spawn_delay = 1, n_round = 20) {
    level flag::clear(#"hash_29b12646045186fa");
    if (isdefined(a_str_endons)) {
        if (!isdefined(a_str_endons)) {
            a_str_endons = [];
        } else if (!isarray(a_str_endons)) {
            a_str_endons = array(a_str_endons);
        }
        foreach (str_endon in a_str_endons) {
            level endon(str_endon);
        }
    }
    level.var_3dd9f9be = 0;
    n_players = getplayers().size;
    if (n_players < 1) {
        n_players = 1;
    }
    n_spawn_delay = n_spawn_delay / n_players;
    var_e8711f44 = 14 + n_players * 2;
    a_sp_zombies = getspawnerarray("spawner_zm_zombie", "targetname");
    var_7c332548 = arraycopy(a_s_spawns);
    while (true) {
        while (getaiteamarray(level.zombie_team).size >= var_e8711f44 || level flag::get(#"hash_29b12646045186fa")) {
            wait(0.5);
        }
        s_spawn = array::random(var_7c332548);
        sp_zombie = array::random(a_sp_zombies);
        ai = zombie_utility::spawn_zombie(sp_zombie, undefined, s_spawn, n_round);
        if (isdefined(ai)) {
            level.var_3dd9f9be++;
            ai.var_12745932 = 1;
            arrayremovevalue(var_7c332548, s_spawn, 0);
            if (!var_7c332548.size) {
                var_7c332548 = a_s_spawns;
            }
            wait(n_spawn_delay);
        }
    }
}

// Namespace mansion_util/zm_mansion_util
// Params 4, eflags: 0x0
// Checksum 0xbc757a5e, Offset: 0x3088
// Size: 0xba
function any_player_looking_at(v_origin, n_dot, b_do_trace, e_ignore) {
    foreach (e_player in getplayers()) {
        if (e_player util::is_player_looking_at(v_origin, n_dot, b_do_trace, e_player)) {
            return true;
        }
    }
    return false;
}

// Namespace mansion_util/zm_mansion_util
// Params 1, eflags: 0x1 linked
// Checksum 0xa6bca4d0, Offset: 0x3150
// Size: 0x3c
function function_268efa09(b_active = 0) {
    self clientfield::set_player_uimodel("zmhud.ammoModifierActive", b_active);
}

// Namespace mansion_util/zm_mansion_util
// Params 0, eflags: 0x0
// Checksum 0xd734ad4c, Offset: 0x3198
// Size: 0x8e
function function_dce687ca() {
    /#
        while (isdefined(self) && getdvarint(#"hash_3c4df2fe4b1618d5", 0)) {
            draw_arrow(self.origin, anglestoforward(self.angles), (0, 1, 0), function_9e72a96(self.model));
            waitframe(1);
        }
    #/
}

// Namespace mansion_util/zm_mansion_util
// Params 4, eflags: 0x0
// Checksum 0xb94ea890, Offset: 0x3230
// Size: 0x33c
function draw_arrow(org, ang, opcolor, str) {
    /#
        forward = anglestoforward(ang);
        forwardfar = vectorscale(forward, 50);
        forwardclose = vectorscale(forward, 50 * 0.8);
        right = anglestoright(ang);
        left = anglestoright(ang) * -1;
        leftdraw = vectorscale(right, 50 * -0.2);
        rightdraw = vectorscale(right, 50 * 0.2);
        up = anglestoup(ang);
        right = vectorscale(right, 50);
        left = vectorscale(left, 50);
        up = vectorscale(up, 50);
        red = (0.9, 0.2, 0.2);
        green = (0.2, 0.9, 0.2);
        blue = (0.2, 0.2, 0.9);
        if (isdefined(opcolor)) {
            red = opcolor;
            green = opcolor;
            blue = opcolor;
        }
        line(org, org + forwardfar, red, 0.9);
        line(org + forwardfar, org + forwardclose + rightdraw, red, 0.9);
        line(org + forwardfar, org + forwardclose + leftdraw, red, 0.9);
        line(org, org + right, blue, 0.9);
        line(org, org + left, blue, 0.9);
        line(org, org + up, green, 0.9);
        if (isdefined(str)) {
            print3d(self.origin, str, (0, 1, 0), 1, 0.5);
        }
    #/
}

// Namespace mansion_util/zm_mansion_util
// Params 9, eflags: 0x1 linked
// Checksum 0x1ece246f, Offset: 0x3578
// Size: 0x344
function function_2057ddc1(v_loc, str_cat, var_bff0cf99, var_440d7980, var_d8ad5f6e, var_1ef7b21 = 10, b_wait_if_busy = 1, var_39238c39 = 0, var_eb20a7c = 0) {
    level endon(#"end_game", #"intermission");
    if (!isdefined(level.var_f1028094)) {
        level.var_f1028094 = [];
    }
    if (!(isdefined(level.var_f1028094[var_d8ad5f6e]) && level.var_f1028094[var_d8ad5f6e])) {
        a_e_players = util::get_active_players();
        if (isdefined(v_loc)) {
            a_e_players = arraysortclosest(a_e_players, v_loc);
        } else {
            a_e_players = array::randomize(a_e_players);
        }
        foreach (e_player in a_e_players) {
            if (!isdefined(e_player.var_aed1893c)) {
                e_player.var_aed1893c = [];
            }
            if (!(isdefined(e_player.var_aed1893c[var_d8ad5f6e]) && e_player.var_aed1893c[var_d8ad5f6e])) {
                level.var_f1028094[var_d8ad5f6e] = 1;
                e_player.var_aed1893c[var_d8ad5f6e] = !var_39238c39;
                n_character_index = e_player zm_characters::function_d35e4c92();
                if (isdefined(var_440d7980)) {
                    vox_idgun_upgrade_ready_orb_ = array::random(var_440d7980);
                } else {
                    vox_idgun_upgrade_ready_orb_ = 0;
                }
                str_vo = "vox_" + str_cat + "_" + var_bff0cf99 + "_plr_" + n_character_index + "_" + vox_idgun_upgrade_ready_orb_;
                if (isdefined(var_eb20a7c) && var_eb20a7c) {
                    e_player stopsounds();
                    wait(0.1);
                }
                if (isalive(e_player)) {
                    e_player zm_vo::vo_say(str_vo, 0, b_wait_if_busy, 9999);
                }
                wait(var_1ef7b21);
                level.var_f1028094[var_d8ad5f6e] = 0;
                return;
            }
        }
    }
}

