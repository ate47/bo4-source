#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace player;

// Namespace player/player_shared
// Params 0, eflags: 0x2
// Checksum 0xfecf46ba, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"player", &__init__, undefined, undefined);
}

// Namespace player/player_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x69b3bf19, Offset: 0x148
// Size: 0x10c
function __init__() {
    clientfield::register("world", "gameplay_started", 1, 1, "int", &gameplay_started_callback, 0, 1);
    clientfield::register("toplayer", "gameplay_allows_deploy", 1, 1, "int", undefined, 0, 0);
    clientfield::register("toplayer", "player_dof_settings", 1, 2, "int", &function_f9e445ee, 0, 0);
    callback::on_localplayer_spawned(&local_player_spawn);
    callback::on_spawned(&on_player_spawned);
}

// Namespace player/player_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x92aa9edc, Offset: 0x260
// Size: 0x84
function gameplay_started_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    setdvar(#"cg_isgameplayactive", newval);
    if (newval) {
        level callback::callback(#"on_gameplay_started", localclientnum);
    }
}

// Namespace player/player_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xdc69f84f, Offset: 0x2f0
// Size: 0x54
function local_player_spawn(localclientnum) {
    if (!self function_21c0fa55()) {
        return;
    }
    setdepthoffield(localclientnum, 0, 0, 0, 0, 6, 1.8);
}

// Namespace player/player_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x19568085, Offset: 0x350
// Size: 0x110
function on_player_spawned(localclientnum) {
    if (sessionmodeiswarzonegame()) {
        return;
    }
    var_87e3f0d8 = function_27673a7(localclientnum);
    if (level.var_7315d934 === 1) {
        if (var_87e3f0d8 == self) {
            var_87e3f0d8 thread function_c98e67ae(localclientnum);
        }
        return;
    }
    players = getplayers(localclientnum);
    foreach (player in players) {
        player function_8656d7d1(localclientnum);
    }
}

// Namespace player/player_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd83851fb, Offset: 0x468
// Size: 0x4c
function function_f22aa227(localclientnum) {
    if (level.var_7315d934 === 1) {
        self function_9f517895(localclientnum);
        return;
    }
    self function_8656d7d1(localclientnum);
}

// Namespace player/player_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x5d2d833d, Offset: 0x4c0
// Size: 0xb4
function private function_8656d7d1(localclientnum) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    if (!isalive(player)) {
        return;
    }
    var_87e3f0d8 = function_27673a7(localclientnum);
    if (player.team !== var_87e3f0d8.team) {
        player function_e2d964e8();
        return;
    }
    player function_f71119e0(0);
}

// Namespace player/player_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x800aea6e, Offset: 0x580
// Size: 0x10c
function function_c98e67ae(localclientnum) {
    self notify("3ae575e255539f29");
    self endon("3ae575e255539f29");
    wait 10;
    while (true) {
        wait 0.2;
        players = getplayers(localclientnum);
        var_f3108b8 = function_5c10bd79(localclientnum);
        foreach (player in players) {
            if (player == var_f3108b8) {
                continue;
            }
            player function_9f517895(localclientnum);
        }
    }
}

// Namespace player/player_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x54ab5c92, Offset: 0x698
// Size: 0x104
function private function_9f517895(localclientnum) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    if (!isalive(player)) {
        return;
    }
    var_87e3f0d8 = function_27673a7(localclientnum);
    var_f3108b8 = function_5c10bd79(localclientnum);
    if (player.team !== var_87e3f0d8.team && !player isplayerswimmingunderwater() && !var_f3108b8 isplayerswimmingunderwater()) {
        player function_e2d964e8();
        return;
    }
    player function_f71119e0(0);
}

// Namespace player/player_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x8fa4cc8d, Offset: 0x7a8
// Size: 0x64
function private function_e2d964e8() {
    if (self.visionpulsereveal === 1) {
        return;
    }
    if (isdefined(level.var_20369084)) {
        self function_9535c165(level.var_20369084, "cold_blooded");
        return;
    }
    self function_bd70f43d();
}

// Namespace player/player_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x7cad9197, Offset: 0x818
// Size: 0x8c
function function_9535c165(var_2af183d0, clientfield) {
    if (self clientfield::get(clientfield) > 0) {
        self function_994b4121();
        self enable_rob(var_2af183d0);
        return;
    }
    self disable_rob(var_2af183d0);
    self function_bd70f43d();
}

// Namespace player/player_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x63efa6b2, Offset: 0x8b0
// Size: 0x1c
function function_f2ba057() {
    function_f71119e0(1);
}

// Namespace player/player_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x9932a564, Offset: 0x8d8
// Size: 0x64
function private function_f71119e0(var_c8db7193) {
    if (self.visionpulsereveal === 1) {
        return;
    }
    if (isdefined(level.var_20369084)) {
        self disable_rob(level.var_20369084);
    }
    self function_994b4121();
}

// Namespace player/player_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6f506ba1, Offset: 0x948
// Size: 0x3c
function enable_rob(var_6560376a) {
    if (!self function_d2503806(var_6560376a)) {
        self playrenderoverridebundle(var_6560376a);
    }
}

// Namespace player/player_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x48637069, Offset: 0x990
// Size: 0x3c
function disable_rob(var_6560376a) {
    if (self function_d2503806(var_6560376a)) {
        self stoprenderoverridebundle(var_6560376a);
    }
}

// Namespace player/player_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x9de69f4c, Offset: 0x9d8
// Size: 0x44
function private function_bd70f43d() {
    if (!self function_d2503806(#"rob_sonar_set_enemy")) {
        self playrenderoverridebundle(#"rob_sonar_set_enemy");
    }
}

// Namespace player/player_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x215926c4, Offset: 0xa28
// Size: 0x44
function private function_994b4121() {
    if (self function_d2503806(#"rob_sonar_set_enemy")) {
        self stoprenderoverridebundle(#"rob_sonar_set_enemy");
    }
}

// Namespace player/player_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xe90769e2, Offset: 0xa78
// Size: 0x122
function function_f9e445ee(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 0:
        setdepthoffield(localclientnum, 0, 0, 512, 512, 4, 0);
        break;
    case 1:
        setdepthoffield(localclientnum, 0, 0, 512, 4000, 4, 0);
        break;
    case 2:
        setdepthoffield(localclientnum, 0, 128, 512, 4000, 6, 1.8);
        break;
    default:
        break;
    }
}

