// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm\zm_lightning_chain.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\beam_shared.csc;

#namespace zm_weap_hand_hemera;

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x2
// Checksum 0x56bd2741, Offset: 0x190
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_hand_hemera", &__init__, undefined, undefined);
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x5f1e636f, Offset: 0x1d8
// Size: 0x40a
function __init__() {
    clientfield::register("scriptmover", "hemera_shoot", 16000, 1, "counter", &hemera_shoot_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"hemera_beam", 16000, 1, "int", &function_70e72eac, 0, 0);
    clientfield::register("scriptmover", "" + #"hemera_impact", 16000, 1, "counter", &hemera_impact_fx, 0, 0);
    clientfield::register("allplayers", "hemera_proj_flash", 16000, 1, "int", &function_c6d1bdb0, 0, 0);
    clientfield::register("allplayers", "hemera_beam_flash", 16000, 1, "int", &function_68e9fdbb, 0, 0);
    clientfield::register("actor", "hemera_proj_death", 16000, 1, "int", &function_ab086ad8, 0, 0);
    clientfield::register("actor", "" + #"hash_5a8f1796382ec694", 16000, 1, "int", &function_3fd7be85, 0, 0);
    level._effect[#"hemera_shoot"] = #"hash_520fd2427c5fcea3";
    level._effect[#"hash_b9d4268e0a3bccc"] = #"hash_2de436091e3fa43c";
    level._effect[#"hash_ba44e68e0a9efde"] = #"hash_2deb42091e45d74e";
    level._effect[#"hemera_proj_death_head"] = #"hash_57ff7c670774f7d";
    level._effect[#"hash_209c29b7e6706274"] = #"hash_47fe9ffe78c83012";
    level._effect[#"hash_1c1dafe5ebd971f8"] = #"hash_6400b8e89418b50e";
    level._effect[#"hash_55fc6dcb648e2b70"] = #"hash_5493d96403f608c6";
    level._effect[#"hash_3115c2658b6e4e0"] = #"hash_3b0b9cc4cdb70c89";
    level._effect[#"hash_318682658bd17f2"] = #"hash_3b12a8c4cdbd3f9b";
    level._effect[#"hash_5a8f1796382ec694"] = #"hash_cb5ab216f90ba29";
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 7, eflags: 0x1 linked
// Checksum 0x3a009c66, Offset: 0x5f0
// Size: 0x21c
function hemera_impact_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self gettagorigin("j_wingulna_le"))) {
        v_org = self gettagorigin("j_h_neck_lower");
    } else if (isdefined(self gettagorigin("j_spine4"))) {
        v_org = self gettagorigin("j_spine4");
    } else {
        v_org = self.origin;
    }
    v_forward = anglestoforward(self.angles) * 1000 + self.origin;
    v_back = anglestoforward(self.angles) * -100 + self.origin;
    a_trace = bullettrace(v_back, v_forward, 0, self);
    if (isdefined(a_trace[#"normal"])) {
        v_ang = a_trace[#"normal"];
    } else {
        v_ang = anglestoforward(self.angles) * -1;
    }
    playfx(localclientnum, level._effect[#"hash_55fc6dcb648e2b70"], v_org, v_ang);
    playsound(localclientnum, #"hash_6e5604c8cf7c55c0", self.origin);
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 7, eflags: 0x1 linked
// Checksum 0x59f617a4, Offset: 0x818
// Size: 0x2dc
function function_ab086ad8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdefined(self gettagorigin("j_spine4"))) {
            self.var_d3316606 = util::playfxontag(localclientnum, level._effect[#"hash_209c29b7e6706274"], self, "j_spine4");
        } else {
            self.var_d3316606 = util::playfxontag(localclientnum, level._effect[#"hash_209c29b7e6706274"], self, zm_utility::function_467efa7b());
        }
        if (isdefined(self gettagorigin("j_eyeball_le"))) {
            self.var_1550c80f = util::playfxontag(localclientnum, level._effect[#"hemera_proj_death_head"], self, "j_eyeball_le");
        }
        self playsound(localclientnum, #"hash_70717b71f19db790");
        return;
    }
    if (isdefined(self) && isdefined(self.var_d3316606)) {
        deletefx(localclientnum, self.var_d3316606);
        self.var_d3316606 = undefined;
    }
    if (isdefined(self) && isdefined(self.var_1550c80f)) {
        deletefx(localclientnum, self.var_1550c80f);
        self.var_1550c80f = undefined;
    }
    if (isdefined(self)) {
        self playsound(localclientnum, #"hash_3fbc22745dc90009");
        if (isdefined(self gettagorigin("j_spine4"))) {
            util::playfxontag(localclientnum, level._effect[#"hash_1c1dafe5ebd971f8"], self, "j_spine4");
            return;
        }
        util::playfxontag(localclientnum, level._effect[#"hash_1c1dafe5ebd971f8"], self, zm_utility::function_467efa7b());
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 7, eflags: 0x1 linked
// Checksum 0xcf44758f, Offset: 0xb00
// Size: 0xaa
function hemera_shoot_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    util::playfxontag(localclientnum, level._effect[#"hemera_shoot"], self, "tag_origin");
    if (!isdefined(self.sndlooper)) {
        self.sndlooper = self playloopsound(#"hash_3f6858ef82b8b066");
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 7, eflags: 0x1 linked
// Checksum 0x1fb1b977, Offset: 0xbb8
// Size: 0x154
function function_c6d1bdb0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    if (!self hasdobj(localclientnum)) {
        return;
    }
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (newval == 1) {
        if (self zm_utility::function_f8796df3(localclientnum)) {
            if (viewmodelhastag(localclientnum, "tag_flash")) {
                playviewmodelfx(localclientnum, level._effect[#"hash_b9d4268e0a3bccc"], "tag_flash");
            }
            return;
        }
        if (isdefined(self gettagorigin("tag_flash"))) {
            util::playfxontag(localclientnum, level._effect[#"hash_ba44e68e0a9efde"], self, "tag_flash");
        }
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 7, eflags: 0x1 linked
// Checksum 0x9c175820, Offset: 0xd18
// Size: 0x19a
function function_68e9fdbb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    if (!self hasdobj(localclientnum)) {
        return;
    }
    if (isdefined(self.fx_muzzle_flash)) {
        deletefx(localclientnum, self.fx_muzzle_flash);
        self.fx_muzzle_flash = undefined;
    }
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (newval == 1) {
        if (self zm_utility::function_f8796df3(localclientnum)) {
            if (viewmodelhastag(localclientnum, "tag_flash")) {
                self.fx_muzzle_flash = playviewmodelfx(localclientnum, level._effect[#"hash_3115c2658b6e4e0"], "tag_flash");
            }
            return;
        }
        if (isdefined(self gettagorigin("tag_flash"))) {
            self.fx_muzzle_flash = util::playfxontag(localclientnum, level._effect[#"hash_318682658bd17f2"], self, "tag_flash");
        }
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 7, eflags: 0x1 linked
// Checksum 0x5a8863d9, Offset: 0xec0
// Size: 0xac
function function_70e72eac(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death", #"disconnect");
    self function_f1f34b1b(localclientnum);
    if (newval > 0) {
        self thread function_4662df7a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0xc7c20a02, Offset: 0xf78
// Size: 0xc6
function function_f1f34b1b(localclientnum) {
    if (!isdefined(self)) {
        return;
    }
    self notify(#"hash_3cbfa1076dfa868b");
    if (isdefined(self.var_d559073)) {
        beamkill(localclientnum, self.var_d559073);
        self.var_d559073 = undefined;
    }
    if (isdefined(self.var_76385ab5)) {
        self.var_76385ab5 delete();
        self.var_76385ab5 = undefined;
    }
    if (isdefined(self.var_4cd8e6cb)) {
        self stoploopsound(self.var_4cd8e6cb);
        self.var_4cd8e6cb = undefined;
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 7, eflags: 0x1 linked
// Checksum 0xdf678fd5, Offset: 0x1048
// Size: 0x17a
function function_4662df7a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death", #"hash_3cbfa1076dfa868b");
    if (!isdefined(self.var_4cd8e6cb)) {
        self.var_4cd8e6cb = self playloopsound(#"hash_289b15dba7547241");
    }
    v_trace = bullettrace(self.origin, self.origin + vectorscale((0, 0, 1), 4000), 0, self)[#"position"];
    self.var_76385ab5 = util::spawn_model(localclientnum, "tag_origin", self.origin + vectorscale((0, 0, 1), 4000));
    self.var_76385ab5 linkto(self);
    self.var_f53452ad = level beam::function_cfb2f62a(localclientnum, self.var_76385ab5, "tag_origin", self, "tag_origin", "beam8_zm_ww_hemera_ray");
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 7, eflags: 0x1 linked
// Checksum 0x94391d01, Offset: 0x11d0
// Size: 0x124
function function_3fd7be85(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self gettagorigin("j_wingulna_le"))) {
        v_org = self gettagorigin("j_h_neck_lower");
    } else if (isdefined(self gettagorigin("j_spine4"))) {
        v_org = self gettagorigin("j_spine4");
    } else {
        v_org = self.origin;
    }
    playfx(localclientnum, level._effect[#"hash_5a8f1796382ec694"], v_org, anglestoforward(self.angles));
}

