#using scripts\core_common\util_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_orange_trials;

// Namespace zm_orange_trials/zm_orange_trials
// Params 0, eflags: 0x1 linked
// Checksum 0xcde04808, Offset: 0xa0
// Size: 0xdc
function preload() {
    level._effect[#"trials_lighthouse_beam"] = #"hash_7249b8c6a93aa3a3";
    clientfield::register("scriptmover", "" + #"hash_71906a124221219", 24000, 1, "int", &function_8532d13f, 0, 0);
    clientfield::register("scriptmover", "" + #"trials_lighthouse_beam", 24000, 1, "int", &function_804015d2, 0, 0);
}

// Namespace zm_orange_trials/zm_orange_trials
// Params 7, eflags: 0x1 linked
// Checksum 0xb7804c10, Offset: 0x188
// Size: 0x12c
function function_8532d13f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_573d289)) {
        self stoploopsound(self.var_573d289);
        self.var_573d289 = undefined;
    }
    if (newval == 1) {
        self util::waittill_dobj(localclientnum);
        self.buff_fx = util::playfxontag(localclientnum, level._effect[#"hash_69e92b9c52f7fe12"], self, "tag_origin");
        self.var_573d289 = self playloopsound(#"hash_218e114cfa2b9a4");
        return;
    }
    if (isdefined(self.buff_fx)) {
        stopfx(localclientnum, self.buff_fx);
    }
}

// Namespace zm_orange_trials/zm_orange_trials
// Params 7, eflags: 0x1 linked
// Checksum 0x4202cf6b, Offset: 0x2c0
// Size: 0xac
function function_804015d2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.fx = util::playfxontag(localclientnum, level._effect[#"trials_lighthouse_beam"], self, "tag_origin");
        return;
    }
    stopfx(localclientnum, self.fx);
}

