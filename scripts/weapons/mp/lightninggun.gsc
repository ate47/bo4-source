// Atian COD Tools GSC decompiler test
#using scripts\weapons\lightninggun.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace lightninggun;

// Namespace lightninggun/lightninggun
// Params 0, eflags: 0x2
// Checksum 0x68e91cb7, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"lightninggun", &__init__, undefined, undefined);
}

// Namespace lightninggun/lightninggun
// Params 0, eflags: 0x1 linked
// Checksum 0x3482a284, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

