#using scripts\core_common\audio_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_orange_freeze_trap;

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x1 linked
// Checksum 0x337a0caf, Offset: 0x150
// Size: 0x1e4
function init() {
    clientfield::register("actor", "freeze_trap_death_fx", 24000, 1, "int", &freeze_trap_death_fx, 0, 0);
    clientfield::register("scriptmover", "freeze_trap_fx", 24000, 1, "int", &freeze_trap_fx, 0, 0);
    clientfield::register("toplayer", "player_freeze_trap_post_fx", 24000, 1, "int", &player_freeze_trap_post_fx, 0, 0);
    level._effect[#"freeze_spray"] = #"hash_424786ecbc7f5672";
    level._effect[#"hash_4131e133ed64bb15"] = #"hash_48d74d13d0c569c";
    level._effect[#"hash_4dbed2be32ca74bc"] = #"hash_29ac72c5aa5398bc";
    level._effect[#"hash_4b8af2aba0424cf3"] = #"hash_709cca7d0048aa72";
    level._effect[#"hash_64e2b0ae28329360"] = #"hash_69af1783a31b44f7";
    forcestreamxmodel("p8_zm_ora_soapstone_01_cold");
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 7, eflags: 0x1 linked
// Checksum 0xbe19f89c, Offset: 0x340
// Size: 0x1ac
function freeze_trap_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdefined(self.var_91180673)) {
            self.var_91180673 delete();
        }
        playsound(localclientnum, #"hash_68f3e5dbc3422363", self.origin);
        audio::playloopat("zmb_trap_acid_loop", self.origin);
        self.var_91180673 = util::playfxontag(localclientnum, level._effect[#"freeze_spray"], self, "tag_origin");
        return;
    }
    playsound(localclientnum, #"hash_4da8231bc8767676", self.origin);
    audio::stoploopat("zmb_trap_acid_loop", self.origin);
    if (isdefined(self.var_91180673)) {
        stopfx(localclientnum, self.var_91180673);
        self.var_91180673 = undefined;
    }
    playfx(localclientnum, level._effect[#"hash_4131e133ed64bb15"], self.origin);
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 7, eflags: 0x1 linked
// Checksum 0x185b0ffc, Offset: 0x4f8
// Size: 0xee
function freeze_trap_death_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.n_freeze_trap_death_fx = util::playfxontag(localclientnum, level._effect[#"hash_4dbed2be32ca74bc"], self, "tag_stowed_back");
        playsound(localclientnum, #"hash_4d4c9f8ad239b61f", self.origin);
        return;
    }
    if (isdefined(self.n_freeze_trap_death_fx)) {
        stopfx(localclientnum, self.n_freeze_trap_death_fx);
        self.n_freeze_trap_death_fx = undefined;
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 7, eflags: 0x1 linked
// Checksum 0x5e78a0a5, Offset: 0x5f0
// Size: 0x286
function player_freeze_trap_post_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    level endon(#"end_game");
    self endon(#"death");
    if (newval == 1) {
        if (isdemoplaying() && demoisanyfreemovecamera()) {
            return;
        }
        if (self != function_5c10bd79(localclientnum)) {
            return;
        }
        self notify(#"player_freeze_trap_post_fx_complete");
        self.var_f08ae416 = self playloopsound(#"hash_341a3fa00975f232");
        self.var_b2ea9ecc = 0.825;
        self thread function_4443ecea(localclientnum);
        self thread postfx::playpostfxbundle(#"pstfx_frost_loop_fullscreen");
        self postfx::function_c8b5f318(#"pstfx_frost_loop_fullscreen", #"reveal threshold", 0.825);
        return;
    }
    while (isalive(self) && self.var_b2ea9ecc > 0.5) {
        self.var_b2ea9ecc -= 0.325 / 20;
        if (self.var_b2ea9ecc < 0.5) {
            self.var_b2ea9ecc = 0.5;
        }
        self postfx::function_c8b5f318(#"pstfx_frost_loop_fullscreen", #"reveal threshold", self.var_b2ea9ecc);
        wait 0.05;
    }
    if (isdefined(self.var_f08ae416)) {
        self stoploopsound(self.var_f08ae416);
        self.var_f08ae416 = undefined;
    }
    self notify(#"player_freeze_trap_post_fx_complete");
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x1 linked
// Checksum 0xea3a06e1, Offset: 0x880
// Size: 0xbc
function function_4443ecea(localclientnum) {
    self endoncallback(&function_b487d98d, #"death");
    self waittill(#"player_freeze_trap_post_fx_complete");
    if (isdefined(self)) {
        self postfx::exitpostfxbundle(#"pstfx_frost_loop_fullscreen");
        if (isdefined(self.var_f08ae416)) {
            self stoploopsound(self.var_f08ae416);
            self.var_f08ae416 = undefined;
        }
        self stoprenderoverridebundle(#"hash_216f6c4ece79a4b8");
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x1 linked
// Checksum 0x4a705ef4, Offset: 0x948
// Size: 0x144
function function_b487d98d(str_notify) {
    if (isdefined(self)) {
        localclientnum = self getlocalclientnumber();
        if (self postfx::function_556665f2(#"hash_98397d99cb3a03")) {
            self postfx::exitpostfxbundle(#"hash_98397d99cb3a03");
        }
        if (isdefined(self.var_f08ae416)) {
            self stoploopsound(self.var_f08ae416);
            self.var_f08ae416 = undefined;
        }
        if (isdefined(localclientnum) && isdefined(self.var_35ba157e)) {
            stopfx(localclientnum, self.var_35ba157e);
            self.var_35ba157e = undefined;
        }
        if (isdefined(localclientnum) && isdefined(self.var_1aab7c79)) {
            stopfx(localclientnum, self.var_1aab7c79);
            self.var_1aab7c79 = undefined;
        }
        self stoprenderoverridebundle(#"hash_216f6c4ece79a4b8");
    }
}

