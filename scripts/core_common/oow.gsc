#using scripts\core_common\callbacks_shared;
#using scripts\core_common\map;
#using scripts\core_common\system_shared;
#using scripts\core_common\values_shared;

#namespace oob;

// Namespace oob/oow
// Params 0, eflags: 0x2
// Checksum 0x617098bc, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"out_of_world", &__init__, undefined, undefined );
}

// Namespace oob/oow
// Params 0
// Checksum 0x11c620ed, Offset: 0x100
// Size: 0x5c
function __init__()
{
    level.oow = { #height_min:-2147483647, #height_max:2147483647 };
    callback::on_game_playing( &on_game_playing );
}

// Namespace oob/oow
// Params 0
// Checksum 0x43b466d5, Offset: 0x168
// Size: 0x174
function on_game_playing()
{
    mapbundle = map::get_script_bundle();
    
    if ( isdefined( mapbundle ) )
    {
        if ( !isdefined( mapbundle.var_aa91547b ) )
        {
            mapbundle.var_aa91547b = 0;
        }
        
        if ( !isdefined( mapbundle.var_eac026ad ) )
        {
            mapbundle.var_eac026ad = 0;
        }
        
        if ( mapbundle.var_aa91547b != 0 || mapbundle.var_eac026ad != 0 )
        {
            level.oow.height_min = isdefined( mapbundle.var_aa91547b ) ? mapbundle.var_aa91547b : 0;
            level.oow.height_max = isdefined( mapbundle.var_eac026ad ) ? mapbundle.var_eac026ad : 0;
            assert( level.oow.height_min <= level.oow.height_max );
            
            if ( !( level.oow.height_min <= level.oow.height_max ) )
            {
                return;
            }
        }
    }
    
    level thread function_e8f5803d();
}

// Namespace oob/oow
// Params 0
// Checksum 0xaab2194b, Offset: 0x2e8
// Size: 0x118
function function_e8f5803d()
{
    while ( true )
    {
        wait 5;
        
        foreach ( team, _ in level.teams )
        {
            foreach ( player in level.aliveplayers[ team ] )
            {
                if ( !isdefined( player ) )
                {
                    continue;
                }
                
                if ( player function_eb7eb3d4() )
                {
                    kill_entity( player );
                }
            }
        }
    }
}

// Namespace oob/oow
// Params 0
// Checksum 0x98cb7091, Offset: 0x408
// Size: 0x9e, Type: bool
function function_eb7eb3d4()
{
    if ( !isdefined( self ) )
    {
        return false;
    }
    
    /#
        if ( self isinmovemode( "<dev string:x38>", "<dev string:x3e>" ) )
        {
            return false;
        }
    #/
    
    height = self.origin[ 2 ];
    
    if ( level.oow.height_min > height || level.oow.height_max < height )
    {
        return true;
    }
    
    return false;
}

// Namespace oob/oow
// Params 1
// Checksum 0xdb9d8081, Offset: 0x4b0
// Size: 0x1dc
function kill_entity( entity )
{
    if ( isplayer( entity ) && entity isinvehicle() )
    {
        vehicle = entity getvehicleoccupied();
        occupants = vehicle getvehoccupants();
        
        foreach ( occupant in occupants )
        {
            occupant unlink();
        }
        
        if ( !( isdefined( vehicle.allowdeath ) && !vehicle.allowdeath ) )
        {
            vehicle dodamage( vehicle.health + 10000, vehicle.origin, undefined, undefined, "none", "MOD_EXPLOSIVE", 8192 );
        }
    }
    
    entity dodamage( entity.health + 10000, entity.origin, undefined, undefined, "none", "MOD_TRIGGER_HURT", 8192 | 16384 );
    
    if ( isplayer( entity ) )
    {
        entity suicide();
    }
}

