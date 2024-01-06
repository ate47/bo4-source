// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_jungle2_alt_scripted;

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 0, eflags: 0x2
// Checksum 0xc01cab8a, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_jungle2_scripted", &__init__, undefined, undefined);
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 0, eflags: 0x0
// Checksum 0x6ea49f99, Offset: 0x110
// Size: 0x8c
function __init__() {
    clientfield::register("scriptmover", "spawn_flavor_napalm_rumble", 1, 1, "counter", &spawn_flavor_napalm_rumble, 0, 0);
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 1, eflags: 0x0
// Checksum 0xfb3b66a3, Offset: 0x1a8
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 1, eflags: 0x0
// Checksum 0xf09c89a9, Offset: 0x1e0
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 7, eflags: 0x0
// Checksum 0xefa201bc, Offset: 0x218
// Size: 0x84
function spawn_flavor_napalm_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    localplayer = function_5c10bd79(localclientnum);
    if (isdefined(localplayer)) {
        localplayer playrumbleonentity(localclientnum, "napalm_rumble");
    }
}

