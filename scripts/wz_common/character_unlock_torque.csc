// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\mp_common\item_world_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_torque;

// Namespace character_unlock_torque/character_unlock_torque
// Params 0, eflags: 0x2
// Checksum 0xd4dc92b, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_torque", &__init__, undefined, #"character_unlock_torque_fixup");
}

// Namespace character_unlock_torque/character_unlock_torque
// Params 0, eflags: 0x1 linked
// Checksum 0x7373fb73, Offset: 0xd0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"torque_unlock", &function_2613aeec);
}

// Namespace character_unlock_torque/character_unlock_torque
// Params 1, eflags: 0x1 linked
// Checksum 0xcada640, Offset: 0x110
// Size: 0xcc
function function_2613aeec(enabled) {
    if (enabled) {
        if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
            item_world_fixup::function_e70fa91c(#"ammo_stash_parent_dlc1", #"supply_drop_stash_cu02", 2);
        } else {
            item_world_fixup::function_e70fa91c(#"ammo_stash_parent_dlc1", #"supply_drop_stash_cu02", 6);
        }
    }
}

