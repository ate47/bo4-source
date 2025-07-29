#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\killcam_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\weapons_shared;
#using scripts\weapons\weaponobjects;

#namespace decoygrenade;

// Namespace decoygrenade/decoy_grenade
// Params 0, eflags: 0x2
// Checksum 0x726cfdf2, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"decoygrenade", &init_shared, undefined, undefined );
}

// Namespace decoygrenade/decoy_grenade
// Params 0
// Checksum 0xb2553359, Offset: 0x158
// Size: 0x6c
function init_shared()
{
    weaponobjects::function_e6400478( #"eq_decoy_grenade", &function_41625261, 1 );
    clientfield::register( "missile", "decoy_grenade_footsteps", 1, 1, "int" );
}

// Namespace decoygrenade/decoy_grenade
// Params 1
// Checksum 0x24590163, Offset: 0x1d0
// Size: 0x3e
function function_41625261( watcher )
{
    watcher.onspawn = &on_spawn;
    watcher.ondamage = &on_damage;
}

// Namespace decoygrenade/decoy_grenade
// Params 1
// Checksum 0x3a9efc3, Offset: 0x218
// Size: 0x124
function on_spawn( watcher )
{
    self endon( #"death" );
    grenade = self;
    grenade thread play_footsteps();
    grenade.var_f64cb8d = function_a5871d04( grenade );
    grenade waittill( #"stationary" );
    grenade setcandamage( 1 );
    grenade.maxhealth = 10000;
    grenade.health = grenade.maxhealth;
    grenade setmaxhealth( grenade.maxhealth );
    grenade notify( #"hash_5a09ded231e405ad" );
    grenade clientfield::set( "decoy_grenade_footsteps", 0 );
    grenade function_e9d18b65();
}

// Namespace decoygrenade/decoy_grenade
// Params 0
// Checksum 0x66fdb79f, Offset: 0x348
// Size: 0x68
function play_footsteps()
{
    self endon( #"death", #"hash_5a09ded231e405ad" );
    wait 0.25;
    
    while ( true )
    {
        self playsound( #"fly_step_sprint_plr_default" );
        wait 0.23;
    }
}

// Namespace decoygrenade/decoy_grenade
// Params 0
// Checksum 0x896658f, Offset: 0x3b8
// Size: 0x1e8
function function_e9d18b65()
{
    self endon( #"death" );
    grenade = self;
    wait 0.2;
    weapon = getweapon( grenade.var_f64cb8d.weapon );
    var_fa7f044f = 0;
    
    while ( true )
    {
        burst_time = randomfloatrange( grenade.var_f64cb8d.var_5cae5968, grenade.var_f64cb8d.var_bbed619f );
        burst_time *= 1000;
        var_f370a5d5 = gettime() + burst_time;
        
        while ( gettime() <= var_f370a5d5 )
        {
            grenade playsound( #"wpn_ar_standard_fire_plr" );
            var_fa7f044f += 1;
            
            if ( var_fa7f044f >= weapon.clipsize )
            {
                var_fa7f044f = 0;
                grenade function_7c24c60f( weapon.reloadtime );
                continue;
            }
            
            wait weapon.firetime;
        }
        
        if ( var_fa7f044f >= weapon.clipsize )
        {
            var_fa7f044f = 0;
            grenade function_7c24c60f( weapon.reloadtime );
            continue;
        }
        
        burst_delay = randomfloatrange( grenade.var_f64cb8d.var_c8670194, grenade.var_f64cb8d.var_ebc63eca );
        wait burst_delay;
    }
}

// Namespace decoygrenade/decoy_grenade
// Params 1
// Checksum 0x4dbc3a84, Offset: 0x5a8
// Size: 0x8a
function function_7c24c60f( reloadtime )
{
    self endon( #"death" );
    time_ratio = reloadtime / 3;
    wait time_ratio;
    self playsound( #"hash_337f5ae3f1674ad3" );
    wait time_ratio;
    self playsound( #"hash_7a315f233edf3cba" );
    wait time_ratio;
}

// Namespace decoygrenade/decoy_grenade
// Params 1
// Checksum 0x291b619b, Offset: 0x640
// Size: 0x92
function function_a5871d04( grenade )
{
    var_f64cb8d = spawnstruct();
    var_f64cb8d.weapon = #"ar_standard_t8";
    var_f64cb8d.var_5cae5968 = 0.25;
    var_f64cb8d.var_bbed619f = 1;
    var_f64cb8d.var_c8670194 = 0.25;
    var_f64cb8d.var_ebc63eca = 1;
    return var_f64cb8d;
}

// Namespace decoygrenade/decoy_grenade
// Params 1
// Checksum 0x24ebb561, Offset: 0x6e0
// Size: 0x1aa
function on_damage( watcher )
{
    self endon( #"death" );
    damagemax = 50;
    self.damagetaken = 0;
    
    while ( true )
    {
        waitresult = self waittill( #"damage" );
        damage = waitresult.amount;
        type = waitresult.mod;
        weapon = waitresult.weapon;
        
        if ( !isdefined( self.damagetaken ) )
        {
            self.damagetaken = 0;
        }
        
        attacker = self [[ level.figure_out_attacker ]]( waitresult.attacker );
        damage = weapons::function_74bbb3fa( damage, weapon, self.weapon );
        
        if ( type == "MOD_MELEE" || type == "MOD_MELEE_WEAPON_BUTT" || weapon.isemp || weapon.destroysequipment )
        {
            self.damagetaken = damagemax;
        }
        else
        {
            self.damagetaken += damage;
        }
        
        if ( self.damagetaken >= damagemax )
        {
            self detonate();
            return;
        }
    }
}

