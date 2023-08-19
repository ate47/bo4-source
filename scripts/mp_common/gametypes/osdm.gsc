// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/dm.gsc;
#include scripts/mp_common/gametypes/os.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;

#namespace osdm;

// Namespace osdm/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xfb55f198, Offset: 0xa8
// Size: 0x64
function event<gametype_init> main(eventstruct) {
    dm::main();
    os::turn_back_time("dm");
    globallogic_audio::set_leader_gametype_dialog("osStartFfa", "", "gameBoost", "gameBoost");
}

