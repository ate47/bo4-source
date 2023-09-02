// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_holiday_event;

// Namespace zm_holiday_event/zm_holiday_event
// Params 0, eflags: 0x2
// Checksum 0xcc4c2990, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_holiday_event", &__init__, undefined, undefined);
}

// Namespace zm_holiday_event/zm_holiday_event
// Params 0, eflags: 0x1 linked
// Checksum 0xf4ae1a00, Offset: 0x110
// Size: 0xd4
function __init__() {
    if (getdvarint(#"zm_holiday_event", 0)) {
        clientfield::register("actor", "" + #"hash_59e8c30d5e28dad3", 14000, 1, "int", &function_b245ef9e, 0, 0);
        clientfield::register("scriptmover", "" + #"hash_d260ef4191c5b3d", 14000, 1, "int", &function_9a20c93e, 0, 0);
    }
}

// Namespace zm_holiday_event/zm_holiday_event
// Params 7, eflags: 0x1 linked
// Checksum 0xc990b76d, Offset: 0x1f0
// Size: 0x8c
function function_b245ef9e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self zm_utility::function_3a020b0f(localclientnum, "rob_zm_eyes_green", #"wz/fx8_zombie_eye_glow_green_wz");
    } else {
        self zm_utility::function_704f7c0e(localclientnum);
    }
}

// Namespace zm_holiday_event/zm_holiday_event
// Params 7, eflags: 0x1 linked
// Checksum 0x50b2d231, Offset: 0x288
// Size: 0x146
function function_9a20c93e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_c9d177e8 = util::playfxontag(localclientnum, #"hash_286e0d228779181", self, "tag_origin");
        if (!isdefined(self.var_2a145797)) {
            self playsound(localclientnum, #"zmb_sq_souls_release");
            self.var_2a145797 = self playloopsound(#"zmb_sq_souls_lp");
        }
    } else {
        if (isdefined(self.var_c9d177e8)) {
            killfx(localclientnum, self.var_c9d177e8);
            self.var_c9d177e8 = undefined;
        }
        if (isdefined(self.var_2a145797)) {
            self stoploopsound(self.var_2a145797);
            self.var_2a145797 = undefined;
        }
    }
}

