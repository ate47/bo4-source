// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_blockers;

// Namespace zm_blockers/zm_blockers
// Params 0, eflags: 0x2
// Checksum 0x3d9c5b4e, Offset: 0x2b8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_blockers", &__init__, undefined, undefined);
}

// Namespace zm_blockers/zm_blockers
// Params 0, eflags: 0x1 linked
// Checksum 0x7cf5d0a, Offset: 0x300
// Size: 0x37c
function __init__() {
    level._effect[#"doorbuy_ambient_fx"] = "zombie/fx8_doorbuy_amb";
    level._effect[#"doorbuy_bought_fx"] = "zombie/fx8_doorbuy_death";
    level._effect[#"debrisbuy_ambient_fx"] = "zombie/fx8_debrisbuy_amb";
    level._effect[#"debrisbuy_bought_fx"] = "zombie/fx8_debrisbuy_death";
    level._effect[#"powerdoor_ambient_fx"] = "zombie/fx8_power_door_amb";
    level._effect[#"powerdoor_bought_fx"] = "zombie/fx8_power_door_death";
    level._effect[#"power_debris_ambient_fx"] = "zombie/fx8_power_debris_amb";
    level._effect[#"power_debris_bought_fx"] = "zombie/fx8_power_debris_death";
    clientfield::register("scriptmover", "doorbuy_ambient_fx", 1, 1, "int", &doorbuy_ambient_fx, 0, 0);
    clientfield::register("scriptmover", "doorbuy_bought_fx", 1, 1, "int", &doorbuy_bought_fx, 0, 0);
    clientfield::register("scriptmover", "debrisbuy_ambient_fx", 1, 1, "int", &debrisbuy_ambient_fx, 0, 0);
    clientfield::register("scriptmover", "debrisbuy_bought_fx", 1, 1, "int", &debrisbuy_bought_fx, 0, 0);
    clientfield::register("scriptmover", "power_door_ambient_fx", 1, 1, "int", &power_door_ambient_fx, 0, 0);
    clientfield::register("scriptmover", "power_door_bought_fx", 1, 1, "int", &power_door_bought_fx, 0, 0);
    clientfield::register("scriptmover", "power_debris_ambient_fx", 1, 1, "int", &power_debris_ambient_fx, 0, 0);
    clientfield::register("scriptmover", "power_debris_bought_fx", 1, 1, "int", &power_debris_bought_fx, 0, 0);
}

// Namespace zm_blockers/zm_blockers
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x688
// Size: 0x4
function __main__() {
    
}

// Namespace zm_blockers/zm_blockers
// Params 7, eflags: 0x1 linked
// Checksum 0x2114bb0f, Offset: 0x698
// Size: 0x74
function doorbuy_ambient_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_aa07bb71(level._effect[#"doorbuy_ambient_fx"], "zmb_blocker_door_lp", localclientnum, newval);
}

// Namespace zm_blockers/zm_blockers
// Params 7, eflags: 0x1 linked
// Checksum 0x84f2ed75, Offset: 0x718
// Size: 0x74
function debrisbuy_ambient_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_aa07bb71(level._effect[#"debrisbuy_ambient_fx"], "zmb_blocker_debris_lp", localclientnum, newval);
}

// Namespace zm_blockers/zm_blockers
// Params 7, eflags: 0x1 linked
// Checksum 0xc49f6197, Offset: 0x798
// Size: 0x74
function power_door_ambient_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_aa07bb71(level._effect[#"powerdoor_ambient_fx"], "zmb_blocker_powerdoor_lp", localclientnum, newval);
}

// Namespace zm_blockers/zm_blockers
// Params 7, eflags: 0x1 linked
// Checksum 0x44ce7336, Offset: 0x818
// Size: 0x74
function power_debris_ambient_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_aa07bb71(level._effect[#"power_debris_ambient_fx"], "zmb_blocker_debris_lp", localclientnum, newval);
}

// Namespace zm_blockers/zm_blockers
// Params 7, eflags: 0x1 linked
// Checksum 0x249c637d, Offset: 0x898
// Size: 0x7c
function doorbuy_bought_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_e6eed4fe(level._effect[#"doorbuy_bought_fx"], #"hash_21b4bf152e90fd76", localclientnum, newval);
}

// Namespace zm_blockers/zm_blockers
// Params 7, eflags: 0x1 linked
// Checksum 0x9af791f5, Offset: 0x920
// Size: 0x7c
function debrisbuy_bought_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_e6eed4fe(level._effect[#"debrisbuy_bought_fx"], #"hash_4bddd546f43487cf", localclientnum, newval);
}

// Namespace zm_blockers/zm_blockers
// Params 7, eflags: 0x1 linked
// Checksum 0x54263d74, Offset: 0x9a8
// Size: 0x7c
function power_door_bought_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_e6eed4fe(level._effect[#"powerdoor_bought_fx"], #"hash_5dcb54d98c9787b1", localclientnum, newval);
}

// Namespace zm_blockers/zm_blockers
// Params 7, eflags: 0x1 linked
// Checksum 0xa2cf6955, Offset: 0xa30
// Size: 0x7c
function power_debris_bought_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_e6eed4fe(level._effect[#"power_debris_bought_fx"], #"hash_4bddd546f43487cf", localclientnum, newval);
}

// Namespace zm_blockers/zm_blockers
// Params 4, eflags: 0x1 linked
// Checksum 0x9b4d0984, Offset: 0xab8
// Size: 0xe4
function function_aa07bb71(str_fx_name, var_bd367366, var_6142f944, n_new_val) {
    if (n_new_val) {
        if (isdefined(self) && !isdefined(self.var_907b36d0)) {
            self.var_907b36d0 = util::playfxontag(var_6142f944, str_fx_name, self, "tag_origin");
        }
        audio::playloopat(var_bd367366, self.origin);
    } else {
        if (isdefined(self.var_907b36d0)) {
            killfx(var_6142f944, self.var_907b36d0);
            self.var_907b36d0 = undefined;
        }
        audio::stoploopat(var_bd367366, self.origin);
    }
}

// Namespace zm_blockers/zm_blockers
// Params 4, eflags: 0x1 linked
// Checksum 0xe099edfa, Offset: 0xba8
// Size: 0xec
function function_e6eed4fe(str_fx_name, var_d34b6d2b, var_6142f944, n_new_val) {
    if (n_new_val) {
        if (!isdefined(self.var_4da473fc)) {
            var_4da473fc = util::spawn_model(var_6142f944, #"tag_origin", self.origin, self.angles);
        } else {
            var_4da473fc = self.var_4da473fc;
        }
        util::playfxontag(var_6142f944, str_fx_name, var_4da473fc, "tag_origin");
        playsound(var_6142f944, var_d34b6d2b, var_4da473fc.origin);
        wait(2);
        if (isdefined(var_4da473fc)) {
            var_4da473fc delete();
        }
    }
}

