#using scripts\core_common\audio_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_orange_water;

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x0
// Checksum 0xd98843c8, Offset: 0x178
// Size: 0x2da
function init() {
    clientfield::register("allplayers", "" + #"hash_55543319943057f1", 24000, 1, "int", &function_e8d94580, 0, 0);
    clientfield::register("toplayer", "" + #"hash_5160727729fd57a2", 24000, 1, "int", &function_a2d360f1, 0, 0);
    clientfield::register("toplayer", "" + #"hash_13f1aaee7ebf9986", 24000, 2, "int", &function_3c820626, 0, 1);
    clientfield::register("toplayer", "" + #"hash_603fc9d210bdbc4d", 24000, 1, "int", &function_45df4c17, 0, 0);
    clientfield::register("toplayer", "" + #"hash_67340426cd141891", 24000, 2, "int", &function_6b5ed7f9, 0, 0);
    level._effect[#"hash_4a12914ab0026a9d"] = #"hash_50599e96f376b4fa";
    level._effect[#"hash_211384df1c05676c"] = #"hash_434ed0cd342c0caa";
    level._effect[#"hash_3cf697eb0a408b2e"] = #"hash_432cd0cd340f2644";
    level._effect[#"hash_2f305a0bea20d6ed"] = #"hash_6910f1de979f539f";
    level._effect[#"hash_28591d0dc8bbbf02"] = #"hash_8197ce41f763db3";
    level._effect[#"hash_2818130dc884170f"] = #"hash_86876e41fba07d2";
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x0
// Checksum 0x116589e9, Offset: 0x460
// Size: 0x24
function main() {
    callback::on_spawned(&on_player_spawned);
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0x4468c23c, Offset: 0x490
// Size: 0x3e
function on_player_spawned(localclientnum) {
    self.var_b5c65495 = 0;
    self.var_f809ca21 = 0.5;
    if (!isdefined(self.var_cdb19015)) {
        self.var_cdb19015 = 0;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 7, eflags: 0x0
// Checksum 0x4f942a5c, Offset: 0x4d8
// Size: 0xf6
function function_e8d94580(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!self zm_utility::function_f8796df3(localclientnum)) {
            self thread function_84fcb204(localclientnum);
        }
        self playrenderoverridebundle("rob_tricannon_classified_zombie_ice");
        return;
    }
    if (!self zm_utility::function_f8796df3(localclientnum)) {
        self thread function_6180e679(localclientnum);
    }
    self stoprenderoverridebundle("rob_tricannon_classified_zombie_ice");
    self notify(#"hash_5ab24a026f132ea4");
}

// Namespace zm_orange_water/zm_orange_water
// Params 7, eflags: 0x0
// Checksum 0xebd7b0a9, Offset: 0x5d8
// Size: 0x5c
function function_a2d360f1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_7da5e6a2();
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0x7a641bfb, Offset: 0x640
// Size: 0x10c
function function_84fcb204(localclientnum) {
    if (!isdefined(self.var_67dab332)) {
        self.var_67dab332 = [];
    }
    if (isdefined(self.var_67dab332[localclientnum])) {
        return;
    }
    self.var_67dab332[localclientnum] = [];
    function_832ba3ee(localclientnum, level._effect[#"hash_4a12914ab0026a9d"], "torso", "j_spinelower");
    function_832ba3ee(localclientnum, level._effect[#"hash_3cf697eb0a408b2e"], "right_leg", "j_knee_ri");
    function_832ba3ee(localclientnum, level._effect[#"hash_211384df1c05676c"], "left_leg", "j_knee_le");
}

// Namespace zm_orange_water/zm_orange_water
// Params 4, eflags: 0x0
// Checksum 0xd25ad7a4, Offset: 0x758
// Size: 0x58
function function_832ba3ee(localclientnum, fx, key, tag) {
    self.var_67dab332[localclientnum][key] = util::playfxontag(localclientnum, fx, self, tag);
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0xe55c5e03, Offset: 0x7b8
// Size: 0xcc
function function_6180e679(localclientnum) {
    self endon(#"death", #"disconnect");
    if (isdefined(self.var_67dab332) && isdefined(self.var_67dab332[localclientnum])) {
        a_keys = getarraykeys(self.var_67dab332[localclientnum]);
        for (i = 0; i < a_keys.size; i++) {
            function_40966504(localclientnum, a_keys[i]);
        }
        self.var_67dab332[localclientnum] = undefined;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 2, eflags: 0x0
// Checksum 0x3e38858f, Offset: 0x890
// Size: 0x3c
function function_40966504(localclientnum, key) {
    deletefx(localclientnum, self.var_67dab332[localclientnum][key]);
}

// Namespace zm_orange_water/zm_orange_water
// Params 7, eflags: 0x0
// Checksum 0xd1106422, Offset: 0x8d8
// Size: 0xa4
function function_3c820626(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval === 1) {
        self thread function_1a2f062a(localclientnum);
        return;
    }
    if (newval === 2) {
        self thread function_7c64a377(localclientnum);
        return;
    }
    self thread function_17e6f9f3(localclientnum);
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0x47b4047a, Offset: 0x988
// Size: 0x1c0
function function_1a2f062a(localclientnum) {
    self endon(#"death");
    if (!isdefined(self.var_f809ca21)) {
        self.var_f809ca21 = 0.5;
    }
    self.var_7c8ad424 = 1;
    self.var_cdb19015 = 1;
    if (!self postfx::function_556665f2("pstfx_frost_loop_fullscreen_zmo")) {
        self postfx::playpostfxbundle("pstfx_frost_loop_fullscreen_zmo");
    }
    if (!isdefined(self.var_2591ed7c)) {
        self thread function_88fdd1ff();
    }
    while (self.var_7c8ad424 && isalive(self) && self.var_f809ca21 < 1) {
        self.var_f809ca21 += 0.0666667 / 10;
        if (self.var_f809ca21 > 1) {
            self.var_f809ca21 = 1;
        }
        self postfx::function_c8b5f318("pstfx_frost_loop_fullscreen_zmo", #"reveal threshold", self.var_f809ca21);
        /#
            var_a193c879 = self.var_f809ca21 * 100;
            debug2dtext((5, 540, 0), "<dev string:x38>" + var_a193c879, (1, 1, 0), 1, (0, 0, 0), 0.5, 1, 30);
        #/
        wait 0.2;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0xfb7f7a5f, Offset: 0xb50
// Size: 0x198
function function_7c64a377(localclientnum) {
    self endon(#"death");
    if (!isdefined(self.var_f809ca21)) {
        self.var_f809ca21 = 0.5;
    }
    self.var_7c8ad424 = 1;
    if (!self postfx::function_556665f2("pstfx_frost_loop_fullscreen_zmo")) {
        self postfx::playpostfxbundle("pstfx_frost_loop_fullscreen_zmo");
    }
    while (self.var_7c8ad424 && isalive(self) && self.var_f809ca21 < 1) {
        self.var_f809ca21 += 0.0333333 / 10;
        if (self.var_f809ca21 > 1) {
            self.var_f809ca21 = 1;
        }
        self postfx::function_c8b5f318("pstfx_frost_loop_fullscreen_zmo", #"reveal threshold", self.var_f809ca21);
        /#
            var_a193c879 = self.var_f809ca21 * 100;
            debug2dtext((5, 540, 0), "<dev string:x38>" + var_a193c879, (1, 1, 0), 1, (0, 0, 0), 0.5, 1, 30);
        #/
        wait 0.2;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0x558ee4d3, Offset: 0xcf0
// Size: 0x1de
function function_17e6f9f3(localclientnum) {
    self endon(#"death");
    if (!isdefined(self.var_f809ca21)) {
        self.var_f809ca21 = 0.5;
    }
    self.var_7c8ad424 = 0;
    while (!self.var_7c8ad424 && isalive(self) && self.var_f809ca21 > 0.5) {
        self.var_f809ca21 -= 0.1 / 10;
        if (self.var_f809ca21 < 0.5) {
            self.var_f809ca21 = 0.5;
        }
        self postfx::function_c8b5f318("pstfx_frost_loop_fullscreen_zmo", #"reveal threshold", self.var_f809ca21);
        /#
            var_a193c879 = self.var_f809ca21 * 100;
            debug2dtext((5, 540, 0), "<dev string:x38>" + var_a193c879, (1, 1, 0), 1, (0, 0, 0), 0.5, 1, 30);
        #/
        wait 0.2;
    }
    if (isalive(self) && !self.var_7c8ad424 && self postfx::function_556665f2("pstfx_frost_loop_fullscreen_zmo")) {
        self postfx::stoppostfxbundle("pstfx_frost_loop_fullscreen_zmo");
        self.var_cdb19015 = 0;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 7, eflags: 0x0
// Checksum 0x20f723e2, Offset: 0xed8
// Size: 0x5c
function function_45df4c17(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_39cdeb29(localclientnum);
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0xc7aa23cd, Offset: 0xf40
// Size: 0xcc
function function_39cdeb29(localclientnum) {
    self.var_7c8ad424 = 0;
    self.var_f809ca21 = 0.5;
    self postfx::function_c8b5f318("pstfx_frost_loop_fullscreen_zmo", #"reveal threshold", self.var_f809ca21);
    if (self postfx::function_556665f2("pstfx_frost_loop_fullscreen_zmo")) {
        self postfx::stoppostfxbundle("pstfx_frost_loop_fullscreen_zmo");
    }
    self thread util::playfxontag(localclientnum, level._effect[#"hash_2818130dc884170f"], self, "J_Spine4");
}

// Namespace zm_orange_water/zm_orange_water
// Params 7, eflags: 0x0
// Checksum 0x8912da6f, Offset: 0x1018
// Size: 0x164
function function_6b5ed7f9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval === 2) {
        self.var_7c8ad424 = 0;
        self.var_f809ca21 = 0.9;
        self postfx::function_c8b5f318("pstfx_frost_loop_fullscreen_zmo", #"reveal threshold", self.var_f809ca21);
        self thread util::playfxontag(localclientnum, level._effect[#"hash_28591d0dc8bbbf02"], self, "J_Spine4");
        return;
    }
    if (newval === 1) {
        self.var_7c8ad424 = 0;
        self.var_f809ca21 = 0.8;
        self postfx::function_c8b5f318("pstfx_frost_loop_fullscreen_zmo", #"reveal threshold", self.var_f809ca21);
        self thread util::playfxontag(localclientnum, level._effect[#"hash_28591d0dc8bbbf02"], self, "J_Spine4");
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x0
// Checksum 0xd2eaa09b, Offset: 0x1188
// Size: 0x1e6
function function_88fdd1ff() {
    self endoncallback(&function_2473f73e, #"death");
    self endon(#"death", #"disconnect");
    self.var_2591ed7c = spawn(0, self.origin + (0, 0, 1000), "script_origin");
    self.var_2591ed7c.var_2e95bcd3 = self.var_2591ed7c playloopsound(#"hash_58b77ae9e2d258e1");
    if (!isdefined(self.var_cdb19015)) {
        self.var_cdb19015 = 1;
    }
    while (self.var_cdb19015) {
        var_a69bb213 = audio::scale_speed(0.5, 1, 0.1, 1000, self.var_f809ca21);
        self.var_2591ed7c moveto(self.origin + (0, 0, 1000 - var_a69bb213), 0.01);
        var_41b4b0fa = audio::scale_speed(0.5, 1, 0.6, 1, self.var_f809ca21);
        setsoundpitch(self.var_2591ed7c.var_2e95bcd3, var_41b4b0fa);
        wait 0.2;
    }
    self.var_2591ed7c delete();
    self.var_2591ed7c = undefined;
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0x9584d23b, Offset: 0x1378
// Size: 0x46
function function_2473f73e(notifyhash) {
    if (isdefined(self) && isdefined(self.var_2591ed7c)) {
        self.var_2591ed7c delete();
        self.var_2591ed7c = undefined;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x0
// Checksum 0x4edb0502, Offset: 0x13c8
// Size: 0xb6
function function_7da5e6a2() {
    self endon(#"death", #"disconnect");
    self.var_cdb19015 = 0;
    self playsound(0, #"hash_71f59624b7f67f22");
    self.var_1ab2df8c = self playloopsound(#"hash_34fa9c6b99cc772e");
    self waittill(#"hash_5ab24a026f132ea4");
    self stoploopsound(self.var_1ab2df8c);
    self.var_1ab2df8c = undefined;
}

