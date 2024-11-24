#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_near_death_experience;

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x2
// Checksum 0xb3c7327e, Offset: 0x140
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_near_death_experience", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0xbc9503cf, Offset: 0x190
// Size: 0xea
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    clientfield::register("allplayers", "zm_bgb_near_death_experience_3p_fx", 1, 1, "int", &function_f177aa9f, 0, 0);
    clientfield::register("toplayer", "zm_bgb_near_death_experience_1p_fx", 1, 1, "int", &function_70565a6d, 0, 1);
    bgb::register(#"zm_bgb_near_death_experience", "time");
    level.var_d066b29d = [];
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 7, eflags: 0x1 linked
// Checksum 0xcdf25bac, Offset: 0x288
// Size: 0x12c
function function_f177aa9f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_local_player = function_5c10bd79(localclientnum);
    if (newval) {
        if (e_local_player != self) {
            if (!isdefined(self.var_5dacba16)) {
                self.var_5dacba16 = [];
            }
            if (isdefined(self.var_5dacba16[localclientnum])) {
                return;
            }
            self.var_5dacba16[localclientnum] = util::playfxontag(localclientnum, "zombie/fx_bgb_near_death_3p", self, "j_spine4");
        }
        return;
    }
    if (isdefined(self.var_5dacba16) && isdefined(self.var_5dacba16[localclientnum])) {
        stopfx(localclientnum, self.var_5dacba16[localclientnum]);
        self.var_5dacba16[localclientnum] = undefined;
    }
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 7, eflags: 0x1 linked
// Checksum 0x48f49daf, Offset: 0x3c0
// Size: 0x104
function function_70565a6d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(level.var_d066b29d[localclientnum])) {
            deletefx(localclientnum, level.var_d066b29d[localclientnum]);
        }
        level.var_d066b29d[localclientnum] = playfxoncamera(localclientnum, "zombie/fx_bgb_near_death_1p", (0, 0, 0), (1, 0, 0));
        return;
    }
    if (isdefined(level.var_d066b29d[localclientnum])) {
        stopfx(localclientnum, level.var_d066b29d[localclientnum]);
        level.var_d066b29d[localclientnum] = undefined;
    }
}

