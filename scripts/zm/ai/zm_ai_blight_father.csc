#using scripts\core_common\ai\archetype_blight_father;
#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\footsteps_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\weapons\zm_weap_riotshield;
#using scripts\zm_common\zm_grappler;
#using scripts\zm_common\zm_transformation;
#using scripts\zm_common\zm_utility;

#namespace zm_ai_blight_father;

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x2
// Checksum 0x1aecaf1e, Offset: 0x778
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_blight_father", &__init__, undefined, undefined);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x9cf57bef, Offset: 0x7c0
// Size: 0x7a4
function __init__() {
    level._effect[#"fx8_blightfather_weakspot_sack_amb"] = "zm_ai/fx8_blightfather_weakspot_sack_amb";
    level._effect[#"fx8_blightfather_weakspot_elbow_amb"] = "zm_ai/fx8_blightfather_weakspot_elbow_amb";
    level._effect[#"fx8_blightfather_weakspot_jaw_amb"] = "zm_ai/fx8_blightfather_weakspot_jaw_amb";
    level._effect[#"fx8_plyr_pstfx_vomit_loop"] = "player/fx8_plyr_pstfx_vomit_loop";
    level._effect[#"fx8_blightfather_vomit"] = "zm_ai/fx8_blightfather_vomit";
    level._effect[#"fx8_blightfather_vomit_object"] = "zm_ai/fx8_blightfather_vomit_object";
    level._effect[#"fx8_blightfather_vomit_purchase"] = "zm_ai/fx8_blightfather_vomit_purchase";
    level._effect[#"fx8_blightfather_vomit_statue_purchase"] = "zm_ai/fx8_blightfather_vomit_statue_purchase";
    level._effect[#"fx8_blightfather_vomit_box_purchase"] = "zm_ai/fx8_blightfather_vomit_box_purchase";
    level._effect[#"fx8_blightfather_vomit_craft_purchase"] = "zm_ai/fx8_blightfather_vomit_craft_purchase";
    level._effect[#"fx8_blightfather_maggot_spawn_burst"] = "zm_ai/fx8_blightfather_maggot_spawn_burst";
    level._effect[#"fx8_blightfather_chaos_missle"] = "zm_ai/fx8_blightfather_chaos_missle";
    level._effect[#"fx8_blightfather_maggot_death_exp"] = "zm_ai/fx8_blightfather_maggot_death_exp";
    level.grappler_beam = "zod_blight_father_grapple_beam";
    footsteps::registeraitypefootstepcb(#"blight_father", &function_958ba8d1);
    clientfield::register("actor", "blight_father_amb_sac_clientfield", 1, 1, "int", &function_192c82f8, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_l_elbow_fx", 1, 1, "int", &function_c6aa29ea, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_r_elbow_fx", 1, 1, "int", &function_caf74103, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_l_maggot_sac_fx", 1, 1, "int", &function_bc64a2a, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_r_maggot_sac_fx", 1, 1, "int", &function_c4fff539, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_jaw_fx", 1, 1, "int", &function_de0a50df, 0, 0);
    clientfield::register("scriptmover", "blight_father_purchase_lockdown_vomit_fx", 1, 3, "int", &function_2c098ccc, 0, 0);
    clientfield::register("toplayer", "tongueGrabPostFx", 1, 1, "int", &tonguegrabpostfx, 0, 0);
    clientfield::register("toplayer", "tongueGrabRumble", 1, 1, "int", &tonguegrabrumble, 0, 0);
    clientfield::register("actor", "blight_father_vomit_fx", 1, 2, "int", &function_59f8f265, 0, 0);
    clientfield::register("actor", "blight_father_spawn_maggot_fx_left", 1, 1, "counter", &function_67ad42f3, 0, 0);
    clientfield::register("actor", "blight_father_spawn_maggot_fx_right", 1, 1, "counter", &function_f102952d, 0, 0);
    clientfield::register("actor", "mtl_blight_father_clientfield", 1, 1, "int", &function_75be2854, 0, 0);
    clientfield::register("scriptmover", "blight_father_maggot_trail_fx", 1, 1, "int", &function_e47c2324, 0, 0);
    clientfield::register("scriptmover", "blight_father_chaos_missile_explosion_clientfield", 1, 1, "int", &function_f02b0934, 0, 0);
    clientfield::register("toplayer", "blight_father_chaos_missile_rumble_clientfield", 1, 1, "counter", &function_7d5e27f4, 0, 0);
    clientfield::register("toplayer", "blight_father_vomit_postfx_clientfield", 1, 1, "int", &function_2d7f68ab, 0, 0);
    clientfield::register("scriptmover", "blight_father_gib_explosion", 1, 1, "int", &function_7d5fa1ae, 0, 0);
    clientfield::register("actor", "blight_father_death_fx", 17000, 6, "int", &blightfatherdeathfx, 0, 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x7b1e67bc, Offset: 0xf70
// Size: 0xdc
function private blightfatherdeathfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self)) {
        death_fx = function_4b885950(newval, 2, 3);
        origin = self gettagorigin("J_Spine4");
        if (!isdefined(origin)) {
            origin = self.origin;
        }
        playfx(localclientnum, death_fx, origin);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x835283ea, Offset: 0x1058
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0xb70c236c, Offset: 0x1120
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0xc7497ad3, Offset: 0x11e8
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x85ff7431, Offset: 0x12b0
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x12e7799b, Offset: 0x1378
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x886b91e1, Offset: 0x1440
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0xf7cd5470, Offset: 0x1508
// Size: 0x1da
function private function_2c098ccc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 1:
        self.var_32caa02 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_vomit_purchase"], self, "tag_origin");
        break;
    case 2:
        self.var_32caa02 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_vomit_statue_purchase"], self, "tag_origin");
        break;
    case 3:
        self.var_32caa02 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_vomit_box_purchase"], self, "tag_origin");
        break;
    case 4:
        self.var_32caa02 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_vomit_craft_purchase"], self, "tag_origin");
        break;
    default:
        if (isdefined(self.var_32caa02)) {
            stopfx(localclientnum, self.var_32caa02);
            self.var_32caa02 = undefined;
        }
        break;
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x8108f2c7, Offset: 0x16f0
// Size: 0x84
function private tonguegrabpostfx(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue) {
        self thread postfx::playpostfxbundle(#"pstfx_zm_tongue_grab");
        return;
    }
    self postfx::stoppostfxbundle("pstfx_zm_tongue_grab");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x748e7450, Offset: 0x1780
// Size: 0x114
function private tonguegrabrumble(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue) {
        if (self function_21c0fa55()) {
            function_36e4ebd4(localclientnum, "grapple_collision");
            function_fe0ad36e(localclientnum, "grapple_reel");
        }
        return;
    }
    if (self function_21c0fa55()) {
        function_36e4ebd4(localclientnum, "grapple_detach");
        self stoprumble(localclientnum, "grapple_collision");
        self stoprumble(localclientnum, "grapple_reel");
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0xfc64adb2, Offset: 0x18a0
// Size: 0x116
function private function_59f8f265(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.var_b0d99f6 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_vomit"], self, "tag_jaw");
        return;
    }
    if (newval == 2) {
        self.var_b0d99f6 = util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_vomit_object"], self, "tag_jaw");
        return;
    }
    if (isdefined(self.var_b0d99f6)) {
        stopfx(localclientnum, self.var_b0d99f6);
        self.var_b0d99f6 = undefined;
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x703f61be, Offset: 0x19c0
// Size: 0x74
function private function_67ad42f3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_maggot_spawn_burst"], self, "tag_sac_fx_le");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x6d89bda7, Offset: 0x1a40
// Size: 0x74
function private function_f102952d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"fx8_blightfather_maggot_spawn_burst"], self, "tag_sac_fx_ri");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x962875b3, Offset: 0x1ac0
// Size: 0xcc
function private function_192c82f8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self)) {
        if (newval) {
            self setanim(#"ai_t8_zm_zod_bltfthr_backsacs_add", 1, 0.1, 1);
            return;
        }
        self clearanim(#"ai_t8_zm_zod_bltfthr_backsacs_add", 0.2);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x215a8913, Offset: 0x1b98
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0x3c9f886b, Offset: 0x1c58
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0xae08df4a, Offset: 0x1d80
// Size: 0x5c
function private function_7d5e27f4(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    function_36e4ebd4(localclientnum, "damage_heavy");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0xdbd76f9d, Offset: 0x1de8
// Size: 0x74
function private function_75be2854(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, 1, 0, 0);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 5, eflags: 0x1 linked
// Checksum 0x61c612f6, Offset: 0x1e68
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

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 7, eflags: 0x5 linked
// Checksum 0xf28301fe, Offset: 0x2030
// Size: 0x13e
function private function_2d7f68ab(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!self zm_utility::function_f8796df3(localclientnum)) {
        return;
    }
    if (newval) {
        self.var_185f551 = playfxoncamera(localclientnum, level._effect[#"fx8_plyr_pstfx_vomit_loop"]);
        self postfx::playpostfxbundle("pstfx_zm_caustic_glob");
        self thread function_1a4f64a();
        self notify(#"hash_6bc06e9af30f987");
        return;
    }
    if (isdefined(self.var_185f551)) {
        stopfx(localclientnum, self.var_185f551);
    }
    self postfx::exitpostfxbundle("pstfx_zm_caustic_glob");
    self notify(#"hash_3af6fe8d4a8fac02");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x3a0f8f94, Offset: 0x2178
// Size: 0x8c
function function_1a4f64a() {
    self notify("6dcd79d7489a1b1");
    self endon("6dcd79d7489a1b1");
    self endoncallback(&function_43ec7ca3, #"death");
    self.var_7fd3b200 = 0;
    self thread function_cf88b888();
    self waittill(#"hash_3af6fe8d4a8fac02");
    wait 1;
    self thread function_1ca2497b();
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x464cd4a1, Offset: 0x2210
// Size: 0x134
function function_cf88b888() {
    self notify("77cd1973e51a1a17");
    self endon("77cd1973e51a1a17");
    self endoncallback(&function_43ec7ca3, #"death", #"hash_3af6fe8d4a8fac02");
    var_893a571 = 0;
    self playrenderoverridebundle("rob_zm_viewarm_vomit");
    while (!var_893a571) {
        var_37159c8c = self.var_7fd3b200;
        var_72840ba5 = min(var_37159c8c + 0.05, 1);
        self.var_7fd3b200 = var_72840ba5;
        self function_78233d29("rob_zm_viewarm_vomit", "", "Threshold", var_72840ba5);
        if (var_72840ba5 >= 1) {
            var_893a571 = 1;
            break;
        }
        wait 0.1;
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x6f34ab18, Offset: 0x2350
// Size: 0x12c
function function_1ca2497b() {
    self notify("6b4310a91dda8e0b");
    self endon("6b4310a91dda8e0b");
    self endoncallback(&function_43ec7ca3, #"death", #"hash_6bc06e9af30f987");
    var_e935ecce = 0;
    while (!var_e935ecce) {
        var_37159c8c = self.var_7fd3b200;
        var_72840ba5 = max(var_37159c8c - 0.025, 0);
        self.var_7fd3b200 = var_72840ba5;
        self function_78233d29("rob_zm_viewarm_vomit", "", "Threshold", var_72840ba5);
        if (var_72840ba5 <= 0) {
            self stoprenderoverridebundle("rob_zm_viewarm_vomit");
            var_e935ecce = 1;
            break;
        }
        wait 0.1;
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x4eb22026, Offset: 0x2488
// Size: 0xfc
function function_43ec7ca3(str_notify) {
    if (isdefined(self) && str_notify === "death") {
        if (self function_d2503806("rob_zm_viewarm_vomit")) {
            self function_f6e99a8d("rob_zm_viewarm_vomit");
        }
        localclientnum = self getlocalclientnumber();
        if (isdefined(self.var_185f551) && isdefined(localclientnum)) {
            killfx(localclientnum, self.var_185f551);
            self.var_185f551 = undefined;
        }
        if (postfx::function_556665f2("pstfx_zm_caustic_glob")) {
            self postfx::stoppostfxbundle("pstfx_zm_caustic_glob");
        }
    }
}

