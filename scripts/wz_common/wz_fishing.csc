#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace wz_fishing;

// Namespace wz_fishing/wz_fishing
// Params 0, eflags: 0x2
// Checksum 0xb418fda8, Offset: 0x140
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_fishing", &__init__, undefined, undefined);
}

// Namespace wz_fishing/wz_fishing
// Params 0, eflags: 0x2
// Checksum 0x80f724d1, Offset: 0x188
// Size: 0x4
function autoexec __init() {
    
}

// Namespace wz_fishing/wz_fishing
// Params 0, eflags: 0x1 linked
// Checksum 0x4ad25f55, Offset: 0x198
// Size: 0xdc
function __init__() {
    clientfield::register("scriptmover", "fishing_splash", 21000, 1, "int", &fishing_splash, 0, 0);
    clientfield::register("scriptmover", "fishing_buoy_splash", 21000, 1, "int", &fishing_splash, 0, 0);
    clientfield::register("toplayer", "player_fishing", 21000, 1, "int", &function_c06a890a, 0, 0);
}

// Namespace wz_fishing/wz_fishing
// Params 7, eflags: 0x1 linked
// Checksum 0x2e754246, Offset: 0x280
// Size: 0xcc
function function_c06a890a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.canUseQuickInventory"), 0);
        return;
    }
    setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.canUseQuickInventory"), 1);
}

// Namespace wz_fishing/wz_fishing
// Params 7, eflags: 0x0
// Checksum 0xd6bac99a, Offset: 0x358
// Size: 0xcc
function fishing_buoy_splash(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        if (isdefined(self.var_85dbab0)) {
            stopfx(localclientnum, self.var_85dbab0);
        }
        return;
    }
    self.var_85dbab0 = playfx(localclientnum, "player/fx_plyr_water_splash_sm", self.origin);
    playsound(localclientnum, #"hash_7ff007fca6ac13d7", self.origin);
}

// Namespace wz_fishing/wz_fishing
// Params 7, eflags: 0x1 linked
// Checksum 0x70ff32bf, Offset: 0x430
// Size: 0xcc
function fishing_splash(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        if (isdefined(self.var_85dbab0)) {
            stopfx(localclientnum, self.var_85dbab0);
        }
        return;
    }
    self.var_85dbab0 = playfx(localclientnum, "impacts/fx8_bul_impact_water_sm", self.origin);
    playsound(localclientnum, #"hash_4b98472de9aeb14b", self.origin);
}

