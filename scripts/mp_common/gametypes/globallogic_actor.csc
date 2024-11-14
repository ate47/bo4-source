#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace globallogic_actor;

// Namespace globallogic_actor/globallogic_actor
// Params 0, eflags: 0x2
// Checksum 0x9888aff3, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"globallogic_actor", &__init__, undefined, undefined);
}

// Namespace globallogic_actor/globallogic_actor
// Params 0, eflags: 0x0
// Checksum 0x4220f40d, Offset: 0xe0
// Size: 0x32
function __init__() {
    level._effect[#"rcbombexplosion"] = #"killstreaks/fx_rcxd_exp";
}

