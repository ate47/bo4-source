#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_weapons;

#namespace namespace_983e5028;

// Namespace namespace_983e5028/namespace_983e5028
// Params 0, eflags: 0x2
// Checksum 0x5edbb3c1, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_1633972af838a447", &__init__, undefined, undefined );
}

// Namespace namespace_983e5028/namespace_983e5028
// Params 0
// Checksum 0x7102b1ad, Offset: 0xf0
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"hash_2fc73bc20035fe8", &on_begin, &on_end );
}

// Namespace namespace_983e5028/namespace_983e5028
// Params 1, eflags: 0x4
// Checksum 0x861ef37d, Offset: 0x158
// Size: 0xc8
function private on_begin( var_d34d02af )
{
    level.var_d34d02af = zm_trial::function_5769f26a( var_d34d02af );
    callback::on_weapon_fired( &on_weapon_fired );
    
    foreach ( player in getplayers() )
    {
        player thread function_a5a431f6();
    }
}

// Namespace namespace_983e5028/namespace_983e5028
// Params 1, eflags: 0x4
// Checksum 0xc72452a0, Offset: 0x228
// Size: 0x36
function private on_end( round_reset )
{
    callback::remove_on_weapon_fired( &on_weapon_fired );
    level.var_d34d02af = undefined;
}

// Namespace namespace_983e5028/namespace_983e5028
// Params 1, eflags: 0x4
// Checksum 0xbf560cd0, Offset: 0x268
// Size: 0x7c
function private on_weapon_fired( params )
{
    if ( zm_weapons::is_explosive_weapon( params.weapon ) )
    {
        self zm_score::player_reduce_points( "take_specified", level.var_d34d02af * 2 );
        return;
    }
    
    self zm_score::player_reduce_points( "take_specified", level.var_d34d02af );
}

// Namespace namespace_983e5028/namespace_983e5028
// Params 0, eflags: 0x4
// Checksum 0x15ccba79, Offset: 0x2f0
// Size: 0x90
function private function_a5a431f6()
{
    self endon( #"disconnect" );
    level endon( #"hash_7646638df88a3656" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"ammo_reduction", #"lightning_ball_created" );
        self zm_score::player_reduce_points( "take_specified", level.var_d34d02af );
    }
}

