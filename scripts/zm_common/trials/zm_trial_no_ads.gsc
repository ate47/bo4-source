#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace zm_trial_no_ads;

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 0, eflags: 0x2
// Checksum 0xadf9008c, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_no_ads", &__init__, undefined, undefined );
}

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 0
// Checksum 0x2df09c9d, Offset: 0x108
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"no_ads", &on_begin, &on_end );
}

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 0, eflags: 0x4
// Checksum 0x9d976d51, Offset: 0x170
// Size: 0x284
function private on_begin()
{
    callback::on_spawned( &function_dc856fd8 );
    callback::on_ai_spawned( &on_ai_spawned );
    
    foreach ( player in getplayers() )
    {
        player zm_trial_util::function_8677ce00( 1 );
        player allowads( 0 );
        player._allow_ads = 0;
        player thread function_dc856fd8();
        player thread function_16824dc3();
        player thread function_2d961b95();
        player zm_trial_util::function_9bf8e274();
        
        foreach ( w_equip in level.zombie_weapons )
        {
            if ( zm_loadout::is_lethal_grenade( w_equip.weapon ) || zm_loadout::is_melee_weapon( w_equip.weapon ) )
            {
                player lockweapon( w_equip.weapon, 1, 1 );
            }
        }
        
        player zm_trial_util::function_dc9ab223( 1, 1 );
    }
    
    callback::function_33f0ddd3( &function_33f0ddd3 );
    level zm_trial::function_44200d07( 1 );
    level zm_trial::function_cd75b690( 1 );
}

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 1, eflags: 0x4
// Checksum 0x1f54641f, Offset: 0x400
// Size: 0x264
function private on_end( round_reset )
{
    callback::remove_on_spawned( &function_dc856fd8 );
    callback::function_824d206( &function_33f0ddd3 );
    callback::remove_on_ai_spawned( &on_ai_spawned );
    
    foreach ( player in getplayers() )
    {
        player notify( #"allow_ads" );
        player._allow_ads = undefined;
        player allowads( 1 );
        player function_4488a530( 0 );
        player zm_trial_util::function_73ff0096();
        
        foreach ( w_equip in level.zombie_weapons )
        {
            if ( zm_loadout::is_lethal_grenade( w_equip.weapon ) || zm_loadout::is_melee_weapon( w_equip.weapon ) )
            {
                player unlockweapon( w_equip.weapon );
            }
        }
        
        player zm_trial_util::function_dc9ab223( 0, 1 );
        player zm_trial_util::function_8677ce00( 0 );
    }
    
    level zm_trial::function_44200d07( 0 );
    level zm_trial::function_cd75b690( 0 );
}

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 1
// Checksum 0xaea3aed7, Offset: 0x670
// Size: 0x24
function on_ai_spawned( params )
{
    self disableaimassist();
}

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 0, eflags: 0x4
// Checksum 0xd00fc1ee, Offset: 0x6a0
// Size: 0xc0
function private function_dc856fd8()
{
    self notify( "7b8b17371dc9188f" );
    self endon( "7b8b17371dc9188f" );
    self endon( #"disconnect", #"allow_ads" );
    self allowads( 0 );
    
    while ( true )
    {
        self waittill( #"crafting_fail", #"crafting_success", #"bgb_update" );
        
        if ( isalive( self ) )
        {
            self allowads( 0 );
        }
    }
}

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 0, eflags: 0x4
// Checksum 0x5a3c4c17, Offset: 0x768
// Size: 0xea
function private function_16824dc3()
{
    self endon( #"disconnect", #"allow_ads" );
    
    while ( true )
    {
        w_curr = self getcurrentweapon();
        
        if ( isalive( self ) && self adsbuttonpressed() && ( w_curr.dualwieldweapon === level.weaponnone || w_curr.isriotshield ) )
        {
            self zm_trial_util::function_97444b02();
            
            while ( self adsbuttonpressed() )
            {
                waitframe( 1 );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 1, eflags: 0x4
// Checksum 0xb840dfb3, Offset: 0x860
// Size: 0xb4
function private function_33f0ddd3( s_event )
{
    if ( s_event.event === "give_weapon" )
    {
        self lockweapon( s_event.weapon, 0, 1 );
        
        if ( zm_loadout::is_melee_weapon( s_event.weapon ) || zm_loadout::is_lethal_grenade( s_event.weapon ) )
        {
            self lockweapon( s_event.weapon, 1, 1 );
        }
    }
}

// Namespace zm_trial_no_ads/zm_trial_no_ads
// Params 0
// Checksum 0x5d77d366, Offset: 0x920
// Size: 0xb8
function function_2d961b95()
{
    self endon( #"disconnect", #"allow_ads" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"weapon_change" );
        
        if ( isalive( self ) )
        {
            if ( s_waitresult.weapon.isriotshield )
            {
                self function_4488a530( 1 );
                continue;
            }
            
            self function_4488a530( 0 );
        }
    }
}

