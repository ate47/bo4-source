#using scripts\core_common\ai\archetype_brutus;
#using scripts\core_common\ai\systems\fx_character;
#using scripts\core_common\ai_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\footsteps_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm;

#namespace zm_ai_brutus;

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x2
// Checksum 0xe4aa031f, Offset: 0x1d8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_ai_brutus", &__init__, undefined, undefined );
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0
// Checksum 0x66c96db8, Offset: 0x220
// Size: 0x10c
function __init__()
{
    clientfield::register( "actor", "brutus_shock_attack", 1, 1, "counter", &brutus_shock_attack_fx, 0, 0 );
    clientfield::register( "actor", "brutus_spawn_clientfield", 1, 1, "int", &function_80adaab1, 0, 0 );
    clientfield::register( "toplayer", "brutus_shock_attack_player", 1, 1, "counter", &brutus_shock_attack_player, 0, 0 );
    footsteps::registeraitypefootstepcb( #"brutus", &function_6e2a738c );
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 7
// Checksum 0x9078650d, Offset: 0x338
// Size: 0x10c
function function_80adaab1( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    self util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( newval )
    {
        self.lightfx = util::playfxontag( localclientnum, "light/fx8_light_spot_brutus_flicker", self, "tag_spotlight" );
        playfx( localclientnum, "maps/zm_escape/fx8_alcatraz_brut_spawn", self.origin );
        return;
    }
    
    if ( isdefined( self.lightfx ) )
    {
        stopfx( localclientnum, self.lightfx );
    }
    
    playfx( localclientnum, "maps/zm_escape/fx8_alcatraz_brut_spawn", self.origin );
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 7
// Checksum 0x4a01e520, Offset: 0x450
// Size: 0xfc
function brutus_shock_attack_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    self util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    radius = self ai::function_9139c839().var_1709a39;
    
    if ( !isdefined( radius ) )
    {
        radius = 512;
    }
    
    playfx( localclientnum, "maps/zm_escape/fx8_alcatraz_brut_shock", self.origin, anglestoup( self.angles ) );
    earthquake( localclientnum, 1, 1, self.origin, radius );
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 7
// Checksum 0xaf7a0d55, Offset: 0x558
// Size: 0x5c
function brutus_shock_attack_player( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    function_36e4ebd4( localclientnum, "damage_heavy" );
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 5
// Checksum 0x49d559e, Offset: 0x5c0
// Size: 0x12e
function function_6e2a738c( localclientnum, pos, surface, notetrack, bone )
{
    a_players = getlocalplayers();
    
    for ( i = 0; i < a_players.size ; i++ )
    {
        if ( abs( self.origin[ 2 ] - a_players[ i ].origin[ 2 ] ) < 128 )
        {
            var_ed2e93e5 = a_players[ i ] getlocalclientnumber();
            
            if ( isdefined( var_ed2e93e5 ) )
            {
                earthquake( var_ed2e93e5, 0.5, 0.1, self.origin, 1500 );
                playrumbleonposition( var_ed2e93e5, "brutus_footsteps", self.origin );
            }
        }
    }
}

