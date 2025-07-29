#using scripts\abilities\ability_util;
#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\bots\bot_action;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\hostmigration_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\influencers_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\player\player_loadout;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\sound_shared;
#using scripts\core_common\spawning_shared;
#using scripts\core_common\spectating;
#using scripts\core_common\util_shared;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic_defaults;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\gametypes\globallogic_ui;
#using scripts\mp_common\gametypes\globallogic_utils;
#using scripts\mp_common\gametypes\match;
#using scripts\mp_common\gametypes\round;
#using scripts\mp_common\gametypes\spawning;
#using scripts\mp_common\player\player_loadout;
#using scripts\mp_common\player\player_utils;
#using scripts\mp_common\util;
#using scripts\weapons\weapon_utils;

#namespace sas;

// Namespace sas/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xc6356497, Offset: 0x368
// Size: 0x514
function event_handler[gametype_init] main( eventstruct )
{
    globallogic::init();
    level.weapon_sas_primary_weapon = getweapon( "special_crossbow_t8_sas" );
    level.weapon_sas_secondary_weapon = getweapon( "special_ballisticknife_t8_dw" );
    level.weapon_sas_primary_grenade_weapon = getweapon( "hatchet" );
    util::registertimelimit( 0, 1440 );
    util::registerscorelimit( 0, 15000 );
    util::registerroundlimit( 0, 10 );
    util::registerroundwinlimit( 0, 10 );
    util::registernumlives( 0, 100 );
    level.onstartgametype = &onstartgametype;
    level.onplayerdamage = &onplayerdamage;
    level.onendgame = &onendgame;
    level.pointsperprimarykill = getgametypesetting( "pointsPerPrimaryKill" ) * 5;
    level.pointspersecondarykill = getgametypesetting( "pointsPerSecondaryKill" ) * 5;
    level.pointsperprimarygrenadekill = getgametypesetting( "pointsPerPrimaryGrenadeKill" ) * 5;
    level.pointspermeleekill = getgametypesetting( "pointsPerMeleeKill" ) * 5;
    level.setbacks = getgametypesetting( "setbacks" );
    player::function_cf3aa03d( &onplayerkilled );
    
    switch ( getgametypesetting( "gunSelection" ) )
    {
        case 0:
            level.setbackweapon = undefined;
            break;
        case 1:
            level.setbackweapon = level.weapon_sas_primary_grenade_weapon;
            break;
        case 2:
            level.setbackweapon = level.weapon_sas_primary_weapon;
            break;
        case 3:
            level.setbackweapon = level.weapon_sas_secondary_weapon;
            break;
        default:
            assert( 1, "<dev string:x38>" );
            break;
    }
    
    gameobjects::register_allowed_gameobject( level.gametype );
    level.givecustomloadout = &givecustomloadout;
    var_f429264b = [];
    
    if ( !isdefined( var_f429264b ) )
    {
        var_f429264b = [];
    }
    else if ( !isarray( var_f429264b ) )
    {
        var_f429264b = array( var_f429264b );
    }
    
    var_f429264b[ var_f429264b.size ] = "specialty_sprint";
    
    if ( !isdefined( var_f429264b ) )
    {
        var_f429264b = [];
    }
    else if ( !isarray( var_f429264b ) )
    {
        var_f429264b = array( var_f429264b );
    }
    
    var_f429264b[ var_f429264b.size ] = "specialty_slide";
    
    if ( !isdefined( var_f429264b ) )
    {
        var_f429264b = [];
    }
    else if ( !isarray( var_f429264b ) )
    {
        var_f429264b = array( var_f429264b );
    }
    
    var_f429264b[ var_f429264b.size ] = "specialty_sprintreload";
    
    if ( !isdefined( var_f429264b ) )
    {
        var_f429264b = [];
    }
    else if ( !isarray( var_f429264b ) )
    {
        var_f429264b = array( var_f429264b );
    }
    
    var_f429264b[ var_f429264b.size ] = "specialty_sprintheal";
    level.var_f429264b = var_f429264b;
    globallogic_spawn::addsupportedspawnpointtype( "ffa" );
    globallogic_audio::set_leader_gametype_dialog( "startSticksAndStones", "hcStartSticksAndStones", undefined, undefined, "bbStartSticksAndStones", "hcbbStartSticksAndStones" );
}

