#using scripts\core_common\system_shared;
#using scripts\mp_common\teams\teamset;

#namespace teamset_axis;

// Namespace teamset_axis/teamset_axis
// Params 0, eflags: 0x2
// Checksum 0xa426095f, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"teamset_axis", &__init__, undefined, undefined );
}

// Namespace teamset_axis/teamset_axis
// Params 0
// Checksum 0xbd3f2a15, Offset: 0x178
// Size: 0x3c
function __init__()
{
    init( level.teams[ #"axis" ] );
    teamset::customteam_init();
}

// Namespace teamset_axis/teamset_axis
// Params 1
// Checksum 0xaae717f8, Offset: 0x1c0
// Size: 0x13a
function init( team )
{
    teamset::init();
    level.teamprefix[ team ] = "vox_pm";
    level.teampostfix[ team ] = "axis";
    game.music[ "spawn_" + team ] = "SPAWN_PMC";
    game.music[ "spawn_short" + team ] = "SPAWN_SHORT_PMC";
    game.music[ "victory_" + team ] = "VICTORY_PMC";
    game.voice[ team ] = "vox_pmc_";
    game.flagmodels[ team ] = "p8_mp_flag_pole_1_mercs";
    game.carry_flagmodels[ team ] = "p8_mp_flag_carry_1_mercs";
    game.flagmodels[ #"neutral" ] = "p8_mp_flag_pole_1";
}

