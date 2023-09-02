// Atian COD Tools GSC decompiler test
#using scripts\mp_common\item_world.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_518109fe;

// Namespace namespace_518109fe/namespace_518109fe
// Params 0, eflags: 0x2
// Checksum 0xd1054d14, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_502d65acd9829223", &__init__, undefined, undefined);
}

// Namespace namespace_518109fe/namespace_518109fe
// Params 0, eflags: 0x1 linked
// Checksum 0xcdf3449d, Offset: 0xc0
// Size: 0x11c
function __init__() {
    level.var_bf7edb6 = (isdefined(getgametypesetting(#"wzwaterballoonsenabled")) ? getgametypesetting(#"wzwaterballoonsenabled") : 0) || (isdefined(getgametypesetting(#"hash_3e2d2cf6b1cc6c68")) ? getgametypesetting(#"hash_3e2d2cf6b1cc6c68") : 0);
    customgame = gamemodeismode(1) || gamemodeismode(7);
    if (customgame || !level.var_bf7edb6) {
        level thread function_5d709b7();
    }
}

// Namespace namespace_518109fe/namespace_518109fe
// Params 0, eflags: 0x5 linked
// Checksum 0xbe2eb242, Offset: 0x1e8
// Size: 0xb0
function private function_5d709b7() {
    item_world::function_4de3ca98();
    var_fcfd8449 = getdynentarray(#"hash_25e69fa10c944661");
    foreach (var_a3272447 in var_fcfd8449) {
        item_world::function_160294c7(var_a3272447);
    }
}

