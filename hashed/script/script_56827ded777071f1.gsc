// Atian COD Tools GSC decompiler test
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
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_3f3f1a00;

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 0, eflags: 0x2
// Checksum 0x39b7929b, Offset: 0x138
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_d57f57fb8d115ff", &__init__, &__main__, undefined);
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 0, eflags: 0x1 linked
// Checksum 0x6586fdbf, Offset: 0x188
// Size: 0x24
function __init__() {
    callback::on_finalize_initialization(&init);
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1b8
// Size: 0x4
function __main__() {
    
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 0, eflags: 0x1 linked
// Checksum 0xe4efec, Offset: 0x1c8
// Size: 0xbc
function init() {
    level.a_mdl_trap_buttons = getentarray("mdl_trap_button", "targetname");
    foreach (mdl_trap_button in level.a_mdl_trap_buttons) {
        mdl_trap_button thread function_63be76e0();
    }
    level thread function_eac89317();
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 1, eflags: 0x1 linked
// Checksum 0x7672173c, Offset: 0x290
// Size: 0x98
function function_bb013f42(str_id) {
    foreach (mdl_trap_button in level.a_mdl_trap_buttons) {
        if (mdl_trap_button.script_string === str_id) {
            mdl_trap_button thread function_8724b9c4();
        }
    }
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 1, eflags: 0x1 linked
// Checksum 0x20f8da0e, Offset: 0x330
// Size: 0x98
function function_75046566(str_id) {
    foreach (mdl_trap_button in level.a_mdl_trap_buttons) {
        if (mdl_trap_button.script_string === str_id) {
            mdl_trap_button thread function_a82eb7c1();
        }
    }
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 0, eflags: 0x1 linked
// Checksum 0x1f65e01a, Offset: 0x3d0
// Size: 0xd8
function function_eac89317() {
    level endon(#"game_ended");
    while (true) {
        s_notify = level waittill(#"traps_activated", #"traps_available");
        if (isdefined(s_notify.var_be3f58a)) {
            if (s_notify._notify === "traps_activated") {
                function_bb013f42(s_notify.var_be3f58a);
                continue;
            }
            if (s_notify._notify === "traps_available") {
                function_75046566(s_notify.var_be3f58a);
            }
        }
    }
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 0, eflags: 0x1 linked
// Checksum 0x2196f89d, Offset: 0x4b0
// Size: 0x52
function function_63be76e0() {
    self.v_up = self.origin;
    s_down = struct::get(self.target, "targetname");
    self.v_down = s_down.origin;
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 0, eflags: 0x1 linked
// Checksum 0x7aef87f4, Offset: 0x510
// Size: 0x2c
function function_8724b9c4() {
    self moveto(self.v_down, 0.5);
}

// Namespace namespace_3f3f1a00/namespace_3105b649
// Params 0, eflags: 0x1 linked
// Checksum 0x7764448c, Offset: 0x548
// Size: 0x2c
function function_a82eb7c1() {
    self moveto(self.v_up, 0.5);
}

