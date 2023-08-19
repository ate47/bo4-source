// Atian COD Tools GSC decompiler test
#include scripts/killstreaks/mp/killstreak_vehicle.csc;
#include scripts/killstreaks/killstreak_detect.csc;
#include scripts/core_common/vehicle_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;

#namespace recon_car;

// Namespace recon_car/recon_car
// Params 0, eflags: 0x2
// Checksum 0x1be60f63, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"recon_car", &__init__, undefined, #"killstreaks");
}

// Namespace recon_car/recon_car
// Params 0, eflags: 0x1 linked
// Checksum 0x1ea71e1b, Offset: 0x120
// Size: 0xb4
function __init__() {
    killstreak_detect::init_shared();
    bundle = struct::get_script_bundle("killstreak", sessionmodeiswarzonegame() ? "killstreak_recon_car_wz" : "killstreak_recon_car");
    level.var_af161ca6 = bundle;
    killstreak_vehicle::init_killstreak(bundle);
    vehicle::add_vehicletype_callback(bundle.ksvehicle, &spawned);
}

// Namespace recon_car/recon_car
// Params 2, eflags: 0x1 linked
// Checksum 0x244f0521, Offset: 0x1e0
// Size: 0x26
function spawned(localclientnum, killstreak_duration) {
    self.killstreakbundle = level.var_af161ca6;
}

