#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\footsteps_shared;
#using scripts\core_common\util_shared;

#namespace archetype_elephant;

// Namespace archetype_elephant/archetype_elephant
// Params 0, eflags: 0x2
// Checksum 0x93251d9f, Offset: 0x298
// Size: 0x2a4
function autoexec init() {
    ai::add_archetype_spawn_function(#"elephant", &function_4c731a08);
    clientfield::register("actor", "towers_boss_melee_effect", 1, 1, "counter", &function_4d07056d, 0, 0);
    clientfield::register("actor", "tower_boss_death_fx", 1, 1, "counter", &function_58e13aab, 0, 0);
    clientfield::register("scriptmover", "entrails_model_cf", 1, 1, "int", &function_e3038292, 0, 0);
    clientfield::register("scriptmover", "towers_boss_head_proj_fx_cf", 1, 1, "int", &function_5f5f6a25, 0, 0);
    clientfield::register("scriptmover", "towers_boss_head_proj_explosion_fx_cf", 1, 1, "int", &function_1308296f, 0, 0);
    clientfield::register("actor", "towers_boss_eye_fx_cf", 1, 2, "int", &function_624041b1, 0, 0);
    clientfield::register("actor", "boss_death_rob", 1, 2, "int", &function_e1fb79d0, 0, 0);
    footsteps::registeraitypefootstepcb(#"elephant", &function_fe0bb012);
    clientfield::register("actor", "sndTowersBossArmor", 1, 1, "int", &sndtowersbossarmor, 0, 0);
}

// Namespace archetype_elephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x99ee33ae, Offset: 0x548
// Size: 0x2c
function private function_4c731a08(localclientnum) {
    self playrenderoverridebundle("rob_zm_eyes_red");
}

// Namespace archetype_elephant/archetype_elephant
// Params 7, eflags: 0x1 linked
// Checksum 0xf2e1927, Offset: 0x580
// Size: 0xe4
function function_624041b1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.eyefx = util::playfxontag(localclientnum, "maps/zm_towers/fx8_boss_eye_glow", self, "tag_eye");
        return;
    }
    if (newval == 2) {
        self.eyefx = util::playfxontag(localclientnum, "maps/zm_towers/fx8_boss_eye_glow_alt", self, "tag_eye");
        return;
    }
    if (isdefined(self.eyefx)) {
        stopfx(localclientnum, self.eyefx);
    }
}

// Namespace archetype_elephant/archetype_elephant
// Params 7, eflags: 0x1 linked
// Checksum 0xd14e19e7, Offset: 0x670
// Size: 0xac
function function_e1fb79d0(var_99c2529a, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self stoprenderoverridebundle("rob_zm_eyes_red");
        self playrenderoverridebundle(#"hash_782edffb9e72130");
        return;
    }
    self stoprenderoverridebundle(#"hash_782edffb9e72130");
}

// Namespace archetype_elephant/archetype_elephant
// Params 7, eflags: 0x1 linked
// Checksum 0xb86e2b5c, Offset: 0x728
// Size: 0x84
function function_e3038292(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!util::is_mature() || util::is_gib_restricted_build()) {
            self hide();
        }
    }
}

// Namespace archetype_elephant/archetype_elephant
// Params 7, eflags: 0x1 linked
// Checksum 0xf1140204, Offset: 0x7b8
// Size: 0xa4
function function_5f5f6a25(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.fx = util::playfxontag(localclientnum, "maps/zm_towers/fx8_boss_attack_eye_trail", self, "tag_origin");
        return;
    }
    if (isdefined(self.fx)) {
        stopfx(localclientnum, self.fx);
    }
}

// Namespace archetype_elephant/archetype_elephant
// Params 7, eflags: 0x1 linked
// Checksum 0x5631649, Offset: 0x868
// Size: 0xa4
function function_1308296f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.fx = util::playfxontag(localclientnum, "maps/zm_towers/fx8_boss_attack_eye_trail_split", self, "tag_origin");
        return;
    }
    if (isdefined(self.fx)) {
        stopfx(localclientnum, self.fx);
    }
}

// Namespace archetype_elephant/archetype_elephant
// Params 7, eflags: 0x1 linked
// Checksum 0xd15a338c, Offset: 0x918
// Size: 0x18c
function function_4d07056d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_player = function_5c10bd79(localclientnum);
    n_dist = distancesquared(self gettagorigin("j_nose4"), e_player.origin);
    var_b12c8a00 = 1400 * 1400;
    n_scale = (var_b12c8a00 - n_dist) / var_b12c8a00;
    if (n_scale > 0.01) {
        earthquake(localclientnum, n_scale, 1, self.origin, n_dist);
        if (n_scale <= 0.25 && n_scale > 0.2) {
            function_36e4ebd4(localclientnum, "tank_fire");
        } else {
            function_36e4ebd4(localclientnum, "damage_heavy");
        }
        physicsexplosionsphere(localclientnum, self.origin, 400, 100, 20);
    }
}

// Namespace archetype_elephant/archetype_elephant
// Params 7, eflags: 0x1 linked
// Checksum 0x9aa739d0, Offset: 0xab0
// Size: 0xd4
function function_58e13aab(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_player = function_5c10bd79(localclientnum);
    earthquake(localclientnum, 0.6, 1, self.origin, 4000);
    function_36e4ebd4(localclientnum, "tank_fire");
    physicsexplosionsphere(localclientnum, self.origin, 2000, 100, 4);
}

// Namespace archetype_elephant/archetype_elephant
// Params 5, eflags: 0x1 linked
// Checksum 0x10763c38, Offset: 0xb90
// Size: 0x134
function function_fe0bb012(localclientnum, pos, surface, notetrack, bone) {
    e_player = function_5c10bd79(localclientnum);
    n_dist = distancesquared(pos, e_player.origin);
    var_b12c8a00 = 1200 * 1200;
    if (n_dist < var_b12c8a00) {
        earthquake(localclientnum, 0.1, 0.5, self.origin, n_dist);
        function_36e4ebd4(localclientnum, "damage_light");
        if (isdefined(bone)) {
            origin = self gettagorigin(bone);
            physicsexplosionsphere(localclientnum, origin, 200, 20, 20);
        }
    }
}

// Namespace archetype_elephant/archetype_elephant
// Params 7, eflags: 0x1 linked
// Checksum 0x1db59892, Offset: 0xcd0
// Size: 0x94
function sndtowersbossarmor(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        setsoundcontext("supernicedude", "armor");
        return;
    }
    setsoundcontext("supernicedude", "");
}

