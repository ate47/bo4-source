// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\beam_shared.csc;

#namespace paschal;

// Namespace paschal/zm_escape_paschal
// Params 0, eflags: 0x1 linked
// Checksum 0xac0a711, Offset: 0x238
// Size: 0xdfc
function init() {
    var_440ad52e = getminbitcountfornum(6);
    clientfield::register("scriptmover", "" + #"hash_1f572bbcdde55d9d", 1, getminbitcountfornum(5), "int", &function_49b054dd, 0, 0);
    clientfield::register("scriptmover", "" + #"dm_energy", 1, var_440ad52e, "int", &function_d36b21ad, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_4bea78fdf78a2613", 1, 1, "int", &function_c8043066, 0, 0);
    clientfield::register("scriptmover", "" + #"orb_explosion", 1, 1, "int", &orb_explosion, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_6e2f9a57d1bc4b6a", 1, 1, "int", &function_e5437696, 0, 0);
    clientfield::register("scriptmover", "" + #"ritual_gobo", 1, 1, "int", &function_d598fd7e, 0, 0);
    clientfield::register("scriptmover", "" + #"seagull_fx", 1, 1, "int", &seagull_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_7c708a514455bf88", 1, 1, "int", &function_430edc4e, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_592c96b2803d9fd5", 1, 1, "int", &function_a4c0dc8a, 0, 0);
    clientfield::register("scriptmover", "" + #"summoning_key_glow", 1, 1, "int", &summoning_key_glow, 0, 0);
    clientfield::register("actor", "" + #"hash_2b6e463a7a482630", 1, 1, "counter", &function_de16ce8a, 0, 0);
    clientfield::register("actor", "" + #"hash_29d283d7f747d358", 1, 1, "counter", &function_9c59bce1, 0, 0);
    clientfield::register("actor", "" + #"hash_df589cc30f4c7dd", 1, 1, "int", &function_e482b6b8, 0, 0);
    clientfield::register("allplayers", "" + #"hash_4f58771e117ee3ee", 1, 1, "int", &function_a596ea8d, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2928b6d60aaacda6", 1, getminbitcountfornum(7), "int", &function_6357e884, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_670a34b297f8faca", 1, 1, "int", &function_d326587e, 0, 0);
    clientfield::register("toplayer", "" + #"duffel_prison", 1, 1, "int", &duffel_prison, 0, 0);
    clientfield::register("toplayer", "" + #"hash_1ee540924e569350", 1, 1, "int", &function_e83bf3a, 0, 0);
    clientfield::register("actor", "" + #"hash_27db1707c088563c", 1, 1, "int", &function_e33e10b9, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_376c030aee1d6ccb", 1, 2, "int", &function_3537ad19, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_201ef69f0a0a5dce", 1, 1, "int", &group_bot_mp, 0, 0);
    clientfield::register("allplayers", "" + #"hash_b8601726e1e4a6a", 1, 1, "int", &function_5688631d, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_624198b41791933f", 1, 1, "int", &function_8fe4f2a7, 0, 0);
    clientfield::register("toplayer", "" + #"hash_5cab8aa95fc9ea84", 1, 1, "counter", &function_d663c13e, 0, 0);
    clientfield::register("toplayer", "" + #"hash_506164c22c4c7ca8", 1, 1, "counter", &function_42693309, 0, 0);
    level._effect[#"brutus_energy"] = #"hash_aced2664257a0ca";
    level._effect[#"energy_blue"] = #"hash_5a51f6c91ceb37a5";
    level._effect[#"energy_green"] = #"hash_24e8d0b53e783e64";
    level._effect[#"energy_orange"] = #"hash_5740c7d662846db3";
    level._effect[#"energy_red"] = #"hash_7909599a5d17a4b4";
    level._effect[#"energy_white"] = #"hash_1c2a3285932c7a7e";
    level._effect[#"energy_glow"] = #"hash_390f28af5955af1f";
    level._effect[#"kr_glow"] = #"hash_10198f7ef5535f3a";
    level._effect[#"ritual_gobo"] = #"hash_140f0bd65e4d70d2";
    level._effect[#"hash_180f832f742958d6"] = #"hash_66bb6697a9882bd6";
    level._effect[#"door_explosion"] = #"hash_4fba451426ea3bb7";
    level._effect[#"hash_1a454ca256b757e6"] = #"hash_5028a74e717df332";
    level._effect[#"hash_7d5a495febe292e4"] = #"hash_321ad275226af072";
    level._effect[#"hash_592c96b2803d9fd5"] = #"hash_2a63b961f5ed2417";
    level._effect[#"hash_6d3840ae2ba64bdd"] = #"hash_362eac491136c198";
    level._effect[#"hash_289e42e25063ac26"] = #"hash_e714752caf5a93d";
    level._effect[#"hash_287c57e25046e96f"] = #"hash_e416a52caccc0f4";
    level._effect[#"hash_287868e250431d7b"] = #"hash_e454d52cad07884";
    level._effect[#"hash_3959cfb0404cb74a"] = #"hash_5affa48c16d2c319";
    level._effect[#"hash_2928b6d60aaacda6"] = #"hash_271838b9716f9931";
    level._effect[#"brutus_stun"] = #"hash_2241c093176b5a63";
    level._effect[#"hash_86cc6dd23ec4ddb"] = #"hash_152749b3d661b4cd";
    level._effect[#"hash_6b3f19f4c90a1b75"] = #"hash_6f69cced7e86cb70";
    level._effect[#"hash_508055920f327121"] = #"hash_8c3d3c756b91f54";
    level._effect[#"hash_201ef69f0a0a5dce"] = #"hash_1f06be75e7efc6a2";
    level._effect["" + #"hash_3fafd72f00908d53"] = #"hash_992fe8f8e8dfb1";
    scene::add_scene_func(#"p8_fxanim_zm_esc_blast_afterlife_seagull_ghost_bundle", &function_bbf4268e, "shot_1");
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x984a0771, Offset: 0x1040
// Size: 0x25a
function function_d36b21ad(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self endon(#"death");
    if (isdefined(self.var_9a53cfaa)) {
        stopfx(localclientnum, self.var_9a53cfaa);
        self.var_9a53cfaa = undefined;
    }
    switch (newval) {
    case 1:
        self.var_9a53cfaa = util::playfxontag(localclientnum, level._effect[#"energy_blue"], self, "tag_origin");
        break;
    case 2:
        self.var_9a53cfaa = util::playfxontag(localclientnum, level._effect[#"energy_green"], self, "tag_origin");
        break;
    case 3:
        self.var_9a53cfaa = util::playfxontag(localclientnum, level._effect[#"energy_white"], self, "tag_origin");
        break;
    case 4:
        self.var_9a53cfaa = util::playfxontag(localclientnum, level._effect[#"energy_orange"], self, "tag_origin");
        break;
    case 5:
        self.var_9a53cfaa = util::playfxontag(localclientnum, level._effect[#"energy_red"], self, "tag_origin");
        break;
    case 0:
        break;
    default:
        break;
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xc9a077a0, Offset: 0x12a8
// Size: 0xfa
function function_c8043066(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_portal = struct::get(#"hash_4f3ae1de39c4b3e3");
    if (newval == 1) {
        if (!isdefined(s_portal.mdl_portal)) {
            s_portal.mdl_portal = util::spawn_model(localclientnum, "tag_origin", s_portal.origin, s_portal.angles);
        }
        self.var_3e3964d7 = self beam::launch(s_portal.mdl_portal, "tag_origin", self, "tag_origin", "beam8_zm_shield_key_ray_targeted");
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x6d163663, Offset: 0x13b0
// Size: 0x74
function orb_explosion(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"energy_glow"], self, "tag_origin");
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xeb20c7a, Offset: 0x1430
// Size: 0x112
function function_e5437696(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_4e35f286)) {
        killfx(localclientnum, self.var_4e35f286);
    }
    if (isdefined(self.var_a863bc25)) {
        self stoploopsound(self.var_a863bc25);
        self.var_a863bc25 = undefined;
    }
    if (newval) {
        self.var_4e35f286 = util::playfxontag(localclientnum, level._effect[#"kr_glow"], self, "tag_cover");
        if (!isdefined(self.var_a863bc25)) {
            self.var_a863bc25 = self playloopsound(#"hash_59f1ff45d390f7f1");
        }
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x972f051a, Offset: 0x1550
// Size: 0xec
function function_d598fd7e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.n_fx_id = util::playfxontag(localclientnum, level._effect[#"ritual_gobo"], self, "tag_origin");
        wait(1.6);
        util::playfxontag(localclientnum, level._effect[#"hash_180f832f742958d6"], self, "tag_origin");
    } else {
        stopfx(localclientnum, self.n_fx_id);
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x4c955ec7, Offset: 0x1648
// Size: 0x1d4
function seagull_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_d1a51444)) {
        killfx(localclientnum, self.var_d1a51444);
        self.var_d1a51444 = undefined;
    }
    if (isdefined(self.var_7b2dcfc6)) {
        killfx(localclientnum, self.var_7b2dcfc6);
        self.var_7b2dcfc6 = undefined;
    }
    if (isdefined(self.n_trail_fx)) {
        killfx(localclientnum, self.n_trail_fx);
        self.n_trail_fx = undefined;
    }
    if (newval) {
        self.var_d1a51444 = util::playfxontag(localclientnum, level._effect[#"hash_1a454ca256b757e6"], self, "j_wrist_ri");
        self.var_7b2dcfc6 = util::playfxontag(localclientnum, level._effect[#"hash_1a454ca256b757e6"], self, "j_wrist_le");
        self.n_trail_fx = util::playfxontag(localclientnum, level._effect[#"hash_7d5a495febe292e4"], self, "j_spine1");
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Alpha", 1);
    }
}

// Namespace paschal/zm_escape_paschal
// Params 0, eflags: 0x5 linked
// Checksum 0xc885de07, Offset: 0x1828
// Size: 0xcc
function private function_89a37ae2() {
    self playrenderoverridebundle(#"hash_24cdaac09819f0e");
    self function_78233d29(#"hash_24cdaac09819f0e", "", "Brightness", 1);
    self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1);
    self function_78233d29(#"hash_24cdaac09819f0e", "", "Alpha", 1);
}

// Namespace paschal/zm_escape_paschal
// Params 2, eflags: 0x1 linked
// Checksum 0x1b28c23e, Offset: 0x1900
// Size: 0x54
function function_bbf4268e(clientnum, a_ents) {
    if (isdefined(a_ents[#"seagull_ghost"])) {
        a_ents[#"seagull_ghost"] function_89a37ae2();
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x4e5e651, Offset: 0x1960
// Size: 0x1ea
function function_430edc4e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_8eef2f82)) {
        killfx(localclientnum, self.var_8eef2f82);
        self.var_8eef2f82 = undefined;
    }
    if (isdefined(self.var_99f0142a)) {
        killfx(localclientnum, self.var_99f0142a);
        self.var_99f0142a = undefined;
    }
    if (newval) {
        if (isdefined(level._effect[#"air_blast"])) {
            self.var_8eef2f82 = util::playfxontag(localclientnum, level._effect[#"air_blast"], self, "tag_origin");
            mdl_ghost = util::spawn_model(localclientnum, "tag_origin", self.origin + vectorscale((0, 0, 1), 20), self.angles);
            mdl_ghost scene::play(#"p8_fxanim_zm_esc_blast_afterlife_seagull_ghost_bundle", "shot_1");
            mdl_ghost delete();
        }
        if (isdefined(level._effect[#"hash_1839aae8f96148af"])) {
            self.var_99f0142a = util::playfxontag(localclientnum, level._effect[#"hash_1839aae8f96148af"], self, "tag_origin");
        }
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xe472057d, Offset: 0x1b58
// Size: 0x7a
function function_a4c0dc8a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.var_a5b517e5 = util::playfxontag(localclientnum, level._effect[#"hash_592c96b2803d9fd5"], self, "tag_origin");
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xc3c37c0e, Offset: 0x1be0
// Size: 0x3a4
function function_a596ea8d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    var_704f12cc = struct::get("s_p_s4_s_k_ins");
    if (!isdefined(self.var_86931af3)) {
        self.var_86931af3 = [];
    }
    if (!isdefined(self.var_147a3cdc)) {
        self.var_147a3cdc = [];
    }
    if (!isdefined(self.var_d1f92a1c)) {
        self.var_d1f92a1c = [];
    }
    if (!isdefined(self.var_95496a89)) {
        self.var_95496a89 = [];
    }
    if (newval) {
        if (!isdefined(self.var_d1f92a1c[localclientnum])) {
            self.var_d1f92a1c[localclientnum] = util::spawn_model(localclientnum, "tag_origin", var_704f12cc.origin, var_704f12cc.angles);
        }
        if (!isdefined(self.var_95496a89[localclientnum])) {
            self.var_95496a89[localclientnum] = util::spawn_model(localclientnum, "tag_origin", self.origin + vectorscale((0, 0, 1), 40), self.angles);
            self.var_95496a89[localclientnum] linkto(self, "tag_origin");
        }
        self.var_86931af3[localclientnum] = level beam::launch(self.var_95496a89[localclientnum], "tag_origin", self.var_d1f92a1c[localclientnum], "tag_origin", "beam8_zm_shield_key_ray_targeted");
        if (!isdefined(self.var_147a3cdc[localclientnum])) {
            self playsound(localclientnum, #"hash_71ec8b40875fdf5f");
            self.var_147a3cdc[localclientnum] = self playloopsound(#"hash_7bdc545588111e41");
        }
    } else {
        if (isdefined(self.var_86931af3[localclientnum])) {
            level beam::function_47deed80(localclientnum, self.var_86931af3[localclientnum]);
            self.var_86931af3[localclientnum] = undefined;
        }
        if (isdefined(self.var_d1f92a1c[localclientnum])) {
            self.var_d1f92a1c[localclientnum] delete();
            self.var_d1f92a1c[localclientnum] = undefined;
        }
        if (isdefined(self.var_95496a89[localclientnum])) {
            self.var_95496a89[localclientnum] delete();
            self.var_95496a89[localclientnum] = undefined;
        }
        if (isdefined(self.var_147a3cdc[localclientnum])) {
            self playsound(localclientnum, #"hash_3c3813560a59a64a");
            self stoploopsound(self.var_147a3cdc[localclientnum]);
            self.var_147a3cdc[localclientnum] = undefined;
        }
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xfda9481d, Offset: 0x1f90
// Size: 0x1ec
function function_49b054dd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_29749873)) {
        killfx(localclientnum, self.var_29749873);
        self.var_29749873 = undefined;
    }
    exploder::stop_exploder("lgtexp_wardenhouse_red");
    if (newval == 1) {
        self.var_29749873 = util::playfxontag(localclientnum, level._effect[#"hash_6d3840ae2ba64bdd"], self, "tag_origin");
    } else if (newval == 2) {
        self.var_29749873 = util::playfxontag(localclientnum, level._effect[#"hash_289e42e25063ac26"], self, "tag_origin");
    } else if (newval == 3) {
        self.var_29749873 = util::playfxontag(localclientnum, level._effect[#"hash_287c57e25046e96f"], self, "tag_origin");
    } else if (newval == 4) {
        self.var_29749873 = util::playfxontag(localclientnum, level._effect[#"hash_287868e250431d7b"], self, "tag_origin");
    } else if (newval == 5) {
        exploder::exploder("lgtexp_wardenhouse_red");
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x5691236d, Offset: 0x2188
// Size: 0xaa
function summoning_key_glow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_4e35f286)) {
        killfx(localclientnum, self.var_4e35f286);
    }
    if (newval) {
        self.var_4e35f286 = util::playfxontag(localclientnum, level._effect[#"hash_3959cfb0404cb74a"], self, "tag_origin");
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xb3d31009, Offset: 0x2240
// Size: 0x7c
function function_de16ce8a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect["" + #"hash_3fafd72f00908d53"], self, "tag_origin");
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x311da0d, Offset: 0x22c8
// Size: 0x74
function function_9c59bce1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_86cc6dd23ec4ddb"], self, "tag_origin");
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x1df4122d, Offset: 0x2348
// Size: 0x2c0
function function_6357e884(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.var_2185511c)) {
        self.var_2185511c = [];
    }
    if (!isdefined(self.var_2185511c[localclientnum])) {
        self.var_2185511c[localclientnum] = [];
    }
    if (newval > 0) {
        switch (newval) {
        case 1:
            str_tag = "tag_socket_a";
            break;
        case 2:
            str_tag = "tag_socket_b";
            break;
        case 3:
            str_tag = "tag_socket_c";
            break;
        case 4:
            str_tag = "tag_socket_d";
            break;
        case 5:
            str_tag = "tag_socket_e";
            break;
        case 6:
            str_tag = "tag_socket_f";
            break;
        case 7:
            str_tag = "tag_socket_g";
            break;
        }
        self.var_2185511c[localclientnum][self.var_2185511c[localclientnum].size] = util::playfxontag(localclientnum, level._effect[#"hash_2928b6d60aaacda6"], self, str_tag);
        var_18407835 = self gettagorigin(str_tag);
        playsound(localclientnum, #"hash_6d26aa0fd4a98020", var_18407835);
    } else if (self.var_2185511c[localclientnum].size) {
        foreach (fx in self.var_2185511c[localclientnum]) {
            deletefx(localclientnum, fx);
        }
        self.var_2185511c[localclientnum] = undefined;
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xf0578699, Offset: 0x2610
// Size: 0xba
function function_e482b6b8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_5924ce94)) {
        stopfx(localclientnum, self.var_5924ce94);
        self.var_5924ce94 = undefined;
    }
    if (newval == 1) {
        self.var_5924ce94 = util::playfxontag(localclientnum, level._effect[#"brutus_energy"], self, "tag_origin");
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x316ab51e, Offset: 0x26d8
// Size: 0xba
function function_d326587e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_4e35f286)) {
        stopfx(localclientnum, self.var_4e35f286);
        self.var_4e35f286 = undefined;
    }
    if (newval == 1) {
        self.var_4e35f286 = util::playfxontag(localclientnum, level._effect[#"spk_glint"], self, "tag_origin");
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x8483c5f3, Offset: 0x27a0
// Size: 0x94
function function_e83bf3a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self thread postfx::playpostfxbundle(#"pstfx_slowed");
    } else {
        self thread postfx::exitpostfxbundle(#"pstfx_slowed");
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xf41aafdf, Offset: 0x2840
// Size: 0x15e
function function_e33e10b9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.var_91f82333 = util::playfxontag(localclientnum, level._effect[#"brutus_stun"], self, "tag_origin");
        if (!isdefined(self.var_6ca7b3dd)) {
            self playsound(localclientnum, #"hash_713bf699d03aa7c1");
            self.var_6ca7b3dd = self playloopsound(#"hash_5248e6e3ffed7696");
        }
    } else {
        if (isdefined(self.var_91f82333)) {
            stopfx(localclientnum, self.var_91f82333);
            self.var_91f82333 = undefined;
        }
        if (isdefined(self.var_6ca7b3dd)) {
            self stoploopsound(self.var_6ca7b3dd);
            self.var_6ca7b3dd = undefined;
        }
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x7fe06aaa, Offset: 0x29a8
// Size: 0x10a
function function_3537ad19(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_23647e90)) {
        stopfx(localclientnum, self.var_23647e90);
        self.var_23647e90 = undefined;
    }
    if (newval == 1) {
        self.var_23647e90 = util::playfxontag(localclientnum, level._effect[#"hash_508055920f327121"], self, "tag_fx_light_02");
    } else if (newval == 2) {
        self.var_23647e90 = util::playfxontag(localclientnum, level._effect[#"hash_6b3f19f4c90a1b75"], self, "tag_fx_light_01");
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x1ba1ee41, Offset: 0x2ac0
// Size: 0x12a
function group_bot_mp(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_f756621f)) {
        stopfx(localclientnum, self.var_f756621f);
        self.var_f756621f = undefined;
    }
    if (isdefined(self.var_dae2b711)) {
        self stoploopsound(self.var_dae2b711);
        self.var_dae2b711 = undefined;
    }
    if (newval == 1) {
        self.var_f756621f = util::playfxontag(localclientnum, level._effect[#"hash_201ef69f0a0a5dce"], self, "tag_origin");
        if (!isdefined(self.var_dae2b711)) {
            self.var_dae2b711 = self playloopsound(#"hash_56a667536b4a0ffc");
        }
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xfceb8444, Offset: 0x2bf8
// Size: 0xd4
function duffel_prison(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        var_e0630bbb = struct::get("p_s_4_bag");
        self.var_c5996c09 = util::spawn_model(localclientnum, #"p8_zm_esc_laundry_bag", var_e0630bbb.origin, var_e0630bbb.angles);
    } else if (isdefined(self.var_c5996c09)) {
        self.var_c5996c09 delete();
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0xcd5c4643, Offset: 0x2cd8
// Size: 0x114
function function_5688631d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        forcestreamxmodel(#"c_t8_zmb_mob_ghoul_body1_rob");
        forcestreamxmodel(#"c_t8_zmb_mob_ghoul_body2_rob");
        forcestreamxmodel(#"c_t8_zmb_mob_ghoul_body3_rob");
    } else {
        stopforcestreamingxmodel(#"c_t8_zmb_mob_ghoul_body1_rob");
        stopforcestreamingxmodel(#"c_t8_zmb_mob_ghoul_body2_rob");
        stopforcestreamingxmodel(#"c_t8_zmb_mob_ghoul_body3_rob");
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x9189744d, Offset: 0x2df8
// Size: 0x1cc
function function_8fe4f2a7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self playrenderoverridebundle(#"hash_68ee9247aaae4517");
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Brightness", 0);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Alpha", 0);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 0);
    } else {
        self playrenderoverridebundle(#"hash_68ee9247aaae4517");
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Brightness", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Alpha", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1);
    }
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x289f77a7, Offset: 0x2fd0
// Size: 0x64
function function_d663c13e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self playrumbleonentity(localclientnum, #"hash_738338790dfa1ece");
}

// Namespace paschal/zm_escape_paschal
// Params 7, eflags: 0x1 linked
// Checksum 0x6bc66514, Offset: 0x3040
// Size: 0x64
function function_42693309(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self playrumbleonentity(localclientnum, #"zm_escape_map_interact");
}

