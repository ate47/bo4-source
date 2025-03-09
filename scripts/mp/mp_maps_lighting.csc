#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;

#namespace mp_maps_lighting;

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x2
// Checksum 0x1bab8c41, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_maps_lighting", &__init__, undefined, undefined);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x0
// Checksum 0x3c873831, Offset: 0xc0
// Size: 0x44
function __init__() {
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 1, eflags: 0x0
// Checksum 0x887052e7, Offset: 0x110
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 1, eflags: 0x0
// Checksum 0x4045dae9, Offset: 0x148
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

