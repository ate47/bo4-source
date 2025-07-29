#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\zm_utility;

#namespace zm_talisman_perk_reducecost_3;

// Namespace zm_talisman_perk_reducecost_3/zm_talisman_perk_reducecost_3
// Params 0, eflags: 0x2
// Checksum 0x873fb6a4, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_talisman_perk_reducecost_3", &__init__, undefined, undefined );
}

// Namespace zm_talisman_perk_reducecost_3/zm_talisman_perk_reducecost_3
// Params 0
// Checksum 0x10b5a5e0, Offset: 0x118
// Size: 0x2c
function __init__()
{
    zm_talisman::register_talisman( "talisman_perk_reducecost_3", &activate_talisman );
}

// Namespace zm_talisman_perk_reducecost_3/zm_talisman_perk_reducecost_3
// Params 0
// Checksum 0xc707f6e9, Offset: 0x150
// Size: 0x12
function activate_talisman()
{
    self.talisman_perk_reducecost_3 = 1000;
}

