// Atian COD Tools GSC decompiler test
#using scripts\core_common\struct.gsc;
#using script_cb32d07c95e5628;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\mp_common\item_world.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_21c59b5;

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x2
// Checksum 0x371a07ac, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_18ce058ad321248f", &__init__, undefined, undefined);
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x2
// Checksum 0x86f13cc5, Offset: 0x158
// Size: 0x1fe
function autoexec __init() {
    level.var_c30abd0d = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_3a3855c443fb705a")) ? getgametypesetting(#"hash_3a3855c443fb705a") : 0);
    level.var_69167fa4 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_68f4f3fd681ae3ea")) ? getgametypesetting(#"hash_68f4f3fd681ae3ea") : 0);
    level.var_30c7dc14 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_6c72667787a1fcc9")) ? getgametypesetting(#"hash_6c72667787a1fcc9") : 0);
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0x60f43856, Offset: 0x360
// Size: 0x4c
function __init__() {
    level thread function_82141ae4();
    level thread function_920f9a6();
    level thread function_624de77b();
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0xbf2948d0, Offset: 0x3b8
// Size: 0x2fa
function function_624de77b() {
    if (!level.var_30c7dc14) {
        var_3382b1fd = getdynentarray(#"hash_65a897c4ba6cd264");
        var_dee87f84 = getdynentarray(#"hash_1418b0814d35f392");
        item_world::function_1b11e73c();
        foreach (var_24f3a953 in var_3382b1fd) {
            function_e2a06860(var_24f3a953, 2);
        }
        foreach (var_8f38aad5 in var_dee87f84) {
            function_e2a06860(var_8f38aad5, 1);
        }
        item_world::function_4de3ca98();
        foreach (var_24f3a953 in var_3382b1fd) {
            function_e2a06860(var_24f3a953, 2);
        }
        foreach (var_8f38aad5 in var_dee87f84) {
            function_e2a06860(var_8f38aad5, 1);
        }
    } else {
        var_3382b1fd = getdynentarray(#"hash_65a897c4ba6cd264");
        foreach (var_24f3a953 in var_3382b1fd) {
            var_24f3a953.onuse = &function_a25e43f9;
        }
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0xe9baadb8, Offset: 0x6c0
// Size: 0x158
function function_920f9a6() {
    if (!level.var_69167fa4) {
        pianos = getdynentarray(#"buried_piano");
        item_world::function_1b11e73c();
        foreach (piano in pianos) {
            function_e2a06860(piano, 3);
        }
        item_world::function_4de3ca98();
        foreach (piano in pianos) {
            function_e2a06860(piano, 3);
        }
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0xda9cf11d, Offset: 0x820
// Size: 0x1ea
function function_82141ae4() {
    if (!level.var_c30abd0d) {
        var_fff29b0e = getdynentarray(#"t_switch");
        item_world::function_1b11e73c();
        foreach (var_93696d49 in var_fff29b0e) {
            function_e2a06860(var_93696d49, 2);
        }
        item_world::function_4de3ca98();
        foreach (var_93696d49 in var_fff29b0e) {
            function_e2a06860(var_93696d49, 2);
        }
    } else {
        var_fff29b0e = getdynentarray(#"t_switch");
        foreach (var_93696d49 in var_fff29b0e) {
            var_93696d49.onuse = &function_62ef723;
        }
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0x93421e8d, Offset: 0xa18
// Size: 0x5c
function function_63f86aa3() {
    if (!(isdefined(self.var_66ac39f3) && self.var_66ac39f3)) {
        self.var_66ac39f3 = 1;
        function_e2a06860(self, 2);
        self thread function_dabe7910();
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0x6141e47f, Offset: 0xa80
// Size: 0xa8
function function_a9f512c2() {
    var_dee87f84 = getdynentarray(#"hash_1418b0814d35f392");
    foreach (var_8f38aad5 in var_dee87f84) {
        function_e2a06860(var_8f38aad5, 1);
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0x67e8e0bd, Offset: 0xb30
// Size: 0x64
function function_dabe7910() {
    self notify("2a2995dfcd2ea5d3");
    self endon("2a2995dfcd2ea5d3");
    level endon(#"game_ended");
    self endon(#"death");
    wait(104);
    function_e2a06860(self, 0);
}

// Namespace namespace_21c59b5/grenade_fire
// Params 1, eflags: 0x44
// Checksum 0xeedbc2d1, Offset: 0xba0
// Size: 0x16c
function private event_handler[grenade_fire] function_4776caf4(eventstruct) {
    if (level.inprematchperiod) {
        return;
    }
    if (sessionmodeiswarzonegame() && isplayer(self) && isalive(self) && isdefined(eventstruct) && isdefined(eventstruct.weapon)) {
        if (eventstruct.weapon.name === #"hatchet") {
            if (isdefined(eventstruct.projectile)) {
                hatchet = eventstruct.projectile;
                dartboard = getdynent(#"buried_dartboard");
                if (isdefined(dartboard)) {
                    player_dist = distance(dartboard.origin, self.origin);
                    if (player_dist > 200 && player_dist < 5000) {
                        hatchet thread function_34f4460b(self);
                    }
                }
            }
        }
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 1, eflags: 0x1 linked
// Checksum 0x3c69623d, Offset: 0xd18
// Size: 0x2c4
function function_34f4460b(player) {
    if (!isdefined(player) || !isdefined(self)) {
        return;
    }
    level endon(#"game_ended");
    self endon(#"stationary", #"death");
    player endon(#"disconnect", #"death");
    var_3df14205 = getentarray("trigger_buried_dartboard_bullseye", "targetname");
    if (!isdefined(var_3df14205)) {
        return;
    }
    var_25d0b13d = 0;
    var_e5823d2 = self getvelocity();
    if (!isdefined(var_e5823d2)) {
        return;
    }
    while (!var_25d0b13d && abs(var_e5823d2[0]) > 0 && abs(var_e5823d2[1]) > 0) {
        var_e5823d2 = self getvelocity();
        foreach (dartboard in var_3df14205) {
            if (self istouching(dartboard)) {
                if (isdefined(dartboard.target)) {
                    var_e9320407 = dartboard.target;
                }
                var_25d0b13d = 1;
                break;
            }
        }
        waitframe(1);
    }
    if (var_25d0b13d) {
        if (isdefined(var_e9320407)) {
            pianos = getdynentarray(var_e9320407);
            foreach (piano in pianos) {
                piano function_63f86aa3();
            }
        }
        function_a9f512c2();
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0xa576079, Offset: 0xfe8
// Size: 0xe6
function function_55b32a83() {
    if (isdefined(self.target)) {
        spawn_pos = struct::get(self.target, "targetname");
    }
    if (isdefined(spawn_pos)) {
        items = self namespace_65181344::function_fd87c780("zombie_raygun_mk2_itemlist", 1);
        for (i = 0; i < items.size; i++) {
            item = items[i];
            if (isdefined(item)) {
                item.origin = spawn_pos.origin;
                item.angles = spawn_pos.angles;
            }
            waitframe(1);
        }
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 3, eflags: 0x1 linked
// Checksum 0xbd068c13, Offset: 0x10d8
// Size: 0x6c
function function_a25e43f9(activator, laststate, state) {
    if (!(isdefined(level.var_30c7dc14) && level.var_30c7dc14)) {
        return;
    }
    if (isplayer(activator)) {
        self function_55b32a83();
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 3, eflags: 0x1 linked
// Checksum 0x569292ad, Offset: 0x1150
// Size: 0x17c
function function_62ef723(activator, laststate, state) {
    if (!(isdefined(level.var_c30abd0d) && level.var_c30abd0d)) {
        return;
    }
    if (isdefined(self.var_7dee147e) && self.var_7dee147e) {
        return;
    }
    if (isplayer(activator)) {
        dot = vectordot(anglestoforward(activator.angles), anglestoforward(self.angles));
        distance = distance2d(activator.origin, self.origin);
        if (dot < -0.8 && distance < 24) {
            self.var_7dee147e = 1;
            activator function_c6775cf9("boast_tambour_tribute");
            activator stats::function_d40764f3(#"hash_3075cc4b65fc7e0", 1);
            level thread function_274ee8b5(self, activator);
        }
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 2, eflags: 0x1 linked
// Checksum 0x486591e6, Offset: 0x12d8
// Size: 0x8e
function function_274ee8b5(dynent, var_8a50fb55) {
    level endon(#"game_ended");
    while (isdefined(var_8a50fb55) && isalive(var_8a50fb55) && !var_8a50fb55 inlaststand() && var_8a50fb55 function_15049d95()) {
        waitframe(1);
    }
    dynent.var_7dee147e = 0;
}

