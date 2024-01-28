// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace namespace_b45e3f05;

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 0, eflags: 0x1 linked
// Checksum 0xe92f6a18, Offset: 0x120
// Size: 0x34
function init() {
    init_clientfields();
    init_flags();
    init_fx();
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 0, eflags: 0x1 linked
// Checksum 0xf582247c, Offset: 0x160
// Size: 0x4d4
function init_clientfields() {
    clientfield::register("allplayers", "" + #"hash_2c387ea19f228b5d", 1, 1, "int", &function_bfdd6659, 0, 0);
    clientfield::register("allplayers", "" + #"hash_794e5d0769b1d497", 1, 1, "int", &function_54655580, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_7876f33937c8a764", 1, 1, "int", &vomit, 0, 0);
    clientfield::register("scriptmover", "" + #"safe_fx", 1, 1, "int", &safe_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"flare_fx", 1, 2, "int", &flare_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2042191a7fc75994", 1, 2, "int", &function_563778cc, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2ec182fecae80e80", 1, 1, "int", &function_584fb3c8, 0, 0);
    clientfield::register("scriptmover", "" + #"portal_pass", 1, 2, "int", &function_eabe4696, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_1cf8b9339139c50d", 1, 1, "int", &function_34f5c98, 0, 0);
    clientfield::register("scriptmover", "" + #"car_fx", 1, 1, "int", &function_ae668ae9, 0, 0);
    clientfield::register("world", "" + #"hash_1166237b92466ac9", 1, 1, "int", &function_5218405b, 0, 0);
    clientfield::register("world", "" + #"fireworks_fx", 1, 2, "counter", &fireworks_fx, 0, 0);
    clientfield::register("world", "" + #"crash_fx", 1, 1, "int", &function_711366fa, 0, 0);
    clientfield::register("world", "" + #"hash_4f672a8a7ae530e5", 1, 1, "int", &function_f99ce12b, 0, 0);
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x640
// Size: 0x4
function init_flags() {
    
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 0, eflags: 0x1 linked
// Checksum 0x66c5e9f4, Offset: 0x650
// Size: 0x422
function init_fx() {
    level._effect[#"safe_fx"] = #"hash_4bf40208439d50d6";
    level._effect[#"hash_3ed9aa5890e4cfd2"] = #"hash_4b6b503d842bc415";
    level._effect[#"hash_21893413efec355e"] = #"hash_cf3c06e4368bbb1";
    level._effect[#"hash_55ab46637a8fbcb3"] = #"hash_5508b1d8864ee2d2";
    level._effect[#"hash_2377de258e66b4ce"] = #"hash_33da19858ee59385";
    level._effect[#"hash_76a20bbf3432c804"] = #"hash_1b5b754131008f70";
    level._effect[#"hash_4817a1dbc7bf4ca4"] = #"hash_770af2dde4a0938c";
    level._effect[#"hash_3ddf14b70581a57"] = #"hash_41eac18dc72dac23";
    level._effect[#"hash_3bfcf7e07661fa18"] = #"hash_5e9dff5fcbf30022";
    level._effect[#"hash_26c9596a43d9be2e"] = #"hash_4144490ff4773f4b";
    level._effect[#"hash_6571250749b2c790"] = #"hash_1a3fcc6c808e55eb";
    level._effect[#"hash_51ecda6f24a58d05"] = #"hash_13c3cecd3d059c90";
    level._effect[#"hash_2f154bbb31e4abaf"] = #"hash_706103079a2bdb6d";
    level._effect[#"hash_3524e302fa83d12e"] = #"hash_3a791d490f01f5c7";
    level._effect[#"hash_2498ee8a7586b418"] = #"hash_15dc4292340f0f1c";
    level._effect[#"hash_16c2570acb38a0ed"] = #"hash_7691f79bfc16f0bf";
    level._effect[#"car_lights"] = #"hash_335feb1d213c22f6";
    level._effect[#"hash_1c0ed73a9b21a882"] = #"hash_cc7196a44e2fbe3";
    level._effect[#"hash_704d3c12d59fb5d7"] = #"hash_2aabc11b07ad74d8";
    level._effect[#"hash_4ec5da9e09256102"] = #"hash_3063115f97c18abf";
    level._effect[#"hash_133983d2bb8a160"] = #"hash_51ca82e6f2c21354";
    level._effect[#"hash_13aa43d2bbed472"] = #"hash_51d16ee6f2c81006";
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0xcc1ed85e, Offset: 0xa80
// Size: 0x21c
function function_f99ce12b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        addzombieboxweapon(getweapon(#"hero_sword_pistol_lv1"), #"wpn_t8_zm_melee_dw_hand_cannon_lvl1_prop_animate", 1);
        addzombieboxweapon(getweapon(#"hero_chakram_lv1"), #"wpn_t8_zm_melee_dw_hand_cannon_lvl1_prop_animate", 1);
        addzombieboxweapon(getweapon(#"hero_scepter_lv1"), #"wpn_t8_zm_melee_staff_ra_lvl1_prop_animate", 0);
        addzombieboxweapon(getweapon(#"hero_hammer_lv1"), #"wpn_t8_zm_melee_hammer_lvl1_prop_animate", 0);
    } else {
        removezombieboxweapon(getweapon(#"hero_sword_pistol_lv1"));
        removezombieboxweapon(getweapon(#"hero_chakram_lv1"));
        removezombieboxweapon(getweapon(#"hero_scepter_lv1"));
        removezombieboxweapon(getweapon(#"hero_hammer_lv1"));
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0x6d52483a, Offset: 0xca8
// Size: 0x8c
function function_54655580(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle(#"rob_tricannon_character_ice");
    } else {
        self stoprenderoverridebundle(#"rob_tricannon_character_ice");
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0xe25810e, Offset: 0xd40
// Size: 0x136
function function_bfdd6659(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (self zm_utility::function_f8796df3(localclientnum)) {
            if (viewmodelhastag(localclientnum, "tag_fx")) {
                self.var_37649f83 = playviewmodelfx(localclientnum, level._effect[#"hash_133983d2bb8a160"], "tag_fx");
            }
        } else {
            self.var_37649f83 = util::playfxontag(localclientnum, level._effect[#"hash_13aa43d2bbed472"], self, "tag_fx");
        }
    } else if (isdefined(self.var_37649f83)) {
        stopfx(localclientnum, self.var_37649f83);
        self.var_37649f83 = undefined;
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0xd6789fae, Offset: 0xe80
// Size: 0xbe
function function_ae668ae9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.n_trail_fx = util::playfxontag(localclientnum, level._effect[#"car_lights"], self, "tag_body");
    } else if (isdefined(self.n_trail_fx)) {
        killfx(localclientnum, self.n_trail_fx);
        self.n_trail_fx = undefined;
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0x4ec0443, Offset: 0xf48
// Size: 0x21c
function function_34f5c98(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval && isdefined(level._effect[#"hash_2498ee8a7586b418"])) {
        self util::waittill_dobj(localclientnum);
        self.var_f756621f = util::playfxontag(localclientnum, level._effect[#"hash_2f154bbb31e4abaf"], self, "tag_origin");
        playfx(localclientnum, level._effect[#"hash_16c2570acb38a0ed"], self.origin, anglestoforward(self.angles), anglestoup(self.angles));
        playrumbleonposition(localclientnum, #"hash_743b325bf45e1c8c", self.origin);
        playsound(localclientnum, #"hash_188d7d9f6b62346f", (0, 0, 0));
        wait(0.75);
        if (isdefined(self)) {
            playfx(localclientnum, level._effect[#"hash_2498ee8a7586b418"], self.origin, anglestoforward(self.angles), anglestoup(self.angles));
        }
    } else if (isdefined(self.var_f756621f)) {
        stopfx(localclientnum, self.var_f756621f);
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0xd6e9e126, Offset: 0x1170
// Size: 0x10c
function function_5218405b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        s_loc = struct::get(#"spark_loc");
        playfx(localclientnum, level._effect[#"hash_3524e302fa83d12e"], s_loc.origin, anglestoforward(s_loc.angles), anglestoup(s_loc.angles));
        wait(0.5);
        playrumbleonposition(localclientnum, #"hash_743b325bf45e1c8c", s_loc.origin);
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0xcbcbc956, Offset: 0x1288
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

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0x663f1ec8, Offset: 0x1348
// Size: 0xec
function function_584fb3c8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle(#"rob_tricannon_character_ice");
        s_loc = struct::get(#"hash_583635858828e286");
        playfx(localclientnum, level._effect[#"hash_26c9596a43d9be2e"], s_loc.origin);
        audio::playloopat("zmb_frost_table_loop", self.origin);
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0x8e0f98dc, Offset: 0x1440
// Size: 0xb4
function function_711366fa(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        s_loc = struct::get(#"hash_27613769597daaf0");
        playfx(localclientnum, level._effect[#"hash_3bfcf7e07661fa18"], s_loc.origin);
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0xae362973, Offset: 0x1500
// Size: 0x15c
function function_eabe4696(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_2745e294)) {
        killfx(localclientnum, self.var_2745e294);
        self.var_2745e294 = undefined;
    }
    if (newval == 1) {
        self util::waittill_dobj(localclientnum);
        self.var_2745e294 = util::playfxontag(localclientnum, level._effect[#"hash_6571250749b2c790"], self, "tag_origin");
    } else if (newval == 2) {
        self.var_2745e294 = util::playfxontag(localclientnum, level._effect[#"hash_51ecda6f24a58d05"], self, "tag_origin");
    } else {
        playfx(localclientnum, level._effect[#"hash_3ddf14b70581a57"], self.origin);
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x0
// Checksum 0xac8dfe41, Offset: 0x1668
// Size: 0x124
function function_43425692(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_loc = struct::get(#"floaters_fx");
    if (newval == 1) {
        s_loc.fx = playfx(localclientnum, level._effect[#"hash_29d523bd9b3bf58a"], s_loc.origin, anglestoforward(s_loc.angles), anglestoup(s_loc.angles));
    } else if (isdefined(s_loc.fx)) {
        stopfx(localclientnum, s_loc.fx);
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0x45a48511, Offset: 0x1798
// Size: 0x17e
function safe_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (newval == 1) {
        if (!isdefined(self.fx)) {
            v_forward = anglestoforward(self.angles);
            v_right = anglestoright(self.angles);
            v_loc = self.origin + v_right * 7;
            v_loc = v_loc + v_forward * -8;
            self.fx = playfx(localclientnum, level._effect[#"safe_fx"], v_loc, v_forward, anglestoup(self.angles));
        }
    } else if (isdefined(self.fx)) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0x34572e53, Offset: 0x1920
// Size: 0x2ae
function flare_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        util::playfxontag(localclientnum, level._effect[#"hash_3ed9aa5890e4cfd2"], self, "tag_origin");
        if (newval == 1) {
            if (!isdefined(self.fx)) {
                self.fx = util::playfxontag(localclientnum, level._effect[#"hash_21893413efec355e"], self, "tag_origin");
                wait(1.5);
                if (isdefined(self)) {
                    playfx(localclientnum, level._effect[#"hash_76a20bbf3432c804"], self.origin);
                }
            }
        } else if (newval == 2) {
            if (!isdefined(self.fx)) {
                self.fx = util::playfxontag(localclientnum, level._effect[#"hash_2377de258e66b4ce"], self, "tag_origin");
                wait(1.5);
                if (isdefined(self)) {
                    playfx(localclientnum, level._effect[#"hash_4817a1dbc7bf4ca4"], self.origin);
                }
            }
        } else if (newval == 3) {
            if (!isdefined(self.fx)) {
                self.fx = util::playfxontag(localclientnum, level._effect[#"hash_55ab46637a8fbcb3"], self, "tag_origin");
                wait(1.5);
                if (isdefined(self)) {
                    playfx(localclientnum, level._effect[#"hash_3ddf14b70581a57"], self.origin);
                }
            }
        }
    } else if (isdefined(self.fx)) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0x4588acd3, Offset: 0x1bd8
// Size: 0x17a
function function_563778cc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.fx)) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
    switch (newval) {
    case 1:
        self.fx = util::playfxontag(localclientnum, level._effect[#"hash_1c0ed73a9b21a882"], self, "tag_origin");
        break;
    case 2:
        self.fx = util::playfxontag(localclientnum, level._effect[#"hash_4ec5da9e09256102"], self, "tag_origin");
        break;
    case 3:
        self.fx = util::playfxontag(localclientnum, level._effect[#"hash_704d3c12d59fb5d7"], self, "tag_origin");
        break;
    }
}

// Namespace namespace_b45e3f05/namespace_2d696d7c
// Params 7, eflags: 0x1 linked
// Checksum 0x8d62f8be, Offset: 0x1d60
// Size: 0x274
function fireworks_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        a_s_locs = struct::get_array(#"hash_5af7eeb066c5efbe", "script_noteworthy");
        s_loc = a_s_locs[randomint(a_s_locs.size)];
        playfx(localclientnum, level._effect[#"hash_76a20bbf3432c804"], s_loc.origin);
        playsound(0, #"hash_40d3baad4b103e04", s_loc.origin);
    } else if (newval == 2) {
        a_s_locs = struct::get_array(#"hash_5af7eeb066c5efbe", "script_noteworthy");
        s_loc = a_s_locs[randomint(a_s_locs.size)];
        playfx(localclientnum, level._effect[#"hash_4817a1dbc7bf4ca4"], s_loc.origin);
        playsound(0, #"hash_40d3baad4b103e04", s_loc.origin);
    } else if (newval == 3) {
        a_s_locs = struct::get_array(#"hash_5af7eeb066c5efbe", "script_noteworthy");
        s_loc = a_s_locs[randomint(a_s_locs.size)];
        playfx(localclientnum, level._effect[#"hash_3ddf14b70581a57"], s_loc.origin);
        playsound(0, #"hash_40d3baad4b103e04", s_loc.origin);
    }
}

