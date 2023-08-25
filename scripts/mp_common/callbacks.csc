// Atian COD Tools GSC decompiler test
#include scripts/weapons/acid_bomb.csc;
#include scripts/mp_common/vehicle.csc;
#include scripts/mp_common/callbacks.csc;
#include scripts/abilities/gadgets/gadget_vision_pulse.csc;
#include scripts/core_common/vehicle_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/killstreaks/helicopter_shared.csc;
#include scripts/killstreaks/airsupport.csc;
#include scripts/core_common/footsteps_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace callback;

// Namespace callback/callbacks
// Params 0, eflags: 0x2
// Checksum 0xc69213b, Offset: 0x140
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"callback", &__init__, undefined, undefined);
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0x6db3a401, Offset: 0x188
// Size: 0x1c
function __init__() {
    level thread set_default_callbacks();
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0xbf30ed31, Offset: 0x1b0
// Size: 0x13e
function set_default_callbacks() {
    level.callbackplayerspawned = &playerspawned;
    level.callbackplayerlaststand = &playerlaststand;
    level.var_beec2b1 = &function_27cbba18;
    level.callbacklocalclientconnect = &localclientconnect;
    level.callbackcreatingcorpse = &creating_corpse;
    level.callbackentityspawned = &entityspawned;
    level.var_69b47c50 = &entervehicle;
    level.var_db2ec524 = &exitvehicle;
    level.callbackairsupport = &airsupport;
    level.callbackplayaifootstep = &footsteps::playaifootstep;
    level._custom_weapon_cb_func = &spawned_weapon_type;
    level.var_6b11d5f6 = &function_cbfd8fd6;
    level.gadgetvisionpulse_reveal_func = &gadget_vision_pulse::gadget_visionpulse_reveal;
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x20133d28, Offset: 0x2f8
// Size: 0x7c
function localclientconnect(localclientnum) {
    /#
        println("<unknown string>" + localclientnum);
    #/
    if (isdefined(level.var_51b3e4e0)) {
        [[ level.var_51b3e4e0 ]](localclientnum);
    }
    callback(#"on_localclient_connect", localclientnum);
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x1e557b11, Offset: 0x380
// Size: 0x2c
function function_27cbba18(localclientnum) {
    self callback(#"hash_781399e15b138a4e", localclientnum);
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x7bbbbe82, Offset: 0x3b8
// Size: 0x44
function playerlaststand(localclientnum) {
    self endon(#"death");
    callback(#"on_player_laststand", localclientnum);
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x78c3c59, Offset: 0x408
// Size: 0x104
function playerspawned(localclientnum) {
    self endon(#"death");
    self notify(#"playerspawned_callback");
    self endon(#"playerspawned_callback");
    if (isdefined(level.infraredvisionset)) {
        function_8608b950(localclientnum, level.infraredvisionset);
    }
    if (isdefined(level._playerspawned_override)) {
        self thread [[ level._playerspawned_override ]](localclientnum);
        return;
    }
    if (self function_21c0fa55()) {
        level notify(#"localplayer_spawned");
        callback(#"on_localplayer_spawned", localclientnum);
    }
    callback(#"on_player_spawned", localclientnum);
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x286919b0, Offset: 0x518
// Size: 0x304
function entityspawned(localclientnum) {
    self endon(#"death");
    if (isplayer(self)) {
        if (isdefined(level._clientfaceanimonplayerspawned)) {
            self thread [[ level._clientfaceanimonplayerspawned ]](localclientnum);
        }
    }
    if (isdefined(level._entityspawned_override)) {
        self thread [[ level._entityspawned_override ]](localclientnum);
        return;
    }
    if (!isdefined(self.type)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (self.type == "missile") {
        if (isdefined(level._custom_weapon_cb_func)) {
            self thread [[ level._custom_weapon_cb_func ]](localclientnum);
        }
        if (self.weapon.name === "eq_acid_bomb") {
            self thread acid_bomb::spawned(localclientnum);
        }
    } else if (self.type == "vehicle" || self.type == "helicopter" || self.type == "plane") {
        if (isdefined(level._customvehiclecbfunc)) {
            self thread [[ level._customvehiclecbfunc ]](localclientnum);
        }
        self thread vehicle::field_toggle_exhaustfx_handler(localclientnum, undefined, 0, 1);
        self thread vehicle::field_toggle_lights_handler(localclientnum, undefined, 0, 1);
        if (self.type == "plane" || self.type == "helicopter") {
            self thread vehicle::aircraft_dustkick();
        } else {
            self thread vehicle::vehicle_rumble(localclientnum);
        }
        if (self.type == "helicopter") {
            self thread helicopter::startfx_loop(localclientnum);
        }
    } else if (self.type == "scriptmover") {
        if (isdefined(level.var_83485e06)) {
            self thread [[ level.var_83485e06 ]](localclientnum);
        }
    } else if (self.type == "actor") {
        if (isdefined(level._customactorcbfunc)) {
            self thread [[ level._customactorcbfunc ]](localclientnum);
        }
    } else if (self.type == "NA") {
        if (isdefined(self.weapon)) {
            if (isdefined(level.var_6b11d5f6)) {
                self thread [[ level.var_6b11d5f6 ]](localclientnum);
            }
        }
    }
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0x4c1a16ac, Offset: 0x828
// Size: 0x3e
function entervehicle(localclientnum, vehicle) {
    profilestart();
    if (isdefined(level.var_e583fd9b)) {
        self thread [[ level.var_e583fd9b ]](localclientnum, vehicle);
    }
    profilestop();
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0x9ff07299, Offset: 0x870
// Size: 0x3e
function exitvehicle(localclientnum, vehicle) {
    profilestart();
    if (isdefined(level.var_8e36d09b)) {
        self thread [[ level.var_8e36d09b ]](localclientnum, vehicle);
    }
    profilestop();
}

// Namespace callback/callbacks
// Params 12, eflags: 0x1 linked
// Checksum 0x54a45bd4, Offset: 0x8b8
// Size: 0x636
function airsupport(localclientnum, x, y, z, type, yaw, team, teamfaction, owner, exittype, time, height) {
    pos = (x, y, z);
    switch (teamfaction) {
    case #"v":
        teamfaction = #"vietcong";
        break;
    case #"nva":
    case #"n":
        teamfaction = #"nva";
        break;
    case #"j":
        teamfaction = #"japanese";
        break;
    case #"m":
        teamfaction = #"marines";
        break;
    case #"s":
        teamfaction = #"specops";
        break;
    case #"r":
        teamfaction = #"russian";
        break;
    default:
        /#
            println("<unknown string>");
        #/
        /#
            println("<unknown string>" + teamfaction + "<unknown string>");
        #/
        teamfaction = #"marines";
        break;
    }
    switch (team) {
    case #"x":
        team = #"axis";
        break;
    case #"l":
        team = #"allies";
        break;
    case #"r":
        team = #"free";
        break;
    default:
        /#
            println("<unknown string>" + team + "<unknown string>");
        #/
        team = #"allies";
        break;
    }
    data = spawnstruct();
    data.team = team;
    data.owner = owner;
    data.bombsite = pos;
    data.yaw = yaw;
    direction = (0, yaw, 0);
    data.direction = direction;
    data.flyheight = height;
    if (type == "a") {
        planehalfdistance = 12000;
        data.planehalfdistance = planehalfdistance;
        data.startpoint = pos + vectorscale(anglestoforward(direction), -1 * planehalfdistance);
        data.endpoint = pos + vectorscale(anglestoforward(direction), planehalfdistance);
        data.planemodel = "t5_veh_air_b52";
        data.flybysound = "null";
        data.var_47bf2bb5 = #"veh_b52_flyby_wash";
        data.apextime = 6145;
        data.exittype = -1;
        data.flyspeed = 2000;
        data.flytime = planehalfdistance * 2 / data.flyspeed;
        planetype = "airstrike";
    } else if (type == "n") {
        planehalfdistance = 24000;
        data.planehalfdistance = planehalfdistance;
        data.startpoint = pos + vectorscale(anglestoforward(direction), -1 * planehalfdistance);
        data.endpoint = pos + vectorscale(anglestoforward(direction), planehalfdistance);
        data.planemodel = airsupport::getplanemodel(teamfaction);
        data.flybysound = "null";
        data.var_47bf2bb5 = #"evt_us_napalm_wash";
        data.apextime = 2362;
        data.exittype = exittype;
        data.flyspeed = 7000;
        data.flytime = planehalfdistance * 2 / data.flyspeed;
        planetype = "napalm";
    } else {
        /#
            println("<unknown string>");
            println("<unknown string>");
            println(type);
            println("<unknown string>");
        #/
        return;
    }
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0xa461ae01, Offset: 0xef8
// Size: 0x8c
function creating_corpse(localclientnum, player) {
    params = spawnstruct();
    params.player = player;
    if (isdefined(player)) {
        params.playername = player getplayername();
    }
    self callback(#"on_player_corpse", localclientnum, params);
}

// Namespace callback/callbacks
// Params 7, eflags: 0x1 linked
// Checksum 0x46447208, Offset: 0xf90
// Size: 0xbc
function callback_stunned(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.stunned = newval;
    /#
        println("<unknown string>");
    #/
    if (newval) {
        self notify(#"stunned");
    } else {
        self notify(#"not_stunned");
    }
    if (isdefined(self.stunnedcallback)) {
        self [[ self.stunnedcallback ]](localclientnum, newval);
    }
}

// Namespace callback/callbacks
// Params 7, eflags: 0x1 linked
// Checksum 0x5d225c5d, Offset: 0x1058
// Size: 0x96
function callback_emp(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.emp = newval;
    /#
        println("<unknown string>");
    #/
    if (newval) {
        self notify(#"emp");
    } else {
        self notify(#"not_emp");
    }
}

// Namespace callback/callbacks
// Params 7, eflags: 0x1 linked
// Checksum 0x8d93c81, Offset: 0x10f8
// Size: 0x4a
function callback_proximity(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.enemyinproximity = newval;
}

