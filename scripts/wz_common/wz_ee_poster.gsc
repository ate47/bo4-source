// Atian COD Tools GSC decompiler test
#using scripts\wz_common\wz_ai_utils.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_cb32d07c95e5628;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace wz_ee_poster;

// Namespace wz_ee_poster/wz_ee_poster
// Params 0, eflags: 0x2
// Checksum 0x62125e01, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_ee_poster", &__init__, undefined, undefined);
}

// Namespace wz_ee_poster/wz_ee_poster
// Params 0, eflags: 0x2
// Checksum 0xe3202ab6, Offset: 0x130
// Size: 0x5a
function autoexec __init() {
    level.var_5805dc3b = isdefined(getgametypesetting(#"hash_5f842714fa80e5a9")) ? getgametypesetting(#"hash_5f842714fa80e5a9") : 0;
}

// Namespace wz_ee_poster/wz_ee_poster
// Params 0, eflags: 0x1 linked
// Checksum 0x4e8eaaae, Offset: 0x198
// Size: 0x1c
function __init__() {
    hidemiscmodels("poster_damaged");
}

// Namespace wz_ee_poster/grenade_fire
// Params 1, eflags: 0x44
// Checksum 0xec48a7b0, Offset: 0x1c0
// Size: 0x154
function event_handler[grenade_fire] private function_4776caf4(eventstruct) {
    if (level.inprematchperiod || !level.var_5805dc3b) {
        return;
    }
    poster_trigger = getent("poster_ee_trigger", "targetname");
    if (!isdefined(poster_trigger)) {
        return;
    } else if (sessionmodeiswarzonegame() && isplayer(self) && isalive(self) && isdefined(eventstruct) && isdefined(eventstruct.weapon) && isdefined(poster_trigger)) {
        if (isdefined(eventstruct.projectile)) {
            projectile = eventstruct.projectile;
            player_dist = distance(poster_trigger.origin, self.origin);
            if (player_dist < 5000) {
                projectile thread function_3383b382(self, poster_trigger);
            }
        }
    }
}

// Namespace wz_ee_poster/wz_ee_poster
// Params 2, eflags: 0x1 linked
// Checksum 0x2157cf14, Offset: 0x320
// Size: 0x224
function function_3383b382(player, poster_trigger) {
    if (!isdefined(player) || !isdefined(self) || !isdefined(poster_trigger)) {
        return;
    }
    level endon(#"game_ended");
    self endon(#"stationary");
    player endon(#"death");
    poster_trigger endon(#"death");
    var_bd332bd5 = 0;
    projectile_velocity = self getvelocity();
    if (!isdefined(projectile_velocity)) {
        return;
    }
    while (isdefined(self) && !var_bd332bd5 && abs(projectile_velocity[0]) > 0 && abs(projectile_velocity[1]) > 0) {
        projectile_velocity = self getvelocity();
        if (self istouching(poster_trigger)) {
            if (isdefined(poster_trigger.target)) {
                var_b721e8a9 = poster_trigger.target;
            }
            var_bd332bd5 = 1;
            break;
        }
        waitframe(1);
    }
    if (var_bd332bd5) {
        hidemiscmodels("poster_pristine");
        showmiscmodels("poster_damaged");
        playsoundatposition(#"hash_102a20c25b442146", poster_trigger.origin);
        if (isdefined(var_b721e8a9)) {
            poster_trigger function_79c8b708(var_b721e8a9);
        }
        poster_trigger delete();
    }
}

// Namespace wz_ee_poster/wz_ee_poster
// Params 1, eflags: 0x1 linked
// Checksum 0x4860f9e, Offset: 0x550
// Size: 0x110
function function_79c8b708(var_b721e8a9) {
    if (!isdefined(var_b721e8a9)) {
        return;
    }
    spawn_point = struct::get(var_b721e8a9, "targetname");
    if (isdefined(spawn_point)) {
        a_items = spawn_point namespace_65181344::function_fd87c780(#"zombie_poster_ee_list", 5);
        foreach (item in a_items) {
            if (isdefined(item)) {
                item thread function_7a1e21a9(spawn_point.origin);
            }
            waitframe(randomintrange(1, 3));
        }
    }
}

// Namespace wz_ee_poster/wz_ee_poster
// Params 1, eflags: 0x1 linked
// Checksum 0x6bcf0c59, Offset: 0x668
// Size: 0x11a
function function_7a1e21a9(v_loc) {
    self endon(#"death");
    self.origin = v_loc;
    self.angles = self.angles + (0, randomint(360), 0);
    trace = bullettrace(v_loc + vectorscale((0, 0, 1), 40), v_loc + vectorscale((0, 0, -1), 150), 0, undefined);
    if (trace[#"fraction"] < 1) {
        v_loc = trace[#"position"];
    }
    time = self wz_ai_utils::fake_physicslaunch(v_loc, 100);
    wait(time);
    if (isdefined(self)) {
        self.origin = v_loc;
    }
}

