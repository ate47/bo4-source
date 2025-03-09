#using scripts\core_common\ai\systems\fx_character;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\footsteps_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_utility;

#namespace zm_ai_gegenees;

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x2
// Checksum 0x99df9906, Offset: 0x300
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_gegenees", &__init__, undefined, undefined);
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x0
// Checksum 0x3ffe1557, Offset: 0x348
// Size: 0x2f4
function __init__() {
    level._effect[#"fx8_gegenees_shield_blast"] = "zm_ai/fx8_gegenees_shield_blast";
    level._effect[#"fx8_gegenees_shield_guard"] = "zm_ai/fx8_gegenees_shield_guard";
    level._effect[#"fx8_gegenees_spear_tip_flame"] = "zm_ai/fx8_gegenees_spear_tip_flame";
    level._effect[#"fx8_gegenees_spear_tip_tell"] = "zm_ai/fx8_gegenees_spear_tip_tell";
    level._effect[#"fx8_stoker_dest_weak_point_exp_generic"] = "zm_ai/fx8_stoker_dest_weak_point_exp_generic";
    footsteps::registeraitypefootstepcb(#"gegenees", &function_d00809d8);
    clientfield::register("actor", "gegenees_shield_blast_effect", 16000, 1, "counter", &function_8745f9df, 0, 0);
    clientfield::register("actor", "gegenees_shield_guard_effect", 16000, 1, "int", &function_ae96bf9a, 0, 0);
    clientfield::register("actor", "gegenees_spear_tip_effect", 16000, 1, "int", &function_33dedae1, 0, 0);
    clientfield::register("actor", "gegenees_spear_tip_tell_effect", 16000, 1, "int", &function_421757ab, 0, 0);
    clientfield::register("toplayer", "gegenees_damage_cf", 16000, 1, "counter", &function_2ee4a6b6, 0, 0);
    clientfield::register("scriptmover", "gegenees_spear_miss_cf", 16000, 1, "counter", &function_ce49549a, 0, 0);
    clientfield::register("actor", "gegenees_helmet_explosion_cf", 16000, 1, "int", &function_d54aae3e, 0, 0);
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 5, eflags: 0x4
// Checksum 0x38ecb63d, Offset: 0x648
// Size: 0x25c
function private function_d00809d8(localclientnum, pos, surface, notetrack, bone) {
    e_player = function_5c10bd79(localclientnum);
    n_dist = distancesquared(pos, e_player.origin);
    is_large = 0;
    if (notetrack == "footstep_left_large" || notetrack == "footstep_right_large") {
        is_large = 1;
    }
    var_a34b4731 = 1000000;
    if (is_large) {
        var_a34b4731 = 4000000;
    }
    if (var_a34b4731 > 0) {
        n_scale = (var_a34b4731 - n_dist) / var_a34b4731;
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
        if (is_large) {
            function_36e4ebd4(localclientnum, "damage_heavy");
        } else {
            function_36e4ebd4(localclientnum, "anim_med");
        }
        return;
    }
    if (n_scale <= 0.2 && n_scale > 0.1) {
        if (is_large) {
            function_36e4ebd4(localclientnum, "anim_med");
        } else {
            function_36e4ebd4(localclientnum, "damage_light");
        }
        return;
    }
    function_36e4ebd4(localclientnum, "damage_light");
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 7, eflags: 0x4
// Checksum 0x5596d14c, Offset: 0x8b0
// Size: 0x7a
function private function_8745f9df(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.var_cafcaa0a = util::playfxontag(localclientnum, level._effect[#"fx8_gegenees_shield_blast"], self, "tag_shield_fx");
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 7, eflags: 0x4
// Checksum 0x75630506, Offset: 0x938
// Size: 0xbe
function private function_ae96bf9a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_7c984f = util::playfxontag(localclientnum, level._effect[#"fx8_gegenees_shield_guard"], self, "tag_shield_fx");
        return;
    }
    if (isdefined(self.var_7c984f)) {
        stopfx(localclientnum, self.var_7c984f);
        self.var_7c984f = undefined;
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 7, eflags: 0x4
// Checksum 0x6dc5371f, Offset: 0xa00
// Size: 0xbe
function private function_33dedae1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_645626ad = util::playfxontag(localclientnum, level._effect[#"fx8_gegenees_spear_tip_flame"], self, "tag_spear_tip_fx");
        return;
    }
    if (isdefined(self.var_645626ad)) {
        killfx(localclientnum, self.var_645626ad);
        self.var_645626ad = undefined;
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 7, eflags: 0x4
// Checksum 0xe57bddff, Offset: 0xac8
// Size: 0xbe
function private function_421757ab(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_55203ff4 = util::playfxontag(localclientnum, level._effect[#"fx8_gegenees_spear_tip_tell"], self, "tag_spear_tip_fx");
        return;
    }
    if (isdefined(self.var_55203ff4)) {
        stopfx(localclientnum, self.var_55203ff4);
        self.var_55203ff4 = undefined;
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 7, eflags: 0x4
// Checksum 0x90590f38, Offset: 0xb90
// Size: 0xcc
function private function_2ee4a6b6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isalive(self) || self !== function_5c10bd79(localclientnum)) {
        return;
    }
    earthquake(localclientnum, 0.5, 0.1, self.origin, 40);
    function_36e4ebd4(localclientnum, "damage_heavy");
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 7, eflags: 0x4
// Checksum 0xef653793, Offset: 0xc68
// Size: 0x1dc
function private function_ce49549a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_player = function_5c10bd79(localclientnum);
    n_dist = distancesquared(self.origin, e_player.origin);
    var_a34b4731 = 1000000;
    if (var_a34b4731 > 0) {
        n_scale = (var_a34b4731 - n_dist) / var_a34b4731;
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
    earthquake(localclientnum, n_scale, 0.1, self.origin, n_dist);
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

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 7, eflags: 0x4
// Checksum 0xf4f6566, Offset: 0xe50
// Size: 0x82
function private function_d54aae3e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.fx_helmet = util::playfxontag(localclientnum, level._effect[#"fx8_stoker_dest_weak_point_exp_generic"], self, "j_head");
    }
}

