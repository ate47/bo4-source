#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_weap_freezegun;

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0, eflags: 0x2
// Checksum 0xf14576f9, Offset: 0x288
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_freezegun", &_init_, undefined, undefined);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0, eflags: 0x0
// Checksum 0x83d98e31, Offset: 0x2d0
// Size: 0x4aa
function _init_() {
    clientfield::register("actor", "" + #"hash_2f305a0bea20d6ed", 1, 1, "int", &function_16d503c6, 0, 0);
    clientfield::register("actor", "" + #"hash_757f891a37d3db00", 1, 1, "int", &function_64927e54, 0, 0);
    clientfield::register("actor", "" + #"hash_26d3eeef96a2291e", 1, 1, "int", &function_89a4ffa9, 0, 0);
    clientfield::register("actor", "" + #"hash_32ec41222f58aa75", 1, 1, "int", &function_407434d9, 0, 0);
    clientfield::register("actor", "" + #"hash_1aa3522b88c2b76f", 1, 1, "int", &function_7cdb7d7f, 0, 0);
    clientfield::register("actor", "" + #"hash_259cdeffe60fe48f", 1, 1, "int", &function_bf0f2e8f, 0, 0);
    clientfield::register("actor", "" + #"hash_5ad28d5f104a6e3b", 1, 1, "int", &function_3b23bb2f, 0, 0);
    level._effect[#"hash_2f305a0bea20d6ed"] = #"hash_6910f1de979f539f";
    level._effect[#"hash_757f891a37d3db00"] = #"hash_3da4857b4b1553dc";
    level._effect[#"hash_26d3eeef96a2291e"] = #"hash_35e2193ab697e2f1";
    level._effect[#"hash_32ec41222f58aa75"] = #"hash_3de16b7e3bd7e5ce";
    level._effect[#"hash_4a12914ab0026a9d"] = #"hash_50599e96f376b4fa";
    level._effect[#"hash_1aa3522b88c2b76f"] = #"hash_7bd6bc3aea3ff42f";
    level._effect[#"hash_485f1b39da0ca6ca"] = #"hash_58c96eb815e5079c";
    level._effect[#"hash_57c210bb97cf187c"] = #"hash_58c964b815e4f69e";
    level._effect[#"hash_211384df1c05676c"] = #"hash_434ed0cd342c0caa";
    level._effect[#"hash_3cf697eb0a408b2e"] = #"hash_432cd0cd340f2644";
    level._effect[#"hash_390d70fef1885250"] = #"hash_7af6b9564f0fbeca";
    level._effect[#"hash_3864bbc0912cb852"] = #"hash_6d51d7c934576ac8";
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 7, eflags: 0x0
// Checksum 0x7affded9, Offset: 0x788
// Size: 0x134
function function_16d503c6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self thread function_2ee2fcd8(localclientnum);
        self thread function_9babbcd9(localclientnum);
    }
    self thread util::playfxontag(localclientnum, level._effect[#"hash_2f305a0bea20d6ed"], self, "J_SpineLower");
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self function_3b6be5ed(localclientnum);
        return;
    }
    self hide();
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 7, eflags: 0x0
// Checksum 0xaa8b7f77, Offset: 0x8c8
// Size: 0x134
function function_89a4ffa9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self thread function_2ee2fcd8(localclientnum);
        self thread function_9babbcd9(localclientnum);
    }
    self thread util::playfxontag(localclientnum, level._effect[#"hash_26d3eeef96a2291e"], self, "J_SpineLower");
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self function_3b6be5ed(localclientnum);
        return;
    }
    self hide();
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 7, eflags: 0x0
// Checksum 0xe91e149f, Offset: 0xa08
// Size: 0x11c
function function_64927e54(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self thread function_2ee2fcd8(localclientnum);
        self thread function_9babbcd9(localclientnum);
    }
    self thread util::playfxontag(localclientnum, level._effect[#"hash_757f891a37d3db00"], self, "J_SpineLower");
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self function_f0236487(localclientnum);
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 7, eflags: 0x0
// Checksum 0x73a8f962, Offset: 0xb30
// Size: 0x11c
function function_407434d9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self thread function_2ee2fcd8(localclientnum);
        self thread function_9babbcd9(localclientnum);
    }
    self thread util::playfxontag(localclientnum, level._effect[#"hash_32ec41222f58aa75"], self, "J_SpineLower");
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self function_f0236487(localclientnum);
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 7, eflags: 0x0
// Checksum 0x999b4e2a, Offset: 0xc58
// Size: 0x74
function function_7cdb7d7f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_3022a1c2(localclientnum);
        return;
    }
    self thread function_2ee2fcd8(localclientnum);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1, eflags: 0x0
// Checksum 0xe1eccd98, Offset: 0xcd8
// Size: 0x1cc
function function_3022a1c2(localclientnum) {
    if (!isdefined(self.var_c2fa696b)) {
        self.var_c2fa696b = [];
    }
    if (isdefined(self.var_c2fa696b[localclientnum])) {
        return;
    }
    self.var_c2fa696b[localclientnum] = [];
    if (!self gibclientutils::isgibbed(localclientnum, self, 16)) {
        function_ad4b7a78(localclientnum, level._effect[#"hash_1aa3522b88c2b76f"], "right_arm", "j_elbow_ri");
    }
    if (!self gibclientutils::isgibbed(localclientnum, self, 32)) {
        function_ad4b7a78(localclientnum, level._effect[#"hash_1aa3522b88c2b76f"], "left_arm", "j_elbow_le");
    }
    if (!self gibclientutils::isgibbed(localclientnum, self, 128)) {
        function_ad4b7a78(localclientnum, level._effect[#"hash_1aa3522b88c2b76f"], "right_leg", "j_knee_ri");
    }
    if (!self gibclientutils::isgibbed(localclientnum, self, 256)) {
        function_ad4b7a78(localclientnum, level._effect[#"hash_1aa3522b88c2b76f"], "left_leg", "j_knee_le");
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 4, eflags: 0x0
// Checksum 0xdc5a6263, Offset: 0xeb0
// Size: 0x58
function function_ad4b7a78(localclientnum, fx, key, tag) {
    self.var_c2fa696b[localclientnum][key] = util::playfxontag(localclientnum, fx, self, tag);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1, eflags: 0x0
// Checksum 0xb4f46bba, Offset: 0xf10
// Size: 0x9e
function function_2ee2fcd8(localclientnum) {
    self endon(#"death");
    if (isdefined(self.var_c2fa696b)) {
        keys = getarraykeys(self.var_c2fa696b[localclientnum]);
        for (i = 0; i < keys.size; i++) {
            function_d4bf34b7(localclientnum, keys[i]);
        }
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 2, eflags: 0x0
// Checksum 0x59f9d20b, Offset: 0xfb8
// Size: 0x3c
function function_d4bf34b7(localclientnum, key) {
    deletefx(localclientnum, self.var_c2fa696b[localclientnum][key]);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 7, eflags: 0x0
// Checksum 0xbdd2e165, Offset: 0x1000
// Size: 0x74
function function_bf0f2e8f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_de5f3855(localclientnum);
        return;
    }
    self thread function_9babbcd9(localclientnum);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1, eflags: 0x0
// Checksum 0x936f2dc1, Offset: 0x1080
// Size: 0x26c
function function_de5f3855(localclientnum) {
    if (!isdefined(self.var_dc23481f)) {
        self.var_dc23481f = [];
    }
    if (isdefined(self.var_dc23481f[localclientnum])) {
        return;
    }
    self.var_dc23481f[localclientnum] = [];
    function_637a31ed(localclientnum, level._effect[#"hash_4a12914ab0026a9d"], "torso", "j_spinelower");
    if (!self gibclientutils::isgibbed(localclientnum, self, 8)) {
        function_637a31ed(localclientnum, level._effect[#"hash_390d70fef1885250"], "chin", "j_head");
    }
    if (!self gibclientutils::isgibbed(localclientnum, self, 16)) {
        function_637a31ed(localclientnum, level._effect[#"hash_57c210bb97cf187c"], "right_arm", "j_elbow_ri");
    }
    if (!self gibclientutils::isgibbed(localclientnum, self, 32)) {
        function_637a31ed(localclientnum, level._effect[#"hash_485f1b39da0ca6ca"], "left_arm", "j_elbow_le");
    }
    if (!self gibclientutils::isgibbed(localclientnum, self, 128)) {
        function_637a31ed(localclientnum, level._effect[#"hash_3cf697eb0a408b2e"], "right_leg", "j_knee_ri");
    }
    if (!self gibclientutils::isgibbed(localclientnum, self, 256)) {
        function_637a31ed(localclientnum, level._effect[#"hash_211384df1c05676c"], "left_leg", "j_knee_le");
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 4, eflags: 0x0
// Checksum 0x1059cb09, Offset: 0x12f8
// Size: 0x58
function function_637a31ed(localclientnum, fx, key, tag) {
    self.var_dc23481f[localclientnum][key] = util::playfxontag(localclientnum, fx, self, tag);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1, eflags: 0x0
// Checksum 0x98fd9e9d, Offset: 0x1358
// Size: 0xbc
function function_9babbcd9(localclientnum) {
    self endon(#"death");
    if (isdefined(self.var_dc23481f) && isdefined(self.var_dc23481f[localclientnum])) {
        keys = getarraykeys(self.var_dc23481f[localclientnum]);
        for (i = 0; i < keys.size; i++) {
            function_90674103(localclientnum, keys[i]);
        }
        self.var_dc23481f[localclientnum] = undefined;
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 2, eflags: 0x0
// Checksum 0x4bd8e26a, Offset: 0x1420
// Size: 0x3c
function function_90674103(localclientnum, key) {
    deletefx(localclientnum, self.var_dc23481f[localclientnum][key]);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1, eflags: 0x0
// Checksum 0xb7eaf547, Offset: 0x1468
// Size: 0x24
function function_f0236487(localclientnum) {
    function_3ab6779c(localclientnum, 0);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1, eflags: 0x0
// Checksum 0xb06e4f70, Offset: 0x1498
// Size: 0x24
function function_3b6be5ed(localclientnum) {
    function_3ab6779c(localclientnum, 1);
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1, eflags: 0x0
// Checksum 0x35f51039, Offset: 0x14c8
// Size: 0xa4
function function_91bb8595(gib_origin) {
    start_pos = self.origin;
    force = vectornormalize(gib_origin - start_pos);
    force += (0, 0, randomfloatrange(0.4, 0.6));
    force *= randomfloatrange(0.8, 1.2);
    return force;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 2, eflags: 0x4
// Checksum 0x494a7911, Offset: 0x1578
// Size: 0xc4
function private function_3ab6779c(localclientnum, var_44146a38) {
    if (util::is_mature()) {
        function_c4fded40(localclientnum, "j_elbow_ri", 16, var_44146a38);
        function_c4fded40(localclientnum, "j_elbow_le", 32, var_44146a38);
        function_c4fded40(localclientnum, "j_knee_ri", 128, var_44146a38);
        function_c4fded40(localclientnum, "j_knee_le", 256, var_44146a38);
        self hide();
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1, eflags: 0x4
// Checksum 0x1e5e8fd6, Offset: 0x1648
// Size: 0x19e
function private function_3386e437(gibflag) {
    gib_model = undefined;
    if (isdefined(self.archetype) && self.archetype == #"nova_crawler") {
        switch (gibflag) {
        case 16:
            gib_model = "c_t8_zmb_ofc_quadcrawler_s_rarmspawn";
            break;
        case 32:
            gib_model = "c_t8_zmb_ofc_quadcrawler_s_larmspawn";
            break;
        case 128:
            gib_model = "c_t8_zmb_ofc_quadcrawler_s_rlegspawn";
            break;
        case 256:
            gib_model = "c_t8_zmb_ofc_quadcrawler_s_llegspawn";
            break;
        default:
            break;
        }
    } else {
        switch (gibflag) {
        case 16:
            gib_model = "c_t8_zmb_ofc_zombie_male_s_rarmoff";
            break;
        case 32:
            gib_model = "c_t8_zmb_ofc_zombie_male_s_larmoff";
            break;
        case 128:
            gib_model = "c_t8_zmb_ofc_zombie_male_s_rlegoff";
            break;
        case 256:
            gib_model = "c_t8_zmb_ofc_zombie_male_s_llegoff";
            break;
        default:
            break;
        }
    }
    return gib_model;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 4, eflags: 0x4
// Checksum 0x7bcd1213, Offset: 0x17f0
// Size: 0x134
function private function_c4fded40(localclientnum, tag_name, gibflag, var_44146a38) {
    gib_origin = self gettagorigin(tag_name);
    if (!self gibclientutils::isgibbed(localclientnum, self, gibflag) && isdefined(gib_origin)) {
        gib_angles = self gettagangles(tag_name);
        gib_force = var_44146a38 ? function_91bb8595(gib_origin) : (0, 0, 0);
        gib_model = function_3386e437(gibflag);
        if (isdefined(gib_model)) {
            createdynentandlaunch(localclientnum, gib_model, gib_origin, gib_angles, gib_origin, gib_force, level._effect[#"hash_3864bbc0912cb852"], 1);
        }
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 7, eflags: 0x0
// Checksum 0x8c229cf2, Offset: 0x1930
// Size: 0x84
function function_3b23bb2f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle("rob_tricannon_classified_zombie_ice");
        return;
    }
    self stoprenderoverridebundle("rob_tricannon_classified_zombie_ice");
}

