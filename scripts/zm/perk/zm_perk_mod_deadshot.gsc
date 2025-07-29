#using scripts\core_common\callbacks_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_challenges;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_perk_mod_deadshot;

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0, eflags: 0x2
// Checksum 0x8ecd7eb3, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_mod_deadshot", &__init__, undefined, undefined );
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0
// Checksum 0x87a721ca, Offset: 0x108
// Size: 0x42
function __init__()
{
    enable_mod_deadshot_perk_for_level();
    level._effect[ #"hash_950ebbfb250b43e" ] = #"hash_1695e8ac20dd5629";
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0
// Checksum 0x48f35e10, Offset: 0x158
// Size: 0xe4
function enable_mod_deadshot_perk_for_level()
{
    zm_perks::register_perk_mod_basic_info( #"specialty_mod_deadshot", "mod_deadshot", #"perk_dead_shot", #"specialty_deadshot", 3000 );
    zm_perks::register_perk_threads( #"specialty_mod_deadshot", &function_f93c5f09, &function_ce99709d );
    zm_perks::register_actor_damage_override( #"specialty_mod_deadshot", &function_36228265 );
    callback::on_ai_killed( &on_ai_killed );
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0
// Checksum 0xbd911eb8, Offset: 0x248
// Size: 0x44
function function_f93c5f09()
{
    self zm_perks::function_c8c7bc5( 3, 1, #"perk_dead_shot" );
    self reset_counter();
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 4
// Checksum 0x490dae90, Offset: 0x298
// Size: 0x74
function function_ce99709d( b_pause, str_perk, str_result, n_slot )
{
    self zm_perks::function_c8c7bc5( 3, 0, #"perk_dead_shot" );
    self zm_perks::function_f2ff97a6( 3, 0, #"perk_dead_shot" );
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 1
// Checksum 0xb8cf56f8, Offset: 0x318
// Size: 0x15c
function on_ai_killed( params )
{
    e_attacker = params.eattacker;
    
    if ( isplayer( e_attacker ) && e_attacker hasperk( #"specialty_mod_deadshot" ) )
    {
        if ( e_attacker zm_weapons::function_f5a0899d( params.weapon ) )
        {
            if ( self zm_utility::is_headshot( params.weapon, params.shitloc, params.smeansofdeath ) )
            {
                e_attacker.var_957a1762++;
                n_counter = math::clamp( e_attacker.var_957a1762, 0, 5 );
                e_attacker zm_perks::function_f2ff97a6( 3, n_counter, #"perk_dead_shot" );
                
                if ( e_attacker.var_957a1762 == 5 )
                {
                    e_attacker playsoundtoplayer( #"hash_6f931d032000253a", e_attacker );
                }
                
                return;
            }
            
            e_attacker reset_counter();
        }
    }
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0
// Checksum 0x9e73f300, Offset: 0x480
// Size: 0x3c
function reset_counter()
{
    self.var_957a1762 = 0;
    self zm_perks::function_f2ff97a6( 3, self.var_957a1762, #"perk_dead_shot" );
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 12
// Checksum 0xeb5e5fb0, Offset: 0x4c8
// Size: 0x15e
function function_36228265( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    if ( isdefined( attacker.var_957a1762 ) && attacker.var_957a1762 >= 5 && attacker zm_weapons::function_f5a0899d( weapon ) )
    {
        playfx( level._effect[ #"hash_950ebbfb250b43e" ], vpoint );
        var_e99e314 = int( damage * 1.25 );
        
        if ( var_e99e314 >= self.health )
        {
            /#
                attacker zm_challenges::debug_print( "<dev string:x38>" );
            #/
            
            attacker zm_stats::increment_challenge_stat( #"perk_deadshot_kills" );
        }
        
        return var_e99e314;
    }
    
    return damage;
}

