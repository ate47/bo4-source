// Atian COD Tools GSC decompiler test
#include scripts/zm/weapons/zm_weap_spectral_shield.csc;
#include scripts/zm_common/zm_utility.csc;
#include scripts/core_common/exploder_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/audio_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/struct.csc;

#namespace namespace_a9aa9d72;

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x2
// Checksum 0xee6fae23, Offset: 0x278
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_3478ed13fc9440e6", &__init__, undefined, undefined);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0xfee0eb8c, Offset: 0x2c0
// Size: 0xdd2
function __init__() {
    n_bits = getminbitcountfornum(2);
    clientfield::register("scriptmover", "" + #"hash_632f7bc0b1a15f71", 1, n_bits, "int", &function_f968291b, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_4614e4fa180c79af", 1, 1, "int", &function_3561f113, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_53586aa63ca15286", 1, 1, "int", &function_a2368263, 0, 0);
    clientfield::register("actor", "" + #"hash_65da20412fcaf97e", 1, 2, "int", &function_58397147, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_65da20412fcaf97e", 1, 2, "int", &function_58397147, 0, 0);
    clientfield::register("toplayer", "" + #"hash_7d4d423d8dabbee3", 1, getminbitcountfornum(10), "int", &function_d4ec8793, 0, 0);
    clientfield::register("toplayer", "" + #"hash_46bc4b451b7419bb", 1, getminbitcountfornum(3), "int", &function_fdd08c0e, 0, 0);
    clientfield::register("toplayer", "" + #"hash_49fecafe0b5d6da4", 1, 2, "counter", &function_e3248f02, 0, 0);
    clientfield::register("vehicle", "" + #"hash_584f13d0c8662647", 1, 1, "int", &function_8f74b4d7, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_584f13d0c8662647", 1, 1, "int", &function_8f74b4d7, 0, 0);
    clientfield::register("vehicle", "" + #"hash_22ffb9cf999f16c0", 1, 1, "counter", &function_28de769f, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_22ffb9cf999f16c0", 1, 1, "counter", &function_28de769f, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_a51ae59006ab41b", 1, getminbitcountfornum(4), "int", &function_126253d1, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_64f2dd36b17bf17", 1, 1, "int", &function_aa42aa09, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_119729072e708651", 1, 1, "int", &function_da095cb3, 0, 0);
    clientfield::register("actor", "" + #"hash_3e506d7aedac6ae0", 1, getminbitcountfornum(10), "int", &function_ab71f1f5, 0, 0);
    clientfield::register("actor", "" + #"hash_34562274d7e875a4", 1, getminbitcountfornum(10), "int", &function_8fd8b982, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_504d26c38b96651c", 1, getminbitcountfornum(10), "int", &function_acafe26b, 0, 0);
    clientfield::register("vehicle", "" + #"hash_504d26c38b96651c", 1, getminbitcountfornum(10), "int", &function_acafe26b, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_7dc9331ef45ed81f", 1, getminbitcountfornum(10), "int", &function_2380f2d5, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_7dc9341ef45ed9d2", 1, getminbitcountfornum(10), "int", &function_5a22e018, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_7dc9351ef45edb85", 1, getminbitcountfornum(10), "int", &function_8db3d8a, 0, 0);
    clientfield::register("actor", "" + #"hash_7a8eab5597b25400", 1, 1, "int", &function_5cb2858d, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_28a1a80b64f97e05", 1, 1, "int", &function_bbda8d37, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_7f7790ca43a7fffe", 1, 1, "int", &function_5fbccf1d, 0, 0);
    clientfield::register("world", "" + #"hash_437bd1912fc36607", 9000, 1, "int", &function_6c3e8bde, 0, 0);
    level._effect[#"hash_678ccbc01a6cece3"] = #"hash_46b64b63ec916fb0";
    level._effect[#"hash_5c9017c497c2e1ad"] = #"hash_2737905e546b7cf6";
    level._effect[#"hash_5856a36e375deb6e"] = #"hash_3408a29da555383b";
    level._effect[#"hash_5ddc1914159f22e0"] = #"hash_17ae3c34b5b4f5d9";
    level._effect[#"hash_369669eba0e9cba3"] = #"hash_6536e7e0d7d0819c";
    level._effect[#"portal_loop"] = #"hash_5b008f23ef5f92b5";
    level._effect[#"portal_trails"] = #"hash_356339c6b1b6cfa7";
    level._effect[#"portal_activate"] = #"hash_141455232c8efbcf";
    level._effect[#"hash_1e033a5d335f9c80"] = #"hash_23bccae9728cc69";
    level._effect[#"tugboat_surround"] = #"hash_263ef2a7714f7e0";
    level._effect[#"tugboat_fx"] = #"hash_2ab0dbe0ca737540";
    level._effect[#"hash_22ffb9cf999f16c0"] = #"hash_584c98e347b6f907";
    level._effect[#"shower_circle_80"] = #"hash_1a2cfde50dc2ab2f";
    level._effect[#"shower_circle_98"] = #"hash_1a297fe50dbf9f3e";
    level._effect[#"shower_circle_112"] = #"hash_7a9e103684dcd9e9";
    level._effect[#"shower_circle_128"] = #"hash_7a93943684d3b2b0";
    level._effect[#"generator_sparks"] = #"hash_274f915858a5ba54";
    level._effect[#"hash_45f8b28452411669"] = #"hash_5a70a6908023185e";
    level._effect[#"hash_7a8eab5597b25400"] = #"hash_680b356c3283464f";
    level._effect[#"hash_2f996104bd7c64fb"] = #"hash_7c6c9fc790a994bb";
    level._effect[#"hash_55bcc76865d0c844"] = #"hash_652d04bb8b685664";
    level._effect[#"hash_28a1a80b64f97e05"] = #"hash_4f551af60c2eb5d";
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x122c1cb5, Offset: 0x10a0
// Size: 0x52e
function function_f968291b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self endon(#"death");
    if (isdefined(self.var_b55b7d2c)) {
        killfx(localclientnum, self.var_b55b7d2c);
        self.var_b55b7d2c = undefined;
    }
    if (isdefined(self.var_767d572c)) {
        killfx(localclientnum, self.var_767d572c);
        self.var_767d572c = undefined;
    }
    if (isdefined(self.var_7a00469e)) {
        killfx(localclientnum, self.var_7a00469e);
        self.var_7a00469e = undefined;
    }
    if (newval == 1) {
        while (1) {
            s_result = undefined;
            s_result = self waittill(#"hash_593064545176ab53", #"hash_23e33f0aec28e476", #"hash_6ab654a4c018818c");
            if (s_result._notify == #"hash_6ab654a4c018818c") {
                self.var_b55b7d2c = util::playfxontag(localclientnum, level._effect[#"portal_loop"], self, "tag_origin");
                self.var_767d572c = util::playfxontag(localclientnum, level._effect[#"portal_trails"], self, "tag_origin");
                if (!isdefined(self.var_6bcee88f)) {
                    self playsound(localclientnum, #"hash_e0f8121b60150f3");
                    self.var_6bcee88f = self playloopsound(#"hash_17c6685aa5756f85");
                }
                return;
            } else if (s_result._notify == #"hash_593064545176ab53") {
                self.var_b55b7d2c = util::playfxontag(localclientnum, level._effect[#"portal_loop"], self, "tag_origin");
                self.var_767d572c = util::playfxontag(localclientnum, level._effect[#"portal_trails"], self, "tag_origin");
                if (!isdefined(self.var_6bcee88f)) {
                    self playsound(localclientnum, #"hash_e0f8121b60150f3");
                    self.var_6bcee88f = self playloopsound(#"hash_17c6685aa5756f85");
                }
            } else {
                if (isdefined(self.var_b55b7d2c)) {
                    killfx(localclientnum, self.var_b55b7d2c);
                    self.var_b55b7d2c = undefined;
                }
                if (isdefined(self.var_767d572c)) {
                    killfx(localclientnum, self.var_767d572c);
                    self.var_767d572c = undefined;
                }
                if (isdefined(self.var_6bcee88f)) {
                    self playsound(localclientnum, #"hash_bfec406f9040c46");
                    self stoploopsound(self.var_6bcee88f);
                    self.var_6bcee88f = undefined;
                }
            }
        }
    } else if (newval == 2) {
        if (!isdefined(self.var_b55b7d2c)) {
            self.var_b55b7d2c = util::playfxontag(localclientnum, level._effect[#"portal_loop"], self, "tag_origin");
        }
        self.var_7a00469e = util::playfxontag(localclientnum, level._effect[#"portal_activate"], self, "tag_origin");
        self playsound(localclientnum, #"hash_4941fd3f3fa17a5e");
        if (isdefined(self.var_767d572c)) {
            killfx(localclientnum, self.var_767d572c);
            self.var_767d572c = undefined;
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0xef31be2d, Offset: 0x15d8
// Size: 0x172
function function_3561f113(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_45eaf297)) {
        stopfx(localclientnum, self.var_45eaf297);
        self.var_45eaf297 = undefined;
    }
    if (isdefined(self.var_e1bd5c34)) {
        self playsound(localclientnum, #"hash_a57b10542fa379c");
        self stoploopsound(self.var_e1bd5c34);
        self.var_e1bd5c34 = undefined;
    }
    if (newval) {
        self.var_45eaf297 = util::playfxontag(localclientnum, level._effect[#"hash_1e033a5d335f9c80"], self, "tag_origin");
        if (!isdefined(self.var_e1bd5c34)) {
            self playsound(localclientnum, #"hash_302497e536365c05");
            self.var_e1bd5c34 = self playloopsound(#"hash_47bb1ffbe469dd4b");
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0xa44a385d, Offset: 0x1758
// Size: 0xf2
function function_8f74b4d7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_49bf1de7)) {
        stopfx(localclientnum, self.var_49bf1de7);
        self.var_49bf1de7 = undefined;
    }
    if (isdefined(self.var_c201a3d5)) {
        stopfx(localclientnum, self.var_c201a3d5);
        self.var_c201a3d5 = undefined;
    }
    if (newval == 1) {
        self.var_49bf1de7 = util::playfxontag(localclientnum, level._effect[#"tugboat_fx"], self, "tag_body");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x4b549a31, Offset: 0x1858
// Size: 0x8c
function function_28de769f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self endon(#"death");
    util::playfxontag(localclientnum, level._effect[#"hash_22ffb9cf999f16c0"], self, "tag_body");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x5b06ab96, Offset: 0x18f0
// Size: 0x14e
function function_a2368263(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (!isdefined(level.var_22a393d4)) {
            level.var_22a393d4 = [];
        } else if (!isarray(level.var_22a393d4)) {
            level.var_22a393d4 = array(level.var_22a393d4);
        }
        if (!isinarray(level.var_22a393d4, self)) {
            level.var_22a393d4[level.var_22a393d4.size] = self;
        }
        self.show_function = &function_915f2843;
        self.hide_function = &function_e2730196;
    } else {
        arrayremovevalue(level.var_22a393d4, self);
        self notify(#"hash_6ab654a4c018818c");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x9fe148be, Offset: 0x1a48
// Size: 0x1e
function private function_915f2843(localclientnum) {
    self notify(#"hash_593064545176ab53");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x471de82a, Offset: 0x1a70
// Size: 0x1e
function private function_e2730196(localclientnum) {
    self notify(#"hash_23e33f0aec28e476");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x84f7bb70, Offset: 0x1a98
// Size: 0x55e
function function_58397147(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (self isai()) {
        var_2cf005a1 = #"hash_68ee9247aaae4517";
    } else {
        var_2cf005a1 = #"hash_24cdaac09819f0e";
    }
    if (newval > 0) {
        if (!isdefined(level.var_22a393d4)) {
            level.var_22a393d4 = [];
        } else if (!isarray(level.var_22a393d4)) {
            level.var_22a393d4 = array(level.var_22a393d4);
        }
        if (!isinarray(level.var_22a393d4, self)) {
            level.var_22a393d4[level.var_22a393d4.size] = self;
        }
        self.show_function = &function_36e09e98;
        self.hide_function = &function_77fbeefa;
        player = function_5c10bd79(localclientnum);
        var_9094730f = zm_weap_spectral_shield::function_98890cd8(player.weapon, 1);
        if (!var_9094730f) {
            if (newval == 2 && self isai() && self.archetype == #"ghost") {
                util::playfxontag(localclientnum, level._effect[#"hash_55bcc76865d0c844"], self, "j_spinelower");
                if (isdefined(self.var_f2d4633f)) {
                    self playsound(localclientnum, #"hash_1b352bed4ab85497");
                    self stoploopsound(self.var_f2d4633f);
                    self.var_f2d4633f = undefined;
                }
            }
            if (!isdefined(level.var_22a393d4)) {
                level.var_22a393d4 = [];
            } else if (!isarray(level.var_22a393d4)) {
                level.var_22a393d4 = array(level.var_22a393d4);
            }
            if (!isinarray(level.var_22a393d4, self)) {
                level.var_22a393d4[level.var_22a393d4.size] = self;
            }
            self.show_function = &function_36e09e98;
            self.hide_function = &function_77fbeefa;
            self hide();
            self function_78233d29(var_2cf005a1, "", "Brightness", 0);
            self function_78233d29(var_2cf005a1, "", "Alpha", 0);
        }
    } else {
        arrayremovevalue(level.var_22a393d4, self);
        self.show_function = undefined;
        self.hide_function = undefined;
        self show();
        if (self isai()) {
            if (!isdefined(self.var_f2d4633f)) {
                self playsound(localclientnum, #"hash_2023f5976ef8d19b");
                self.var_f2d4633f = self playloopsound(#"hash_42d25612dd54c9fa");
            }
        }
        if (self isai() && self.archetype == #"ghost") {
            util::playfxontag(localclientnum, level._effect[#"hash_2f996104bd7c64fb"], self, "j_spinelower");
        }
        self function_78233d29(var_2cf005a1, "", "Brightness", 1);
        self function_78233d29(var_2cf005a1, "", "Alpha", 1);
        self notify(#"hash_6ab654a4c018818c");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xe7aa9d4d, Offset: 0x2000
// Size: 0x136
function private function_36e09e98(localclientnum) {
    self show();
    if (self isai()) {
        var_2cf005a1 = #"hash_68ee9247aaae4517";
        if (!isdefined(self.var_f2d4633f)) {
            self playsound(localclientnum, #"hash_2023f5976ef8d19b");
            self.var_f2d4633f = self playloopsound(#"hash_42d25612dd54c9fa");
        }
    } else {
        var_2cf005a1 = #"hash_24cdaac09819f0e";
    }
    self function_78233d29(var_2cf005a1, "", "Brightness", 1);
    self function_78233d29(var_2cf005a1, "", "Alpha", 1);
    self notify(#"set_visible");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x241faa7b, Offset: 0x2140
// Size: 0x136
function private function_77fbeefa(localclientnum) {
    self hide();
    if (self isai()) {
        var_2cf005a1 = #"hash_68ee9247aaae4517";
        if (isdefined(self.var_f2d4633f)) {
            self playsound(localclientnum, #"hash_1b352bed4ab85497");
            self stoploopsound(self.var_f2d4633f);
            self.var_f2d4633f = undefined;
        }
    } else {
        var_2cf005a1 = #"hash_24cdaac09819f0e";
    }
    self function_78233d29(var_2cf005a1, "", "Brightness", 0);
    self function_78233d29(var_2cf005a1, "", "Alpha", 0);
    self notify(#"set_invisible");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0xe7c3d932, Offset: 0x2280
// Size: 0x65a
function function_d4ec8793(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify(#"hash_65bbc5b33653977d");
    self endon(#"death", #"hash_65bbc5b33653977d");
    var_16bdddd2 = [];
    if (newval) {
        switch (newval) {
        case 1:
            var_16bdddd2 = array(#"hash_34358d231bfdb367", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c");
            break;
        case 2:
            var_16bdddd2 = array(#"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c");
            break;
        case 3:
            var_16bdddd2 = array(#"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c");
            break;
        case 4:
            var_16bdddd2 = array(#"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_b3995a8c1142a1c");
            break;
        case 5:
            var_16bdddd2 = array(#"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367");
            break;
        case 6:
            var_16bdddd2 = array(#"hash_b3995a8c1142a1c", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367");
            break;
        case 7:
            var_16bdddd2 = array(#"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367");
            break;
        case 8:
            var_16bdddd2 = array(#"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_34358d231bfdb367", #"hash_34358d231bfdb367");
            break;
        case 9:
            var_16bdddd2 = array(#"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_34358d231bfdb367");
            break;
        case 10:
            var_16bdddd2 = array(#"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c", #"hash_b3995a8c1142a1c");
            break;
        default:
            break;
        }
    }
    if (var_16bdddd2.size) {
        for (i = 0; i < var_16bdddd2.size; i++) {
            if (var_16bdddd2[i] == #"hash_b3995a8c1142a1c") {
                self notify(#"hash_756fa7ee0161ce3");
                var_d69c0e43 = 1.4;
            } else {
                self notify(#"hash_5d32c2a5e7a152f2");
                var_d69c0e43 = 0.5;
            }
            playsound(localclientnum, var_16bdddd2[i], self geteye());
            wait(var_d69c0e43);
            self notify(#"hash_3949754fec155f1e");
            wait(0.5);
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x727dd62b, Offset: 0x28e8
// Size: 0xfc
function function_e3248f02(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify(#"hash_65bbc5b33653977d");
    self endon(#"death", #"hash_65bbc5b33653977d");
    if (newval == 1) {
        playsound(localclientnum, #"hash_34358d231bfdb367", self geteye());
    } else if (newval == 2) {
        playsound(localclientnum, #"hash_b3995a8c1142a1c", self geteye());
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x1caf6592, Offset: 0x29f0
// Size: 0x106
function function_fdd08c0e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"disconnect");
    if (newval > 0) {
        n_val = newval - 1;
        self thread function_44181c14(localclientnum, n_val);
        self waittill(#"hash_59d521ca45c97f9d");
        waitframe(1);
        if (isdefined(self.var_351e0bdc) && self.var_351e0bdc) {
            exploder::kill_exploder("fxexp_buoy_light_0" + n_val);
            self.var_351e0bdc = undefined;
        }
    } else {
        self notify(#"hash_59d521ca45c97f9d");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0xba1d742f, Offset: 0x2b00
// Size: 0x15a
function private function_44181c14(localclientnum, n_val) {
    self endon(#"disconnect", #"hash_59d521ca45c97f9d");
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"hash_756fa7ee0161ce3", #"hash_5d32c2a5e7a152f2");
        if (!(isdefined(self.var_351e0bdc) && self.var_351e0bdc)) {
            exploder::exploder("fxexp_buoy_light_0" + n_val);
            self.var_351e0bdc = 1;
        }
        if (s_result._notify == #"hash_5d32c2a5e7a152f2") {
            self waittilltimeout(0.25, #"hash_3949754fec155f1e");
        } else {
            self waittill(1.1, #"hash_3949754fec155f1e");
        }
        if (isdefined(self.var_351e0bdc) && self.var_351e0bdc) {
            exploder::kill_exploder("fxexp_buoy_light_0" + n_val);
            self.var_351e0bdc = undefined;
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0xc7506b90, Offset: 0x2c68
// Size: 0x176
function function_da095cb3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_19e6dc6f)) {
        deletefx(localclientnum, self.var_19e6dc6f);
        self.var_19e6dc6f = undefined;
    }
    if (newval == 1) {
        if (!isdefined(self.var_25af2af1)) {
            self playsound(localclientnum, "zmb_giggles_3_64_light_start");
            self.var_25af2af1 = self playloopsound(#"hash_39ff4d3373413768");
        }
        self.var_19e6dc6f = util::playfxontag(localclientnum, level._effect[#"hash_45f8b28452411669"], self, "tag_origin");
    } else if (isdefined(self.var_25af2af1)) {
        self playsound(localclientnum, #"hash_7bebc063b1a89fbc");
        self stoploopsound(self.var_25af2af1);
        self.var_25af2af1 = undefined;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0xb43a1c06, Offset: 0x2de8
// Size: 0x222
function function_126253d1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_95254872)) {
        stopfx(localclientnum, self.var_95254872);
        self.var_95254872 = undefined;
    }
    if (newval > 0) {
        if (!isdefined(self.var_8d1080dd)) {
            self playsound(localclientnum, #"hash_38ffe6d2575fa1ba");
            self.var_8d1080dd = self playloopsound(#"hash_7fdfd0403ec4dcce");
        } else if (oldval > newval) {
            self playsound(localclientnum, #"hash_33facc55fbfba52");
        } else if (oldval < newval) {
            self playsound(localclientnum, #"hash_1a2a408c5055eb7a");
        }
        switch (newval) {
        case 1:
            str_effect = "shower_circle_80";
            break;
        case 2:
            str_effect = "shower_circle_98";
            break;
        case 3:
            str_effect = "shower_circle_112";
            break;
        case 4:
            str_effect = "shower_circle_128";
            break;
        }
        if (isdefined(str_effect)) {
            self.var_95254872 = util::playfxontag(localclientnum, level._effect[str_effect], self, "tag_origin");
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x87b1f09c, Offset: 0x3018
// Size: 0xba
function function_aa42aa09(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_b43e14a2)) {
        stopfx(localclientnum, self.var_b43e14a2);
        self.var_b43e14a2 = undefined;
    }
    if (newval == 1) {
        self.var_b43e14a2 = util::playfxontag(localclientnum, level._effect[#"generator_sparks"], self, "tag_origin");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x69a81f51, Offset: 0x30e0
// Size: 0x4b2
function function_8fd8b982(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    switch (newval) {
    case 0:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1);
        break;
    case 1:
        self playrenderoverridebundle(#"hash_68ee9247aaae4517");
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Brightness", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Alpha", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1);
        break;
    case 2:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.2);
        break;
    case 3:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.3);
        break;
    case 4:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.4);
        break;
    case 5:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.5);
        break;
    case 6:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.6);
        break;
    case 7:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.7);
        break;
    case 8:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.8);
        break;
    case 9:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.9);
        break;
    case 10:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Brightness", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Alpha", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 2);
        break;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x6dd348ab, Offset: 0x35a0
// Size: 0x4da
function function_acafe26b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    switch (newval) {
    case 0:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1);
        break;
    case 1:
        self playrenderoverridebundle(#"hash_24cdaac09819f0e");
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Brightness", 1);
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Alpha", 1);
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1);
        break;
    case 2:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1.2);
        break;
    case 3:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1.3);
        break;
    case 4:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1.4);
        break;
    case 5:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1.5);
        break;
    case 6:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1.6);
        break;
    case 7:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1.7);
        break;
    case 8:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1.8);
        break;
    case 9:
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 1.9);
        break;
    case 10:
        self playrenderoverridebundle(#"hash_24cdaac09819f0e");
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Brightness", 1);
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Alpha", 1);
        self function_78233d29(#"hash_24cdaac09819f0e", "", "Tint", 2);
        break;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x239ee9ec, Offset: 0x3a88
// Size: 0x4b2
function function_ab71f1f5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    switch (newval) {
    case 0:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Brightness", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Alpha", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 2);
        break;
    case 1:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.9);
        break;
    case 2:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.8);
        break;
    case 3:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.7);
        break;
    case 4:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.6);
        break;
    case 5:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.5);
        break;
    case 6:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.4);
        break;
    case 7:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.3);
        break;
    case 8:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.2);
        break;
    case 9:
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1.1);
        break;
    case 10:
        self playrenderoverridebundle(#"hash_68ee9247aaae4517");
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Brightness", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Alpha", 1);
        self function_78233d29(#"hash_68ee9247aaae4517", "", "Tint", 1);
        break;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x9544d9cd, Offset: 0x3f48
// Size: 0x1b6
function function_2380f2d5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        if (isdefined(self.var_2ef4fed9)) {
            self.var_2ef4fed9 delete();
        }
    } else if (isdefined(self.var_2ef4fed9)) {
        self.var_d2f68d5d = newval;
    } else {
        self.var_2ef4fed9 = util::spawn_model(localclientnum, #"hash_11298e91093a52ac", self.origin, self.angles);
        self.var_2ef4fed9.var_d2f68d5d = newval;
        self.var_2ef4fed9.show_function = &function_9fcac487;
        self.var_2ef4fed9.hide_function = &function_ffd0f7c6;
        self.var_2ef4fed9 function_ffd0f7c6(localclientnum);
        if (!isdefined(level.var_22a393d4)) {
            level.var_22a393d4 = [];
        } else if (!isarray(level.var_22a393d4)) {
            level.var_22a393d4 = array(level.var_22a393d4);
        }
        level.var_22a393d4[level.var_22a393d4.size] = self.var_2ef4fed9;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0xbfb611ff, Offset: 0x4108
// Size: 0x86
function function_5a22e018(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval > 0) {
        while (!isdefined(self.var_2ef4fed9)) {
            waitframe(1);
        }
        self.var_2ef4fed9.var_bd47f18 = newval;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x9387cc40, Offset: 0x4198
// Size: 0x86
function function_8db3d8a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval > 0) {
        while (!isdefined(self.var_2ef4fed9)) {
            waitframe(1);
        }
        self.var_2ef4fed9.var_f99adaa5 = newval;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x74112249, Offset: 0x4228
// Size: 0xe8
function function_ffd0f7c6(localclientnum) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    for (i = 1; i <= 3; i++) {
        for (j = 0; j <= 9; j++) {
            tag = "tag_nixie_number_" + i + "_" + j;
            if (self haspart(localclientnum, tag)) {
                self hidepart(localclientnum, tag);
            }
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x674090c3, Offset: 0x4318
// Size: 0x274
function function_9fcac487(localclientnum) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    self function_ffd0f7c6(localclientnum);
    if (isdefined(self.var_d2f68d5d)) {
        if (self.var_d2f68d5d == 10) {
            if (self haspart(localclientnum, "tag_nixie_number_1_0")) {
                self showpart(localclientnum, "tag_nixie_number_1_0");
            }
        } else if (self haspart(localclientnum, "tag_nixie_number_1_" + self.var_d2f68d5d)) {
            self showpart(localclientnum, "tag_nixie_number_1_" + self.var_d2f68d5d);
        }
    }
    if (isdefined(self.var_bd47f18)) {
        if (self.var_bd47f18 == 10) {
            if (self haspart(localclientnum, "tag_nixie_number_2_0")) {
                self showpart(localclientnum, "tag_nixie_number_2_0");
            }
        } else if (self haspart(localclientnum, "tag_nixie_number_2_" + self.var_bd47f18)) {
            self showpart(localclientnum, "tag_nixie_number_2_" + self.var_bd47f18);
        }
    }
    if (isdefined(self.var_f99adaa5)) {
        if (self.var_f99adaa5 == 10) {
            if (self haspart(localclientnum, "tag_nixie_number_3_0")) {
                self showpart(localclientnum, "tag_nixie_number_3_0");
            }
        } else if (self haspart(localclientnum, "tag_nixie_number_3_" + self.var_f99adaa5)) {
            self showpart(localclientnum, "tag_nixie_number_3_" + self.var_f99adaa5);
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0xfe2207ec, Offset: 0x4598
// Size: 0xcc
function function_6c3e8bde(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel(#"hash_4c06bc763e373f0f");
        forcestreamxmodel(#"hash_11298e91093a52ac");
    } else {
        stopforcestreamingxmodel(#"hash_4c06bc763e373f0f");
        stopforcestreamingxmodel(#"hash_11298e91093a52ac");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x315168ba, Offset: 0x4670
// Size: 0xba
function function_bbda8d37(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_7338b86b)) {
        stopfx(localclientnum, self.var_7338b86b);
        self.var_7338b86b = undefined;
    }
    if (newval == 1) {
        self.var_7338b86b = util::playfxontag(localclientnum, level._effect[#"hash_28a1a80b64f97e05"], self, "tag_fx");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0xae708492, Offset: 0x4738
// Size: 0xf2
function function_5cb2858d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.n_death_fx)) {
        deletefx(localclientnum, self.n_death_fx, 1);
        self.n_death_fx = undefined;
    }
    if (newval == 1) {
        str_tag = "j_spineupper";
        if (self.archetype == #"zombie_dog") {
            str_tag = "j_spine1";
        }
        self.n_death_fx = util::playfxontag(localclientnum, level._effect[#"hash_7a8eab5597b25400"], self, str_tag);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 7, eflags: 0x1 linked
// Checksum 0x6342bfa3, Offset: 0x4838
// Size: 0x8c
function function_5fbccf1d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self playrenderoverridebundle(#"hash_37d4ef63a7510b78");
    } else {
        self stoprenderoverridebundle(#"hash_37d4ef63a7510b78");
    }
}

