// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_talisman.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_talisman_extra_self_revive;

// Namespace zm_talisman_extra_self_revive/zm_talisman_extra_self_revive
// Params 0, eflags: 0x2
// Checksum 0x423dbc12, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_extra_self_revive", &__init__, undefined, undefined);
}

// Namespace zm_talisman_extra_self_revive/zm_talisman_extra_self_revive
// Params 0, eflags: 0x1 linked
// Checksum 0xb039978c, Offset: 0x120
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_extra_self_revive", &activate_talisman);
}

// Namespace zm_talisman_extra_self_revive/zm_talisman_extra_self_revive
// Params 0, eflags: 0x1 linked
// Checksum 0xa4a6cfd, Offset: 0x158
// Size: 0x1c
function activate_talisman() {
    self zm_laststand::function_3a00302e(1);
}

