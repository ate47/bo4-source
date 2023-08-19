// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/ct_firebreak_tutorial.csc;
#include scripts/mp_common/gametypes/ct_core.csc;
#include scripts/core_common/renderoverridebundle.csc;
#include scripts/core_common/oob.csc;
#include scripts/core_common/clientfield_shared.csc;
#include script_127edb82eabcb791;

#namespace ct_firebreak;

// Namespace ct_firebreak/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1af65440, Offset: 0xb8
// Size: 0x64
function event<gametype_init> main(eventstruct) {
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
    level.ct_firebreak_multi_kill = ct_firebreak_multi_kill::register("ct_firebreak_multi_kill");
    ct_firebreak_tutorial::init();
}

