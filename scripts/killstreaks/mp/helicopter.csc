// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\killstreaks\helicopter_shared.csc;
#using scripts\core_common\helicopter_sounds_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\duplicaterender_mgr.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace helicopter;

// Namespace helicopter/helicopter
// Params 0, eflags: 0x2
// Checksum 0x624c24b4, Offset: 0x4f8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"helicopter", &__init__, undefined, #"killstreaks");
}

// Namespace helicopter/helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0x24c2a919, Offset: 0x548
// Size: 0x5fc
function __init__() {
    init_shared();
    level.chopper_fx[#"damage"][#"light_smoke"] = "destruct/fx8_atk_chppr_smk_trail";
    level.chopper_fx[#"damage"][#"heavy_smoke"] = "destruct/fx8_atk_chppr_exp_trail";
    level._effect[#"qrdrone_prop"] = #"hash_6cd811fe548313ca";
    level._effect[#"heli_guard_light"][#"friendly"] = #"killstreaks/fx_sc_lights_grn";
    level._effect[#"heli_guard_light"][#"enemy"] = #"killstreaks/fx_sc_lights_red";
    level._effect[#"heli_comlink_light"][#"common"] = #"killstreaks/fx_drone_hunter_lights";
    level._effect[#"heli_gunner_light"][#"friendly"] = #"killstreaks/fx_vtol_lights_grn";
    level._effect[#"heli_gunner_light"][#"enemy"] = #"killstreaks/fx_vtol_lights_red";
    level._effect[#"heli_gunner"][#"vtol_fx"] = #"killstreaks/fx_vtol_thruster";
    level._effect[#"heli_gunner"][#"vtol_fx_ft"] = #"killstreaks/fx_vtol_thruster";
    clientfield::register("vehicle", "heli_warn_targeted", 1, 1, "int", &warnmissilelocking, 0, 0);
    clientfield::register("vehicle", "heli_warn_locked", 1, 1, "int", &warnmissilelocked, 0, 0);
    clientfield::register("vehicle", "heli_warn_fired", 1, 1, "int", &warnmissilefired, 0, 0);
    clientfield::register("vehicle", "supplydrop_care_package_state", 1, 1, "int", &supplydrop_care_package_state, 0, 0);
    clientfield::register("vehicle", "supplydrop_ai_tank_state", 1, 1, "int", &supplydrop_ai_tank_state, 0, 0);
    clientfield::register("vehicle", "heli_comlink_bootup_anim", 1, 1, "int", &heli_comlink_bootup_anim, 0, 0);
    duplicate_render::set_dr_filter_framebuffer("active_camo_scorestreak", 90, "active_camo_on", "", 0, "mc/hud_outline_predator_camo_active_enemy_scorestreak", 0);
    duplicate_render::set_dr_filter_framebuffer("active_camo_flicker_scorestreak", 80, "active_camo_flicker", "", 0, "mc/hud_outline_predator_camo_disruption_enemy_scorestreak", 0);
    duplicate_render::set_dr_filter_framebuffer_duplicate("active_camo_reveal_scorestreak_dr", 90, "active_camo_reveal", "hide_model", 1, "mc/hud_outline_predator_camo_active_enemy_scorestreak", 0);
    duplicate_render::set_dr_filter_framebuffer("active_camo_reveal_scorestreak", 80, "active_camo_reveal,hide_model", "", 0, "mc/hud_outline_predator_scorestreak", 0);
    clientfield::register("vehicle", "active_camo", 1, 3, "int", &active_camo_changed, 0, 0);
    clientfield::register("scriptmover", "supplydrop_thrusters_state", 1, 1, "int", &setsupplydropthrustersstate, 0, 0);
    clientfield::register("scriptmover", "aitank_thrusters_state", 1, 1, "int", &setaitankhrustersstate, 0, 0);
    callback::on_spawned(&on_player_spawned);
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0xd82ad147, Offset: 0xb50
// Size: 0xa6
function on_player_spawned(localclientnum) {
    player = self;
    player waittill(#"death");
    player.markerfx = undefined;
    if (isdefined(player.markerobj)) {
        player.markerobj delete();
    }
    if (isdefined(player.markerfxhandle)) {
        killfx(localclientnum, player.markerfxhandle);
        player.markerfxhandle = undefined;
    }
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0xb348d290, Offset: 0xc00
// Size: 0x15c
function active_camo_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        self thread heli_comlink_lights_on_after_wait(localclientnum, 0.7);
    } else {
        self heli_comlink_lights_off(localclientnum);
    }
    flags_changed = self duplicate_render::set_dr_flag("active_camo_flicker", newval == 2);
    flags_changed = self duplicate_render::set_dr_flag("active_camo_on", 0) || flags_changed;
    flags_changed = self duplicate_render::set_dr_flag("active_camo_reveal", 1) || flags_changed;
    if (flags_changed) {
        self duplicate_render::update_dr_filters(localclientnum);
    }
    self notify(#"endtest");
    self thread doreveal(localclientnum, newval != 0);
}

// Namespace helicopter/helicopter
// Params 2, eflags: 0x1 linked
// Checksum 0x30f430a4, Offset: 0xd68
// Size: 0x2b4
function doreveal(local_client_num, direction) {
    self notify(#"endtest");
    self endon(#"endtest");
    self endon(#"death");
    if (direction) {
        self duplicate_render::update_dr_flag(local_client_num, "hide_model", 0);
        startval = 0;
        endval = 1;
    } else {
        self duplicate_render::update_dr_flag(local_client_num, "hide_model", 1);
        startval = 1;
        endval = 0;
    }
    priorvalue = startval;
    while (startval >= 0 && startval <= 1) {
        self mapshaderconstant(local_client_num, 0, "scriptVector0", startval, 0, 0, 0);
        if (direction) {
            startval = startval + 0.032;
            if (priorvalue < 0.5 && startval >= 0.5) {
                self duplicate_render::set_dr_flag("hide_model", 1);
                self duplicate_render::change_dr_flags(local_client_num);
            }
        } else {
            startval = startval - 0.032;
            if (priorvalue > 0.5 && startval <= 0.5) {
                self duplicate_render::set_dr_flag("hide_model", 0);
                self duplicate_render::change_dr_flags(local_client_num);
            }
        }
        priorvalue = startval;
        waitframe(1);
    }
    self mapshaderconstant(local_client_num, 0, "scriptVector0", endval, 0, 0, 0);
    flags_changed = self duplicate_render::set_dr_flag("active_camo_reveal", 0);
    flags_changed = self duplicate_render::set_dr_flag("active_camo_on", direction) || flags_changed;
    if (flags_changed) {
        self duplicate_render::update_dr_filters(local_client_num);
    }
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0xfb02ba5d, Offset: 0x1028
// Size: 0x3c
function heli_comlink_bootup_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0x3ff29442, Offset: 0x1070
// Size: 0x3c
function supplydrop_care_package_state(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0x4692ebf1, Offset: 0x10b8
// Size: 0x3c
function supplydrop_ai_tank_state(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0xe6c563e, Offset: 0x1100
// Size: 0x7c
function warnmissilelocking(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval && !self function_4add50a7()) {
        return;
    }
    helicopter_sounds::play_targeted_sound(newval);
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0xba146189, Offset: 0x1188
// Size: 0x7c
function warnmissilelocked(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval && !self function_4add50a7()) {
        return;
    }
    helicopter_sounds::play_locked_sound(newval);
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0x11423a0b, Offset: 0x1210
// Size: 0x7c
function warnmissilefired(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval && !self function_4add50a7()) {
        return;
    }
    helicopter_sounds::play_fired_sound(newval);
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x12675920, Offset: 0x1298
// Size: 0x156
function heli_deletefx(localclientnum) {
    if (isdefined(self.exhaustleftfxhandle)) {
        deletefx(localclientnum, self.exhaustleftfxhandle);
        self.exhaustleftfxhandle = undefined;
    }
    if (isdefined(self.exhaustrightfxhandlee)) {
        deletefx(localclientnum, self.exhaustrightfxhandle);
        self.exhaustrightfxhandle = undefined;
    }
    if (isdefined(self.lightfxid)) {
        deletefx(localclientnum, self.lightfxid);
        self.lightfxid = undefined;
    }
    if (isdefined(self.propfxid)) {
        deletefx(localclientnum, self.propfxid);
        self.propfxid = undefined;
    }
    if (isdefined(self.vtolleftfxid)) {
        deletefx(localclientnum, self.vtolleftfxid);
        self.vtolleftfxid = undefined;
    }
    if (isdefined(self.vtolrightfxid)) {
        deletefx(localclientnum, self.vtolrightfxid);
        self.vtolrightfxid = undefined;
    }
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x16234b3b, Offset: 0x13f8
// Size: 0x36a
function startfx(localclientnum) {
    self endon(#"death");
    if (isdefined(self.vehicletype)) {
        if (self.vehicletype == #"remote_mortar_vehicle_mp") {
            return;
        }
        if (self.vehicletype == #"vehicle_straferun_mp") {
            return;
        }
    }
    if (isdefined(self.exhaustfxname) && self.exhaustfxname != "") {
        self.exhaustfx = self.exhaustfxname;
    }
    if (isdefined(self.exhaustfx)) {
        self.exhaustleftfxhandle = util::playfxontag(localclientnum, self.exhaustfx, self, "tag_engine_left");
        if (!(isdefined(self.oneexhaust) && self.oneexhaust)) {
            self.exhaustrightfxhandle = util::playfxontag(localclientnum, self.exhaustfx, self, "tag_engine_right");
        }
    } else {
        /#
            println("<unknown string>");
        #/
    }
    if (isdefined(self.vehicletype)) {
        light_fx = undefined;
        prop_fx = undefined;
        switch (self.vehicletype) {
        case #"heli_ai_mp":
            light_fx = "heli_comlink_light";
            break;
        case #"heli_player_gunner_mp":
            self.vtolleftfxid = util::playfxontag(localclientnum, level._effect[#"heli_gunner"][#"vtol_fx"], self, "tag_engine_left");
            self.vtolrightfxid = util::playfxontag(localclientnum, level._effect[#"heli_gunner"][#"vtol_fx_ft"], self, "tag_engine_right");
            light_fx = "heli_gunner_light";
            break;
        case #"heli_guard_mp":
            light_fx = "heli_guard_light";
            break;
        case #"qrdrone_mp":
            prop_fx = "qrdrone_prop";
            break;
        }
        if (isdefined(light_fx)) {
            self.lightfxid = self fx::function_3539a829(localclientnum, level._effect[light_fx][#"friendly"], level._effect[light_fx][#"enemy"], "tag_origin");
        }
        if (isdefined(prop_fx) && !self function_4add50a7()) {
            self.propfxid = util::playfxontag(localclientnum, level._effect[prop_fx], self, "tag_origin");
        }
    }
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x0
// Checksum 0x50e9e947, Offset: 0x1770
// Size: 0xe2
function startfx_loop(localclientnum) {
    self endon(#"death");
    self thread helicopter_sounds::aircraft_dustkick(localclientnum);
    startfx(localclientnum);
    servertime = getservertime(0);
    lastservertime = servertime;
    while (isdefined(self)) {
        if (servertime < lastservertime) {
            heli_deletefx(localclientnum);
            startfx(localclientnum);
        }
        waitframe(1);
        lastservertime = servertime;
        servertime = getservertime(0);
    }
}

// Namespace helicopter/helicopter
// Params 3, eflags: 0x0
// Checksum 0xe7e26295, Offset: 0x1860
// Size: 0x4a
function trail_fx(localclientnum, trail_fx, trail_tag) {
    id = util::playfxontag(localclientnum, trail_fx, self, trail_tag);
    return id;
}

// Namespace helicopter/helicopter
// Params 2, eflags: 0x1 linked
// Checksum 0xebd412ab, Offset: 0x18b8
// Size: 0x54
function heli_comlink_lights_on_after_wait(localclientnum, wait_time) {
    self endon(#"death");
    self endon(#"heli_comlink_lights_off");
    wait(wait_time);
    self heli_comlink_lights_on(localclientnum);
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x7e6b55a8, Offset: 0x1918
// Size: 0x1ee
function heli_comlink_lights_on(localclientnum) {
    if (!isdefined(self.light_fx_handles_heli_comlink)) {
        self.light_fx_handles_heli_comlink = [];
    }
    self.light_fx_handles_heli_comlink[0] = util::playfxontag(localclientnum, level._effect[#"heli_comlink_light"][#"common"], self, "tag_fx_light_left");
    self.light_fx_handles_heli_comlink[1] = util::playfxontag(localclientnum, level._effect[#"heli_comlink_light"][#"common"], self, "tag_fx_light_right");
    self.light_fx_handles_heli_comlink[2] = util::playfxontag(localclientnum, level._effect[#"heli_comlink_light"][#"common"], self, "tag_fx_tail");
    self.light_fx_handles_heli_comlink[3] = util::playfxontag(localclientnum, level._effect[#"heli_comlink_light"][#"common"], self, "tag_fx_scanner");
    if (isdefined(self.team)) {
        for (i = 0; i < self.light_fx_handles_heli_comlink.size; i++) {
            setfxteam(localclientnum, self.light_fx_handles_heli_comlink[i], self.owner.team);
        }
    }
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x53cdf064, Offset: 0x1b10
// Size: 0x96
function heli_comlink_lights_off(localclientnum) {
    self notify(#"heli_comlink_lights_off");
    if (isdefined(self.light_fx_handles_heli_comlink)) {
        for (i = 0; i < self.light_fx_handles_heli_comlink.size; i++) {
            if (isdefined(self.light_fx_handles_heli_comlink[i])) {
                deletefx(localclientnum, self.light_fx_handles_heli_comlink[i]);
            }
        }
        self.light_fx_handles_heli_comlink = undefined;
    }
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x39d03028, Offset: 0x1bb0
// Size: 0x12c
function updatemarkerthread(localclientnum) {
    self endon(#"death");
    player = self;
    killstreakcorebundle = struct::get_script_bundle("killstreak", "killstreak_core");
    while (isdefined(player.markerobj)) {
        viewangles = getlocalclientangles(localclientnum);
        forwardvector = vectorscale(anglestoforward(viewangles), killstreakcorebundle.ksmaxairdroptargetrange);
        results = bullettrace(player geteye(), player geteye() + forwardvector, 0, player);
        player.markerobj.origin = results[#"position"];
        waitframe(1);
    }
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x42f34afc, Offset: 0x1ce8
// Size: 0x10a
function stopcrateeffects(localclientnum) {
    crate = self;
    if (isdefined(crate.thrusterfxhandle0)) {
        stopfx(localclientnum, crate.thrusterfxhandle0);
    }
    if (isdefined(crate.thrusterfxhandle1)) {
        stopfx(localclientnum, crate.thrusterfxhandle1);
    }
    if (isdefined(crate.thrusterfxhandle2)) {
        stopfx(localclientnum, crate.thrusterfxhandle2);
    }
    if (isdefined(crate.thrusterfxhandle3)) {
        stopfx(localclientnum, crate.thrusterfxhandle3);
    }
    crate.thrusterfxhandle0 = undefined;
    crate.thrusterfxhandle1 = undefined;
    crate.thrusterfxhandle2 = undefined;
    crate.thrusterfxhandle3 = undefined;
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x1be44996, Offset: 0x1e00
// Size: 0x74
function cleanupthrustersthread(localclientnum) {
    crate = self;
    crate notify(#"cleanupthrustersthread_singleton");
    crate endon(#"cleanupthrustersthread_singleton");
    crate waittill(#"death");
    crate stopcrateeffects(localclientnum);
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0x10ecb709, Offset: 0x1e80
// Size: 0x1d4
function setsupplydropthrustersstate(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    crate = self;
    params = struct::get_script_bundle("killstreak", "killstreak_supply_drop");
    if (newval != oldval && isdefined(params.ksthrusterfx)) {
        if (newval == 1) {
            crate stopcrateeffects(localclientnum);
            crate.thrusterfxhandle0 = util::playfxontag(localclientnum, params.ksthrusterfx, crate, "tag_thruster_fx_01");
            crate.thrusterfxhandle1 = util::playfxontag(localclientnum, params.ksthrusterfx, crate, "tag_thruster_fx_02");
            crate.thrusterfxhandle2 = util::playfxontag(localclientnum, params.ksthrusterfx, crate, "tag_thruster_fx_03");
            crate.thrusterfxhandle3 = util::playfxontag(localclientnum, params.ksthrusterfx, crate, "tag_thruster_fx_04");
            crate thread cleanupthrustersthread(localclientnum);
            return;
        }
        crate stopcrateeffects(localclientnum);
    }
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0x5dd90b47, Offset: 0x2060
// Size: 0x1d4
function setaitankhrustersstate(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    crate = self;
    params = struct::get_script_bundle("killstreak", "killstreak_tank_robot");
    if (newval != oldval && isdefined(params.ksthrusterfx)) {
        if (newval == 1) {
            crate stopcrateeffects(localclientnum);
            crate.thrusterfxhandle0 = util::playfxontag(localclientnum, params.ksthrusterfx, crate, "tag_thruster_fx_01");
            crate.thrusterfxhandle1 = util::playfxontag(localclientnum, params.ksthrusterfx, crate, "tag_thruster_fx_02");
            crate.thrusterfxhandle2 = util::playfxontag(localclientnum, params.ksthrusterfx, crate, "tag_thruster_fx_03");
            crate.thrusterfxhandle3 = util::playfxontag(localclientnum, params.ksthrusterfx, crate, "tag_thruster_fx_04");
            crate thread cleanupthrustersthread(localclientnum);
            return;
        }
        crate stopcrateeffects(localclientnum);
    }
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x0
// Checksum 0x934b0d29, Offset: 0x2240
// Size: 0x294
function marker_state_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    player = self;
    killstreakcorebundle = struct::get_script_bundle("killstreak", "killstreak_core");
    if (newval == 1) {
        player.markerfx = killstreakcorebundle.fxvalidlocation;
    } else if (newval == 2) {
        player.markerfx = killstreakcorebundle.fxinvalidlocation;
    } else {
        player.markerfx = undefined;
    }
    if (isdefined(player.markerobj) && !player.markerobj hasdobj(localclientnum)) {
        return;
    }
    if (isdefined(player.markerfxhandle)) {
        killfx(localclientnum, player.markerfxhandle);
        player.markerfxhandle = undefined;
    }
    if (isdefined(player.markerfx)) {
        if (!isdefined(player.markerobj)) {
            player.markerobj = spawn(localclientnum, (0, 0, 0), "script_model");
            player.markerobj.angles = vectorscale((1, 0, 0), 270);
            player.markerobj setmodel(#"wpn_t7_none_world");
            player.markerobj util::waittill_dobj(localclientnum);
            player thread updatemarkerthread(localclientnum);
        }
        player.markerfxhandle = util::playfxontag(localclientnum, player.markerfx, player.markerobj, "tag_origin");
        return;
    }
    if (isdefined(player.markerobj)) {
        player.markerobj delete();
    }
}