// Namespace sas/sas
// Params 0
// Checksum 0x2a07eae9, Offset: 0x888
// Size: 0x3c0
function givecustomloadout()
{
    defaultweapon = level.weapon_sas_primary_weapon;
    loadout::init_player( 1 );
    loadout::function_f436358b( self.curclass );
    self cleartalents();
    self giveperks();
    self giveweapon( defaultweapon );
    self.primaryloadoutweapon = defaultweapon;
    secondaryweapon = level.weapon_sas_secondary_weapon;
    self giveweapon( secondaryweapon );
    self setweaponammostock( secondaryweapon, 2 );
    self.secondaryloadoutweapon = defaultweapon;
    offhandprimary = level.weapon_sas_primary_grenade_weapon;
    self giveweapon( offhandprimary );
    self setweaponammoclip( offhandprimary, 1 );
    self.grenadetypeprimary = offhandprimary;
    self.grenadetypeprimarycount = 1;
    loadout = self loadout::get_loadout_slot( "primarygrenade" );
    loadout.weapon = offhandprimary;
    loadout.count = 1;
    self ability_util::gadget_reset( offhandprimary, 0, 0, 1, 0 );
    self ability_util::gadget_power_full( offhandprimary );
    self.heroweapon = undefined;
    e_whippings = isdefined( getgametypesetting( #"hash_4ca06c610b5d53bd" ) ) ? getgametypesetting( #"hash_4ca06c610b5d53bd" ) : 0;
    
    if ( !e_whippings )
    {
        secondaryoffhand = getweapon( #"gadget_health_regen" );
        secondaryoffhandcount = 0;
        self giveweapon( secondaryoffhand );
        self setweaponammoclip( secondaryoffhand, secondaryoffhandcount );
        loadout = self loadout::get_loadout_slot( "specialgrenade" );
        loadout.weapon = secondaryoffhand;
        loadout.count = secondaryoffhandcount;
        self ability_util::gadget_power_full( secondaryoffhand );
    }
    
    self switchtoweapon( defaultweapon );
    self setspawnweapon( defaultweapon );
    self.killswithsecondary = 0;
    self.killswithprimary = 0;
    self.killswithbothawarded = 0;
    
    if ( isbot( self ) && !isdefined( level.botweapons[ level.weapon_sas_primary_weapon.name ] ) )
    {
        bot_action::register_bulletweapon( level.weapon_sas_primary_weapon.name );
    }
    
    return defaultweapon;
}

// Namespace sas/sas
// Params 0
// Checksum 0x233c342d, Offset: 0xc50
// Size: 0xb0
function giveperks()
{
    self clearperks();
    
    foreach ( perkname in level.var_f429264b )
    {
        if ( !self hasperk( perkname ) )
        {
            self setperk( perkname );
        }
    }
}

// Namespace sas/sas
// Params 10
// Checksum 0xb43ecb82, Offset: 0xd08
// Size: 0x126
function onplayerdamage( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime )
{
    if ( weapon == level.weapon_sas_primary_weapon && smeansofdeath == "MOD_IMPACT" )
    {
        if ( isdefined( eattacker ) && isplayer( eattacker ) )
        {
            if ( !isdefined( eattacker.pers[ #"sticks" ] ) )
            {
                eattacker.pers[ #"sticks" ] = 1;
            }
            else
            {
                eattacker.pers[ #"sticks" ]++;
            }
            
            eattacker.sticks = eattacker.pers[ #"sticks" ];
        }
    }
    
    return idamage;
}

// Namespace sas/sas
// Params 9
// Checksum 0x4498351a, Offset: 0xe38
// Size: 0x494
function onplayerkilled( einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration )
{
    if ( isdefined( attacker ) && isplayer( attacker ) && attacker != self )
    {
        if ( weapon_utils::ismeleemod( smeansofdeath ) )
        {
            attacker globallogic_score::givepointstowin( int( level.pointspermeleekill ) );
            scoreevents::processscoreevent( #"hash_6c8030eb05b53d5a", attacker, self, weapon );
        }
        else if ( weapon == level.weapon_sas_primary_weapon )
        {
            attacker.killswithprimary++;
            
            if ( attacker.killswithbothawarded == 0 && attacker.killswithsecondary > 0 )
            {
                attacker.killswithbothawarded = 1;
            }
            
            attacker globallogic_score::givepointstowin( level.pointsperprimarykill );
            scoreevents::processscoreevent( #"hash_614b27b37ccee280", attacker, self, weapon );
        }
        else if ( weapon == level.weapon_sas_primary_grenade_weapon )
        {
            attacker globallogic_score::givepointstowin( int( level.pointsperprimarygrenadekill ) );
        }
        else
        {
            if ( weapon == level.weapon_sas_secondary_weapon )
            {
                attacker.killswithsecondary++;
                
                if ( attacker.killswithbothawarded == 0 && attacker.killswithprimary > 0 )
                {
                    attacker.killswithbothawarded = 1;
                }
            }
            
            attacker globallogic_score::givepointstowin( level.pointspersecondarykill );
            scoreevents::processscoreevent( #"hash_25ec47f9609803a9", attacker, self, weapon );
        }
        
        if ( isdefined( level.setbackweapon ) && weapon == level.setbackweapon )
        {
            self.pers[ #"humiliated" ]++;
            self.humiliated = self.pers[ #"humiliated" ];
            
            if ( globallogic_score::gethighestscoringplayer() === self )
            {
                scoreevents::processscoreevent( #"humiliation_sas", attacker, self, weapon );
            }
            
            if ( level.setbacks == 0 )
            {
                self globallogic_score::setpointstowin( 0 );
                globallogic_score::_setplayerscore( self, 0 );
            }
            else
            {
                self globallogic_score::givepointstowin( level.setbacks * -1 );
            }
            
            attacker playlocalsound( "mpl_fracture_sting_moved" );
            self globallogic_audio::leader_dialog_on_player( "sasHumiliated" );
            scoreevents::processscoreevent( #"setback_sas", attacker, self, weapon );
        }
        
        return;
    }
    
    self.pers[ #"humiliated" ]++;
    self.humiliated = self.pers[ #"humiliated" ];
    
    if ( level.setbacks == 0 )
    {
        self globallogic_score::setpointstowin( 0 );
    }
    else
    {
        self globallogic_score::givepointstowin( level.setbacks * -1 );
    }
    
    self playlocalsound( #"mpl_wager_humiliate" );
}

// Namespace sas/sas
// Params 1
// Checksum 0x7741d0fc, Offset: 0x12d8
// Size: 0x3c
function onendgame( var_c1e98979 )
{
    player = round::function_b5f4c9d8();
    match::set_winner( player );
}

// Namespace sas/sas
// Params 0
// Checksum 0x4c0f12e4, Offset: 0x1320
// Size: 0x28
function function_bbf3128e()
{
    self endon( #"disconnect", #"death" );
}

// Namespace sas/sas
// Params 1
// Checksum 0x7fc0ccc5, Offset: 0x1350
// Size: 0xde
function setupteam( team )
{
    util::setobjectivetext( team, #"objectives_sas" );
    
    if ( level.splitscreen )
    {
        util::setobjectivescoretext( team, #"objectives_sas" );
    }
    else
    {
        util::setobjectivescoretext( team, #"objectives_sas_score" );
    }
    
    spawning::add_spawn_points( team, "mp_dm_spawn" );
    spawning::place_spawn_points( "mp_dm_spawn_start" );
    level.spawn_start = spawning::get_spawnpoint_array( "mp_dm_spawn_start" );
}

// Namespace sas/sas
// Params 0
// Checksum 0xcfe716d7, Offset: 0x1438
// Size: 0x14
function onstartgametype()
{
    influencers::create_map_placed_influencers();
}

