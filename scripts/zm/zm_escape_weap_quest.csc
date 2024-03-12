// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm\weapons\zm_weap_tomahawk.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\array_shared.csc;

#namespace zm_escape_weap_quest;

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x2
// Checksum 0x713886e8, Offset: 0x210
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_escape_weap_quest", &__init__, undefined, undefined);
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe9b9898f, Offset: 0x258
// Size: 0x3d2
function __init__() {
    n_bits = getminbitcountfornum(4);
    clientfield::register("scriptmover", "" + #"hash_5ecbfb9042fc7f38", 1, 1, "int", &function_e4a48a64, 0, 0);
    clientfield::register("actor", "" + #"hash_588871862d19b97d", 1, 1, "int", &function_b543a4ed, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2be4ce9b84bd3b58", 1, 1, "counter", &function_1f632068, 0, 0);
    clientfield::register("actor", "" + #"hash_338ecd1287d0623b", 1, 1, "counter", &function_63eff42e, 0, 0);
    clientfield::register("scriptmover", "" + #"tomahawk_pickup_fx", 1, n_bits, "int", &function_dfe17a5d, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_51657261e835ac7c", 1, n_bits, "int", &function_724af26a, 0, 0);
    clientfield::register("toplayer", "" + #"tomahawk_pickup_fx", 13000, 1, "int", &function_1302ffdd, 0, 0);
    clientfield::register("toplayer", "" + #"hash_51657261e835ac7c", 13000, 1, "int", &function_c17bd665, 0, 0);
    level._effect[#"hell_portal"] = "maps/zm_escape/fx8_wolf_portal_hell";
    level._effect[#"hell_portal_close"] = "maps/zm_escape/fx8_wolf_portal_hell_close";
    level._effect[#"soul_charged"] = "maps/zm_escape/fx8_wolf_soul_charged";
    level._effect[#"soul_charge_start"] = "maps/zm_escape/fx8_wolf_soul_charge_start";
    level._effect[#"soul_charge_impact"] = "maps/zm_escape/fx8_wolf_soul_charge_impact_sm";
    level._effect[#"wolf_bite_blood"] = "maps/zm_escape/fx8_wolf_soul_charge_impact";
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xd9fb8728, Offset: 0x638
// Size: 0x252
function function_e4a48a64(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdefined(self.var_8eb4e749)) {
            stopfx(localclientnum, self.var_8eb4e749);
        }
        self.var_8eb4e749 = util::playfxontag(localclientnum, level._effect[#"hell_portal"], self, "tag_origin");
        self playsound(localclientnum, #"hash_6e048d37333004da");
        if (!isdefined(self.var_dd081ca4)) {
            self.var_dd081ca4 = self playloopsound(#"hash_f80ff339436a985");
        }
        return;
    }
    if (isdefined(self.var_8eb4e749)) {
        stopfx(localclientnum, self.var_8eb4e749);
        self.var_8eb4e749 = undefined;
    }
    self playsound(localclientnum, #"hash_4435f84f2c7dd54f");
    if (isdefined(self.var_dd081ca4)) {
        self stoploopsound(self.var_dd081ca4);
    }
    self.var_8eb4e749 = util::playfxontag(localclientnum, level._effect[#"hell_portal_close"], self, "tag_origin");
    wait(0.5);
    if (isdefined(self)) {
        if (isdefined(self.var_78ef40db)) {
            stopfx(localclientnum, self.var_78ef40db);
        }
        self.var_78ef40db = util::playfxontag(localclientnum, level._effect[#"soul_charged"], self, "tag_origin");
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x8dcb1735, Offset: 0x898
// Size: 0xee
function function_b543a4ed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdefined(self.var_f74c7894)) {
            stopfx(localclientnum, self.var_f74c7894);
        }
        self.var_f74c7894 = util::playfxontag(localclientnum, level._effect[#"soul_charge_start"], self, "tag_origin");
        return;
    }
    if (isdefined(self.var_f74c7894)) {
        stopfx(localclientnum, self.var_f74c7894);
        self.var_f74c7894 = undefined;
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xd8ef6797, Offset: 0x990
// Size: 0xa2
function function_1f632068(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_d634930c)) {
        stopfx(localclientnum, self.var_d634930c);
    }
    self.var_d634930c = util::playfxontag(localclientnum, level._effect[#"soul_charge_impact"], self, "TAG_MOUTH_FX");
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x85d5e8ca, Offset: 0xa40
// Size: 0xa2
function function_63eff42e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_d634930c)) {
        stopfx(localclientnum, self.var_d634930c);
    }
    self.var_d634930c = util::playfxontag(localclientnum, level._effect[#"wolf_bite_blood"], self, "TAG_MOUTH_FX");
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xb81674ad, Offset: 0xaf0
// Size: 0x13a
function function_dfe17a5d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        if (isdefined(self.n_fx_id)) {
            killfx(localclientnum, self.n_fx_id);
            self.n_fx_id = undefined;
        }
        return;
    }
    if (newval > 0) {
        e_player = getentbynum(localclientnum, newval - 1);
        a_e_players = getlocalplayers();
        if (array::contains(a_e_players, e_player)) {
            self.n_fx_id = playfx(localclientnum, level._effect[#"tomahawk_pickup"], self.origin - vectorscale((0, 0, 1), 24));
        }
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xa46cbb8c, Offset: 0xc38
// Size: 0x122
function function_724af26a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        if (isdefined(self.var_e7b65a20)) {
            killfx(localclientnum, self.var_e7b65a20);
            self.var_e7b65a20 = undefined;
        }
        return;
    }
    e_player = getentbynum(localclientnum, newval - 1);
    a_e_players = getlocalplayers();
    if (array::contains(a_e_players, e_player)) {
        self.var_e7b65a20 = util::playfxontag(localclientnum, level._effect[#"tomahawk_pickup_upgrade"], self, "tag_origin");
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xc2e3f05b, Offset: 0xd68
// Size: 0xf2
function function_1302ffdd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    var_4488630f = struct::get("s_tom_fx");
    if (isdefined(self.n_tomahawk_pickup_fx)) {
        killfx(localclientnum, self.n_tomahawk_pickup_fx);
        self.n_tomahawk_pickup_fx = undefined;
    }
    if (newval) {
        self.n_tomahawk_pickup_fx = playfx(localclientnum, level._effect[#"tomahawk_pickup"], var_4488630f.origin - vectorscale((0, 0, 1), 24));
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xf5bfbed0, Offset: 0xe68
// Size: 0xf2
function function_c17bd665(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    var_4488630f = struct::get("s_tom_fx");
    if (isdefined(self.n_tomahawk_pickup_fx)) {
        killfx(localclientnum, self.n_tomahawk_pickup_fx);
        self.n_tomahawk_pickup_fx = undefined;
    }
    if (newval) {
        self.n_tomahawk_pickup_fx = playfx(localclientnum, level._effect[#"tomahawk_pickup_upgrade"], var_4488630f.origin - vectorscale((0, 0, 1), 24));
    }
}

