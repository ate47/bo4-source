// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\mp_common\item_world_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_recon;

// Namespace character_unlock_recon/character_unlock_recon
// Params 0, eflags: 0x2
// Checksum 0xce9ce0a0, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_recon", &__init__, undefined, #"character_unlock_recon_fixup");
}

// Namespace character_unlock_recon/character_unlock_recon
// Params 0, eflags: 0x1 linked
// Checksum 0xeced5268, Offset: 0xd0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"recon_unlock", &function_2613aeec);
}

// Namespace character_unlock_recon/character_unlock_recon
// Params 1, eflags: 0x1 linked
// Checksum 0x29fb2538, Offset: 0x110
// Size: 0xcc
function function_2613aeec(enabled) {
    if (enabled) {
        if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
            item_world_fixup::function_e70fa91c(#"hash_2e8c8c85b6034ab3", #"hash_d245e711188e065", 1);
        } else {
            item_world_fixup::function_e70fa91c(#"supply_stash_parent_dlc1", #"hash_d245e711188e065", 6);
        }
    }
}

