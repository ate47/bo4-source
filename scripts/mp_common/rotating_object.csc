#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;

#namespace rotating_object;

// Namespace rotating_object/rotating_object
// Params 0, eflags: 0x2
// Checksum 0x4ff8bcb0, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"rotating_object", &__init__, undefined, undefined);
}

// Namespace rotating_object/rotating_object
// Params 0, eflags: 0x0
// Checksum 0x647e233b, Offset: 0xf8
// Size: 0x24
function __init__() {
    callback::on_localclient_connect(&init);
}

// Namespace rotating_object/rotating_object
// Params 1, eflags: 0x0
// Checksum 0xd1b7a9, Offset: 0x128
// Size: 0x5c
function init(localclientnum) {
    rotating_objects = getentarray(localclientnum, "rotating_object", "targetname");
    array::thread_all(rotating_objects, &rotating_object_think);
}

// Namespace rotating_object/rotating_object
// Params 0, eflags: 0x0
// Checksum 0x98a39874, Offset: 0x190
// Size: 0x212
function rotating_object_think() {
    self endon(#"death");
    util::waitforallclients();
    util::function_89a98f85();
    axis = "yaw";
    direction = 360;
    revolutions = 100;
    rotate_time = 12;
    if (isdefined(self.script_noteworthy)) {
        axis = self.script_noteworthy;
    }
    if (isdefined(self.script_float)) {
        rotate_time = self.script_float;
    }
    if (rotate_time == 0) {
        rotate_time = 12;
    }
    if (rotate_time < 0) {
        direction *= -1;
        rotate_time *= -1;
    }
    if (isdefined(self.angles)) {
        angles = self.angles;
    } else {
        angles = (0, 0, 0);
    }
    while (true) {
        switch (axis) {
        case #"roll":
            self rotateroll(direction * revolutions, rotate_time * revolutions);
            break;
        case #"pitch":
            self rotatepitch(direction * revolutions, rotate_time * revolutions);
            break;
        case #"yaw":
        default:
            self rotateyaw(direction * revolutions, rotate_time * revolutions);
            break;
        }
        self waittill(#"rotatedone");
        self.angles = angles;
    }
}

