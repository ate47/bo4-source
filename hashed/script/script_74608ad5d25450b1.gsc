// Atian COD Tools GSC decompiler test
#using script_724752ab26bff81b;
#using script_174ce72cc0f850;
#using scripts\zm\zm_white_zones.gsc;
#using scripts\zm\zm_white_util.gsc;
#using scripts\zm\zm_white_main_quest.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_item_pickup.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_3b2b9e06;

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x1 linked
// Checksum 0x2c68e7f8, Offset: 0x388
// Size: 0xcc
function preload() {
    namespace_bd74bbd2::register(#"sc_mk2x", 20000, "sc_mk2x", &function_a66f0de2, &function_17f3e9e2);
    clientfield::register("scriptmover", "" + #"hash_56a1bc72bf8de8f1", 20000, 1, "int");
    clientfield::register("actor", "" + #"hash_38c69da8fb2b74e4", 20000, 1, "int");
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x1 linked
// Checksum 0xff341a9e, Offset: 0x460
// Size: 0xa4
function init() {
    level.var_ae5fb719 = spawnstruct();
    level.var_ae5fb719.n_step = 0;
    level.var_ae5fb719.var_10630268 = getweapon("ray_gun_mk2x");
    level.var_ae5fb719.var_d58b0729 = getweapon("ray_gun_mk2x_upgraded");
    callback::on_disconnect(&on_disconnect);
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 1, eflags: 0x5 linked
// Checksum 0xbeba0d8d, Offset: 0x510
// Size: 0x40
function private function_18a1849f(e_player) {
    if (!isdefined(level.var_ae5fb719.e_player)) {
        return false;
    }
    return e_player === level.var_ae5fb719.e_player;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 1, eflags: 0x5 linked
// Checksum 0xfbec118, Offset: 0x558
// Size: 0xf4
function private function_f6048ee(e_player) {
    if (isdefined(e_player)) {
        if (!isdefined(level.var_ae5fb719.e_player)) {
            if (isdefined(e_player.var_9c20e2c9)) {
                self sethintstring(#"hash_744b68f010abb05");
            } else {
                self sethintstring(#"hash_12346bdab086516e");
            }
        } else if (level.var_ae5fb719.e_player == e_player) {
            self sethintstring(#"hash_74fc96e8d58ff646");
        } else {
            self sethintstring(#"hash_2054e8fdb6521566");
        }
        return true;
    }
    return false;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 1, eflags: 0x5 linked
// Checksum 0xd3614c16, Offset: 0x658
// Size: 0x76
function private function_5b4f9f76(e_player) {
    var_2fff5cb5 = level.var_ae5fb719.e_player === e_player;
    var_24441d81 = !isdefined(level.var_ae5fb719.e_player) && !isdefined(e_player.var_9c20e2c9);
    return var_2fff5cb5 || var_24441d81;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 1, eflags: 0x4
// Checksum 0x367138c7, Offset: 0x6d8
// Size: 0x4c
function private function_5cedad9c(w_weapon) {
    return isdefined(w_weapon) && (w_weapon == level.var_ae5fb719.var_10630268 || w_weapon == level.var_ae5fb719.var_d58b0729);
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x1 linked
// Checksum 0xe9289243, Offset: 0x730
// Size: 0x14
function start_quest() {
    start_step_1();
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x6c04b17a, Offset: 0x750
// Size: 0x222
function private start_step_1() {
    level thread function_cbeb9a33();
    if (!isdefined(level.var_ae5fb719.s_start)) {
        level.var_ae5fb719.s_start = zm_hms_util::function_4e7f5b2e("mk2x_start");
    }
    level.var_ae5fb719.var_fead3ae9 = util::spawn_model("p8_zm_whi_fuse_pickup_empty", level.var_ae5fb719.s_start.origin, level.var_ae5fb719.s_start.angles);
    e_drawer = getent(level.var_ae5fb719.s_start.target, "targetname");
    if (!isdefined(e_drawer.b_open)) {
        e_drawer setcandamage(1);
        e_drawer val::set("quest_mk2x", "allowDeath", 0);
        e_drawer thread function_4e9f1680();
    } else {
        s_unitrigger = level.var_ae5fb719.var_fead3ae9 zm_item_pickup::create_item_pickup(&function_9d66ea6f, &function_f6048ee, &function_5b4f9f76, 80);
        zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    }
    exploder::exploder("fxexp_mk2_x_smoke_emit_" + level.var_ae5fb719.s_start.exploder_id);
    level.var_ae5fb719.n_step = 1;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0xc6b5782c, Offset: 0x980
// Size: 0xe4
function private function_4e9f1680() {
    self endon(#"death");
    pixbeginevent(#"hash_73eb0f44c0388afc");
    while (true) {
        s_notify = self waittill(#"damage");
        e_player = s_notify.attacker;
        if (s_notify zm_hms_util::function_69320b44("zm_aat_frostbite")) {
            self setcandamage(0);
            self thread function_c0fc92d2();
            break;
        }
    }
    pixendevent();
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x4e227149, Offset: 0xa70
// Size: 0x1c2
function private function_c0fc92d2() {
    self endon(#"death");
    exploder::stop_exploder("fxexp_mk2_x_smoke_emit_" + level.var_ae5fb719.s_start.exploder_id);
    v_dest = self.origin + 8 * self.open_dir;
    level.var_ae5fb719.var_fead3ae9 linkto(self);
    self playsound("zmb_ee_drawer_open");
    self moveto(v_dest, 0.1);
    self waittill(#"movedone");
    level.var_ae5fb719.var_fead3ae9 unlink();
    level.var_ae5fb719.s_start.origin = level.var_ae5fb719.var_fead3ae9.origin;
    s_unitrigger = level.var_ae5fb719.var_fead3ae9 zm_item_pickup::create_item_pickup(&function_9d66ea6f, &function_f6048ee, &function_5b4f9f76, 80);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    self.b_open = 1;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 2, eflags: 0x5 linked
// Checksum 0xce522b8c, Offset: 0xc40
// Size: 0x144
function private function_9d66ea6f(e_item, e_player) {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(e_player.name + "<unknown string>");
            println(e_player.name + "<unknown string>");
        }
    #/
    level.var_ae5fb719.e_player = e_player;
    namespace_a01a2431::function_605e5c25(e_player);
    e_player.var_9c20e2c9 = 1;
    e_player playsound("evt_canister_pickup");
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mod_phase", 1, e_player);
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mk2x_ammo", 1, e_player);
    e_player thread function_130ea633();
    start_step_2();
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x1 linked
// Checksum 0x68e4fc82, Offset: 0xd90
// Size: 0x7c
function function_130ea633() {
    if (zm_utility::is_classic()) {
        self zm_vo::vo_stop();
        self zm_hms_util::function_51b752a9("vox_ww_x_ammo_pickup");
        if (!zm_white_main_quest::function_6cebbce1()) {
            self zm_audio::do_player_or_npc_playvox("vox_ww_x_freeze_rush_0", 1);
        }
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x1ced3aa7, Offset: 0xe18
// Size: 0x82
function private start_step_2() {
    level.var_ae5fb719.var_ad2870bb = 3;
    level.var_ae5fb719.var_128cd2c8 = 3;
    callback::on_ai_spawned(&function_ecdebc72);
    callback::on_ai_killed(&function_c6c9eeef);
    level.var_ae5fb719.n_step = 2;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0xf688f2a4, Offset: 0xea8
// Size: 0x114
function private function_ecdebc72() {
    self endon(#"death");
    if (self.archetype === #"zombie" && math::cointoss(20)) {
        while (!isdefined(self.spawn_pos)) {
            waitframe(1);
        }
        if (zm_white_zones::is_bunker_zone(self.spawn_pos.zone_name) && function_e4f54b1d() < level.var_ae5fb719.var_ad2870bb) {
            self.var_13a2274b = 1;
            self.actor_damage_func = &function_cdddec81;
            self zombie_utility::set_zombie_run_cycle("walk");
            self clientfield::set("" + #"hash_38c69da8fb2b74e4", 1);
        }
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x973992b, Offset: 0xfc8
// Size: 0xb2
function private function_e4f54b1d() {
    n_count = 0;
    a_ai_zombies = getaiteamarray(level.zombie_team);
    foreach (ai_zombie in a_ai_zombies) {
        if (ai_zombie.var_13a2274b === 1) {
            n_count++;
        }
    }
    return n_count;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 12, eflags: 0x1 linked
// Checksum 0x27c8f494, Offset: 0x1088
// Size: 0x1b6
function function_cdddec81(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isplayer(attacker)) {
        if (attacker zm_hms_util::function_fab5fb4d(weapon, "zm_aat_frostbite")) {
            if (self.var_7ba65499 !== 1) {
                self set_frozen(1);
                self thread function_53817e75();
            }
            if (damage >= self.health) {
                return 0;
            }
        } else if (meansofdeath == "MOD_MELEE" && self.var_7ba65499 === 1) {
            if (level.var_ae5fb719.var_ad2870bb > 0) {
                level thread function_baec0416(self.origin, self.angles);
            }
            self zombie_utility::zombie_eye_glow_stop();
            self clientfield::set("" + #"hash_757f891a37d3db00", 1);
            return (self.health + 666);
        }
    }
    return damage;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 1, eflags: 0x5 linked
// Checksum 0xec0b0b60, Offset: 0x1248
// Size: 0x17e
function private set_frozen(b_frozen = 1) {
    if (b_frozen) {
        self clientfield::set("" + #"hash_5ad28d5f104a6e3b", 1);
        self clientfield::set("" + #"hash_1aa3522b88c2b76f", 1);
        self clientfield::set("" + #"hash_259cdeffe60fe48f", 1);
        self namespace_9ff9f642::freeze();
        self.var_7ba65499 = 1;
        return;
    }
    self clientfield::set("" + #"hash_5ad28d5f104a6e3b", 0);
    self clientfield::set("" + #"hash_1aa3522b88c2b76f", 0);
    self clientfield::set("" + #"hash_259cdeffe60fe48f", 0);
    self namespace_9ff9f642::unfreeze();
    self.var_7ba65499 = undefined;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 1, eflags: 0x1 linked
// Checksum 0xd72909a3, Offset: 0x13d0
// Size: 0x34
function function_c6c9eeef(s_params) {
    if (self.var_7ba65499 === 1) {
        self set_frozen(0);
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x36d38a0d, Offset: 0x1410
// Size: 0x34
function private function_53817e75() {
    self endon(#"death");
    wait(5);
    self set_frozen(0);
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 2, eflags: 0x5 linked
// Checksum 0xffd310c9, Offset: 0x1450
// Size: 0x1b4
function private function_baec0416(v_pos, v_angles) {
    if (isdefined(v_pos)) {
        v_drop = zm_hms_util::function_6d41bab8(v_pos, 360);
    }
    if (isdefined(v_drop)) {
        v_ground = groundtrace(v_drop + (0, 0, 32) + (0, 0, 8), v_drop + (0, 0, 32) + (0, 0, -100000), 0, self)[#"position"];
        v_normal = getnavmeshfacenormal(v_drop, 32);
        var_55ab02db = function_c1fa62a2(v_angles, v_normal);
        e_goo = util::spawn_model("p8_zm_whi_goop_puddle_01", v_ground, var_55ab02db);
        e_goo zm_item_pickup::create_item_pickup(&function_cf69599, "", &function_18a1849f, 96);
        e_goo.targetname = "mk2x_goo";
        level.var_ae5fb719.var_ad2870bb--;
        waitframe(1);
        if (isdefined(e_goo)) {
            zm_unitrigger::reregister_unitrigger_as_dynamic(e_goo.s_unitrigger);
        }
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 2, eflags: 0x5 linked
// Checksum 0x8e3ff59c, Offset: 0x1610
// Size: 0x1c4
function private function_cf69599(e_item, e_player) {
    level.var_ae5fb719.var_128cd2c8--;
    e_player playsound("evt_ee_goo_pickup");
    if (level.var_ae5fb719.var_128cd2c8 == 2) {
        if (zm_utility::is_classic()) {
            e_player thread zm_hms_util::function_51b752a9("vox_ww_x_goo_acquire");
        }
        return;
    }
    if (level.var_ae5fb719.var_128cd2c8 < 1) {
        /#
            if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
                iprintlnbold(e_player.name + "<unknown string>");
                println(e_player.name + "<unknown string>");
            }
        #/
        if (!zm_white_main_quest::function_6cebbce1() && !(isdefined(level.var_5dd0d3ff.isspeaking) && level.var_5dd0d3ff.isspeaking)) {
            if (zm_utility::is_classic()) {
                e_player thread zm_white_util::function_491673da(#"hash_aec062a8a2a5d26");
            }
        }
        function_6f437b06();
        start_step_3();
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x1dd51058, Offset: 0x17e0
// Size: 0x44
function private function_6f437b06() {
    callback::remove_on_ai_spawned(&function_ecdebc72);
    callback::remove_on_ai_killed(&function_c6c9eeef);
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x23375439, Offset: 0x1830
// Size: 0x5c
function private cleanup_step_2() {
    function_6f437b06();
    a_e_goo = getentarray("mk2x_goo", "targetname");
    array::run_all(a_e_goo, &zm_item_pickup::function_d6812b9d);
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0xa13e7406, Offset: 0x1898
// Size: 0x72
function private start_step_3() {
    s_sc = struct::get("mk2x_sc");
    s_sc zm_unitrigger::create("");
    s_sc thread function_473f437();
    level.var_ae5fb719.n_step = 3;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0xa5bcddd7, Offset: 0x1918
// Size: 0x144
function private function_473f437() {
    self endon(#"death", #"stop_think");
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        playsoundatposition("evt_rgun_frame_putback", (-223, -1658, -178));
        if (function_18a1849f(s_notify.e_who)) {
            level.var_ae5fb719.var_fead3ae9 = util::spawn_model("p8_zm_whi_fuse_pickup_fluid_purple_half", self.origin, self.angles);
            namespace_bd74bbd2::start(#"sc_mk2x");
            if (zm_utility::is_classic()) {
                level.var_ae5fb719.e_player thread zm_hms_util::function_51b752a9("vox_ww_x_charge");
            }
            zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
            break;
        }
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0xb3eccdb7, Offset: 0x1a68
// Size: 0xfc
function private function_a66f0de2() {
    namespace_bd74bbd2::end(#"sc_mk2x");
    s_unitrigger = level.var_ae5fb719.var_fead3ae9 zm_item_pickup::create_item_pickup(&function_b9a31cb, &function_f6048ee, &function_5b4f9f76);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    level.var_ae5fb719.var_fead3ae9 setmodel("p8_zm_whi_fuse_pickup_fluid_purple");
    level.var_ae5fb719.var_fead3ae9 clientfield::set("" + #"hash_56a1bc72bf8de8f1", 1);
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 2, eflags: 0x5 linked
// Checksum 0xa057c504, Offset: 0x1b70
// Size: 0x134
function private function_b9a31cb(e_item, e_player) {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(e_player.name + "<unknown string>");
            println(e_player.name + "<unknown string>");
        }
    #/
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mk2x_ammo", 2, e_player);
    e_player.var_f7694097 = 1;
    e_player playsound("evt_canister_pickup");
    if (!zm_white_main_quest::function_6cebbce1() && zm_utility::is_classic()) {
        e_player thread zm_white_util::function_491673da(#"hash_28707927bb714f9");
    }
    start_step_4();
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0xf0e3656c, Offset: 0x1cb0
// Size: 0x74
function private function_17f3e9e2() {
    s_unitrigger = level.var_ae5fb719.var_fead3ae9 zm_unitrigger::create(&function_7015dc35);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    level.var_ae5fb719.var_fead3ae9 thread function_2ac1278b();
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 1, eflags: 0x5 linked
// Checksum 0x50b2b750, Offset: 0x1d30
// Size: 0x84
function private function_7015dc35(e_player) {
    if (isdefined(e_player)) {
        if (level.var_ae5fb719.e_player === e_player) {
            self sethintstring(#"hash_14eae7c162ebb8d2");
        } else {
            self sethintstring(#"hash_2054e8fdb6521566");
        }
        return true;
    }
    return false;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0xd286c96d, Offset: 0x1dc0
// Size: 0xac
function private function_2ac1278b() {
    self endon(#"death");
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        e_player = s_notify.e_who;
        if (function_18a1849f(e_player)) {
            namespace_bd74bbd2::start(#"sc_mk2x");
            zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
            break;
        }
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x1 linked
// Checksum 0xac9028e8, Offset: 0x1e78
// Size: 0xb4
function cleanup_step_3() {
    if (isdefined(level.var_ae5fb719.var_fead3ae9)) {
        namespace_bd74bbd2::end(#"sc_mk2x");
        level.var_ae5fb719.var_fead3ae9 delete();
        return;
    }
    s_sc = struct::get("mk2x_sc");
    s_sc notify(#"stop_think");
    zm_unitrigger::unregister_unitrigger(s_sc.s_unitrigger);
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x37866fbb, Offset: 0x1f38
// Size: 0x3a
function private start_step_4() {
    level.var_ae5fb719.e_player thread function_cba90c3c();
    level.var_ae5fb719.n_step = 4;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0xc1abcd8a, Offset: 0x1f80
// Size: 0x4c
function private function_cba90c3c() {
    self endon(#"death");
    self waittill(#"hash_13f3f231b45420ef");
    self thread function_c6fc34a();
    complete_quest();
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x1 linked
// Checksum 0x4113651c, Offset: 0x1fd8
// Size: 0x7c
function function_c6fc34a() {
    if (zm_utility::is_classic()) {
        self zm_vo::vo_stop();
        self zm_hms_util::function_51b752a9("vox_ww_x_craft");
        if (!zm_white_main_quest::function_6cebbce1()) {
            self zm_audio::do_player_or_npc_playvox("vox_ww_x_craft_rush_1", 1);
        }
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x25a41605, Offset: 0x2060
// Size: 0xc2
function private complete_quest() {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(level.var_ae5fb719.e_player.name + "<unknown string>");
            println(level.var_ae5fb719.e_player.name + "<unknown string>");
        }
    #/
    level.var_ae5fb719.e_player = undefined;
    level.var_ae5fb719.n_step = 5;
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x5 linked
// Checksum 0x3d92402c, Offset: 0x2130
// Size: 0x34
function private on_disconnect() {
    if (function_18a1849f(self)) {
        restart_quest();
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 1, eflags: 0x5 linked
// Checksum 0x3e9dcd6, Offset: 0x2170
// Size: 0xd4
function private restart_quest(var_e19b7aed = 1) {
    switch (level.var_ae5fb719.n_step) {
    case 1:
        var_e19b7aed = 0;
        break;
    case 2:
        cleanup_step_2();
        break;
    case 3:
        cleanup_step_3();
        break;
    }
    level.var_ae5fb719.e_player = undefined;
    if (var_e19b7aed) {
        start_step_1();
    }
}

// Namespace namespace_3b2b9e06/namespace_3b2b9e06
// Params 0, eflags: 0x1 linked
// Checksum 0x96f3fff6, Offset: 0x2250
// Size: 0xf4
function function_cbeb9a33() {
    level waittill(#"insanity_mode_triggered");
    exploder::stop_exploder("fxexp_mk2_x_smoke_emit_" + level.var_ae5fb719.s_start.exploder_id);
    if (isdefined(level.var_ae5fb719.var_fead3ae9) && isdefined(level.var_ae5fb719.var_fead3ae9.s_unitrigger)) {
        zm_unitrigger::unregister_unitrigger(level.var_ae5fb719.var_fead3ae9.s_unitrigger);
        level.var_ae5fb719.var_fead3ae9 delete();
    }
    restart_quest(0);
}

