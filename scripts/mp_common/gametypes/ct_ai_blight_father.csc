// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace ct_ai_blight_father;

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 0, eflags: 0x2
// Checksum 0x4e0d000a, Offset: 0x490
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ct_ai_blight_father", &__init__, undefined, undefined);
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 0, eflags: 0x0
// Checksum 0xac167eb9, Offset: 0x4d8
// Size: 0x4cc
function __init__() {
    level._effect[#"fx8_blightfather_weakspot_sack_amb"] = "zm_ai/fx8_blightfather_weakspot_sack_amb";
    level._effect[#"fx8_blightfather_weakspot_elbow_amb"] = "zm_ai/fx8_blightfather_weakspot_elbow_amb";
    level._effect[#"fx8_blightfather_weakspot_jaw_amb"] = "zm_ai/fx8_blightfather_weakspot_jaw_amb";
    level._effect[#"fx8_blightfather_maggot_spawn_burst"] = "zm_ai/fx8_blightfather_maggot_spawn_burst";
    level._effect[#"fx8_blightfather_chaos_missle"] = "zm_ai/fx8_blightfather_chaos_missle";
    level._effect[#"fx8_blightfather_maggot_death_exp"] = "zm_ai/fx8_blightfather_maggot_death_exp";
    footsteps::registeraitypefootstepcb(#"blight_father", &function_958ba8d1);
    clientfield::register("actor", "blight_father_amb_sac_clientfield", 1, 1, "int", &function_192c82f8, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_l_elbow_fx", 1, 1, "int", &function_c6aa29ea, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_r_elbow_fx", 1, 1, "int", &function_caf74103, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_l_maggot_sac_fx", 1, 1, "int", &function_bc64a2a, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_r_maggot_sac_fx", 1, 1, "int", &function_c4fff539, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_jaw_fx", 1, 1, "int", &function_de0a50df, 0, 0);
    clientfield::register("actor", "blight_father_spawn_maggot_fx_left", 1, 1, "counter", &function_67ad42f3, 0, 0);
    clientfield::register("actor", "blight_father_spawn_maggot_fx_right", 1, 1, "counter", &function_f102952d, 0, 0);
    clientfield::register("actor", "mtl_blight_father_clientfield", 1, 1, "int", &function_75be2854, 0, 0);
    clientfield::register("scriptmover", "blight_father_maggot_trail_fx", 1, 1, "int", &function_e47c2324, 0, 0);
    clientfield::register("scriptmover", "blight_father_chaos_missile_explosion_clientfield", 1, 1, "int", &function_f02b0934, 0, 0);
    clientfield::register("toplayer", "blight_father_chaos_missile_rumble_clientfield", 1, 1, "counter", &function_7d5e27f4, 0, 0);
    clientfield::register("scriptmover", "blight_father_gib_explosion", 1, 1, "int", &function_7d5fa1ae, 0, 0);
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0x9d7c3a7, Offset: 0x9b0
// Size: 0xbc
function private function_7d5fa1ae(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self)) {
        origin = self gettagorigin("J_Spine4");
        if (!isdefined(origin)) {
            origin = self.origin;
        }
        physicsexplosionsphere(localclientnum, origin, 200, 0, 2);
    }
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0x813f348e, Offset: 0xa78
// Size: 0xbe
function private function_c6aa29ea(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_cc8c05d5 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_weakspot_elbow_amb"], self, "tag_elbow_weakspot_le");
        return;
    }
    if (isdefined(self.var_cc8c05d5)) {
        stopfx(localclientnum, self.var_cc8c05d5);
        self.var_cc8c05d5 = undefined;
    }
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0xdeda83c8, Offset: 0xb40
// Size: 0xbe
function private function_caf74103(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_e844c6a2 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_weakspot_elbow_amb"], self, "tag_elbow_weakspot_ri");
        return;
    }
    if (isdefined(self.var_e844c6a2)) {
        stopfx(localclientnum, self.var_e844c6a2);
        self.var_e844c6a2 = undefined;
    }
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0xf0237b4d, Offset: 0xc08
// Size: 0xbe
function private function_bc64a2a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_81531422 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_weakspot_sack_amb"], self, "tag_eggsack_weakspot_le_fx");
        return;
    }
    if (isdefined(self.var_81531422)) {
        stopfx(localclientnum, self.var_81531422);
        self.var_81531422 = undefined;
    }
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0x46118c44, Offset: 0xcd0
// Size: 0xbe
function private function_c4fff539(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_40cb39ba = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_weakspot_sack_amb"], self, "tag_eggsack_weakspot_ri_fx");
        return;
    }
    if (isdefined(self.var_40cb39ba)) {
        stopfx(localclientnum, self.var_40cb39ba);
        self.var_40cb39ba = undefined;
    }
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0x7d84f471, Offset: 0xd98
// Size: 0xbe
function private function_de0a50df(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_2beadf7 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_weakspot_jaw_amb"], self, "tag_jaw");
        return;
    }
    if (isdefined(self.var_2beadf7)) {
        stopfx(localclientnum, self.var_2beadf7);
        self.var_2beadf7 = undefined;
    }
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0x925f1f75, Offset: 0xe60
// Size: 0x74
function private function_67ad42f3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_maggot_spawn_burst"], self, "tag_sac_fx_le");
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0x9d5eddbc, Offset: 0xee0
// Size: 0x74
function private function_f102952d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_maggot_spawn_burst"], self, "tag_sac_fx_ri");
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0xf69eafd5, Offset: 0xf60
// Size: 0xcc
function private function_192c82f8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval) {
        self setanim(#"ai_t8_zm_zod_bltfthr_backsacs_add", 1, 0.1, 1);
        return;
    }
    self clearanim(#"ai_t8_zm_zod_bltfthr_backsacs_add", 0.2);
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0x95b36ef, Offset: 0x1038
// Size: 0xb4
function private function_e47c2324(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_f2668f6d = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_chaos_missle"], self, "tag_origin");
        return;
    }
    if (isdefined(self.var_f2668f6d)) {
        stopfx(localclientnum, self.var_f2668f6d);
    }
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0xba77b7f, Offset: 0x10f8
// Size: 0x11c
function private function_f02b0934(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    position = self.origin;
    angles = self.angles;
    if (isdefined(position) && isdefined(angles)) {
        playfx(localclientnum, level._effect[#"fx8_blightfather_maggot_death_exp"], position, anglestoforward(angles), anglestoup(angles));
        function_2a9101fe(localclientnum, #"hash_7867f8f9aaaa0c40", position);
    }
    earthquake(localclientnum, 0.4, 0.8, self.origin, 300);
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0x2c6225a7, Offset: 0x1220
// Size: 0x5c
function private function_7d5e27f4(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    function_36e4ebd4(localclientnum, "damage_heavy");
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 7, eflags: 0x4
// Checksum 0xb2e1515b, Offset: 0x1288
// Size: 0x74
function private function_75be2854(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, 1, 0, 0);
    }
}

// Namespace ct_ai_blight_father/ct_ai_blight_father
// Params 5, eflags: 0x0
// Checksum 0xcd83b78e, Offset: 0x1308
// Size: 0x1bc
function function_958ba8d1(localclientnum, pos, surface, notetrack, bone) {
    e_player = function_5c10bd79(localclientnum);
    n_dist = distancesquared(pos, e_player.origin);
    var_166f3552 = 1000000;
    if (var_166f3552 > 0) {
        n_scale = (var_166f3552 - n_dist) / var_166f3552;
    } else {
        return;
    }
    if (n_scale > 1 || n_scale < 0) {
        return;
    }
    n_scale *= 0.25;
    if (n_scale <= 0.01) {
        return;
    }
    earthquake(localclientnum, n_scale, 0.1, pos, n_dist);
    if (n_scale <= 0.25 && n_scale > 0.2) {
        function_36e4ebd4(localclientnum, "anim_med");
        return;
    }
    if (n_scale <= 0.2 && n_scale > 0.1) {
        function_36e4ebd4(localclientnum, "damage_light");
        return;
    }
    function_36e4ebd4(localclientnum, "damage_light");
}

