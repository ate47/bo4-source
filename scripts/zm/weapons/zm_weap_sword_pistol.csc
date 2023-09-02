// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_weap_sword_pistol;

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 0, eflags: 0x2
// Checksum 0x86528a4d, Offset: 0x158
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_sword_pistol", &__init__, undefined, undefined);
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 0, eflags: 0x1 linked
// Checksum 0x2be68f13, Offset: 0x1a0
// Size: 0x632
function __init__() {
    clientfield::register("actor", "" + #"hash_663d94b765bbf524", 1, 1, "counter", &function_8e1552b1, 1, 0);
    clientfield::register("vehicle", "" + #"hash_663d94b765bbf524", 1, 1, "counter", &function_8e1552b1, 1, 0);
    clientfield::register("actor", "" + #"hash_4b4b5e4cb8fba5b", 1, 1, "counter", &function_6831ee4b, 1, 0);
    clientfield::register("vehicle", "" + #"hash_4b4b5e4cb8fba5b", 1, 1, "counter", &function_6831ee4b, 1, 0);
    clientfield::register("actor", "" + #"hash_513a7427138027da", 1, 1, "counter", &function_c0d25f27, 1, 0);
    clientfield::register("vehicle", "" + #"hash_513a7427138027da", 1, 1, "counter", &function_c0d25f27, 1, 0);
    clientfield::register("scriptmover", "" + #"hash_63827b1d4c75136f", 1, 1, "counter", &function_95de8f96, 1, 0);
    clientfield::register("scriptmover", "" + #"hash_4d733389a8e35a7c", 1, 1, "int", &function_ee968813, 1, 0);
    clientfield::register("actor", "" + #"hash_2b842a4f17120dfb", 1, 1, "counter", &function_4fdf03e7, 1, 0);
    clientfield::register("vehicle", "" + #"hash_2b842a4f17120dfb", 1, 1, "counter", &function_4fdf03e7, 1, 0);
    clientfield::register("actor", "" + #"hash_2bb63677db4333d4", 1, 1, "int", &function_61659b2f, 1, 0);
    clientfield::register("toplayer", "" + #"swordpistol_rumble", 1, 3, "counter", &swordpistol_rumble, 0, 0);
    level._effect[#"hash_25626300bbf56aa7"] = #"hash_6a8080a7153541f6";
    level._effect[#"hash_67085795f324f6b5"] = #"hash_6a8080a7153541f6";
    level._effect[#"hash_72dcd3be23419b87"] = #"hash_597abd90e7ff80e0";
    level._effect[#"hash_2cce5c832c2c19be"] = #"hash_358368e2fa3ca4f1";
    level._effect[#"hash_6890c4ba9ae61d0b"] = #"hash_28918c31efbce546";
    level._effect[#"hash_206a58239ffb5e0f"] = #"hash_73d097f983d47f3c";
    level._effect[#"hash_4d733389a8e35a7c"] = #"hash_2ecc9e78037c5407";
    level._effect[#"hash_2b842a4f17120dfb"] = #"hash_571fb567ca3d4add";
    level._effect[#"hash_b784dd4d224f7e"] = #"hash_90808e1ff32f322";
    level._effect[#"hash_513a7427138027da"] = #"hash_128e20307b969081";
    level._effect[#"hash_63827b1d4c75136f"] = #"hash_1d90aa9406e48582";
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 7, eflags: 0x1 linked
// Checksum 0xf5f04db3, Offset: 0x7e0
// Size: 0x94
function function_8e1552b1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_25626300bbf56aa7"], self, "j_spine4");
    self playrumbleonentity(localclientnum, "damage_heavy");
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 7, eflags: 0x1 linked
// Checksum 0x52a243b6, Offset: 0x880
// Size: 0x94
function function_6831ee4b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_67085795f324f6b5"], self, "j_spine4");
    self playrumbleonentity(localclientnum, "damage_heavy");
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 7, eflags: 0x1 linked
// Checksum 0x86d1f4b7, Offset: 0x920
// Size: 0xa4
function function_c0d25f27(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_513a7427138027da"], self, self zm_utility::function_467efa7b());
    self playsound(0, #"hash_7272d200a14dfe79");
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 7, eflags: 0x1 linked
// Checksum 0xf629018e, Offset: 0x9d0
// Size: 0x94
function function_95de8f96(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    playfx(localclientnum, level._effect[#"hash_63827b1d4c75136f"], self.origin);
    self playsound(0, #"hash_5e5fc609282c18d2");
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 7, eflags: 0x1 linked
// Checksum 0x39a7a21c, Offset: 0xa70
// Size: 0xd0
function function_ee968813(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.fx_trail = util::playfxontag(localclientnum, level._effect[#"hash_4d733389a8e35a7c"], self, "tag_origin");
        if (!isdefined(self.snd_looper)) {
        }
    } else {
        if (isdefined(self.fx_trail)) {
            stopfx(localclientnum, self.fx_trail);
        }
        if (isdefined(self.snd_looper)) {
        }
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 7, eflags: 0x1 linked
// Checksum 0xa615379, Offset: 0xb48
// Size: 0xa4
function function_4fdf03e7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_2b842a4f17120dfb"], self, self zm_utility::function_467efa7b());
    self playsound(0, #"hash_3098cba1f74bb5d1");
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 7, eflags: 0x1 linked
// Checksum 0xe6291829, Offset: 0xbf8
// Size: 0x1b4
function function_61659b2f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.var_cc9c5baa = util::playfxontag(localclientnum, level._effect[#"hash_206a58239ffb5e0f"], self, "j_spine4");
        if (!isdefined(self.var_6450813b)) {
            self playsound(localclientnum, #"hash_76feff9b8f93c3d9");
            self.var_6450813b = self playloopsound(#"hash_117558f0dda6471f");
        }
    } else {
        if (isdefined(self.var_cc9c5baa)) {
            stopfx(localclientnum, self.var_cc9c5baa);
        }
        if (isdefined(self.var_6450813b)) {
            self playsound(localclientnum, #"hash_ae4b548c1d4a748");
            self stoploopsound(self.var_6450813b);
            self.var_6450813b = undefined;
        }
        util::playfxontag(localclientnum, level._effect[#"hash_b784dd4d224f7e"], self, "j_spine4");
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 7, eflags: 0x1 linked
// Checksum 0xe891e147, Offset: 0xdb8
// Size: 0xfa
function swordpistol_rumble(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue) {
        switch (newvalue) {
        case 2:
            self playrumbleonentity(localclientnum, "zm_weap_swordpistol_melee_rumble");
            break;
        case 4:
            self playrumbleonentity(localclientnum, "zm_weap_swordpistol_shoot_rumble");
            break;
        case 5:
            self playrumbleonentity(localclientnum, "zm_weap_swordpistol_special_rumble");
            break;
        }
    }
}

