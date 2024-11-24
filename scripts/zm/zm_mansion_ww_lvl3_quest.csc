#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm\ai\zm_ai_stoker;
#using scripts\zm_common\load;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_sq_modules;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_wallbuy;
#using scripts\zm_common\zm_weapons;

#namespace mansion_ww_lvl3_quest;

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x44786535, Offset: 0x110
// Size: 0x5a2
function init() {
    if (zm_custom::function_901b751c(#"zmwonderweaponisenabled")) {
        clientfield::register("scriptmover", "" + #"hash_63ffcbb6c8f4bc11", 8000, 1, "int", &function_41ad73f5, 0, 0);
        clientfield::register("scriptmover", "" + #"hash_62ee80337662b3cd", 8000, 1, "int", &function_3ab850d6, 0, 0);
        clientfield::register("scriptmover", "" + #"hash_7ef82b98770c5c0d", 8000, 1, "int", &function_c08eda18, 0, 0);
        clientfield::register("scriptmover", "" + #"hash_c0e8acbde8dbc06", 8000, 1, "int", &function_9c99bb9c, 0, 0);
        clientfield::register("vehicle", "" + #"hash_6ded20ebb8e016ba", 8000, 1, "int", &function_d19e8c30, 0, 0);
        clientfield::register("scriptmover", "" + #"hash_48c6d058e9587c19", 8000, 1, "int", &function_2a76a74e, 0, 0);
        clientfield::register("world", "" + #"hash_19f5ea0e9b3d47f3", 8000, 1, "int", &function_6bc1e300, 0, 0);
        clientfield::register("scriptmover", "" + #"hash_486960f190957256", 8000, 1, "int", &function_fdbcb111, 0, 0);
        clientfield::register("scriptmover", "" + #"hash_12e4702a9346b3d9", 8000, 1, "int", &function_d96d1ec8, 0, 0);
        clientfield::register("scriptmover", "" + #"ww_lvl3_crafting_table_fx", 8000, 1, "int", &ww_lvl3_crafting_table_fx, 0, 0);
        level._effect[#"hash_63ffcbb6c8f4bc11"] = #"hash_9c1cc9cff68a30b";
        level._effect[#"hash_62ee80337662b3cd"] = #"hash_d49412589217ae5";
        level._effect[#"hash_7ef82b98770c5c0d"] = #"hash_5faeba7ac14ce809";
        level._effect[#"hash_48c6d058e9587c19"] = #"hash_26219308102ab88";
        level._effect[#"hash_1789fef86cd8b57e"] = #"hash_6155f098cde9b5d6";
        level._effect[#"hash_6ded20ebb8e016ba"] = #"hash_12294859753682f";
        level._effect[#"hash_c0e8acbde8dbc06"] = #"hash_3c302e20c7521265";
        level._effect[#"hash_1e5190677354bcbb"] = #"hash_43db5529d30606a4";
        level._effect[#"hash_12e4702a9346b3d9"] = #"hash_6f5790d353dd5caf";
        level._effect[#"hash_486960f190957256"] = #"hash_6c903fa4abc8dbaa";
        level._effect[#"ww_lvl3_crafting_table_fx"] = #"hash_2a894b9650914bb6";
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xe16da332, Offset: 0x6c0
// Size: 0xb2
function function_41ad73f5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_30b1857a)) {
        stopfx(localclientnum, self.var_30b1857a);
        self.var_30b1857a = undefined;
    }
    if (newval) {
        self.var_30b1857a = util::playfxontag(localclientnum, level._effect[#"hash_63ffcbb6c8f4bc11"], self, "tag_origin");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x26ba68cf, Offset: 0x780
// Size: 0xb2
function function_3ab850d6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_30b1857a)) {
        stopfx(localclientnum, self.var_30b1857a);
        self.var_30b1857a = undefined;
    }
    if (newval) {
        self.var_30b1857a = util::playfxontag(localclientnum, level._effect[#"hash_62ee80337662b3cd"], self, "tag_origin");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xabbe797d, Offset: 0x840
// Size: 0x7c
function function_c08eda18(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        playfx(localclientnum, level._effect[#"hash_7ef82b98770c5c0d"], self.origin);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x2f76424d, Offset: 0x8c8
// Size: 0xea
function function_d19e8c30(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_7dbec3d0)) {
        stopfx(localclientnum, self.var_7dbec3d0);
        self.var_7dbec3d0 = undefined;
    }
    if (newval) {
        if (self.archetype === #"bat") {
            str_tag = "tag_chest_ws";
        } else {
            str_tag = "tag_origin";
        }
        self.var_7dbec3d0 = self util::playfxontag(localclientnum, level._effect[#"hash_6ded20ebb8e016ba"], self, str_tag);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x5329bcdb, Offset: 0x9c0
// Size: 0x74
function function_9c99bb9c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::playfxontag(localclientnum, level._effect[#"hash_c0e8acbde8dbc06"], self, "tag_origin");
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xf3419159, Offset: 0xa40
// Size: 0xea
function function_2a76a74e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_25092f46)) {
        stopfx(localclientnum, self.var_25092f46);
        self.var_25092f46 = undefined;
        playfx(localclientnum, level._effect[#"hash_1789fef86cd8b57e"], self.origin);
    }
    if (newval) {
        self.var_25092f46 = self util::playfxontag(localclientnum, level._effect[#"hash_48c6d058e9587c19"], self, "tag_origin");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x3e1e1f38, Offset: 0xb38
// Size: 0x8c
function function_6bc1e300(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel(#"hash_36f02881e6dba006");
        return;
    }
    stopforcestreamingxmodel(#"hash_36f02881e6dba006");
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x68bf350a, Offset: 0xbd0
// Size: 0xb2
function function_fdbcb111(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_ebc53fb1)) {
        stopfx(localclientnum, self.var_ebc53fb1);
        self.var_ebc53fb1 = undefined;
    }
    if (newval) {
        self.var_ebc53fb1 = util::playfxontag(localclientnum, level._effect[#"hash_486960f190957256"], self, "tag_origin");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x0
// Checksum 0x2f81538c, Offset: 0xc90
// Size: 0x7c
function function_ea733c8f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        util::playfxontag(localclientnum, level._effect[#"hash_1e5190677354bcbb"], self, "tag_origin");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x8224004e, Offset: 0xd18
// Size: 0xb2
function function_d96d1ec8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_aea9f9ea)) {
        stopfx(localclientnum, self.var_aea9f9ea);
        self.var_aea9f9ea = undefined;
    }
    if (newval) {
        self.var_aea9f9ea = self util::playfxontag(localclientnum, level._effect[#"hash_12e4702a9346b3d9"], self, "tag_origin");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x4c79fc, Offset: 0xdd8
// Size: 0xb2
function ww_lvl3_crafting_table_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_88119a0f)) {
        stopfx(localclientnum, self.var_88119a0f);
        self.var_88119a0f = undefined;
    }
    if (newval) {
        self.var_88119a0f = util::playfxontag(localclientnum, level._effect[#"ww_lvl3_crafting_table_fx"], self, "tag_origin");
    }
}

