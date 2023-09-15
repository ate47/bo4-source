// Atian COD Tools GSC decompiler test
#using scripts\mp_common\item_world.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_6fec3d63;

// Namespace namespace_6fec3d63/namespace_6fec3d63
// Params 0, eflags: 0x2
// Checksum 0x156585ce, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_32ef71953f1186eb", &__init__, undefined, undefined);
}

// Namespace namespace_6fec3d63/namespace_6fec3d63
// Params 0, eflags: 0x1 linked
// Checksum 0x12251084, Offset: 0xc0
// Size: 0xcc
function __init__() {
    level.var_522db246 = isdefined(getgametypesetting(#"hash_507a891c5b5e7599")) ? getgametypesetting(#"hash_507a891c5b5e7599") : 0;
    customgame = gamemodeismode(1) || gamemodeismode(7);
    if (customgame || !level.var_522db246) {
        level thread function_7e4aeb0b();
    }
}

// Namespace namespace_6fec3d63/namespace_6fec3d63
// Params 0, eflags: 0x5 linked
// Checksum 0x7f0e0e6c, Offset: 0x198
// Size: 0x140
function private function_7e4aeb0b() {
    item_world::function_4de3ca98();
    var_595e1a69 = getdynentarray(#"hash_37a64c24861c7172");
    foreach (var_534542fd in var_595e1a69) {
        item_world::function_160294c7(var_534542fd);
    }
    var_595e1a69 = getdynentarray(#"hash_7d60590fc39ccb98");
    foreach (var_534542fd in var_595e1a69) {
        item_world::function_160294c7(var_534542fd);
    }
}

