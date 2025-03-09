#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;

#namespace mp_maps_lighting;

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x2
// Checksum 0xad552250, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_maps_lighting", &__init__, undefined, undefined);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x0
// Checksum 0xb3dc2c59, Offset: 0xe8
// Size: 0x24
function __init__() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_maps_lighting/mp_maps_lighting
// Params 0, eflags: 0x0
// Checksum 0xe6821ca9, Offset: 0x118
// Size: 0x34
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
}

