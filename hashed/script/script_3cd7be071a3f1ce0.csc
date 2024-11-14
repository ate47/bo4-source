#using scripts\zm_common\zm_utility;
#using scripts\core_common\util_shared;
#using scripts\core_common\struct;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\clientfield_shared;

#namespace namespace_b6ca3ccc;

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xa8f0a5fe, Offset: 0x128
// Size: 0x3b2
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"falling_leaves", 8000, 1, "int", &function_664898b6, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_34321e7ca580e772", 8000, 1, "int", &function_f6c7ad1b, 0, 0);
    clientfield::register("scriptmover", "" + #"stick_fire", 8000, 2, "int", &function_959fcbff, 0, 0);
    clientfield::register("scriptmover", "" + #"stone_rise", 8000, 1, "counter", &function_a7012457, 0, 0);
    clientfield::register("toplayer", "" + #"player_dragged", 8000, 1, "int", &function_a5f32c8f, 0, 0);
    clientfield::register("toplayer", "" + #"hash_4be98315796ad666", 8000, 1, "int", &function_f568352e, 0, 0);
    clientfield::register("allplayers", "" + #"sacrifice_player", 8000, 1, "int", &function_d61c8c59, 0, 0);
    clientfield::register("allplayers", "" + #"hash_30aa04edc476253f", 8000, 1, "int", &function_3c4642b1, 0, 0);
    level._effect[#"stick_fire"] = #"hash_31d36dbca458b0dd";
    level._effect[#"falling_leaves"] = #"hash_6d3c039680511839";
    level._effect[#"hash_dea2f3dceff7569"] = #"zombie/fx_spawn_dirt_body_billowing_zmb";
    level._effect[#"player_afterlife"] = #"hash_6484874c383f70f9";
    level._effect[#"hash_418533e3f4de4e1a"] = #"hash_5586bb7a838e870a";
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 7, eflags: 0x1 linked
// Checksum 0x834303d7, Offset: 0x4e8
// Size: 0x7c
function function_a7012457(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        playfx(localclientnum, level._effect[#"hash_dea2f3dceff7569"], self.origin);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 7, eflags: 0x1 linked
// Checksum 0xd453ff67, Offset: 0x570
// Size: 0x8c
function function_f6c7ad1b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle(#"hash_2db85fc8b73a1571");
        return;
    }
    self stoprenderoverridebundle(#"hash_2db85fc8b73a1571");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 7, eflags: 0x1 linked
// Checksum 0x599bd8a, Offset: 0x608
// Size: 0xaa
function function_664898b6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(self.var_f65805a8)) {
            stopfx(localclientnum, self.var_f65805a8);
        }
        self.var_f65805a8 = util::playfxontag(localclientnum, level._effect[#"falling_leaves"], self, "tag_origin");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 7, eflags: 0x1 linked
// Checksum 0x2cfbed70, Offset: 0x6c0
// Size: 0x312
function function_959fcbff(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (isdefined(self.var_d8243293)) {
        stopfx(localclientnum, self.var_d8243293);
        self.var_d8243293 = undefined;
    }
    if (isdefined(self.var_f756621f)) {
        stopfx(localclientnum, self.var_f756621f);
        self.var_f756621f = undefined;
    }
    if (isdefined(self.var_a0bfa25b)) {
        self playsound(localclientnum, #"hash_7afee3f791f6bfa2");
        self stoploopsound(self.var_a0bfa25b);
    }
    if (newval == 1) {
        self.var_d8243293 = util::playfxontag(localclientnum, level._effect[#"stick_fire"], self, "tag_origin");
        if (!isdefined(self.var_a0bfa25b)) {
            self playsound(localclientnum, #"hash_4c82cdad375db1a2");
            self.var_a0bfa25b = self playloopsound(#"hash_7449f6af6a74ea36");
        }
        return;
    }
    if (newval == 2) {
        forcestreamxmodel(#"p8_zm_man_dead_tree_branches_burned");
        util::delay(2, undefined, &stopforcestreamingxmodel, #"p8_zm_man_dead_tree_branches_burned");
        self.var_d8243293 = util::playfxontag(localclientnum, level._effect[#"stick_fire"], self, "tag_origin");
        if (!isdefined(self.var_a0bfa25b)) {
            self playsound(localclientnum, #"hash_4c82cdad375db1a2");
            self.var_a0bfa25b = self playloopsound(#"hash_7449f6af6a74ea36");
        }
        wait 2;
        self.var_f756621f = util::playfxontag(localclientnum, level._effect[#"hash_418533e3f4de4e1a"], self, "tag_origin");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 7, eflags: 0x1 linked
// Checksum 0xffbe2f6d, Offset: 0x9e0
// Size: 0x1d6
function function_a5f32c8f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (isdefined(self.var_fe11bb61)) {
        deletefx(localclientnum, self.var_fe11bb61, 1);
        self.var_fe11bb61 = undefined;
    }
    if (newval == 1) {
        self.var_fe11bb61 = playfxoncamera(localclientnum, level._effect[#"player_afterlife"]);
        self postfx::playpostfxbundle(#"hash_66a9fee7028a1e13");
        if (!isdefined(self.var_9096803d)) {
            self playsound(localclientnum, #"hash_6395d64b5a8efc03");
            self.var_9096803d = self playloopsound(#"hash_6e133362b9af5877");
        }
        return;
    }
    self postfx::stoppostfxbundle(#"hash_66a9fee7028a1e13");
    if (isdefined(self.var_9096803d)) {
        self playsound(localclientnum, #"hash_3ca6c0d3ecd48de2");
        self stoploopsound(self.var_9096803d);
        self.var_9096803d = undefined;
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 7, eflags: 0x1 linked
// Checksum 0xdffdf0ba, Offset: 0xbc0
// Size: 0x146
function function_f568352e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval) {
        self postfx::playpostfxbundle(#"hash_2b222dbd1ad76165");
        if (!isdefined(self.var_eb29cb6e)) {
            self playsound(localclientnum, #"hash_414c95206d51679c");
            self.var_eb29cb6e = self playloopsound(#"hash_1d748b5f5528a66a");
        }
        return;
    }
    self postfx::stoppostfxbundle(#"hash_2b222dbd1ad76165");
    if (isdefined(self.var_eb29cb6e)) {
        self playsound(localclientnum, #"hash_6560ce0b7a4a80c9");
        self stoploopsound(self.var_eb29cb6e);
        self.var_eb29cb6e = undefined;
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 7, eflags: 0x1 linked
// Checksum 0x14b0b781, Offset: 0xd10
// Size: 0x4de
function function_d61c8c59(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.var_b196c692)) {
        self.var_b196c692 = [];
    }
    if (!isdefined(self.var_b196c692[localclientnum])) {
        self.var_b196c692[localclientnum] = [];
    }
    if (newval == 1) {
        if (self getlocalclientnumber() === localclientnum) {
            self thread postfx::playpostfxbundle(#"hash_33e699252aac7a7e");
            if (!isdefined(self.var_637d4665)) {
                self playsound(localclientnum, #"hash_4ce4fa4f56e4698d");
                self.var_637d4665 = self playloopsound(#"hash_43bc941f5e61242d");
            }
            a_e_players = getlocalplayers();
            foreach (e_player in a_e_players) {
                if (!e_player util::function_50ed1561(localclientnum)) {
                    e_player thread zm_utility::function_bb54a31f(localclientnum, #"hash_33e699252aac7a7e", #"hash_3ac1c56d5f920a24");
                }
            }
        } else {
            if (self hasdobj(localclientnum)) {
                self.var_b196c692[localclientnum] = playtagfxset(localclientnum, "weapon_katana_smoke_3p", self);
            }
            if (!isdefined(self.var_5d816fd0)) {
                self playsound(localclientnum, #"hash_50cea74fea1f3dcc");
                self.var_637d4665 = self playloopsound(#"hash_47a7411ff19dab6c");
            }
        }
        return;
    }
    if (self getlocalclientnumber() === localclientnum) {
        self postfx::stoppostfxbundle(#"hash_33e699252aac7a7e");
        a_e_players = getlocalplayers();
        foreach (e_player in a_e_players) {
            if (!e_player util::function_50ed1561(localclientnum)) {
                e_player notify(#"hash_3ac1c56d5f920a24");
            }
        }
        if (isdefined(self.var_637d4665)) {
            self playsound(localclientnum, #"hash_db54c67c5697558");
            self stoploopsound(self.var_637d4665);
            self.var_637d4665 = undefined;
        }
        return;
    }
    if (isdefined(self.var_b196c692[localclientnum])) {
        foreach (fx in self.var_b196c692[localclientnum]) {
            stopfx(localclientnum, fx);
        }
        self.var_b196c692[localclientnum] = undefined;
    }
    if (isdefined(self.var_5d816fd0)) {
        self playsound(localclientnum, #"hash_28d41f681d0c4371");
        self stoploopsound(self.var_5d816fd0);
        self.var_5d816fd0 = undefined;
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 7, eflags: 0x1 linked
// Checksum 0x65638026, Offset: 0x11f8
// Size: 0x114
function function_3c4642b1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_928ceb18)) {
        stopfx(localclientnum, self.var_928ceb18);
        self.var_928ceb18 = undefined;
        self notify(#"hash_ac788aea26a8b23");
    }
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (newval == 1) {
        self.var_928ceb18 = util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_torso", self, "j_spinelower");
        self thread function_443d6ae(localclientnum);
        self playsound(localclientnum, #"hash_71ccbe40ffaafe22");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0xd0b2aa4d, Offset: 0x1318
// Size: 0x5c
function function_443d6ae(localclientnum) {
    self endon(#"death", #"hash_ac788aea26a8b23");
    wait 0.15;
    self playrenderoverridebundle(#"hash_429426f01ad84c8b");
}

