// Atian COD Tools GSC decompiler test
#using script_70ab01a7690ea256;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_weap_spectral_shield;

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 0, eflags: 0x2
// Checksum 0x9bacd1b1, Offset: 0x300
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_weap_spectral_shield", &__init__, &__main__, undefined);
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 0, eflags: 0x1 linked
// Checksum 0xbb1ebc1b, Offset: 0x350
// Size: 0x93a
function __init__() {
    level.var_4e845c84 = getweapon(#"hash_185abc5c82e9d849");
    level.var_22a393d4 = [];
    clientfield::register("allplayers", "" + #"hash_184a34e85c29399f", 1, 1, "int", &function_b7608e70, 0, 0);
    clientfield::register("toplayer", "" + #"afterlife_window", 1, 1, "int", &afterlife_window, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_3c8cd47650fbb324", 1, 2, "int", &function_a694da18, 0, 0);
    clientfield::register("allplayers", "" + #"hash_e9b9b677ff2b8e2", 1, 1, "int", &function_e943883, 0, 1);
    clientfield::register("allplayers", "" + #"hash_1efc6bf68f09d02c", 1, 2, "int", &function_f9a03171, 0, 0);
    n_bits = getminbitcountfornum(4);
    clientfield::register("actor", "" + #"hash_1b02e77fdbc51a4d", 1, n_bits, "int", &function_b570d455, 0, 0);
    clientfield::register("vehicle", "" + #"hash_1b02e77fdbc51a4d", 1, n_bits, "int", &function_b570d455, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_1b02e77fdbc51a4d", 1, n_bits, "int", &function_b570d455, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_7a8b6df890ccc630", 1, 1, "int", &function_5655dc55, 0, 0);
    clientfield::register("allplayers", "" + #"hash_7663ae2eb866d2eb", 1, 1, "counter", &function_50119cc1, 0, 0);
    clientfield::register("allplayers", "" + #"hash_e0f652f4a9ad8d5", 1, 2, "int", &function_36c349d0, 0, 0);
    clientfield::register("allplayers", "" + #"hash_5fc4ff8f1017bd0a", 1, 1, "counter", &function_6b58c030, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_6a04c04eae77e006", 1, 1, "counter", &function_107af28d, 0, 0);
    clientfield::register("actor", "" + #"hash_3abdd4f4d64241e5", 1, 1, "int", &function_1b1ec967, 0, 0);
    clientfield::register("allplayers", "" + #"zombie_spectral_heal", 1, 1, "counter", &function_3f83a22f, 0, 0);
    level._effect[#"spectral_key_muzzle_flash1p"] = #"hash_1897770e10623dab";
    level._effect[#"spectral_key_muzzle_flash3p"] = #"hash_18906b0e105c0a99";
    level._effect[#"spectral_key_muzzle_flash1p_idle"] = #"hash_74f3e07770b3c780";
    level._effect[#"spectral_key_muzzle_flash3p_idle"] = #"hash_74faec7770b9fa92";
    level._effect[#"hash_5a834a39ce281cef"] = #"hash_42b1e9abdde1d678";
    level._effect[#"hash_6ca5cf8a3ac2254a"] = #"hash_6894b23015ff2626";
    level._effect[#"hash_5e08e3b80445f6d7"] = #"hash_db890f21c0af009";
    level._effect[#"hash_5e01d7b8043fc3c5"] = #"hash_dbf9cf21c11231b";
    level._effect[#"hash_3ae08d08271270d6"] = #"hash_35b66c4bdba4f1a8";
    level._effect[#"hash_3ad9a108270c7424"] = #"hash_35bd784bdbab24ba";
    level._effect[#"hash_4a41e8484e30822e"] = #"hash_55a201e66dbc23d3";
    level._effect[#"hash_4a3bdc484e2c021c"] = #"hash_559b15e66db62721";
    level._effect[#"hash_29b0420a85baa71b"] = #"hash_4a8de7cdf2716f1b";
    level._effect[#"hash_28b1c64bd72686eb"] = #"hash_5e46c3cecd080eeb";
    level._effect[#"hash_a64dd624f3d5eff"] = #"hash_3a4825045da5aa1f";
    level._effect[#"hash_a5ef1624f39154d"] = #"hash_3a4139045d9fad6d";
    level._effect[#"air_blast"] = #"hash_70630dd76a790b4";
    level._effect[#"hash_3757ad652a2b0e54"] = #"hash_382d55804b58cfcb";
    level._effect[#"shield_crafting"] = #"hash_1e261e7fd620ac9e";
    level._effect[#"spectral_heal"] = #"zombie/fx_bgb_near_death_3p";
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xc98
// Size: 0x4
function __main__() {
    
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0x62e9f2, Offset: 0xca8
// Size: 0x4dc
function function_b7608e70(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (!isdefined(self.var_1d12110c)) {
        self.var_1d12110c = [];
    }
    if (newval == 1) {
        if (!isdefined(self.weapon)) {
            return;
        }
        if (!function_98890cd8(self.weapon)) {
            return;
        }
        if (self getlocalclientnumber() === localclientnum) {
            if (!isdemoplaying() && !namespace_a6aea2c6::is_active(#"silent_film")) {
                self thread postfx::playpostfxbundle(#"hash_529f2ffb7f62ca50");
                a_e_players = getlocalplayers();
                foreach (e_player in a_e_players) {
                    if (!e_player util::function_50ed1561(localclientnum)) {
                        e_player thread zm_utility::function_bb54a31f(localclientnum, #"hash_529f2ffb7f62ca50", #"hash_242ff4bae72c27b3");
                    }
                }
            }
            level.var_22a393d4 = array::remove_undefined(level.var_22a393d4, 0);
            foreach (e_vision in level.var_22a393d4) {
                if (isdefined(e_vision.show_function)) {
                    e_vision.var_a5a0e616 = 1;
                    e_vision thread [[ e_vision.show_function ]](localclientnum);
                }
            }
            self thread function_85e7adcf(localclientnum);
        } else {
            self.var_1d12110c[localclientnum] = util::playfxontag(localclientnum, level._effect[#"hash_3757ad652a2b0e54"], self, "tag_window_fx");
        }
    } else if (self getlocalclientnumber() === localclientnum) {
        self notify(#"hash_eefcf8215207987");
        self postfx::stoppostfxbundle(#"hash_529f2ffb7f62ca50");
        a_e_players = getlocalplayers();
        foreach (e_player in a_e_players) {
            if (!e_player util::function_50ed1561(localclientnum)) {
                e_player notify(#"hash_242ff4bae72c27b3");
            }
        }
        level.var_22a393d4 = array::remove_undefined(level.var_22a393d4, 0);
        foreach (e_vision in level.var_22a393d4) {
            if (isdefined(e_vision.hide_function)) {
                e_vision.var_a5a0e616 = undefined;
                e_vision thread [[ e_vision.hide_function ]](localclientnum);
            }
        }
    } else if (isdefined(self.var_1d12110c[localclientnum])) {
        stopfx(localclientnum, self.var_1d12110c[localclientnum]);
        self.var_1d12110c[localclientnum] = undefined;
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x5 linked
// Checksum 0x6ba6b7d0, Offset: 0x1190
// Size: 0x168
function private function_85e7adcf(localclientnum) {
    self endon(#"death", #"hash_eefcf8215207987");
    var_61467197 = level.var_22a393d4.size;
    while (1) {
        if (var_61467197 !== level.var_22a393d4.size) {
            level.var_22a393d4 = array::remove_undefined(level.var_22a393d4, 0);
            foreach (e_vision in level.var_22a393d4) {
                if (isdefined(e_vision.show_function) && !(isdefined(e_vision.var_a5a0e616) && e_vision.var_a5a0e616)) {
                    e_vision.var_a5a0e616 = 1;
                    e_vision thread [[ e_vision.show_function ]](localclientnum);
                }
            }
            var_61467197 = level.var_22a393d4.size;
        }
        wait(0.1);
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xf4814573, Offset: 0x1300
// Size: 0x84
function afterlife_window(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self playrenderoverridebundle("rob_shield_window");
    } else {
        self stoprenderoverridebundle("rob_shield_window");
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xc6045def, Offset: 0x1390
// Size: 0x194
function function_a694da18(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (!isdefined(level.var_22a393d4)) {
            level.var_22a393d4 = [];
        } else if (!isarray(level.var_22a393d4)) {
            level.var_22a393d4 = array(level.var_22a393d4);
        }
        if (!isinarray(level.var_22a393d4, self)) {
            level.var_22a393d4[level.var_22a393d4.size] = self;
        }
        self.show_function = &function_f66111c5;
        self.hide_function = &function_5681824;
        self hide();
    } else if (newval == 2) {
        self notify(#"set_grabbed");
        self.b_seen = undefined;
        self.hide_function = undefined;
        self playrenderoverridebundle("rob_skull_grab");
        self show();
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x1 linked
// Checksum 0x9bd1cf1, Offset: 0x1530
// Size: 0x64
function function_f66111c5(localclientnum) {
    self endon(#"death", #"set_grabbed");
    self playrenderoverridebundle("rob_spectral_vision");
    self show();
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x1 linked
// Checksum 0x13f54175, Offset: 0x15a0
// Size: 0x4c
function function_5681824(localclientnum) {
    self endon(#"death", #"set_grabbed");
    self stoprenderoverridebundle("rob_spectral_vision");
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xe43d8c64, Offset: 0x15f8
// Size: 0xf2
function function_1b1ec967(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_39306eaa)) {
        deletefx(localclientnum, self.var_39306eaa, 1);
        self.var_39306eaa = undefined;
    }
    if (newval == 1) {
        str_tag = "j_spineupper";
        if (self.archetype == #"zombie_dog") {
            str_tag = "j_spine1";
        }
        self.var_39306eaa = util::playfxontag(localclientnum, level._effect[#"hash_28b1c64bd72686eb"], self, str_tag);
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xe4fe5c7b, Offset: 0x16f8
// Size: 0x10e
function function_e943883(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death", #"disconnect", #"hash_3ed4154ad2e33ec3");
    if (!isdefined(self.var_2723e767)) {
        self.var_2723e767 = [];
    }
    if (!isdefined(self.var_3e52c79e)) {
        self.var_3e52c79e = [];
    }
    self function_4700b6cd(localclientnum);
    if (newval == 1) {
        self thread function_848179f5(localclientnum);
        self thread function_a950c92c(localclientnum);
    } else {
        self notify(#"hash_3ed4154ad2e33ec3");
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x1 linked
// Checksum 0xb17ee58e, Offset: 0x1810
// Size: 0x170
function function_a950c92c(localclientnum) {
    self endon(#"death", #"hash_3ed4154ad2e33ec3");
    while (1) {
        level.var_443d1164 = undefined;
        s_result = undefined;
        s_result = level waittill(#"hash_73ff8d0d706c332d", #"hash_527d9fdde8903b80");
        level.var_443d1164 = 1;
        self function_4700b6cd(localclientnum);
        if (s_result._notify === #"hash_73ff8d0d706c332d" && s_result.e_attacker === self && isdefined(s_result.e_target)) {
            var_3da509de = s_result.e_target;
            self thread function_5ab769d8(localclientnum);
            self thread function_28291f40(localclientnum, s_result.e_target);
        } else {
            if (isdefined(var_3da509de) && var_3da509de !== s_result.e_target) {
                continue;
            }
            var_3da509de = undefined;
            self thread function_848179f5(localclientnum);
        }
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x1 linked
// Checksum 0x4786d16b, Offset: 0x1988
// Size: 0x104
function function_4700b6cd(localclientnum) {
    if (!isdefined(self)) {
        return;
    }
    self notify(#"hash_4ea2d9a0f785e09b");
    if (isdefined(self.var_3e52c79e[localclientnum])) {
        beamkill(localclientnum, self.var_3e52c79e[localclientnum]);
        self.var_3e52c79e[localclientnum] = undefined;
    }
    if (isdefined(self.var_2723e767[localclientnum])) {
        self.var_2723e767[localclientnum] delete();
        self.var_2723e767[localclientnum] = undefined;
    }
    if (isdefined(self.var_4cd8e6cb)) {
        self stoploopsound(self.var_4cd8e6cb);
        self.var_4cd8e6cb = undefined;
        self playsound(localclientnum, #"hash_3126b098b980b5a3");
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x1 linked
// Checksum 0xce61e299, Offset: 0x1a98
// Size: 0xac
function function_848179f5(localclientnum) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death", #"hash_4ea2d9a0f785e09b");
    if (!isdefined(self.var_4cd8e6cb)) {
        self playsound(localclientnum, #"hash_3765e25049981166");
        self.var_4cd8e6cb = self playloopsound(#"hash_170aa1970243fc4a");
    }
    self thread function_64148d8e(localclientnum);
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x1 linked
// Checksum 0x67cbfc99, Offset: 0x1b50
// Size: 0xa4
function function_64148d8e(localclientnum) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death", #"hash_4ea2d9a0f785e09b");
    wait(0.5);
    if (isdefined(self) && isdefined(self.var_4cd8e6cb)) {
        self stoploopsound(self.var_4cd8e6cb);
        self.var_4cd8e6cb = undefined;
        self playsound(localclientnum, #"hash_3126b098b980b5a3");
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 2, eflags: 0x1 linked
// Checksum 0xb691e5b5, Offset: 0x1c00
// Size: 0x232
function function_28291f40(localclientnum, e_target) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death", #"hash_4ea2d9a0f785e09b");
    if (!isdefined(self.var_4cd8e6cb)) {
        self playsound(localclientnum, #"hash_3765e25049981166");
        self.var_4cd8e6cb = self playloopsound(#"hash_170aa1970243fc4a");
    }
    var_1f694afe = "j_spinelower";
    if (e_target isai()) {
        if (e_target.archetype == #"zombie_dog") {
            var_1f694afe = "j_spine1";
        } else if (!isdefined(e_target gettagorigin(var_1f694afe))) {
            var_1f694afe = "tag_origin";
        }
        self.var_2723e767[localclientnum] = util::spawn_model(localclientnum, "tag_origin", e_target gettagorigin(var_1f694afe));
    } else if (e_target.type == "scriptmover") {
        var_1f694afe = "tag_origin";
        self.var_2723e767[localclientnum] = util::spawn_model(localclientnum, "tag_origin", e_target.origin);
    }
    self.var_2723e767[localclientnum] linkto(e_target, var_1f694afe);
    self.var_3e52c79e[localclientnum] = level beam::function_cfb2f62a(localclientnum, self, "tag_shield_key_fx", self.var_2723e767[localclientnum], "tag_origin", "beam8_zm_shield_key_ray_targeted");
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xaecfe9e1, Offset: 0x1e40
// Size: 0x450
function function_f9a03171(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.fx_muzzle_flash)) {
        self.fx_muzzle_flash = [];
    }
    if (isdefined(self.fx_muzzle_flash[localclientnum])) {
        deletefx(localclientnum, self.fx_muzzle_flash[localclientnum]);
        self.fx_muzzle_flash[localclientnum] = undefined;
    }
    a_e_players = getlocalplayers();
    foreach (e_player in a_e_players) {
        if (!e_player util::function_50ed1561(localclientnum)) {
            e_player notify(#"hash_52e05d0e2370536d");
        }
    }
    if (newval == 1) {
        var_27aa6343 = "spectral_key_muzzle_flash1p_idle";
        var_a1f103c8 = "spectral_key_muzzle_flash3p_idle";
        if (self zm_utility::function_f8796df3(localclientnum)) {
            self.fx_muzzle_flash[localclientnum] = playviewmodelfx(localclientnum, level._effect[var_27aa6343], "tag_flash");
        } else {
            self.fx_muzzle_flash[localclientnum] = util::playfxontag(localclientnum, level._effect[var_a1f103c8], self, "tag_flash");
        }
        a_e_players = getlocalplayers();
        foreach (e_player in a_e_players) {
            if (!e_player util::function_50ed1561(localclientnum)) {
                e_player thread zm_utility::function_ae3780f1(localclientnum, self.fx_muzzle_flash[localclientnum], #"hash_52e05d0e2370536d");
            }
        }
    } else if (newval == 2) {
        var_27aa6343 = "spectral_key_muzzle_flash1p";
        var_a1f103c8 = "spectral_key_muzzle_flash3p";
        if (self zm_utility::function_f8796df3(localclientnum)) {
            self.fx_muzzle_flash[localclientnum] = playviewmodelfx(localclientnum, level._effect[var_27aa6343], "tag_flash");
        } else {
            self.fx_muzzle_flash[localclientnum] = util::playfxontag(localclientnum, level._effect[var_a1f103c8], self, "tag_flash");
        }
        a_e_players = getlocalplayers();
        foreach (e_player in a_e_players) {
            if (!e_player util::function_50ed1561(localclientnum)) {
                e_player thread zm_utility::function_ae3780f1(localclientnum, self.fx_muzzle_flash[localclientnum], #"hash_52e05d0e2370536d");
            }
        }
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xb0d94a49, Offset: 0x2298
// Size: 0x166
function function_3f83a22f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_local_player = function_5c10bd79(localclientnum);
    if (e_local_player != self) {
        if (!isdefined(self.var_aa9e07fe)) {
            self.var_aa9e07fe = [];
        }
        if (isdefined(self.var_aa9e07fe[localclientnum])) {
            return;
        }
        if (!(isdefined(self.var_5427d523) && self.var_5427d523)) {
            self.var_5427d523 = 1;
            self.var_aa9e07fe[localclientnum] = util::playfxontag(localclientnum, level._effect[#"spectral_heal"], self, "j_spine4");
            fxhandle = self.var_aa9e07fe[localclientnum];
            wait(0.5);
            if (isdefined(fxhandle)) {
                stopfx(localclientnum, fxhandle);
                if (isdefined(self)) {
                    self.var_aa9e07fe[localclientnum] = undefined;
                    self.var_5427d523 = undefined;
                }
            }
        }
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x5 linked
// Checksum 0xe0f9c8d7, Offset: 0x2408
// Size: 0xf0
function private function_5ab769d8(localclientnum) {
    if (!isdefined(self)) {
        return;
    }
    self notify(#"hash_360be32d770a6eb2");
    self endon(#"death", #"hash_360be32d770a6eb2", #"hash_4ea2d9a0f785e09b");
    self playrumbleonentity(localclientnum, "zm_weap_scepter_ray_hit_rumble");
    wait(0.5);
    while (1) {
        if (isplayer(self) && self function_21c0fa55()) {
            self playrumbleonentity(localclientnum, "zm_weap_scepter_ray_rumble");
        }
        wait(0.5);
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xd3f9747e, Offset: 0x2500
// Size: 0x36c
function function_b570d455(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval == 0) {
        if (self isai()) {
            if (isdefined(self.var_961fed16)) {
                deletefx(localclientnum, self.var_961fed16, 1);
            }
            self.var_961fed16 = undefined;
            if (isdefined(self.var_5024b58) && self.var_5024b58) {
                zm_utility::function_704f7c0e(localclientnum);
                self.var_5024b58 = undefined;
            }
        } else if (isdefined(self.var_961fed16)) {
            deletefx(localclientnum, self.var_961fed16, 1);
            self.var_961fed16 = undefined;
        }
        if (isdefined(self.var_3415a5d7)) {
            self stoploopsound(self.var_3415a5d7);
            self.var_3415a5d7 = undefined;
        }
        level thread function_3dec76cb(localclientnum, self, undefined, 0);
    } else {
        e_attacker = getentbynum(localclientnum, newval - 1);
        if (self isai() && !(isdefined(self.isvehicle) && self.isvehicle)) {
            if (!isdefined(self.var_961fed16)) {
                str_tag = self zm_utility::function_467efa7b();
                self.var_961fed16 = util::playfxontag(localclientnum, level._effect[#"hash_5a834a39ce281cef"], self, str_tag);
            }
            if (!(isdefined(self.var_5024b58) && self.var_5024b58) && self.archetype !== #"ghost") {
                zm_utility::function_3a020b0f(localclientnum, "rob_zm_eyes_blue", level._effect[#"hash_6ca5cf8a3ac2254a"]);
                self.var_5024b58 = 1;
            }
        } else if (!isdefined(self.var_961fed16)) {
            self.var_961fed16 = util::playfxontag(localclientnum, level._effect[#"hash_5a834a39ce281cef"], self, "tag_origin");
        }
        if (!isdefined(self.var_3415a5d7)) {
            self.var_3415a5d7 = self playloopsound(#"hash_4c803bdbf30dd7fc");
        }
        level thread function_3dec76cb(localclientnum, self, e_attacker, 1);
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 4, eflags: 0x1 linked
// Checksum 0x83c433de, Offset: 0x2878
// Size: 0x1e4
function function_3dec76cb(localclientnum, e_target, e_attacker, var_19f39a16 = 1) {
    if (isdefined(var_19f39a16) && var_19f39a16) {
        waitframe(1);
    }
    while (isdefined(level.var_443d1164) && level.var_443d1164) {
        waitframe(1);
    }
    if (!isdefined(e_target)) {
        return;
    }
    if (var_19f39a16) {
        level notify(#"hash_73ff8d0d706c332d", {#e_attacker:e_attacker, #e_target:e_target});
        if (e_target.archetype === #"zombie_dog") {
            level thread function_9c08e4b6(localclientnum, e_target, e_attacker);
        }
    } else {
        level notify(#"hash_527d9fdde8903b80", {#e_attacker:e_attacker, #e_target:e_target});
        if (isdefined(e_target) && !isalive(e_target) && e_target.archetype === #"zombie") {
            util::playfxontag(localclientnum, level._effect[#"hash_28b1c64bd72686eb"], e_target, "j_spinelower");
            playsound(localclientnum, #"hash_5eb0bbabfbde1ce8", e_target.origin);
        }
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 3, eflags: 0x1 linked
// Checksum 0x39714a81, Offset: 0x2a68
// Size: 0x11c
function function_9c08e4b6(localclientnum, e_target, e_attacker) {
    if (isdefined(e_target)) {
        var_545d6c28 = e_target gettagorigin("j_spine1");
    }
    while (isalive(e_target) && isdefined(e_target.var_961fed16)) {
        var_545d6c28 = e_target gettagorigin("j_spine1");
        waitframe(1);
    }
    level notify(#"hash_527d9fdde8903b80", {#e_attacker:e_attacker, #e_target:e_target});
    if (!isalive(e_target) && isdefined(var_545d6c28)) {
        playsound(localclientnum, #"hash_5eb0bbabfbde1ce8", var_545d6c28);
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0x37b16e7e, Offset: 0x2b90
// Size: 0xf6
function function_5655dc55(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        if (isdefined(self.var_131284b6)) {
            deletefx(localclientnum, self.var_131284b6, 1);
        }
        self.var_131284b6 = util::playfxontag(localclientnum, level._effect[#"hash_29b0420a85baa71b"], self, "tag_origin");
    } else if (isdefined(self.var_131284b6)) {
        deletefx(localclientnum, self.var_131284b6, 1);
        self.var_131284b6 = undefined;
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xf21af113, Offset: 0x2c90
// Size: 0x416
function function_36c349d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.var_2a2f2afa)) {
        self.var_2a2f2afa = [];
    }
    if (!isdefined(self.var_b2b4e5eb)) {
        self.var_b2b4e5eb = [];
    }
    a_e_players = getlocalplayers();
    foreach (e_player in a_e_players) {
        if (!e_player util::function_50ed1561(localclientnum)) {
            return;
        }
    }
    if (isdefined(self.var_2a2f2afa[localclientnum])) {
        deletefx(localclientnum, self.var_2a2f2afa[localclientnum], 1);
        self.var_2a2f2afa[localclientnum] = undefined;
        self function_f6e99a8d("rob_key_charging", "tag_weapon_right");
    }
    if (isdefined(self.var_b2b4e5eb[localclientnum])) {
        deletefx(localclientnum, self.var_b2b4e5eb[localclientnum], 1);
        self.var_b2b4e5eb[localclientnum] = undefined;
        self function_f6e99a8d("rob_key_charged", "tag_weapon_right");
    }
    if (!isdefined(self.weapon)) {
        return;
    }
    if (!function_98890cd8(self.weapon)) {
        return;
    }
    if (newval == 1) {
        if (self zm_utility::function_f8796df3(localclientnum)) {
            self.var_2a2f2afa[localclientnum] = playviewmodelfx(localclientnum, level._effect[#"hash_5e08e3b80445f6d7"], "tag_flash");
            self playrenderoverridebundle("rob_key_charging", "tag_weapon_right");
        } else {
            self.var_2a2f2afa[localclientnum] = util::playfxontag(localclientnum, level._effect[#"hash_5e01d7b8043fc3c5"], self, "tag_flash");
        }
        self thread function_7203304d(localclientnum);
    } else if (newval == 2) {
        if (self zm_utility::function_f8796df3(localclientnum)) {
            self.var_b2b4e5eb[localclientnum] = playviewmodelfx(localclientnum, level._effect[#"hash_3ae08d08271270d6"], "tag_flash");
            self playrenderoverridebundle("rob_key_charged", "tag_weapon_right");
        } else {
            self.var_2a2f2afa[localclientnum] = util::playfxontag(localclientnum, level._effect[#"hash_3ad9a108270c7424"], self, "tag_flash");
        }
        self thread function_7203304d(localclientnum);
    } else {
        self notify(#"hash_479f7dbb037c00bc");
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 1, eflags: 0x1 linked
// Checksum 0x3ed35e16, Offset: 0x30b0
// Size: 0x162
function function_7203304d(localclientnum) {
    self endon(#"death", #"disconnect");
    while (1) {
        self waittill(#"weapon_change", #"hash_479f7dbb037c00bc");
        if (!function_98890cd8(self.weapon)) {
            if (isdefined(self.var_2a2f2afa[localclientnum])) {
                deletefx(localclientnum, self.var_2a2f2afa[localclientnum], 1);
                self.var_2a2f2afa[localclientnum] = undefined;
                self function_f6e99a8d("rob_key_charging", "tag_weapon_right");
            }
            if (isdefined(self.var_b2b4e5eb[localclientnum])) {
                deletefx(localclientnum, self.var_b2b4e5eb[localclientnum], 1);
                self.var_b2b4e5eb[localclientnum] = undefined;
                self function_f6e99a8d("rob_key_charged", "tag_weapon_right");
            }
            return;
        }
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xedaedea6, Offset: 0x3220
// Size: 0x11c
function function_50119cc1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!function_98890cd8(self.weapon)) {
        return;
    }
    str_tag = "tag_flash";
    if (!isdefined(self gettagorigin("tag_flash"))) {
        str_tag = "tag_weapon_right";
    }
    if (self zm_utility::function_f8796df3(localclientnum)) {
        playviewmodelfx(localclientnum, level._effect[#"hash_a64dd624f3d5eff"], str_tag);
    } else {
        util::playfxontag(localclientnum, level._effect[#"hash_a5ef1624f39154d"], self, str_tag);
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0xbf394f2a, Offset: 0x3348
// Size: 0x2ec
function function_6b58c030(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.var_3e85852d)) {
        self.var_3e85852d = [];
    }
    w_current = self.weapon;
    if (w_current !== getweapon(#"hash_185abc5c82e9d849") && w_current !== getweapon(#"hash_158041aab1e14f3a")) {
        return;
    }
    if (isdefined(self.var_3e85852d[localclientnum])) {
        deletefx(localclientnum, self.var_3e85852d[localclientnum], 1);
    }
    if (self zm_utility::function_f8796df3(localclientnum)) {
        self.var_3e85852d[localclientnum] = playviewmodelfx(localclientnum, level._effect[#"hash_4a41e8484e30822e"], "tag_body_window");
    } else {
        self.var_3e85852d[localclientnum] = util::playfxontag(localclientnum, level._effect[#"hash_4a3bdc484e2c021c"], self, "tag_body_window");
    }
    util::playfxontag(localclientnum, level._effect[#"air_blast"], self, "tag_origin");
    var_d58aab0e = util::spawn_model(localclientnum, "tag_origin", self gettagorigin("tag_flash_window"), self gettagangles("tag_flash_window"));
    var_d58aab0e linkto(self, "tag_flash_window");
    var_d58aab0e scene::play(#"p8_fxanim_zm_esc_blast_afterlife_bundle");
    var_d58aab0e unlink();
    var_d58aab0e delete();
    if (isdefined(self)) {
        if (isdefined(self.var_3e85852d[localclientnum])) {
            deletefx(localclientnum, self.var_3e85852d[localclientnum], 1);
        }
        self.var_3e85852d[localclientnum] = undefined;
    }
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 2, eflags: 0x1 linked
// Checksum 0xe5842754, Offset: 0x3640
// Size: 0xda
function function_98890cd8(w_current, var_94c10bbd = 0) {
    if (!var_94c10bbd) {
        if (w_current == getweapon(#"zhield_spectral_dw") || w_current == getweapon(#"zhield_spectral_dw_upgraded")) {
            return 1;
        }
    }
    if (w_current == getweapon(#"hash_185abc5c82e9d849") || w_current == getweapon(#"hash_158041aab1e14f3a")) {
        return 1;
    }
    return 0;
}

// Namespace zm_weap_spectral_shield/zm_weap_spectral_shield
// Params 7, eflags: 0x1 linked
// Checksum 0x2c36f19d, Offset: 0x3728
// Size: 0x74
function function_107af28d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"shield_crafting"], self, "tag_origin");
}

