// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock.csc;
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\mp_common\item_world_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_prophet;

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 0, eflags: 0x2
// Checksum 0xe0b57cf9, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_prophet", &__init__, undefined, #"character_unlock_prophet_fixup");
}

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 0, eflags: 0x1 linked
// Checksum 0x8a29ea4c, Offset: 0xd8
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"prophet_unlock", &function_2613aeec);
}

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 1, eflags: 0x1 linked
// Checksum 0xb804bef8, Offset: 0x118
// Size: 0x3c
function function_2613aeec(enabled) {
    if (enabled) {
        character_unlock::function_d2294476(#"supply_drop_stash_cu10", 2, 3);
    }
}

