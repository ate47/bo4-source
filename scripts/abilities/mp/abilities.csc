#using scripts\abilities\ability_util.csc;
#using scripts\abilities\ability_power.csc;
#using scripts\abilities\ability_player.csc;
#using scripts\abilities\ability_gadgets.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace abilities;

// Namespace abilities/abilities
// Params 0, eflags: 0x2
// Checksum 0x687f5d58, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"abilities", &__init__, undefined, undefined);
}

// Namespace abilities/abilities
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x100
// Size: 0x4
function __init__() {
    
}

