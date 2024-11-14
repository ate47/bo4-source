#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;
#using scripts\core_common\math_shared;

#namespace zm_bgb_alchemical_antithesis;

// Namespace zm_bgb_alchemical_antithesis/zm_bgb_alchemical_antithesis
// Params 0, eflags: 0x2
// Checksum 0x1e88fbea, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_alchemical_antithesis", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_alchemical_antithesis/zm_bgb_alchemical_antithesis
// Params 0, eflags: 0x1 linked
// Checksum 0xc3f874d4, Offset: 0xf8
// Size: 0xc4
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_alchemical_antithesis", "activated", 1, undefined, undefined, &validation, &activation);
    bgb::function_57eb02e(#"zm_bgb_alchemical_antithesis");
    bgb::function_c2721e81(#"zm_bgb_alchemical_antithesis", &add_to_player_score_override, 0);
}

// Namespace zm_bgb_alchemical_antithesis/zm_bgb_alchemical_antithesis
// Params 0, eflags: 0x1 linked
// Checksum 0xddb877dd, Offset: 0x1c8
// Size: 0x56
function validation() {
    if (isdefined(level.var_375482b5) && level.var_375482b5) {
        return false;
    }
    return !(isdefined(self bgb::get_active()) && self bgb::get_active());
}

// Namespace zm_bgb_alchemical_antithesis/zm_bgb_alchemical_antithesis
// Params 0, eflags: 0x1 linked
// Checksum 0x478e1d4c, Offset: 0x228
// Size: 0x32
function activation() {
    self.ready_for_score_events = 0;
    self bgb::run_timer(60);
    self.ready_for_score_events = 1;
}

// Namespace zm_bgb_alchemical_antithesis/zm_bgb_alchemical_antithesis
// Params 3, eflags: 0x1 linked
// Checksum 0x84c21ac1, Offset: 0x268
// Size: 0x1e6
function add_to_player_score_override(points, str_awarded_by, zm_scr_spawner_location_distance) {
    if (!(isdefined(self.bgb_active) && self.bgb_active)) {
        return points;
    }
    var_f32fbbf5 = int(points / 7.5);
    w_current = self getcurrentweapon();
    if (zm_loadout::is_offhand_weapon(w_current)) {
        return points;
    }
    if (self zm_utility::is_drinking()) {
        return points;
    }
    if (w_current == level.weaponrevivetool) {
        return points;
    }
    if (w_current.iscliponly) {
        return points;
    }
    var_67a898af = self getweaponammostock(w_current);
    var_67a898af += var_f32fbbf5;
    if (self hasperk(#"specialty_extraammo")) {
        var_6ec34556 = w_current.maxammo;
    } else {
        var_6ec34556 = w_current.startammo;
    }
    if (w_current.isdualwield) {
        var_6ec34556 *= 2;
    }
    var_67a898af = math::clamp(var_67a898af, 0, var_6ec34556);
    self setweaponammostock(w_current, var_67a898af);
    self thread function_ec301a0d();
    return 0;
}

// Namespace zm_bgb_alchemical_antithesis/zm_bgb_alchemical_antithesis
// Params 0, eflags: 0x1 linked
// Checksum 0x4596b7d3, Offset: 0x458
// Size: 0x6e
function function_ec301a0d() {
    if (!isdefined(self.var_8f145772)) {
        self.var_8f145772 = 0;
    }
    if (!self.var_8f145772) {
        self.var_8f145772 = 1;
        self playsoundtoplayer(#"zmb_bgb_alchemical_ammoget", self);
        wait 0.5;
        if (isdefined(self)) {
            self.var_8f145772 = 0;
        }
    }
}

