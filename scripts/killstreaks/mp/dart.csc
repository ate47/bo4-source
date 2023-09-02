// Atian COD Tools GSC decompiler test
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\killstreaks\qrdrone.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace dart;

// Namespace dart/dart
// Params 0, eflags: 0x2
// Checksum 0x88b7b037, Offset: 0x178
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"dart", &__init__, undefined, #"killstreaks");
}

// Namespace dart/dart
// Params 0, eflags: 0x1 linked
// Checksum 0x1435a83c, Offset: 0x1c8
// Size: 0x174
function __init__() {
    qrdrone::init_shared();
    clientfield::register("toplayer", "dart_update_ammo", 1, 2, "int", &update_ammo, 0, 0);
    clientfield::register("toplayer", "fog_bank_3", 1, 1, "int", &fog_bank_3_callback, 0, 0);
    level.dartbundle = struct::get_script_bundle("killstreak", "killstreak_dart");
    vehicle::add_vehicletype_callback(level.dartbundle.ksvehicle, &spawned);
    visionset_mgr::register_visionset_info("dart_visionset", 1, 1, undefined, "mp_vehicles_dart");
    visionset_mgr::register_visionset_info("sentinel_visionset", 1, 1, undefined, "mp_vehicles_sentinel");
    visionset_mgr::register_visionset_info("remote_missile_visionset", 1, 1, undefined, "mp_hellstorm");
}

// Namespace dart/dart
// Params 7, eflags: 0x1 linked
// Checksum 0xda71752c, Offset: 0x348
// Size: 0x7c
function update_ammo(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    setuimodelvalue(getuimodel(getuimodelforcontroller(localclientnum), "vehicle.rocketAmmo"), newval);
}

// Namespace dart/dart
// Params 1, eflags: 0x1 linked
// Checksum 0xdc5746fb, Offset: 0x3d0
// Size: 0x1e
function spawned(localclientnum) {
    self.killstreakbundle = level.dartbundle;
}

// Namespace dart/dart
// Params 7, eflags: 0x1 linked
// Checksum 0xf6878800, Offset: 0x3f8
// Size: 0x94
function fog_bank_3_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (oldval != newval) {
        if (newval == 1) {
            setworldfogactivebank(localclientnum, 4);
        } else {
            setworldfogactivebank(localclientnum, 1);
        }
    }
}

