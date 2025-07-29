#using script_652cf01d4f20aeb5;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_orange_snowball_piles;

// Namespace zm_orange_snowball_piles/zm_orange_snowball_piles
// Params 0
// Checksum 0xb06df3ba, Offset: 0x108
// Size: 0x184
function init()
{
    a_s_snowball_piles = struct::get_array( "snowball_pile" );
    
    foreach ( s_snowball_pile in a_s_snowball_piles )
    {
        if ( isdefined( s_snowball_pile.model ) )
        {
            s_snowball_pile.e_model = util::spawn_model( s_snowball_pile.model, s_snowball_pile.origin, s_snowball_pile.angles );
        }
        
        s_snowball_pile zm_unitrigger::create( &function_dd028fcb, 64 );
        s_snowball_pile.s_unitrigger.origin += ( 0, 0, 32 );
        s_snowball_pile thread function_608b90b4();
        s_snowball_pile.var_1c1b4398 = 0;
    }
    
    if ( zm_utility::is_trials() )
    {
        callback::on_spawned( &function_e1b7c710 );
    }
}

// Namespace zm_orange_snowball_piles/zm_orange_snowball_piles
// Params 1, eflags: 0x4
// Checksum 0x7290cfb0, Offset: 0x298
// Size: 0xb2
function private function_dd028fcb( e_player )
{
    var_d49d10b0 = e_player zm_loadout::get_player_lethal_grenade();
    
    if ( var_d49d10b0 === level.weaponnone )
    {
        return 0;
    }
    
    if ( level flag::get( #"hash_5e095d53ae9513f5" ) )
    {
        self sethintstring( #"hash_7a1ce549121dd33f" );
        return 1;
    }
    
    self sethintstring( #"hash_16b4b2b59405ab16" );
    return 1;
}

// Namespace zm_orange_snowball_piles/zm_orange_snowball_piles
// Params 0, eflags: 0x4
// Checksum 0xc642a8d7, Offset: 0x358
// Size: 0xc6
function private function_608b90b4()
{
    self endon( #"end_game" );
    
    while ( true )
    {
        s_notify = self waittill( #"trigger_activated" );
        e_player = s_notify.e_who;
        e_player function_79ef6b93();
        
        if ( !isdefined( e_player.var_61fca2c3 ) || e_player.var_61fca2c3 == 0 )
        {
            e_player thread zm_orange_util::function_51b752a9( "vox_snowball_pickup" );
            e_player.var_61fca2c3 = 1;
        }
    }
}

// Namespace zm_orange_snowball_piles/zm_orange_snowball_piles
// Params 0
// Checksum 0x476d09b8, Offset: 0x428
// Size: 0x3fc
function function_79ef6b93()
{
    var_d49d10b0 = self zm_loadout::get_player_lethal_grenade();
    self playsound( "fly_pickup_snowball" );
    
    if ( isdefined( self.var_3b55baa1 ) && ( var_d49d10b0 == level.w_snowball || var_d49d10b0 == level.w_snowball_upgraded || var_d49d10b0 == level.w_snowball_yellow || var_d49d10b0 == level.w_snowball_yellow_upgraded ) )
    {
        if ( level flag::get( #"hash_5e095d53ae9513f5" ) )
        {
            if ( var_d49d10b0 == level.w_snowball || var_d49d10b0 == level.w_snowball_upgraded )
            {
                if ( level flag::get( #"extra_snowballs" ) )
                {
                    self zm_weapons::weapon_give( level.w_snowball_yellow_upgraded, 1, 0 );
                }
                else
                {
                    self zm_weapons::weapon_give( level.w_snowball_yellow, 1, 0 );
                }
            }
            else if ( level flag::get( #"extra_snowballs" ) && var_d49d10b0 == level.w_snowball_yellow )
            {
                self zm_weapons::weapon_give( level.w_snowball_yellow_upgraded, 1, 0 );
            }
        }
        else if ( level flag::get( #"extra_snowballs" ) && var_d49d10b0 == level.w_snowball )
        {
            self zm_weapons::weapon_give( level.w_snowball_upgraded, 1, 0 );
        }
        
        n_slot = self gadgetgetslot( var_d49d10b0 );
        self gadgetpowerreset( n_slot, 0 );
        self thread function_76e94d52();
        return;
    }
    
    self.var_3b55baa1 = var_d49d10b0;
    n_slot = self gadgetgetslot( var_d49d10b0 );
    self.var_e01bb56 = self gadgetpowerget( n_slot );
    
    if ( level flag::get( #"hash_5e095d53ae9513f5" ) )
    {
        if ( level flag::get( #"extra_snowballs" ) )
        {
            self zm_weapons::weapon_give( level.w_snowball_yellow_upgraded, 1, 0 );
        }
        else
        {
            self zm_weapons::weapon_give( level.w_snowball_yellow, 1, 0 );
        }
    }
    else if ( level flag::get( #"extra_snowballs" ) )
    {
        self zm_weapons::weapon_give( level.w_snowball_upgraded, 1, 0 );
    }
    else
    {
        self zm_weapons::weapon_give( level.w_snowball, 1, 0 );
    }
    
    self thread function_76e94d52();
    self callback::on_laststand( &function_3bb2f43b );
}

// Namespace zm_orange_snowball_piles/zm_orange_snowball_piles
// Params 0
// Checksum 0xce75c00d, Offset: 0x830
// Size: 0xfc
function function_3bb2f43b()
{
    if ( isdefined( self.var_3b55baa1 ) && isdefined( self.var_e01bb56 ) && self function_75a76099() )
    {
        self zm_loadout::set_player_lethal_grenade( self.var_3b55baa1 );
        self zm_weapons::weapon_give( self.var_3b55baa1, 1, 0 );
        n_slot = self gadgetgetslot( self.var_3b55baa1 );
        self gadgetpowerset( n_slot, self.var_e01bb56 );
        self.var_3b55baa1 = undefined;
        self.var_e01bb56 = undefined;
        self notify( #"grenade_change" );
        self callback::remove_on_laststand( &function_3bb2f43b );
    }
}

// Namespace zm_orange_snowball_piles/zm_orange_snowball_piles
// Params 0
// Checksum 0x2b4ecb01, Offset: 0x938
// Size: 0x26c
function function_76e94d52()
{
    self notify( #"grenade_change" );
    self endon( #"grenade_change" );
    level endon( #"end_game" );
    
    while ( true )
    {
        var_d49d10b0 = self zm_loadout::get_player_lethal_grenade();
        
        if ( self function_75a76099() )
        {
            var_d8b1f3e3 = self getweaponammoclip( var_d49d10b0 );
            
            if ( self getweaponammoclip( var_d49d10b0 ) <= 0 )
            {
                wait 1;
                
                if ( isdefined( self.var_3b55baa1 ) && isdefined( self.var_e01bb56 ) && self function_75a76099() )
                {
                    self zm_loadout::set_player_lethal_grenade( self.var_3b55baa1 );
                    self zm_weapons::weapon_give( self.var_3b55baa1, 1, 0 );
                    n_slot = self gadgetgetslot( self.var_3b55baa1 );
                    self gadgetpowerset( n_slot, self.var_e01bb56 );
                    self.var_3b55baa1 = undefined;
                    self.var_e01bb56 = undefined;
                    self function_820a63e9( n_slot, 1 );
                    wait 1;
                    self function_820a63e9( n_slot, 0 );
                    self callback::remove_on_laststand( &function_3bb2f43b );
                    self notify( #"grenade_change" );
                }
            }
        }
        else
        {
            if ( self.var_3b55baa1 == getweapon( #"music_box" ) )
            {
                namespace_5449c7ba::function_96d95cf5();
            }
            
            self.var_3b55baa1 = undefined;
            self.var_e01bb56 = undefined;
            self notify( #"grenade_change" );
        }
        
        wait 0.5;
    }
}

// Namespace zm_orange_snowball_piles/zm_orange_snowball_piles
// Params 0
// Checksum 0xc252861c, Offset: 0xbb0
// Size: 0x88, Type: bool
function function_75a76099()
{
    var_d49d10b0 = self zm_loadout::get_player_lethal_grenade();
    
    if ( isdefined( var_d49d10b0 ) && ( var_d49d10b0 == level.w_snowball || var_d49d10b0 == level.w_snowball_upgraded || var_d49d10b0 == level.w_snowball_yellow || var_d49d10b0 == level.w_snowball_yellow_upgraded ) )
    {
        return true;
    }
    
    return false;
}

// Namespace zm_orange_snowball_piles/zm_orange_snowball_piles
// Params 0
// Checksum 0x2d9621e6, Offset: 0xc40
// Size: 0x116
function function_e1b7c710()
{
    level flag::wait_till_any( array( "round_reset", #"trial_failed" ) );
    
    if ( isdefined( self.var_3b55baa1 ) && isdefined( self.var_e01bb56 ) && self function_75a76099() )
    {
        self zm_loadout::set_player_lethal_grenade( self.var_3b55baa1 );
        self zm_weapons::weapon_give( self.var_3b55baa1, 1, 0 );
        n_slot = self gadgetgetslot( self.var_3b55baa1 );
        self gadgetpowerset( n_slot, self.var_e01bb56 );
        self.var_3b55baa1 = undefined;
        self.var_e01bb56 = undefined;
        self notify( #"grenade_change" );
    }
}

