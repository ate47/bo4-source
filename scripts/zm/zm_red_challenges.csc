// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using script_624a704d0f6bf28d;
#using script_3535cbd276d2c358;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_red_challenges;

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x16dfbb97, Offset: 0x178
// Size: 0x72e
function init() {
    if (zm_utility::is_standard()) {
        return;
    }
    clientfield::register("scriptmover", "" + #"hash_74fc30de57a0657a", 16000, 3, "int", &function_de1bffd6, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_21f5fab6a3d22093", 16000, 3, "int", &function_9ed71eeb, 0, 0);
    clientfield::register("scriptmover", "" + #"keyline_model", 16000, 1, "int", &keyline_model, 0, 0);
    clientfield::register("scriptmover", "" + #"pickup_glow", 16000, 1, "int", &pickup_glow, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_8b48433c3fe40e4", 16000, 3, "int", &function_75ac8f21, 0, 0);
    clientfield::register("toplayer", "" + #"hash_4bde11d71410ea67", 16000, 3, "int", &function_250bbf4e, 0, 0);
    clientfield::register("world", "" + #"cleanup_challenges", 16000, 1, "int", &cleanup_challenges, 0, 0);
    clientfield::register("allplayers", "" + #"hash_47490b879090eb55", 16000, 3, "int", &function_840d5e0b, 0, 0);
    clientfield::register("allplayers", "" + #"hash_7b1dd5c08e2585c", 16000, 3, "int", &function_c63a4f32, 0, 0);
    clientfield::register("scriptmover", "" + #"rob_coals", 16000, 1, "int", &rob_coals, 0, 0);
    level._effect[#"hash_379eadfebd945316"] = #"hash_556b5a8aa255768d";
    level._effect[#"hash_3229d3874a037840"] = #"hash_48053ee21dfed9c9";
    level._effect[#"hash_31c3f08749acf655"] = #"hash_482741e21e1bc548";
    level._effect[#"hash_31c0cd8749aa8505"] = #"hash_482b24e21e1f7cd8";
    level._effect[#"hash_5f92f2e28c7ef455"] = #"hash_13cf1738cd97717e";
    level._effect[#"brazier_fire_blue"] = #"hash_487863cb3f012833";
    level._effect[#"brazier_fire_green"] = #"hash_276c55785b205f4e";
    level._effect[#"hash_533608bb3b3407b6"] = #"hash_4eff7803b81cd67d";
    level._effect[#"brazier_fire_purple"] = #"hash_2a46ebc323110b3d";
    level._effect[#"hash_64a625f8e26e3699"] = #"hash_79207c9d697f9e30";
    level._effect[#"hash_fa374812e6016c9"][1] = #"hash_676d05725a4ffab9";
    level._effect[#"hash_eafc8632695ccef"][1] = #"hash_511e23c849ed0926";
    level._effect[#"hash_fa374812e6016c9"][2] = #"hash_5199aa40f704fb10";
    level._effect[#"hash_eafc8632695ccef"][2] = #"hash_1dfbcfd9b38812ed";
    level._effect[#"hash_fa374812e6016c9"][3] = #"hash_6bfc5d7fce6b2a4e";
    level._effect[#"hash_eafc8632695ccef"][3] = #"maps/zm_red/fx8_soul_charge_purple";
    level._effect[#"hash_fa374812e6016c9"][4] = #"hash_6cfbd6f08cfc2656";
    level._effect[#"hash_eafc8632695ccef"][4] = #"hash_17bb97645fa8148b";
    level._effect[#"pickup_glow"] = #"zm_weapons/fx8_cymbal_monkey_light";
    namespace_f8f28e08::init();
    level.var_7987392b = undefined;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0xd7687222, Offset: 0x8b0
// Size: 0x392
function function_de1bffd6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_36f175fc)) {
        stopfx(localclientnum, self.var_36f175fc);
        self.var_36f175fc = undefined;
    }
    v_pos = self.origin;
    v_up = (1, 0, 0);
    v_forward = (0, 0, 1);
    switch (newval) {
    case 0:
        return;
    case 1:
        level.var_6437d5e7 = 0.002;
        self.var_36f175fc = playfx(localclientnum, level._effect[#"hash_379eadfebd945316"], v_pos, v_up, v_forward);
        break;
    case 2:
        level.var_6437d5e7 = 0.01;
        self.var_36f175fc = playfx(localclientnum, level._effect[#"hash_3229d3874a037840"], v_pos, v_up, v_forward);
        break;
    case 3:
        level.var_6437d5e7 = 0.015;
        self.var_36f175fc = playfx(localclientnum, level._effect[#"hash_31c3f08749acf655"], v_pos, v_up, v_forward);
        break;
    case 4:
        level.var_6437d5e7 = 0.02;
        self.var_36f175fc = playfx(localclientnum, level._effect[#"hash_31c0cd8749aa8505"], v_pos, v_up, v_forward);
        break;
    case 5:
        level.var_6437d5e7 = 0.025;
        self.var_36f175fc = playfx(localclientnum, level._effect[#"hash_5f92f2e28c7ef455"], v_pos, v_up, v_forward);
        break;
    }
    if (isdefined(self.var_b7c1fb99)) {
        self stoploopsound(self.var_b7c1fb99);
        self.var_b7c1fb99 = undefined;
    }
    var_ff01f974 = newval;
    if (level.var_6437d5e7 == 0.025) {
        var_ff01f974 = 4;
    }
    self playsound(localclientnum, #"hash_4b301fe401c4f18");
    self.var_b7c1fb99 = self playloopsound(#"hash_6143f452bc746a62" + var_ff01f974);
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0x45a316c5, Offset: 0xc50
// Size: 0x342
function function_9ed71eeb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_9c32107c)) {
        stopfx(localclientnum, self.var_9c32107c);
        self.var_9c32107c = undefined;
    }
    v_pos = self.origin + vectorscale((0, 0, 1), 7);
    v_dir = anglestoforward(self.angles);
    v_pos = v_pos + v_dir * 9;
    v_up = (0, 0, 1);
    v_forward = (1, 0, 0);
    switch (newval) {
    case 0:
        break;
    case 1:
        self.var_9c32107c = playfx(localclientnum, level._effect[#"hash_64a625f8e26e3699"], v_pos, v_up, v_forward);
        break;
    case 2:
        self.var_9c32107c = playfx(localclientnum, level._effect[#"brazier_fire_blue"], v_pos, v_up, v_forward);
        break;
    case 3:
        self.var_9c32107c = playfx(localclientnum, level._effect[#"brazier_fire_purple"], v_pos, v_up, v_forward);
        break;
    case 4:
        self.var_9c32107c = playfx(localclientnum, level._effect[#"hash_533608bb3b3407b6"], v_pos, v_up, v_forward);
        break;
    }
    if (newval == 0) {
        if (isdefined(self.var_b10399e)) {
            self playsound(localclientnum, #"hash_284f0a411f78c07c");
            self stoploopsound(self.var_b10399e);
            self.var_b10399e = undefined;
        }
        return;
    }
    if (!isdefined(self.var_b10399e)) {
        self playsound(localclientnum, #"hash_6845d8009f05e81c");
        self.var_b10399e = self playloopsound(#"hash_205cc527b5726b4d");
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0xd9e6861d, Offset: 0xfa0
// Size: 0x9c
function keyline_model(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == oldval) {
        return;
    }
    if (newval) {
        self playrenderoverridebundle(#"rob_sonar_set_friendly");
        return;
    }
    self stoprenderoverridebundle(#"rob_sonar_set_friendly");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0x455f4549, Offset: 0x1048
// Size: 0x74
function pickup_glow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"pickup_glow"], self, "tag_origin");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0x8ec2531c, Offset: 0x10c8
// Size: 0x82
function function_75ac8f21(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(level.var_7987392b)) {
        level.var_7987392b = [];
    }
    self.var_f147da98 = newval;
    level.var_7987392b[level.var_7987392b.size] = self;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x1 linked
// Checksum 0x42f3055e, Offset: 0x1158
// Size: 0xc0
function function_3298ba0(n_index) {
    if (isdefined(level.var_7987392b) && isarray(level.var_7987392b)) {
        foreach (mdl_bowl in level.var_7987392b) {
            if (isdefined(mdl_bowl)) {
                if (mdl_bowl.var_f147da98 == n_index) {
                    return mdl_bowl;
                }
            }
        }
    }
    return undefined;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0x5d95ac41, Offset: 0x1220
// Size: 0xa4
function function_250bbf4e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (newval) {
        mdl_bowl = self function_3298ba0(newval);
        if (isdefined(mdl_bowl)) {
            mdl_bowl playrenderoverridebundle(#"rob_sonar_set_friendly");
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0xb85ba97, Offset: 0x12d0
// Size: 0xf8
function cleanup_challenges(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.var_7987392b) && isarray(level.var_7987392b)) {
        foreach (mdl_bowl in level.var_7987392b) {
            if (isdefined(mdl_bowl)) {
                mdl_bowl stoprenderoverridebundle(#"rob_sonar_set_friendly");
            }
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0xe7f8ae64, Offset: 0x13d0
// Size: 0x4a
function function_840d5e0b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self.var_c68d7a3e = newval;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0xa8423505, Offset: 0x1428
// Size: 0x2c4
function function_c63a4f32(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self endon(#"death");
    if (newval) {
        if (!isdefined(self.var_c68d7a3e)) {
            return;
        }
        n_index = self.var_c68d7a3e;
        mdl_bowl = self function_3298ba0(newval);
        if (!isdefined(mdl_bowl)) {
            return;
        }
        e_fx = spawn(localclientnum, mdl_bowl.origin, "script_model");
        e_fx setmodel(#"tag_origin");
        e_fx playsound(localclientnum, "zmb_sq_souls_release");
        e_fx.sfx_id = e_fx playloopsound(#"zmb_sq_souls_lp");
        util::playfxontag(localclientnum, level._effect[#"hash_fa374812e6016c9"][n_index], e_fx, "tag_origin");
        wait(0.3);
        s_target = struct::get("s_apollo_challenge_fx_loc", "targetname");
        power = distance(e_fx.origin, s_target.origin);
        n_time = e_fx fake_physicslaunch(s_target.origin, power, 0.85);
        wait(n_time);
        e_fx playsound(localclientnum, "zmb_sq_souls_impact");
        e_fx stoploopsound(e_fx.sfx_id);
        util::playfxontag(localclientnum, level._effect[#"hash_eafc8632695ccef"][n_index], e_fx, "tag_origin");
        wait(0.3);
        e_fx delete();
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 3, eflags: 0x1 linked
// Checksum 0x12433902, Offset: 0x16f8
// Size: 0x148
function fake_physicslaunch(target_pos, power, var_4862f668) {
    start_pos = self.origin;
    gravity = getdvarint(#"bg_gravity", 0) * -1;
    gravity = gravity * var_4862f668;
    dist = distance(start_pos, target_pos);
    time = dist / power;
    delta = target_pos - start_pos;
    drop = 0.5 * gravity * time * time;
    velocity = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    self movegravity(velocity, time);
    return time;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0x22df4e2, Offset: 0x1848
// Size: 0x8c
function rob_coals(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self thread function_4eff20ff();
        return;
    }
    self notify(#"hash_6bc81dae92c4902e");
    self thread function_23333a90();
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x548e279d, Offset: 0x18e0
// Size: 0x1c8
function function_4eff20ff() {
    self endon(#"death", #"hash_6bc81dae92c4902e");
    self playrenderoverridebundle("rob_zm_red_cin_coals");
    level.var_75ca8fda = 0;
    level.var_6437d5e7 = 0.002;
    self function_78233d29("rob_zm_red_cin_coals", "", "Brightness", 1);
    self function_78233d29("rob_zm_red_cin_coals", "", "Tint", 1);
    while (1) {
        if (!isdefined(self)) {
            return;
        }
        self function_78233d29("rob_zm_red_cin_coals", "", "Alpha", level.var_75ca8fda);
        level.var_75ca8fda = level.var_75ca8fda + level.var_6437d5e7;
        if (level.var_75ca8fda >= 1) {
            level.var_75ca8fda = 1;
            level.var_6437d5e7 = level.var_6437d5e7 * -1;
        } else if (level.var_75ca8fda <= 0.2) {
            level.var_75ca8fda = 0.2;
            level.var_6437d5e7 = level.var_6437d5e7 * -1;
        }
        waitframe(1);
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x4fd7db6d, Offset: 0x1ab0
// Size: 0xd4
function function_23333a90() {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    while (level.var_75ca8fda > 0) {
        level.var_75ca8fda = level.var_75ca8fda - 0.002;
        if (level.var_75ca8fda < 0) {
            level.var_75ca8fda = 0;
        }
        self function_78233d29("rob_zm_red_cin_coals", "", "Alpha", level.var_75ca8fda);
        waitframe(1);
    }
    self stoprenderoverridebundle("rob_zm_red_cin_coals");
}

