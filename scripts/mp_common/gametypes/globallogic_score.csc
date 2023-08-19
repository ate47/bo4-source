// Atian COD Tools GSC decompiler test
#include scripts/core_common/clientfield_shared.csc;

#namespace globallogic_score;

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x2
// Checksum 0x93af3d88, Offset: 0x108
// Size: 0xe4
function autoexec __init__() {
    clientfield::register("clientuimodel", "hudItems.scoreProtected", 1, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.minorActions.action0", 1, 1, "counter", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.minorActions.action1", 1, 1, "counter", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.hotStreak.level", 1, 3, "int", undefined, 0, 0);
}

