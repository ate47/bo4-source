#using scripts\zm\zm_towers_util.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_lockdown_util.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
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

#namespace zm_traps_hellpools;

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x2
// Checksum 0x847931ca, Offset: 0x3d8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_traps_hellpools", &__init__, &__main__, undefined);
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0x473f962e, Offset: 0x428
// Size: 0x3c
function __init__() {
    level thread function_7cc8a854();
    callback::on_finalize_initialization(&init);
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x470
// Size: 0x4
function __main__() {
    
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0x54e79be4, Offset: 0x480
// Size: 0x54
function init() {
    level flag::wait_till("all_players_spawned");
    zm_crafting::function_d1f16587(#"zblueprint_trap_hellpools", &function_55d14d78);
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0xf427fa9c, Offset: 0x4e0
// Size: 0x3d4
function function_7cc8a854() {
    level.a_e_hellpools = getentarray("mdl_hellpool_lava_grate", "targetname");
    foreach (e_hellpool in level.a_e_hellpools) {
        e_hellpool flag::init("activated");
        e_hellpool notsolid();
    }
    level.a_s_hellpool_cauldron = struct::get_array("s_hellpool_cauldron", "targetname");
    level.var_c07e6d20 = getentarray("zm_towers_hellpool_ghost", "script_label");
    foreach (part in level.var_c07e6d20) {
        if (part trigger::is_trigger_of_type("trigger_use_new")) {
            part triggerenable(0);
            continue;
        }
        part hide();
    }
    mdl_clip = getent("mdl_acid_trap_cauldron_piece_clip", "targetname");
    mdl_clip notsolid();
    var_d58ee8b5 = getweapon(#"hash_72cba96681a7af18");
    zm_items::function_4d230236(var_d58ee8b5, &function_b54b9d5e);
    a_zombie_traps = getentarray("zombie_trap", "targetname");
    level.var_482bcfef = array::filter(a_zombie_traps, 0, &function_9cc4d7b9);
    foreach (var_299f1fa2 in level.var_482bcfef) {
        var_299f1fa2 function_586dd237();
    }
    zm_traps::register_trap_basic_info("hellpool", &function_1d86d117, &function_722def57);
    zm_traps::register_trap_damage("hellpool", &function_506285c3, &function_db9410fa);
    level thread function_b589dae1();
    level thread function_a3661fef();
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0xf4ba534a, Offset: 0x8c0
// Size: 0xe0
function function_b589dae1() {
    level endon(#"end_game");
    level notify(#"hash_4cb0ebfa7040a193");
    level endon(#"hash_4cb0ebfa7040a193");
    while (true) {
        level waittill(#"host_migration_end");
        foreach (e_hellpool in level.a_e_hellpools) {
            e_hellpool notify(#"hash_5aa6001392300725");
        }
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x5 linked
// Checksum 0xdbbb001f, Offset: 0x9a8
// Size: 0x122
function private function_a3661fef() {
    level waittill(#"start_zombie_round_logic");
    s_blueprint = zm_crafting::function_b18074d0(#"zblueprint_trap_hellpools");
    while (true) {
        level waittill(#"component_collected");
        foreach (e_player in getplayers()) {
            if (zm_crafting::function_6d1e4410(e_player, s_blueprint)) {
                level scene::function_27f5972e(#"p8_fxanim_zm_towers_trap_acid_bundle");
                level notify(#"hash_476cae376318f3d5");
                return;
            }
        }
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0xa83918ec, Offset: 0xad8
// Size: 0x89c
function function_55d14d78() {
    var_f6e18b6c = self.script_noteworthy;
    switch (var_f6e18b6c) {
    case #"odin":
        level.var_15783f81 = struct::get("zm_towers_hellpool_odin_scene", "script_noteworthy");
        level.var_15783f81 scene::init();
        var_c65eed8e = getentarray("zm_towers_hellpool_odin", "script_noteworthy");
        foreach (part in var_c65eed8e) {
            if (part trigger::is_trigger_of_type("trigger_use_new")) {
                part triggerenable(1);
                part.script_string = "its_a_trap";
                zm_lockdown_util::function_d67bafb5(part, "lockdown_stub_type_crafting_tables");
                continue;
            }
            part show();
        }
        foreach (s_trap_button in level.a_s_trap_buttons) {
            if (s_trap_button.script_int === 3) {
                s_trap_button.scene_ents[#"prop 1"] clientfield::set("trap_switch_green", 1);
            }
        }
        break;
    case #"zeus":
        level.var_15783f81 = struct::get("zm_towers_hellpool_zeus_scene", "script_noteworthy");
        level.var_15783f81 scene::init();
        var_c65eed8e = getentarray("zm_towers_hellpool_zeus", "script_noteworthy");
        foreach (part in var_c65eed8e) {
            if (part trigger::is_trigger_of_type("trigger_use_new")) {
                part triggerenable(1);
                part.script_string = "its_a_trap";
                zm_lockdown_util::function_d67bafb5(part, "lockdown_stub_type_crafting_tables");
                continue;
            }
            part show();
        }
        foreach (s_trap_button in level.a_s_trap_buttons) {
            if (s_trap_button.script_int === 4) {
                s_trap_button.scene_ents[#"prop 1"] clientfield::set("trap_switch_green", 1);
            }
        }
        break;
    case #"danu":
        level.var_15783f81 = struct::get("zm_towers_hellpool_danu_scene", "script_noteworthy");
        level.var_15783f81 scene::init();
        var_c65eed8e = getentarray("zm_towers_hellpool_danu", "script_noteworthy");
        foreach (part in var_c65eed8e) {
            if (part trigger::is_trigger_of_type("trigger_use_new")) {
                part triggerenable(1);
                part.script_string = "its_a_trap";
                zm_lockdown_util::function_d67bafb5(part, "lockdown_stub_type_crafting_tables");
                continue;
            }
            part show();
        }
        foreach (s_trap_button in level.a_s_trap_buttons) {
            if (s_trap_button.script_int === 1) {
                s_trap_button.scene_ents[#"prop 1"] clientfield::set("trap_switch_green", 1);
            }
        }
        break;
    case #"ra":
        level.var_15783f81 = struct::get("zm_towers_hellpool_ra_scene", "script_noteworthy");
        level.var_15783f81 scene::init();
        var_c65eed8e = getentarray("zm_towers_hellpool_ra", "script_noteworthy");
        foreach (part in var_c65eed8e) {
            if (part trigger::is_trigger_of_type("trigger_use_new")) {
                part triggerenable(1);
                part.script_string = "its_a_trap";
                zm_lockdown_util::function_d67bafb5(part, "lockdown_stub_type_crafting_tables");
                continue;
            }
            part show();
        }
        foreach (s_trap_button in level.a_s_trap_buttons) {
            if (s_trap_button.script_int === 2) {
                s_trap_button.scene_ents[#"prop 1"] clientfield::set("trap_switch_green", 1);
            }
        }
        break;
    }
    level thread zm_crafting::function_ca244624("zblueprint_trap_hellpools");
    level scene::function_f81475ae(#"p8_fxanim_zm_towers_trap_acid_bundle");
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 2, eflags: 0x1 linked
// Checksum 0xe5998b1, Offset: 0x1380
// Size: 0x5c
function function_b54b9d5e(e_holder, w_item) {
    mdl_clip = getent("mdl_acid_trap_cauldron_piece_clip", "targetname");
    if (isdefined(mdl_clip)) {
        mdl_clip delete();
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 1, eflags: 0x1 linked
// Checksum 0x7640e9f0, Offset: 0x13e8
// Size: 0x20
function function_9cc4d7b9(e_ent) {
    return e_ent.script_noteworthy == "hellpool";
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0xf93eacb3, Offset: 0x1410
// Size: 0x24
function function_586dd237() {
    self flag::init("activated");
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1440
// Size: 0x4
function function_722def57() {
    
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0xa60efb1a, Offset: 0x1450
// Size: 0x1d4
function function_1d86d117() {
    self._trap_duration = 15;
    self._trap_cooldown_time = 60;
    if (isdefined(level.sndtrapfunc)) {
        level thread [[ level.sndtrapfunc ]](self, 1);
    }
    self notify(#"trap_activate");
    level notify(#"trap_activate", self);
    wait 1;
    self.activated_by_player thread function_45a2294f(self.script_string);
    foreach (e_trap in level.var_482bcfef) {
        if (e_trap.script_string === self.script_string) {
            e_trap thread zm_traps::trap_damage();
        }
    }
    self waittilltimeout(self._trap_duration, #"trap_deactivate");
    foreach (e_trap in level.var_482bcfef) {
        if (e_trap.script_string === self.script_string) {
            e_trap notify(#"trap_done");
        }
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 1, eflags: 0x1 linked
// Checksum 0x4ac2be9b, Offset: 0x1630
// Size: 0x160
function function_45a2294f(str_id) {
    if (!isdefined(self)) {
        return;
    }
    self.b_activated = 1;
    foreach (e_hellpool in level.a_e_hellpools) {
        if (e_hellpool.script_string === str_id) {
            e_hellpool thread activate_trap(self);
        }
    }
    level notify(#"traps_activated", {#var_be3f58a:str_id});
    wait 15;
    level notify(#"traps_cooldown", {#var_be3f58a:str_id});
    n_cooldown = zm_traps::function_da13db45(60, self);
    wait n_cooldown;
    level notify(#"traps_available", {#var_be3f58a:str_id});
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 1, eflags: 0x1 linked
// Checksum 0x3f2144e1, Offset: 0x1798
// Size: 0xa4
function activate_trap(e_player) {
    if (!self flag::get("activated")) {
        if (isdefined(e_player)) {
            self.activated_by_player = e_player;
        }
        self flag::set("activated");
        self thread function_692db12();
        self waittilltimeout(15, #"hash_5aa6001392300725");
        self deactivate_trap();
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0x629e34a7, Offset: 0x1848
// Size: 0x6e
function deactivate_trap() {
    if (self flag::get("activated")) {
        self function_efd16da2();
        self flag::clear("activated");
        self notify(#"deactivate");
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0xc773f327, Offset: 0x18c0
// Size: 0x98
function function_692db12() {
    foreach (s_cauldron in level.a_s_hellpool_cauldron) {
        if (s_cauldron.script_string === self.script_string) {
            self thread function_b327ce68(s_cauldron);
        }
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0x2a215385, Offset: 0x1960
// Size: 0x98
function function_efd16da2() {
    foreach (s_cauldron in level.a_s_hellpool_cauldron) {
        if (s_cauldron.script_string === self.script_string) {
            self thread function_2e78a71b(s_cauldron);
        }
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 1, eflags: 0x1 linked
// Checksum 0xbbfed10a, Offset: 0x1a00
// Size: 0x5c
function function_b327ce68(s_cauldron) {
    s_cauldron thread scene::play("shot 1");
    level waittill(#"hash_189e686c493a2a23");
    s_cauldron thread function_4c1fe94b();
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 1, eflags: 0x1 linked
// Checksum 0x8413ea19, Offset: 0x1a68
// Size: 0x2c
function function_2e78a71b(s_cauldron) {
    s_cauldron thread scene::play("shot 3");
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 0, eflags: 0x1 linked
// Checksum 0x328d9fd2, Offset: 0x1aa0
// Size: 0x24
function function_4c1fe94b() {
    self thread scene::play("shot 2");
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 1, eflags: 0x1 linked
// Checksum 0xfa011fb9, Offset: 0x1ad0
// Size: 0x1ac
function function_db9410fa(e_trap) {
    if (isactor(self) && !(isdefined(self.marked_for_death) && self.marked_for_death)) {
        self.marked_for_death = 1;
        if (isplayer(e_trap.activated_by_player)) {
            e_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
            e_trap.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
        }
        if (self.var_6f84b820 == #"miniboss" || self.var_6f84b820 == #"heavy") {
            self.marked_for_death = 0;
            return;
        }
        self clientfield::set("acid_trap_death_fx", 1);
        wait 0.75;
        if (isalive(self)) {
            level notify(#"trap_kill", {#e_victim:self, #e_trap:e_trap});
            self dodamage(self.health + 666, self.origin, e_trap);
        }
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 1, eflags: 0x1 linked
// Checksum 0x9cb7daa1, Offset: 0x1c88
// Size: 0x1fc
function function_506285c3(t_damage) {
    self endoncallback(&function_6f5e73b5, #"death", #"disconnect");
    if (isalive(self) && !(isdefined(self.var_62b59590) && self.var_62b59590)) {
        self.var_62b59590 = 1;
        if (isplayer(self)) {
            if (!self laststand::player_is_in_laststand() && !level flag::get("round_reset")) {
                params = getstatuseffect(#"hash_baee445ed1d9b99");
                if (zm_utility::is_standard()) {
                    params.dotdamage = int(params.dotdamage / 4);
                }
                if (zm_utility::is_ee_enabled() && self flag::get(#"hash_6757075afacfc1b4")) {
                    params.dotdamage = int(params.dotdamage * 0.1);
                }
                self status_effect::status_effect_apply(params);
                self clientfield::set_to_player("acid_trap_postfx", 1);
            }
            self function_6f5e73b5();
        }
    }
}

// Namespace zm_traps_hellpools/zm_towers_traps_hellpools
// Params 1, eflags: 0x1 linked
// Checksum 0x5af47502, Offset: 0x1e90
// Size: 0x44
function function_6f5e73b5(var_c34665fc) {
    wait 1;
    if (isdefined(self)) {
        self.var_62b59590 = 0;
        self clientfield::set_to_player("acid_trap_postfx", 0);
    }
}

