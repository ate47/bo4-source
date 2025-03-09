#using script_24c32478acf44108;
#using scripts\abilities\ability_util;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_ee_misc;
#using scripts\zm\zm_orange_util;
#using scripts\zm\zm_orange_water;
#using scripts\zm\zm_orange_zones;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_fasttravel;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_orange_fasttravel_flinger;

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xffe96987, Offset: 0x618
// Size: 0x24
function init() {
    init_clientfields();
    init_flags();
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xb0f33b7e, Offset: 0x648
// Size: 0x94
function init_clientfields() {
    clientfield::register("scriptmover", "gear_box_spark", 24000, 1, "int");
    clientfield::register("scriptmover", "flinger_impact_wood", 24000, 1, "int");
    clientfield::register("clientuimodel", "ZMInventoryPersonal.heat_pack", 1, 1, "int");
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x829822c5, Offset: 0x6e8
// Size: 0xe4
function init_flags() {
    level flag::init(#"hash_5102447bf4bd73fa");
    level flag::init(#"hash_21de703d81d1bcc3");
    level flag::init(#"hash_2923f30473421396");
    level flag::init(#"hash_b0eb2954517bcc0");
    level flag::init(#"hash_4b098ade9fc33501");
    level flag::init(#"hash_352e983079eccab6");
    level flag::init(#"hash_3b7cff73fa5e7121");
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x4530404f, Offset: 0x7d8
// Size: 0x7c
function main() {
    level function_e91e867d();
    if (!zm_utility::is_standard()) {
        level function_8d20a4c4();
    }
    level flag::wait_till("all_players_spawned");
    level thread function_b1ec88bc();
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xad2df086, Offset: 0x860
// Size: 0x516
function function_e91e867d() {
    level.a_v_flingers = getentarray("v_fasttravel_flinger", "targetname");
    level.var_ad63608b = 0;
    foreach (v_flinger in level.a_v_flingers) {
        v_flinger.var_4f952763 = struct::get_array(v_flinger.var_16c4809e + v_flinger.str_location, "targetname");
        v_flinger.var_9b23f7b9 = struct::get(v_flinger.var_405b850e + v_flinger.str_location, "targetname");
        if (isdefined(v_flinger.var_f14e88a)) {
            v_flinger.var_48abac67 = struct::get(v_flinger.var_f14e88a + v_flinger.str_location, "targetname");
        }
        if (isdefined(v_flinger.var_31baf28b)) {
            v_flinger.var_bd5b9576 = struct::get(v_flinger.var_31baf28b + v_flinger.str_location, "targetname");
        }
        if (isdefined(v_flinger.var_5822e915)) {
            v_flinger.var_28a430ac = struct::get(v_flinger.var_5822e915 + v_flinger.str_location, "targetname");
            if (!(v_flinger.str_location === "island" && zm_utility::is_standard())) {
                v_flinger.var_28a430ac flinger_init();
            }
        }
        if (isdefined(v_flinger.var_8676f581)) {
            v_flinger.var_12d831a6 = getentarray(v_flinger.var_8676f581 + v_flinger.str_location, "targetname");
        }
        if (isdefined(v_flinger.var_2acbff02)) {
            v_flinger.var_311f378d = struct::get(v_flinger.var_2acbff02 + v_flinger.str_location, "targetname");
        }
        if (v_flinger.str_location === "ship") {
            self.var_ee9659b7 = [];
            if (!isdefined(self.var_ee9659b7)) {
                self.var_ee9659b7 = [];
            } else if (!isarray(self.var_ee9659b7)) {
                self.var_ee9659b7 = array(self.var_ee9659b7);
            }
            self.var_ee9659b7[self.var_ee9659b7.size] = getnode("ship_aft_level_2_to_3_traversal_a", "targetname");
            if (!isdefined(self.var_ee9659b7)) {
                self.var_ee9659b7 = [];
            } else if (!isarray(self.var_ee9659b7)) {
                self.var_ee9659b7 = array(self.var_ee9659b7);
            }
            self.var_ee9659b7[self.var_ee9659b7.size] = getnode("ship_aft_level_2_to_3_traversal_b", "targetname");
        } else if (v_flinger.str_location === "island_return") {
            level.var_f7c50c66 = v_flinger;
        }
        if (isdefined(v_flinger.var_12d831a6)) {
            foreach (var_2c9017c8 in v_flinger.var_12d831a6) {
                var_2c9017c8 notsolid();
            }
        }
        if (v_flinger.str_location === "facility") {
            v_flinger.var_ad63608b = 0;
            v_flinger.var_320be97e = 0;
        }
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xe9541b2a, Offset: 0xd80
// Size: 0x34
function function_8d20a4c4() {
    zm_crafting::function_d1f16587(#"ztable_orange_open", &function_a913e7bc);
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0x6efcfbc, Offset: 0xdc0
// Size: 0x1b4
function function_a913e7bc(e_player) {
    if (isdefined(self.stub) && isdefined(self.stub.blueprint)) {
        t_crafting = self.stub;
    } else if (isdefined(self.blueprint)) {
        t_crafting = self;
    }
    if (t_crafting.blueprint.name == #"zblueprint_orange_heat_pack") {
        var_7c0185ab = t_crafting.var_4f749ffe;
        var_7c0185ab show();
        var_7c0185ab zm_unitrigger::create(&function_96dcf25a, 64);
        var_7c0185ab thread function_5d984ff3();
        zm_ui_inventory::function_7df6bb60("heat_pack_part_bottle", 0);
        zm_ui_inventory::function_7df6bb60("heat_pack_part_tube", 0);
        zm_ui_inventory::function_7df6bb60("heat_pack_part_canister", 0);
        level zm_ui_inventory::function_7df6bb60("heat_pack_phase", 1);
        level flag::set(#"hash_3b7cff73fa5e7121");
        if (level.var_98138d6b > 1) {
            level.var_1c53964e zm_hms_util::function_6a0d675d("vox_heat_pack_craft", -1, 1, 0);
        }
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xf856a5ad, Offset: 0xf80
// Size: 0xf8
function function_5d984ff3() {
    while (true) {
        s_activation = self waittill(#"trigger_activated");
        e_who = s_activation.e_who;
        self playsound(#"hash_4941036cc35e4751");
        if (!isdefined(e_who.var_2e6aa97d)) {
            e_who.var_2e6aa97d = 1;
            level zm_ui_inventory::function_7df6bb60("heat_pack_complete", 1, e_who);
            e_who zm_orange_util::function_51b752a9("vox_heat_pack_pickup", -1, 1, 0);
            e_who clientfield::set_player_uimodel("ZMInventoryPersonal.heat_pack", 1);
        }
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0x4c76fd8d, Offset: 0x1080
// Size: 0x4a
function function_96dcf25a(e_player) {
    if (!isdefined(e_player.var_2e6aa97d)) {
        self sethintstring("ZM_ORANGE/GRAB_HEAT_PACK_FREE");
        return 1;
    }
    return 0;
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x6aec315f, Offset: 0x10d8
// Size: 0x178
function function_b1ec88bc() {
    foreach (v_flinger in level.a_v_flingers) {
        if (v_flinger.str_location === "island" && !zm_utility::is_standard()) {
            v_flinger.var_28a430ac function_c0df509(0);
            v_flinger thread function_26384c47();
            continue;
        }
        if (v_flinger.str_location === "ship") {
            v_flinger thread function_a6b42ff1();
            continue;
        }
        if (v_flinger.str_location === "facility") {
            v_flinger thread function_a3780502();
            if (isdefined(v_flinger.var_311f378d)) {
                v_flinger.var_311f378d zm_unitrigger::create(&function_43a1c155, (153, 293, 102));
            }
        }
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x1b1a31ce, Offset: 0x1258
// Size: 0xa4
function function_26384c47() {
    level endon(#"end_game");
    if (zm_utility::is_classic() || zm_utility::is_trials()) {
        level flag::wait_till_all(array(#"hash_3028604821838259", #"hash_5a3d0402a5557739"));
        self thread function_d8d2ddc6();
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x900d6ac, Offset: 0x1308
// Size: 0xac
function function_a6b42ff1() {
    self endon(#"hash_5a853b3e231b86db");
    while (true) {
        if (level flag::get("power_on2") && zm_zonemgr::zone_is_enabled("lighthouse_station") && level flag::get("ship_flinger_fixed")) {
            self thread function_67769412();
            self notify(#"hash_5a853b3e231b86db");
        }
        wait 0.1;
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x6493dde6, Offset: 0x13c0
// Size: 0x124
function function_a3780502() {
    self endon(#"hash_5a853b3e231b86db");
    while (true) {
        if (level flag::get("power_on3") && zm_zonemgr::zone_is_enabled("lighthouse_cove") && zm_zonemgr::zone_is_enabled("frozen_crevasse") && zm_zonemgr::zone_is_enabled("lagoon") && level flag::get("facility_flinger_fixed")) {
            if (isdefined(self.var_311f378d)) {
                self.var_311f378d zm_unitrigger::unregister_unitrigger(self.var_311f378d.s_unitrigger);
            }
            self thread function_67769412();
            self notify(#"hash_5a853b3e231b86db");
        }
        wait 0.1;
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0xf9cf47c2, Offset: 0x14f0
// Size: 0x74
function function_43a1c155(e_player) {
    if (level flag::get("power_on3") && level flag::get("facility_flinger_fixed")) {
        self sethintstring("ZM_ORANGE/FLINGER_DESINATION_NOT_UNLOCKED");
        return true;
    }
    return false;
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x47f4118d, Offset: 0x1570
// Size: 0x10c
function function_67769412() {
    self endon(#"hash_28cfded4ab80f30d");
    level endon(#"end_game");
    while (true) {
        foreach (e_player in getplayers()) {
            if (e_player istouching(self) && !level flag::get("fasttravel_disabled")) {
                self thread function_b5fc069b();
                self notify(#"hash_28cfded4ab80f30d");
            }
        }
        waitframe(1);
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xd579910f, Offset: 0x1688
// Size: 0x23a
function function_b5fc069b() {
    self endon(#"hash_1a5c6352ea49c8ff", #"launcher_activated");
    level endon(#"end_game");
    self.var_cd75ce36 = 3;
    self thread function_ac9a3646();
    while (true) {
        wait 0.1;
        if (self function_385a554d()) {
            self.var_cd75ce36 -= 0.1;
            if (self.var_cd75ce36 <= 0) {
                if (self.str_location == "facility") {
                    a_v_flingers = array::randomize(level.a_v_flingers);
                    foreach (v_flinger in a_v_flingers) {
                        if (v_flinger.str_location == "facility") {
                            v_flinger function_c378c744();
                            v_flinger thread function_b040671c();
                            if (self == v_flinger) {
                                self function_9b196e4f();
                            }
                            v_flinger notify(#"launcher_activated");
                            waitframe(1);
                        }
                    }
                } else {
                    self function_ceb5bc97();
                    self thread function_b040671c();
                    self notify(#"launcher_activated");
                }
            }
            continue;
        }
        self thread function_67769412();
        self notify(#"hash_1a5c6352ea49c8ff");
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x60ad5e39, Offset: 0x18d0
// Size: 0x92
function function_385a554d() {
    foreach (e_player in getplayers()) {
        if (e_player istouching(self)) {
            return true;
        }
    }
    return false;
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xf6d34913, Offset: 0x1970
// Size: 0xde
function function_d8d2ddc6() {
    self endon(#"hash_b3fa76082f1b362");
    while (true) {
        s_touching = self function_1036f994();
        if (level flag::get(#"hash_3028604821838259")) {
            self.var_28a430ac function_c0df509(s_touching.n_touching);
            if (s_touching.var_50d20c23) {
                self thread function_4578fdfd();
                self notify(#"hash_b3fa76082f1b362");
            }
        } else {
            self.var_28a430ac function_c0df509(0);
        }
        waitframe(1);
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x9b36aced, Offset: 0x1a58
// Size: 0x13e
function function_1036f994() {
    s_return = spawnstruct();
    s_return.n_touching = 0;
    n_alive = 0;
    a_e_players = getplayers();
    foreach (e_player in getplayers()) {
        if (!e_player util::is_spectating()) {
            n_alive++;
        }
        if (e_player istouching(self)) {
            s_return.n_touching++;
        }
    }
    if (n_alive == s_return.n_touching) {
        s_return.var_50d20c23 = 1;
    } else {
        s_return.var_50d20c23 = 0;
    }
    return s_return;
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xca51404, Offset: 0x1ba0
// Size: 0x1f2
function function_4578fdfd() {
    self endon(#"hash_1a5c6352ea49c8ff", #"launcher_activated");
    self.var_cd75ce36 = 3;
    self thread function_ac9a3646();
    while (true) {
        wait 0.1;
        s_touching = self function_1036f994();
        if (level flag::get(#"hash_3028604821838259") && s_touching.var_50d20c23) {
            self.var_cd75ce36 -= 0.1;
            if (self.var_cd75ce36 <= 0) {
                if (level flag::get(#"hash_f14d343f59fc897")) {
                    zm_orange_zones::function_3b77181c(1);
                } else {
                    level flag::set(#"hash_f14d343f59fc897");
                }
                level flag::set(#"hash_2923f30473421396");
                self function_ceb5bc97();
                self thread function_5fb97eb1();
                self notify(#"launcher_activated");
            }
            continue;
        }
        self.var_28a430ac function_c0df509(s_touching.n_touching);
        self thread function_d8d2ddc6();
        self notify(#"hash_1a5c6352ea49c8ff");
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x2ce93408, Offset: 0x1da0
// Size: 0xd0
function function_ceb5bc97() {
    level endon(#"end_game");
    self thread function_2b2e8766();
    self thread function_20bb4f5a();
    self function_9b196e4f();
    if (isdefined(self.var_e7992ae2) && self.var_e7992ae2 > 0 && self.var_745ac235.size > 0) {
        level notify(#"hash_1ba786f1661e3817", {#var_2ef2374:self.var_e7992ae2, #str_location:self.str_location});
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xe3087719, Offset: 0x1e78
// Size: 0xb8
function function_c378c744() {
    level endon(#"end_game");
    self thread function_2b2e8766();
    self thread function_20bb4f5a();
    if (isdefined(self.var_e7992ae2) && self.var_e7992ae2 > 0 && self.var_745ac235.size > 0) {
        level notify(#"hash_1ba786f1661e3817", {#var_2ef2374:self.var_e7992ae2, #str_location:self.str_location});
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x786b408b, Offset: 0x1f38
// Size: 0x1c6
function function_2b2e8766() {
    level endon(#"end_game");
    var_745ac235 = [];
    foreach (e_player in getplayers()) {
        if (isalive(e_player) && e_player istouching(self)) {
            e_player thread fling_player(self);
            if (!isdefined(var_745ac235)) {
                var_745ac235 = [];
            } else if (!isarray(var_745ac235)) {
                var_745ac235 = array(var_745ac235);
            }
            var_745ac235[var_745ac235.size] = e_player;
        }
    }
    if (self.str_location === "facility" && var_745ac235.size > 0 && self.var_320be97e === 0 && !(var_745ac235.size == 1 && isdefined(level.var_4ac8ef63.b_claimed) && level.var_4ac8ef63.b_claimed)) {
        self.var_ad63608b++;
    }
    self.var_745ac235 = var_745ac235;
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0x3342221e, Offset: 0x2108
// Size: 0x534
function fling_player(v_flinger) {
    self notify("3b76e3952b019122");
    self endon("3b76e3952b019122");
    self endoncallback(&function_22f94688, #"bled_out", #"disconnect");
    self.var_c1d4f4d9 = spawn("script_origin", self.origin);
    self function_6cbea0ea();
    if (v_flinger.str_location === "ship") {
        var_9d84111 = randomintrange(700, 800);
    } else if (v_flinger.str_location === "facility") {
        var_9d84111 = randomintrange(1100, 1150);
    } else if (v_flinger.str_location === "island") {
        var_9d84111 = randomintrange(800, 900);
    } else if (v_flinger.str_location === "island_return") {
        var_9d84111 = randomintrange(700, 800);
    } else if (v_flinger.str_location === "hell_start") {
        var_9d84111 = randomintrange(700, 800);
    }
    n_index = zm_fasttravel::get_player_index(self);
    if (isdefined(self.var_e5340f3e) && self.var_e5340f3e) {
        var_466d154d = struct::get("landing_point_edge", "targetname");
        var_9d84111 = randomintrange(3400, 3450);
        var_cef149e8 = self.var_c1d4f4d9 zm_utility::fake_physicslaunch(var_466d154d.origin, var_9d84111);
        self thread zm_orange_ee_misc::function_1b0e51b5();
        self.var_e5340f3e = 0;
        self.var_cdce7ec = 1;
        self val::set(#"edge_of_the_world", "ignoreme");
        level flag::set(#"edge_launched");
    } else {
        var_cef149e8 = self.var_c1d4f4d9 zm_utility::fake_physicslaunch(v_flinger.var_4f952763[n_index].origin, var_9d84111);
    }
    self.var_3456a2d2 = spawn("script_origin", self.origin);
    self.var_3456a2d2 linkto(self);
    self.var_3456a2d2 playloopsound(#"hash_7870648fa8bc7f");
    self clientfield::set_to_player("blur_post_fx", 1);
    if (v_flinger.str_location === "island_return") {
        self thread zm_orange_util::function_51b752a9("vox_flinger_react");
    } else {
        self thread zm_audio::create_and_play_dialog(#"flinger", #"react");
    }
    wait var_cef149e8;
    if (isdefined(self.var_3456a2d2)) {
        self.var_3456a2d2 delete();
    }
    self playrumbleonentity("jump_rumble_end");
    self clientfield::set_to_player("blur_post_fx", 0);
    self function_4a54c378();
    self playsound("fly_land_imp_fast_plr_snow");
    if (isdefined(self.var_c1d4f4d9)) {
        self.var_c1d4f4d9 delete();
    }
    if (isdefined(v_flinger.var_ad63608b) && v_flinger.var_320be97e === 0 && !(isdefined(self.var_e5340f3e) && self.var_e5340f3e)) {
        level thread function_57806638(v_flinger);
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0x1c903d70, Offset: 0x2648
// Size: 0x164
function function_22f94688(notifyhash) {
    if (notifyhash == "bled_out") {
        self util::stop_magic_bullet_shield();
        self.var_e63ac5c = 0;
        self.var_f22c83f5 = 0;
        self.var_e75517b1 = 0;
        self val::reset(#"fasttravel", "ignoreme");
        self.bgb_disabled = 0;
        self bgb::resume_weapon_cycling();
        self allowsprint(1);
        self allowcrouch(1);
        self allowprone(1);
        self allowmelee(1);
        self allowads(1);
    }
    if (isdefined(self.var_c1d4f4d9)) {
        self.var_c1d4f4d9 delete();
    }
    if (isdefined(self.var_3456a2d2)) {
        self.var_3456a2d2 delete();
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x55655100, Offset: 0x27b8
// Size: 0x2ec
function function_6cbea0ea() {
    self endon(#"death");
    self.var_e63ac5c = 1;
    if (self isusingoffhand()) {
        self forceoffhandend();
    }
    w_current = self getcurrentweapon();
    if (zm_loadout::is_placeable_mine(w_current) || zm_equipment::is_equipment(w_current) || ability_util::is_weapon_gadget(w_current)) {
        var_2e07b8ff = self getweaponslistprimaries();
        if (isdefined(var_2e07b8ff) && var_2e07b8ff.size > 0) {
            self switchtoweapon(var_2e07b8ff[0]);
        }
    }
    self.var_f22c83f5 = 1;
    self.var_e75517b1 = 1;
    self val::set(#"fasttravel", "ignoreme", 1);
    self bgb::suspend_weapon_cycling();
    self.bgb_disabled = 1;
    self val::set(#"fasttravel", "takedamage", 0);
    self allowsprint(0);
    self allowcrouch(0);
    self allowprone(0);
    self allowmelee(0);
    self allowads(0);
    if (!self laststand::player_is_in_laststand()) {
        str_stance = self getstance();
        switch (str_stance) {
        case #"crouch":
            self setstance("stand");
            break;
        case #"prone":
            self setstance("stand");
            break;
        }
    }
    self playerlinkto(self.var_c1d4f4d9);
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xc9a6f01f, Offset: 0x2ab0
// Size: 0x144
function function_4a54c378() {
    self endoncallback(&function_9d729023, #"bled_out", #"disconnect");
    self.var_e63ac5c = 0;
    self.var_f22c83f5 = 0;
    self.var_e75517b1 = 0;
    self val::reset(#"fasttravel", "ignoreme");
    self.bgb_disabled = 0;
    self bgb::resume_weapon_cycling();
    self val::reset(#"fasttravel", "takedamage");
    self allowsprint(1);
    self allowcrouch(1);
    self allowprone(1);
    self allowmelee(1);
    self allowads(1);
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0xbebafcfe, Offset: 0x2c00
// Size: 0x124
function function_9d729023(notifyhash) {
    if (notifyhash == "bled_out") {
        self val::reset(#"fasttravel", "takedamage");
        self.var_e63ac5c = 0;
        self.var_f22c83f5 = 0;
        self.var_e75517b1 = 0;
        self val::reset(#"fasttravel", "ignoreme");
        self.bgb_disabled = 0;
        self bgb::resume_weapon_cycling();
        self allowsprint(1);
        self allowcrouch(1);
        self allowprone(1);
        self allowmelee(1);
        self allowads(1);
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0x5e26bc90, Offset: 0x2d30
// Size: 0x25e
function function_57806638(v_flinger) {
    var_61cb960b = 1;
    if (getplayers().size > 2) {
        var_61cb960b = 3;
    } else if (getplayers().size > 1) {
        var_61cb960b = 2;
    }
    e_planks = getent(v_flinger.var_48abac67.target, "targetname");
    e_planks playsound(#"hash_157ec960f5af0676");
    e_planks clientfield::set("flinger_impact_wood", 1);
    if (v_flinger.var_ad63608b >= var_61cb960b) {
        if (!isdefined(v_flinger.var_48abac67.s_unitrigger) && !zm_utility::is_standard()) {
            if (v_flinger.var_745ac235.size > 0 && isdefined(v_flinger.var_745ac235[0])) {
                v_flinger.var_745ac235[0] thread zm_orange_util::function_51b752a9("vox_generic_responses_positive", -1, 0, 0);
            }
            v_flinger.var_320be97e = 1;
            v_flinger.var_48abac67 zm_unitrigger::create(&function_8bf0a961, 64);
            v_flinger.var_48abac67 thread function_ad05ccbb();
            e_planks = getent(v_flinger.var_48abac67.target, "targetname");
            e_planks setmodel("p8_zm_ora_crate_wood_01_tall_open_lid_dmg");
            v_flinger.var_48abac67.e_part = getent(e_planks.target, "targetname");
        }
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0x9ee9bc1a, Offset: 0x2f98
// Size: 0x60
function function_8bf0a961(e_player) {
    str_hint = zm_utility::function_d6046228(#"hash_2f95fd18fc037b20", #"hash_7f5464b25d90d8c");
    self sethintstring(str_hint);
    return true;
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x4c023197, Offset: 0x3000
// Size: 0x1a8
function function_ad05ccbb() {
    level endon(#"end_game");
    self endon(#"hash_710fb070ee784064");
    while (true) {
        s_activation = self waittill(#"trigger_activated");
        e_who = s_activation.e_who;
        switch (self.script_int) {
        case 0:
            e_part = zm_crafting::get_component("zitem_orange_heat_pack_part_1");
            e_who giveweapon(e_part);
            break;
        case 1:
            e_part = zm_crafting::get_component("zitem_orange_heat_pack_part_2");
            e_who giveweapon(e_part);
            break;
        case 2:
            e_part = zm_crafting::get_component("zitem_orange_heat_pack_part_3");
            e_who giveweapon(e_part);
            break;
        }
        self.e_part hide();
        self zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x606da467, Offset: 0x31b0
// Size: 0x6c
function function_27469421() {
    s_underwater_lab_unlock_reward = struct::get("s_underwater_lab_unlock_reward", "targetname");
    s_underwater_lab_unlock_reward zm_unitrigger::create(&function_9b789e22, 64);
    s_underwater_lab_unlock_reward thread function_4aad77c2();
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0x34f4a24c, Offset: 0x3228
// Size: 0x60
function function_9b789e22(e_player) {
    str_hint = zm_utility::function_d6046228(#"hash_49ef4d8e3753ac8d", #"hash_b80e393ce68873");
    self sethintstring(str_hint);
    return true;
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xcdeec469, Offset: 0x3290
// Size: 0xca
function function_4aad77c2() {
    level endon(#"end_game");
    self endon(#"hash_683fe8e994aae075");
    while (true) {
        s_activation = self waittill(#"trigger_activated");
        e_who = s_activation.e_who;
        level flag::set(#"hash_352e983079eccab6");
        self zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
        self notify(#"hash_683fe8e994aae075");
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xe3901912, Offset: 0x3368
// Size: 0x34
function function_b040671c() {
    level endon(#"end_game");
    wait 10;
    self thread function_67769412();
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xc2e3c0ae, Offset: 0x33a8
// Size: 0x34
function function_5fb97eb1() {
    level endon(#"end_game");
    wait 10;
    self thread function_d8d2ddc6();
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x3a4de9dc, Offset: 0x33e8
// Size: 0xf2
function function_20bb4f5a() {
    a_ai_enemies = getaiteamarray(level.zombie_team);
    var_e7992ae2 = 0;
    foreach (ai_enemy in a_ai_enemies) {
        if (isalive(ai_enemy) && ai_enemy istouching(self)) {
            ai_enemy thread fling_ai(self);
            var_e7992ae2++;
        }
    }
    self.var_e7992ae2 = var_e7992ae2;
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0xc26494ad, Offset: 0x34e8
// Size: 0x202
function fling_ai(v_flinger) {
    var_e4794129 = anglestoforward(v_flinger.var_9b23f7b9.angles);
    if (v_flinger.str_location === "ship") {
        var_83be5b2c = randomintrange(275, 350);
    } else if (v_flinger.str_location === "facility") {
        var_83be5b2c = randomintrange(350, 750);
    } else if (v_flinger.str_location === "island") {
        var_83be5b2c = randomintrange(275, 350);
    }
    var_dc0cf615 = var_e4794129 * var_83be5b2c;
    var_3bbf57d2 = function_42460442();
    self.no_powerups = 1;
    self.var_967139bd = 1;
    if (self.var_b030dabb !== undefined) {
        self namespace_9ff9f642::unfreeze();
    }
    if (isalive(self) && isdefined(self.allowdeath) && self.allowdeath) {
        self zm_cleanup::function_23621259();
        self dodamage(self.health + 1000, self.origin);
        self startragdoll();
        self launchragdoll(var_dc0cf615, var_3bbf57d2);
        waitframe(1);
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xddd72b10, Offset: 0x36f8
// Size: 0x9a
function function_42460442() {
    var_4b6d2da1 = randomintrange(0, 4);
    switch (var_4b6d2da1) {
    case 0:
        return "j_ankle_le";
    case 1:
        return "j_ankle_ri";
    case 2:
        return "j_wrist_le";
    case 3:
        return "j_wrist_ri";
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x2a051359, Offset: 0x37a0
// Size: 0x218
function function_9b196e4f() {
    foreach (var_2c9017c8 in self.var_12d831a6) {
        var_2c9017c8 solid();
    }
    if (isdefined(self.var_ee9659b7)) {
        foreach (var_de1f420f in self.var_ee9659b7) {
            unlinktraversal(var_de1f420f);
        }
    }
    self playsound(#"hash_7f9983381e1b2921");
    self.var_28a430ac flinger_launch();
    foreach (var_2c9017c8 in self.var_12d831a6) {
        var_2c9017c8 notsolid();
    }
    if (isdefined(self.var_ee9659b7)) {
        foreach (var_de1f420f in self.var_ee9659b7) {
            linktraversal(var_de1f420f);
        }
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x26a97990, Offset: 0x39c0
// Size: 0x94
function flinger_init() {
    self thread scene::play("init");
    self flagsys::wait_till(#"scene_ents_ready");
    self.var_9d07d8dd = self.scene_ents[#"prop 1"];
    if (self.targetname != "flinger_island") {
        self thread function_e468b4be();
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xf9d64f72, Offset: 0x3a60
// Size: 0xc4
function function_e468b4be() {
    if (self.targetname === "flinger_facility") {
        level waittill(#"power_on3");
        if (level flag::get("facility_flinger_fixed")) {
            return;
        }
    } else if (self.targetname === "flinger_ship") {
        level waittill(#"power_on2");
        if (level flag::get("ship_flinger_fixed")) {
            return;
        }
    }
    self.var_9d07d8dd clientfield::set("gear_box_spark", 1);
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0x71d7b916, Offset: 0x3b30
// Size: 0x9c
function function_60325438(is_visible) {
    if (is_visible == 0) {
        self.var_9d07d8dd hidepart("tag_generator");
        if (self.targetname != "flinger_island") {
            self.var_9d07d8dd clientfield::set("gear_box_spark", 0);
        }
        return;
    }
    self.var_9d07d8dd showpart("tag_generator");
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 1, eflags: 0x0
// Checksum 0xc1d69eeb, Offset: 0x3bd8
// Size: 0x9e
function function_c0df509(index) {
    for (i = 1; i < 5; i++) {
        self.var_9d07d8dd hidepart("tag_indicator_light_" + i);
    }
    for (i = 1; i <= index; i++) {
        self.var_9d07d8dd showpart("tag_indicator_light_" + i);
    }
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0xbe9d16fe, Offset: 0x3c80
// Size: 0xf4
function function_ac9a3646() {
    playsoundatposition(#"hash_5474570f37d75aa7", self.origin);
    e_snd = spawn("script_origin", self.origin);
    e_snd playsound(#"hash_5913634c5007a95");
    self waittill(#"launcher_activated", #"hash_1a5c6352ea49c8ff");
    playsoundatposition(#"hash_3db70e71d59b6393", self.origin);
    e_snd stopsounds();
    waitframe(1);
    e_snd delete();
}

// Namespace zm_orange_fasttravel_flinger/zm_orange_fasttravel_flinger
// Params 0, eflags: 0x0
// Checksum 0x29668418, Offset: 0x3d80
// Size: 0x24
function flinger_launch() {
    self scene::play("launch");
}

