#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace zm_trial_no_sprint;

// Namespace zm_trial_no_sprint/zm_trial_no_sprint
// Params 0, eflags: 0x2
// Checksum 0x5c6b5b5a, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_no_sprint", &__init__, undefined, undefined );
}

// Namespace zm_trial_no_sprint/zm_trial_no_sprint
// Params 0
// Checksum 0x76483871, Offset: 0xe8
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"no_sprint", &on_begin, &on_end );
}

// Namespace zm_trial_no_sprint/zm_trial_no_sprint
// Params 0, eflags: 0x4
// Checksum 0x22315cbd, Offset: 0x150
// Size: 0xe0
function private on_begin()
{
    callback::on_spawned( &function_dc856fd8 );
    
    foreach ( player in getplayers() )
    {
        player allowsprint( 0 );
        player._allow_sprint = 0;
        player thread function_dc856fd8();
        player thread function_31f500f();
    }
}

// Namespace zm_trial_no_sprint/zm_trial_no_sprint
// Params 1, eflags: 0x4
// Checksum 0xcba2e833, Offset: 0x238
// Size: 0xd0
function private on_end( round_reset )
{
    callback::remove_on_spawned( &function_dc856fd8 );
    
    foreach ( player in getplayers() )
    {
        player notify( #"allow_sprint" );
        player._allow_sprint = undefined;
        player allowsprint( 1 );
    }
}

// Namespace zm_trial_no_sprint/zm_trial_no_sprint
// Params 0, eflags: 0x4
// Checksum 0xb45acb64, Offset: 0x310
// Size: 0xc0
function private function_dc856fd8()
{
    self notify( "374b3a40e7866d07" );
    self endon( "374b3a40e7866d07" );
    self endon( #"disconnect", #"allow_sprint" );
    self allowsprint( 0 );
    
    while ( true )
    {
        self waittill( #"crafting_fail", #"crafting_success", #"bgb_update" );
        
        if ( isalive( self ) )
        {
            self allowsprint( 0 );
        }
    }
}

// Namespace zm_trial_no_sprint/zm_trial_no_sprint
// Params 0, eflags: 0x4
// Checksum 0xb52101c0, Offset: 0x3d8
// Size: 0xa2
function private function_31f500f()
{
    self endon( #"disconnect", #"allow_sprint" );
    
    while ( true )
    {
        if ( isalive( self ) && self sprintbuttonpressed() )
        {
            self zm_trial_util::function_97444b02();
            
            while ( self sprintbuttonpressed() )
            {
                waitframe( 1 );
            }
        }
        
        waitframe( 1 );
    }
}

