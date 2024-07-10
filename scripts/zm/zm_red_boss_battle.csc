#using scripts\zm_common\zm_aoe.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\beam_shared.csc;

#namespace red_boss_battle;

// Namespace red_boss_battle/zm_red_boss_battle
// Params 0, eflags: 0x1 linked
// Checksum 0x46cbff36, Offset: 0x150
// Size: 0x426
function init() {
    clientfield::register("missile", "" + #"hash_64910f94ebb8d66a", 16000, 2, "int", &function_6e3ecc82, 0, 0);
    clientfield::register("scriptmover", "" + #"pegasus_emerge", 16000, 1, "counter", &pegasus_emerge, 0, 0);
    clientfield::register("scriptmover", "" + #"pegasus_storm", 16000, 1, "int", &function_272aa016, 0, 0);
    clientfield::register("allplayers", "" + #"hash_73e309ffb25bf63d", 16000, 1, "int", &function_a27b945a, 0, 0);
    clientfield::register("toplayer", "" + #"hash_3bb8b5cda11eecc6", 16000, 1, "counter", &function_b9329291, 0, 0);
    clientfield::register("scriptmover", "" + #"lightning_impact_fx", 16000, 1, "int", &function_ed1d0231, 0, 0);
    clientfield::register("scriptmover", "" + #"lightning_arc_fx", 16000, 1, "int", &function_37d1ee2e, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2bb63677db4333d4", 16000, 1, "int", &function_5091797, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2b842a4f17120dfb", 16000, 1, "counter", &function_e2680ff3, 0, 0);
    level._effect[#"hash_52f038f656770d3f"] = #"hash_433034414b39f1ef";
    level._effect[#"hash_52f039f656770ef2"] = #"hash_433035414b39f3a2";
    level._effect[#"hash_52f03af6567710a5"] = #"hash_7a9a94bbcf902878";
    level._effect[#"pegasus_emerge"] = #"hash_9c7935d1106ec1d";
    level._effect[#"storm_radius"] = #"hash_4dd46a244305d465";
    level.s_boss_battle = spawnstruct();
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0x8f91d013, Offset: 0x580
// Size: 0x132
function function_6e3ecc82(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    switch (newval) {
    case 0:
        if (isdefined(self.fx)) {
            stopfx(localclientnum, self.fx);
        }
        break;
    case 1:
    case 2:
    case 3:
        self util::waittill_dobj(localclientnum);
        self.fx = util::playfxontag(localclientnum, level._effect[#"chaos_bolt_" + newval], self, "tag_origin");
        break;
    }
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0x39975a05, Offset: 0x6c0
// Size: 0x74
function pegasus_emerge(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"pegasus_emerge"], self, "tag_origin");
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0x40c444c1, Offset: 0x740
// Size: 0x13e
function function_272aa016(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify("1eb9df21273269b8");
    self endon("1eb9df21273269b8");
    if (newval) {
        self.fx_id = util::playfxontag(localclientnum, level._effect[#"storm_radius"], self, "tag_origin");
        if (!isdefined(self.sfx_id)) {
            self.sfx_id = self playloopsound(#"hash_5760b615b9b749d2");
        }
        return;
    }
    if (isdefined(self.fx_id)) {
        stopfx(localclientnum, self.fx_id);
    }
    if (isdefined(self.sfx_id)) {
        self stoploopsound(self.sfx_id);
        self.sfx_id = undefined;
    }
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0x9cc32cb6, Offset: 0x888
// Size: 0x11c
function function_a27b945a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(level.s_boss_battle.var_4475b443)) {
        return 0;
    }
    str_tag = "tag_origin";
    level beam::launch(level.s_boss_battle.var_4475b443, str_tag, self, "j_spine4", "beam8_zm_red_peg_lightning_strike", 1);
    self playsound(localclientnum, #"hash_61c057ffadb7a5af");
    wait(1.5);
    level beam::kill(level.s_boss_battle.var_4475b443, str_tag, self, "j_spine4", "beam8_zm_red_peg_lightning_strike");
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0xc0dca5a3, Offset: 0x9b0
// Size: 0x5c
function function_b9329291(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_36e4ebd4(localclientnum, "damage_light");
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0x3145d344, Offset: 0xa18
// Size: 0x12c
function function_ed1d0231(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx_tag = isdefined(self gettagorigin("j_mainroot")) ? "j_mainroot" : "tag_driver";
    if (isdefined(self.var_89d8285)) {
        deletefx(localclientnum, self.var_89d8285, 1);
        self.var_89d8285 = undefined;
    }
    if (newval == 1) {
        self.var_89d8285 = util::playfxontag(localclientnum, level._effect[#"lightning_impact"], self, str_fx_tag);
        self playsound(localclientnum, #"hash_63d588d1f28ecdc1");
    }
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0x5d72ca99, Offset: 0xb50
// Size: 0x96
function function_37d1ee2e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self thread function_e9aa9e80(localclientnum);
        self thread function_954b9602(localclientnum);
        return;
    }
    self notify(#"hash_5531647ca0352039");
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 1, eflags: 0x5 linked
// Checksum 0xa336065e, Offset: 0xbf0
// Size: 0x278
function private function_e9aa9e80(localclientnum) {
    self endon(#"death", #"hash_5531647ca0352039");
    while (!isdefined(level.var_76234ae5[localclientnum])) {
        waitframe(1);
    }
    e_ball = level.var_76234ae5[localclientnum];
    e_ball endon(#"death");
    util::server_wait(localclientnum, randomfloatrange(0.05, 0.1));
    if (!isdefined(e_ball)) {
        return;
    }
    self.e_fx = util::spawn_model(localclientnum, #"tag_origin", e_ball.origin);
    self.fx_arc = util::playfxontag(localclientnum, level._effect[#"lightning_arc"], self.e_fx, "tag_origin");
    while (true) {
        str_fx_tag = isdefined(self gettagorigin("j_mainroot")) ? "j_mainroot" : "tag_driver";
        var_a05eed18 = self gettagorigin(str_fx_tag);
        if (isdefined(var_a05eed18)) {
            self.e_fx moveto(var_a05eed18, 0.1);
        } else {
            self.e_fx moveto(self.origin, 0.1);
        }
        util::server_wait(localclientnum, 0.1);
        if (!isdefined(e_ball)) {
            return;
        }
        self.e_fx moveto(e_ball.origin, 0.1);
        util::server_wait(localclientnum, 0.1);
    }
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 1, eflags: 0x5 linked
// Checksum 0xcf72ea6f, Offset: 0xe70
// Size: 0x96
function private function_954b9602(localclientnum) {
    self waittill(#"death", #"hash_5531647ca0352039");
    if (isdefined(self.fx_arc)) {
        stopfx(localclientnum, self.fx_arc);
        self.fx_arc = undefined;
    }
    if (isdefined(self.e_fx)) {
        self.e_fx delete();
        self.e_fx = undefined;
    }
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0x4ca58769, Offset: 0xf10
// Size: 0x1f4
function function_5091797(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx_tag = isdefined(self gettagorigin("j_mainroot")) ? "j_mainroot" : "tag_driver";
    if (newval == 1) {
        self.var_cc9c5baa = util::playfxontag(localclientnum, level._effect[#"hash_206a58239ffb5e0f"], self, str_fx_tag);
        if (!isdefined(self.var_6450813b)) {
            self playsound(localclientnum, #"hash_76feff9b8f93c3d9");
            self.var_6450813b = self playloopsound(#"hash_117558f0dda6471f");
        }
        return;
    }
    if (isdefined(self.var_cc9c5baa)) {
        stopfx(localclientnum, self.var_cc9c5baa);
    }
    if (isdefined(self.var_6450813b)) {
        self playsound(localclientnum, #"hash_ae4b548c1d4a748");
        self stoploopsound(self.var_6450813b);
        self.var_6450813b = undefined;
    }
    util::playfxontag(localclientnum, level._effect[#"hash_b784dd4d224f7e"], self, str_fx_tag);
}

// Namespace red_boss_battle/zm_red_boss_battle
// Params 7, eflags: 0x1 linked
// Checksum 0xabc85803, Offset: 0x1110
// Size: 0xd4
function function_e2680ff3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx_tag = isdefined(self gettagorigin("j_mainroot")) ? "j_mainroot" : "tag_driver";
    util::playfxontag(localclientnum, level._effect[#"hash_2b842a4f17120dfb"], self, str_fx_tag);
    self playsound(0, #"hash_3098cba1f74bb5d1");
}

