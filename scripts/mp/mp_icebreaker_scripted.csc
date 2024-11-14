#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;

#namespace mp_icebreaker_scripted;

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 0, eflags: 0x2
// Checksum 0xe81cf192, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_icebreaker_scripted", &__init__, undefined, undefined);
}

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x7d0850, Offset: 0xc0
// Size: 0x44
function __init__() {
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
}

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x195c898f, Offset: 0x110
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x6bc31517, Offset: 0x148
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

