#using scripts\killstreaks\killstreak_detect.csc;
#using script_5520b91a8aa516ab;
#using script_7bee869df82e0445;
#using scripts\core_common\shoutcaster.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace remotemissile;

// Namespace remotemissile/remotemissile_shared
// Params 0, eflags: 0x0
// Checksum 0x10c2012f, Offset: 0x2b8
// Size: 0x33c
function init_shared() {
    if (!(isdefined(level.var_e3049e92) && level.var_e3049e92) && !isdefined(level.var_2a02828c)) {
        level.var_2a02828c = {};
        killstreak_detect::init_shared();
        remote_missile_targets::register("remote_missile_targets");
        for (ti = 0; ti < 6; ti++) {
            level.remote_missile_targets[ti] = spawnstruct();
            remote_missile_target_lockon::register("remote_missile_target_lockon" + ti, &function_1de73512, &function_fd0c759c);
        }
        clientfield::register("missile", "remote_missile_brakes", 1, 1, "int", &function_3e76ad59, 0, 0);
        clientfield::register("missile", "remote_missile_bomblet_fired", 1, 1, "int", &bomblets_deployed, 0, 0);
        clientfield::register("missile", "remote_missile_fired", 1, 2, "int", &missile_fired, 0, 0);
        clientfield::register("missile", "remote_missile_phase2", 1, 1, "int", undefined, 0, 0);
        clientfield::register("toplayer", "remote_missile_screenfx", 1, 1, "int", &function_c65b18ed, 0, 1);
        clientfield::register("clientuimodel", "hudItems.remoteMissilePhase2", 1, 1, "int", undefined, 0, 0);
        clientfield::register("scriptmover", "hellstorm_camera", 1, 1, "int", &function_6d66e75a, 0, 0);
        clientfield::register("scriptmover", "hellstorm_deploy", 1, 1, "int", &hellstorm_deploy, 0, 0);
        callback::function_17381fe(&function_17381fe);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 1, eflags: 0x0
// Checksum 0x104df551, Offset: 0x600
// Size: 0x2c
function function_17381fe(localclientnum) {
    if (isdefined(self)) {
        function_d260edc9(localclientnum);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 7, eflags: 0x0
// Checksum 0xf8e6d9da, Offset: 0x638
// Size: 0x68
function function_fd0c759c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.var_e656f88a)) {
        [[ level.var_e656f88a ]](localclientnum, newval, fieldname);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 7, eflags: 0x0
// Checksum 0xe944bc50, Offset: 0x6a8
// Size: 0x68
function function_1de73512(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.var_70a07f6f)) {
        [[ level.var_70a07f6f ]](localclientnum, newval, fieldname);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 7, eflags: 0x0
// Checksum 0x36513122, Offset: 0x718
// Size: 0xc0
function hellstorm_deploy(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (newval) {
        self useanimtree("generic");
        self setanim(#"hash_4b6a7686ae8c1f16", 1);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 7, eflags: 0x0
// Checksum 0xf6b45d49, Offset: 0x7e0
// Size: 0x54
function function_6d66e75a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self thread function_90b75549(localclientnum);
}

// Namespace remotemissile/remotemissile_shared
// Params 1, eflags: 0x0
// Checksum 0xda58221f, Offset: 0x840
// Size: 0xde
function function_90b75549(localclientnum) {
    self notify(#"hash_3f127346d8e9769f");
    self endon(#"hash_3f127346d8e9769f", #"death");
    player = function_5c10bd79(localclientnum);
    self util::waittill_dobj(localclientnum);
    while (isdefined(player) && isdefined(self) && self.owner === player) {
        player camerasetposition(self.origin);
        player camerasetlookat(self.angles);
        waitframe(1);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 7, eflags: 0x0
// Checksum 0x637c0749, Offset: 0x928
// Size: 0x84
function function_3e76ad59(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self function_d309e55a("tag_brake_control_animate", 1);
        return;
    }
    self function_d309e55a("tag_brake_control_animate", 0);
}

// Namespace remotemissile/remotemissile_shared
// Params 7, eflags: 0x0
// Checksum 0x83f23120, Offset: 0x9b8
// Size: 0x2e4
function missile_fired(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self function_d309e55a("tag_fin_control_animate", 1);
        player = function_5c10bd79(localclientnum);
        owner = self getowner(localclientnum);
        clientobjid = util::getnextobjid(localclientnum);
        objective_onentity(localclientnum, clientobjid, self, 1, 0, 1);
        self.hellfireobjid = clientobjid;
        self thread destruction_watcher(localclientnum, clientobjid);
        objective_setstate(localclientnum, clientobjid, "active");
        if (player hasperk(localclientnum, #"specialty_showscorestreakicons")) {
            objective_seticon(localclientnum, clientobjid, "remotemissile_targetF");
            objective_seticonsize(localclientnum, clientobjid, 50);
        }
        self thread hud_update(localclientnum);
        if (player === owner) {
            player.clouds_fx = util::playfxontag(localclientnum, #"hash_50b25e352ba908d0", self, "tag_origin");
        }
    } else if (newval == 2) {
        if (isdefined(self.hellfireobjid)) {
            self notify(#"hellfire_detonated");
            objective_delete(localclientnum, self.hellfireobjid);
            util::releaseobjid(localclientnum, self.hellfireobjid);
        }
    } else {
        self notify(#"cleanup_objectives");
    }
    ammo_ui_data_model = getuimodel(getuimodelforcontroller(localclientnum), "vehicle.rocketAmmo");
    if (isdefined(ammo_ui_data_model)) {
        setuimodelvalue(ammo_ui_data_model, 2);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 7, eflags: 0x0
// Checksum 0xf77a4097, Offset: 0xca8
// Size: 0x1dc
function bomblets_deployed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (bnewent && oldval == newval) {
        return;
    }
    if (newval == 1) {
        player = function_5c10bd79(localclientnum);
        owner = self getowner(localclientnum);
        clientobjid = util::getnextobjid(localclientnum);
        objective_onentity(localclientnum, clientobjid, self, 1, 0, 1);
        self thread destruction_watcher(localclientnum, clientobjid);
        objective_setstate(localclientnum, clientobjid, "active");
        if (player hasperk(localclientnum, #"specialty_showscorestreakicons")) {
            objective_seticon(localclientnum, clientobjid, "remotemissile_target");
        }
    } else {
        self notify(#"cleanup_objectives");
    }
    ammo_ui_data_model = getuimodel(getuimodelforcontroller(localclientnum), "vehicle.rocketAmmo");
    if (isdefined(ammo_ui_data_model)) {
        setuimodelvalue(ammo_ui_data_model, 0);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 2, eflags: 0x0
// Checksum 0x1ec1fc58, Offset: 0xe90
// Size: 0x7c
function destruction_watcher(localclientnum, clientobjid) {
    self waittill(#"death", #"cleanup_objectives");
    wait(0.1);
    if (isdefined(clientobjid)) {
        objective_delete(localclientnum, clientobjid);
        util::releaseobjid(localclientnum, clientobjid);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 1, eflags: 0x0
// Checksum 0x50527ffb, Offset: 0xf18
// Size: 0x2a6
function hud_update(localclientnum) {
    self endon(#"death");
    self notify(#"remote_missile_singeton");
    self endon(#"remote_missile_singeton");
    missile = self;
    altitude_ui_data_model = getuimodel(getuimodelforcontroller(localclientnum), "vehicle.altitude");
    speed_ui_data_model = getuimodel(getuimodelforcontroller(localclientnum), "vehicle.speed");
    var_2c36f843 = getuimodel(getuimodelforcontroller(localclientnum), "vehicle.remainingTime");
    if (!isdefined(altitude_ui_data_model) || !isdefined(speed_ui_data_model) || !isdefined(var_2c36f843)) {
        return;
    }
    birthtime = gettime();
    lifetime = (isdefined(missile.weapon.lifetime) ? missile.weapon.lifetime : 20) * 1000;
    prev_z = missile.origin[2];
    fps = 20;
    delay = 1 / fps;
    while (isdefined(lifetime) && lifetime > 0) {
        cur_z = missile.origin[2];
        setuimodelvalue(altitude_ui_data_model, cur_z);
        dist = (prev_z - cur_z) * fps;
        val = dist / 17.6;
        setuimodelvalue(speed_ui_data_model, val);
        prev_z = cur_z;
        remainingtime = 1 - (gettime() - birthtime) / lifetime;
        setuimodelvalue(var_2c36f843, remainingtime);
        wait(delay);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 1, eflags: 0x0
// Checksum 0x1ceba9ca, Offset: 0x11c8
// Size: 0x16c
function function_d260edc9(localclientnum) {
    player = function_5c10bd79(localclientnum);
    postfxbundle = #"hash_778f4a554a5cfc33";
    if (!function_148ccc79(localclientnum, postfxbundle) && (!function_1cbf351b(localclientnum) || function_93e0f729(localclientnum) === function_27673a7(localclientnum)) && !shoutcaster::function_2e6e4ee0(localclientnum)) {
        if (isdefined(self.weapon) && self.weapon.statname == #"remote_missile") {
            function_a837926b(localclientnum, postfxbundle);
        }
        return;
    }
    if (isdefined(player.clouds_fx)) {
        killfx(localclientnum, player.clouds_fx);
    }
    if (function_148ccc79(localclientnum, postfxbundle)) {
        codestoppostfxbundlelocal(localclientnum, postfxbundle);
    }
}

// Namespace remotemissile/remotemissile_shared
// Params 7, eflags: 0x0
// Checksum 0x93c809eb, Offset: 0x1340
// Size: 0x184
function function_c65b18ed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    player = function_5c10bd79(localclientnum);
    postfxbundle = #"hash_778f4a554a5cfc33";
    if (!isdefined(self)) {
        return;
    }
    if (newval) {
        if (!function_148ccc79(localclientnum, postfxbundle) && (!function_1cbf351b(localclientnum) || function_93e0f729(localclientnum) === function_27673a7(localclientnum)) && !shoutcaster::function_2e6e4ee0(localclientnum)) {
            function_a837926b(localclientnum, postfxbundle);
        }
        return;
    }
    if (isdefined(player.clouds_fx)) {
        killfx(localclientnum, player.clouds_fx);
    }
    if (function_148ccc79(localclientnum, postfxbundle)) {
        codestoppostfxbundlelocal(localclientnum, postfxbundle);
    }
}

