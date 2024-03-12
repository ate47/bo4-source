// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\mp_common\item_world.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace character_unlock_takeo;

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x2
// Checksum 0x13e3c2cb, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_takeo", &__init__, undefined, #"character_unlock_takeo_fixup");
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x0
// Checksum 0x11ad2d43, Offset: 0xd8
// Size: 0x54
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"takeo_unlock", &function_2613aeec);
    callback::on_finalize_initialization(&on_finalize_initialization);
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 1, eflags: 0x0
// Checksum 0x5ee6137b, Offset: 0x138
// Size: 0x2c
function on_finalize_initialization(localclientnum) {
    waitframe(1);
    level function_552910e9();
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 1, eflags: 0x0
// Checksum 0x5358dbe4, Offset: 0x170
// Size: 0x2c
function function_2613aeec(enabled) {
    if (!enabled) {
        level thread function_279880b1();
    }
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x0
// Checksum 0x3e61455a, Offset: 0x1a8
// Size: 0x2c
function function_279880b1() {
    item_world::function_4de3ca98();
    level function_552910e9();
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x0
// Checksum 0x78b71ed0, Offset: 0x1e0
// Size: 0x4c
function function_552910e9() {
    dynent = getdynent(#"hash_7b220e1de3a2000d");
    if (isdefined(dynent)) {
        setdynentenabled(dynent, 0);
    }
}

