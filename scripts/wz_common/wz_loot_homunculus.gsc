#using script_cb32d07c95e5628;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\item_world;
#using scripts\wz_common\wz_ai_utils;

#namespace wz_loot_homunculus;

// Namespace wz_loot_homunculus/wz_loot_homunculus
// Params 0, eflags: 0x2
// Checksum 0x78785f03, Offset: 0xf0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_loot_homunculus", &__init__, undefined, undefined);
}

// Namespace wz_loot_homunculus/wz_loot_homunculus
// Params 0, eflags: 0x0
// Checksum 0xdac47f84, Offset: 0x138
// Size: 0x1c
function __init__() {
    level thread function_eaeb557();
}

// Namespace wz_loot_homunculus/wz_loot_homunculus
// Params 0, eflags: 0x0
// Checksum 0x630680ca, Offset: 0x160
// Size: 0x378
function function_eaeb557() {
    level endon(#"game_ended");
    item_world::function_1b11e73c();
    zombie_apoc_homunculus = getdynent("zombie_apoc_homunculus");
    a_homunculi = array::randomize(getdynentarray("spring_event_homunculus"));
    b_enable = isdefined(getgametypesetting(#"hash_53b5887dea69a320")) && getgametypesetting(#"hash_53b5887dea69a320");
    if (isdefined(zombie_apoc_homunculus)) {
        setdynentstate(zombie_apoc_homunculus, 3);
    }
    foreach (e_homunculus in a_homunculi) {
        setdynentstate(e_homunculus, 3);
    }
    item_world::function_4de3ca98();
    if (isdefined(zombie_apoc_homunculus)) {
        if (isdefined(level.var_fdbdcdfd) && level.var_fdbdcdfd) {
            setdynentstate(zombie_apoc_homunculus, 1);
        } else {
            setdynentstate(zombie_apoc_homunculus, 3);
        }
    }
    n_active = 0;
    foreach (e_homunculus in a_homunculi) {
        if (b_enable && n_active < 5 && !(isdefined(e_homunculus.b_disabled) && e_homunculus.b_disabled)) {
            setdynentstate(e_homunculus, 1);
            n_active++;
            if (isdefined(e_homunculus.target)) {
                var_d4265274 = function_c79d31c4(e_homunculus.target);
                foreach (var_2ba94f3f in var_d4265274) {
                    if (var_2ba94f3f !== self) {
                        var_2ba94f3f.b_disabled = 1;
                    }
                }
            }
            continue;
        }
        setdynentstate(e_homunculus, 3);
    }
}

// Namespace wz_loot_homunculus/event_cf200f34
// Params 1, eflags: 0x44
// Checksum 0x4a2a30b8, Offset: 0x4e0
// Size: 0x2dc
function private event_handler[event_cf200f34] function_209450ae(eventstruct) {
    dynent = eventstruct.ent;
    if (dynent.targetname !== "spring_event_homunculus" && dynent.targetname !== "zombie_apoc_homunculus") {
        return;
    }
    dynent.health = 10000;
    if (!level flagsys::get(#"hash_507a4486c4a79f1d") || isdefined(dynent.var_1a909065) && dynent.var_1a909065) {
        return;
    }
    dynent.var_1a909065 = 1;
    var_7580ce3e = spawnstruct();
    var_7580ce3e.origin = dynent.origin + (0, 0, 32);
    setdynentstate(dynent, 2);
    wait 0.7;
    if (isdefined(dynent)) {
        setdynentstate(dynent, 3);
    }
    if (dynent.targetname == "spring_event_homunculus") {
        a_items = var_7580ce3e namespace_65181344::function_fd87c780(#"spring_event_homunculus_list", 5);
    } else {
        a_items = var_7580ce3e namespace_65181344::function_fd87c780(#"zombie_apoc_event_homunculus_list", 7);
    }
    foreach (item in a_items) {
        if (isdefined(item)) {
            item.origin = var_7580ce3e.origin;
        }
    }
    foreach (item in a_items) {
        if (isdefined(item)) {
            item thread function_7a1e21a9(var_7580ce3e.origin);
        }
        waitframe(randomintrange(1, 3));
    }
    var_7580ce3e struct::delete();
}

// Namespace wz_loot_homunculus/wz_loot_homunculus
// Params 1, eflags: 0x0
// Checksum 0x14ae0f16, Offset: 0x7c8
// Size: 0x1ca
function function_7a1e21a9(v_loc) {
    self endon(#"death");
    self.origin = v_loc;
    self.angles += (0, randomint(360), 0);
    n_x_offset = randomintrange(8, 32);
    n_y_offset = randomintrange(8, 32);
    if (math::cointoss(50)) {
        n_x_offset *= -1;
    }
    if (math::cointoss(50)) {
        n_y_offset *= -1;
    }
    v_loc += (n_x_offset, n_y_offset, 0);
    trace = bullettrace(v_loc + (0, 0, 40), v_loc + (0, 0, -150), 0, undefined);
    if (trace[#"fraction"] < 1) {
        v_loc = trace[#"position"];
    }
    time = self wz_ai_utils::fake_physicslaunch(v_loc, 100);
    wait time;
    if (isdefined(self)) {
        self.origin = v_loc;
    }
}

