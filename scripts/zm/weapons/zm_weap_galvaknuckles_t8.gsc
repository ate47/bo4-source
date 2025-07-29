#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_melee_weapon;

#namespace zm_weap_galvaknuckles_t8;

// Namespace zm_weap_galvaknuckles_t8/zm_weap_galvaknuckles_t8
// Params 0, eflags: 0x2
// Checksum 0x6ccd1399, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"galvaknuckles", &__init__, &__main__, undefined );
}

// Namespace zm_weap_galvaknuckles_t8/zm_weap_galvaknuckles_t8
// Params 0, eflags: 0x4
// Checksum 0x60cd2c99, Offset: 0xf0
// Size: 0x6c
function private __init__()
{
    zm_loadout::register_melee_weapon_for_level( #"galvaknuckles_t8" );
    level.var_b77d3496 = getweapon( #"galvaknuckles_t8" );
    callback::on_ai_killed( &on_ai_killed );
}

// Namespace zm_weap_galvaknuckles_t8/zm_weap_galvaknuckles_t8
// Params 0, eflags: 0x4
// Checksum 0x1392d2a5, Offset: 0x168
// Size: 0x54
function private __main__()
{
    zm_melee_weapon::init( #"galvaknuckles_t8", #"galvaknuckles_t8_flourish", 5000, "tazer_upgrade", #"hash_60606b68e93a29c8", "galva", undefined );
}

// Namespace zm_weap_galvaknuckles_t8/zm_weap_galvaknuckles_t8
// Params 1
// Checksum 0xf4ce94c6, Offset: 0x1c8
// Size: 0x104
function on_ai_killed( s_params )
{
    wait 0.15;
    
    if ( s_params.weapon === level.var_b77d3496 && isdefined( self ) && isactor( self ) && isdefined( s_params.eattacker ) )
    {
        var_5b84ed9a = s_params.eattacker getcentroid();
        var_2640e082 = 15 * ( vectornormalize( self getcentroid() - var_5b84ed9a ) + ( 0, 0, 0.1 ) );
        self startragdoll();
        self launchragdoll( var_2640e082 );
    }
}

