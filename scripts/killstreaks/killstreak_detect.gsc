// Atian COD Tools GSC decompiler test
#using scripts\killstreaks\killstreak_hacking.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace killstreak_detect;

// Namespace killstreak_detect/killstreak_detect
// Params 0, eflags: 0x1 linked
// Checksum 0xd9d84755, Offset: 0xd0
// Size: 0x114
function init_shared() {
    if (!isdefined(level.var_c3f91417)) {
        level.var_c3f91417 = {};
        clientfield::register("vehicle", "enemyvehicle", 1, 2, "int");
        clientfield::register("scriptmover", "enemyvehicle", 1, 2, "int");
        clientfield::register("missile", "enemyvehicle", 1, 2, "int");
        clientfield::register("actor", "enemyvehicle", 1, 2, "int");
        clientfield::register("vehicle", "vehicletransition", 1, 1, "int");
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x1 linked
// Checksum 0xf9d64b71, Offset: 0x1f0
// Size: 0x5c
function killstreaktargetset(killstreakentity, offset = (0, 0, 0)) {
    target_set(killstreakentity, offset);
    /#
        killstreakentity thread killstreak_hacking::killstreak_switch_team(killstreakentity.owner);
    #/
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x0
// Checksum 0xd7230992, Offset: 0x258
// Size: 0x3c
function killstreaktargetclear(killstreakentity) {
    target_remove(killstreakentity);
    /#
        killstreakentity thread killstreak_hacking::killstreak_switch_team_end();
    #/
}

