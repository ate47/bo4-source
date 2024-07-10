#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_3b9dec72;

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x2
// Checksum 0x87e32590, Offset: 0x120
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_56850a719f90825a", &__init__, &__main__, undefined);
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x1 linked
// Checksum 0x913066d5, Offset: 0x170
// Size: 0x104
function __init__() {
    spawner::add_archetype_spawn_function(#"civilian", &function_e5ba4473);
    assert(isscriptfunctionptr(&function_b4b7cd20));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"ispablo", &function_b4b7cd20);
    /#
        zm_devgui::function_c7dd7a17("<dev string:x38>");
        adddebugcommand("<dev string:x43>");
        adddebugcommand("<dev string:x73>");
    #/
    level thread function_2165e851();
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x280
// Size: 0x4
function __main__() {
    
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x4
// Checksum 0xca040dd4, Offset: 0x290
// Size: 0xa0
function private function_4d231aa() {
    self endon(#"death");
    while (true) {
        wait(3);
        self setblackboardattribute("_stance", "crouch");
        wait(3);
        self setblackboardattribute("_stance", "stand");
        wait(3);
        self setblackboardattribute("_stance", "swim");
    }
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x5 linked
// Checksum 0xa61393ce, Offset: 0x338
// Size: 0x12c
function private function_e5ba4473() {
    self.goalradius = 15;
    self.pushable = 0;
    self collidewithactors(0);
    self setavoidancemask("avoid none");
    if (self.aitype == "spawner_zm_pablo") {
        self.var_f6f10811 = 1;
    } else {
        if (!isdefined(level.var_8a8728c6)) {
            level.var_8a8728c6 = [];
        }
        level.var_8a8728c6[level.var_8a8728c6.size] = self;
        if (self.aitype == "spawner_zm_samantha") {
            self setblackboardattribute("_stance", "stand");
        } else {
            self setblackboardattribute("_stance", "crouch");
        }
    }
    /#
        self thread function_b7f08e2d();
    #/
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x1 linked
// Checksum 0x12f5c737, Offset: 0x470
// Size: 0xfc
function function_1c989dc4() {
    if (isdefined(level.var_8a8728c6) && level.var_8a8728c6.size >= 2) {
        samantha = level.var_8a8728c6[0];
        eddie = level.var_8a8728c6[1];
        samantha.pushable = 0;
        eddie.pushable = 0;
        var_e625df22 = anglestoforward(samantha.angles);
        samantha_right = vectorcross((0, 0, 1), var_e625df22) * -1;
        eddie forceteleport(samantha.origin + samantha_right * 25, samantha.angles);
    }
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x4
// Checksum 0x7ab27e91, Offset: 0x578
// Size: 0xf0
function private function_b7f08e2d() {
    self endon(#"death");
    while (true) {
        waitframe(1);
        enabled = getdvarint(#"hash_6ba94f3ad6709984", 0);
        if (enabled) {
            end = self getcentroid();
            goalinfo = self function_4794d6a3();
            if (isdefined(goalinfo.goalpos)) {
                /#
                    sphere(goalinfo.goalpos, 5, (0, 1, 0), 0.5, 0, 8, 1);
                #/
            }
        }
    }
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 1, eflags: 0x5 linked
// Checksum 0xf5619027, Offset: 0x670
// Size: 0xb4
function private function_dca53f1f(player_index) {
    var_9a149315 = (0, 0, 0);
    if (isdefined(level.var_8a8728c6)) {
        samantha = level.var_8a8728c6[0];
        var_b8e7e5da = (-100, -12.5, 0) + (-5, 0, 0) * player_index;
        var_9a149315 = samantha.origin + rotatepointaroundaxis(var_b8e7e5da, (0, 0, 1), samantha.angles[1]);
    }
    return var_9a149315;
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x1 linked
// Checksum 0x56efafb3, Offset: 0x730
// Size: 0x256
function function_303ab700() {
    players = getplayers();
    player_index = 0;
    if (players.size > 0 && isdefined(level.var_8a8728c6) && isdefined(level.var_8a8728c6[0])) {
        foreach (player in players) {
            if (isdefined(player)) {
                var_16a2c824 = player function_dca53f1f(player_index);
                samantha = level.var_8a8728c6[0];
                println("<dev string:xc0>");
                player.var_fa2d1151 = spawn("script_model", var_16a2c824);
                player.var_fa2d1151.angles = samantha.angles;
                wait(1);
                if (isdefined(player) && isdefined(player.var_fa2d1151)) {
                    player dontinterpolate();
                    player setorigin(var_16a2c824);
                    player setplayerangles(samantha.angles);
                    waitframe(1);
                    println("<dev string:xe6>" + player.name + "<dev string:x106>");
                    function_8e56bb21(player, player.var_fa2d1151, var_16a2c824, samantha.angles);
                    wait(1);
                }
                player_index++;
            }
        }
        level.var_41c80f7d = 1;
    }
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 4, eflags: 0x1 linked
// Checksum 0x32bfd2b5, Offset: 0x990
// Size: 0x84
function function_8e56bb21(player, script_model, origin, angles) {
    player setorigin(origin);
    player setplayerangles(angles);
    player playerlinktodelta(script_model, undefined, 0, 30, 30, 15, 15);
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x1 linked
// Checksum 0x77b3ce52, Offset: 0xa20
// Size: 0x12
function function_10add6a8() {
    level.var_41c80f7d = 0;
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 1, eflags: 0x1 linked
// Checksum 0x6b454820, Offset: 0xa40
// Size: 0xe8
function function_ddbe2dbb(distance) {
    foreach (npc in level.var_8a8728c6) {
        var_a04c5e3b = anglestoforward(npc.angles);
        npc.var_9a149315 = npc.origin + anglestoforward(npc.angles) * distance;
        npc setgoal(npc.var_9a149315);
    }
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x4
// Checksum 0x1807de97, Offset: 0xb30
// Size: 0x9e
function private function_ae4d6b1b() {
    players = getplayers();
    foreach (player in players) {
        player unlink();
    }
    level.var_41c80f7d = 0;
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 0, eflags: 0x5 linked
// Checksum 0xd30cd59c, Offset: 0xbd8
// Size: 0x302
function private function_2165e851() {
    level endon(#"end_game");
    while (true) {
        waitframe(1);
        players = getplayers();
        if (players.size > 0 && isdefined(level.var_8a8728c6) && isdefined(level.var_41c80f7d) && level.var_41c80f7d) {
            var_2e35e6c1 = 0;
            foreach (player in players) {
                v_movement = player getnormalizedmovement();
                if (v_movement[0] > 0.5) {
                    var_2e35e6c1 = 1;
                    break;
                }
            }
            foreach (npc in level.var_8a8728c6) {
                if (var_2e35e6c1) {
                    var_a04c5e3b = anglestoforward(npc.angles);
                    npc.var_9a149315 = npc.origin + anglestoforward(npc.angles) * 100;
                    npc setgoal(npc.var_9a149315);
                    continue;
                }
                npc setgoal(npc.origin);
            }
            player_index = 0;
            foreach (player in players) {
                if (isdefined(player.var_fa2d1151)) {
                    var_9a149315 = player function_dca53f1f(player_index);
                    player.var_fa2d1151 moveto(var_9a149315, 0.15);
                }
                player_index++;
            }
        }
    }
}

// Namespace namespace_3b9dec72/namespace_3b9dec72
// Params 1, eflags: 0x5 linked
// Checksum 0xd7e88e29, Offset: 0xee8
// Size: 0x48
function private function_b4b7cd20(entity) {
    result = 0;
    if (isdefined(entity.var_f6f10811) && entity.var_f6f10811) {
        result = 1;
    }
    return result;
}

