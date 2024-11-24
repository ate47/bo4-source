#using scripts\zm_common\zm_audio;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\struct;
#using scripts\core_common\lui_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;

#namespace zm_trap_buy_buttons;

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 0, eflags: 0x2
// Checksum 0x32e15bc5, Offset: 0x1e8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_trap_buy_buttons", &__init__, &__main__, undefined);
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 0, eflags: 0x1 linked
// Checksum 0x6f8e5b0, Offset: 0x238
// Size: 0x24
function __init__() {
    callback::on_finalize_initialization(&init);
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x268
// Size: 0x4
function __main__() {
    
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 0, eflags: 0x1 linked
// Checksum 0x47e7656e, Offset: 0x278
// Size: 0x188
function init() {
    level.a_s_trap_buttons = struct::get_array("s_trap_button", "targetname");
    scene::add_scene_func("p8_fxanim_zm_towers_trap_switch_bundle", &function_cb307051, "init");
    level thread function_eac89317();
    var_7febdbb2 = getentarray("trig_buy_bladepillars_to_upper_south", "targetname");
    array::thread_all(var_7febdbb2, &function_ea998c9, 0, 1);
    foreach (t_crafting in level.var_4fe2f84d[#"zblueprint_trap_hellpools"]) {
        if (t_crafting.script_noteworthy === "danu" || t_crafting.script_noteworthy === "ra") {
            t_crafting thread function_ea998c9(1, 0);
        }
    }
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 1, eflags: 0x1 linked
// Checksum 0xea5cfc6f, Offset: 0x408
// Size: 0x4c
function function_cb307051(a_ents) {
    if (!isdefined(self.script_int)) {
        a_ents[#"prop 1"] clientfield::set("trap_switch_green", 1);
    }
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 1, eflags: 0x1 linked
// Checksum 0x79640a0b, Offset: 0x460
// Size: 0x98
function function_81badccf(str_id) {
    foreach (s_trap_button in level.a_s_trap_buttons) {
        if (s_trap_button.script_string === str_id) {
            s_trap_button thread function_8cfecd54();
        }
    }
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 1, eflags: 0x1 linked
// Checksum 0xa7f89432, Offset: 0x500
// Size: 0x98
function function_6087ebc2(str_id) {
    foreach (s_trap_button in level.a_s_trap_buttons) {
        if (s_trap_button.script_string === str_id) {
            s_trap_button thread function_707cb9a9();
        }
    }
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 1, eflags: 0x1 linked
// Checksum 0x19bb1bae, Offset: 0x5a0
// Size: 0x98
function function_1b229077(str_id) {
    foreach (s_trap_button in level.a_s_trap_buttons) {
        if (s_trap_button.script_string === str_id) {
            s_trap_button thread function_baf2d8eb();
        }
    }
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 0, eflags: 0x1 linked
// Checksum 0xadca0f23, Offset: 0x640
// Size: 0x126
function function_eac89317() {
    level endon(#"game_ended");
    while (true) {
        s_notify = level waittill(#"traps_activated", #"traps_available", #"traps_cooldown");
        if (isdefined(s_notify.var_be3f58a)) {
            switch (s_notify._notify) {
            case #"traps_activated":
                function_81badccf(s_notify.var_be3f58a);
                break;
            case #"traps_available":
                function_6087ebc2(s_notify.var_be3f58a);
                break;
            case #"traps_cooldown":
                function_1b229077(s_notify.var_be3f58a);
                break;
            }
        }
    }
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 0, eflags: 0x1 linked
// Checksum 0xfaccdf34, Offset: 0x770
// Size: 0x8c
function function_8cfecd54() {
    self thread scene::play("Shot 1");
    self.scene_ents[#"prop 1"] clientfield::set("trap_switch_green", 0);
    self.scene_ents[#"prop 1"] clientfield::set("trap_switch_red", 1);
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 0, eflags: 0x1 linked
// Checksum 0x646dafbc, Offset: 0x808
// Size: 0x8c
function function_707cb9a9() {
    self thread scene::play("Shot 2");
    self.scene_ents[#"prop 1"] clientfield::set("trap_switch_smoke", 0);
    self.scene_ents[#"prop 1"] clientfield::set("trap_switch_green", 1);
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 0, eflags: 0x1 linked
// Checksum 0xa8ecc20b, Offset: 0x8a0
// Size: 0x6c
function function_baf2d8eb() {
    self.scene_ents[#"prop 1"] clientfield::set("trap_switch_red", 0);
    self.scene_ents[#"prop 1"] clientfield::set("trap_switch_smoke", 1);
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 2, eflags: 0x1 linked
// Checksum 0xc474ec3b, Offset: 0x918
// Size: 0x1e4
function function_ea998c9(var_458e12fe = 0, var_1798e06d = 0) {
    self endon(#"death");
    if (var_458e12fe) {
        if (self.script_noteworthy === "danu") {
            self.script_flag = "connect_starting_area_to_danu_hallway";
        } else {
            self.script_flag = "connect_starting_area_to_ra_hallway";
        }
        while (!isdefined(self.prompt_and_visibility_func)) {
            waitframe(1);
        }
        visibility_func = self.prompt_and_visibility_func;
        self.prompt_and_visibility_func = &function_504d501c;
    } else {
        self triggerenable(0);
    }
    level flag::wait_till("all_players_spawned");
    level flag::wait_till(self.script_flag);
    if (var_1798e06d) {
        a_s_switches = struct::get_array(#"s_trap_button");
        s_switch = arraygetclosest(self.origin, a_s_switches);
        s_switch.scene_ents[#"prop 1"] clientfield::set("trap_switch_green", 1);
    }
    if (var_458e12fe) {
        self.prompt_and_visibility_func = visibility_func;
        return;
    }
    self triggerenable(1);
}

// Namespace zm_trap_buy_buttons/namespace_f78cb90a
// Params 1, eflags: 0x1 linked
// Checksum 0x940bb938, Offset: 0xb08
// Size: 0xe
function function_504d501c(e_player) {
    return false;
}

