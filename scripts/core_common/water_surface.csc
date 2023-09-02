// Atian COD Tools GSC decompiler test
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\filter_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace water_surface;

// Namespace water_surface/water_surface
// Params 0, eflags: 0x2
// Checksum 0x8bba00a, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"water_surface", &__init__, undefined, undefined);
}

// Namespace water_surface/water_surface
// Params 0, eflags: 0x1 linked
// Checksum 0xf84ab761, Offset: 0x100
// Size: 0xac
function __init__() {
    level._effect[#"water_player_jump_out"] = #"player/fx_plyr_water_jump_out_splash_1p";
    level._effect[#"hash_1e7095084eda811c"] = #"hash_123c2521c68b2167";
    if (isdefined(level.disablewatersurfacefx) && level.disablewatersurfacefx == 1) {
        return;
    }
    callback::on_localplayer_spawned(&localplayer_spawned);
}

// Namespace water_surface/water_surface
// Params 1, eflags: 0x1 linked
// Checksum 0x84dd99f5, Offset: 0x1b8
// Size: 0xdc
function localplayer_spawned(localclientnum) {
    if (!self function_21c0fa55()) {
        return;
    }
    if (isdefined(level.disablewatersurfacefx) && level.disablewatersurfacefx == 1) {
        return;
    }
    filter::init_filter_water_sheeting(self);
    filter::init_filter_water_dive(self);
    self thread underwaterwatchbegin();
    self thread underwaterwatchend();
    filter::disable_filter_water_sheeting(self, 1);
    stop_player_fx(self);
}

// Namespace water_surface/water_surface
// Params 0, eflags: 0x1 linked
// Checksum 0xc0e7b56d, Offset: 0x2a0
// Size: 0xf0
function underwaterwatchbegin() {
    self notify(#"underwaterwatchbegin");
    self endon(#"underwaterwatchbegin");
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"underwater_begin");
        if (waitresult.is_teleported) {
            filter::disable_filter_water_sheeting(self, 1);
            stop_player_fx(self);
            filter::disable_filter_water_dive(self, 1);
            stop_player_fx(self);
        } else {
            self thread underwaterbegin();
        }
    }
}

// Namespace water_surface/water_surface
// Params 0, eflags: 0x1 linked
// Checksum 0x3fd92440, Offset: 0x398
// Size: 0xf0
function underwaterwatchend() {
    self notify(#"underwaterwatchend");
    self endon(#"underwaterwatchend");
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"underwater_end");
        if (waitresult.is_teleported) {
            filter::disable_filter_water_sheeting(self, 1);
            stop_player_fx(self);
            filter::disable_filter_water_dive(self, 1);
            stop_player_fx(self);
        } else {
            self thread underwaterend();
        }
    }
}

// Namespace water_surface/water_surface
// Params 0, eflags: 0x1 linked
// Checksum 0xb198176, Offset: 0x490
// Size: 0x12c
function underwaterbegin() {
    self notify(#"water_surface_underwater_begin");
    self endon(#"water_surface_underwater_begin");
    self endon(#"death");
    localclientnum = self getlocalclientnumber();
    filter::disable_filter_water_sheeting(self, 1);
    stop_player_fx(self);
    if (islocalclientdead(localclientnum) == 0) {
        self.var_733dd716 = playfxoncamera(localclientnum, level._effect[#"hash_1e7095084eda811c"], (0, 0, 0), (1, 0, 0), (0, 0, 1));
        if (!isdefined(self.playingpostfxbundle) || self.playingpostfxbundle != "pstfx_watertransition") {
            self thread postfx::playpostfxbundle(#"pstfx_watertransition");
        }
    }
}

// Namespace water_surface/water_surface
// Params 0, eflags: 0x1 linked
// Checksum 0x22a0e157, Offset: 0x5c8
// Size: 0xbc
function underwaterend() {
    self notify(#"water_surface_underwater_end");
    self endon(#"water_surface_underwater_end");
    self endon(#"death");
    localclientnum = self getlocalclientnumber();
    if (islocalclientdead(localclientnum) == 0) {
        if (!isdefined(self.playingpostfxbundle) || self.playingpostfxbundle != "pstfx_water_t_out") {
            self thread postfx::playpostfxbundle(#"pstfx_water_t_out");
        }
    }
}

// Namespace water_surface/water_surface
// Params 0, eflags: 0x0
// Checksum 0x69da8db4, Offset: 0x690
// Size: 0x230
function startwaterdive() {
    filter::enable_filter_water_dive(self, 1);
    filter::set_filter_water_scuba_dive_speed(self, 1, 0.25);
    filter::set_filter_water_wash_color(self, 1, 0.16, 0.5, 0.9);
    filter::set_filter_water_wash_reveal_dir(self, 1, -1);
    i = 0;
    while (i < 0.05) {
        filter::set_filter_water_dive_bubbles(self, 1, i / 0.05);
        wait(0.01);
        i = i + 0.01;
    }
    filter::set_filter_water_dive_bubbles(self, 1, 1);
    filter::set_filter_water_scuba_bubble_attitude(self, 1, -1);
    filter::set_filter_water_scuba_bubbles(self, 1, 1);
    filter::set_filter_water_wash_reveal_dir(self, 1, 1);
    i = 0.2;
    while (i > 0) {
        filter::set_filter_water_dive_bubbles(self, 1, i / 0.2);
        wait(0.01);
        i = i - 0.01;
    }
    filter::set_filter_water_dive_bubbles(self, 1, 0);
    wait(0.1);
    i = 0.2;
    while (i > 0) {
        filter::set_filter_water_scuba_bubbles(self, 1, i / 0.2);
        wait(0.01);
        i = i - 0.01;
    }
}

// Namespace water_surface/water_surface
// Params 0, eflags: 0x0
// Checksum 0x3988569f, Offset: 0x8c8
// Size: 0x20c
function startwatersheeting() {
    self notify(#"startwatersheeting_singleton");
    self endon(#"startwatersheeting_singleton");
    self endon(#"death");
    filter::enable_filter_water_sheeting(self, 1);
    filter::set_filter_water_sheet_reveal(self, 1, 1);
    filter::set_filter_water_sheet_speed(self, 1, 1);
    i = 2;
    while (i > 0) {
        filter::set_filter_water_sheet_reveal(self, 1, i / 2);
        filter::set_filter_water_sheet_speed(self, 1, i / 2);
        rivulet1 = i / 2 - 0.19;
        rivulet2 = i / 2 - 0.13;
        rivulet3 = i / 2 - 0.07;
        filter::set_filter_water_sheet_rivulet_reveal(self, 1, rivulet1, rivulet2, rivulet3);
        wait(0.01);
        i = i - 0.01;
    }
    filter::set_filter_water_sheet_reveal(self, 1, 0);
    filter::set_filter_water_sheet_speed(self, 1, 0);
    filter::set_filter_water_sheet_rivulet_reveal(self, 1, 0, 0, 0);
}

// Namespace water_surface/water_surface
// Params 1, eflags: 0x1 linked
// Checksum 0x8fdcaa2a, Offset: 0xae0
// Size: 0xb6
function stop_player_fx(localclient) {
    if (isdefined(localclient.firstperson_water_fx)) {
        localclientnum = localclient getlocalclientnumber();
        stopfx(localclientnum, localclient.firstperson_water_fx);
        localclient.firstperson_water_fx = undefined;
    }
    if (isdefined(localclient.var_733dd716)) {
        localclientnum = localclient getlocalclientnumber();
        stopfx(localclientnum, localclient.var_733dd716);
        localclient.var_733dd716 = undefined;
    }
}

