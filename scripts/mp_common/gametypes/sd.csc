// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include script_28a20e497bd69c36;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/struct.csc;

#namespace sd;

// Namespace sd/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x9700a2e9, Offset: 0xd8
// Size: 0xb4
function event_handler[gametype_init] main(eventstruct) {
    if (getgametypesetting(#"silentplant") != 0) {
        setsoundcontext("bomb_plant", "silent");
    }
    clientfield::register("worlduimodel", "hudItems.war.attackingTeam", 1, 2, "int", undefined, 0, 1);
    if (util::function_8570168d()) {
        namespace_9096c917::init();
    }
}

