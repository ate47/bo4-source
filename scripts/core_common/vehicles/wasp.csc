// Atian COD Tools GSC decompiler test
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace wasp;

// Namespace wasp/wasp
// Params 0, eflags: 0x2
// Checksum 0x8914a0dd, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wasp", &__init__, undefined, undefined);
}

// Namespace wasp/wasp
// Params 0, eflags: 0x1 linked
// Checksum 0xf46e6fd4, Offset: 0x120
// Size: 0xb4
function __init__() {
    clientfield::register("vehicle", "rocket_wasp_hijacked", 1, 1, "int", &handle_lod_display_for_driver, 0, 0);
    level.sentinelbundle = struct::get_script_bundle("killstreak", "killstreak_sentinel");
    if (isdefined(level.sentinelbundle)) {
        vehicle::add_vehicletype_callback(level.sentinelbundle.ksvehicle, &spawned);
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x1 linked
// Checksum 0x7d029b94, Offset: 0x1e0
// Size: 0x1e
function spawned(localclientnum) {
    self.killstreakbundle = level.sentinelbundle;
}

// Namespace wasp/wasp
// Params 7, eflags: 0x1 linked
// Checksum 0x178fb5f9, Offset: 0x208
// Size: 0xa4
function handle_lod_display_for_driver(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (isdefined(self)) {
        if (self function_4add50a7()) {
            self sethighdetail(1);
            waitframe(1);
            self vehicle::lights_off(localclientnum);
        }
    }
}

