// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\planner_commander.gsc;

#namespace commander_util;

// Namespace commander_util/commander_util
// Params 1, eflags: 0x1 linked
// Checksum 0x7a013708, Offset: 0x70
// Size: 0x9a
function function_2c38e191(team) {
    switch (team) {
    case #"allies":
        if (isdefined(level.alliescommander)) {
            plannercommanderutility::function_2974807c(level.alliescommander);
        }
        break;
    case #"axis":
        if (isdefined(level.axiscommander)) {
            plannercommanderutility::function_2974807c(level.axiscommander);
        }
        break;
    }
}

// Namespace commander_util/commander_util
// Params 1, eflags: 0x1 linked
// Checksum 0x93cbae75, Offset: 0x118
// Size: 0x9a
function pause_commander(team) {
    switch (team) {
    case #"allies":
        if (isdefined(level.alliescommander)) {
            plannercommanderutility::pausecommander(level.alliescommander);
        }
        break;
    case #"axis":
        if (isdefined(level.axiscommander)) {
            plannercommanderutility::pausecommander(level.axiscommander);
        }
        break;
    }
}

