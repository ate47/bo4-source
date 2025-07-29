#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_stats;

#namespace zm_bgb_head_scan;

// Namespace zm_bgb_head_scan/zm_bgb_head_scan
// Params 0, eflags: 0x2
// Checksum 0x84932618, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_bgb_head_scan", &__init__, undefined, "bgb" );
}

// Namespace zm_bgb_head_scan/zm_bgb_head_scan
// Params 0
// Checksum 0x88689e1d, Offset: 0xf0
// Size: 0xa4
function __init__()
{
    if ( !( isdefined( level.bgb_in_use ) && level.bgb_in_use ) )
    {
        return;
    }
    
    bgb::register( #"zm_bgb_head_scan", "time", 120, &enable, &disable, undefined, undefined );
    bgb::register_actor_damage_override( #"zm_bgb_head_scan", &function_ce76fa9f );
}

// Namespace zm_bgb_head_scan/zm_bgb_head_scan
// Params 0
// Checksum 0x80f724d1, Offset: 0x1a0
// Size: 0x4
function enable()
{
    
}

// Namespace zm_bgb_head_scan/zm_bgb_head_scan
// Params 0
// Checksum 0x80f724d1, Offset: 0x1b0
// Size: 0x4
function disable()
{
    
}

// Namespace zm_bgb_head_scan/zm_bgb_head_scan
// Params 12
// Checksum 0xe06e9db0, Offset: 0x1c0
// Size: 0x18e
function function_ce76fa9f( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    if ( !isdefined( self.zm_ai_category ) )
    {
        return damage;
    }
    
    switch ( shitloc )
    {
        case #"head":
        case #"helmet":
        case #"neck":
            switch ( self.zm_ai_category )
            {
                case #"popcorn":
                case #"basic":
                case #"enhanced":
                    if ( math::cointoss( 11 ) )
                    {
                        gibserverutils::gibhead( self );
                        attacker zm_stats::increment_challenge_stat( #"hash_5d098efca02f7c99" );
                        return self.health;
                    }
                    
                    break;
            }
            
            break;
        default:
            return damage;
    }
    
    return damage;
}

