// Atian COD Tools GSC decompiler test
#using scripts\mp\mp_casino_scripted.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\core_common\compass.gsc;

#namespace mp_casino;

// Namespace mp_casino/mp_casino
// Params 2, eflags: 0x1 linked
// Checksum 0x110d8092, Offset: 0xc0
// Size: 0x52
function function_1fb8a998(var_f6b5167, newlocation) {
    movepoint = spawnstruct();
    movepoint.var_f6b5167 = var_f6b5167;
    movepoint.newlocation = newlocation;
    return movepoint;
}

// Namespace mp_casino/mp_casino
// Params 0, eflags: 0x1 linked
// Checksum 0xca51f091, Offset: 0x120
// Size: 0x25a
function function_9bcbe7e1() {
    if (level.gametype !== "bounty") {
        return;
    }
    var_7331db53 = [];
    var_7331db53[var_7331db53.size] = function_1fb8a998((-2049, -1718, -2), (-3425, -1142, 4));
    var_7331db53[var_7331db53.size] = function_1fb8a998((0, -1024, 8), (1080, -1776, 4));
    var_7331db53[var_7331db53.size] = function_1fb8a998((0, 512, 8), (108, 948, 4));
    var_7331db53[var_7331db53.size] = function_1fb8a998((-2482, 849, 0), (-2796, 1511, 4));
    var_4ae5bbef = struct::get_array("bounty_deposit_location", "variantname");
    foreach (var_7f648714 in var_4ae5bbef) {
        foreach (movepoint in var_7331db53) {
            distance = distancesquared(var_7f648714.origin, movepoint.var_f6b5167);
            if (distance > 1) {
                continue;
            }
            var_7f648714.origin = movepoint.newlocation;
            break;
        }
    }
}

// Namespace mp_casino/level_init
// Params 1, eflags: 0x40
// Checksum 0xe2f591b1, Offset: 0x388
// Size: 0xca
function event_handler[level_init] main(eventstruct) {
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((108, 948, 8), (2054, 980, 8), (2557, -1878, -120), (-2796, 1511, 8), (-3425, -1142, 8), (1080, -1778, 10));
    function_9bcbe7e1();
    level.var_65f7e97e = 8;
}

