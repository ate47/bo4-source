// Atian COD Tools GSC decompiler test
#include scripts/core_common/vehicle_shared.gsc;
#include scripts/core_common/util_shared.gsc;

#namespace damage;

// Namespace damage/damage
// Params 3, eflags: 0x1 linked
// Checksum 0x6b18296e, Offset: 0x88
// Size: 0x3c8
function friendlyfirecheck(owner, attacker, forcedfriendlyfirerule) {
    if (!isdefined(owner)) {
        return 1;
    }
    if (!level.teambased) {
        return 1;
    }
    friendlyfirerule = [[ level.figure_out_friendly_fire ]](undefined, attacker);
    if (isdefined(forcedfriendlyfirerule)) {
        friendlyfirerule = forcedfriendlyfirerule;
    }
    if (friendlyfirerule != 0) {
        return 1;
    }
    if (attacker == owner) {
        return 1;
    }
    if (isplayer(attacker)) {
        ownerteam = owner.team;
        if (!isdefined(ownerteam) && isdefined(owner.pers)) {
            ownerteam = owner.pers[#"team"];
        }
        if (isdefined(attacker.pers) && !isdefined(attacker.pers[#"team"])) {
            return 1;
        }
        if (isdefined(attacker.pers) && util::function_fbce7263(attacker.pers[#"team"], ownerteam)) {
            return 1;
        }
    } else if (isactor(attacker)) {
        ownerteam = owner.team;
        if (!isdefined(ownerteam) && isdefined(owner.pers)) {
            ownerteam = owner.pers[#"team"];
        }
        if (util::function_fbce7263(attacker.team, ownerteam)) {
            return 1;
        }
    } else if (isvehicle(attacker)) {
        if (isdefined(attacker.owner) && isplayer(attacker.owner)) {
            ownerteam = owner.team;
            if (!isdefined(ownerteam) && isdefined(owner.pers)) {
                ownerteam = owner.pers[#"team"];
            }
            if (util::function_fbce7263(attacker.owner.pers[#"team"], ownerteam)) {
                return 1;
            }
        } else {
            occupant_team = attacker vehicle::vehicle_get_occupant_team();
            if (isplayer(owner)) {
                if (util::function_fbce7263(occupant_team, owner.pers[#"team"]) && occupant_team != #"spectator") {
                    return 1;
                }
            } else if (util::function_fbce7263(owner.team, occupant_team)) {
                return 1;
            }
        }
    } else if (attacker.classname === "worldspawn") {
        return 1;
    }
    return 0;
}

