// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mp_maps_lighting;

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x2
// Checksum 0xe922caab, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_maps_lighting", &__init__, undefined, undefined);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x1 linked
// Checksum 0xcdce3709, Offset: 0xe8
// Size: 0x24
function __init__() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x1 linked
// Checksum 0x9498196f, Offset: 0x118
// Size: 0x34
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
}

