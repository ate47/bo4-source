#using scripts\core_common\ai\systems\fx_character;
#using scripts\core_common\ai_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\footsteps_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_utility;

#namespace zm_ai_gladiator;

// Namespace zm_ai_gladiator/zm_ai_gladiator
// Params 0, eflags: 0x2
// Checksum 0x7bc6ed58, Offset: 0x1d0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_gladiator", &__init__, undefined, undefined);
}

// Namespace zm_ai_gladiator/zm_ai_gladiator
// Params 0, eflags: 0x1 linked
// Checksum 0xeecc43c5, Offset: 0x218
// Size: 0x15c
function __init__() {
    level._effect[#"fx8_destroyer_axe_trail"] = "zm_ai/fx8_destroyer_axe_trail";
    level._effect[#"fx8_destroyer_arm_spurt"] = "zm_ai/fx8_destroyer_arm_spurt";
    footsteps::registeraitypefootstepcb(#"gladiator", &function_918ce680);
    clientfield::register("toplayer", "gladiator_melee_effect", 1, 1, "counter", &function_5dae94f, 0, 0);
    clientfield::register("actor", "gladiator_arm_effect", 1, 2, "int", &function_f5a07d57, 0, 0);
    clientfield::register("scriptmover", "gladiator_axe_effect", 1, 1, "int", &function_49fab171, 0, 0);
}

// Namespace zm_ai_gladiator/zm_ai_gladiator
// Params 5, eflags: 0x5 linked
// Checksum 0x284319b, Offset: 0x380
// Size: 0x1bc
function private function_918ce680(localclientnum, pos, surface, notetrack, bone) {
    e_player = function_5c10bd79(localclientnum);
    n_dist = distancesquared(pos, e_player.origin);
    var_dfce5acd = 1000000;
    if (var_dfce5acd > 0) {
        n_scale = (var_dfce5acd - n_dist) / var_dfce5acd;
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

// Namespace zm_ai_gladiator/zm_ai_gladiator
// Params 7, eflags: 0x5 linked
// Checksum 0x1394b3f4, Offset: 0x548
// Size: 0x8c
function private function_5dae94f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    earthquake(localclientnum, 0.3, 1.2, self.origin, 64);
    function_36e4ebd4(localclientnum, "damage_light");
}

// Namespace zm_ai_gladiator/zm_ai_gladiator
// Params 7, eflags: 0x5 linked
// Checksum 0xf27044f8, Offset: 0x5e0
// Size: 0xcc
function private function_f5a07d57(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        util::playfxontag(localclientnum, level._effect[#"fx8_destroyer_arm_spurt"], self, "j_shouldertwist_le");
        return;
    }
    if (newval == 2) {
        util::playfxontag(localclientnum, level._effect[#"fx8_destroyer_arm_spurt"], self, "tag_shoulder_ri_fx");
    }
}

// Namespace zm_ai_gladiator/zm_ai_gladiator
// Params 7, eflags: 0x5 linked
// Checksum 0xfdc7e784, Offset: 0x6b8
// Size: 0xb4
function private function_49fab171(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_c047d899 = util::playfxontag(localclientnum, level._effect[#"fx8_destroyer_axe_trail"], self, "tag_origin");
        return;
    }
    if (isdefined(self.var_c047d899)) {
        stopfx(localclientnum, self.var_c047d899);
    }
}

