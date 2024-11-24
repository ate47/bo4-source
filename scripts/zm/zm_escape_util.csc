#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_escape_util;

// Namespace zm_escape_util/zm_escape_util
// Params 0, eflags: 0x1 linked
// Checksum 0xcdf18d4a, Offset: 0xb8
// Size: 0x192
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"hash_7327d0447d656234", 1, 1, "int", &function_6799fbc4, 0, 0);
    clientfield::register("item", "" + #"hash_76662556681a502c", 1, 1, "int", &function_e2c78db9, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_59be891b288663cc", 1, 1, "int", &function_41f46060, 0, 0);
    clientfield::register("toplayer", "" + #"hash_257c215ab25a21c5", 1, 1, "counter", &function_b334fc71, 0, 0);
    level._effect[#"hash_7e0daf8faf89bbcf"] = #"hash_1f101b4b415639bb";
}

// Namespace zm_escape_util/zm_escape_util
// Params 7, eflags: 0x1 linked
// Checksum 0x3eea0193, Offset: 0x258
// Size: 0x176
function function_6799fbc4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (!isdefined(level.var_22a393d4)) {
            level.var_22a393d4 = [];
        } else if (!isarray(level.var_22a393d4)) {
            level.var_22a393d4 = array(level.var_22a393d4);
        }
        if (!isinarray(level.var_22a393d4, self)) {
            level.var_22a393d4[level.var_22a393d4.size] = self;
        }
        self.show_function = &function_c06aed2;
        self.hide_function = &function_59cd4ca1;
        self hide();
        return;
    }
    arrayremovevalue(level.var_22a393d4, self);
    self show();
    self notify(#"hash_6ab654a4c018818c");
}

// Namespace zm_escape_util/zm_escape_util
// Params 1, eflags: 0x5 linked
// Checksum 0x302271c5, Offset: 0x3d8
// Size: 0x36
function private function_c06aed2(localclientnum) {
    self show();
    self notify(#"set_visible");
}

// Namespace zm_escape_util/zm_escape_util
// Params 1, eflags: 0x5 linked
// Checksum 0xd0fd499c, Offset: 0x418
// Size: 0x36
function private function_59cd4ca1(localclientnum) {
    self hide();
    self notify(#"set_invisible");
}

// Namespace zm_escape_util/zm_escape_util
// Params 7, eflags: 0x1 linked
// Checksum 0x334d2394, Offset: 0x458
// Size: 0x112
function function_e2c78db9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.n_fx_id)) {
        stopfx(localclientnum, self.n_fx_id);
        self.n_fx_id = undefined;
    }
    if (isdefined(self.var_b3673abf)) {
        self stoploopsound(self.var_b3673abf);
        self.var_b3673abf = undefined;
    }
    if (newval) {
        self.n_fx_id = util::playfxontag(localclientnum, level._effect[#"hash_4d2e5c87bde94856"], self, "tag_origin");
        self.var_b3673abf = self playloopsound(#"hash_2f017f6ef4550155");
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 7, eflags: 0x1 linked
// Checksum 0x821d1fe3, Offset: 0x578
// Size: 0xba
function function_41f46060(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_aa4114ee)) {
        stopfx(localclientnum, self.var_aa4114ee);
        self.var_aa4114ee = undefined;
    }
    if (newval == 1) {
        self.var_aa4114ee = util::playfxontag(localclientnum, level._effect[#"hash_7e0daf8faf89bbcf"], self, "tag_origin");
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 7, eflags: 0x1 linked
// Checksum 0xb6f6ca37, Offset: 0x640
// Size: 0x7c
function function_b334fc71(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (!function_65b9eb0f(localclientnum)) {
        self playrumbleonentity(localclientnum, #"hash_2be72209069697d0");
    }
}

