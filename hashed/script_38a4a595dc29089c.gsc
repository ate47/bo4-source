// Atian COD Tools GSC decompiler test
#include scripts/core_common/trigger_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/gestures.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace namespace_6a704b0d;

// Namespace namespace_6a704b0d/namespace_6a704b0d
// Params 0, eflags: 0x2
// Checksum 0x360dcaf9, Offset: 0x1e8
// Size: 0x34
function autoexec __init__system__() {
    system::register(#"hash_314807d153da7cd8", undefined, &function_8ac3bea9, undefined);
}

// Namespace namespace_6a704b0d/namespace_6a704b0d
// Params 0, eflags: 0x1 linked
// Checksum 0xbc69243c, Offset: 0x228
// Size: 0x24
function function_8ac3bea9() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace namespace_6a704b0d/namespace_6a704b0d
// Params 0, eflags: 0x1 linked
// Checksum 0xfb85a017, Offset: 0x258
// Size: 0x878
function on_game_playing() {
    elevators = getentarray("elevator", "script_noteworthy");
    foreach (elevator in elevators) {
        if (isdefined(elevator.script_string) && elevator.script_string != "elevator_button") {
            lights = getentarray(elevator.script_string, "targetname");
            array::run_all(lights, &linkto, elevator);
        }
        if (isdefined(elevator.moving_platform_enabled) && elevator.moving_platform_enabled) {
            elevator.align = elevator;
        }
        var_ff30d7f = struct::get_array(elevator.target);
        elevator.var_ba2a97bf = getnodearray(elevator.target, "targetname");
        elevator.gameobjects = [];
        foreach (interact in var_ff30d7f) {
            if (isdefined(interact.mdl_gameobject)) {
                var_6b437169 = struct::get(interact.target);
                interact.mdl_gameobject.var_6b437169 = var_6b437169;
                if (interact.script_noteworthy === "link_to") {
                    interact.mdl_gameobject.trigger enablelinkto();
                    interact.mdl_gameobject.trigger linkto(elevator);
                }
                if (!isdefined(elevator.gameobjects)) {
                    elevator.gameobjects = [];
                } else if (!isarray(elevator.gameobjects)) {
                    elevator.gameobjects = array(elevator.gameobjects);
                }
                elevator.gameobjects[elevator.gameobjects.size] = interact.mdl_gameobject;
            }
        }
        array::thread_all(elevator.gameobjects, &gameobjects::set_onuse_event, &function_65509998);
        parts = getentarray(elevator.target, "targetname");
        elevator.doors = [];
        foreach (part in parts) {
            if (part trigger::is_trigger_of_type("trigger_multiple", "trigger_multiple_new")) {
                part enablelinkto();
                part linkto(elevator);
                part callback::on_trigger(&function_339478f4);
                elevator.zone = part;
                continue;
            } else if (part.script_string === "elevator_button") {
                elevator.button = part;
                elevator.button delete();
                continue;
            }
            if (!isdefined(elevator.doors)) {
                elevator.doors = [];
            } else if (!isarray(elevator.doors)) {
                elevator.doors = array(elevator.doors);
            }
            elevator.doors[elevator.doors.size] = part;
        }
        foreach (door in elevator.doors) {
            door.var_856b91cc = struct::get(door.target);
            door.var_fcab61eb = struct::get(door.var_856b91cc.target);
            if (door.script_noteworthy !== "top" && door.script_noteworthy !== "bottom") {
                door linkto(elevator);
            }
        }
        foreach (gameobject in elevator.gameobjects) {
            gameobject.elevator = elevator;
            if (isdefined(gameobject.var_6b437169) && gameobject.var_6b437169.script_noteworthy === "bottom") {
                elevator.origin = gameobject.var_6b437169.origin;
                gameobject gameobjects::disable_object();
            }
        }
        waitframe(2);
        array::thread_all(elevator.doors, &open_door, "bottom");
        array::wait_any(elevator.doors, "movedone");
        foreach (node in elevator.var_ba2a97bf) {
            if (node.script_noteworthy == "bottom") {
                linktraversal(node);
            }
        }
        if (isdefined(elevator.align)) {
            elevator.align thread scene::play(#"hash_20bba52d7d060c5f", "down_idle");
        }
    }
}

// Namespace namespace_6a704b0d/namespace_6a704b0d
// Params 1, eflags: 0x1 linked
// Checksum 0x4cee5c7d, Offset: 0xad8
// Size: 0x4d0
function function_65509998(activator) {
    level endon(#"game_ended");
    elevator = self.elevator;
    doors = elevator.doors;
    var_6b437169 = self.var_6b437169;
    gameobjects = elevator.gameobjects;
    traverse = var_6b437169.traverse;
    shot = "down";
    if (var_6b437169.script_noteworthy == "top") {
        shot = "up";
    }
    self playsound("evt_elevator_button_bell");
    activator gestures::function_56e00fbf("gestable_door_interact", undefined, 0);
    array::thread_all(gameobjects, &gameobjects::disable_object);
    array::thread_all(doors, &function_b1005820, elevator, var_6b437169.script_noteworthy);
    foreach (node in elevator.var_ba2a97bf) {
        unlinktraversal(node);
    }
    array::wait_any(doors, "movedone");
    elevator playsound("evt_elevator_start");
    elevator playloopsound("evt_elevator_move", 0);
    elevator.align thread scene::play(#"hash_20bba52d7d060c5f", shot);
    elevator moveto(var_6b437169.origin, 1.25, 0.2, 0.2);
    elevator waittill(#"movedone");
    elevator.align thread scene::play(#"hash_20bba52d7d060c5f", shot + "_idle");
    elevator playsound("evt_elevator_button_bell");
    elevator playsound("evt_elevator_stop");
    elevator stoploopsound(1);
    array::thread_all(doors, &open_door, var_6b437169.script_noteworthy);
    array::wait_any(doors, "movedone");
    foreach (node in elevator.var_ba2a97bf) {
        if (node.script_noteworthy == var_6b437169.script_noteworthy) {
            linktraversal(node);
        }
    }
    wait(0);
    foreach (gameobject in gameobjects) {
        gameobject.e_object.origin = gameobject.origin;
        if (isdefined(gameobject.var_6b437169) && var_6b437169.script_noteworthy != gameobject.var_6b437169.script_noteworthy) {
            gameobject gameobjects::enable_object();
        }
    }
}

// Namespace namespace_6a704b0d/namespace_6a704b0d
// Params 1, eflags: 0x1 linked
// Checksum 0xba88714, Offset: 0xfb0
// Size: 0xfc
function open_door(location) {
    if (self.script_noteworthy != "elevator" && self.script_noteworthy != location) {
        return;
    }
    self.state = "opened";
    var_fcab61eb = self.var_fcab61eb;
    self unlink();
    self moveto((var_fcab61eb.origin[0], var_fcab61eb.origin[1], self.origin[2]), 0.37);
    self waittill(#"movedone", #"death");
    if (isdefined(self)) {
        self thread function_e0954c11();
    }
}

// Namespace namespace_6a704b0d/namespace_6a704b0d
// Params 1, eflags: 0x1 linked
// Checksum 0xee260efe, Offset: 0x10b8
// Size: 0xe4
function function_b1005820(elevator) {
    self.state = "closed";
    var_856b91cc = self.var_856b91cc;
    self moveto((var_856b91cc.origin[0], var_856b91cc.origin[1], self.origin[2]), 0.37);
    self waittill(#"movedone", #"death");
    if (isdefined(self)) {
        self thread function_e0954c11();
        if (self.script_noteworthy == "elevator") {
            self linkto(elevator);
        }
    }
}

// Namespace namespace_6a704b0d/namespace_6a704b0d
// Params 0, eflags: 0x1 linked
// Checksum 0xd9badae6, Offset: 0x11a8
// Size: 0xb0
function function_e0954c11() {
    if (!isdefined(self.var_7c9174d1)) {
        return;
    }
    foreach (var_221be278 in self.var_7c9174d1) {
        if (!isdefined(var_221be278)) {
            continue;
        }
        var_221be278 dodamage(500, self.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
    }
}

// Namespace namespace_6a704b0d/namespace_6a704b0d
// Params 1, eflags: 0x1 linked
// Checksum 0xb637039b, Offset: 0x1260
// Size: 0x64
function function_339478f4(var_ac6a7c34) {
    activator = var_ac6a7c34.activator;
    if (isalive(activator)) {
        activator dodamage(10000, activator.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
    }
}

