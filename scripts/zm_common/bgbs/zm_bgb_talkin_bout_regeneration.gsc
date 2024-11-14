#using scripts\zm_common\zm_bgb;
#using scripts\core_common\values_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\laststand_shared;

#namespace zm_bgb_talkin_bout_regeneration;

// Namespace zm_bgb_talkin_bout_regeneration/zm_bgb_talkin_bout_regeneration
// Params 0, eflags: 0x2
// Checksum 0xe7c3a9db, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_talkin_bout_regeneration", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_talkin_bout_regeneration/zm_bgb_talkin_bout_regeneration
// Params 0, eflags: 0x1 linked
// Checksum 0xda4380b9, Offset: 0x100
// Size: 0x94
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_talkin_bout_regeneration", "time", 240, &enable, &disable, undefined, undefined);
    bgb::function_e1f37ce7(#"zm_bgb_talkin_bout_regeneration");
}

// Namespace zm_bgb_talkin_bout_regeneration/zm_bgb_talkin_bout_regeneration
// Params 0, eflags: 0x1 linked
// Checksum 0x840dbdcd, Offset: 0x1a0
// Size: 0x1c
function enable() {
    self thread function_c0c85fe();
}

// Namespace zm_bgb_talkin_bout_regeneration/zm_bgb_talkin_bout_regeneration
// Params 0, eflags: 0x1 linked
// Checksum 0xb8de61c6, Offset: 0x1c8
// Size: 0x3c
function disable() {
    self notify(#"hash_fcaa137035db4e");
    val::reset(#"zm_bgb_talkin_bout_regeneration", "ignore_health_regen_delay");
}

// Namespace zm_bgb_talkin_bout_regeneration/zm_bgb_talkin_bout_regeneration
// Params 0, eflags: 0x1 linked
// Checksum 0xde4c0ea7, Offset: 0x210
// Size: 0x146
function function_c0c85fe() {
    self endon(#"death", #"hash_fcaa137035db4e");
    var_47624402 = 0;
    while (true) {
        var_197c85d1 = self getvelocity();
        var_9b7f7d9b = length(var_197c85d1);
        if (var_9b7f7d9b > 0 && !self laststand::player_is_in_laststand() && (var_197c85d1[0] != 0 || var_197c85d1[1] != 0)) {
            if (!var_47624402) {
                var_47624402 = 1;
                self val::set(#"zm_bgb_talkin_bout_regeneration", "ignore_health_regen_delay", 1);
            }
        } else if (var_47624402) {
            var_47624402 = 0;
            self val::reset(#"zm_bgb_talkin_bout_regeneration", "ignore_health_regen_delay");
        }
        waitframe(1);
    }
}

