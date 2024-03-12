// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\player_insertion.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace bot_insertion;

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x2
// Checksum 0x18e12932, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bot_insertion", &__init__, undefined, undefined);
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x0
// Checksum 0x55a6953f, Offset: 0xf0
// Size: 0x34
function __init__() {
    callback::add_callback(#"freefall", &function_c9a18304);
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x4
// Checksum 0x31dad41a, Offset: 0x130
// Size: 0xf8
function private function_b7de760d() {
    foreach (insertion in level.insertions) {
        player_insertion::function_a5fd9aa8(insertion);
        foreach (player in insertion.players) {
            if (player == self) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x4
// Checksum 0xa8bd51cf, Offset: 0x230
// Size: 0xd4
function private function_58a44f22() {
    teammates = getplayers(self.team);
    foreach (player in teammates) {
        if (isplayer(player) && !isbot(player) && player function_b7de760d()) {
            return 1;
        }
    }
    return 0;
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x4
// Checksum 0x816c810d, Offset: 0x310
// Size: 0xd4
function private function_9ea8f9d6() {
    teammates = getplayers(self.team);
    foreach (player in teammates) {
        if (isplayer(player) && !isbot(player) && player function_b7de760d()) {
            return player;
        }
    }
    return undefined;
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x0
// Checksum 0xa241d258, Offset: 0x3f0
// Size: 0x1a4
function function_a4f516ef() {
    self endon(#"death", #"disconnect");
    /#
        if (getdvarint(#"scr_disable_infiltration", 0)) {
            return;
        }
    #/
    if (!self flagsys::get(#"hash_287397edba8966f9")) {
        var_f9664338 = [1:#"hash_224cb97b8f682317", 0:#"hash_287397edba8966f9"];
        self flagsys::wait_till_any(var_f9664338);
    }
    if (function_58a44f22()) {
        waitresult = undefined;
        waitresult = self waittill(#"hash_3a41cbe85bdb81e1", #"hash_224cb97b8f682317");
        if (waitresult._notify != #"hash_224cb97b8f682317") {
            self flagsys::wait_till_timeout(function_8ed212d(), #"hash_224cb97b8f682317");
        }
        return;
    }
    /#
        assert(isdefined(self.var_33a2e995));
    #/
    self flagsys::wait_till_timeout(self.var_33a2e995, #"hash_224cb97b8f682317");
}

// Namespace bot_insertion/bot_insertion
// Params 1, eflags: 0x0
// Checksum 0xd902e9a, Offset: 0x5a0
// Size: 0x44
function function_2ed2a1bb(max) {
    random = randomfloat(1);
    return random * random * random * max;
}

// Namespace bot_insertion/bot_insertion
// Params 1, eflags: 0x0
// Checksum 0xb2d175bc, Offset: 0x5f0
// Size: 0x22
function function_9526ce62(max) {
    return function_2ed2a1bb(max);
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x0
// Checksum 0xe81aa300, Offset: 0x620
// Size: 0x24
function function_8ed212d() {
    return 1 + function_2ed2a1bb(3);
}

// Namespace bot_insertion/bot_insertion
// Params 1, eflags: 0x0
// Checksum 0xbf32f833, Offset: 0x650
// Size: 0x326
function function_24ca8ecf(insertion) {
    /#
        assert(isstruct(insertion));
    #/
    bots = [];
    foreach (player in insertion.players) {
        if (isbot(player)) {
            if (!isdefined(bots[player.team])) {
                bots[player.team] = [];
            }
            if (!isdefined(bots[player.team])) {
                bots[player.team] = [];
            } else if (!isarray(bots[player.team])) {
                bots[player.team] = array(bots[player.team]);
            }
            bots[player.team][bots[player.team].size] = player;
        }
    }
    if (!isdefined(insertion.start_point) || !isdefined(insertion.end_point)) {
        return;
    }
    distance = distance2d(insertion.start_point, insertion.end_point);
    var_5d59bc67 = 2640;
    var_ef4bfcd8 = distance / var_5d59bc67;
    foreach (team in bots) {
        var_28cd9792 = function_9526ce62(var_ef4bfcd8);
        foreach (bot in team) {
            bot.var_33a2e995 = var_28cd9792 + function_8ed212d();
        }
    }
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x0
// Checksum 0xab291806, Offset: 0x980
// Size: 0x32
function function_d7ba3d0b() {
    self thread function_39c5371e();
    return function_9526ce62(5);
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x0
// Checksum 0x73e37188, Offset: 0x9c0
// Size: 0x1c
function function_9699dc95() {
    self thread function_39c5371e();
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x9e8
// Size: 0x4
function function_39c5371e() {
    
}

// Namespace bot_insertion/bot_insertion
// Params 0, eflags: 0x4
// Checksum 0xcd1e4fd5, Offset: 0x9f8
// Size: 0xaa
function private function_8f2f3bcd() {
    center = (0, 0, 0);
    radius = 0;
    if (isdefined(level.deathcircle)) {
        center = level.deathcircle.origin;
        radius = level.deathcircle.radius * 0.75;
    }
    goal = center + anglestoforward((0, randomint(360), 0)) * radius;
    return goal;
}

// Namespace bot_insertion/bot_insertion
// Params 2, eflags: 0x0
// Checksum 0xac0d3b02, Offset: 0xab0
// Size: 0xc4
function function_d26744ff(target_point, lead_player) {
    direction = vectornormalize(target_point - self.origin);
    goal_angles = vectortoangles(direction);
    if (goal_angles[0] < 45) {
        distance = distance(target_point, self.origin);
        if (distance > 20000) {
            goal_angles = (0, goal_angles[1], 0);
        }
    }
    return goal_angles;
}

// Namespace bot_insertion/bot_insertion
// Params 2, eflags: 0x0
// Checksum 0xb8ce5f8e, Offset: 0xb80
// Size: 0x8e
function function_233a1027(target_point, lead_player) {
    if (!isplayer(lead_player)) {
        return (0, 0, 0);
    }
    if (lead_player isonground()) {
        return self function_d26744ff(lead_player.origin, lead_player);
    }
    goal_angles = lead_player.angles;
    return goal_angles;
}

// Namespace bot_insertion/bot_insertion
// Params 3, eflags: 0x0
// Checksum 0x1356fc0f, Offset: 0xc18
// Size: 0x1d8
function function_13ba9cec(target_point, lead_player, var_282c0a8e) {
    /#
        assert(isdefined(var_282c0a8e));
    #/
    if (self isonground()) {
        return 0;
    }
    goal_angles = [[ var_282c0a8e ]](target_point, lead_player);
    var_8fbb46cd = vectornormalize(self getvelocity());
    var_e0db94ca = vectortoangles(var_8fbb46cd);
    angle_delta = goal_angles - var_e0db94ca;
    var_ce2f4ce0 = function_dac81c9a(angleclamp180(angle_delta[0]));
    angle_yaw = function_dac81c9a(angleclamp180(angle_delta[1]));
    angles = var_e0db94ca + (var_ce2f4ce0, angle_yaw, 0);
    angles = (angleclamp180(angles[0]), angleclamp180(angles[1]), 0);
    self botsetmoveangles(angles);
    self botsetlookangles(angles);
    return 1;
}

// Namespace bot_insertion/bot_insertion
// Params 1, eflags: 0x0
// Checksum 0xf7cb0de4, Offset: 0xdf8
// Size: 0x244
function function_c9a18304(params) {
    if (!isbot(self)) {
        return;
    }
    if (params.freefall === 1) {
        self notify("262092a28e60152c");
        self endon("262092a28e60152c");
        self endon(#"death", #"disconnect");
        waitframe(1);
        self botsetmovemagnitude(1);
        target_point = function_8f2f3bcd();
        direction = vectornormalize(target_point - self.origin);
        angles = vectortoangles(direction);
        angles = (90, angles[1], 0);
        self botsetmoveangles(angles);
        self botsetlookangles(angles);
        while (1) {
            if (length(self getvelocity()) * 0.0568182 > 110) {
                break;
            }
            wait(1);
        }
        var_26a66f9d = &function_d26744ff;
        var_2706b530 = function_9ea8f9d6();
        if (isdefined(var_2706b530)) {
            var_26a66f9d = &function_233a1027;
        }
        while (1) {
            if (!self function_13ba9cec(target_point, var_2706b530, var_26a66f9d)) {
                return;
            }
            waitframe(1);
        }
        return;
    }
    self botsetmovemagnitude(0);
}

// Namespace bot_insertion/bot_insertion
// Params 1, eflags: 0x4
// Checksum 0x402270fa, Offset: 0x1048
// Size: 0x92
function private function_dac81c9a(angle_delta) {
    max_delta = getdvarint(#"hash_11e45cd7d81b76c", 30);
    if (angle_delta > 0) {
        return math::clamp(max_delta, angle_delta * -1, angle_delta);
    }
    return math::clamp(max_delta * -1, angle_delta, angle_delta * -1);
}

