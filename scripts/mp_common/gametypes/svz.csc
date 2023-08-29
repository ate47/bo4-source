// Atian COD Tools GSC decompiler test
#include scripts/mp_common/laststand.csc;
#include scripts/core_common/util_shared.csc;
#include script_28a20e497bd69c36;
#include scripts/mp_common/gametypes/globallogic_score.csc;
#include scripts/core_common/struct.csc;

#namespace svz;

// Namespace svz/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x8e8c7348, Offset: 0x90
// Size: 0x34
function event_handler[gametype_init] main(eventstruct) {
    if (util::function_8570168d()) {
        namespace_9096c917::init();
    }
}

