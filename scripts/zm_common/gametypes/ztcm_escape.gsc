// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_stats.gsc;
#include scripts/zm_common/zm_round_logic.gsc;
#include scripts/zm_common/gametypes/ztcm.gsc;
#include scripts/zm_common/gametypes/zm_gametype.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace ztcm_escape;

// Namespace ztcm_escape/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1a468aaa, Offset: 0x98
// Size: 0x24
function event<gametype_init> main(eventstruct) {
    ztcm::main(eventstruct);
}
