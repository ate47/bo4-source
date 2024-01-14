// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_maps_lighting;

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x2
// Checksum 0x92fc227c, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_maps_lighting", &__init__, undefined, undefined);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x1 linked
// Checksum 0xef6ea471, Offset: 0xc0
// Size: 0x44
function __init__() {
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 1, eflags: 0x1 linked
// Checksum 0xc2b78308, Offset: 0x110
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 1, eflags: 0x1 linked
// Checksum 0xbb9246b6, Offset: 0x148
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

