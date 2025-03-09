#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\mp_common\item_world;

#namespace wz_asylum;

// Namespace wz_asylum/wz_asylum
// Params 0, eflags: 0x2
// Checksum 0x3596f41c, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_asylum", &__init__, undefined, undefined);
}

// Namespace wz_asylum/wz_asylum
// Params 0, eflags: 0x2
// Checksum 0x8ed598e5, Offset: 0x110
// Size: 0x102
function autoexec __init() {
    level.var_7ad3f6a0 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_6382d9dfeaeaa0f3")) ? getgametypesetting(#"hash_6382d9dfeaeaa0f3") : 0);
    level.var_afa44b2d = isdefined(getgametypesetting(#"hash_7d5d04df4914095e")) ? getgametypesetting(#"hash_7d5d04df4914095e") : 0;
}

// Namespace wz_asylum/wz_asylum
// Params 0, eflags: 0x0
// Checksum 0x3ce1b2fa, Offset: 0x220
// Size: 0x4c
function __init__() {
    clientfield::register("world", "toilet_ee_play", 19000, 2, "int");
    level thread function_6e7c4665();
}

// Namespace wz_asylum/wz_asylum
// Params 0, eflags: 0x0
// Checksum 0x2665d34, Offset: 0x278
// Size: 0x150
function function_6e7c4665() {
    if (!level.var_7ad3f6a0) {
        var_8294540 = getdynentarray("asylum_toilet");
        item_world::function_1b11e73c();
        foreach (var_2eb2cfa9 in var_8294540) {
            setdynentstate(var_2eb2cfa9, 3);
        }
        item_world::function_4de3ca98();
        foreach (var_2eb2cfa9 in var_8294540) {
            setdynentstate(var_2eb2cfa9, 3);
        }
    }
}

// Namespace wz_asylum/event_9673dc9a
// Params 1, eflags: 0x44
// Checksum 0xba7eed71, Offset: 0x3d0
// Size: 0x144
function private event_handler[event_9673dc9a] function_3981d015(eventstruct) {
    if (isdefined(level.var_7ad3f6a0) && !level.var_7ad3f6a0) {
        return;
    }
    if (isdefined(eventstruct.ent) && eventstruct.ent.targetname === "asylum_toilet") {
        if (eventstruct.state === 3) {
            wait 3;
            if (isdefined(eventstruct.ent.target)) {
                s_sound = struct::get(eventstruct.ent.target, "targetname");
                if (isdefined(s_sound)) {
                    song = randomint(2);
                    song++;
                    if (!(isdefined(level.var_afa44b2d) && level.var_afa44b2d)) {
                        song = 3;
                    }
                    level clientfield::set("toilet_ee_play", song);
                }
            }
        }
    }
}

