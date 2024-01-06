// Atian COD Tools GSC decompiler test
#using script_640ee26e1d271011;
#using script_67b81035ebe2a4fe;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\duplicaterender_mgr.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace prop;

// Namespace prop/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd5f829d0, Offset: 0x278
// Size: 0x3ac
function event_handler[gametype_init] main(eventstruct) {
    clientfield::register("allplayers", "hideTeamPlayer", 16000, 2, "int", &function_abaafe9a, 0, 0);
    clientfield::register("allplayers", "pingHighlight", 16000, 1, "int", &function_3c95ba87, 0, 0);
    clientfield::register("toplayer", "PROP.change_prop", 16000, 1, "int", &propchange, 0, 0);
    clientfield::register("toplayer", "PROP.cameraHeight", 16000, 8, "int", &cameraheightchange, 0, 0);
    clientfield::register("toplayer", "PROP.cameraRange", 16000, 8, "int", &camerarangechange, 0, 0);
    clientfield::register("toplayer", "PROP.hide_prop", 16000, 1, "int", &hideprop, 0, 0);
    clientfield::register("worlduimodel", "hudItems.war.attackingTeam", 16000, 2, "int", undefined, 0, 1);
    clientfield::register("clientuimodel", "hudItems.numPropsAlive", 16000, 4, "int", undefined, 0, 1);
    clientfield::register("clientuimodel", "hudItems.numPropConcusses", 16000, 2, "int", undefined, 0, 1);
    clientfield::register("clientuimodel", "hudItems.numPropChanges", 16000, 2, "int", undefined, 0, 1);
    clientfield::register("clientuimodel", "hudItems.numPropDecoys", 16000, 4, "int", undefined, 0, 1);
    clientfield::register("toplayer", "realtime_multiplay", 16000, 1, "int", &function_a1b40aa4, 0, 1);
    level.hide_timer = mp_prop_timer::register("HideTimer");
    level.prop_controls = mp_prop_controls::register("PropControls");
    callback::on_localplayer_spawned(&onlocalplayerspawned);
    level.var_20ece392 = &highlightprop;
    thread function_2691bc1b();
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xc659ac7f, Offset: 0x630
// Size: 0xcc
function onlocalplayerspawned(localclientnum) {
    level notify("localPlayerSpectatingEnd" + localclientnum);
    if (!self function_b9fceaaf(localclientnum)) {
        function_da64790f(localclientnum);
        function_a5c395d2(localclientnum);
        function_b1cca54f(localclientnum);
    }
    if (function_65b9eb0f(localclientnum)) {
        level thread localplayerspectating(localclientnum);
    }
    level thread setuppropplayernames(localclientnum);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xf2e0057b, Offset: 0x708
// Size: 0xb0
function localplayerspectating(localclientnum) {
    level notify("localPlayerSpectating" + localclientnum);
    level endon("localPlayerSpectatingEnd" + localclientnum);
    var_22d4baff = playerbeingspectated(localclientnum);
    while (1) {
        player = playerbeingspectated(localclientnum);
        if (player != var_22d4baff) {
            level notify("localPlayerSpectating" + localclientnum);
        }
        wait(0.1);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xdee53aa7, Offset: 0x7c0
// Size: 0x66
function function_2691bc1b() {
    while (1) {
        res = undefined;
        res = level waittill(#"team_changed");
        localclientnum = res.localclientnum;
        level notify("team_changed" + localclientnum);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x855f29d0, Offset: 0x830
// Size: 0x6c
function function_43ad0547(player) {
    parent = self getlinkedent();
    while (isdefined(parent)) {
        if (parent == player) {
            return 1;
        } else {
            parent = parent getlinkedent();
        }
    }
    return 0;
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x2ceb511a, Offset: 0x8a8
// Size: 0x112
function function_1d9539dd(localclientnum, player) {
    if (isdefined(player.prop)) {
        return player.prop;
    }
    ents = getentarray(localclientnum);
    foreach (ent in ents) {
        if (!isplayer(ent) && isdefined(ent.owner) && ent.owner == player && ent function_43ad0547(player)) {
            return ent;
        }
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x534e8ab4, Offset: 0x9c8
// Size: 0x280
function setuppropplayernames(localclientnum) {
    level notify("setupPropPlayerNames" + localclientnum);
    level endon("setupPropPlayerNames" + localclientnum);
    while (1) {
        localplayer = function_5c10bd79(localclientnum);
        spectating = function_65b9eb0f(localclientnum);
        players = getplayers(localclientnum);
        foreach (player in players) {
            if ((player != localplayer || spectating) && player ishidden() && isdefined(player.team) && player.team == localplayer.team) {
                player.prop = function_1d9539dd(localclientnum, player);
                if (isdefined(player.prop)) {
                    if (!(isdefined(player.var_776a1340) && player.var_776a1340)) {
                        player.prop setdrawownername(1, spectating);
                        player.var_776a1340 = 1;
                    }
                }
            } else if (isdefined(player.var_776a1340) && player.var_776a1340) {
                player.prop = function_1d9539dd(localclientnum, player);
                if (isdefined(player.prop)) {
                    player.prop setdrawownername(0, spectating);
                }
                player.var_776a1340 = 0;
            }
        }
        wait(1);
    }
}

// Namespace prop/prop
// Params 7, eflags: 0x0
// Checksum 0x193dbf5f, Offset: 0xc50
// Size: 0xc4
function highlightprop(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        self notify(#"hash_3fe34dcd29fd6a0f");
        self duplicate_render::update_dr_flag(localclientnum, "prop_ally", 0);
        self duplicate_render::update_dr_flag(localclientnum, "prop_clone", 0);
    } else {
        self thread function_15e0dfb8(localclientnum, newval);
    }
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xf46ec040, Offset: 0xd20
// Size: 0x20a
function function_15e0dfb8(localclientnum, var_dc9f0c39) {
    self endon(#"entityshutdown");
    level endon(#"disconnect");
    self notify(#"hash_3fe34dcd29fd6a0f");
    self endon(#"hash_3fe34dcd29fd6a0f");
    while (1) {
        localplayer = function_5c10bd79(localclientnum);
        spectating = function_65b9eb0f(localclientnum) && !function_1cbf351b(localclientnum);
        var_6955388c = (!isdefined(self.owner) || self.owner != localplayer || spectating) && isdefined(self.team) && isdefined(localplayer.team) && self.team == localplayer.team;
        if (var_dc9f0c39 == 1) {
            self duplicate_render::update_dr_flag(localclientnum, "prop_ally", var_6955388c);
            self duplicate_render::update_dr_flag(localclientnum, "prop_clone", 0);
        } else {
            self duplicate_render::update_dr_flag(localclientnum, "prop_clone", var_6955388c);
            self duplicate_render::update_dr_flag(localclientnum, "prop_ally", 0);
        }
        self duplicate_render::update_dr_filters(localclientnum);
        level waittill("team_changed" + localclientnum, "localPlayerSpectating" + localclientnum);
    }
}

// Namespace prop/prop
// Params 7, eflags: 0x0
// Checksum 0xe7a92dc, Offset: 0xf38
// Size: 0xa4
function function_3c95ba87(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        self notify(#"hash_3fe34dcd29fd6a0f");
        self duplicate_render::update_dr_flag(localclientnum, "prop_clone", 0);
    } else {
        self thread function_29561f83(localclientnum, newval);
    }
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x81a996ff, Offset: 0xfe8
// Size: 0x12a
function function_29561f83(localclientnum, var_dc9f0c39) {
    self endon(#"entityshutdown");
    self notify(#"hash_3f606627f154954b");
    self endon(#"hash_3f606627f154954b");
    while (1) {
        localplayer = function_5c10bd79(localclientnum);
        if (!isdefined(self) || !isdefined(localplayer)) {
            break;
        }
        var_6955388c = self != localplayer && isdefined(self.team) && isdefined(localplayer.team) && self.team == localplayer.team;
        self duplicate_render::update_dr_flag(localclientnum, "prop_clone", var_6955388c);
        level waittill("team_changed" + localclientnum, "localPlayerSpectating" + localclientnum);
    }
}

// Namespace prop/prop
// Params 7, eflags: 0x0
// Checksum 0x1c6b0ce4, Offset: 0x1120
// Size: 0xfc
function hideprop(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    localplayer = function_5c10bd79(localclientnum);
    var_6955388c = newval && isdefined(self) && self == localplayer;
    if (var_6955388c) {
        if (isdefined(self.prop)) {
            self.prop playrenderoverridebundle(#"hash_14be6378dfef6b7");
        }
    } else if (isdefined(self.prop)) {
        self.prop stoprenderoverridebundle(#"hash_14be6378dfef6b7");
    }
}

// Namespace prop/prop
// Params 7, eflags: 0x0
// Checksum 0xc0e2dace, Offset: 0x1228
// Size: 0xac
function function_abaafe9a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        self notify(#"hash_65350e9157e1e7fd");
        if (!self function_b9fceaaf(localclientnum)) {
            self show();
        }
    } else {
        self function_f6c0a66e(localclientnum, newval);
    }
}

// Namespace prop/prop
// Params 7, eflags: 0x0
// Checksum 0xafadd680, Offset: 0x12e0
// Size: 0x74
function propchange(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (self function_b9fceaaf(localclientnum)) {
        self.prop function_415dc60b(localclientnum);
    }
}

// Namespace prop/prop
// Params 7, eflags: 0x0
// Checksum 0x767a1aa, Offset: 0x1360
// Size: 0x5c
function cameraheightchange(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_ac297091(localclientnum, newval * 10);
}

// Namespace prop/prop
// Params 7, eflags: 0x0
// Checksum 0x6c3d8e26, Offset: 0x13c8
// Size: 0x5c
function camerarangechange(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_d69242bb(localclientnum, newval * 10);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xb41e0987, Offset: 0x1430
// Size: 0x60
function function_b9fceaaf(localclientnum) {
    if (isdefined(self.prop)) {
        return 1;
    }
    if (isplayer(self)) {
        self.prop = function_1d9539dd(localclientnum, self);
        return isdefined(self.prop);
    }
    return 0;
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xfeb4716a, Offset: 0x1498
// Size: 0x17e
function function_f6c0a66e(localclientnum, teamint) {
    self endon(#"entityshutdown");
    self notify(#"hash_65350e9157e1e7fd");
    self endon(#"hash_65350e9157e1e7fd");
    /#
        assert(teamint == 1 || teamint == 2);
    #/
    team = "allies";
    if (teamint == 2) {
        team = "axis";
    }
    while (isdefined(self)) {
        localplayer = function_5c10bd79(localclientnum);
        ishidden = isdefined(localplayer.team) && team == localplayer.team && !function_65b9eb0f(localclientnum);
        if (ishidden) {
            self hide();
        } else if (!self function_b9fceaaf(localclientnum)) {
            self show();
        }
        level waittill("team_changed" + localclientnum);
    }
}

// Namespace prop/prop
// Params 7, eflags: 0x0
// Checksum 0x4d7acf02, Offset: 0x1620
// Size: 0x74
function function_a1b40aa4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_9e9a0604(localclientnum);
    } else {
        function_3f258626(localclientnum);
    }
}

