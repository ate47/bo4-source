// Atian COD Tools GSC decompiler test
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_orange_lighthouse;

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0, eflags: 0x2
// Checksum 0x840a44b3, Offset: 0x168
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_orange_lighthouse", &__init__, undefined, undefined);
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0, eflags: 0x1 linked
// Checksum 0xb57b77d3, Offset: 0x1b0
// Size: 0x3c
function __init__() {
    init_clientfields();
    init_fx();
    forcestreamxmodel("p8_zm_ora_soapstone_01_hot");
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0, eflags: 0x1 linked
// Checksum 0x69b98c7d, Offset: 0x1f8
// Size: 0xfc
function init_clientfields() {
    clientfield::register("scriptmover", "lighthouse_on", 24000, 3, "int", &function_6a10478, 0, 0);
    clientfield::register("vehicle", "" + #"hash_19bce46b8ab82440", 24000, 1, "int", &function_c7fb0e97, 0, 0);
    clientfield::register("actor", "" + #"hash_5af1cd27f90895ae", 24000, 1, "counter", &function_a177b2da, 0, 0);
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0, eflags: 0x1 linked
// Checksum 0xf3470a9f, Offset: 0x300
// Size: 0x152
function init_fx() {
    level._effect[#"lighthouse_beam"] = #"hash_5549637de48b4ff5";
    level._effect[#"hash_4eeea3cde4956976"] = #"hash_52b7a2fb71b00d26";
    level._effect[#"hash_33dbdabd23d73303"] = #"hash_1806470e7079c133";
    level._effect[#"hash_21a180bd19425da5"] = #"hash_5cd0d0e65e6d535";
    level._effect[#"hash_58fef59f738c6315"] = #"explosions/fx8_exp_elec_killstreak";
    level._effect[#"hash_48d5d5ee69c7e417"] = #"hash_64be6c1537ad552e";
    level._effect[#"hash_4d1abbf031ca2c63"] = #"hash_6144e721b78e74a4";
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 7, eflags: 0x1 linked
// Checksum 0x1e96745d, Offset: 0x460
// Size: 0x51a
function function_6a10478(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.fx_id)) {
        stopfx(localclientnum, self.fx_id);
        if (isdefined(self.var_190322ee)) {
            self.var_190322ee stoploopsound(1);
            self.var_190322ee delete();
        }
    }
    switch (newval) {
    case 1:
        if (isdefined(self.var_190322ee)) {
            self.var_190322ee stoploopsound(1);
            self.var_190322ee delete();
        }
        self.fx_id = util::playfxontag(localclientnum, level._effect[#"lighthouse_beam"], self, "tag_origin");
        self playsound(localclientnum, #"hash_c28cead5117620");
        self.var_190322ee = spawn(0, self.origin, "script_origin");
        self.var_190322ee playloopsound(#"hash_6181b0e69ec35a3b");
        return;
    case 2:
        if (isdefined(self.var_190322ee)) {
            self.var_190322ee stoploopsound(1);
            self.var_190322ee delete();
        }
        self.fx_id = util::playfxontag(localclientnum, level._effect[#"hash_4eeea3cde4956976"], self, "tag_origin");
        self playsound(localclientnum, #"hash_261c471e4722bb37");
        self.var_190322ee = spawn(0, self.origin, "script_origin");
        self.var_190322ee playloopsound(#"hash_b838aafaa7056a0");
        return;
    case 3:
        if (isdefined(self.var_190322ee)) {
            self.var_190322ee stoploopsound(1);
            self.var_190322ee delete();
        }
        self.fx_id = util::playfxontag(localclientnum, level._effect[#"hash_33dbdabd23d73303"], self, "tag_origin");
        self playsound(localclientnum, #"hash_153e70c4ae966276");
        self.var_190322ee = spawn(0, self.origin, "script_origin");
        self.var_190322ee playloopsound(#"hash_764437252a54048d");
        return;
    case 4:
        if (isdefined(self.var_190322ee)) {
            self.var_190322ee stoploopsound(1);
            self.var_190322ee delete();
        }
        self.fx_id = util::playfxontag(localclientnum, level._effect[#"hash_21a180bd19425da5"], self, "tag_origin");
        self playsound(localclientnum, #"hash_3734fecc702f7cd0");
        self.var_190322ee = spawn(0, self.origin, "script_origin");
        self.var_190322ee playloopsound(#"hash_518712532057a8b");
        return;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 7, eflags: 0x1 linked
// Checksum 0xa1f475fc, Offset: 0x988
// Size: 0x9c
function function_a177b2da(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_4d1abbf031ca2c63"], self, "j_spine4");
    self playsound(localclientnum, #"hash_24925b24b30b3991");
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 7, eflags: 0x1 linked
// Checksum 0x99c8c73f, Offset: 0xa30
// Size: 0x152
function function_c7fb0e97(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_85adeb8c)) {
        beamkill(localclientnum, self.var_85adeb8c);
        self.var_85adeb8c = undefined;
    }
    if (isdefined(self.var_9c7e4ef8)) {
        stopfx(localclientnum, self.var_9c7e4ef8);
    }
    if (newval > 0) {
        var_ab11c23d = getent(localclientnum, "lighthouse_light", "targetname");
        self.var_85adeb8c = level beam::function_cfb2f62a(localclientnum, var_ab11c23d, "tag_origin", self, "tag_origin", "beam8_zm_orange_lighthouse_trap_strike");
        self.var_9c7e4ef8 = util::playfxontag(localclientnum, level._effect[#"hash_48d5d5ee69c7e417"], self, "tag_origin");
    }
}

