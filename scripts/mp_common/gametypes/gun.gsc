#using scripts\abilities\ability_util;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\persistence_shared;
#using scripts\core_common\player\player_loadout;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\rank_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\spawning_shared;
#using scripts\mp_common\draft;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\gametypes\match;
#using scripts\mp_common\gametypes\round;
#using scripts\mp_common\player\player_loadout;
#using scripts\mp_common\player\player_utils;
#using scripts\mp_common\util;
#using scripts\weapons\weapon_utils;

#namespace gun;

// Namespace gun/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x5d1de2eb, Offset: 0x318
// Size: 0x10c4
function event_handler[gametype_init] main( eventstruct )
{
    globallogic::init();
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    player::function_cf3aa03d( &onplayerkilled );
    level.onendgame = &onendgame;
    level.var_cdb8ae2c = &function_a8da260c;
    level.var_a962eeb6 = &function_486a8395;
    callback::on_connect( &onconnect );
    globallogic_audio::set_leader_gametype_dialog( "startGunGame", "hcSstartGunGame", "", "", "bbStartGunGame", "hcbbSstartGunGame" );
    level.givecustomloadout = &givecustomloadout;
    level.setbacksperdemotion = getgametypesetting( #"setbacks" );
    level.inactivitykick = 120;
    level.var_f46d16f0 = 1;
    setdvar( #"hash_137c8b2b96ac6c72", 0.2 );
    setdvar( #"compassradarpingfadetime", 0.75 );
    globallogic_spawn::addsupportedspawnpointtype( "gg" );
    level.gunprogression = [];
    gunlist = getgametypesetting( #"gunselection" );
    
    if ( gunlist == 4 )
    {
        gunlist = randomintrange( 0, 4 );
    }
    
    switch ( gunlist )
    {
        case 0:
            addguntoprogression( #"pistol_standard_t8" );
            addguntoprogression( #"pistol_burst_t8", "grip" );
            addguntoprogression( #"shotgun_semiauto_t8" );
            addguntoprogression( #"shotgun_pump_t8", "extbarrel", "quickdraw" );
            addguntoprogression( #"smg_fastfire_t8", "steadyaim", "extclip" );
            addguntoprogression( #"smg_accurate_t8", "extbarrel", "extbarrel2" );
            addguntoprogression( #"smg_handling_t8", "stalker", "quickdraw" );
            addguntoprogression( #"ar_accurate_t8", "grip", "grip2", "reflex" );
            addguntoprogression( #"ar_fastfire_t8", "elo", "steadyaim", "stalker" );
            addguntoprogression( #"ar_damage_t8", "reflex", "extbarrel" );
            addguntoprogression( #"ar_stealth_t8", "elo", "suppressed" );
            addguntoprogression( #"tr_midburst_t8", "quickdraw", "grip" );
            addguntoprogression( #"tr_powersemi_t8", "uber" );
            addguntoprogression( #"lmg_standard_t8", "stalker", "reflex" );
            addguntoprogression( #"lmg_spray_t8", "rf", "uber" );
            addguntoprogression( #"sniper_powersemi_t8", "is" );
            addguntoprogression( #"sniper_quickscope_t8", "uber" );
            addguntoprogression( #"sniper_powerbolt_t8", "adsreload", "mms" );
            addguntoprogression( #"launcher_standard_t8", "damage", "supply" );
            addguntoprogression( #"special_ballisticknife_t8_dw" );
            break;
        case 1:
            addguntoprogression( #"pistol_revolver_t8" );
            addguntoprogression( #"pistol_standard_t8", "suppressed" );
            addguntoprogression( #"pistol_burst_t8", "elo", "quickdraw" );
            addguntoprogression( #"shotgun_pump_t8", "elo", "quickdraw" );
            addguntoprogression( #"shotgun_semiauto_t8", "steadyaim" );
            addguntoprogression( #"smg_standard_t8", "mixclip", "reflex" );
            addguntoprogression( #"smg_capacity_t8", "grip" );
            addguntoprogression( #"smg_fastfire_t8", "extclip", "uber" );
            addguntoprogression( #"smg_accurate_t8", "suppressed" );
            addguntoprogression( #"smg_handling_t8", "dw" );
            addguntoprogression( #"ar_fastfire_t8", "elo", "uber" );
            addguntoprogression( #"ar_modular_t8", "extclip", "grip" );
            addguntoprogression( #"ar_stealth_t8", "uber" );
            addguntoprogression( #"ar_damage_t8", "extbarrel" );
            addguntoprogression( #"tr_midburst_t8", "elo" );
            addguntoprogression( #"lmg_standard_t8", "quickdraw" );
            addguntoprogression( #"lmg_spray_t8", "uber" );
            addguntoprogression( #"sniper_quickscope_t8", "is", "steadyaim" );
            addguntoprogression( #"launcher_standard_t8", "damage" );
            addguntoprogression( #"special_ballisticknife_t8_dw" );
            break;
        case 2:
            addguntoprogression( #"pistol_revolver_t8", "uber" );
            addguntoprogression( #"smg_standard_t8", "ir", "reflex" );
            addguntoprogression( #"smg_accurate_t8", "uber", "acog" );
            addguntoprogression( #"ar_modular_t8", "extclip", "holo" );
            addguntoprogression( #"ar_accurate_t8", "dualoptic", "grip" );
            addguntoprogression( #"ar_fastfire_t8", "holo", "uber" );
            addguntoprogression( #"ar_damage_t8", "mms", "extbarrel" );
            addguntoprogression( #"ar_stealth_t8", "mms", "extbarrel" );
            addguntoprogression( #"tr_longburst_t8", "acog", "quickdraw", "quickdraw2" );
            addguntoprogression( #"tr_midburst_t8", "ir" );
            addguntoprogression( #"tr_powersemi_t8", "dualoptic" );
            addguntoprogression( #"lmg_standard_t8", "ir" );
            addguntoprogression( #"lmg_heavy_t8", "dualoptic", "uber" );
            addguntoprogression( #"lmg_spray_t8", "ir" );
            addguntoprogression( #"sniper_fastrechamber_t8", "uber" );
            addguntoprogression( #"sniper_quickscope_t8", "swayreduc" );
            addguntoprogression( #"sniper_powersemi_t8", "ir" );
            addguntoprogression( #"sniper_powerbolt_t8", "adsreload", "swayreduc" );
            addguntoprogression( #"launcher_standard_t8", "damage" );
            addguntoprogression( #"special_ballisticknife_t8_dw" );
            break;
        case 3:
            addguntoprogression( #"pistol_fullauto_t8", "reflex", "grip", "fastreload" );
            addguntoprogression( #"pistol_revolver_t8" );
            addguntoprogression( #"shotgun_fullauto_t8", "grip", "reflex" );
            addguntoprogression( #"smg_folding_t8", "elo", "grip" );
            addguntoprogression( #"smg_capacity_t8", "grip" );
            addguntoprogression( #"smg_fastburst_t8", "reflex", "steadyaim" );
            addguntoprogression( #"ar_standard_t8", "quickdraw", "fastreload" );
            addguntoprogression( #"ar_stealth_t8", "elo", "uber" );
            addguntoprogression( #"ar_damage_t8", "holo", "extbarrel" );
            addguntoprogression( #"ar_fastfire_t8", "elo", "uber" );
            addguntoprogression( #"ar_accurate_t8", "holo", "extbarrel" );
            addguntoprogression( #"tr_longburst_t8", "quickdraw", "quickdraw2" );
            addguntoprogression( #"tr_powersemi_t8", "fastreload" );
            addguntoprogression( #"lmg_standard_t8", "ir" );
            addguntoprogression( #"lmg_heavy_t8", "holo", "uber" );
            addguntoprogression( #"sniper_powersemi_t8", "is" );
            addguntoprogression( #"sniper_quickscope_t8", "steadyaim" );
            addguntoprogression( #"sniper_powerbolt_t8", "adsreload", "swayreduc" );
            addguntoprogression( #"launcher_standard_t8", "damage" );
            addguntoprogression( #"special_ballisticknife_t8_dw" );
            break;
    }
    
    util::registertimelimit( 0, 1440 );
    util::registerroundlimit( 0, 10 );
    util::registerroundwinlimit( 0, 10 );
    util::registernumlives( 0, 100 );
}

// Namespace gun/gun
// Params 0
// Checksum 0xae68b79c, Offset: 0x13e8
// Size: 0xdc
function function_a8da260c()
{
    foreach ( team, _ in level.teams )
    {
        spawning::add_spawn_points( team, "mp_dm_spawn" );
        spawning::place_spawn_points( "mp_dm_spawn_start" );
    }
    
    level.spawn_start = spawning::get_spawnpoint_array( "mp_dm_spawn_start" );
    spawning::updateallspawnpoints();
}

// Namespace gun/gun
// Params 0
// Checksum 0x80f724d1, Offset: 0x14d0
// Size: 0x4
function onconnect()
{
    
}

// Namespace gun/gun
// Params 0
// Checksum 0x9ed709bb, Offset: 0x14e0
// Size: 0x8c
function onstartgametype()
{
    level.gungamekillscore = rank::getscoreinfovalue( "kill_gun" );
    util::registerscorelimit( level.gunprogression.size * level.gungamekillscore, level.gunprogression.size * level.gungamekillscore );
    level.displayroundendtext = 0;
    globallogic_spawn::addspawns();
}

// Namespace gun/gun
// Params 0
// Checksum 0x80b9eba5, Offset: 0x1578
// Size: 0x194
function inactivitykick()
{
    self endon( #"disconnect", #"death" );
    
    if ( sessionmodeisprivate() )
    {
        return;
    }
    
    if ( level.inactivitykick == 0 )
    {
        return;
    }
    
    while ( level.inactivitykick > self.timeplayed[ #"total" ] )
    {
        wait 1;
    }
    
    if ( self.pers[ #"participation" ] == 0 && self.pers[ #"time_played_moving" ] < 1 )
    {
        globallogic::gamehistoryplayerkicked();
        kick( self getentitynumber(), "GAME/DROPPEDFORINACTIVITY" );
    }
    
    if ( self.pers[ #"participation" ] == 0 && self.timeplayed[ #"total" ] > 60 )
    {
        globallogic::gamehistoryplayerkicked();
        kick( self getentitynumber(), "GAME/DROPPEDFORINACTIVITY" );
    }
}

// Namespace gun/gun
// Params 1
// Checksum 0xf137785, Offset: 0x1718
// Size: 0x6c
function onspawnplayer( predictedspawn )
{
    if ( !level.inprematchperiod )
    {
        level.usestartspawns = 0;
    }
    
    spawning::onspawnplayer( predictedspawn );
    self thread infiniteammo();
    self thread inactivitykick();
}

// Namespace gun/gun
// Params 9
// Checksum 0x81ea9961, Offset: 0x1790
// Size: 0x1f4
function onplayerkilled( einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration )
{
    level.usestartspawns = 0;
    
    if ( smeansofdeath == "MOD_SUICIDE" || smeansofdeath == "MOD_TRIGGER_HURT" )
    {
        self thread demoteplayer();
        return;
    }
    
    if ( isdefined( attacker ) && isplayer( attacker ) )
    {
        if ( attacker == self )
        {
            self thread demoteplayer( attacker );
            return;
        }
        
        if ( isdefined( attacker.lastpromotiontime ) && attacker.lastpromotiontime + 3000 > gettime() )
        {
            scoreevents::processscoreevent( #"kill_in_3_seconds_gun", attacker, self, weapon );
        }
        
        if ( weapon_utils::ismeleemod( smeansofdeath ) )
        {
            scoreevents::processscoreevent( #"humiliation_gun", attacker, self, weapon );
            
            if ( globallogic_score::gethighestscoringplayer() === self )
            {
                scoreevents::processscoreevent( #"melee_leader_gun", attacker, self, weapon );
            }
            
            self thread demoteplayer( attacker );
        }
        
        if ( smeansofdeath != "MOD_MELEE_WEAPON_BUTT" )
        {
            attacker thread promoteplayer( weapon );
        }
    }
}

// Namespace gun/gun
// Params 1
// Checksum 0xa8b1508e, Offset: 0x1990
// Size: 0x3c
function onendgame( var_c1e98979 )
{
    player = round::function_b5f4c9d8();
    match::set_winner( player );
}

// Namespace gun/gun
// Params 9
// Checksum 0xd7953c95, Offset: 0x19d8
// Size: 0x16a
function addguntoprogression( weaponname, attachment1, attachment2, attachment3, attachment4, attachment5, attachment6, attachment7, attachment8 )
{
    attachments = [];
    
    if ( isdefined( attachment1 ) )
    {
        attachments[ attachments.size ] = attachment1;
    }
    
    if ( isdefined( attachment2 ) )
    {
        attachments[ attachments.size ] = attachment2;
    }
    
    if ( isdefined( attachment3 ) )
    {
        attachments[ attachments.size ] = attachment3;
    }
    
    if ( isdefined( attachment4 ) )
    {
        attachments[ attachments.size ] = attachment4;
    }
    
    if ( isdefined( attachment5 ) )
    {
        attachments[ attachments.size ] = attachment5;
    }
    
    if ( isdefined( attachment6 ) )
    {
        attachments[ attachments.size ] = attachment6;
    }
    
    if ( isdefined( attachment7 ) )
    {
        attachments[ attachments.size ] = attachment7;
    }
    
    if ( isdefined( attachment8 ) )
    {
        attachments[ attachments.size ] = attachment8;
    }
    
    weapon = getweapon( weaponname, attachments );
    level.gunprogression[ level.gunprogression.size ] = weapon;
}

// Namespace gun/gun
// Params 1
// Checksum 0x9bb33dee, Offset: 0x1b50
// Size: 0x4c
function takeoldweapon( oldweapon )
{
    self endon( #"death", #"disconnect" );
    wait 1;
    self takeweapon( oldweapon );
}

// Namespace gun/gun
// Params 1
// Checksum 0x4511776, Offset: 0x1ba8
// Size: 0x428
function givecustomloadout( takeoldweapon = 0 )
{
    self loadout::init_player( !takeoldweapon );
    self cleartalents();
    self clearperks();
    perks = self getloadoutperks( 0 );
    
    foreach ( perk in perks )
    {
        self setperk( perk );
    }
    
    if ( takeoldweapon )
    {
        oldweapon = self getcurrentweapon();
        weapons = self getweaponslist();
        
        foreach ( weapon in weapons )
        {
            if ( weapon != oldweapon )
            {
                self takeweapon( weapon );
            }
        }
        
        self thread takeoldweapon( oldweapon );
    }
    
    if ( !isdefined( self.gunprogress ) )
    {
        self.gunprogress = 0;
    }
    
    currentweapon = level.gunprogression[ self.gunprogress ];
    self giveweapon( currentweapon );
    self switchtoweapon( currentweapon );
    
    if ( self.firstspawn !== 0 )
    {
        self setspawnweapon( currentweapon );
    }
    
    primaryoffhand = level.var_34d27b26;
    primaryoffhandcount = 0;
    self giveweapon( primaryoffhand );
    self setweaponammostock( primaryoffhand, primaryoffhandcount );
    self switchtooffhand( primaryoffhand );
    e_whippings = isdefined( getgametypesetting( #"hash_4ca06c610b5d53bd" ) ) ? getgametypesetting( #"hash_4ca06c610b5d53bd" ) : 0;
    
    if ( !e_whippings )
    {
        secondaryoffhand = getweapon( #"gadget_health_regen" );
        secondaryoffhandcount = 0;
        self giveweapon( secondaryoffhand );
        self setweaponammoclip( secondaryoffhand, secondaryoffhandcount );
        self switchtooffhand( secondaryoffhand );
        loadout = self loadout::get_loadout_slot( "specialgrenade" );
        loadout.weapon = secondaryoffhand;
        loadout.count = secondaryoffhandcount;
        self ability_util::gadget_power_full( secondaryoffhand );
    }
    
    self setactionslot( 3, "flourish_callouts" );
    return currentweapon;
}

// Namespace gun/gun
// Params 1
// Checksum 0x303a1678, Offset: 0x1fd8
// Size: 0x19e
function promoteplayer( weaponused )
{
    self endon( #"disconnect", #"cancel_promotion" );
    level endon( #"game_ended" );
    waitframe( 1 );
    
    if ( weaponused.rootweapon == level.gunprogression[ self.gunprogress ].rootweapon || isdefined( level.gunprogression[ self.gunprogress ].dualwieldweapon ) && level.gunprogression[ self.gunprogress ].dualwieldweapon.rootweapon == weaponused.rootweapon )
    {
        if ( self.gunprogress < level.gunprogression.size - 1 )
        {
            self.gunprogress++;
            
            if ( isalive( self ) )
            {
                self thread givecustomloadout( 1 );
            }
        }
        
        pointstowin = self.pers[ #"pointstowin" ];
        
        if ( pointstowin < level.scorelimit )
        {
            scoreevents::processscoreevent( #"kill_gun", self, undefined, weaponused );
            self globallogic_score::givepointstowin( level.gungamekillscore );
        }
        
        self.lastpromotiontime = gettime();
    }
}

// Namespace gun/gun
// Params 1
// Checksum 0xd0763058, Offset: 0x2180
// Size: 0x23c
function demoteplayer( attacker )
{
    self endon( #"disconnect" );
    self notify( #"cancel_promotion" );
    currentgunprogress = self.gunprogress;
    
    for ( i = 0; i < level.setbacksperdemotion ; i++ )
    {
        if ( self.gunprogress <= 0 )
        {
            break;
        }
        
        self globallogic_score::givepointstowin( level.gungamekillscore * -1 );
        globallogic_score::_setplayerscore( self, self.score - level.gungamekillscore );
        self.gunprogress--;
    }
    
    if ( currentgunprogress != self.gunprogress && isalive( self ) )
    {
        self thread givecustomloadout( 1 );
    }
    
    if ( isdefined( attacker ) )
    {
        self stats::function_bb7eedf0( #"humiliate_attacker", 1 );
        attacker recordgameevent( "capture" );
    }
    
    self stats::function_bb7eedf0( #"humiliate_victim", 1 );
    self.pers[ #"humiliated" ]++;
    self.humiliated = self.pers[ #"humiliated" ];
    self recordgameevent( "return" );
    self playlocalsound( #"mpl_wager_humiliate" );
    self globallogic_audio::leader_dialog_on_player( "humiliated" );
}

// Namespace gun/gun
// Params 0
// Checksum 0x4322e6d7, Offset: 0x23c8
// Size: 0x70
function infiniteammo()
{
    self endon( #"death", #"disconnect" );
    
    while ( true )
    {
        wait 0.1;
        weapon = self getcurrentweapon();
        self givemaxammo( weapon );
    }
}

// Namespace gun/gun
// Params 0
// Checksum 0xa0fee671, Offset: 0x2440
// Size: 0x10a, Type: bool
function function_486a8395()
{
    ruleweaponsleft = 3;
    
    /#
    #/
    
    minweaponsleft = level.gunprogression.size;
    
    foreach ( player in level.activeplayers )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( !isdefined( player.gunprogress ) )
        {
            continue;
        }
        
        weaponsleft = level.gunprogression.size - player.gunprogress;
        
        if ( minweaponsleft > weaponsleft )
        {
            minweaponsleft = weaponsleft;
        }
        
        if ( ruleweaponsleft >= minweaponsleft )
        {
            /#
            #/
            
            return false;
        }
    }
    
    /#
    #/
    
    return true;
}

