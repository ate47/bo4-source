#using scripts\core_common\util_shared.csc;
#using scripts\core_common\shoutcaster.csc;
#using scripts\core_common\duplicaterender_mgr.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace escort;

// Namespace escort/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1aa97ce2, Offset: 0x158
// Size: 0xe4
function event_handler[gametype_init] main(eventstruct) {
    clientfield::register("actor", "escort_robot_burn", 6000, 1, "int", &robot_burn, 0, 0);
    clientfield::register("worlduimodel", "Escort.robotProgress", 6000, 7, "float", undefined, 0, 0);
    clientfield::register("worlduimodel", "Escort.robotMoving", 6000, 1, "int", undefined, 0, 0);
    callback::on_localclient_connect(&on_localclient_connect);
}

// Namespace escort/escort
// Params 1, eflags: 0x0
// Checksum 0xf56ce78d, Offset: 0x248
// Size: 0xa4
function on_localclient_connect(localclientnum) {
    conmodel = getuimodelforcontroller(localclientnum);
    setuimodelvalue(createuimodel(conmodel, "Escort.robotIsEnemy"), 0);
    setuimodelvalue(createuimodel(conmodel, "Escort.robotRebooting"), 0);
    level wait_team_changed(localclientnum);
}

// Namespace escort/escort
// Params 7, eflags: 0x0
// Checksum 0x55098d8d, Offset: 0x2f8
// Size: 0xb4
function robot_burn(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self endon(#"death");
        self util::waittill_dobj(localclientnum);
        fxhandles = playtagfxset(localclientnum, "escort_robot_burn", self);
        self thread watch_fx_shutdown(localclientnum, fxhandles);
    }
}

// Namespace escort/escort
// Params 2, eflags: 0x0
// Checksum 0x9ee97ed4, Offset: 0x3b8
// Size: 0x90
function watch_fx_shutdown(localclientnum, fxhandles) {
    wait(3);
    foreach (fx in fxhandles) {
        stopfx(localclientnum, fx);
    }
}

// Namespace escort/escort
// Params 1, eflags: 0x0
// Checksum 0xeec5b33b, Offset: 0x450
// Size: 0xcc
function wait_team_changed(localclientnum) {
    while (true) {
        level waittill(#"team_changed");
        if (!isdefined(level.escortrobots)) {
            continue;
        }
        foreach (robot in level.escortrobots) {
            if (isdefined(robot)) {
                robot thread update_robot_team(localclientnum);
            }
        }
    }
}

// Namespace escort/escort
// Params 1, eflags: 0x0
// Checksum 0xaf332ef7, Offset: 0x528
// Size: 0x164
function update_robot_team(localclientnum) {
    localplayerteam = function_73f4b33(localclientnum);
    if (shoutcaster::is_shoutcaster(localclientnum)) {
        friend = self shoutcaster::is_friendly(localclientnum);
    } else {
        friend = self.team == localplayerteam;
    }
    if (friend) {
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "escortGametype.enemyRobot"), 0);
    } else {
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "escortGametype.enemyRobot"), 1);
    }
    self duplicate_render::set_dr_flag("enemyvehicle_fb", !friend);
    localplayer = function_5c10bd79(localclientnum);
    localplayer duplicate_render::update_dr_filters(localclientnum);
}

