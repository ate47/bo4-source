#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_militia_scripted;

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 0, eflags: 0x2
// Checksum 0x4a0369ed, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_militia_scripted", &__init__, undefined, undefined);
}

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xc3bc1f53, Offset: 0xc0
// Size: 0x44
function __init__() {
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
}

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0xcb54b965, Offset: 0x110
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x3ec5fa4f, Offset: 0x148
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

