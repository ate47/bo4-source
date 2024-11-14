#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_bgb;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;

#namespace zm_bgb_near_death_experience;

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x2
// Checksum 0xddf68340, Offset: 0x1a8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_near_death_experience", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x12daa382, Offset: 0x1f8
// Size: 0x10c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    clientfield::register("allplayers", "zm_bgb_near_death_experience_3p_fx", 1, 1, "int");
    clientfield::register("toplayer", "zm_bgb_near_death_experience_1p_fx", 1, 1, "int");
    bgb::register(#"zm_bgb_near_death_experience", "time", 600, &enable, &disable, undefined, undefined);
    bgb::register_lost_perk_override(#"zm_bgb_near_death_experience", &lost_perk_override, 1);
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x2bb01dca, Offset: 0x310
// Size: 0xbc
function enable() {
    self endon(#"disconnect", #"bled_out", #"bgb_update");
    if (!isdefined(level.var_67998b2d)) {
        level.var_67998b2d = 0;
    }
    self thread bgb::function_f51e3503(240, &function_db295169, &function_cbaf1f69);
    self thread function_68acd38e();
    self thread revive_override();
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x3d8
// Size: 0x4
function disable() {
    
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x91ee9f85, Offset: 0x3e8
// Size: 0x96
function function_68acd38e() {
    self endon(#"disconnect");
    self clientfield::set("zm_bgb_near_death_experience_3p_fx", 1);
    self waittill(#"bled_out", #"bgb_update");
    self clientfield::set("zm_bgb_near_death_experience_3p_fx", 0);
    self notify(#"zm_bgb_near_death_experience_complete");
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x600332be, Offset: 0x488
// Size: 0x1e0
function revive_override() {
    self.var_718eafbc = 0;
    foreach (e_player in level.players) {
        e_player function_fa0a1b19();
    }
    if (level.var_67998b2d == 0) {
        callback::on_connect(&on_connect);
    }
    level.var_67998b2d++;
    self waittill(#"disconnect", #"bled_out", #"bgb_update");
    level.var_67998b2d--;
    if (level.var_67998b2d == 0) {
        callback::remove_on_connect(&on_connect);
    }
    foreach (e_player in level.players) {
        e_player zm_laststand::deregister_revive_override(e_player.var_8597ff2d[0]);
        arrayremoveindex(e_player.var_8597ff2d, 0);
    }
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x15093e18, Offset: 0x670
// Size: 0x1c
function on_connect() {
    self function_fa0a1b19();
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0xaa5b91a8, Offset: 0x698
// Size: 0xb6
function function_fa0a1b19() {
    if (!isdefined(self.var_8597ff2d)) {
        self.var_8597ff2d = [];
    }
    s_revive_override = self zm_laststand::register_revive_override(&function_d5c9a81);
    if (!isdefined(self.var_8597ff2d)) {
        self.var_8597ff2d = [];
    } else if (!isarray(self.var_8597ff2d)) {
        self.var_8597ff2d = array(self.var_8597ff2d);
    }
    self.var_8597ff2d[self.var_8597ff2d.size] = s_revive_override;
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 1, eflags: 0x1 linked
// Checksum 0x5431db9f, Offset: 0x758
// Size: 0x220
function function_d5c9a81(e_revivee) {
    if (!isdefined(e_revivee.revivetrigger)) {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (self laststand::player_is_in_laststand()) {
        return false;
    }
    if (self.team != e_revivee.team) {
        return false;
    }
    if (isdefined(self.is_zombie) && self.is_zombie) {
        return false;
    }
    if (isdefined(level.can_revive_use_depthinwater_test) && level.can_revive_use_depthinwater_test && e_revivee depthinwater() > 10) {
        return true;
    }
    if (isdefined(level.can_revive) && ![[ level.can_revive ]](e_revivee)) {
        return false;
    }
    if (isdefined(level.var_1461fd14) && ![[ level.var_1461fd14 ]](e_revivee)) {
        return false;
    }
    if (e_revivee zm_player::in_kill_brush() || !e_revivee zm_player::in_enabled_playable_area()) {
        return false;
    }
    if (self bgb::is_enabled(#"zm_bgb_near_death_experience") && isdefined(self.var_9c42f3fe) && array::contains(self.var_9c42f3fe, e_revivee)) {
        return true;
    }
    if (e_revivee bgb::is_enabled(#"zm_bgb_near_death_experience") && isdefined(e_revivee.var_9c42f3fe) && array::contains(e_revivee.var_9c42f3fe, self)) {
        return true;
    }
    return false;
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 3, eflags: 0x1 linked
// Checksum 0x88650878, Offset: 0x980
// Size: 0x66
function lost_perk_override(perk, var_a83ac70f = undefined, var_6c1b825d = undefined) {
    self thread zm_perks::function_b2dfd295(perk, &bgb::function_bd839f2c);
    return false;
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 1, eflags: 0x1 linked
// Checksum 0x1d5f205a, Offset: 0x9f0
// Size: 0x112
function function_db295169(e_player) {
    var_4cd31497 = "zm_bgb_near_death_experience_proximity_end_" + self getentitynumber();
    e_player endon(var_4cd31497, #"disconnect");
    self endon(#"disconnect", #"zm_bgb_near_death_experience_complete");
    while (true) {
        if (!e_player laststand::player_is_in_laststand() && !self laststand::player_is_in_laststand()) {
            util::waittill_any_ents_two(e_player, "player_downed", self, "player_downed");
        }
        self thread function_b7269898(e_player, var_4cd31497);
        var_9dd95907 = "zm_bgb_near_death_experience_1p_fx_stop_" + self getentitynumber();
        e_player waittill(var_9dd95907);
    }
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 2, eflags: 0x1 linked
// Checksum 0x3e7a200b, Offset: 0xb10
// Size: 0x11c
function function_b7269898(e_player, str_notify) {
    var_996880d2 = self function_991be229(e_player, str_notify);
    if (!(isdefined(var_996880d2) && var_996880d2)) {
        return;
    }
    self function_51e0947e();
    e_player function_51e0947e();
    self function_3895d86(e_player, str_notify);
    if (isdefined(self)) {
        self function_68790c5a();
    }
    if (isdefined(e_player)) {
        e_player function_68790c5a();
        e_player notify("zm_bgb_near_death_experience_1p_fx_stop_" + self getentitynumber());
        if (!e_player laststand::player_is_in_laststand()) {
            self thread function_765e5d1c();
        }
    }
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 2, eflags: 0x1 linked
// Checksum 0x38af864, Offset: 0xc38
// Size: 0x9c
function function_991be229(e_player, str_notify) {
    e_player endon(str_notify, #"disconnect");
    self endon(#"disconnect", #"zm_bgb_near_death_experience_complete");
    while (!self function_d5c9a81(e_player) && !e_player function_d5c9a81(self)) {
        wait 0.1;
    }
    return true;
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 2, eflags: 0x1 linked
// Checksum 0x50fa2e27, Offset: 0xce0
// Size: 0x8c
function function_3895d86(e_player, str_notify) {
    e_player endon(str_notify, #"disconnect");
    self endon(#"disconnect", #"zm_bgb_near_death_experience_complete");
    while (self function_d5c9a81(e_player) || e_player function_d5c9a81(self)) {
        wait 0.1;
    }
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 1, eflags: 0x1 linked
// Checksum 0x77e74644, Offset: 0xd78
// Size: 0x3a
function function_cbaf1f69(e_player) {
    str_notify = "zm_bgb_near_death_experience_proximity_end_" + self getentitynumber();
    e_player notify(str_notify);
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x7281e85c, Offset: 0xdc0
// Size: 0x64
function function_51e0947e() {
    if (!isdefined(self.var_7a276c72) || self.var_7a276c72 == 0) {
        self.var_7a276c72 = 1;
        self clientfield::set_to_player("zm_bgb_near_death_experience_1p_fx", 1);
        return;
    }
    self.var_7a276c72++;
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x73d0bc81, Offset: 0xe30
// Size: 0x3c
function function_68790c5a() {
    self.var_7a276c72--;
    if (self.var_7a276c72 == 0) {
        self clientfield::set_to_player("zm_bgb_near_death_experience_1p_fx", 0);
    }
}

// Namespace zm_bgb_near_death_experience/zm_bgb_near_death_experience
// Params 0, eflags: 0x1 linked
// Checksum 0x3b4a2956, Offset: 0xe78
// Size: 0xa4
function function_765e5d1c() {
    n_step = 120 / 600;
    n_original = self clientfield::get_player_uimodel("zmhud.bgb_timer");
    self.var_718eafbc++;
    var_4bfcf47f = 1 - self.var_718eafbc * n_step;
    if (n_original > var_4bfcf47f) {
        self bgb::set_timer(600 * var_4bfcf47f, 600, 1);
    }
}

