// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_talisman.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_talisman_extra_miniturret;

// Namespace zm_talisman_extra_miniturret/zm_talisman_extra_miniturret
// Params 0, eflags: 0x2
// Checksum 0x426260bb, Offset: 0xe0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_extra_miniturret", &__init__, undefined, undefined);
}

// Namespace zm_talisman_extra_miniturret/zm_talisman_extra_miniturret
// Params 0, eflags: 0x1 linked
// Checksum 0x6ba77be2, Offset: 0x128
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_extra_miniturret", &activate_talisman);
}

// Namespace zm_talisman_extra_miniturret/zm_talisman_extra_miniturret
// Params 0, eflags: 0x1 linked
// Checksum 0xab73aba4, Offset: 0x160
// Size: 0x12
function activate_talisman() {
    self.b_talisman_extra_miniturret = 1;
}

