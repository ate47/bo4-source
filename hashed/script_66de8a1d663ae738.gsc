// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace aimappingtableutility;

// Namespace aimappingtableutility/aimappingtable
// Params 2, eflags: 0x0
// Checksum 0xe06b5aca, Offset: 0xa0
// Size: 0x46
function setmappingtableforteam(str_team, aimappingtable) {
    str_team = util::get_team_mapping(str_team);
    level.var_a0c5bb9b[str_team] = aimappingtable;
}

// Namespace aimappingtableutility/aimappingtable
// Params 3, eflags: 0x0
// Checksum 0xca29a120, Offset: 0xf0
// Size: 0x108
function getspawnerforai(ai, team, var_da5d083) {
    if (!isdefined(ai)) {
        return undefined;
    }
    aimappingtable = undefined;
    if (isdefined(var_da5d083)) {
        aimappingtable = var_da5d083;
    } else if (isdefined(level.var_a0c5bb9b) && isdefined(level.var_a0c5bb9b[team])) {
        aimappingtable = level.var_a0c5bb9b[team];
    }
    if (!isdefined(aimappingtable)) {
        return undefined;
    }
    var_54cddfbc = struct::get_script_bundle("aimappingtable", aimappingtable);
    if (!isdefined(var_54cddfbc)) {
        return undefined;
    }
    aitype = var_54cddfbc.("aitype_" + ai);
    if (isdefined(aitype)) {
        return aitype;
    }
    return var_54cddfbc.("vehicle_" + ai);
}

