#using scripts\mp_common\gametypes\ct_tutorial_skirmish.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\shoutcaster.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace dom;

// Namespace dom/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xb0d381fc, Offset: 0x158
// Size: 0x9c
function event_handler[gametype_init] main(eventstruct) {
    callback::on_localclient_connect(&on_localclient_connect);
    if (getgametypesetting(#"silentplant") != 0) {
        setsoundcontext("bomb_plant", "silent");
    }
    if (util::function_8570168d()) {
        ct_tutorial_skirmish::init();
    }
}

// Namespace dom/dom
// Params 1, eflags: 0x0
// Checksum 0xb0d92246, Offset: 0x200
// Size: 0x160
function on_localclient_connect(localclientnum) {
    self.domflags = [];
    while (!isdefined(level.domflags[#"a"])) {
        self.domflags[#"a"] = serverobjective_getobjective(localclientnum, "dom_a");
        self.domflags[#"b"] = serverobjective_getobjective(localclientnum, "dom_b");
        self.domflags[#"c"] = serverobjective_getobjective(localclientnum, "dom_c");
        waitframe(1);
    }
    foreach (key, flag_objective in self.domflags) {
        self thread monitor_flag_fx(localclientnum, flag_objective, key);
    }
}

// Namespace dom/dom
// Params 3, eflags: 0x0
// Checksum 0xfca1c5a5, Offset: 0x368
// Size: 0x326
function monitor_flag_fx(localclientnum, flag_objective, flag_name) {
    if (!isdefined(flag_objective)) {
        return;
    }
    flag = spawnstruct();
    flag.name = flag_name;
    flag.objectiveid = flag_objective;
    flag.origin = serverobjective_getobjectiveorigin(localclientnum, flag_objective);
    flag.angles = (0, 0, 0);
    flag_entity = serverobjective_getobjectiveentity(localclientnum, flag_objective);
    if (isdefined(flag_entity)) {
        flag.origin = flag_entity.origin;
        flag.angles = flag_entity.angles;
    }
    fx_name = get_base_fx(flag, #"neutral");
    play_base_fx(localclientnum, flag, fx_name, #"neutral");
    flag.last_progress = 0;
    while (true) {
        team = serverobjective_getobjectiveteam(localclientnum, flag_objective);
        if (team != flag.last_team) {
            flag update_base_fx(localclientnum, flag, team);
        }
        progress = serverobjective_getobjectiveprogress(localclientnum, flag_objective) > 0;
        if (progress != flag.last_progress) {
            var_76587cfe = team;
            if (var_76587cfe == #"neutral") {
                var_4e8c1813 = serverobjective_getobjectivegamemodeflags(localclientnum, flag_objective);
                if (var_4e8c1813 == 2) {
                    var_76587cfe = shoutcaster::is_shoutcaster(localclientnum) ? #"axis" : #"allies";
                } else if (var_4e8c1813 == 1) {
                    var_76587cfe = shoutcaster::is_shoutcaster(localclientnum) ? #"allies" : #"axis";
                }
            } else if (shoutcaster::is_shoutcaster(localclientnum)) {
                var_76587cfe = util::get_other_team(var_76587cfe);
            }
            flag update_cap_fx(localclientnum, flag, var_76587cfe, progress);
        }
        waitframe(1);
    }
}

// Namespace dom/dom
// Params 4, eflags: 0x0
// Checksum 0xace7956e, Offset: 0x698
// Size: 0x10a
function play_base_fx(localclientnum, flag, fx_name, team) {
    if (isdefined(flag.base_fx)) {
        stopfx(localclientnum, flag.base_fx);
    }
    up = anglestoup(flag.angles);
    forward = anglestoforward(flag.angles);
    flag.base_fx = playfx(localclientnum, fx_name, flag.origin, up, forward);
    setfxteam(localclientnum, flag.base_fx, team);
    flag.last_team = team;
}

// Namespace dom/dom
// Params 3, eflags: 0x0
// Checksum 0x81d55bbe, Offset: 0x7b0
// Size: 0x17a
function update_base_fx(localclientnum, flag, team) {
    fx_name = get_base_fx(flag, team);
    if (shoutcaster::is_shoutcaster(localclientnum) && team != #"neutral") {
        fx_name += team == #"allies" ? "_shoutcaster_allies" : "_shoutcaster_axis";
    }
    if (team == #"neutral") {
        play_base_fx(localclientnum, flag, fx_name, team);
        return;
    }
    if (flag.last_team == #"neutral" || shoutcaster::is_shoutcaster(localclientnum)) {
        play_base_fx(localclientnum, flag, fx_name, team);
        return;
    }
    setfxteam(localclientnum, flag.base_fx, team);
    flag.last_team = team;
}

// Namespace dom/dom
// Params 4, eflags: 0x0
// Checksum 0xcd448a37, Offset: 0x938
// Size: 0xfc
function play_cap_fx(localclientnum, flag, fx_name, team) {
    if (isdefined(flag.cap_fx)) {
        killfx(localclientnum, flag.cap_fx);
    }
    up = anglestoup(flag.angles);
    forward = anglestoforward(flag.angles);
    flag.cap_fx = playfx(localclientnum, fx_name, flag.origin, up, forward);
    setfxteam(localclientnum, flag.cap_fx, team);
}

// Namespace dom/dom
// Params 4, eflags: 0x0
// Checksum 0x987ea49c, Offset: 0xa40
// Size: 0x12a
function update_cap_fx(localclientnum, flag, team, progress) {
    if (progress == 0) {
        if (isdefined(flag.cap_fx)) {
            killfx(localclientnum, flag.cap_fx);
        }
        flag.last_progress = progress;
        return;
    }
    fx_name = get_cap_fx(flag, team);
    if (shoutcaster::is_shoutcaster(localclientnum) && team != #"neutral") {
        fx_name += team == #"allies" ? "_shoutcaster_allies" : "_shoutcaster_axis";
    }
    play_cap_fx(localclientnum, flag, fx_name, team);
    flag.last_progress = progress;
}

// Namespace dom/dom
// Params 2, eflags: 0x0
// Checksum 0xaf32f18e, Offset: 0xb78
// Size: 0x7c
function get_base_fx(flag, team) {
    if (isdefined(level.domflagbasefxoverride)) {
        fx = [[ level.domflagbasefxoverride ]](flag, team);
        if (isdefined(fx)) {
            return fx;
        }
    }
    if (team == #"neutral") {
        return "ui/fx_dom_marker_neutral";
    }
    return "ui/fx_dom_marker_team";
}

// Namespace dom/dom
// Params 2, eflags: 0x0
// Checksum 0xa9030dd4, Offset: 0xc00
// Size: 0x7c
function get_cap_fx(flag, team) {
    if (isdefined(level.domflagcapfxoverride)) {
        fx = [[ level.domflagcapfxoverride ]](flag, team);
        if (isdefined(fx)) {
            return fx;
        }
    }
    if (team == #"neutral") {
        return "ui/fx_dom_cap_indicator_neutral";
    }
    return "ui/fx_dom_cap_indicator_team";
}

