#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace dynent_world;

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x2
// Checksum 0xb8d4cb0b, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"dynent_world", &__init__, undefined, undefined);
}

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x0
// Checksum 0x6d861b2f, Offset: 0x140
// Size: 0x114
function __init__() {
    if (!(isdefined(getgametypesetting(#"usabledynents")) ? getgametypesetting(#"usabledynents") : 0)) {
        return;
    }
    clientfield::register_clientuimodel("hudItems.dynentUseHoldProgress", 13000, 5, "float", 0);
    /#
        level thread devgui_loop();
    #/
    level thread update_loop();
    callback::on_connect(&on_player_connect);
    callback::on_disconnect(&on_player_disconnect);
    callback::on_player_killed(&on_player_killed);
}

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x4
// Checksum 0x16177eca, Offset: 0x260
// Size: 0x74
function private on_player_connect() {
    usetrigger = create_use_trigger();
    self clientclaimtrigger(usetrigger);
    self.var_8a022726 = usetrigger;
    /#
        if (self ishost()) {
            self thread function_6b66543a();
        }
    #/
}

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x4
// Checksum 0xba04c288, Offset: 0x2e0
// Size: 0x2c
function private on_player_disconnect() {
    if (isdefined(self.var_8a022726)) {
        self.var_8a022726 delete();
    }
}

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x4
// Checksum 0xea13ef91, Offset: 0x318
// Size: 0x24
function private on_player_killed() {
    self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", 0);
}

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x4
// Checksum 0x954cbf42, Offset: 0x348
// Size: 0x190
function private create_use_trigger() {
    usetrigger = spawn("trigger_radius_use", (0, 0, -10000), 0, 128, 64, 1);
    usetrigger triggerignoreteam();
    usetrigger setinvisibletoall();
    usetrigger setvisibletoplayer(self);
    usetrigger setteamfortrigger(#"none");
    usetrigger setcursorhint("HINT_NOICON");
    usetrigger triggerenable(0);
    usetrigger usetriggerignoreuseholdtime();
    usetrigger function_4bf6de9a(0);
    usetrigger function_c96c67a5(0);
    usetrigger function_89fca53b(1);
    usetrigger function_49462027(1, 1 | 16 | 1024);
    usetrigger callback::on_trigger_once(&function_46502841);
    return usetrigger;
}

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x4
// Checksum 0xa88bf5bc, Offset: 0x4e0
// Size: 0x18e
function private update_loop() {
    level endon(#"game_ended");
    updatepass = 0;
    while (true) {
        foreach (i, player in getplayers()) {
            if (i % 5 == updatepass) {
                if (!isdefined(player.var_8a022726)) {
                    continue;
                }
                if (player.sessionstate != "playing" || !isalive(player) || player isinvehicle() || isdefined(level.var_3dfbaf65) && player [[ level.var_3dfbaf65 ]]()) {
                    player.var_8a022726 triggerenable(0);
                    continue;
                }
                player function_2f394f36();
            }
        }
        updatepass = (updatepass + 1) % 5;
        waitframe(1);
    }
}

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x4
// Checksum 0x664ce89e, Offset: 0x678
// Size: 0x6d4
function private function_2f394f36() {
    height = self getmaxs()[2];
    bounds = (50, 50, height / 2);
    boundsorigin = self getcentroid();
    /#
        debug = self ishost() && getdvarint(#"hash_23e7101285284738", 0);
        if (debug) {
            box(boundsorigin, (0, 0, 0) - bounds, bounds, 0, (0, 0, 1), 1, 0, 5);
        }
    #/
    viewheight = self getplayerviewheight();
    vieworigin = self.origin + (0, 0, viewheight);
    viewangles = self getplayerangles();
    viewforward = anglestoforward(viewangles);
    var_e86a4d9 = function_db4bc717(boundsorigin, bounds);
    var_c61b7280 = undefined;
    var_97684497 = undefined;
    bestdot = -1;
    foreach (dynent in var_e86a4d9) {
        centroid = function_c5689a6a(dynent);
        var_966ddbb9 = centroid - vieworigin;
        var_966ddbb9 = vectornormalize((var_966ddbb9[0], var_966ddbb9[1], 0));
        var_755fcbbd = vectordot(viewforward, var_966ddbb9);
        /#
            if (debug) {
                sphere(dynent.origin, 9, (0, 0, 1), 1, 0, 8, 5);
            }
        #/
        if (var_755fcbbd < 0) {
            continue;
        }
        if (isdefined(dynent.var_a548ec11) && gettime() <= dynent.var_a548ec11) {
            /#
                if (debug) {
                    print3d(dynent.origin, "<dev string:x38>", (1, 1, 1), 1, 0.5, 5);
                }
            #/
            continue;
        }
        stateindex = function_ffdbe8c2(dynent);
        bundle = function_489009c1(dynent);
        if (isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[stateindex]) && (isdefined(bundle.dynentstates[stateindex].var_efabe801) && bundle.dynentstates[stateindex].var_efabe801 || level.inprematchperiod && !(isdefined(bundle.dynentstates[stateindex].var_4a78f198) && bundle.dynentstates[stateindex].var_4a78f198))) {
            /#
                if (debug) {
                    print3d(dynent.origin, "<dev string:x43>", (1, 1, 1), 1, 0.5, 5);
                }
            #/
            continue;
        }
        if (isdefined(dynent.canuse) && !dynent [[ dynent.canuse ]](self)) {
            continue;
        }
        if (var_755fcbbd > bestdot) {
            bestdot = var_755fcbbd;
            var_c61b7280 = dynent;
        }
    }
    if (!isdefined(var_c61b7280)) {
        self.var_8a022726 triggerenable(0);
        return;
    }
    trigger = self.var_8a022726;
    state = function_ffdbe8c2(var_c61b7280);
    if (trigger.var_a9309589 === var_c61b7280 && trigger.dynentstate === state) {
        trigger triggerenable(1);
        return;
    }
    trigger.var_a9309589 = var_c61b7280;
    trigger.dynentstate = state;
    bundle = function_489009c1(var_c61b7280);
    v_offset = (isdefined(bundle.var_aa0fba03) ? bundle.var_aa0fba03 : 0, isdefined(bundle.var_f8525687) ? bundle.var_f8525687 : 0, isdefined(bundle.var_54b28eee) ? bundle.var_54b28eee : 0);
    v_offset = rotatepoint(v_offset, var_c61b7280.angles);
    trigger.origin = var_c61b7280.origin + v_offset;
    trigger.usetime = isdefined(bundle.use_time) ? bundle.use_time : 0;
    trigger function_836af3b3(bundle, state);
    trigger triggerenable(1);
}

// Namespace dynent_world/dynent_world
// Params 2, eflags: 0x0
// Checksum 0x40171696, Offset: 0xd58
// Size: 0xb4
function function_836af3b3(bundle, state) {
    hintstring = #"";
    if (isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[state]) && isdefined(bundle.dynentstates[state].hintstring)) {
        hintstring = bundle.dynentstates[state].hintstring;
    }
    self sethintstring(hintstring);
}

// Namespace dynent_world/dynent_world
// Params 1, eflags: 0x4
// Checksum 0x3358fd97, Offset: 0xe18
// Size: 0x132
function private function_46502841(trigger_struct) {
    if (isdefined(level.gameended) && level.gameended) {
        return;
    }
    activator = trigger_struct.activator;
    dynent = self.var_a9309589;
    for (success = activator function_2b9e2224(self); success && isdefined(dynent) && self.var_a9309589 === dynent && isdefined(dynent.var_e7823894) && dynent.var_e7823894; success = activator function_2b9e2224(self)) {
        if (isdefined(dynent.canuse) && !dynent [[ dynent.canuse ]](activator)) {
            break;
        }
        self triggerenable(1);
    }
}

// Namespace dynent_world/dynent_world
// Params 1, eflags: 0x4
// Checksum 0x158b1256, Offset: 0xf58
// Size: 0x358
function private function_2b9e2224(trigger) {
    self endon(#"disconnect");
    dynent = trigger.var_a9309589;
    if (isdefined(dynent)) {
        begintime = gettime();
        usetime = int(trigger.usetime * 1000);
        endtime = begintime + usetime;
        if (isdefined(dynent.onbeginuse)) {
            dynent thread [[ dynent.onbeginuse ]](self);
        }
        if (isdefined(dynent.var_263c4ded)) {
            var_36c3259 = trigger.usetime;
            usetime = int(dynent thread [[ dynent.var_263c4ded ]](self) * 1000);
            endtime = begintime + usetime;
        }
        success = 0;
        while (isalive(self) && !self inlaststand() && self usebuttonpressed() && trigger istriggerenabled() && self istouching(trigger) && isdefined(dynent) && trigger.var_a9309589 === dynent) {
            if (isdefined(level.gameended) && level.gameended) {
                trigger triggerenable(0);
                break;
            }
            if (gettime() >= endtime) {
                success = 1;
                var_a852a7dd = trigger use_dynent(dynent, self);
                dynent.var_a548ec11 = gettime() + var_a852a7dd * 1000;
                trigger triggerenable(0);
                break;
            }
            if (usetime > 0) {
                progress = (gettime() - begintime) / usetime;
                progress = max(progress, 0.01);
                self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", progress);
            }
            waitframe(1);
        }
        if (isdefined(dynent.onusecancel) && !success) {
            dynent thread [[ dynent.onusecancel ]](self);
        }
    }
    self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", 0);
    self thread function_e882de59(trigger);
    return success;
}

// Namespace dynent_world/dynent_world
// Params 1, eflags: 0x4
// Checksum 0xc13247c2, Offset: 0x12b8
// Size: 0xc4
function private function_e882de59(trigger) {
    if (isdefined(level.gameended) && level.gameended) {
        return;
    }
    self notify("1fefc20570ca81a2");
    self endon("1fefc20570ca81a2");
    level endon(#"game_ended");
    self endon(#"death", #"disconnect");
    while (self usebuttonpressed()) {
        waitframe(1);
    }
    trigger callback::on_trigger_once(&function_46502841);
}

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x0
// Checksum 0x5c8e07e0, Offset: 0x1388
// Size: 0x5c
function function_7f2040e8() {
    if (!isdefined(self.var_8a022726)) {
        return;
    }
    self.var_8a022726 callback::remove_on_trigger_once(&function_46502841);
    self thread function_e882de59(self.var_8a022726);
}

// Namespace dynent_world/dynent_world
// Params 2, eflags: 0x0
// Checksum 0x225709ee, Offset: 0x13f0
// Size: 0x288
function use_dynent(dynent, activator) {
    stateindex = function_ffdbe8c2(dynent);
    bundle = function_489009c1(dynent);
    var_9bdcfcd8 = undefined;
    if (isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[stateindex])) {
        state = bundle.dynentstates[stateindex];
        var_9bdcfcd8 = isdefined(state.var_8a7fcb87) ? state.var_8a7fcb87 : 0;
        if (isdefined(activator)) {
            var_b4b3af4c = anglestoforward(dynent.angles);
            playerdir = self.origin - activator.origin;
            dot = vectordot(var_b4b3af4c, playerdir);
            if (dot > 0) {
                var_9bdcfcd8 = isdefined(state.var_8a7fcb87) ? state.var_8a7fcb87 : 0;
            } else {
                var_9bdcfcd8 = isdefined(state.var_afc94db1) ? state.var_afc94db1 : 0;
            }
        }
        if (isplayer(activator) && isdefined(state.var_20630681)) {
            activator gestures::function_56e00fbf(state.var_20630681, undefined, 0);
        }
        if (isdefined(dynent.onuse)) {
            succeeded = dynent thread [[ dynent.onuse ]](activator, stateindex, var_9bdcfcd8);
        }
        if (!isdefined(succeeded) || succeeded == 1) {
            function_e2a06860(dynent, var_9bdcfcd8);
        }
        return (isdefined(bundle.var_a852a7dd) ? bundle.var_a852a7dd : 0);
    }
    return 0;
}

// Namespace dynent_world/event_9673dc9a
// Params 1, eflags: 0x44
// Checksum 0x83f25af7, Offset: 0x1680
// Size: 0x55c
function private event_handler[event_9673dc9a] function_3981d015(eventstruct) {
    dynent = eventstruct.ent;
    var_16a4afdc = eventstruct.state;
    bundle = function_489009c1(dynent);
    if (isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[var_16a4afdc])) {
        newstate = bundle.dynentstates[var_16a4afdc];
        teleport = eventstruct.teleport;
        if (!(isdefined(bundle.var_f710132b) && bundle.var_f710132b)) {
            pos = (isdefined(newstate.pos_x) ? newstate.pos_x : 0, isdefined(newstate.pos_y) ? newstate.pos_y : 0, isdefined(newstate.pos_z) ? newstate.pos_z : 0);
            pos = rotatepoint(pos, dynent.var_c286a1ae);
            neworigin = dynent.var_718063b0 + pos;
            pitch = dynent.var_c286a1ae[0] + (isdefined(newstate.var_9d1a4684) ? newstate.var_9d1a4684 : 0);
            yaw = dynent.var_c286a1ae[1] + (isdefined(newstate.var_d81008de) ? newstate.var_d81008de : 0);
            roll = dynent.var_c286a1ae[2] + (isdefined(newstate.var_774f5d57) ? newstate.var_774f5d57 : 0);
            newangles = (absangleclamp360(pitch), absangleclamp360(yaw), absangleclamp360(roll));
            var_a852a7dd = isdefined(bundle.var_a852a7dd) ? bundle.var_a852a7dd : 0;
            if (!teleport && var_a852a7dd > 0) {
                dynent function_49ed8678(neworigin, var_a852a7dd);
                dynent function_7622f013(newangles, var_a852a7dd);
            } else {
                dynent.origin = neworigin;
                dynent.angles = newangles;
            }
        }
        if (isdefined(newstate.overridemodel)) {
            add_helico(dynent, newstate.overridemodel);
        }
        if (isdefined(newstate.stateanim)) {
            starttime = 0;
            rate = isdefined(newstate.animrate) ? newstate.animrate : 0;
            if (isdefined(newstate.var_8725802) && newstate.var_8725802) {
                gametime = gettime();
                if (isdefined(newstate.var_e23400ad) && newstate.var_e23400ad) {
                    gametime += abs(dynent.origin[0] + dynent.origin[1] + dynent.origin[2]);
                }
                animlength = int(getanimlength(newstate.stateanim) * 1000);
                starttime = gametime / animlength / rate;
                starttime -= int(starttime);
            } else if (teleport && !isanimlooping(newstate.stateanim)) {
                starttime = 1;
            }
            function_1e23c01f(dynent, newstate.stateanim, starttime, rate);
        } else {
            function_27b5ddff(dynent);
        }
        setdynentenabled(dynent, isdefined(newstate.enable) && newstate.enable);
    }
}

// Namespace dynent_world/event_9e981c4
// Params 1, eflags: 0x44
// Checksum 0xbfeb6d4, Offset: 0x1be8
// Size: 0x10c
function private event_handler[event_9e981c4] function_ff8b3908(eventstruct) {
    dynent = eventstruct.ent;
    bundle = function_489009c1(dynent);
    var_1a5e0c43 = isdefined(eventstruct.clientside) && eventstruct.clientside;
    if (isdefined(bundle) && isdefined(bundle.dynentstates)) {
        stateindex = isdefined(bundle.destroyed) ? bundle.destroyed : var_1a5e0c43 ? isdefined(bundle.vehicledestroyed) ? bundle.vehicledestroyed : 0 : 0;
        if (isdefined(bundle.dynentstates[stateindex])) {
            function_e2a06860(dynent, stateindex);
        }
    }
}

// Namespace dynent_world/event_cf200f34
// Params 1, eflags: 0x40
// Checksum 0xfdffb4f1, Offset: 0x1d00
// Size: 0x48
function event_handler[event_cf200f34] function_209450ae(eventstruct) {
    dynent = eventstruct.ent;
    if (isdefined(dynent.ondamaged)) {
        [[ dynent.ondamaged ]](eventstruct);
    }
}

/#

    // Namespace dynent_world/dynent_world
    // Params 0, eflags: 0x4
    // Checksum 0x7aecb662, Offset: 0x1d50
    // Size: 0x176
    function private devgui_loop() {
        level endon(#"game_ended");
        while (!canadddebugcommand()) {
            waitframe(1);
        }
        adddebugcommand("<dev string:x59>");
        adddebugcommand("<dev string:x80>");
        adddebugcommand("<dev string:xd3>");
        while (true) {
            wait(0.25);
            dvarstr = getdvarstring(#"hash_40f9f26f308dd924", "<dev string:x11b>");
            if (dvarstr == "<dev string:x11b>") {
                continue;
            }
            setdvar(#"hash_40f9f26f308dd924", "<dev string:x11b>");
            args = strtok(dvarstr, "<dev string:x11e>");
            switch (args[0]) {
            case #"reset":
                function_3ca3c6e4();
                break;
            }
        }
    }

    // Namespace dynent_world/dynent_world
    // Params 0, eflags: 0x4
    // Checksum 0x4e860e39, Offset: 0x1ed0
    // Size: 0x290
    function private function_6b66543a() {
        self endon(#"disconnect");
        while (true) {
            waitframe(1);
            waittillframeend();
            if (!getdvarint(#"hash_23e7101285284738", 0)) {
                continue;
            }
            trigger = self.var_8a022726;
            if (isdefined(trigger)) {
                dynent = trigger.var_a9309589;
                if (isdefined(dynent)) {
                    sphere(function_c5689a6a(dynent), 8, (0, 1, 1));
                    sphere(dynent.origin, 7, (1, 0.5, 0));
                    print3d(dynent.origin, function_ffdbe8c2(dynent), (1, 1, 1), 1, 0.5);
                }
                color = trigger istriggerenabled() ? (1, 0, 1) : (1, 0, 0);
                maxs = trigger getmaxs();
                mins = trigger getmins();
                origin = trigger.origin;
                top = origin + (0, 0, maxs[2]);
                bottom = origin + (0, 0, mins[2]);
                line(bottom, top, color);
                sphere(origin, 2, color);
                circle(bottom, maxs[0], color, 0, 1);
                circle(top, maxs[0], color, 0, 1);
            }
        }
    }

#/
