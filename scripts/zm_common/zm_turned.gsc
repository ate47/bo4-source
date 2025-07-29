#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\zm_common\gametypes\spawnlogic;
#using scripts\zm_common\gametypes\zm_gametype;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_utility;

#namespace zm_turned;

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0xe32fc491, Offset: 0x250
// Size: 0x17c
function init()
{
    dvar = util::get_game_type();
    
    if ( dvar == "zcleansed" )
    {
        level.weaponzmturnedmelee = getweapon( #"zombiemelee" );
        level.weaponzmturnedmeleedw = getweapon( #"zombiemelee_dw" );
        
        if ( !isdefined( level.vsmgr_prio_visionset_zombie_turned ) )
        {
            level.vsmgr_prio_visionset_zombie_turned = 123;
        }
        
        visionset_mgr::register_info( "visionset", "zombie_turned", 1, level.vsmgr_prio_visionset_zombie_turned, 1, 1 );
        clientfield::register( "toplayer", "turned_ir", 1, 1, "int" );
        clientfield::register( "allplayers", "player_has_eyes", 1, 1, "int" );
        clientfield::register( "allplayers", "player_eyes_special", 1, 1, "int" );
        thread setup_zombie_exerts();
    }
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0xa3c0fd12, Offset: 0x3d8
// Size: 0x88
function setup_zombie_exerts()
{
    waitframe( 1 );
    level.exert_sounds[ 1 ][ #"burp" ] = "null";
    level.exert_sounds[ 1 ][ #"hitmed" ] = "null";
    level.exert_sounds[ 1 ][ #"hitlrg" ] = "null";
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0x5fd75a96, Offset: 0x468
// Size: 0x64
function delay_turning_on_eyes()
{
    self endon( #"death", #"disconnect" );
    util::wait_network_frame();
    wait 0.1;
    self clientfield::set( "player_has_eyes", 1 );
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0xb8239f48, Offset: 0x4d8
// Size: 0x6e6
function turn_to_zombie()
{
    if ( self.sessionstate == "playing" && isdefined( self.is_zombie ) && self.is_zombie && !( isdefined( self.laststand ) && self.laststand ) )
    {
        return;
    }
    
    if ( isdefined( self.is_in_process_of_zombify ) && self.is_in_process_of_zombify )
    {
        return;
    }
    
    while ( isdefined( self.is_in_process_of_humanify ) && self.is_in_process_of_humanify )
    {
        wait 0.1;
    }
    
    if ( !level flag::get( "pregame" ) )
    {
        self playsoundtoplayer( #"evt_spawn", self );
        playsoundatposition( #"evt_disappear_3d", self.origin );
        
        if ( !self.is_zombie )
        {
            playsoundatposition( #"vox_plr_" + randomintrange( 0, 4 ) + "_exert_death_high_" + randomintrange( 0, 4 ), self.origin );
        }
    }
    
    self._can_score = 1;
    self clientfield::set( "player_has_eyes", 0 );
    self ghost();
    self turned_disable_player_weapons();
    self notify( #"clear_red_flashing_overlay" );
    self notify( #"zombify" );
    self.is_in_process_of_zombify = 1;
    self.team = level.zombie_team;
    self.pers[ #"team" ] = level.zombie_team;
    self.sessionteam = level.zombie_team;
    util::wait_network_frame();
    self zm_gametype::onspawnplayer();
    self val::set( #"turn_to_zombie", "freezecontrols", 1 );
    self.is_zombie = 1;
    self setburn( 0 );
    
    if ( isdefined( self.turned_visionset ) && self.turned_visionset )
    {
        visionset_mgr::deactivate( "visionset", "zombie_turned", self );
        util::wait_network_frame();
        util::wait_network_frame();
        
        if ( !isdefined( self ) )
        {
            return;
        }
    }
    
    visionset_mgr::activate( "visionset", "zombie_turned", self );
    self.turned_visionset = 1;
    self clientfield::set_to_player( "turned_ir", 1 );
    self zm_audio::setexertvoice( 1 );
    self.laststand = undefined;
    util::wait_network_frame();
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self enableweapons();
    self show();
    playsoundatposition( #"evt_appear_3d", self.origin );
    playsoundatposition( #"zmb_zombie_spawn", self.origin );
    self thread delay_turning_on_eyes();
    self thread turned_player_buttons();
    self setperk( "specialty_playeriszombie" );
    self setperk( "specialty_unlimitedsprint" );
    self setperk( "specialty_fallheight" );
    self turned_give_melee_weapon();
    self setmovespeedscale( 1 );
    self.animname = "zombie";
    self disableoffhandweapons();
    self allowstand( 1 );
    self allowprone( 0 );
    self allowcrouch( 0 );
    self allowads( 0 );
    self allowjump( 0 );
    self disableweaponcycling();
    self setmovespeedscale( 1 );
    self stopshellshock();
    self.maxhealth = 256;
    self.health = 256;
    self.meleedamage = 1000;
    self detachall();
    
    if ( isdefined( level.var_d78dbeb6 ) )
    {
        self [[ level.var_d78dbeb6 ]]();
    }
    else
    {
        self setmodel( #"c_zom_player_zombie_fb" );
        self.voice = "american";
        self.skeleton = "base";
    }
    
    self.shock_onpain = 0;
    self val::reset( #"turned", "takedamage" );
    self val::reset( #"turn_to_zombie", "freezecontrols" );
    self.is_in_process_of_zombify = 0;
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0x9ac18c7e, Offset: 0xbc8
// Size: 0x56e
function turn_to_human()
{
    if ( self.sessionstate == "playing" && !( isdefined( self.is_zombie ) && self.is_zombie ) && !( isdefined( self.laststand ) && self.laststand ) )
    {
        return;
    }
    
    if ( isdefined( self.is_in_process_of_humanify ) && self.is_in_process_of_humanify )
    {
        return;
    }
    
    while ( isdefined( self.is_in_process_of_zombify ) && self.is_in_process_of_zombify )
    {
        wait 0.1;
    }
    
    self playsoundtoplayer( #"evt_spawn", self );
    playsoundatposition( #"evt_disappear_3d", self.origin );
    self clientfield::set( "player_has_eyes", 0 );
    self ghost();
    self notify( #"humanify" );
    self.is_in_process_of_humanify = 1;
    self.is_zombie = 0;
    self notify( #"clear_red_flashing_overlay" );
    self.team = self.prevteam;
    self.pers[ #"team" ] = self.prevteam;
    self.sessionteam = self.prevteam;
    util::wait_network_frame();
    self zm_gametype::onspawnplayer();
    self.maxhealth = 100;
    self.health = 100;
    self val::set( #"turn_to_human", "freezecontrols", 1 );
    
    if ( self hasweapon( level.weaponzmdeaththroe ) )
    {
        self takeweapon( level.weaponzmdeaththroe );
    }
    
    self unsetperk( "specialty_playeriszombie" );
    self unsetperk( "specialty_unlimitedsprint" );
    self unsetperk( "specialty_fallheight" );
    self turned_enable_player_weapons();
    self zm_audio::setexertvoice( 0 );
    self.turned_visionset = 0;
    visionset_mgr::deactivate( "visionset", "zombie_turned", self );
    self clientfield::set_to_player( "turned_ir", 0 );
    self setmovespeedscale( 1 );
    self val::set( #"turn_to_human", "ignoreme", 0 );
    self.shock_onpain = 1;
    self enableweaponcycling();
    self allowstand( 1 );
    self allowprone( 1 );
    self allowcrouch( 1 );
    self allowads( 1 );
    self allowjump( 1 );
    self turnedhuman();
    self enableoffhandweapons();
    self stopshellshock();
    self.laststand = undefined;
    self.is_burning = undefined;
    self.meleedamage = undefined;
    self detachall();
    
    if ( !self hasweapon( level.weaponbasemelee ) )
    {
        self giveweapon( level.weaponbasemelee );
    }
    
    util::wait_network_frame();
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self val::reset( #"turned", "takedamage" );
    self val::reset( #"turn_to_human", "freezecontrols" );
    self show();
    playsoundatposition( #"evt_appear_3d", self.origin );
    self.is_in_process_of_humanify = 0;
}

// Namespace zm_turned/zm_turned
// Params 1
// Checksum 0x57c86a7, Offset: 0x1140
// Size: 0x156
function deletezombiesinradius( origin )
{
    zombies = zombie_utility::get_round_enemy_array();
    maxradius = 128;
    
    foreach ( zombie in zombies )
    {
        if ( isdefined( zombie ) && isalive( zombie ) && !( isdefined( zombie.is_being_used_as_spawner ) && zombie.is_being_used_as_spawner ) )
        {
            if ( distancesquared( zombie.origin, origin ) < maxradius * maxradius )
            {
                playfx( level._effect[ #"wood_chunk_destory" ], zombie.origin );
                zombie thread silentlyremovezombie();
            }
            
            waitframe( 1 );
        }
    }
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0x6696045f, Offset: 0x12a0
// Size: 0x16c
function turned_give_melee_weapon()
{
    assert( isdefined( self.weaponzmturnedmelee ) );
    assert( self.weaponzmturnedmelee != level.weaponnone );
    self.turned_had_knife = self hasweapon( level.weaponbasemelee );
    
    if ( isdefined( self.turned_had_knife ) && self.turned_had_knife )
    {
        self takeweapon( level.weaponbasemelee );
    }
    
    self giveweapon( self.weaponzmturnedmeleedw );
    self givemaxammo( self.weaponzmturnedmeleedw );
    self giveweapon( self.weaponzmturnedmelee );
    self givemaxammo( self.weaponzmturnedmelee );
    self switchtoweapon( self.weaponzmturnedmeleedw );
    self switchtoweapon( self.weaponzmturnedmelee );
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0xb8f56584, Offset: 0x1418
// Size: 0x25a
function turned_player_buttons()
{
    self endon( #"disconnect", #"humanify" );
    level endon( #"end_game" );
    
    while ( isdefined( self.is_zombie ) && self.is_zombie )
    {
        if ( self attackbuttonpressed() || self adsbuttonpressed() || self meleebuttonpressed() )
        {
            if ( math::cointoss() )
            {
                bhtnactionstartevent( self, "attack" );
                self notify( #"bhtn_action_notify", { #action:"attack" } );
            }
            
            while ( self attackbuttonpressed() || self adsbuttonpressed() || self meleebuttonpressed() )
            {
                waitframe( 1 );
            }
        }
        
        if ( self usebuttonpressed() )
        {
            bhtnactionstartevent( self, "taunt" );
            self notify( #"bhtn_action_notify", { #action:"taunt" } );
            
            while ( self usebuttonpressed() )
            {
                waitframe( 1 );
            }
        }
        
        if ( self issprinting() )
        {
            while ( self issprinting() )
            {
                bhtnactionstartevent( self, "sprint" );
                self notify( #"bhtn_action_notify", { #action:"sprint" } );
                waitframe( 1 );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0x37c57271, Offset: 0x1680
// Size: 0xdc
function turned_disable_player_weapons()
{
    if ( isdefined( self.is_zombie ) && self.is_zombie )
    {
        return;
    }
    
    weaponinventory = self getweaponslist();
    self.lastactiveweapon = self getcurrentweapon();
    self.laststandpistol = undefined;
    self.hadpistol = 0;
    
    if ( !isdefined( self.weaponzmturnedmelee ) )
    {
        self.weaponzmturnedmelee = level.weaponzmturnedmelee;
    }
    
    if ( !isdefined( self.weaponzmturnedmeleedw ) )
    {
        self.weaponzmturnedmeleedw = level.weaponzmturnedmeleedw;
    }
    
    self takeallweapons();
    self disableweaponcycling();
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0x824dec55, Offset: 0x1768
// Size: 0x2b4
function turned_enable_player_weapons()
{
    self takeallweapons();
    self enableweaponcycling();
    self enableoffhandweapons();
    self.turned_had_knife = undefined;
    rottweil_weapon = getweapon( #"rottweil72" );
    
    if ( isdefined( level.humanify_custom_loadout ) )
    {
        self thread [[ level.humanify_custom_loadout ]]();
        return;
    }
    else if ( !self hasweapon( rottweil_weapon ) )
    {
        self giveweapon( rottweil_weapon );
        self switchtoweapon( rottweil_weapon );
    }
    
    if ( !( isdefined( self.is_zombie ) && self.is_zombie ) && !self hasweapon( level.start_weapon ) )
    {
        if ( !self hasweapon( level.weaponbasemelee ) )
        {
            self giveweapon( level.weaponbasemelee );
        }
        
        self zm_loadout::give_start_weapon( 0 );
    }
    
    if ( self hasweapon( rottweil_weapon ) )
    {
        self setweaponammoclip( rottweil_weapon, 2 );
        self setweaponammostock( rottweil_weapon, 0 );
    }
    
    if ( self hasweapon( level.start_weapon ) )
    {
        self givemaxammo( level.start_weapon );
    }
    
    if ( self hasweapon( self zm_loadout::get_player_lethal_grenade() ) )
    {
        self getweaponammoclip( self zm_loadout::get_player_lethal_grenade() );
    }
    else
    {
        self giveweapon( self zm_loadout::get_player_lethal_grenade() );
    }
    
    self setweaponammoclip( self zm_loadout::get_player_lethal_grenade(), 2 );
}

// Namespace zm_turned/zm_turned
// Params 1
// Checksum 0xe3d9a1c4, Offset: 0x1a28
// Size: 0x178
function get_farthest_available_zombie( player )
{
    while ( true )
    {
        zombies = array::get_all_closest( player.origin, getaiteamarray( level.zombie_team ) );
        
        for ( x = 0; x < zombies.size ; x++ )
        {
            zombie = zombies[ x ];
            
            if ( isdefined( zombie ) && isalive( zombie ) && !( isdefined( zombie.in_the_ground ) && zombie.in_the_ground ) && !( isdefined( zombie.gibbed ) && zombie.gibbed ) && !( isdefined( zombie.head_gibbed ) && zombie.head_gibbed ) && !( isdefined( zombie.is_being_used_as_spawnpoint ) && zombie.is_being_used_as_spawnpoint ) && zombie zm_utility::in_playable_area() )
            {
                zombie.is_being_used_as_spawnpoint = 1;
                return zombie;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0x799c01d6, Offset: 0x1ba8
// Size: 0xa2
function get_available_human()
{
    players = getplayers();
    
    foreach ( player in players )
    {
        if ( !( isdefined( player.is_zombie ) && player.is_zombie ) )
        {
            return player;
        }
    }
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0x7f4beab1, Offset: 0x1c58
// Size: 0x74
function silentlyremovezombie()
{
    self.skip_death_notetracks = 1;
    self.nodeathragdoll = 1;
    self dodamage( self.maxhealth * 2, self.origin, self, self, "none", "MOD_SUICIDE" );
    self zm_utility::self_delete();
}

// Namespace zm_turned/zm_turned
// Params 0
// Checksum 0xf6f0baca, Offset: 0x1cd8
// Size: 0x32
function getspawnpoint()
{
    spawnpoint = self spawnlogic::getspawnpoint_dm( level._turned_zombie_respawnpoints );
    return spawnpoint;
}

