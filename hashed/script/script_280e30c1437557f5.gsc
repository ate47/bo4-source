#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\mp_common\item_world;

#namespace namespace_d0937679;

// Namespace namespace_d0937679/namespace_d0937679
// Params 0, eflags: 0x2
// Checksum 0xc4ced42b, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_1f56d362760c2c6b", &__init__, undefined, undefined);
}

// Namespace namespace_d0937679/namespace_d0937679
// Params 0, eflags: 0x1 linked
// Checksum 0xd0a6d39e, Offset: 0x110
// Size: 0x74
function __init__() {
    level.var_fdbdcdfd = isdefined(getgametypesetting(#"hash_6fbf57e2af153e5f")) ? getgametypesetting(#"hash_6fbf57e2af153e5f") : 0;
    level thread function_61a426a5();
}

// Namespace namespace_d0937679/namespace_d0937679
// Params 0, eflags: 0x1 linked
// Checksum 0xb7efdcbb, Offset: 0x190
// Size: 0x202
function function_61a426a5() {
    debug_pos = getdvarint(#"hash_79ed3a19e0cdd3c5", -1);
    if (debug_pos < 0) {
        debug_pos = undefined;
    }
    zombie_apoc_homunculus = getdynent("zombie_apoc_homunculus");
    if (!isdefined(zombie_apoc_homunculus) && !(isdefined(level.var_fdbdcdfd) && level.var_fdbdcdfd)) {
        return;
    }
    item_world::function_4de3ca98();
    if (isdefined(zombie_apoc_homunculus)) {
        points = struct::get_array("zombie_apoc_homunculus_point", "targetname");
        if (isdefined(points)) {
            for (index = 0; index < points.size; index++) {
                randindex = function_d59c2d03(points.size);
                tempid = points[index];
                points[index] = points[randindex];
                points[randindex] = tempid;
            }
            randindex = function_d59c2d03(points.size);
            if (isdefined(debug_pos)) {
                zombie_apoc_homunculus.origin = points[debug_pos].origin;
                zombie_apoc_homunculus.angles = points[debug_pos].angles;
                return;
            }
            zombie_apoc_homunculus.origin = points[randindex].origin;
            zombie_apoc_homunculus.angles = points[randindex].angles;
        }
    }
}

