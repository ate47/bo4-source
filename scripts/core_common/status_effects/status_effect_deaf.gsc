// Atian COD Tools GSC decompiler test
#include scripts/core_common/status_effects/status_effect_util.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace status_effect_deaf;

// Namespace status_effect_deaf/status_effect_deaf
// Params 0, eflags: 0x2
// Checksum 0x7f2162f6, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"status_effect_deaf", &__init__, undefined, undefined);
}

// Namespace status_effect_deaf/status_effect_deaf
// Params 0, eflags: 0x1 linked
// Checksum 0xc45e05f4, Offset: 0xd0
// Size: 0x8c
function __init__() {
    status_effect::register_status_effect_callback_apply(0, &deaf_apply);
    status_effect::function_5bae5120(0, &function_c5189bd);
    status_effect::function_6f4eaf88(getstatuseffect("deaf"));
    callback::on_spawned(&on_player_spawned);
}

// Namespace status_effect_deaf/status_effect_deaf
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x168
// Size: 0x4
function on_player_spawned() {
    
}

// Namespace status_effect_deaf/status_effect_deaf
// Params 3, eflags: 0x1 linked
// Checksum 0x51a69f95, Offset: 0x178
// Size: 0x1c
function deaf_apply(var_756fda07, weapon, applicant) {
    
}

// Namespace status_effect_deaf/status_effect_deaf
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1a0
// Size: 0x4
function function_c5189bd() {
    
}

