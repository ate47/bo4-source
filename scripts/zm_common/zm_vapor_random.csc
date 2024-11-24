#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_vapor_random;

// Namespace zm_vapor_random/zm_vapor_random
// Params 0, eflags: 0x2
// Checksum 0x4c20c84f, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_vapor_random", &__init__, undefined, undefined);
}

// Namespace zm_vapor_random/zm_vapor_random
// Params 0, eflags: 0x1 linked
// Checksum 0x19971e06, Offset: 0x148
// Size: 0x72
function __init__() {
    clientfield::register("scriptmover", "random_vapor_altar_available", 1, 1, "int", &random_vapor_altar_available_fx, 0, 0);
    level._effect[#"random_vapor_altar_available"] = "zombie/fx_powerup_on_green_zmb";
}

// Namespace zm_vapor_random/zm_vapor_random
// Params 7, eflags: 0x1 linked
// Checksum 0xb478b3a, Offset: 0x1c8
// Size: 0xcc
function random_vapor_altar_available_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        if (!isdefined(self.var_476bef54)) {
            self.var_476bef54 = util::playfxontag(localclientnum, level._effect[#"random_vapor_altar_available"], self, "tag_origin");
        }
        return;
    }
    if (isdefined(self.var_476bef54)) {
        stopfx(localclientnum, self.var_476bef54);
    }
}

