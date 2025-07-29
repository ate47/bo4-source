#using script_24c32478acf44108;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_wraith_fire;

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 0, eflags: 0x2
// Checksum 0xee3b6dbb, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"wraith_fire_zm", &__init__, &__main__, undefined );
}

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 0
// Checksum 0x54ab3515, Offset: 0x108
// Size: 0x22c
function __init__()
{
    zm::function_84d343d( #"eq_wraith_fire", &function_36a0ef3 );
    zm::function_84d343d( #"eq_wraith_fire_extra", &function_36a0ef3 );
    zm::function_84d343d( #"wraith_fire_fire", &function_2b4945e4 );
    zm::function_84d343d( #"wraith_fire_fire_small", &function_2b4945e4 );
    zm::function_84d343d( #"wraith_fire_fire_tall", &function_2b4945e4 );
    zm::function_84d343d( #"wraith_fire_fire_wall", &function_2b4945e4 );
    zm::function_84d343d( #"wraith_fire_steam", &function_2b4945e4 );
    namespace_9ff9f642::register_burn( #"eq_wraith_fire", 50, 5, "" + #"hash_682f9312e30af478", "" + #"hash_7fcff4f8340f11f7" );
    clientfield::register( "actor", "" + #"hash_682f9312e30af478", 1, 1, "int" );
    clientfield::register( "actor", "" + #"hash_7fcff4f8340f11f7", 1, 1, "int" );
}

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 0
// Checksum 0x21f3c7c4, Offset: 0x340
// Size: 0x12
function __main__()
{
    level.var_c62ed297 = 1;
}

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 12
// Checksum 0x9a285a74, Offset: 0x360
// Size: 0xd2
function function_36a0ef3( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    var_b1c1c5cf = zm_equipment::function_7d948481( 0.1, 0.25, 0.25, 1 );
    var_bb6709b6 = zm_equipment::function_379f6b5d( damage, var_b1c1c5cf, 1, 4, 40 );
    return var_bb6709b6;
}

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 12
// Checksum 0x65a2c71a, Offset: 0x440
// Size: 0x11a
function function_2b4945e4( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    self namespace_9ff9f642::burn( #"eq_wraith_fire", attacker, getweapon( #"eq_wraith_fire" ), 50 );
    var_b1c1c5cf = zm_equipment::function_7d948481( 0.1, 0.25, 0.25, 1 );
    n_damage = zm_equipment::function_379f6b5d( damage, var_b1c1c5cf, 1, 4, 40 );
    return n_damage;
}

