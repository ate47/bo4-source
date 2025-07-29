#using scripts\core_common\laststand_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_contracts;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;

#namespace zm_powerup_bonus_points_player;

// Namespace zm_powerup_bonus_points_player/zm_powerup_bonus_points_player
// Params 0, eflags: 0x2
// Checksum 0xf5b63a6a, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_powerup_bonus_points_player", &__init__, undefined, undefined );
}

// Namespace zm_powerup_bonus_points_player/zm_powerup_bonus_points_player
// Params 0
// Checksum 0x3b2fbe99, Offset: 0x170
// Size: 0xf4
function __init__()
{
    zm_powerups::register_powerup( "bonus_points_player", &grab_bonus_points_player );
    zm_powerups::register_powerup( "bonus_points_player_shared", &function_ec014d54 );
    
    if ( zm_powerups::function_cc33adc8() )
    {
        zm_powerups::add_zombie_powerup( "bonus_points_player", "zombie_z_money_icon", #"zombie_powerup_bonus_points", &zm_powerups::func_should_never_drop, 1, 0, 0 );
        zm_powerups::add_zombie_powerup( "bonus_points_player_shared", "zombie_z_money_icon", #"zombie_powerup_bonus_points", &zm_powerups::func_should_never_drop, 1, 0, 0 );
    }
}

// Namespace zm_powerup_bonus_points_player/zm_powerup_bonus_points_player
// Params 1
// Checksum 0xa874c7e5, Offset: 0x270
// Size: 0x74
function grab_bonus_points_player( player )
{
    level thread bonus_points_player_powerup( self, player );
    player thread zm_powerups::powerup_vo( "bonus" );
    
    if ( zm_utility::is_standard() )
    {
        player contracts::increment_zm_contract( #"contract_zm_rush_powerups" );
    }
}

// Namespace zm_powerup_bonus_points_player/zm_powerup_bonus_points_player
// Params 1
// Checksum 0x499c95d7, Offset: 0x2f0
// Size: 0xc4
function function_ec014d54( player )
{
    level thread function_56784293( self, player );
    
    if ( player !== self.e_player_owner )
    {
        player thread zm_powerups::powerup_vo( "bonus" );
        
        if ( isdefined( self.e_player_owner ) && !( isdefined( self.e_player_owner.var_a50db39d ) && self.e_player_owner.var_a50db39d ) )
        {
            self.e_player_owner.var_a50db39d = 1;
            self.e_player_owner zm_stats::increment_challenge_stat( #"hash_733e96c5baacb1da" );
        }
    }
}

// Namespace zm_powerup_bonus_points_player/zm_powerup_bonus_points_player
// Params 2
// Checksum 0x113d6d0f, Offset: 0x3c0
// Size: 0x144
function bonus_points_player_powerup( item, player )
{
    if ( isdefined( item.var_258c5fbc ) && item.var_258c5fbc )
    {
        points = item.var_258c5fbc;
    }
    else if ( isdefined( level.var_a4c782b9 ) && level.var_a4c782b9 )
    {
        points = randomintrange( 1, 25 ) * 100;
    }
    else
    {
        points = 500;
    }
    
    if ( isdefined( level.bonus_points_powerup_override ) )
    {
        points = item [[ level.bonus_points_powerup_override ]]( player );
    }
    
    if ( isdefined( item.bonus_points_powerup_override ) )
    {
        points = item [[ item.bonus_points_powerup_override ]]( player );
    }
    
    player notify( #"bonus_points_player_grabbed", { #e_powerup:item } );
    player zm_score::player_add_points( "bonus_points_powerup", points, undefined, undefined, undefined, undefined, 1 );
}

// Namespace zm_powerup_bonus_points_player/zm_powerup_bonus_points_player
// Params 2
// Checksum 0xd39055f9, Offset: 0x510
// Size: 0x74
function function_56784293( item, player )
{
    player notify( #"bonus_points_player_grabbed", { #e_powerup:item } );
    player zm_score::player_add_points( "bonus_points_powerup_shared", 500, undefined, undefined, undefined, undefined, 1 );
}

