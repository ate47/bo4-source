// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace globallogic_actor;

// Namespace globallogic_actor/globallogic_actor
// Params 0, eflags: 0x2
// Checksum 0x9888aff3, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"globallogic_actor", &__init__, undefined, undefined);
}

// Namespace globallogic_actor/globallogic_actor
// Params 0, eflags: 0x1 linked
// Checksum 0x4220f40d, Offset: 0xe0
// Size: 0x32
function __init__() {
    level._effect[#"rcbombexplosion"] = #"killstreaks/fx_rcxd_exp";
}

