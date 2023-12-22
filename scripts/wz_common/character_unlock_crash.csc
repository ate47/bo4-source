// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\mp_common\item_world_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_crash;

// Namespace character_unlock_crash/character_unlock_crash
// Params 0, eflags: 0x2
// Checksum 0xfd57bb71, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_crash", &__init__, undefined, #"character_unlock_crash_fixup");
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 0, eflags: 0x1 linked
// Checksum 0x906e6544, Offset: 0xd0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"crash_unlock", &function_2613aeec);
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 1, eflags: 0x1 linked
// Checksum 0x4b7541aa, Offset: 0x110
// Size: 0xcc
function function_2613aeec(enabled) {
    if (enabled) {
        if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
            item_world_fixup::function_e70fa91c(#"health_stash_parent", #"health_stash_cu03", 3);
        } else {
            item_world_fixup::function_e70fa91c(#"health_stash_parent", #"health_stash_cu03", 10);
        }
    }
}

