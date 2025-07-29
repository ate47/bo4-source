#using scripts\abilities\gadgets\gadget_smart_cover;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\mp_common\gametypes\battlechatter;
#using scripts\mp_common\util;

#namespace smart_cover;

// Namespace smart_cover/gadget_smart_cover
// Params 0, eflags: 0x2
// Checksum 0x7fd5cc09, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"smart_cover", &__init__, undefined, undefined );
}

// Namespace smart_cover/gadget_smart_cover
// Params 0
// Checksum 0x7f8b71a7, Offset: 0xf8
// Size: 0x6e
function __init__()
{
    init_shared();
    function_649f8cbe( &onsmartcoverplaced );
    function_a9427b5c( &function_a430cceb );
    level.var_b57c1895 = &function_9a2b3318;
}

// Namespace smart_cover/gadget_smart_cover
// Params 1
// Checksum 0x94ecfb2f, Offset: 0x170
// Size: 0x8c
function onsmartcoverplaced( smartcover )
{
    self battlechatter::function_bd715920( smartcover.weapon, undefined, smartcover.origin, smartcover );
    self callback::callback( #"hash_70eeb7d813f149b2", { #owner:self, #cover:smartcover.smartcover } );
}

// Namespace smart_cover/gadget_smart_cover
// Params 2
// Checksum 0xe1301a9, Offset: 0x208
// Size: 0x104
function function_a430cceb( attacker, weapon )
{
    concertinawire = self;
    
    if ( isdefined( level.figure_out_attacker ) )
    {
        attacker = self [[ level.figure_out_attacker ]]( attacker );
    }
    
    if ( isdefined( attacker ) && isplayer( attacker ) && concertinawire.owner !== attacker && isdefined( weapon ) )
    {
        attacker stats::function_e24eec31( weapon, #"hash_1c9da51ed1906285", 1 );
    }
    
    self callback::callback( #"hash_15858698313c5f32", { #owner:self.owner, #cover:self } );
}

// Namespace smart_cover/gadget_smart_cover
// Params 3
// Checksum 0x9e3aae50, Offset: 0x318
// Size: 0x15e, Type: bool
function function_9a2b3318( origin, angles, player )
{
    if ( isdefined( level.smartcoversettings.bundle.var_bc78f60e ) )
    {
        length2 = ( level.smartcoversettings.bundle.var_bc78f60e + level.smartcoversettings.bundle.maxwidth ) * ( level.smartcoversettings.bundle.var_bc78f60e + level.smartcoversettings.bundle.maxwidth );
        
        foreach ( protectedzone in level.smartcoversettings.objectivezones )
        {
            if ( isdefined( protectedzone ) )
            {
                dist2 = distance2dsquared( origin, protectedzone.origin );
                
                if ( dist2 < length2 )
                {
                    return false;
                }
            }
        }
    }
    
    return true;
}

// Namespace smart_cover/gadget_smart_cover
// Params 1
// Checksum 0x584d81c2, Offset: 0x480
// Size: 0x34
function addprotectedzone( zone )
{
    array::add( level.smartcoversettings.objectivezones, zone );
}

// Namespace smart_cover/gadget_smart_cover
// Params 1
// Checksum 0x393c9bac, Offset: 0x4c0
// Size: 0x34
function removeprotectedzone( zone )
{
    arrayremovevalue( level.smartcoversettings.objectivezones, zone );
}

