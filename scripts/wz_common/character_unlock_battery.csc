// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock.csc;
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\mp_common\item_world_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_battery;

// Namespace character_unlock_battery/character_unlock_battery
// Params 0, eflags: 0x2
// Checksum 0x25d9ee6b, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_battery", &__init__, undefined, #"character_unlock_battery_fixup");
}

// Namespace character_unlock_battery/character_unlock_battery
// Params 0, eflags: 0x0
// Checksum 0x7188f315, Offset: 0xd8
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"battery_unlock", &function_2613aeec);
}

// Namespace character_unlock_battery/character_unlock_battery
// Params 1, eflags: 0x0
// Checksum 0xcca0d0c0, Offset: 0x118
// Size: 0x3c
function function_2613aeec(enabled) {
    if (enabled) {
        character_unlock::function_d2294476(#"supply_drop_stash_battery", 2, 3);
    }
}

