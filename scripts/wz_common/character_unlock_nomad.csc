#using scripts\core_common\system_shared;
#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_nomad;

// Namespace character_unlock_nomad/character_unlock_nomad
// Params 0, eflags: 0x2
// Checksum 0x21b30802, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_nomad", &__init__, undefined, #"character_unlock_nomad_fixup");
}

// Namespace character_unlock_nomad/character_unlock_nomad
// Params 0, eflags: 0x0
// Checksum 0x383082c0, Offset: 0xd0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"nomad_unlock", &function_2613aeec);
}

// Namespace character_unlock_nomad/character_unlock_nomad
// Params 1, eflags: 0x0
// Checksum 0xe033ec1a, Offset: 0x110
// Size: 0xcc
function function_2613aeec(enabled) {
    if (enabled) {
        if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
            item_world_fixup::function_e70fa91c(#"wz_escape_supply_stash_parent", #"supply_stash_cu07", 1);
            return;
        }
        item_world_fixup::function_e70fa91c(#"supply_stash_parent_dlc1", #"supply_stash_cu07", 6);
    }
}

