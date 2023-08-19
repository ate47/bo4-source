// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_bgb.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zm_bgb_newtonian_negation;

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 0, eflags: 0x2
// Checksum 0xccd966bf, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_newtonian_negation", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 0, eflags: 0x1 linked
// Checksum 0x65439e7d, Offset: 0x108
// Size: 0xac
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    clientfield::register("world", "newtonian_negation", 1, 1, "int");
    bgb::register(#"zm_bgb_newtonian_negation", "time", 1500, &enable, &disable, &validation);
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 0, eflags: 0x1 linked
// Checksum 0xf2725caa, Offset: 0x1c0
// Size: 0x2c
function validation() {
    if (isdefined(level.var_6bbb45f9) && level.var_6bbb45f9) {
        return 0;
    }
    return 1;
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 0, eflags: 0x1 linked
// Checksum 0x7bf95324, Offset: 0x1f8
// Size: 0x34
function enable() {
    function_8622e664(1);
    self thread function_4712db36();
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 0, eflags: 0x1 linked
// Checksum 0xddcafd10, Offset: 0x238
// Size: 0x3c
function function_4712db36() {
    self endon(#"hash_429f79a1bdb91087");
    self waittill(#"disconnect");
    thread disable();
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 0, eflags: 0x1 linked
// Checksum 0xfb45c9ca, Offset: 0x280
// Size: 0xcc
function disable() {
    if (isdefined(self)) {
        self notify(#"hash_429f79a1bdb91087");
    }
    foreach (player in level.players) {
        if (player !== self && player bgb::is_enabled(#"zm_bgb_newtonian_negation")) {
            return;
        }
    }
    function_8622e664(0);
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 1, eflags: 0x1 linked
// Checksum 0xfe8293a8, Offset: 0x358
// Size: 0x2c
function function_8622e664(var_b4666218) {
    level clientfield::set("newtonian_negation", var_b4666218);
}

