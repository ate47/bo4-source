// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_weapons.csc;
#include scripts/zm_common/zm_utility.csc;
#include scripts/zm_common/zm_hero_weapon.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/math_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/beam_shared.csc;
#include scripts/core_common/array_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_weap_crossbow;

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x2
// Checksum 0x3d4207a7, Offset: 0x220
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_crossbow", &__init__, undefined, undefined);
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x1 linked
// Checksum 0xfde3d248, Offset: 0x268
// Size: 0x50c
function __init__() {
    level._effect[#"hash_37c2ef99d645cf87"] = #"hash_446cf10b26252043";
    level._effect[#"hash_690509b9a2ec2ef3"] = #"hash_75b48b8b912d1e41";
    level._effect[#"hash_25f2b145ee5374d9"] = #"hash_11321db507e6caf1";
    level._effect[#"hash_389b5fcf2a0e0690"] = #"hash_794c542edfcb65cb";
    level._effect[#"hash_665c75d58cefe3d1"] = #"hash_794c532edfcb6418";
    level._effect[#"hash_25f9bd45ee59a7eb"] = #"hash_7872962edf123231";
    level._effect[#"hash_38a26bcf2a1439a2"] = #"hash_5b37197a43afded7";
    level._effect[#"hash_666361d58cf5e083"] = #"hash_2f290373e23f9616";
    level._effect[#"hash_70d2a1e399efcc91"] = #"hash_50be4928aa2fb3d4";
    level._effect[#"hash_70d98de399f5c943"] = #"hash_50c53528aa35b086";
    level._effect[#"hash_650bbbea29506d1e"] = #"hash_2b4f0b7b45b86a3d";
    level._effect[#"hash_cfd019f2f01e866"] = #"hash_2c30b8327eb9deaa";
    level.var_7cfd8159 = [];
    clientfield::register("missile", "" + #"hash_6308b5ed3cbd99e3", 1, 1, "counter", &function_75a608a3, 0, 0);
    clientfield::register("actor", "" + #"hash_37c2ef99d645cf87", 1, 1, "int", &function_8635aaf9, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_37c2ef99d645cf87", 1, 1, "int", &function_8635aaf9, 0, 0);
    clientfield::register("actor", "" + #"hash_690509b9a2ec2ef3", 1, 2, "int", &function_59a204ea, 0, 0);
    clientfield::register("allplayers", "" + #"hash_290836b72f987780", 1, 1, "int", &function_b6e5e889, 0, 1);
    clientfield::register("allplayers", "" + #"hash_faa2f4808c12f8d", 1, 1, "int", &function_bec8c33, 0, 1);
    clientfield::register("allplayers", "" + #"hash_6c3560ab45e186ec", 1, 1, "counter", &function_fc035b41, 0, 0);
    clientfield::register("allplayers", "" + #"hash_b38c687db71dae", 1, 1, "int", &function_7157628d, 0, 1);
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 7, eflags: 0x1 linked
// Checksum 0x944c5d12, Offset: 0x780
// Size: 0x1a0
function function_7157628d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (!isdefined(self.var_b00e8bda)) {
        self.var_b00e8bda = [];
    }
    if (newval) {
        self util::waittill_dobj(localclientnum);
        if (self zm_utility::function_5d8fd5f3(localclientnum)) {
            self.var_b00e8bda[localclientnum] = playtagfxset(localclientnum, "weapon_zm_scorpion_1p", self);
        } else {
            self.var_b00e8bda[localclientnum] = playtagfxset(localclientnum, "weapon_zm_scorpion_3p", self);
        }
    } else if (isdefined(self.var_b00e8bda[localclientnum])) {
        foreach (fx in self.var_b00e8bda[localclientnum]) {
            killfx(localclientnum, fx);
        }
        localclientnum = [];
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 7, eflags: 0x1 linked
// Checksum 0xd6724e6a, Offset: 0x928
// Size: 0x74
function function_75a608a3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    playfx(localclientnum, level._effect[#"hash_650bbbea29506d1e"], self.origin);
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 7, eflags: 0x1 linked
// Checksum 0x49e7714c, Offset: 0x9a8
// Size: 0x1a0
function function_bec8c33(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (!isdefined(self.var_db5b9ebb)) {
        self.var_db5b9ebb = [];
    }
    if (newval) {
        self util::waittill_dobj(localclientnum);
        if (self zm_utility::function_5d8fd5f3(localclientnum)) {
            self.var_db5b9ebb[localclientnum] = playtagfxset(localclientnum, "weapon_zm_scorpion_charged_1p", self);
        } else {
            self.var_db5b9ebb[localclientnum] = playtagfxset(localclientnum, "weapon_zm_scorpion_charged_3p", self);
        }
    } else if (isdefined(self.var_db5b9ebb[localclientnum])) {
        foreach (fx in self.var_db5b9ebb[localclientnum]) {
            killfx(localclientnum, fx);
        }
        localclientnum = [];
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 7, eflags: 0x1 linked
// Checksum 0xf7e9a3c6, Offset: 0xb50
// Size: 0xfc
function function_b6e5e889(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (!isdefined(self.var_db5b9ebb)) {
        self.var_db5b9ebb = [];
    }
    if (newval) {
        self util::waittill_dobj(localclientnum);
        if (!isdefined(self.var_59bda7f4)) {
            if (self zm_utility::function_5d8fd5f3(localclientnum)) {
                self thread function_2509f629(localclientnum, 1);
            } else {
                self thread function_2509f629(localclientnum, 0);
            }
        }
    } else {
        self thread function_a7ca9a9f(localclientnum);
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 2, eflags: 0x1 linked
// Checksum 0xbf8b6f0b, Offset: 0xc58
// Size: 0x2f2
function function_2509f629(localclientnum, var_77e629d2 = 1) {
    self endon(#"death", #"hash_2fb51b31de21bda9");
    if (var_77e629d2 && viewmodelhastag(localclientnum, "tag_flash2")) {
        self.var_59bda7f4 = playviewmodelfx(localclientnum, level._effect[#"hash_25f2b145ee5374d9"], "tag_flash2");
    } else if (!var_77e629d2 && isdefined(self gettagorigin("tag_flash2"))) {
        self.var_59bda7f4 = util::playfxontag(localclientnum, level._effect[#"hash_25f9bd45ee59a7eb"], self, "tag_flash2");
    }
    wait(0.5);
    if (var_77e629d2 && viewmodelhastag(localclientnum, "tag_flash2")) {
        self.var_b43205fd = playviewmodelfx(localclientnum, level._effect[#"hash_389b5fcf2a0e0690"], "tag_flash2");
    } else if (!var_77e629d2 && isdefined(self gettagorigin("tag_flash2"))) {
        self.var_b43205fd = util::playfxontag(localclientnum, level._effect[#"hash_38a26bcf2a1439a2"], self, "tag_flash2");
    }
    wait(0.5);
    if (var_77e629d2 && viewmodelhastag(localclientnum, "tag_flash2")) {
        self.var_33fb8596 = playviewmodelfx(localclientnum, level._effect[#"hash_665c75d58cefe3d1"], "tag_flash2");
    } else if (!var_77e629d2 && isdefined(self gettagorigin("tag_flash2"))) {
        self.var_33fb8596 = util::playfxontag(localclientnum, level._effect[#"hash_666361d58cf5e083"], self, "tag_flash2");
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0x84f29bb9, Offset: 0xf58
// Size: 0xc6
function function_a7ca9a9f(localclientnum) {
    self notify(#"hash_2fb51b31de21bda9");
    if (isdefined(self.var_59bda7f4)) {
        stopfx(localclientnum, self.var_59bda7f4);
        self.var_59bda7f4 = undefined;
    }
    if (isdefined(self.var_b43205fd)) {
        killfx(localclientnum, self.var_b43205fd);
        self.var_b43205fd = undefined;
    }
    if (isdefined(self.var_33fb8596)) {
        killfx(localclientnum, self.var_33fb8596);
        self.var_33fb8596 = undefined;
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 7, eflags: 0x1 linked
// Checksum 0xa69dab51, Offset: 0x1028
// Size: 0x11c
function function_fc035b41(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (self zm_utility::function_5d8fd5f3(localclientnum) && viewmodelhastag(localclientnum, "tag_flash2")) {
            playviewmodelfx(localclientnum, level._effect[#"hash_70d2a1e399efcc91"], "tag_flash2");
        } else if (isdefined(self gettagorigin("tag_flash2"))) {
            util::playfxontag(localclientnum, level._effect[#"hash_70d98de399f5c943"], self, "tag_flash2");
        }
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 7, eflags: 0x1 linked
// Checksum 0x18cf8326, Offset: 0x1150
// Size: 0x33e
function function_8635aaf9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_tag = "j_spine4";
    v_origin = self gettagorigin("j_spine4");
    if (!isdefined(v_origin)) {
        str_tag = "tag_origin";
    }
    if (newval) {
        self.var_2c2980d3 = 1;
        if (!isdefined(level.var_7cfd8159)) {
            level.var_7cfd8159 = [];
        } else if (!isarray(level.var_7cfd8159)) {
            level.var_7cfd8159 = array(level.var_7cfd8159);
        }
        if (!isinarray(level.var_7cfd8159, self)) {
            level.var_7cfd8159[level.var_7cfd8159.size] = self;
        }
        if (!isdefined(self.var_7a5134d5)) {
            self.var_7a5134d5 = util::playfxontag(localclientnum, level._effect[#"hash_37c2ef99d645cf87"], self, str_tag);
        }
        if (math::cointoss(25) && !isdefined(self.var_f6e0481f)) {
            self.var_f6e0481f = util::playfxontag(localclientnum, level._effect[#"hash_cfd019f2f01e866"], self, "j_eyeball_le");
        }
        if (!isdefined(self.var_f80659e1)) {
            self playsound(localclientnum, "wpn_scorpion_zombie_impact");
            self.var_f80659e1 = self playloopsound("wpn_scorpion_zombie_lp", 1);
        }
    } else {
        self.var_2c2980d3 = undefined;
        arrayremovevalue(level.var_7cfd8159, self);
        if (isdefined(self.var_7a5134d5)) {
            stopfx(localclientnum, self.var_7a5134d5);
            self.var_7a5134d5 = undefined;
        }
        if (isdefined(self.var_f6e0481f)) {
            stopfx(localclientnum, self.var_f6e0481f);
            self.var_f6e0481f = undefined;
        }
        if (isdefined(self.var_f80659e1)) {
            self playsound(localclientnum, "wpn_scorpion_zombie_explode");
            self stoploopsound(self.var_f80659e1);
            self.var_f80659e1 = undefined;
        }
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 7, eflags: 0x1 linked
// Checksum 0xb64afaf6, Offset: 0x1498
// Size: 0x1f6
function function_59a204ea(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_tag = "j_spine4";
    v_origin = self gettagorigin("j_spine4");
    if (!isdefined(v_origin)) {
        str_tag = "tag_origin";
    }
    if (newval) {
        self.var_427e5396 = 1;
        if (!isdefined(self.var_4c76eab4)) {
            self.var_4c76eab4 = util::playfxontag(localclientnum, level._effect[#"hash_690509b9a2ec2ef3"], self, str_tag);
            if (newval == 2) {
                self thread function_98530904(localclientnum, 1);
            } else {
                self thread function_98530904(localclientnum, 0);
            }
        }
        if (!isdefined(self.var_4c74325a)) {
            self playsound(localclientnum, "wpn_scorpion_zombie_impact");
            self.var_4c74325a = self playloopsound("wpn_scorpion_zombie_lp", 1);
        }
    } else {
        self.var_427e5396 = undefined;
        if (isdefined(self.var_4c76eab4)) {
            stopfx(localclientnum, self.var_4c76eab4);
        }
        if (isdefined(self.var_4c74325a)) {
            self stoploopsound(self.var_4c74325a);
            self.var_4c74325a = undefined;
        }
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 2, eflags: 0x1 linked
// Checksum 0xb13b3ae7, Offset: 0x1698
// Size: 0x1c4
function function_98530904(localclientnum, b_charged = 0) {
    if (b_charged) {
        var_c172d994 = "beam8_elec_catalyst_arc_attack";
    } else {
        var_c172d994 = "beam8_elec_catalyst_arc_attack";
    }
    level.var_7cfd8159 = array::remove_undefined(level.var_7cfd8159);
    level.var_7cfd8159 = array::remove_dead(level.var_7cfd8159);
    var_a132edb9 = arraygetclosest(self.origin, level.var_7cfd8159, 160);
    if (isdefined(var_a132edb9)) {
        var_4479e2e1 = var_a132edb9 zm_utility::function_467efa7b();
        var_24157b39 = self zm_utility::function_467efa7b();
        var_e4ecc2aa = level beam::launch(var_a132edb9, var_4479e2e1, self, var_24157b39, var_c172d994);
        while (isdefined(self) && isdefined(var_a132edb9) && isdefined(self.var_427e5396) && self.var_427e5396 && isdefined(var_a132edb9.var_2c2980d3) && var_a132edb9.var_2c2980d3) {
            waitframe(1);
        }
        level beam::kill(var_a132edb9, var_4479e2e1, self, var_24157b39, var_c172d994);
    }
}

