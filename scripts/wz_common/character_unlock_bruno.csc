#using scripts\wz_common\character_unlock;
#using scripts\wz_common\character_unlock_fixup;
#using scripts\mp_common\item_world_fixup;
#using scripts\core_common\system_shared;

#namespace character_unlock_bruno;

// Namespace character_unlock_bruno/character_unlock_bruno
// Params 0, eflags: 0x2
// Checksum 0x2b9d2beb, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_bruno", &__init__, undefined, #"character_unlock_bruno_fixup");
}

// Namespace character_unlock_bruno/character_unlock_bruno
// Params 0, eflags: 0x0
// Checksum 0x60eb8187, Offset: 0xd8
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"bruno_unlock", &function_2613aeec);
}

// Namespace character_unlock_bruno/character_unlock_bruno
// Params 1, eflags: 0x0
// Checksum 0x48e756b6, Offset: 0x118
// Size: 0x3c
function function_2613aeec(enabled) {
    if (enabled) {
        character_unlock::function_d2294476(#"supply_drop_stash_cu11", 3, 4);
    }
}

