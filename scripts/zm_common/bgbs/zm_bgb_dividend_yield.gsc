#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_bgb;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_bgb_dividend_yield;

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x2
// Checksum 0xe7fcaf6e, Offset: 0x118
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_dividend_yield", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x1 linked
// Checksum 0xf0d592a0, Offset: 0x168
// Size: 0x12c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    clientfield::register("allplayers", "" + #"hash_11a25fb3db96fc2d", 1, 1, "int");
    clientfield::register("toplayer", "" + #"hash_31b61c511ced94d7", 1, 1, "int");
    bgb::register(#"zm_bgb_dividend_yield", "time", 300, &enable, &disable, undefined, undefined);
    bgb::function_c2721e81(#"zm_bgb_dividend_yield", &add_to_player_score_override, 1);
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x1 linked
// Checksum 0x77b94f1, Offset: 0x2a0
// Size: 0x8c
function enable() {
    self endon(#"disconnect", #"bled_out", #"bgb_update");
    self thread bgb::function_f51e3503(720, &function_db295169, &function_cbaf1f69);
    self thread function_5cf91552();
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x338
// Size: 0x4
function disable() {
    
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x1 linked
// Checksum 0xac899938, Offset: 0x348
// Size: 0xa6
function function_5cf91552() {
    self endon(#"disconnect");
    self clientfield::set("" + #"hash_11a25fb3db96fc2d", 1);
    self util::waittill_either("bled_out", "bgb_update");
    self clientfield::set("" + #"hash_11a25fb3db96fc2d", 0);
    self notify(#"dividend_yield_complete");
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 3, eflags: 0x1 linked
// Checksum 0xb80b9d48, Offset: 0x3f8
// Size: 0x218
function add_to_player_score_override(n_points, str_awarded_by, zm_scr_spawner_location_distance) {
    if (str_awarded_by == #"zm_bgb_dividend_yield" || n_points == 0) {
        return n_points;
    }
    switch (str_awarded_by) {
    case #"reviver":
    case #"bonus_points_powerup_shared":
    case #"magicbox_bear":
        return n_points;
    default:
        break;
    }
    if (zm_scr_spawner_location_distance) {
        var_bed6c5f = int(n_points / 20);
        var_15fc340f = var_bed6c5f * 10;
        if (var_15fc340f == 0) {
            return n_points;
        }
        if (!isdefined(self.var_9c42f3fe)) {
            self.var_9c42f3fe = [];
        } else if (!isarray(self.var_9c42f3fe)) {
            self.var_9c42f3fe = array(self.var_9c42f3fe);
        }
        foreach (e_player in self.var_9c42f3fe) {
            if (isdefined(e_player)) {
                e_player thread zm_score::add_to_player_score(var_15fc340f, 1, #"zm_bgb_dividend_yield");
            }
        }
        self thread zm_score::add_to_player_score(var_15fc340f, 1, #"zm_bgb_dividend_yield");
    }
    return n_points;
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 1, eflags: 0x1 linked
// Checksum 0xeffbab32, Offset: 0x618
// Size: 0xdc
function function_db295169(e_player) {
    self function_51e0947e();
    e_player function_51e0947e();
    str_notify = "dividend_yield_fx_stop_" + self getentitynumber();
    level util::waittill_any_ents(e_player, "disconnect", e_player, str_notify, self, "disconnect", self, "dividend_yield_complete");
    if (isdefined(self)) {
        self function_68790c5a();
    }
    if (isdefined(e_player)) {
        e_player function_68790c5a();
    }
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 1, eflags: 0x1 linked
// Checksum 0x960e4deb, Offset: 0x700
// Size: 0x3a
function function_cbaf1f69(e_player) {
    str_notify = "dividend_yield_fx_stop_" + self getentitynumber();
    e_player notify(str_notify);
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x1 linked
// Checksum 0x244b3d99, Offset: 0x748
// Size: 0x6c
function function_51e0947e() {
    if (!isdefined(self.var_836ebde0) || self.var_836ebde0 == 0) {
        self.var_836ebde0 = 1;
        self clientfield::set_to_player("" + #"hash_31b61c511ced94d7", 1);
        return;
    }
    self.var_836ebde0++;
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x1 linked
// Checksum 0xf9786af0, Offset: 0x7c0
// Size: 0x4c
function function_68790c5a() {
    self.var_836ebde0--;
    if (self.var_836ebde0 == 0) {
        self clientfield::set_to_player("" + #"hash_31b61c511ced94d7", 0);
    }
}

