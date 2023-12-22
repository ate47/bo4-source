// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock.csc;
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\mp_common\item_world_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_menendez;

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 0, eflags: 0x2
// Checksum 0xe9d54012, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_menendez", &__init__, undefined, #"character_unlock_menendez_fixup");
}

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 0, eflags: 0x1 linked
// Checksum 0x95bfb057, Offset: 0xd8
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"menendez_unlock", &function_2613aeec);
}

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 1, eflags: 0x1 linked
// Checksum 0x3d1101ad, Offset: 0x118
// Size: 0x3c
function function_2613aeec(enabled) {
    if (enabled) {
        character_unlock::function_d2294476(#"supply_drop_stash_cu20", 2, 3);
    }
}

