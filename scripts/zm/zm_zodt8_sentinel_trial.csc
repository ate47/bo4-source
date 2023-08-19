// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_weapons.csc;
#include scripts/zm_common/zm_utility.csc;
#include script_624a704d0f6bf28d;
#include scripts/zm_common/zm_powerups.csc;
#include scripts/core_common/water_surface.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/flagsys_shared.csc;
#include scripts/core_common/flag_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/array_shared.csc;

#namespace zodt8_sentinel;

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 0, eflags: 0x1 linked
// Checksum 0xb69f00ea, Offset: 0x1e8
// Size: 0x44
function init() {
    init_clientfields();
    init_flags();
    init_fx();
    function_91be5845();
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 0, eflags: 0x1 linked
// Checksum 0xfe08cc6e, Offset: 0x238
// Size: 0x8cc
function init_clientfields() {
    clientfield::register("world", "" + #"hash_3c58464f16d8a1be", 1, 1, "int", &function_503f6096, 0, 0);
    clientfield::register("scriptmover", "" + #"land_fx", 1, 1, "int", &function_48719840, 0, 0);
    clientfield::register("scriptmover", "" + #"essence_fx", 1, 1, "int", &function_92436a06, 0, 0);
    clientfield::register("scriptmover", "" + #"planet_light", 1, getminbitcountfornum(9), "int", &function_e7c0fb8c, 0, 0);
    clientfield::register("scriptmover", "" + #"planet_fx", 1, getminbitcountfornum(9), "int", &planet_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"pulse_shader", 1, 1, "int", &function_14dcccc6, 0, 0);
    clientfield::register("scriptmover", "" + #"sentinel_shader", 1, 1, "int", &function_b59986cf, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_3400ccffbd3d73b3", 1, 2, "int", &function_49661954, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_15b23de7589e61a", 1, 1, "int", &function_25a6443, 0, 0);
    clientfield::register("scriptmover", "" + #"blocker_fx", 1, 1, "int", &function_74e395f7, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_68e2384b254175da", 1, 1, "counter", &function_9a686624, 0, 0);
    clientfield::register("scriptmover", "" + #"pipe_fx", 1, 2, "int", &pipe_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"teleport_sigil", 1, 1, "int", &teleport_sigil, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_46e2ed49fb0f55c6", 1, 1, "int", &function_9f92e675, 0, 0);
    clientfield::register("scriptmover", "" + #"water_props", 1, 1, "int", &function_2d798d9a, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_6e41de51a0092771", 1, 1, "int", &function_dd0c6ccb, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_53c7d27cc9130e8f", 1, getminbitcountfornum(4), "int", &function_33aa16f0, 0, 0);
    clientfield::register("toplayer", "" + #"boiler_fx", 1, 1, "int", &function_d592393d, 0, 0);
    clientfield::register("toplayer", "" + #"main_flash", 1, 1, "int", &function_94822f89, 0, 0);
    clientfield::register("toplayer", "" + #"iceberg_rumbles", 1, 1, "int", &function_ac4395b, 0, 0);
    clientfield::register("toplayer", "" + #"hash_7a927551ca199a1c", 1, 1, "counter", &function_9491a41e, 0, 0);
    clientfield::register("toplayer", "" + #"icy_bubbles", 1, 1, "int", &function_c6880d07, 0, 0);
    clientfield::register("toplayer", "" + #"hash_58b44c320123e829", 1, 1, "int", &function_1697bc59, 0, 0);
    clientfield::register("toplayer", "" + #"camera_snow", 1, 1, "int", &camera_snow, 0, 0);
    clientfield::register("vehicle", "" + #"orb_fx", 1, 1, "int", &function_57196646, 0, 0);
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xb10
// Size: 0x4
function init_flags() {
    
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 0, eflags: 0x1 linked
// Checksum 0x4a86f69d, Offset: 0xb20
// Size: 0x9f2
function init_fx() {
    level._effect[#"hash_2e7f9a3bff90af4a"] = #"hash_7b0d80c48289dd0b";
    level._effect[#"hash_573af1567956ac69"] = #"hash_661da9149933ecf9";
    level._effect[#"hash_538a9337bb9927da"] = #"zm_ai/fx8_cata_elec_aura";
    level._effect[#"hash_3dba8e7d212e4382"] = #"hash_641c2257723638c2";
    level._effect[#"hash_59916e76378fa3d8"] = #"hash_62eafc17a432322a";
    level._effect[#"hash_1e6b4bfa36f9487b"] = #"hash_1832a0ef5af0040d";
    level._effect[#"hash_4b9011909a431ac8"] = #"hash_619361bb6a9a5d2d";
    level._effect[#"hash_50a595992ac285d0"] = #"hash_3009e42178ffd484";
    level._effect[#"hash_4ab2496c89a7d871"] = #"hash_4a305119bc50ca3d";
    level._effect[#"packed_artifact"] = #"zombie/fx_ritual_glow_relic_zod_zmb";
    level._effect[#"catalyst_blocker"] = #"hash_5b773dbbac0012ff";
    level._effect[#"sentinel_aura"] = #"hash_3def678deb7f4078";
    level._effect[#"sentinel_activate"] = #"hash_464f27bfbf0ce7bf";
    level._effect[#"sentinel_glow"] = #"hash_41b2c270f26faabc";
    level._effect[#"jupiter_glow"] = #"hash_55ea6f0ddba66d44";
    level._effect[#"saturn_glow"] = #"hash_69afd734b3a42e4";
    level._effect[#"uranus_glow"] = #"hash_3f6350484ab2986b";
    level._effect[#"mars_glow"] = #"hash_ae75b80f4484d6a";
    level._effect[#"mercury_glow"] = #"hash_53011431a4abc4d0";
    level._effect[#"sun_glow"] = #"hash_7ff11c8ee1217d6f";
    level._effect[#"venus_glow"] = #"hash_22922c09fc971250";
    level._effect[#"neptune_glow"] = #"hash_74fd337197b421f8";
    level._effect[#"glyph_activate"] = #"hash_6a4db7ffc84cf7fc";
    level._effect[#"orb_trail"] = #"hash_6d900123df67f4ce";
    level._effect[#"orb_essence"] = #"hash_2aac2efa85bfb786";
    level._effect[#"hash_2dd4629ae81753e5"] = #"hash_203548b984de70a4";
    level._effect[#"hash_23c18b717592a89d"] = #"hash_43cec289a09441e9";
    level._effect[#"hash_2bb182b164a2d789"] = #"hash_71fc8c15d53b5fe2";
    level._effect[#"hash_4274dc30c3876166"] = #"hash_2f27882b95a820fd";
    level._effect[#"ice_blocker"] = #"hash_55a1d3ce6c554a7a";
    level._effect[#"hash_53533bf74eb74209"] = #"hash_2909be1122353509";
    level._effect[#"hash_535338f74eb73cf0"] = #"hash_28b4c41121ecff3c";
    level._effect[#"hash_452505f92d084e74"] = #"hash_7fb7de4ea65f1b9d";
    level._effect[#"hash_6160e75bd4d4852"] = #"hash_369788360ca4879d";
    level._effect[#"hash_3316f2b0a2dcecda"] = #"hash_56e16e07d428fead";
    level._effect[#"step7_snow"] = #"hash_d778729ca762c5a";
    level._effect[#"loc_jupiter"] = #"hash_618dd5f64c043c98";
    level._effect[#"loc_saturn"] = #"hash_c02fd55105bf590";
    level._effect[#"loc_uranus"] = #"hash_28b92cc776e22757";
    level._effect[#"loc_neptune"] = #"hash_7f0ec9b1b2e75c04";
    level._effect[#"loc_mars"] = #"hash_1a3f1102ecab4c66";
    level._effect[#"loc_venus"] = #"hash_762bfc3142f1039c";
    level._effect[#"loc_mercury"] = #"hash_68cc20f5cb8f2474";
    level._effect[#"loc_sun"] = #"hash_7d600aa6483d645b";
    level._effect[#"loc_moon"] = #"hash_7111a6031de7ead2";
    level._effect[#"hash_5c7f484e340fdde6"] = #"hash_728126700110e700";
    level._effect[#"hash_331f4a597e6c0189"] = #"hash_1899ecdfcd7daa00";
    level._effect[#"hash_345b045ea57a58e8"] = #"hash_231dd4d8a69cc3b2";
    level._effect[#"sigil_on"] = #"hash_454a052cba35b654";
    level._effect[#"sigil_off"] = #"hash_22f995964a88d0e0";
    level._effect[#"tree_impact"] = #"hash_39b325729fc733ae";
    level._effect[#"tree_trail"] = #"hash_4d7b9b72e10c3737";
    level._effect[#"tree_activate"] = #"hash_6776cc88134ba740";
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 0, eflags: 0x1 linked
// Checksum 0xb727e42f, Offset: 0x1520
// Size: 0x344
function function_91be5845() {
    namespace_617a54f4::function_d8383812(#"hash_41a5c5168ffb2a97", 1, #"hash_3d7f94e7862a63ab", 50, level._effect[#"hash_2e7f9a3bff90af4a"], level._effect[#"hash_59916e76378fa3d8"], undefined, &function_7729e81c);
    namespace_617a54f4::function_d8383812(#"hash_400a481490a4e390", 1, #"hash_3d7f94e7862a63ab", 50, level._effect[#"hash_573af1567956ac69"], level._effect[#"hash_1e6b4bfa36f9487b"], undefined, &function_7729e81c);
    namespace_617a54f4::function_d8383812(#"hash_5562e324d230f057", 1, #"hash_3d7f94e7862a63ab", 50, level._effect[#"hash_538a9337bb9927da"], level._effect[#"hash_4b9011909a431ac8"], undefined, &function_7729e81c);
    namespace_617a54f4::function_d8383812(#"hash_41fae186552f1259", 1, #"hash_3d7f94e7862a63ab", 50, level._effect[#"hash_3dba8e7d212e4382"], level._effect[#"hash_50a595992ac285d0"], undefined, &function_7729e81c);
    namespace_617a54f4::function_d8383812(#"hash_7182a46bb3cdf577", 1, #"hash_7182a46bb3cdf577", 111, level._effect[#"hash_2e7f9a3bff90af4a"], level._effect[#"hash_59916e76378fa3d8"], undefined);
    namespace_617a54f4::function_d8383812(#"hash_466c2764cc790370", 1, #"hash_466c2764cc790370", 111, level._effect[#"hash_573af1567956ac69"], level._effect[#"hash_1e6b4bfa36f9487b"], undefined);
    namespace_617a54f4::function_d8383812(#"hash_34f2b4c4f7d74137", 1, #"hash_34f2b4c4f7d74137", 111, level._effect[#"hash_538a9337bb9927da"], level._effect[#"hash_4b9011909a431ac8"], undefined);
    namespace_617a54f4::function_d8383812(#"hash_49ad34a64ecaebb9", 1, #"hash_49ad34a64ecaebb9", 111, level._effect[#"hash_3dba8e7d212e4382"], level._effect[#"hash_50a595992ac285d0"], undefined);
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 3, eflags: 0x1 linked
// Checksum 0x5d153da3, Offset: 0x1870
// Size: 0x1c
function function_7729e81c(localclientnum, def, s_capture_point) {
    
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x208f7165, Offset: 0x1898
// Size: 0x124
function function_33aa16f0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 1:
        str_fx = #"hash_2e7f9a3bff90af4a";
        break;
    case 2:
        str_fx = #"hash_573af1567956ac69";
        break;
    case 3:
        str_fx = #"hash_538a9337bb9927da";
        break;
    case 4:
        str_fx = #"hash_3dba8e7d212e4382";
        break;
    }
    util::playfxontag(localclientnum, level._effect[str_fx], self, "tag_fx_x_pos");
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0xb85d1915, Offset: 0x19c8
// Size: 0x84
function function_dd0c6ccb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle("rob_zod_vista_light_fade");
    } else {
        self stoprenderoverridebundle("rob_zod_vista_light_fade");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x15c4350f, Offset: 0x1a58
// Size: 0x202
function planet_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 1:
        str_fx = level._effect[#"sun_glow"];
        break;
    case 2:
        str_fx = level._effect[#"mercury_glow"];
        break;
    case 3:
        str_fx = level._effect[#"venus_glow"];
        break;
    case 5:
        str_fx = level._effect[#"mars_glow"];
        break;
    case 6:
        str_fx = level._effect[#"jupiter_glow"];
        break;
    case 7:
        str_fx = level._effect[#"saturn_glow"];
        break;
    case 8:
        str_fx = level._effect[#"uranus_glow"];
        break;
    case 9:
        str_fx = level._effect[#"neptune_glow"];
        break;
    }
    if (isdefined(str_fx)) {
        self.var_ed5e3059 = util::playfxontag(localclientnum, str_fx, self, "tag_origin");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0xe20aebe3, Offset: 0x1c68
// Size: 0x13c
function camera_snow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify("28d26c912677b144");
    self endon("28d26c912677b144");
    if (newval) {
        while (1) {
            if (isalive(self) && self util::function_50ed1561(localclientnum)) {
                self.var_77f256b5 = playfxoncamera(localclientnum, level._effect[#"step7_snow"], undefined, anglestoforward(self.angles), anglestoup(self.angles));
            }
            wait(0.25);
        }
    } else if (isdefined(self.var_77f256b5)) {
        stopfx(localclientnum, self.var_77f256b5);
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x2c132c70, Offset: 0x1db0
// Size: 0x172
function function_2d798d9a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self util::waittill_dobj(localclientnum);
        while (isdefined(self)) {
            n_x_move = randomintrange(-64, 64);
            var_4cf7f9d1 = randomintrange(-64, 64);
            var_c53a4cdc = randomintrange(-64, 64);
            self moveto(self.origin + (n_x_move, var_4cf7f9d1, var_c53a4cdc), randomintrange(10, 20));
            s_result = undefined;
            s_result = self waittill(#"movedone", #"death");
            if (s_result._notify == "death") {
                return;
            }
        }
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0xd3e81c66, Offset: 0x1f30
// Size: 0x236
function function_1697bc59(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        a_s_locs = struct::get_array(#"water_corpse");
        foreach (s_loc in a_s_locs) {
            n_x_offset = randomintrange(-32, 32);
            n_y_offset = randomintrange(-32, 32);
            physicsexplosionsphere(localclientnum, s_loc.origin + (n_x_offset, n_y_offset, 32), 64, 32, 0.15, undefined, undefined, 1, 1, 1);
            waitframe(1);
        }
        s_loc = struct::get(#"hash_1f307b5cf6d83aff");
        n_z_offset = 400;
        while (level flag::get(#"hash_13dc8f128d50bada")) {
            physicsexplosionsphere(localclientnum, s_loc.origin + (0, 0, n_z_offset), 3200, 32, 0.1, undefined, undefined, 1, 1, 1);
            wait(randomintrange(3, 6));
            n_z_offset = n_z_offset * -1;
        }
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 1, eflags: 0x1 linked
// Checksum 0xd54eb1af, Offset: 0x2170
// Size: 0xf6
function function_89ecbecc(localclientnum) {
    self endon(#"leaving_iceberg");
    waitframe(1);
    while (isalive(self)) {
        n_speed = self getspeed();
        if (n_speed > 64) {
            n_radius = max(64, n_speed * 0.7);
        } else {
            n_radius = 64;
        }
        n_magnitude = n_radius / 80;
        physicsexplosionsphere(localclientnum, self geteye(), n_radius, n_radius, n_magnitude);
        waitframe(1);
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x2e088dce, Offset: 0x2270
// Size: 0x28c
function function_c6880d07(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify(#"underwaterwatchbegin");
    self endon(#"death");
    if (newval) {
        self thread function_89ecbecc(localclientnum);
        level flag::set(#"hash_13dc8f128d50bada");
        function_a1c09ed(-800 * vectorscale((0, 0, 1), 0.005));
        self thread function_9ecc1074(localclientnum);
        self notify(#"hash_6aa4f28f27ab4c64");
        do {
            waitframe(1);
        } while(self postfx::function_556665f2(#"pstfx_zm_wormhole"));
        n_val = 0.1;
        self thread postfx::playpostfxbundle(#"pstfx_frost_loop");
        while (n_val <= 0.33) {
            self function_116b95e5(#"pstfx_frost_loop", "Reveal Threshold", n_val);
            wait(0.25);
            n_val = n_val + 0.01;
        }
    } else {
        function_a1c09ed(-800 * (0, 0, 1));
        level flag::clear(#"hash_13dc8f128d50bada");
        self notify(#"leaving_iceberg");
        if (self util::function_50ed1561(localclientnum)) {
            if (isdefined(self.firstperson_water_fx)) {
                stopfx(localclientnum, self.firstperson_water_fx);
                self.firstperson_water_fx = undefined;
            }
            self thread water_surface::underwaterwatchbegin();
        }
        self postfx::stoppostfxbundle(#"pstfx_frost_loop");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 1, eflags: 0x1 linked
// Checksum 0x953ad43a, Offset: 0x2508
// Size: 0x100
function function_9ecc1074(localclientnum) {
    self endon(#"underwaterwatchbegin");
    s_result = undefined;
    s_result = self waittill(#"underwater_begin", #"death");
    if (s_result._notify == "underwater_begin") {
        while (isalive(self)) {
            if (self util::function_50ed1561(localclientnum)) {
                self.var_733dd716 = playfxoncamera(localclientnum, level._effect[#"hash_1e7095084eda811c"], (0, 0, 0), (1, 0, 0), (0, 0, 1));
            }
            wait(randomintrange(15, 20));
        }
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0xcd4c9917, Offset: 0x2610
// Size: 0xb0
function function_9491a41e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!self postfx::function_556665f2(#"pstfx_frost_loop")) {
        self thread postfx::playpostfxbundle(#"pstfx_frost_loop");
        self thread function_bcb676b9();
        waitframe(1);
    }
    level notify(#"hash_5010527c7518e767");
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 0, eflags: 0x1 linked
// Checksum 0x293d4891, Offset: 0x26c8
// Size: 0x184
function function_bcb676b9() {
    self endon(#"hash_6aa4f28f27ab4c64", #"death");
    n_val = 0.1;
    while (1) {
        s_result = undefined;
        s_result = level waittilltimeout(20, #"hash_5010527c7518e767");
        if (isalive(self) && s_result._notify == #"hash_5010527c7518e767") {
            self function_116b95e5(#"pstfx_frost_loop", "Reveal Threshold", n_val);
            n_val = n_val + 0.1;
            if (n_val > 1) {
                break;
            }
        } else {
            break;
        }
    }
    waitframe(1);
    n_val = n_val - 0.1;
    while (n_val > 0) {
        self function_116b95e5(#"pstfx_frost_loop", "Reveal Threshold", n_val);
        n_val = n_val - 0.1;
        wait(3);
    }
    self postfx::stoppostfxbundle(#"pstfx_frost_loop");
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x92481bc2, Offset: 0x2858
// Size: 0x12c
function teleport_sigil(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_2880a6b3)) {
        killfx(localclientnum, self.var_2880a6b3);
        self.var_2880a6b3 = undefined;
    }
    if (newval == 1) {
        self.var_2880a6b3 = playfx(localclientnum, level._effect[#"sigil_off"], self.origin, (1, 0, 0));
    } else {
        self.var_2880a6b3 = playfx(localclientnum, level._effect[#"sigil_on"], self.origin, (1, 0, 0));
    }
    level thread function_8b8f2a41(localclientnum, self, self.var_2880a6b3);
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 3, eflags: 0x1 linked
// Checksum 0xed95f88c, Offset: 0x2990
// Size: 0x6c
function function_8b8f2a41(localclientnum, e_sigil, var_2880a6b3) {
    self notify("2f09079d0cfe9c7f");
    self endon("2f09079d0cfe9c7f");
    e_sigil waittill(#"death");
    if (isdefined(var_2880a6b3)) {
        killfx(localclientnum, var_2880a6b3);
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x1b8c4f4e, Offset: 0x2a08
// Size: 0x20a
function pipe_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_240d8445)) {
        stopfx(localclientnum, self.var_240d8445);
    }
    if (isdefined(self.var_143576dc)) {
        self stoploopsound(self.var_143576dc);
    }
    if (newval == 1) {
        self.var_240d8445 = util::playfxontag(localclientnum, level._effect[#"hash_5c7f484e340fdde6"], self, "tag_origin");
        self.var_143576dc = self playloopsound(#"hash_1d4b0119c9f1d519");
    } else if (newval == 2) {
        self.var_240d8445 = util::playfxontag(localclientnum, level._effect[#"hash_331f4a597e6c0189"], self, "tag_origin");
        self playsound(localclientnum, #"hash_581cce02962580b7");
        self.var_143576dc = self playloopsound(#"hash_5518d837f78963fc");
    } else {
        self.var_240d8445 = util::playfxontag(localclientnum, level._effect[#"hash_345b045ea57a58e8"], self, "tag_origin");
        self.var_143576dc = self playloopsound(#"hash_5557e7b7271b8aff");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0xa61cb5f1, Offset: 0x2c20
// Size: 0xe4
function function_25a6443(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (newval == 1) {
        self.fx_iceberg = util::playfxontag(localclientnum, level._effect[#"hash_3316f2b0a2dcecda"], self, "tag_origin");
    } else if (isdefined(self.fx_iceberg)) {
        stopfx(localclientnum, self.fx_iceberg);
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0xfa529367, Offset: 0x2d10
// Size: 0x2cc
function function_49661954(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.var_9176527d = util::playfxontag(localclientnum, level._effect[#"ice_blocker"], self, "tag_origin");
        self playsound(localclientnum, #"hash_3f083cd717314926");
        if (!isdefined(self.var_dbd58e36)) {
            self.var_dbd58e36 = self playloopsound(#"hash_cbff0b64fa402d7");
        }
    } else if (newval == 2) {
        self playsound(localclientnum, #"hash_1892310a436314b2");
        util::playfxontag(localclientnum, level._effect[#"hash_53533bf74eb74209"], self, "tag_origin");
    } else if (newval == 3) {
        self playsound(localclientnum, #"hash_1892310a436314b2");
        util::playfxontag(localclientnum, level._effect[#"hash_535338f74eb73cf0"], self, "tag_origin");
    } else {
        if (isdefined(self.var_9176527d)) {
            killfx(localclientnum, self.var_9176527d);
            self.var_9176527d = undefined;
        }
        if (isdefined(self.var_dbd58e36)) {
            self stoploopsound(self.var_dbd58e36);
        }
        self playsound(localclientnum, #"hash_28d76e47e3d57bf6");
        util::playfxontag(localclientnum, level._effect[#"hash_535338f74eb73cf0"], self, "tag_origin");
        util::playfxontag(localclientnum, level._effect[#"hash_452505f92d084e74"], self, "tag_origin");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x6e21f28f, Offset: 0x2fe8
// Size: 0x84
function function_94822f89(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread postfx::playpostfxbundle("pstfx_zodt8_screenflash");
    } else {
        self thread postfx::stoppostfxbundle("pstfx_zodt8_screenflash");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x58a2522e, Offset: 0x3078
// Size: 0x9c
function function_ac4395b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrumbleonentity(localclientnum, #"hash_67ca45018833af1d");
    } else {
        self playrumbleonentity(localclientnum, #"hash_55b8ea7312be930e");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x6bf2ab46, Offset: 0x3120
// Size: 0xd4
function function_9a686624(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        fx = util::playfxontag(localclientnum, level._effect[#"glyph_activate"], self, "tag_origin");
        playsound(localclientnum, #"hash_6dfc68e5f7739824", self.origin);
        wait(3.5);
        if (isdefined(fx)) {
            stopfx(localclientnum, fx);
        }
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0xd71e5100, Offset: 0x3200
// Size: 0x19e
function function_74e395f7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        v_forward = anglestoforward(self.angles);
        self.blocker_fx = playfx(localclientnum, level._effect[#"catalyst_blocker"], self.origin, v_forward);
        if (!isdefined(self.var_99a9007b)) {
            self playsound(localclientnum, #"hash_2c71df73b17cd28a");
            self.var_99a9007b = self playloopsound(#"hash_7e4a7312ab58161e");
        }
    } else {
        if (isdefined(self.blocker_fx)) {
            stopfx(localclientnum, self.blocker_fx);
        }
        if (isdefined(self.var_99a9007b)) {
            self playsound(localclientnum, #"hash_3366b1b903dc96bf");
            self stoploopsound(self.var_99a9007b);
            self.var_99a9007b = undefined;
        }
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x102fcfb9, Offset: 0x33a8
// Size: 0xbe
function function_b59986cf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_32a8bada = util::playfxontag(localclientnum, level._effect[#"packed_artifact"], self, "tag_origin");
    } else if (isdefined(self.var_32a8bada)) {
        stopfx(localclientnum, self.var_32a8bada);
        self.var_32a8bada = undefined;
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x1d4fdb71, Offset: 0x3470
// Size: 0xec
function function_d592393d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    b_underwater = self isplayerswimmingunderwater();
    if (newval) {
        self thread postfx::playpostfxbundle(#"hash_5513ce472ffeb0f3");
        if (!b_underwater) {
            setpbgactivebank(localclientnum, 4);
        }
    } else {
        if (!b_underwater) {
            setpbgactivebank(localclientnum, 1);
        }
        self postfx::stoppostfxbundle(#"hash_5513ce472ffeb0f3");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0xbec11b8, Offset: 0x3568
// Size: 0xe4
function function_48719840(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        util::playfxontag(localclientnum, level._effect[#"hash_23c18b717592a89d"], self, "tag_origin");
        function_36e4ebd4(localclientnum, #"zm_zodt8_planet_impact");
    } else {
        playfx(localclientnum, level._effect[#"hash_2bb182b164a2d789"], self.origin);
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x410ffd36, Offset: 0x3658
// Size: 0x21e
function function_92436a06(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_ed5e3059)) {
        stopfx(localclientnum, self.var_ed5e3059);
    }
    if (newval == 1) {
        self endon(#"death");
        self util::waittill_dobj(localclientnum);
        util::playfxontag(localclientnum, level._effect[#"hash_4274dc30c3876166"], self, "tag_origin");
        if (self.origin[2] < 2000) {
            self.var_92d5024f = util::playfxontag(localclientnum, level._effect[#"hash_2dd4629ae81753e5"], self, "tag_origin");
        } else {
            self.var_92d5024f = util::playfxontag(localclientnum, level._effect[#"orb_essence"], self, "tag_origin");
        }
        self.n_fx_trail = util::playfxontag(localclientnum, level._effect[#"orb_trail"], self, "tag_origin");
    } else {
        if (isdefined(self.var_92d5024f)) {
            killfx(localclientnum, self.var_92d5024f);
            self.var_92d5024f = undefined;
        }
        if (isdefined(self.n_fx_trail)) {
            killfx(localclientnum, self.n_fx_trail);
            self.n_fx_trail = undefined;
        }
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x2e130280, Offset: 0x3880
// Size: 0x2e4
function function_e7c0fb8c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_46730a76)) {
        killfx(localclientnum, self.var_46730a76);
    }
    if (newval == 0) {
        playsound(localclientnum, #"hash_5dea4034a9243dbc", self.origin);
        return;
    }
    switch (newval) {
    case 1:
        str_fx = #"loc_sun";
        break;
    case 2:
        str_fx = #"loc_mercury";
        break;
    case 3:
        str_fx = #"loc_venus";
        break;
    case 4:
        str_fx = #"loc_moon";
        break;
    case 5:
        str_fx = #"loc_mars";
        break;
    case 6:
        str_fx = #"loc_jupiter";
        break;
    case 7:
        str_fx = #"loc_saturn";
        break;
    case 8:
        str_fx = #"loc_uranus";
        break;
    case 9:
        str_fx = #"loc_neptune";
        break;
    }
    str_tag = struct::get(str_fx).str_tag_name;
    self.var_46730a76 = util::playfxontag(localclientnum, level._effect[str_fx], self, str_tag);
    if (newval == 1) {
        playsound(localclientnum, #"hash_5b84a753cb771ae0", self.origin);
    } else {
        playsound(localclientnum, #"hash_6be991aa330022ca", self.origin);
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x9cd1ca03, Offset: 0x3b70
// Size: 0x1e4
function function_14dcccc6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"stop_shader");
    n_pulse = 0.4;
    while (isdefined(self)) {
        n_cycle_time = randomfloatrange(2, 8);
        n_pulse_increment = (1 - 0.4) / n_cycle_time / 0.1;
        while (n_pulse < 1 && isdefined(self)) {
            self mapshaderconstant(0, 0, "scriptVector0", 1, n_pulse, 0, 0);
            n_pulse = n_pulse + n_pulse_increment;
            wait(0.1);
        }
        n_cycle_time = randomfloatrange(2, 8);
        n_pulse_increment = (1 - 0.4) / n_cycle_time / 0.1;
        while (0.4 < n_pulse && isdefined(self)) {
            self mapshaderconstant(0, 0, "scriptVector0", 1, n_pulse, 0, 0);
            n_pulse = n_pulse - n_pulse_increment;
            wait(0.1);
        }
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x6c57a3e9, Offset: 0x3d60
// Size: 0x168
function function_9f92e675(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify("43af242cd886e3af");
    self endon("43af242cd886e3af");
    self endon(#"death");
    if (newval == 1) {
        util::playfxontag(localclientnum, level._effect[#"tree_activate"], self, "tag_origin");
        self playsound(localclientnum, #"hash_35bdc93fbbad3294");
        self.var_3765ceb0 = self playloopsound(#"hash_453bd80432d8f383");
        wait(0.25);
        while (isdefined(self)) {
            physicsexplosionsphere(localclientnum, self.origin, 3000, 1, 4, 1, 1, 1, 1, 1);
            waitframe(randomintrange(5, 10));
        }
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x45b66331, Offset: 0x3ed0
// Size: 0x134
function function_57196646(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        util::playfxontag(localclientnum, level._effect[#"tree_trail"], self, "tag_origin");
        self playsound(localclientnum, #"hash_c5737dedcdad3a8");
    } else {
        util::playfxontag(localclientnum, level._effect[#"tree_impact"], self, "tag_origin");
        self playsound(localclientnum, #"hash_3d9dcef3d979480b");
        function_36e4ebd4(localclientnum, #"zm_zodt8_planet_impact");
    }
}

// Namespace zodt8_sentinel/zm_zodt8_sentinel_trial
// Params 7, eflags: 0x1 linked
// Checksum 0x8cf79ee, Offset: 0x4010
// Size: 0x84
function function_503f6096(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_a5777754(localclientnum, "ee_space");
    } else {
        function_73b1f242(localclientnum, "ee_space");
    }
}

