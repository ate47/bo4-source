// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/gametype.csc;
#include scripts/mp_common/callbacks.csc;
#include scripts/core_common/vehicles/driving_fx.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/map.csc;
#include scripts/core_common/flagsys_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace load;

// Namespace load/load
// Params 3, eflags: 0x1 linked
// Checksum 0xe656f82, Offset: 0xf8
// Size: 0x4e
function levelnotifyhandler(clientnum, state, oldstate) {
    if (state != "") {
        level notify(state, {#localclientnum:clientnum});
    }
}

// Namespace load/load
// Params 0, eflags: 0x1 linked
// Checksum 0xf9811a36, Offset: 0x150
// Size: 0x104
function main() {
    /#
        assert(isdefined(level.first_frame), "<unknown string>");
    #/
    level thread util::init_utility();
    util::registersystem("levelNotify", &levelnotifyhandler);
    register_clientfields();
    level.createfx_disable_fx = getdvarint(#"disable_fx", 0) == 1;
    map::init();
    gametype::init();
    system::wait_till("all");
    level flagsys::set(#"load_main_complete");
}

// Namespace load/load
// Params 0, eflags: 0x1 linked
// Checksum 0xd65a5492, Offset: 0x260
// Size: 0xdc
function register_clientfields() {
    clientfield::register("missile", "cf_m_proximity", 1, 1, "int", &callback::callback_proximity, 0, 0);
    clientfield::register("missile", "cf_m_emp", 1, 1, "int", &callback::callback_emp, 0, 0);
    clientfield::register("missile", "cf_m_stun", 1, 1, "int", &callback::callback_stunned, 0, 0);
}
