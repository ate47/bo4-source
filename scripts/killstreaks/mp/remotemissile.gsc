#using scripts\core_common\system_shared;
#using scripts\killstreaks\remotemissile_shared;
#using scripts\mp_common\gametypes\battlechatter;
#using scripts\mp_common\gametypes\globallogic_audio;

#namespace remotemissile;

// Namespace remotemissile/remotemissile
// Params 0, eflags: 0x2
// Checksum 0xfc44242e, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"remotemissile", &__init__, undefined, #"killstreaks" );
}

// Namespace remotemissile/remotemissile
// Params 0
// Checksum 0x51836ae5, Offset: 0x120
// Size: 0x5e
function __init__()
{
    init_shared();
    level.var_5951cb24 = &function_5951cb24;
    level.var_dab39bb8 = &function_dab39bb8;
    level.var_feddd85a = &function_feddd85a;
}

// Namespace remotemissile/remotemissile
// Params 2
// Checksum 0xdd628092, Offset: 0x188
// Size: 0x54
function function_5951cb24( killstreak_id, team )
{
    if ( !isdefined( self.currentkillstreakdialog ) && isdefined( level.var_cb4eb1d1 ) )
    {
        self thread [[ level.var_cb4eb1d1 ]]( "callInRemoteMissile", "callInFutzRemoteMissile" );
    }
}

// Namespace remotemissile/remotemissile
// Params 1
// Checksum 0xce6714d2, Offset: 0x1e8
// Size: 0x180
function function_dab39bb8( rocket )
{
    self endon( #"remotemissile_done" );
    rocket endon( #"death" );
    var_b5e50364 = 0;
    
    while ( !var_b5e50364 )
    {
        enemy = self.owner battlechatter::get_closest_player_enemy( self.origin, 1 );
        
        if ( !isdefined( enemy ) )
        {
            return 0;
        }
        
        eyepoint = enemy geteye();
        relativepos = vectornormalize( self.origin - eyepoint );
        dir = anglestoforward( enemy getplayerangles() );
        dotproduct = vectordot( relativepos, dir );
        
        if ( dotproduct > 0 && sighttracepassed( self.origin, eyepoint, 1, enemy, self ) )
        {
            enemy thread battlechatter::play_killstreak_threat( "remote_missile" );
            var_b5e50364 = 1;
        }
        
        wait 0.1;
    }
}

// Namespace remotemissile/remotemissile
// Params 2
// Checksum 0x2e21287b, Offset: 0x370
// Size: 0x34
function function_feddd85a( attacker, weapon )
{
    attacker battlechatter::function_dd6a6012( "remote_missile", weapon );
}

