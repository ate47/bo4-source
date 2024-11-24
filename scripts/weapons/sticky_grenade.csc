#using scripts\core_common\callbacks_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace sticky_grenade;

// Namespace sticky_grenade/sticky_grenade
// Params 0, eflags: 0x2
// Checksum 0xc9956d9, Offset: 0xf0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"sticky_grenade", &__init__, undefined, undefined);
}

// Namespace sticky_grenade/sticky_grenade
// Params 0, eflags: 0x1 linked
// Checksum 0xcd7c1328, Offset: 0x138
// Size: 0x304
function __init__() {
    level._effect[#"grenade_light"] = #"weapon/fx8_equip_light_os";
    level._effect[#"hash_61fd92df093ebdb4"] = #"hash_44b0fea08babccac";
    callback::add_weapon_type(#"sticky_grenade", &spawned);
    callback::add_weapon_type(#"eq_sticky_grenade", &spawned);
    callback::add_weapon_type(#"hash_4b92b1a2aa3037f5", &spawned);
    callback::add_weapon_type(#"eq_cluster_semtex_grenade", &spawned);
    callback::add_weapon_type(#"hash_66401df7cd6bf292", &function_6054cc1e);
    callback::add_weapon_type(#"sig_bow_explosive", &function_117f61b8);
    callback::add_weapon_type(#"hash_494e1edad9bd44fd", &function_117f61b8);
    callback::add_weapon_type(#"hash_494e1ddad9bd434a", &function_117f61b8);
    callback::add_weapon_type(#"hash_494e18dad9bd3acb", &function_117f61b8);
    callback::add_weapon_type(#"sig_bow_quickshot", &spawned_arrow);
    callback::add_weapon_type(#"sig_bow_quickshot2", &spawned_arrow);
    callback::add_weapon_type(#"sig_bow_quickshot3", &spawned_arrow);
    callback::add_weapon_type(#"sig_bow_quickshot4", &spawned_arrow);
    callback::add_weapon_type(#"sig_bow_quickshot5", &spawned_arrow);
}

// Namespace sticky_grenade/sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0xf25b1f6c, Offset: 0x448
// Size: 0x44
function spawned(localclientnum) {
    if (self isgrenadedud()) {
        return;
    }
    self thread fx_think(localclientnum, 1);
}

// Namespace sticky_grenade/sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x450047b4, Offset: 0x498
// Size: 0x44
function spawned_arrow(localclientnum) {
    if (self isgrenadedud()) {
        return;
    }
    self thread fx_think(localclientnum, 2);
}

// Namespace sticky_grenade/sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x6151b1fc, Offset: 0x4e8
// Size: 0x3c
function function_6054cc1e(localclientnum) {
    if (self isgrenadedud()) {
        return;
    }
    self thread function_c879d0fd(localclientnum);
}

// Namespace sticky_grenade/sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x15b5dfbf, Offset: 0x530
// Size: 0x74
function function_117f61b8(localclientnum) {
    if (self isgrenadedud()) {
        return;
    }
    handle = self playsound(localclientnum, #"wpn_semtex_countdown");
    self thread stop_sound_on_ent_shutdown(handle);
}

// Namespace sticky_grenade/sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x6072fb9e, Offset: 0x5b0
// Size: 0x34
function stop_sound_on_ent_shutdown(handle) {
    self waittill(#"death");
    stopsound(handle);
}

// Namespace sticky_grenade/sticky_grenade
// Params 2, eflags: 0x1 linked
// Checksum 0xe7e97f2b, Offset: 0x5f0
// Size: 0x23a
function fx_think(localclientnum, var_1e60ee48) {
    self notify(#"light_disable");
    self endon(#"light_disable");
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    handle = self playsound(localclientnum, #"wpn_semtex_countdown");
    self thread stop_sound_on_ent_shutdown(handle);
    for (interval = 0.3; isdefined(self); interval = math::clamp(interval / 1.2, 0.08, 0.3)) {
        self stop_light_fx(localclientnum);
        localplayer = function_5c10bd79(localclientnum);
        if (!isdefined(localplayer)) {
            continue;
        }
        if (!localplayer isentitylinkedtotag(self, "j_head") && !localplayer isentitylinkedtotag(self, "j_elbow_le") && !localplayer isentitylinkedtotag(self, "j_spineupper")) {
            self start_light_fx(localclientnum, level._effect[#"grenade_light"]);
        }
        self fullscreen_fx(localclientnum, var_1e60ee48);
        util::server_wait(localclientnum, interval, 0.01, "player_switch");
        self util::waittill_dobj(localclientnum);
    }
}

// Namespace sticky_grenade/sticky_grenade
// Params 2, eflags: 0x1 linked
// Checksum 0x1f7a678c, Offset: 0x838
// Size: 0x5a
function start_light_fx(localclientnum, fx) {
    self stop_light_fx(localclientnum);
    self.fx = util::playfxontag(localclientnum, fx, self, "tag_fx");
}

// Namespace sticky_grenade/sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x9afc5631, Offset: 0x8a0
// Size: 0x4e
function stop_light_fx(localclientnum) {
    if (isdefined(self.fx) && self.fx != 0) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
}

// Namespace sticky_grenade/sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x867451cb, Offset: 0x8f8
// Size: 0x122
function function_c879d0fd(localclientnum) {
    self notify(#"light_disable");
    self endon(#"light_disable");
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    for (interval = 0.3; ; interval = math::clamp(interval / 1.2, 0.08, 0.3)) {
        self stop_light_fx(localclientnum);
        self start_light_fx(localclientnum, level._effect[#"hash_61fd92df093ebdb4"]);
        util::server_wait(localclientnum, interval, 0.01, "player_switch");
        self util::waittill_dobj(localclientnum);
    }
}

// Namespace sticky_grenade/sticky_grenade
// Params 2, eflags: 0x1 linked
// Checksum 0x8c15e52b, Offset: 0xa28
// Size: 0xe0
function sticky_indicator(localclientnum, indicator) {
    controllermodel = getuimodelforcontroller(localclientnum);
    stickyimagemodel = createuimodel(controllermodel, "hudItems.stuckImageIndex");
    setuimodelvalue(stickyimagemodel, indicator);
    player = function_5c10bd79(localclientnum);
    while (isdefined(self)) {
        waitframe(1);
    }
    setuimodelvalue(stickyimagemodel, 0);
    if (isdefined(player)) {
        player notify(#"sticky_shutdown");
    }
}

// Namespace sticky_grenade/sticky_grenade
// Params 2, eflags: 0x1 linked
// Checksum 0xbcb6b22b, Offset: 0xb10
// Size: 0x104
function fullscreen_fx(localclientnum, indicator) {
    if (function_1cbf351b(localclientnum)) {
        return;
    }
    if (util::is_player_view_linked_to_entity(localclientnum)) {
        return;
    }
    if (self function_4e0ca360()) {
        return;
    }
    parent = self getparententity();
    if (isdefined(parent) && parent function_21c0fa55()) {
        parent playrumbleonentity(localclientnum, "buzz_high");
        if (getdvarint(#"ui_hud_hardcore", 0) == 0) {
            self thread sticky_indicator(localclientnum, indicator);
        }
    }
}

