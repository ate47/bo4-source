#using scripts\core_common\player\player_stats;
#using scripts\core_common\util_shared;
#using scripts\weapons\weaponobjects;

#namespace weaponobjects;

// Namespace weaponobjects/namespace_4c668920
// Params 0
// Checksum 0x6f1ee32b, Offset: 0xd8
// Size: 0x1cc
function function_b455d5d8()
{
    function_e6400478( #"hatchet", &createhatchetwatcher, 1 );
    function_e6400478( #"tactical_insertion", &createtactinsertwatcher, 1 );
    function_e6400478( #"rcbomb", &creatercbombwatcher, 1 );
    function_e6400478( #"qrdrone", &createqrdronewatcher, 1 );
    function_e6400478( #"helicopter_player", &createplayerhelicopterwatcher, 1 );
    function_e6400478( #"tr_flechette_t8", &function_1eaa3e20 );
    function_e6400478( #"hash_17ac9a2101b6ff2d", &function_1eaa3e20 );
    
    if ( isdefined( level.var_b68902c4 ) && level.var_b68902c4 )
    {
        function_e6400478( #"tr_flechette_t8_upgraded", &function_1eaa3e20 );
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0x5cc76fc1, Offset: 0x2b0
// Size: 0xf6
function createspecialcrossbowwatchertypes( watcher )
{
    watcher.ondetonatecallback = &deleteent;
    watcher.ondamage = &voidondamage;
    
    if ( isdefined( level.b_crossbow_bolt_destroy_on_impact ) && level.b_crossbow_bolt_destroy_on_impact )
    {
        watcher.onspawn = &onspawncrossbowboltimpact;
        watcher.onspawnretrievetriggers = &voidonspawnretrievetriggers;
        watcher.pickup = &voidpickup;
        return;
    }
    
    watcher.onspawn = &onspawncrossbowbolt;
    watcher.onspawnretrievetriggers = &function_23b0aea9;
    watcher.pickup = &function_d9219ce2;
}

// Namespace weaponobjects/namespace_4c668920
// Params 0
// Checksum 0x2e114810, Offset: 0x3b0
// Size: 0x104
function function_f297d773()
{
    function_e6400478( #"special_crossbow_t8", &createspecialcrossbowwatchertypes, 1 );
    function_e6400478( #"special_crossbowlh", &createspecialcrossbowwatchertypes, 1 );
    function_e6400478( #"special_crossbow_dw", &createspecialcrossbowwatchertypes, 1 );
    
    if ( isdefined( level.b_create_upgraded_crossbow_watchers ) && level.b_create_upgraded_crossbow_watchers )
    {
        function_e6400478( #"special_crossbow_t8_upgraded", &createspecialcrossbowwatchertypes, 1 );
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0xeb0c9abd, Offset: 0x4c0
// Size: 0x26
function function_1eaa3e20( watcher )
{
    watcher.notequipment = 1;
    watcher.onfizzleout = undefined;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0x9ffe44af, Offset: 0x4f0
// Size: 0xae
function createhatchetwatcher( watcher )
{
    watcher.ondetonatecallback = &deleteent;
    watcher.onspawn = &onspawnhatchet;
    watcher.ondamage = &voidondamage;
    watcher.onspawnretrievetriggers = &function_23b0aea9;
    
    if ( !sessionmodeiswarzonegame() )
    {
        watcher.timeout = 120;
    }
    
    watcher.pickup = &function_d9219ce2;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0xc8f5f2d1, Offset: 0x5a8
// Size: 0x1a
function createtactinsertwatcher( watcher )
{
    watcher.playdestroyeddialog = 0;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0x5b1d009, Offset: 0x5d0
// Size: 0x86
function creatercbombwatcher( watcher )
{
    watcher.altdetonate = 0;
    watcher.ismovable = 1;
    watcher.ownergetsassist = 1;
    watcher.playdestroyeddialog = 0;
    watcher.deleteonkillbrush = 0;
    watcher.ondetonatecallback = level.rcbombonblowup;
    watcher.stuntime = 1;
    watcher.notequipment = 1;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0xe3d64544, Offset: 0x660
// Size: 0x9a
function createqrdronewatcher( watcher )
{
    watcher.altdetonate = 0;
    watcher.ismovable = 1;
    watcher.ownergetsassist = 1;
    watcher.playdestroyeddialog = 0;
    watcher.deleteonkillbrush = 0;
    watcher.ondetonatecallback = level.qrdroneonblowup;
    watcher.ondamage = level.qrdroneondamage;
    watcher.stuntime = 5;
    watcher.notequipment = 1;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0x7eeb86ea, Offset: 0x708
// Size: 0xb0
function getspikelauncheractivespikecount( watcher )
{
    currentitemcount = 0;
    
    foreach ( obj in watcher.objectarray )
    {
        if ( isdefined( obj ) && obj.item !== watcher.weapon )
        {
            currentitemcount++;
        }
    }
    
    return currentitemcount;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0xb48c58c7, Offset: 0x7c0
// Size: 0x10e
function watchspikelauncheritemcountchanged( watcher )
{
    self endon( #"death" );
    lastitemcount = undefined;
    
    while ( true )
    {
        waitresult = self waittill( #"weapon_change" );
        
        for ( weapon = waitresult.weapon; weapon.name == #"spike_launcher" ; weapon = self getcurrentweapon() )
        {
            currentitemcount = getspikelauncheractivespikecount( watcher );
            
            if ( currentitemcount !== lastitemcount )
            {
                self setcontrolleruimodelvalue( "spikeLauncherCounter.spikesReady", currentitemcount );
                lastitemcount = currentitemcount;
            }
            
            wait 0.1;
        }
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0x2ea3f1be, Offset: 0x8d8
// Size: 0x84
function spikesdetonating( watcher )
{
    spikecount = getspikelauncheractivespikecount( watcher );
    
    if ( spikecount > 0 )
    {
        self setcontrolleruimodelvalue( "spikeLauncherCounter.blasting", 1 );
        wait 2;
        self setcontrolleruimodelvalue( "spikeLauncherCounter.blasting", 0 );
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0xaf26a396, Offset: 0x968
// Size: 0x146
function createspikelauncherwatcher( watcher )
{
    watcher.altname = #"spike_charge";
    watcher.altweapon = getweapon( #"spike_charge" );
    watcher.altdetonate = 0;
    watcher.watchforfire = 1;
    watcher.hackable = 1;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.ondetonatecallback = &spikedetonate;
    watcher.onstun = &weaponstun;
    watcher.stuntime = 1;
    watcher.ownergetsassist = 1;
    watcher.detonatestationary = 0;
    watcher.detonationdelay = 0;
    watcher.detonationsound = #"wpn_claymore_alert";
    watcher.ondetonationhandle = &spikesdetonating;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0xcd7f2b66, Offset: 0xab8
// Size: 0x2a
function createplayerhelicopterwatcher( watcher )
{
    watcher.altdetonate = 1;
    watcher.notequipment = 1;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0x29f2ee4d, Offset: 0xaf0
// Size: 0x56
function function_50d4198b( watcher )
{
    watcher.hackable = 0;
    watcher.headicon = 0;
    watcher.deleteonplayerspawn = 0;
    watcher.enemydestroy = 0;
    watcher.onspawn = &function_f0e307a2;
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0x907b50d4, Offset: 0xb50
// Size: 0xc4
function function_f0e307a2( watcher, player )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    if ( isdefined( player ) )
    {
        player stats::function_e24eec31( self.weapon, #"used", 1 );
    }
    
    self playloopsound( #"uin_c4_air_alarm_loop" );
    self waittilltimeout( 10, #"stationary" );
    function_b70eb3a9( watcher, player );
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0xfa0d7872, Offset: 0xc20
// Size: 0xc4
function function_b70eb3a9( watcher, player )
{
    pos = self.origin + ( 0, 0, 15 );
    self.ammo_trigger = spawn( "trigger_radius", pos, 0, 50, 50 );
    self.ammo_trigger setteamfortrigger( player.team );
    self.ammo_trigger.owner = player;
    self thread function_5742754c();
    self thread function_42eeab72( self );
}

// Namespace weaponobjects/namespace_4c668920
// Params 0
// Checksum 0xc53c4de0, Offset: 0xcf0
// Size: 0x170
function function_5742754c()
{
    station = self;
    station endon( #"death" );
    
    if ( !isdefined( station.ammo_resupplies_given ) )
    {
        station.ammo_resupplies_given = 0;
    }
    
    assert( isdefined( station.ammo_trigger ) );
    trigger = station.ammo_trigger;
    
    while ( isdefined( trigger ) )
    {
        waitresult = trigger waittill( #"touch" );
        player = waitresult.entity;
        
        if ( !isplayer( player ) )
        {
            continue;
        }
        
        if ( !isalive( player ) )
        {
            continue;
        }
        
        if ( isdefined( trigger.team ) && util::function_fbce7263( player.team, trigger.team ) )
        {
            continue;
        }
        
        station function_e98cee52( player, station );
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0xecc41cc1, Offset: 0xe68
// Size: 0x16c
function function_e98cee52( player, station )
{
    primary_weapons = player getweaponslistprimaries();
    gaveammo = 0;
    
    foreach ( weapon in primary_weapons )
    {
        gaveammo |= player function_61bdb626( weapon );
    }
    
    if ( !gaveammo )
    {
        return;
    }
    
    if ( !isdefined( station.last_ammo_resupply_time ) )
    {
        station.last_ammo_resupply_time = [];
    }
    
    station.last_ammo_resupply_time[ player getentitynumber() ] = gettime();
    station.ammo_resupplies_given++;
    
    if ( station.ammo_resupplies_given >= 1 )
    {
        station function_f47cd4cb();
        station delete();
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0x116c4560, Offset: 0xfe0
// Size: 0xb8, Type: bool
function function_61bdb626( weapon )
{
    player = self;
    new_ammo = weapon.clipsize;
    stockammo = player getweaponammostock( weapon );
    player setweaponammostock( weapon, int( stockammo + new_ammo ) );
    newammo = player getweaponammostock( weapon );
    return newammo > stockammo;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1
// Checksum 0xdaecc0df, Offset: 0x10a0
// Size: 0x34
function function_42eeab72( station )
{
    self waittill( #"death" );
    self function_f47cd4cb();
}

// Namespace weaponobjects/namespace_4c668920
// Params 0
// Checksum 0x3c03a841, Offset: 0x10e0
// Size: 0x2c
function function_f47cd4cb()
{
    if ( isdefined( self.ammo_trigger ) )
    {
        self.ammo_trigger delete();
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0xc19cf275, Offset: 0x1118
// Size: 0xe4
function delayedspikedetonation( attacker, weapon )
{
    if ( !isdefined( self.owner.spikedelay ) )
    {
        self.owner.spikedelay = 0;
    }
    
    delaytime = self.owner.spikedelay;
    owner = self.owner;
    self.owner.spikedelay += 0.3;
    waittillframeend();
    wait delaytime;
    owner.spikedelay -= 0.3;
    
    if ( isdefined( self ) )
    {
        self weapondetonate( attacker, weapon );
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 3
// Checksum 0x8c21c52d, Offset: 0x1208
// Size: 0x6c
function spikedetonate( attacker, weapon, target )
{
    if ( isdefined( weapon ) && weapon.isvalid )
    {
        if ( isdefined( attacker ) )
        {
            if ( self.owner util::isenemyplayer( attacker ) )
            {
            }
        }
    }
    
    thread delayedspikedetonation( attacker, weapon );
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0x7a42ed3, Offset: 0x1280
// Size: 0x38
function onspawnhatchet( watcher, player )
{
    if ( isdefined( level.playthrowhatchet ) )
    {
        player [[ level.playthrowhatchet ]]();
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0x78ce9d35, Offset: 0x12c0
// Size: 0x3c
function onspawncrossbowbolt( watcher, player )
{
    self.delete_on_death = 1;
    self thread onspawncrossbowbolt_internal( watcher, player );
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0x7295c385, Offset: 0x1308
// Size: 0xdc
function onspawncrossbowbolt_internal( watcher, player )
{
    player endon( #"disconnect" );
    self endon( #"death" );
    wait 0.25;
    linkedent = self getlinkedent();
    
    if ( !isdefined( linkedent ) || !isvehicle( linkedent ) )
    {
        self.takedamage = 0;
        return;
    }
    
    self.takedamage = 1;
    
    if ( isvehicle( linkedent ) )
    {
        self thread dieonentitydeath( linkedent, player );
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0x8154f0b9, Offset: 0x13f0
// Size: 0x3c
function onspawncrossbowboltimpact( s_watcher, e_player )
{
    self.delete_on_death = 1;
    self thread onspawncrossbowboltimpact_internal( s_watcher, e_player );
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0x46c3401, Offset: 0x1438
// Size: 0x104
function onspawncrossbowboltimpact_internal( s_watcher, e_player )
{
    self endon( #"death" );
    e_player endon( #"disconnect" );
    self waittill( #"stationary" );
    s_watcher thread waitandfizzleout( self, 0 );
    
    foreach ( n_index, e_object in s_watcher.objectarray )
    {
        if ( self == e_object )
        {
            s_watcher.objectarray[ n_index ] = undefined;
        }
    }
    
    cleanweaponobjectarray( s_watcher );
}

// Namespace weaponobjects/namespace_4c668920
// Params 2
// Checksum 0x6e3d80d4, Offset: 0x1548
// Size: 0xb6
function dieonentitydeath( entity, player )
{
    player endon( #"disconnect" );
    self endon( #"death" );
    alreadydead = entity.dead === 1 || isdefined( entity.health ) && entity.health < 0;
    
    if ( !alreadydead )
    {
        entity waittill( #"death" );
    }
    
    self notify( #"death" );
}

