#using scripts\abilities\ability_util;
#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\bots\bot_action;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
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
#using scripts\mp_common\gametypes\outcome;
#using scripts\mp_common\gametypes\round;
#using scripts\mp_common\gametypes\spawning;
#using scripts\mp_common\player\player_loadout;
#using scripts\mp_common\player\player_utils;
#using scripts\mp_common\util;
#using scripts\weapons\weapon_utils;

#namespace oic;

// Namespace oic/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x83140a39, Offset: 0x350
// Size: 0x6fc
function event_handler[gametype_init] main( eventstruct )
{
    globallogic::init();
    level.pointsperweaponkill = getgametypesetting( "pointsPerWeaponKill" ) * 10;
    level.pointspermeleekill = getgametypesetting( "pointsPerMeleeKill" ) * 10;
    level.pointsforsurvivalbonus = getgametypesetting( "pointsForSurvivalBonus" ) * 10;
    level.var_18823aed = 60;
    util::registertimelimit( 0, 1440 );
    util::registerscorelimit( 0, 50000 );
    util::registerroundlimit( 0, 10 );
    util::registerroundwinlimit( 0, 10 );
    util::registernumlives( 0, 100 );
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.givecustomloadout = &givecustomloadout;
    level.onplayerdamage = &onplayerdamage;
    level.onendgame = &onendgame;
    player::function_cf3aa03d( &onplayerkilled );
    oic_perks = [];
    
    if ( !isdefined( oic_perks ) )
    {
        oic_perks = [];
    }
    else if ( !isarray( oic_perks ) )
    {
        oic_perks = array( oic_perks );
    }
    
    oic_perks[ oic_perks.size ] = "specialty_sprint";
    
    if ( !isdefined( oic_perks ) )
    {
        oic_perks = [];
    }
    else if ( !isarray( oic_perks ) )
    {
        oic_perks = array( oic_perks );
    }
    
    oic_perks[ oic_perks.size ] = "specialty_slide";
    level.oic_perks = oic_perks;
    globallogic_spawn::addsupportedspawnpointtype( "ffa" );
    var_1f99b9e8 = [];
    
    if ( !isdefined( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = [];
    }
    else if ( !isarray( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = array( var_1f99b9e8 );
    }
    
    var_1f99b9e8[ var_1f99b9e8.size ] = getweapon( #"hero_annihilator" + "_oic", "" );
    
    if ( !isdefined( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = [];
    }
    else if ( !isarray( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = array( var_1f99b9e8 );
    }
    
    var_1f99b9e8[ var_1f99b9e8.size ] = getweapon( #"pistol_standard_t8" + "_oic", "" );
    
    if ( !isdefined( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = [];
    }
    else if ( !isarray( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = array( var_1f99b9e8 );
    }
    
    var_1f99b9e8[ var_1f99b9e8.size ] = getweapon( #"pistol_standard_t8" + "_oic", "uber" );
    
    if ( !isdefined( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = [];
    }
    else if ( !isarray( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = array( var_1f99b9e8 );
    }
    
    var_1f99b9e8[ var_1f99b9e8.size ] = getweapon( #"pistol_fullauto_t8" + "_oic", "" );
    
    if ( !isdefined( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = [];
    }
    else if ( !isarray( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = array( var_1f99b9e8 );
    }
    
    var_1f99b9e8[ var_1f99b9e8.size ] = getweapon( #"pistol_topbreak_t8" + "_oic", "" );
    
    if ( !isdefined( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = [];
    }
    else if ( !isarray( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = array( var_1f99b9e8 );
    }
    
    var_1f99b9e8[ var_1f99b9e8.size ] = getweapon( #"pistol_revolver_t8" + "_oic", "" );
    
    if ( !isdefined( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = [];
    }
    else if ( !isarray( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = array( var_1f99b9e8 );
    }
    
    var_1f99b9e8[ var_1f99b9e8.size ] = getweapon( #"pistol_revolver_t8" + "_oic", "pistolscope" );
    
    if ( !isdefined( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = [];
    }
    else if ( !isarray( var_1f99b9e8 ) )
    {
        var_1f99b9e8 = array( var_1f99b9e8 );
    }
    
    var_1f99b9e8[ var_1f99b9e8.size ] = getweapon( #"pistol_revolver_t8" + "_oic", "uber" );
    level.gunselection = getgametypesetting( #"gunselection" );
    level.var_bf82f6b0 = var_1f99b9e8[ level.gunselection ];
    level.takelivesondeath = 1;
    globallogic_audio::set_leader_gametype_dialog( "startOneInTheChamber", "hcStartOneInTheChamber", undefined, undefined, "bbStartOneInTheChamber", "hcbbStartOneInTheChamber" );
}

// Namespace oic/oic
// Params 10
// Checksum 0x7d6d12e5, Offset: 0xa58
// Size: 0xbc
function onplayerdamage( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime )
{
    if ( level.gunselection === 7 )
    {
        return idamage;
    }
    
    if ( smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_HEAD_SHOT" )
    {
        idamage = self.maxhealth + 1;
    }
    
    return idamage;
}

// Namespace oic/oic
// Params 0
// Checksum 0x4dda8ae8, Offset: 0xb20
// Size: 0x378
function givecustomloadout()
{
    loadout::init_player( 1 );
    loadout::function_f436358b( self.curclass );
    self setactionslot( 3, "flourish_callouts" );
    self setactionslot( 4, "sprays_boasts" );
    weapon = level.var_bf82f6b0;
    self giveweapon( weapon );
    self switchtoweapon( weapon );
    clipammo = 1;
    
    if ( isdefined( self.pers[ #"clip_ammo" ] ) )
    {
        clipammo = self.pers[ #"clip_ammo" ];
        self.pers[ #"clip_ammo" ] = undefined;
    }
    
    self setweaponammoclip( weapon, clipammo );
    stockammo = 0;
    
    if ( isdefined( self.pers[ #"stock_ammo" ] ) )
    {
        stockammo = self.pers[ #"stock_ammo" ];
        self.pers[ #"stock_ammo" ] = undefined;
    }
    
    self setweaponammostock( weapon, stockammo );
    self setspawnweapon( weapon );
    self giveperks();
    e_whippings = isdefined( getgametypesetting( #"hash_4ca06c610b5d53bd" ) ) ? getgametypesetting( #"hash_4ca06c610b5d53bd" ) : 0;
    
    if ( !e_whippings )
    {
        secondaryoffhand = getweapon( #"gadget_health_regen" );
        secondaryoffhandcount = 1;
        self giveweapon( secondaryoffhand );
        self setweaponammoclip( secondaryoffhand, secondaryoffhandcount );
        self switchtooffhand( secondaryoffhand );
        loadout = self loadout::get_loadout_slot( "specialgrenade" );
        loadout.weapon = secondaryoffhand;
        loadout.count = secondaryoffhandcount;
        self ability_util::gadget_power_full( secondaryoffhand );
    }
    
    if ( isbot( self ) && !isdefined( level.botweapons[ #"hero_annihilator_oic" ] ) )
    {
        bot_action::register_bulletweapon( #"hero_annihilator_oic" );
    }
    
    return weapon;
}

// Namespace oic/oic
// Params 0
// Checksum 0x49579f76, Offset: 0xea0
// Size: 0xb0
function giveperks()
{
    self clearperks();
    
    foreach ( perkname in level.oic_perks )
    {
        if ( !self hasperk( perkname ) )
        {
            self setperk( perkname );
        }
    }
}

// Namespace oic/oic
// Params 0
// Checksum 0x84a73b67, Offset: 0xf58
// Size: 0x54
function onstartgametype()
{
    allowed[ 0 ] = "oic";
    globallogic_spawn::addspawns();
    level.displayroundendtext = 0;
    level thread watchelimination();
}

// Namespace oic/oic
// Params 1
// Checksum 0x7597f50e, Offset: 0xfb8
// Size: 0x9c
function onspawnplayer( predictedspawn )
{
    if ( !level.inprematchperiod )
    {
        level.usestartspawns = 0;
    }
    
    spawning::onspawnplayer( predictedspawn );
    clientfield::set_player_uimodel( "hudItems.playerLivesCount", level.numlives - self.var_a7d7e50a );
    
    if ( self.pers[ #"lives" ] == 1 )
    {
        globallogic_audio::leader_dialog_on_player( "oicLastLife" );
    }
}

// Namespace oic/oic
// Params 1
// Checksum 0x96655b0f, Offset: 0x1060
// Size: 0x3c
function onendgame( var_c1e98979 )
{
    player = round::function_b5f4c9d8();
    match::set_winner( player );
}

// Namespace oic/oic
// Params 0
// Checksum 0xbf39ba1a, Offset: 0x10a8
// Size: 0x114
function saveoffallplayersammo()
{
    wait 1;
    
    for ( playerindex = 0; playerindex < level.players.size ; playerindex++ )
    {
        player = level.players[ playerindex ];
        
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( player.pers[ #"lives" ] == 0 )
        {
            continue;
        }
        
        currentweapon = player getcurrentweapon();
        player.pers[ #"clip_ammo" ] = player getweaponammoclip( currentweapon );
        player.pers[ #"stock_ammo" ] = player getweaponammostock( currentweapon );
    }
}

// Namespace oic/oic
// Params 1
// Checksum 0xd55ab835, Offset: 0x11c8
// Size: 0x4e, Type: bool
function isplayereliminated( player )
{
    return isdefined( player.pers[ #"lives" ] ) && player.pers[ #"lives" ] <= 0;
}

// Namespace oic/oic
// Params 0
// Checksum 0xf9894a4e, Offset: 0x1220
// Size: 0x96
function getplayersleft()
{
    playersremaining = [];
    
    for ( playerindex = 0; playerindex < level.players.size ; playerindex++ )
    {
        player = level.players[ playerindex ];
        
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( !isplayereliminated( player ) )
        {
            playersremaining[ playersremaining.size ] = player;
        }
    }
    
    return playersremaining;
}

// Namespace oic/oic
// Params 9
// Checksum 0xb359e2e3, Offset: 0x12c0
// Size: 0x264
function onplayerkilled( einflictor, attacker, idamage, smeansofdeath, sweapon, vdir, shitloc, psoffsettime, deathanimduration )
{
    if ( isdefined( attacker ) && isplayer( attacker ) && self != attacker )
    {
        weapon = level.var_bf82f6b0;
        attackerammo = attacker getammocount( weapon );
        victimammo = self getammocount( weapon );
        
        if ( attackerammo < 3 )
        {
            attacker giveammo( 1 );
        }
        
        attacker playlocalsound( "mpl_oic_bullet_pickup" );
        
        if ( smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_MELEE_WEAPON_BUTT" )
        {
            attacker globallogic_score::givepointstowin( level.pointspermeleekill );
            
            if ( attackerammo > 0 )
            {
                scoreevents::processscoreevent( #"knife_with_ammo_oic", attacker, self, sweapon );
            }
            
            if ( victimammo > attackerammo )
            {
                scoreevents::processscoreevent( #"kill_enemy_with_more_ammo_oic", attacker, self, sweapon );
            }
        }
        else
        {
            attacker globallogic_score::givepointstowin( level.pointsperweaponkill );
            
            if ( victimammo > attackerammo + 1 )
            {
                scoreevents::processscoreevent( #"kill_enemy_with_more_ammo_oic", attacker, self, sweapon );
            }
        }
        
        if ( self.pers[ #"lives" ] == 0 )
        {
            scoreevents::processscoreevent( #"eliminated_enemy", attacker, self, sweapon );
        }
    }
}

// Namespace oic/oic
// Params 1
// Checksum 0x5427e0fb, Offset: 0x1530
// Size: 0x6c
function giveammo( amount )
{
    currentweapon = self getcurrentweapon();
    clipammo = self getweaponammoclip( currentweapon );
    self setweaponammoclip( currentweapon, clipammo + amount );
}

// Namespace oic/oic
// Params 0
// Checksum 0x9344d36c, Offset: 0x15a8
// Size: 0x56, Type: bool
function shouldreceivesurvivorbonus()
{
    if ( isalive( self ) )
    {
        return true;
    }
    
    if ( self.hasspawned && self.pers[ #"lives" ] > 0 )
    {
        return true;
    }
    
    return false;
}

// Namespace oic/oic
// Params 0
// Checksum 0x8c7c85c0, Offset: 0x1608
// Size: 0x190
function watchelimination()
{
    level endon( #"game_ended" );
    
    for ( ;; )
    {
        level waittill( #"player_eliminated" );
        players = level.players;
        
        for ( i = 0; i < players.size ; i++ )
        {
            if ( isdefined( players[ i ] ) && players[ i ] shouldreceivesurvivorbonus() )
            {
                players[ i ].pers[ #"survived" ]++;
                players[ i ].survived = players[ i ].pers[ #"survived" ];
                scoreevents::processscoreevent( #"survivor", players[ i ] );
                players[ i ] globallogic_score::givepointstowin( level.pointsforsurvivalbonus );
            }
        }
        
        survivors = getplayersleft();
        
        if ( survivors.size == 2 )
        {
            level thread function_ce7ffccb();
        }
    }
}

// Namespace oic/oic
// Params 1, eflags: 0x4
// Checksum 0xdff14171, Offset: 0x17a0
// Size: 0xec
function private function_ce7ffccb( winner )
{
    if ( globallogic_utils::gettimeremaining() <= int( level.var_18823aed * 1000 ) )
    {
        return;
    }
    
    if ( level.var_18823aed > 0 )
    {
        level.timelimitoverride = 1;
        setgameendtime( gettime() + int( level.var_18823aed * 1000 ) );
        hostmigration::waitlongdurationwithgameendtimeupdate( level.var_18823aed );
        
        if ( game.state != "playing" )
        {
            return;
        }
    }
    
    thread globallogic::end_round( 2 );
}

