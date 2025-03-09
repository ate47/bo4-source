#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\trigger_shared;

#namespace mp_maldives_elevators;

// Namespace mp_maldives_elevators/mp_maldives_elevators
// Params 0, eflags: 0x2
// Checksum 0x360dcaf9, Offset: 0x1e8
// Size: 0x34
function autoexec __init__system__() {
    system::register(#"mp_maldives_elevators", undefined, &postinit, undefined);
}

// Namespace mp_maldives_elevators/mp_maldives_elevators
// Params 0, eflags: 0x0
// Checksum 0xbc69243c, Offset: 0x228
// Size: 0x24
function postinit() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_maldives_elevators/mp_maldives_elevators
// Params 0, eflags: 0x0
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
        elevator.traversals = getnodearray(elevator.target, "targetname");
        elevator.gameobjects = [];
        foreach (interact in var_ff30d7f) {
            if (isdefined(interact.mdl_gameobject)) {
                move_to = struct::get(interact.target);
                interact.mdl_gameobject.move_to = move_to;
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
            door.open_to = struct::get(door.var_856b91cc.target);
            if (door.script_noteworthy !== "top" && door.script_noteworthy !== "bottom") {
                door linkto(elevator);
            }
        }
        foreach (gameobject in elevator.gameobjects) {
            gameobject.elevator = elevator;
            if (isdefined(gameobject.move_to) && gameobject.move_to.script_noteworthy === "bottom") {
                elevator.origin = gameobject.move_to.origin;
                gameobject gameobjects::disable_object();
            }
        }
        waitframe(2);
        array::thread_all(elevator.doors, &open_door, "bottom");
        array::wait_any(elevator.doors, "movedone");
        foreach (node in elevator.traversals) {
            if (node.script_noteworthy == "bottom") {
                linktraversal(node);
            }
        }
        if (isdefined(elevator.align)) {
            elevator.align thread scene::play(#"p8_fxanim_mal_elevator_car_bundle", "down_idle");
        }
    }
}

// Namespace mp_maldives_elevators/mp_maldives_elevators
// Params 1, eflags: 0x0
// Checksum 0x4cee5c7d, Offset: 0xad8
// Size: 0x4d0
function function_65509998(activator) {
    level endon(#"game_ended");
    elevator = self.elevator;
    doors = elevator.doors;
    move_to = self.move_to;
    gameobjects = elevator.gameobjects;
    traverse = move_to.traverse;
    shot = "down";
    if (move_to.script_noteworthy == "top") {
        shot = "up";
    }
    self playsound("evt_elevator_button_bell");
    activator gestures::function_56e00fbf("gestable_door_interact", undefined, 0);
    array::thread_all(gameobjects, &gameobjects::disable_object);
    array::thread_all(doors, &close_door, elevator, move_to.script_noteworthy);
    foreach (node in elevator.traversals) {
        unlinktraversal(node);
    }
    array::wait_any(doors, "movedone");
    elevator playsound("evt_elevator_start");
    elevator playloopsound("evt_elevator_move", 0);
    elevator.align thread scene::play(#"p8_fxanim_mal_elevator_car_bundle", shot);
    elevator moveto(move_to.origin, 1.25, 0.2, 0.2);
    elevator waittill(#"movedone");
    elevator.align thread scene::play(#"p8_fxanim_mal_elevator_car_bundle", shot + "_idle");
    elevator playsound("evt_elevator_button_bell");
    elevator playsound("evt_elevator_stop");
    elevator stoploopsound(1);
    array::thread_all(doors, &open_door, move_to.script_noteworthy);
    array::wait_any(doors, "movedone");
    foreach (node in elevator.traversals) {
        if (node.script_noteworthy == move_to.script_noteworthy) {
            linktraversal(node);
        }
    }
    wait 0;
    foreach (gameobject in gameobjects) {
        gameobject.e_object.origin = gameobject.origin;
        if (isdefined(gameobject.move_to) && move_to.script_noteworthy != gameobject.move_to.script_noteworthy) {
            gameobject gameobjects::enable_object();
        }
    }
}

// Namespace mp_maldives_elevators/mp_maldives_elevators
// Params 1, eflags: 0x0
// Checksum 0xba88714, Offset: 0xfb0
// Size: 0xfc
function open_door(location) {
    if (self.script_noteworthy != "elevator" && self.script_noteworthy != location) {
        return;
    }
    self.state = "opened";
    open_to = self.open_to;
    self unlink();
    self moveto((open_to.origin[0], open_to.origin[1], self.origin[2]), 0.37);
    self waittill(#"movedone", #"death");
    if (isdefined(self)) {
        self thread function_e0954c11();
    }
}

// Namespace mp_maldives_elevators/mp_maldives_elevators
// Params 1, eflags: 0x0
// Checksum 0xee260efe, Offset: 0x10b8
// Size: 0xe4
function close_door(elevator) {
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

// Namespace mp_maldives_elevators/mp_maldives_elevators
// Params 0, eflags: 0x0
// Checksum 0xd9badae6, Offset: 0x11a8
// Size: 0xb0
function function_e0954c11() {
    if (!isdefined(self.stuck_items)) {
        return;
    }
    foreach (var_221be278 in self.stuck_items) {
        if (!isdefined(var_221be278)) {
            continue;
        }
        var_221be278 dodamage(500, self.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
    }
}

// Namespace mp_maldives_elevators/mp_maldives_elevators
// Params 1, eflags: 0x0
// Checksum 0xb637039b, Offset: 0x1260
// Size: 0x64
function function_339478f4(var_ac6a7c34) {
    activator = var_ac6a7c34.activator;
    if (isalive(activator)) {
        activator dodamage(10000, activator.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
    }
}

