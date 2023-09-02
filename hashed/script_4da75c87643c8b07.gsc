// Atian COD Tools GSC decompiler test
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_3d0f1be7;

// Namespace namespace_3d0f1be7/namespace_3d0f1be7
// Params 0, eflags: 0x2
// Checksum 0x418e1c85, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_411c8f5d7f8749b9", &__init__, undefined, undefined);
}

// Namespace namespace_3d0f1be7/namespace_3d0f1be7
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x110
// Size: 0x4
function __init__() {
    
}

// Namespace namespace_3d0f1be7/event_9673dc9a
// Params 1, eflags: 0x40
// Checksum 0x3861cde1, Offset: 0x120
// Size: 0x8c
function event_handler[event_9673dc9a] function_3981d015(eventstruct) {
    if (eventstruct.ent.targetname === "blast_door") {
        if (eventstruct.state == 0) {
            eventstruct.ent thread function_feb37b9f("red");
        } else {
            eventstruct.ent thread function_feb37b9f("green");
        }
    }
}

// Namespace namespace_3d0f1be7/namespace_3d0f1be7
// Params 1, eflags: 0x1 linked
// Checksum 0x93d2bbcc, Offset: 0x1b8
// Size: 0x11a
function function_feb37b9f(color) {
    var_807d6589 = struct::get_array("blast_door_light", "targetname");
    foreach (s_light in var_807d6589) {
        var_7acac7ec = s_light.origin;
        if (isdefined(s_light.var_cb9d8af)) {
            stopfx(0, s_light.var_cb9d8af);
            s_light.var_cb9d8af = undefined;
        }
        s_light.var_cb9d8af = playfx(0, #"hash_787d9cfa8f97976a" + color, var_7acac7ec);
    }
}

