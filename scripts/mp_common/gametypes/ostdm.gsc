// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/tdm.gsc;
#include scripts/mp_common/gametypes/os.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;

#namespace ostdm;

// Namespace ostdm/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xbc31a217, Offset: 0xa8
// Size: 0x64
function event_handler[gametype_init] main(eventstruct) {
    tdm::main();
    os::turn_back_time("tdm");
    globallogic_audio::set_leader_gametype_dialog("osStartTdm", "", "gameBoost", "gameBoost");
}

