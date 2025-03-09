#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_white_insanity_mode;

// Namespace zm_white_insanity_mode/zm_white_insanity_mode
// Params 0, eflags: 0x0
// Checksum 0x1df0c7e6, Offset: 0xb0
// Size: 0x4c
function init_clientfields() {
    clientfield::register("vehicle", "fx8_insanity_wisp", 18000, 1, "int", &function_4b104fc5, 0, 0);
}

// Namespace zm_white_insanity_mode/zm_white_insanity_mode
// Params 0, eflags: 0x0
// Checksum 0xbcdaad3d, Offset: 0x108
// Size: 0x32
function init_fx() {
    level._effect[#"fx8_insanity_wisp"] = #"hash_75046ca8114af653";
}

// Namespace zm_white_insanity_mode/zm_white_insanity_mode
// Params 7, eflags: 0x0
// Checksum 0xf2e2ef24, Offset: 0x148
// Size: 0x15e
function function_4b104fc5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.fx = util::playfxontag(localclientnum, level._effect[#"fx8_insanity_wisp"], self, "tag_origin");
        if (!isdefined(self.sfx)) {
            self playsound(0, #"hash_7867b5508ce25848");
            self.sfx = self playloopsound(#"hash_2c5ad3d4cdc507c");
        }
        return;
    }
    stopfx(localclientnum, self.fx);
    if (isdefined(self.sfx)) {
        self playsound(0, #"hash_6e263590089ef88e");
        self stoploopsound(self.sfx);
        self.sfx = undefined;
    }
}

