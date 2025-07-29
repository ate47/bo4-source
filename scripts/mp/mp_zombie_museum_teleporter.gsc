#using scripts\core_common\callbacks_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace mp_zombie_museum_teleporter;

// Namespace mp_zombie_museum_teleporter/mp_zombie_museum_teleporter
// Params 0, eflags: 0x2
// Checksum 0xd855028, Offset: 0x208
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"mp_zombie_museum_teleporter", &__main__, undefined, undefined );
}

// Namespace mp_zombie_museum_teleporter/mp_zombie_museum_teleporter
// Params 0
// Checksum 0xc7b67685, Offset: 0x250
// Size: 0x44
function __main__()
{
    if ( getdvarint( #"hash_6360671422e5591a", 1 ) )
    {
        level thread teleporters_init();
    }
}

// Namespace mp_zombie_museum_teleporter/mp_zombie_museum_teleporter
// Params 0
// Checksum 0x9f4f0140, Offset: 0x2a0
// Size: 0x14c
function teleporters_init()
{
    var_92b18f69 = getentarray( "teleporter", "targetname" );
    var_6d7fa02e = struct::get_array( "teleporter" );
    
    foreach ( trigger in var_92b18f69 )
    {
        trigger.destinations = var_6d7fa02e;
        trigger.triggers = getentarray( "teleporter", "targetname" );
        trigger callback::on_trigger( &function_18d7622a );
    }
    
    level flag::wait_till( "first_player_spawned" );
    exploder::exploder( "fxexp_teleporter_a_light_ready" );
    exploder::exploder( "fxexp_teleporter_b_light_ready" );
}

// Namespace mp_zombie_museum_teleporter/mp_zombie_museum_teleporter
// Params 1
// Checksum 0x11cb5e8a, Offset: 0x3f8
// Size: 0x42c
function function_18d7622a( info )
{
    player = info.activator;
    
    if ( isalive( player ) && !( isdefined( self.var_2c3d4111 ) && self.var_2c3d4111 ) )
    {
        foreach ( trig in self.triggers )
        {
            trig.var_2c3d4111 = 1;
        }
        
        destinations = arraysort( self.destinations, self.origin, 0, 1 );
        destination = destinations[ 0 ];
        tell = "fxexp_teleporter_a_tell";
        inuse = "fxexp_teleporter_b_inuse";
        
        if ( destination.var_362fcf1d === "b" )
        {
            tell = "fxexp_teleporter_b_tell";
            inuse = "fxexp_teleporter_a_inuse";
        }
        
        exploder::exploder( inuse );
        exploder::exploder( tell );
        exploder::stop_exploder( "fxexp_teleporter_a_light_ready" );
        exploder::exploder( "fxexp_teleporter_a_light_active" );
        exploder::stop_exploder( "fxexp_teleporter_b_light_ready" );
        exploder::exploder( "fxexp_teleporter_b_light_active" );
        level util::delay( 2, undefined, &exploder::stop_exploder, tell );
        level util::delay( 2, undefined, &exploder::stop_exploder, "fxexp_teleporter_a_light_active" );
        level util::delay( 2.5, undefined, &exploder::exploder, "fxexp_teleporter_a_light_cooldwn" );
        level util::delay( 2, undefined, &exploder::stop_exploder, "fxexp_teleporter_b_light_active" );
        level util::delay( 2.5, undefined, &exploder::exploder, "fxexp_teleporter_b_light_cooldwn" );
        player setorigin( groundtrace( destination.origin, destination.origin + ( 0, 0, -16 ), 0, player )[ #"position" ] );
        player setplayerangles( destination.angles );
        wait 10;
        
        if ( isdefined( self ) )
        {
            foreach ( trig in self.triggers )
            {
                trig.var_2c3d4111 = 0;
            }
        }
        
        exploder::exploder( "fxexp_teleporter_a_light_ready" );
        exploder::stop_exploder( "fxexp_teleporter_a_light_cooldwn" );
        exploder::exploder( "fxexp_teleporter_b_light_ready" );
        exploder::stop_exploder( "fxexp_teleporter_b_light_cooldwn" );
    }
}

