#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_white_cheat_codes;

// Namespace zm_white_cheat_codes/zm_white_cheat_codes
// Params 0, eflags: 0x1 linked
// Checksum 0x5aa71e2c, Offset: 0xc8
// Size: 0x24
function init() {
    init_clientfields();
    init_fx();
}

// Namespace zm_white_cheat_codes/zm_white_cheat_codes
// Params 0, eflags: 0x1 linked
// Checksum 0xc10dc7f9, Offset: 0xf8
// Size: 0x5c
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"hash_7876f33937c8a764", 20000, 1, "int", &vomit, 0, 0);
}

// Namespace zm_white_cheat_codes/zm_white_cheat_codes
// Params 0, eflags: 0x1 linked
// Checksum 0x59029027, Offset: 0x160
// Size: 0x2a
function init_fx() {
    level._effect[#"fx8_blightfather_vomit_object"] = "zm_ai/fx8_blightfather_vomit_object";
}

// Namespace zm_white_cheat_codes/zm_white_cheat_codes
// Params 7, eflags: 0x1 linked
// Checksum 0xa4e852c1, Offset: 0x198
// Size: 0xb2
function vomit(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_39c21153)) {
        stopfx(localclientnum, self.var_39c21153);
        self.var_39c21153 = undefined;
    }
    if (newval) {
        self.var_39c21153 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_vomit_object"], self, "tag_origin");
    }
}

