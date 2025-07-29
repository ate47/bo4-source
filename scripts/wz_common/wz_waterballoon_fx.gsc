#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace wz_waterballoon_fx;

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 0, eflags: 0x2
// Checksum 0x7140f9d, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"wz_waterballoon_fx", &__init__, undefined, undefined );
}

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 0
// Checksum 0x26a8c6c1, Offset: 0x120
// Size: 0x84
function __init__()
{
    clientfield::register( "toplayer", "player_hit_water_balloon", 16000, 1, "int" );
    clientfield::register( "toplayer", "player_hit_water_balloon_direction", 16000, 4, "int" );
    callback::on_player_damage( &function_c9509a9c );
}

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 1
// Checksum 0x9d509bbf, Offset: 0x1b0
// Size: 0x444
function function_c9509a9c( params )
{
    if ( isalive( self ) && isplayer( self ) )
    {
        if ( params.weapon.name === #"waterballoon" )
        {
            var_feafe576 = 0;
            var_cb01806c = 0;
            bleft = 0;
            bright = 0;
            var_4e1c6c81 = 1;
            var_9ed2938d = 1;
            attacker = params.eattacker;
            height_diff = attacker.origin[ 2 ] - self.origin[ 2 ];
            
            if ( height_diff < -16 )
            {
                var_feafe576 = 1;
                var_4e1c6c81 = 0;
            }
            
            if ( height_diff > 16 )
            {
                var_cb01806c = 1;
                var_4e1c6c81 = 0;
            }
            
            var_1f579e1d = attacker.origin - self.origin;
            var_1f579e1d = ( var_1f579e1d[ 0 ], var_1f579e1d[ 1 ], 0 );
            vec_right = anglestoright( self.angles );
            vec_right = vectornormalize( vec_right );
            vec_right = ( vec_right[ 0 ], vec_right[ 1 ], 0 );
            var_1f579e1d = vectornormalize( var_1f579e1d );
            vec_dot = vectordot( var_1f579e1d, vec_right );
            
            if ( vec_dot > 0.2 )
            {
                bright = 1;
                var_9ed2938d = 0;
            }
            else if ( vec_dot < -0.2 )
            {
                bleft = 1;
                var_9ed2938d = 0;
            }
            
            if ( var_4e1c6c81 && var_9ed2938d )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 1 );
            }
            else if ( var_4e1c6c81 && bleft )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 2 );
            }
            else if ( var_4e1c6c81 && bright )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 3 );
            }
            else if ( var_cb01806c && var_9ed2938d )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 5 );
            }
            else if ( var_feafe576 && var_9ed2938d )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 4 );
            }
            else if ( var_feafe576 && bleft )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 6 );
            }
            else if ( var_feafe576 && bright )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 8 );
            }
            else if ( var_cb01806c && bleft )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 9 );
            }
            else if ( var_cb01806c && bright )
            {
                self clientfield::set_to_player( "player_hit_water_balloon_direction", 10 );
            }
            
            self thread function_4df181ef();
        }
    }
}

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 0
// Checksum 0xff1dc699, Offset: 0x600
// Size: 0x84
function function_4df181ef()
{
    self endoncallback( &function_a1805183, #"death", #"game_ended" );
    self clientfield::set_to_player( "player_hit_water_balloon", 1 );
    wait 2;
    self clientfield::set_to_player( "player_hit_water_balloon", 0 );
}

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 1
// Checksum 0x7b32c206, Offset: 0x690
// Size: 0x2c
function function_a1805183( notifyhash )
{
    self clientfield::set_to_player( "player_hit_water_balloon", 0 );
}

