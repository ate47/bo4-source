#using script_71e26f08f03b7a7a;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\character_unlock;
#using scripts\wz_common\character_unlock_fixup;

#namespace namespace_b7ee637a;

// Namespace namespace_b7ee637a/namespace_b7ee637a
// Params 0, eflags: 0x2
// Checksum 0x83f8ce7a, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_7710b10c0110b17", &__init__, undefined, #"hash_5d70c94021e00856");
}

// Namespace namespace_b7ee637a/namespace_b7ee637a
// Params 0, eflags: 0x0
// Checksum 0x5714f9ee, Offset: 0xf0
// Size: 0xb4
function __init__() {
    if (isdefined(getgametypesetting(#"hash_6fb11b1e304d533c")) ? getgametypesetting(#"hash_6fb11b1e304d533c") : 0) {
        item_world_fixup::function_e70fa91c(#"supply_stash_parent", #"world_hw_event_tags_supply_drop", 3);
        namespace_3d2704b3::function_f0297225(#"world_hw_event_tags_supply_drop", 1, 3);
    }
}

