#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\load;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_sq_modules;
#using scripts\zm_common\zm_utility;

#namespace mansion_jordans;

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xf8c0623c, Offset: 0xc0
// Size: 0x164
function init() {
    clientfield::register("scriptmover", "" + #"hash_54cceab249a41cde", 8000, 1, "int", &function_5869f09a, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_336942eaf5fcd809", 8000, 1, "int", &function_c51132ba, 0, 0);
    /#
        clientfield::register("<dev string:x38>", "<dev string:x46>" + #"hash_3efe70d8ad68a07d", 8000, 4, "<dev string:x49>", &function_230ff6dc, 0, 0);
        clientfield::register("<dev string:x38>", "<dev string:x46>" + #"hash_4d30672cd0a2ef31", 8000, 1, "<dev string:x49>", &function_bb6fcc6a, 0, 0);
    #/
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 7, eflags: 0x1 linked
// Checksum 0xa25f171d, Offset: 0x230
// Size: 0x154
function function_5869f09a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_5d1596c4)) {
        killfx(localclientnum, self.var_5d1596c4);
        self.var_5d1596c4 = undefined;
        playsound(localclientnum, #"hash_3c3c2809ce13808", self.origin);
        self.var_5d1596c4 = undefined;
    }
    if (newval) {
        self.var_5d1596c4 = playfx(localclientnum, level._effect[#"candle_light"], self.origin + (0, 0, 6), anglestoforward(self.angles), anglestoup(self.angles));
        playsound(localclientnum, #"hash_6ab53d808ef366d5", self.origin);
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 7, eflags: 0x1 linked
// Checksum 0xeb6d3c7e, Offset: 0x390
// Size: 0x5c
function function_c51132ba(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self playrenderoverridebundle(#"hash_429426f01ad84c8b");
}

/#

    // Namespace mansion_jordans/zm_mansion_jordans
    // Params 7, eflags: 0x0
    // Checksum 0xf8c9de44, Offset: 0x3f8
    // Size: 0xba
    function function_bb6fcc6a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
        if (isdefined(self.var_a0a8631e)) {
            stopfx(localclientnum, self.var_a0a8631e);
            self.var_a0a8631e = undefined;
        }
        if (newval) {
            self.var_a0a8631e = util::playfxontag(localclientnum, level._effect[#"pap_projectile"], self, "<dev string:x4f>");
        }
    }

    // Namespace mansion_jordans/zm_mansion_jordans
    // Params 7, eflags: 0x0
    // Checksum 0x89acb245, Offset: 0x4c0
    // Size: 0x98
    function function_230ff6dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
        self endon(#"death");
        while (true) {
            print3d(self.origin, newval, (1, 1, 0), 1, 0.4, 15);
            wait 0.2;
        }
    }

#/
